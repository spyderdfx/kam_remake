unit KM_AIMayorBalance;
{$I KaM_Remake.inc}
interface
uses
  Classes, KromUtils, Math, SysUtils, StrUtils,
  KM_Defaults, KM_CommonClasses, KM_Points;

type
  //MayorBalance is a cluster of functions that choose optimal houses to build

//Calculate various demands and save intermediate numbers in case we need them
//in determing what exactly to build to satisfy demand the best
//Production is how much of this resource gets made each minute
// - we evaluate each links theoretical production of end resource (f.e. 1 Corn = 3/5 Sausages)
// - in chain production the speed is limited by slowest link
//todo: - resource in reserve adds to each production rate a fraction
//Consumption is how much gets consumed
//Balance = Production - Consumption;

  TKMCoreBalance = record
    StoreBalance, SchoolBalance, InnBalance, BarracksBalance: Single;
    Balance: Single; //Resulting balance
  end;
  TKMMaterialsBalance = record
    WoodcutTheory, SawmillTheory: Single;
    StoneProduction, WoodProduction: Single;
    StoneBalance, WoodBalance: Single;
    Balance: Single; //Resulting balance
  end;
  TKMWareBalanceGold = record
    CoalTheory, GoldOreTheory, GoldTheory: Single;
    Production: Single; //How much do we produce
    Consumption: Single; //How much is used
    Reserve: Single; //
    Balance: Single; //Resulting balance
  end;
  TKMWareBalanceFood = record
    Bread: record
      FarmTheory, MillTheory, BakeryTheory: Single;
    end;
    Sausages: record
      FarmTheory, SwineTheory, ButchersTheory: Single;
    end;
    BreadProduction, SausagesProduction, WineProduction, FishProduction: Single;
    Production: Single; //How much food do we produce
    Consumption: Single; //How much food do we use
    Balance: Single; //Resulting balance
  end;
  TKMWareBalanceWeaponry = record
    SteelWeapon: record
      CoalTheory, IronTheory, SteelTheory, SmithyTheory: Single;
    end;
    SteelArmor: record
      CoalTheory, IronTheory, SteelTheory, SmithyTheory: Single;
    end;
    WoodenWeapon: record
      TrunkTheory, WoodTheory, WorkshopTheory: Single;
    end;
    WoodenArmor: record
      TrunkTheory, WoodTheory: Single; //Shields
      FarmTheory, SwineTheory, TanneryTheory, WorkshopTheory: Single; //Armor
    end;
    Horse: record
      FarmTheory, StablesTheory: Single;
    end;

    Weaponry: array [WARFARE_MIN..WARFARE_MAX] of record
      Production, Demand, Balance: Single;
    end;

    Balance: Single; //Resulting balance
  end;

type
  TKMayorBalance = class
  private
    fOwner: TPlayerIndex;

    fAdvice: array of THouseType;

    //The following are recalculated before each use, so they don't need saving
    fDemandCore: TKMCoreBalance;
    fDemandMaterials: TKMMaterialsBalance;
    fDemandGold: TKMWareBalanceGold;
    fDemandFood: TKMWareBalanceFood;
    fDemandWeaponry: TKMWareBalanceWeaponry;

    //For debugging (doesn't need saving)
    fDemandCoreText: string;
    fDemandMaterialsText: string;
    fDemandGoldText: string;
    fDemandFoodText: string;
    fDemandWeaponryText: string;
    fAdviceText: string;

    function HouseCount(aHouse: THouseType): Integer;

    procedure AppendCore;
    procedure AppendMaterials;
    procedure AppendGold;
    procedure AppendFood;
    procedure AppendWeaponry;

    procedure Append(aHouse: THouseType);

    procedure DistributeCorn;
    procedure DistributeCoal;
    procedure DistributeWood;

    procedure UpdateBalanceGold;
    procedure UpdateBalanceCore;
    procedure UpdateBalanceMaterials;
    procedure UpdateBalanceFood;
    procedure UpdateBalanceLeather;
    procedure UpdateBalanceIron;
    procedure UpdateBalanceWeaponry;
  public
    ArmyType: TArmyType;
    GoldNeed: Single; //How much gold the town needs per minute (may change over time)
    StoneNeed: Single; //How much building materials do we need for city development
    WoodNeed: Single; //How much building materials do we need for city development
    constructor Create(aPlayer: TPlayerIndex);
    destructor Destroy; override;

    procedure OwnerUpdate(aPlayer: TPlayerIndex);
    procedure Refresh;
    function Peek: THouseType;
    procedure Take;
    procedure Reject;
    procedure SetArmyDemand(ShieldNeed, ArmorNeed, AxeNeed, PikeNeed, BowNeed, HorseNeed: Single);
    function BalanceText: string;

    procedure Save(SaveStream: TKMemoryStream);
    procedure Load(LoadStream: TKMemoryStream);
  end;


