unit KM_HTTPClientOverbyte;
{$I KaM_Remake.inc}
interface
uses Classes, SysUtils, HttpProt;

type
  TKMHTTPClientOverbyte = class
  private
    fHTTPClient:THTTPCli;
    fOnError:TGetStrProc;
    fOnGetCompleted:TGetStrProc;
    procedure RequestDone(Sender: TObject; RqType: THttpRequest; ErrCode: Word);
  public
    constructor Create;
    destructor Destroy; override;

    procedure GetURL(aURL:string);

    property OnError:TGetStrProc write fOnError;
    property OnGetCompleted:TGetStrProc write fOnGetCompleted;
  end;

implementation


constructor TKMHTTPClientOverbyte.Create;
begin
  Inherited Create;
  fHTTPClient := THTTPCli.Create(nil);
  fHTTPClient.OnRequestDone := RequestDone;
  fHTTPClient.RcvdStream := TMemoryStream.Create;
end;


destructor TKMHTTPClientOverbyte.Destroy;
begin
  fHTTPClient.RcvdStream.Free; //RcvdStream is created and managed by us
  fHTTPClient.Free;
  Inherited;
end;


procedure TKMHTTPClientOverbyte.GetURL(aURL:string);
begin
  fHTTPClient.Abort; //If we were doing something, stop it
  TMemoryStream(fHTTPClient.RcvdStream).Clear;
  fHTTPClient.URL := aURL;
  fHTTPClient.GetASync; //Non-blocking
end;


procedure TKMHTTPClientOverbyte.RequestDone(Sender: TObject; RqType: THttpRequest; ErrCode: Word);
var RcvdText:string;
begin
  if RqType <> httpGET then exit;
  if ErrCode <> 0 then
  begin
    if Assigned(fOnError) then
      fOnError('Error: '+IntToStr(fHTTPClient.StatusCode)+' '+fHTTPClient.ReasonPhrase+' (#' + IntToStr(ErrCode)+')');
    exit;
  end;

  if fHTTPClient.RcvdStream.Size = 0 then exit;
  SetLength(RcvdText,fHTTPClient.RcvdStream.Size);
  Move(TMemoryStream(fHTTPClient.RcvdStream).Memory^, RcvdText[1], fHTTPClient.RcvdStream.Size);
  TMemoryStream(fHTTPClient.RcvdStream).Clear;

  if Assigned(fOnGetCompleted) then
    fOnGetCompleted(RcvdText);
end;

end.
 