implementation
uses KM_Houses, KM_PlayersCollection, KM_Player, KM_Resource;


{ TKMayorBalance }
constructor TKMayorBalance.Create(aPlayer: TPlayerIndex);
begin
  inherited Create;
  fOwner := aPlayer;

  GoldNeed := 1;
  StoneNeed := 10;
  WoodNeed := 4.5;
end;


destructor TKMayorBalance.Destroy;
begin

  inherited;
end;


//How many houses of certain type we have (assume all wip houses will be finished)
function TKMayorBalance.HouseCount(aHouse: THouseType): Integer;
begin
  Result := fPlayers[fOwner].Stats.GetHouseQty(aHouse) + fPlayers[fOwner].Stats.GetHouseWip(aHouse);
end;


procedure TKMayorBalance.Append(aHouse: THouseType);
begin
  SetLength(fAdvice, Length(fAdvice) + 1);
  fAdvice[High(fAdvice)] := aHouse;
end;


//These houses are core for town development
procedure TKMayorBalance.AppendCore;
begin
  with fDemandCore do
  case PickMin([0, StoreBalance, SchoolBalance, InnBalance, BarracksBalance]) of
    0: ;
    1: Append(ht_Store);
    2: Append(ht_School);
    3: Append(ht_Inn);
    4: Append(ht_Barracks);
  end;
end;


procedure TKMayorBalance.AppendMaterials;
var
  P: TKMPlayer;
begin
  P := fPlayers[fOwner];

  with fDemandMaterials do
  case PickMin([0, StoneBalance, WoodBalance]) of
    0:  ;
    1:  Append(ht_Quary);
    2:  if (P.Stats.GetHouseQty(ht_Quary) >= 2) then
          if (WoodcutTheory < SawmillTheory) or not P.Stats.GetCanBuild(ht_Sawmill) then
            Append(ht_Woodcutters)
          else
            Append(ht_Sawmill);
  end;
end;


//Increase Gold production
procedure TKMayorBalance.AppendGold;
begin
  //If all 3 shares 0 we whould pick in that order Gold > Coal > Metallurgists

  with fDemandGold do
  if Balance < 0 then
  case PickMin([GoldOreTheory, CoalTheory, GoldTheory]) of
    0:  Append(ht_GoldMine);
    1:  Append(ht_CoalMine);
    2:  Append(ht_Metallurgists);
  end;
end;


procedure TKMayorBalance.AppendFood;
begin
  //Pick smallest production and increase it
  with fDemandFood do
  if Balance < 0 then
  case PickMin([BreadProduction, SausagesProduction, WineProduction]) of
    0:  with Bread do
        case PickMin([FarmTheory, MillTheory, BakeryTheory]) of
          0:  Append(ht_Farm);
          1:  Append(ht_Mill);
          2:  Append(ht_Bakery);
        end;
    1:  with Sausages do
        case PickMin([FarmTheory, SwineTheory, ButchersTheory]) of
          0:  Append(ht_Farm);
          1:  Append(ht_Swine);
          2:  Append(ht_Butchers);
        end;
    2:  Append(ht_Wineyard);
  end;
end;


procedure TKMayorBalance.AppendWeaponry;
var
  I, Best: TResourceType;
  WeapUse: Boolean;
  BestBid: Single;
begin
  Best := rt_None;

  BestBid := MaxSingle;
  for I := WARFARE_MIN to WARFARE_MAX do
  begin
    case ArmyType of
      atLeather:  WeapUse := I in [rt_Shield, rt_Armor, rt_Axe, rt_Pike, rt_Bow, rt_Horse];
      atIron:     WeapUse := I in [rt_MetalShield, rt_MetalArmor, rt_Sword, rt_Hallebard, rt_Arbalet, rt_Horse];
      else        WeapUse := False;
    end;
    if WeapUse and (fDemandWeaponry.Weaponry[I].Balance < BestBid) then
    begin
      Best := I;
      BestBid := fDemandWeaponry.Weaponry[I].Balance;
    end;
  end;

  //Don't need anything
  if BestBid > 0 then Exit;

  case Best of
    rt_MetalShield,
    rt_MetalArmor:  with fDemandWeaponry.SteelArmor do
                    case PickMin([CoalTheory, IronTheory, SteelTheory, SmithyTheory]) of
                      0: Append(ht_CoalMine);
                      1: Append(ht_IronMine);
                      2: Append(ht_IronSmithy);
                      3: Append(ht_ArmorSmithy);
                    end;
    rt_Sword,
    rt_Hallebard,
    rt_Arbalet:     with fDemandWeaponry.SteelWeapon do
                    case PickMin([CoalTheory, IronTheory, SteelTheory, SmithyTheory]) of
                      0: Append(ht_CoalMine);
                      1: Append(ht_IronMine);
                      2: Append(ht_IronSmithy);
                      3: Append(ht_WeaponSmithy);
                    end;
    rt_Shield:      with fDemandWeaponry.WoodenArmor do
                    case PickMin([TrunkTheory, WoodTheory, WorkshopTheory]) of
                      0: Append(ht_Woodcutters);
                      1: Append(ht_Sawmill);
                      2: Append(ht_WeaponWorkshop);
                    end;
    rt_Armor:       with fDemandWeaponry.WoodenArmor do
                    case PickMin([FarmTheory, SwineTheory, TanneryTheory, WorkshopTheory]) of
                      0: Append(ht_Farm);
                      1: Append(ht_Swine);
                      2: Append(ht_Tannery);
                      3: Append(ht_ArmorWorkshop);
                    end;
    rt_Axe,
    rt_Pike,
    rt_Bow:         with fDemandWeaponry.WoodenWeapon do
                    case PickMin([TrunkTheory, WoodTheory, WorkshopTheory]) of
                      0: Append(ht_Woodcutters);
                      1: Append(ht_Sawmill);
                      2: Append(ht_WeaponWorkshop);
                    end;
    rt_Horse:       with fDemandWeaponry.Horse do
                    case PickMin([FarmTheory, StablesTheory]) of
                      0: Append(ht_Farm);
                      1: Append(ht_Stables);
                    end;
  end;
end;


procedure TKMayorBalance.OwnerUpdate(aPlayer: TPlayerIndex);
begin
  fOwner := aPlayer;
end;


procedure TKMayorBalance.DistributeCoal;
var
  CoalProductionRate, CoalConsumptionRate: Single;
begin
  CoalProductionRate := HouseCount(ht_CoalMine) * ProductionRate[rt_Coal];
  CoalConsumptionRate := HouseCount(ht_ArmorSmithy) * ProductionRate[rt_Shield] //Each operations uses 1 Coal per product
                       + HouseCount(ht_IronSmithy) * ProductionRate[rt_Steel]
                       + HouseCount(ht_Metallurgists) * ProductionRate[rt_Gold]
                       + HouseCount(ht_WeaponSmithy) * ProductionRate[rt_Sword];

  if CoalProductionRate >= CoalConsumptionRate then
  begin
    //Let every industry think the extra belongs to it
    fDemandGold.CoalTheory := (CoalProductionRate - CoalConsumptionRate + HouseCount(ht_Metallurgists) * ProductionRate[rt_Gold]) * 2;
    fDemandWeaponry.SteelWeapon.CoalTheory := CoalProductionRate - CoalConsumptionRate + HouseCount(ht_IronSmithy) * ProductionRate[rt_Steel] + HouseCount(ht_WeaponSmithy) * ProductionRate[rt_Pike];
    fDemandWeaponry.SteelArmor.CoalTheory := CoalProductionRate - CoalConsumptionRate + HouseCount(ht_IronSmithy) * ProductionRate[rt_Steel] + HouseCount(ht_ArmorSmithy) * ProductionRate[rt_MetalArmor];
  end
  else
  begin
    //Share proportionaly
    fDemandGold.CoalTheory := CoalProductionRate / CoalConsumptionRate * (HouseCount(ht_Metallurgists) * ProductionRate[rt_Gold]) * 2;
    fDemandWeaponry.SteelWeapon.CoalTheory := CoalProductionRate / CoalConsumptionRate * (HouseCount(ht_IronSmithy) * ProductionRate[rt_Steel] + HouseCount(ht_WeaponSmithy) * ProductionRate[rt_Pike]);
    fDemandWeaponry.SteelArmor.CoalTheory := CoalProductionRate / CoalConsumptionRate * (HouseCount(ht_IronSmithy) * ProductionRate[rt_Steel] + HouseCount(ht_ArmorSmithy) * ProductionRate[rt_MetalArmor]);
  end;
end;


procedure TKMayorBalance.DistributeWood;
var
  TrunkProduction: Single;
  WoodProduction, WoodConsumption: Single;
begin
  TrunkProduction := HouseCount(ht_Woodcutters) * ProductionRate[rt_Trunk] * 2;
  WoodProduction := HouseCount(ht_Sawmill) * ProductionRate[rt_Wood];
  WoodConsumption := WoodNeed
                   + fDemandWeaponry.Weaponry[rt_Shield].Demand
                   + fDemandWeaponry.Weaponry[rt_Axe].Demand
                   + fDemandWeaponry.Weaponry[rt_Pike].Demand
                   + fDemandWeaponry.Weaponry[rt_Bow].Demand;

  with fDemandWeaponry do
  begin
    //Wood shares
    if WoodProduction >= WoodConsumption then
    begin
      //Let every industry think the extra belongs to it
      WoodenWeapon.WoodTheory := (WoodProduction - WoodConsumption + HouseCount(ht_WeaponWorkshop) * ProductionRate[rt_Pike]);
      WoodenArmor.WoodTheory := (WoodProduction - WoodConsumption + HouseCount(ht_ArmorWorkshop) * ProductionRate[rt_Shield]);
    end
    else
    begin
      //Share proportionaly
      if WoodConsumption <> 0 then
      begin
        WoodenWeapon.WoodTheory := WoodProduction / WoodConsumption * HouseCount(ht_WeaponWorkshop) * ProductionRate[rt_Pike];
        WoodenArmor.WoodTheory := WoodProduction / WoodConsumption * HouseCount(ht_ArmorWorkshop) * ProductionRate[rt_Shield];
      end
      else
      begin
        WoodenWeapon.WoodTheory := 0;
        WoodenArmor.WoodTheory := 0;
      end;
    end;

    //Trunk shares
    if WoodProduction <> 0 then
    begin
      WoodenWeapon.TrunkTheory := WoodenWeapon.WoodTheory / WoodProduction * TrunkProduction;
      WoodenArmor.TrunkTheory := WoodenArmor.WoodTheory / WoodProduction * TrunkProduction;
    end
    else
    begin
      WoodenWeapon.TrunkTheory := 0;
      WoodenArmor.TrunkTheory := 0;
    end;
  end;
end;


procedure TKMayorBalance.UpdateBalanceGold;
begin
  with fDemandGold do
  begin
    //How much gol in theory we could get
    //CoalTheory - coal calculated above
    GoldOreTheory := HouseCount(ht_GoldMine) * ProductionRate[rt_GoldOre] * 2; //*2 since every Ore becomes 2 Gold
    GoldTheory := HouseCount(ht_Metallurgists) * ProductionRate[rt_Gold];

    //Actual production is minimum of the above
    Production := Min(CoalTheory, GoldOreTheory, GoldTheory);

    //How much Gold do we need
    Consumption := GoldNeed + Byte(HouseCount(ht_Barracks) > 0) * fPlayers[fOwner].AI.Setup.WarriorsPerMinute(ArmyType);

    //How much reserve do we have
    Reserve := fPlayers[fOwner].Stats.GetResourceQty(rt_Gold) / Consumption;

    Balance := Production - Consumption + Max(Reserve - 30, 0);

    fDemandGoldText := Format('%.2f Gold (%.2f - %.2f + %.2f)', [Balance, Production, Consumption, Reserve]);
  end;
end;


procedure TKMayorBalance.UpdateBalanceLeather;
begin
  with fDemandWeaponry do
  begin
    with WoodenWeapon do
    begin
      //Trunk
      //Wood
      //All 3 produced at the same speed
      WorkshopTheory := HouseCount(ht_WeaponWorkshop) * ProductionRate[rt_Pike];

      Weaponry[rt_Axe].Production := Min(TrunkTheory, WoodTheory, WorkshopTheory) / 3;
      Weaponry[rt_Pike].Production := Min(TrunkTheory, WoodTheory, WorkshopTheory) / 3;
      Weaponry[rt_Bow].Production := Min(TrunkTheory, WoodTheory, WorkshopTheory) / 3;
    end;

    with WoodenArmor do
    begin
      //Trunk
      //Wood
      //FarmTheory calculated above
      SwineTheory := HouseCount(ht_Swine) * ProductionRate[rt_Skin] * 2;
      TanneryTheory := HouseCount(ht_Tannery) * ProductionRate[rt_Leather];
      WorkshopTheory := HouseCount(ht_ArmorWorkshop) * ProductionRate[rt_Armor];

      Weaponry[rt_Shield].Production := Min(TrunkTheory, WoodTheory, WorkshopTheory) / 2;
      Weaponry[rt_Armor].Production := Min(Min(FarmTheory, SwineTheory), Min(TanneryTheory, WorkshopTheory)) / 2;
    end;
  end;
end;


procedure TKMayorBalance.UpdateBalanceIron;
begin
  with fDemandWeaponry do
  begin
    //Weapon
    //Calculate how much Weapon each link could possibly produce
    with SteelWeapon do
    begin
      //Coal calculated above
      IronTheory := HouseCount(ht_IronMine) * ProductionRate[rt_IronOre];
      SteelTheory := HouseCount(ht_IronSmithy) * ProductionRate[rt_Steel];
      SmithyTheory := HouseCount(ht_WeaponSmithy) * ProductionRate[rt_Hallebard];

      //All 3 weapons are the same for now
      Weaponry[rt_Sword].Production := Min(Min(CoalTheory, IronTheory), Min(SteelTheory, SmithyTheory)) / 3;
      Weaponry[rt_Hallebard].Production := Min(Min(CoalTheory, IronTheory), Min(SteelTheory, SmithyTheory)) / 3;
      Weaponry[rt_Arbalet].Production := Min(Min(CoalTheory, IronTheory), Min(SteelTheory, SmithyTheory)) / 3;
    end;

    //Armor
    //Calculate how many Armor each link could possibly produce
    with SteelArmor do
    begin
      //Coal calculated above
      IronTheory := HouseCount(ht_IronMine) * ProductionRate[rt_IronOre];
      SteelTheory := HouseCount(ht_IronSmithy) * ProductionRate[rt_Steel];
      SmithyTheory := HouseCount(ht_ArmorSmithy) * ProductionRate[rt_MetalArmor];

      Weaponry[rt_MetalShield].Production := Min(Min(CoalTheory, IronTheory), Min(SteelTheory, SmithyTheory)) / 2;
      Weaponry[rt_MetalArmor].Production := Min(Min(CoalTheory, IronTheory), Min(SteelTheory, SmithyTheory)) / 2;
    end;
  end;
end;


procedure TKMayorBalance.UpdateBalanceWeaponry;
var
  I: TResourceType;
  WeapUse: Boolean;
  S: string;
begin
  UpdateBalanceLeather;
  UpdateBalanceIron;

  with fDemandWeaponry do
  begin
    //Horse.FarmTheory calculated above
    Horse.StablesTheory := HouseCount(ht_Stables) * ProductionRate[rt_Horse];
    Weaponry[rt_Horse].Production := Min(Horse.FarmTheory, Horse.StablesTheory);

    for I := WARFARE_MIN to WARFARE_MAX do
      Weaponry[I].Balance := Weaponry[I].Production - Weaponry[I].Demand;

    //Set Weaponry balance to the most required warfare kind
    Balance := MaxSingle;
    for I := WARFARE_MIN to WARFARE_MAX do
    begin
      case ArmyType of
        atLeather:  WeapUse := I in [rt_Shield, rt_Armor, rt_Axe, rt_Pike, rt_Bow, rt_Horse];
        atIron:     WeapUse := I in [rt_MetalShield, rt_MetalArmor, rt_Sword, rt_Hallebard, rt_Arbalet, rt_Horse];
        else        WeapUse := False;
      end;
      if WeapUse and (Weaponry[I].Balance < Balance) then
        Balance := Weaponry[I].Balance;
    end;

    S := Format('%.2f Weaponry: |', [Balance]);
    with fDemandWeaponry.WoodenArmor do
      S := S + Format('LeatherArm: %.1f %.1f %.1f|', [TrunkTheory, WoodTheory, WorkshopTheory]);

    with fDemandWeaponry.WoodenWeapon do
      S := S + Format('WoodWeap: %.1f %.1f %.1f|', [TrunkTheory, WoodTheory, WorkshopTheory]);

    for I := WARFARE_MIN to WARFARE_MAX do
    begin
      case ArmyType of
        atLeather:  WeapUse := I in [rt_Shield, rt_Armor, rt_Axe, rt_Pike, rt_Bow, rt_Horse];
        atIron:     WeapUse := I in [rt_MetalShield, rt_MetalArmor, rt_Sword, rt_Hallebard, rt_Arbalet, rt_Horse];
        else        WeapUse := False;
      end;

      if WeapUse then
        S := S + Format('%s: %.2f - %.2f = %.2f|', [fResource.Resources[I].Title,
                                                    Weaponry[I].Production,
                                                    Weaponry[I].Demand,
                                                    Weaponry[I].Balance]);
    end;

    fDemandWeaponryText := S;
  end;
end;


procedure TKMayorBalance.UpdateBalanceCore;
var
  P: TKMPlayer;
begin
  P := fPlayers[fOwner];

  with fDemandCore do
  begin
    //Balance = Available - Required
    StoreBalance    := HouseCount(ht_Store)       - HouseCount(ht_Any) / 35;
    SchoolBalance   := HouseCount(ht_School)      - 1;
    InnBalance      := HouseCount(ht_Inn)         - P.Stats.GetCitizensCount / 80;
    BarracksBalance := HouseCount(ht_Barracks)    - Byte(P.Stats.GetWeaponsProduced > 0);

    Balance := Min([StoreBalance, SchoolBalance, InnBalance, BarracksBalance]);
    fDemandCoreText := Format
      ('%.2f Core: (Store %.2f, School %.2f, Inn %.2f, Barracks %.2f)',
      [Balance, StoreBalance, SchoolBalance, InnBalance, BarracksBalance]);
  end;
end;


procedure TKMayorBalance.UpdateBalanceMaterials;
begin
  with fDemandMaterials do
  begin
    StoneProduction := HouseCount(ht_Quary) * ProductionRate[rt_Stone];

    WoodcutTheory := HouseCount(ht_Woodcutters) * ProductionRate[rt_Trunk];
    SawmillTheory := HouseCount(ht_Sawmill) * ProductionRate[rt_Wood];
    WoodProduction := Min(WoodcutTheory, SawmillTheory);

    StoneBalance    := StoneProduction - StoneNeed;
    WoodBalance     := WoodProduction - WoodNeed;

    Balance := Min(StoneBalance, WoodBalance);
    fDemandMaterialsText := Format('%.2f Materials: (Stone %.1f-%.1f, Wood %.1f-%.1f)',
                                   [Balance, StoneProduction, StoneNeed, WoodProduction, WoodNeed]);
  end;
end;


procedure TKMayorBalance.DistributeCorn;
var
  CornProductionRate, CornConsumptionRate: Single;
begin
  CornProductionRate := HouseCount(ht_Farm) * ProductionRate[rt_Corn];

  //With stable production rate we can assume consumption rate that would be required
  CornConsumptionRate := HouseCount(ht_Mill) * ProductionRate[rt_Flour]
                       + HouseCount(ht_Swine) * ProductionRate[rt_Pig] * 4
                       + HouseCount(ht_Stables) * ProductionRate[rt_Horse] * 4;

  if CornProductionRate >= CornConsumptionRate then
  begin
    //Let every industry think the extra belongs to it
    fDemandFood.Bread.FarmTheory := (CornProductionRate - CornConsumptionRate + HouseCount(ht_Mill) * ProductionRate[rt_Flour]) * 2;
    fDemandFood.Sausages.FarmTheory := (CornProductionRate - CornConsumptionRate + HouseCount(ht_Swine) * ProductionRate[rt_Pig] * 4) / 4 * 3;
    fDemandWeaponry.WoodenArmor.FarmTheory := (CornProductionRate - CornConsumptionRate + HouseCount(ht_Swine) * ProductionRate[rt_Skin] * 4) / 4 * 2;
    fDemandWeaponry.Horse.FarmTheory := (CornProductionRate - CornConsumptionRate + HouseCount(ht_Stables) * ProductionRate[rt_Horse] * 4) / 4;
  end
  else
  begin
    //Share proportionaly
    fDemandFood.Bread.FarmTheory := CornProductionRate / CornConsumptionRate * (HouseCount(ht_Mill) * ProductionRate[rt_Flour]) * 2;
    fDemandFood.Sausages.FarmTheory := (CornProductionRate / CornConsumptionRate * HouseCount(ht_Swine) * ProductionRate[rt_Pig]) / 4 * 3;
    fDemandWeaponry.WoodenArmor.FarmTheory := (CornProductionRate / CornConsumptionRate * HouseCount(ht_Swine) * ProductionRate[rt_Skin] * 4) / 4 * 2;
    fDemandWeaponry.Horse.FarmTheory := (CornProductionRate / CornConsumptionRate * HouseCount(ht_Stables) * ProductionRate[rt_Horse]) / 4;
  end;
end;


procedure TKMayorBalance.UpdateBalanceFood;
var
  P: TKMPlayer;
begin
  P := fPlayers[fOwner];

  with fDemandFood do
  begin
    //Bread
    //Calculate how much bread each link could possibly produce
    //Bread.FarmTheory calculated above
    Bread.MillTheory := HouseCount(ht_Mill) * ProductionRate[rt_Flour] * 2;
    Bread.BakeryTheory := HouseCount(ht_Bakery) * ProductionRate[rt_Bread];
    //Actual production is minimum of the above
    BreadProduction := Min(Bread.FarmTheory, Bread.MillTheory, Bread.BakeryTheory);

    //Sausages
    //Calculate how many sausages each link could possibly produce
    //Sausages.FarmTheory calculated above
    Sausages.SwineTheory := HouseCount(ht_Swine) * ProductionRate[rt_Pig] * 3;
    Sausages.ButchersTheory := HouseCount(ht_Butchers) * ProductionRate[rt_Sausages];
    //Actual production is minimum of the above
    SausagesProduction := Min(Sausages.FarmTheory, Sausages.SwineTheory, Sausages.ButchersTheory);
    //Wine, Fish
    WineProduction := HouseCount(ht_Wineyard) * ProductionRate[rt_Wine];
    FishProduction := HouseCount(ht_FisherHut) * ProductionRate[rt_Fish];

    //Count in "food units per minute"
    Production := BreadProduction * BREAD_RESTORE +
                  SausagesProduction * SAUSAGE_RESTORE +
                  WineProduction *  WINE_RESTORE +
                  FishProduction * FISH_RESTORE;

    Consumption := P.Stats.GetUnitQty(ut_Any) / 40; //On average unit eats each 40min
    Balance := Production - Consumption;
    fDemandFoodText := Format('%.2f Food: %.2f - %.2f|', [Balance, Production, Consumption])
                     + Format('       Bread: min(F%.2f, M%.2f, B%.2f)|', [Bread.FarmTheory, Bread.MillTheory, Bread.BakeryTheory])
                     + Format('    Sausages: min(F%.2f, S%.2f, B%.2f)|', [Sausages.FarmTheory, Sausages.SwineTheory, Sausages.ButchersTheory])
                     + Format('  Food value: %.2f + %.2f + %.2f + %.2f|', [BreadProduction * BREAD_RESTORE, SausagesProduction * SAUSAGE_RESTORE, WineProduction * WINE_RESTORE, FishProduction * FISH_RESTORE]);
  end;
end;


//Tell Mayor what proportions of army is needed
procedure TKMayorBalance.SetArmyDemand(ShieldNeed, ArmorNeed, AxeNeed, PikeNeed, BowNeed, HorseNeed: Single);
begin
  //Convert army request into how many weapons are needed
  with fDemandWeaponry do
  begin
    Weaponry[rt_Shield].Demand := ShieldNeed;
    Weaponry[rt_MetalShield].Demand := ShieldNeed;
    Weaponry[rt_Armor].Demand := ArmorNeed;
    Weaponry[rt_MetalArmor].Demand := ArmorNeed;
    Weaponry[rt_Axe].Demand := AxeNeed;
    Weaponry[rt_Sword].Demand := AxeNeed;
    Weaponry[rt_Pike].Demand := PikeNeed;
    Weaponry[rt_Hallebard].Demand := PikeNeed;
    Weaponry[rt_Bow].Demand := BowNeed;
    Weaponry[rt_Arbalet].Demand := BowNeed;
    Weaponry[rt_Horse].Demand := HorseNeed;
  end;
end;


function TKMayorBalance.BalanceText: string;
begin
  Result := fDemandCoreText + '|' +
            fDemandMaterialsText + '|' +
            fDemandGoldText + '|' +
            fDemandFoodText + '|' +
            fDemandWeaponryText + '|' +
            fAdviceText;
end;


procedure TKMayorBalance.Refresh;
var
  I: Integer;
begin
  SetLength(fAdvice, 0);
  try
    //Refresh balance of each industry
    //Try to express needs in terms of Balance = Production - Demand
    UpdateBalanceCore;
    AppendCore;

    //Don't build anything if we don't have a working School
    if fPlayers[fOwner].Stats.GetHouseQty(ht_School) = 0 then Exit;

    UpdateBalanceMaterials;
    AppendMaterials;

    //Don't build anything if we are short on materials
    if (fDemandMaterials.StoneProduction < 0.5)
    or (fDemandMaterials.WoodProduction < 0.5) then Exit;

    DistributeCorn;
    DistributeCoal;
    DistributeWood;

    UpdateBalanceGold;
    AppendGold;

    UpdateBalanceFood;
    AppendFood;

    UpdateBalanceWeaponry;
    AppendWeaponry;

  finally
    fAdviceText := 'Advice: ';
    for I := 0 to High(fAdvice) do
      fAdviceText := fAdviceText + fResource.HouseDat[fAdvice[I]].HouseName + IfThen(I < High(fAdvice), ', ', '.');
  end;
end;


//Look at next item in advice queue
function TKMayorBalance.Peek: THouseType;
begin
  //Take element from fAdvice queue
  if Length(fAdvice) > 0 then
    Result := fAdvice[0]
  else
    Result := ht_None;
end;


//Reject the item because it could not be built
procedure TKMayorBalance.Reject;
begin
  Take;

  //Some logic that would not build anything and waste resources on that
  //if we dont have e.g. gold supply
end;


//Advised item was taken and most certainly will be finished
procedure TKMayorBalance.Take;
begin
  if Length(fAdvice) > 1 then
    Move(fAdvice[1], fAdvice[0], Length(fAdvice) - 1);

  //Trim last element
  SetLength(fAdvice, Length(fAdvice) - 1);
end;


procedure TKMayorBalance.Save(SaveStream: TKMemoryStream);
begin
  SaveStream.Write(fOwner);

  SaveStream.Write(ArmyType, SizeOf(TArmyType));
  SaveStream.Write(GoldNeed);
  SaveStream.Write(StoneNeed);
  SaveStream.Write(WoodNeed);

  //Save because there are demands for weaponry (set by General)
  SaveStream.Write(fDemandWeaponry.Weaponry, SizeOf(fDemandWeaponry.Weaponry));

  //These are not saved because they are recalculated before each use
  {LoadStream.Read(fDemandCore, SizeOf(fDemandCore));
  LoadStream.Read(fDemandMaterials, SizeOf(fDemandMaterials));
  LoadStream.Read(fDemandGold, SizeOf(fDemandGold));
  LoadStream.Read(fDemandFood, SizeOf(fDemandFood));
  LoadStream.Read(fDemandWeaponry, SizeOf(fDemandWeaponry));}
end;


procedure TKMayorBalance.Load(LoadStream: TKMemoryStream);
begin
  LoadStream.Read(fOwner);

  LoadStream.Read(ArmyType, SizeOf(TArmyType));
  LoadStream.Read(GoldNeed);
  LoadStream.Read(StoneNeed);
  LoadStream.Read(WoodNeed);

  //Load demands for weaponry set by General
  LoadStream.Read(fDemandWeaponry.Weaponry, SizeOf(fDemandWeaponry.Weaponry));

  //These are not saved because they are recalculated before each use
  {LoadStream.Read(fDemandCore, SizeOf(fDemandCore));
  LoadStream.Read(fDemandMaterials, SizeOf(fDemandMaterials));
  LoadStream.Read(fDemandGold, SizeOf(fDemandGold));
  LoadStream.Read(fDemandFood, SizeOf(fDemandFood));
  LoadStream.Read(fDemandWeaponry, SizeOf(fDemandWeaponry));}
end;


end.