{==============================================================================}
{                                                                              }
{       OpenGL 4.1 - Headertranslation                                         }
{       Version 4.1                                                            }
{       Date : 04.03.2011                                                      }
{                                                                              }
{       Works with :                                                           }
{        - Delphi 3 and up                                                     }
{        - FreePascal (1.9.3 and up)                                           }
{                                                                              }
{==============================================================================}
{                                                                              }
{       Containts the translations of glext.h, gl_1_1.h, glu.h and weglext.h.  }
{       It also contains some helperfunctions that were inspired by those      }
{       found in Mike Lischke's OpenGL12.pas.                                  }
{                                                                              }
{       Copyright (C) DGL-OpenGL2-Portteam                                     }
{       All Rights Reserved                                                    }
{                                                                              }
{       Obtained through:                                                      }
{       Delphi OpenGL Community(DGL) - www.delphigl.com                        }
{                                                                              }
{       Converted and maintained by DGL's GL2.0-Team :                         }
{         - Sascha Willems                - http://www.delphigl.de             }
{         - Steffen Xonna (Lossy eX)      - http://www.dev-center.de           }
{         - Lars Middendorf               - http://www.3d-seite.de             }
{       Additional input :                                                     }
{         - Martin Waldegger (Mars)       - http://www.basegraph.com           }
{         - Benjamin Rosseaux (BeRo)      - http://www.0ok.de                  }
{       Additional thanks:                                                     }
{           sigsegv (libdl.so)                                                 }
{                                                                              }
{                                                                              }
{==============================================================================}
{ You may retrieve the latest version of this file at the Delphi OpenGL        }
{ Community home page, located at http://www.delphigl.com/                     }
{                                                                              }
{ The contents of this file are used with permission, subject to               }
{ the Mozilla Public License Version 1.1 (the "License"); you may              }
{ not use this file except in compliance with the License. You may             }
{ obtain a copy of the License at                                              }
{ http://www.mozilla.org/MPL/MPL-1.1.html                                      }
{                                                                              }
{ Software distributed under the License is distributed on an                  }
{ "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or               }
{ implied. See the License for the specific language governing                 }
{ rights and limitations under the License.                                    }
{                                                                              }
{==============================================================================}
{ History :                                                                    }
{ Version 1.0    Initial Release                                               }
{ Version 1.1    Added PPointer in Tpyessection for compatiblity with Delphi   }
{                versions lower than 7                                    (SW) }
{                Added a function named RaiseLastOSError including a comment   }
{                on how to make it run under Delphi versions lower than 7 (SW) }
{                Added some data types according to the GL-Syntax         (SW) }
{ Version 1.2    Fixed some problems with getting the addresses of some        }
{                Extensions (e.g. glTexImage3D) where the EXT/ARB did work     }
{                but not the core-functions                               (SW) }
{ Version 1.3    A second call to ReadimplementationProperties won't           }
{                revert to the default libs anymore                       (MW) }
{                Libraries now will be released if necessary              (MW) }
{ Version 1.3a   Small fixes for glSlang-functions                        (SW) }
{ Version 1.3b   Fixed a small bug with GL_ARB_shader_objects, that lead       }
{                lead to that extension not loaded correctly              (SW) }
{ Version 1.3c   more GL 1.5 compliance by FOG_COORD_xx and                    }
{                ARB less VBO and occlusion query routines                (MW) }
{ Version 1.3d   Fixed linebreaks (should now be corrected under D5)      (SW) }
{ Version 1.4    Changed header to correspond to the OpenGL-Shading            }
{                Language specification 1.10 :                                 }
{                - Added new GL_SAMPLER_*-Constants                            }
{                - Added Constant GL_SHADING_LANGUAGE_VERSION_ARB              }
{                - Added Constant GL_FRAGMENT_SHADER_DERIVATIVE_HINT_ARB       }
{                - Added Constant GL_MAX_FRAGMENT_UNIFORM_COMPONENTS_ARB  (SW) }
{ Version 1.4a   Fixed a missing stdcall for glBindAttribLocationARB      (SW) }
{ Version 1.4b   Fixed declaration for glUniform*(f/i)vARB (added count)  (MW) }
{                glCompileShaderARB changed from function to procedure    (MW) }
{ Version 1.5    Added support for FreePascal                             (BR) }
{                Added type TGLVectorf3/TGLVector3f                       (SW) }
{ Version 1.6    Added Extension GL_EXT_framebuffer_object                (SX) }
{ Version 1.7    Added Extension GL_ARB_fragment_program_shadow           (SX) }
{                Added Extension GL_ARB_draw_buffers                      (SX) }
{                Added Extension GL_ARB_texture_rectangle                 (SX) }
{                Added Extension GL_ARB_color_buffer_float                (SX) }
{                Added Extension GL_ARB_half_float_pixel                  (SX) }
{                Added Extension GL_ARB_texture_float                     (SX) }
{                Added Extension GL_ARB_pixel_buffer_object               (SX) }
{                Added Extension GL_EXT_depth_bounds_test                 (SX) }
{                Added Extension GL_EXT_texture_mirror_clamp              (SX) }
{                Added Extension GL_EXT_blend_equation_separate           (SX) }
{                Added Extension GL_EXT_pixel_buffer_object               (SX) }
{                Added Extension GL_EXT_texture_compression_dxt1          (SX) }
{                Added Extension GL_NV_fragment_program_option            (SX) }
{                Added Extension GL_NV_fragment_program2                  (SX) }
{                Added Extension GL_NV_vertex_program2_option             (SX) }
{                Added Extension GL_NV_vertex_program3                    (SX) }
{ Version 1.8    Added explicit delegate type definitions                 (LM) }
{                Added .Net 1.1 Support                                   (LM) }
{                Added .Net overloaded functions                          (LM) }
{                Added delayed extension loading and stubs                (LM) }
{                Added automatic InitOpenGL call in CreateRenderingContext(LM) }
{                Added extra Read_* function                              (LM) }
{ Version 2.0    fixed some Problem with version string and damn drivers.      }
{                String 1.15 identified as OpenGL 1.5 not as OpenGL 1.1   (SX) }
{                Removed unexisting extension GL_ARB_texture_mirror_repeat(SX) }
{                Added Extension WGL_ARB_pixel_format_float               (SX) }
{                Added Extension GL_EXT_stencil_clear_tag                 (SX) }
{                Added Extension GL_EXT_texture_rectangle                 (SX) }
{                Added Extension GL_EXT_texture_edge_clamp                (SX) }
{                Some 1.5 Core Consts added (now completed)               (SX) }
{                gluProject need pointer for not .net                     (SX) }
{                gluUnProject need pointer for not .net                   (SX) }
{                wglUseFontOutlines* need pointer for not .net            (SX) }
{                wglSwapMultipleBuffers need pointer for not .net         (SX) }
{                Bug with wglGetExtensionsStringEXT removed                    }
{                different type for .net                                  (SX) }
{                Added OpenGL 2.0 Core                                    (SX) }
{ Version 2.0.1  fixed some problems with glGetActiveAttrib in 2.0 Core   (SX) }
{                fixes some problems with gluProject                      (SX) }
{                fixes some problems with gluUnProject                    (SX) }
{                fixes some problems with gluTessVertex                   (SX) }
{                fixes some problems with gluLoadSamplingMatrices         (SX) }
{ Version 2.1    Removed .NET Support                                     (SX) }
{                Better support for Linux                                 (SX) }
{                Better Codeformation                                     (SX) }
{                Added some more Vector/Matrix types                      (SX) }
{                Added OpenGL 2.1 Core                                    (SX) }
{                Added Extension GL_EXT_packed_depth_stencil              (SX) }
{                Added Extension GL_EXT_texture_sRGB                      (SX) }
{                Added Extension GL_EXT_framebuffer_blit                  (SX) }
{                Added Extension GL_EXT_framebuffer_multisample           (SX) }
{                Added Extension GL_EXT_timer_query                       (SX) }
{                Added Extension GL_EXT_gpu_program_parameters            (SX) }
{                Added Extension GL_EXT_bindable_uniform                  (SX) }
{                Added Extension GL_EXT_draw_buffers2                     (SX) }
{                Added Extension GL_EXT_draw_instanced                    (SX) }
{                Added Extension GL_EXT_framebuffer_sRGB                  (SX) }
{                Added Extension GL_EXT_geometry_shader4                  (SX) }
{                Added Extension GL_EXT_gpu_shader4                       (SX) }
{                Added Extension GL_EXT_packed_float                      (SX) }
{                Added Extension GL_EXT_texture_array                     (SX) }
{                Added Extension GL_EXT_texture_buffer_object             (SX) }
{                Added Extension GL_EXT_texture_compression_latc          (SX) }
{                Added Extension GL_EXT_texture_compression_rgtc          (SX) }
{                Added Extension GL_EXT_texture_integer                   (SX) }
{                Added Extension GL_EXT_texture_shared_exponent           (SX) }
{                Added Extension GL_NV_depth_buffer_float                 (SX) }
{                Added Extension GL_NV_fragment_program4                  (SX) }
{                Added Extension GL_NV_framebuffer_multisample_coverage   (SX) }
{                Added Extension GL_NV_geometry_program4                  (SX) }
{                Added Extension GL_NV_gpu_program4                       (SX) }
{                Added Extension GL_NV_parameter_buffer_object            (SX) }
{                Added Extension GL_NV_transform_feedback                 (SX) }
{                Added Extension GL_NV_vertex_program4                    (SX) }
{ Version 3.0    fixed some const of GL_EXT_texture_shared_exponent       (SX) }
{                possible better support for mac                          (SX) }
{                Added OpenGL 3.0 Core                                    (SX) }
{                Added Extension GL_ARB_depth_buffer_float                (SX) }
{                Added Extension GL_ARB_draw_instanced                    (SX) }
{                Added Extension GL_ARB_framebuffer_object                (SX) }
{                Added Extension GL_ARB_framebuffer_sRGB                  (SX) }
{                Added Extension GL_ARB_geometry_shader4                  (SX) }
{                Added Extension GL_ARB_half_float_vertex                 (SX) }
{                Added Extension GL_ARB_instanced_arrays                  (SX) }
{                Added Extension GL_ARB_map_buffer_range                  (SX) }
{                Added Extension GL_ARB_texture_buffer_object             (SX) }
{                Added Extension GL_ARB_texture_compression_rgtc          (SX) }
{                Added Extension GL_ARB_texture_rg                        (SX) }
{                Added Extension GL_ARB_vertex_array_object               (SX) }
{                Added Extension GL_NV_conditional_render                 (SX) }
{                Added Extension GL_NV_present_video                      (SX) }
{                Added Extension GL_EXT_transform_feedback                (SX) }
{                Added Extension GL_EXT_direct_state_access               (SX) }
{                Added Extension GL_EXT_vertex_array_bgra                 (SX) }
{                Added Extension GL_EXT_texture_swizzle                   (SX) }
{                Added Extension GL_NV_explicit_multisample               (SX) }
{                Added Extension GL_NV_transform_feedback2                (SX) }
{                Added Extension WGL_ARB_create_context                   (SX) }
{                Added Extension WGL_NV_present_video                     (SX) }
{                Added Extension WGL_NV_video_out                         (SX) }
{                Added Extension WGL_NV_swap_group                        (SX) }
{                Added Extension WGL_NV_gpu_affinity                      (SX) }
{                Added define DGL_TINY_HEADER to suppress automatic            }
{                function loading                                         (SX) }
{                glProcedure renamed to dglGetProcAddress and now it's         }
{                visible from outside the unit to custom load functions   (SX) }
{                dglCheckExtension added to check if an extension exists  (SX) }
{                Read_GL_ARB_buffer_object renamed to                          }
{                Read_GL_ARB_vertex_buffer_object                         (SX) }
{ Version 3.0.1  fixed an problem with fpc                                (SX) }
{ Version 3.0.2  fixed an problem with WGL_ARB_create_context             (SX) }
{ Version 3.2    Functions from GL_VERSION_3_0 where updated              (SX) }
{                Functions from GL_ARB_map_buffer_range where updated     (SX) }
{                Functions from GL_NV_present_video where added           (SX) }
{                Added consts of GL_ARB_instanced_arrays                  (SX) }
{                Defines to identify Delphi was changed (prevent for           }
{                feature maintenance)                                     (SX) }
{                Added Extension GL_ATI_meminfo                           (SX) }
{                Added Extension GL_AMD_performance_monitor               (SX) }
{                Added Extension GL_AMD_texture_texture4                  (SX) }
{                Added Extension GL_AMD_vertex_shader_tesselator          (SX) }
{                Added Extension GL_EXT_provoking_vertex                  (SX) }
{                Added Extension WGL_AMD_gpu_association                  (SX) }
{                Added OpenGL 3.1 Core                                    (SX) }
{                All deprecated stuff can be disabled if you undef the         }
{                define DGL_DEPRECATED                                    (SX) }
{                Added Extension GL_ARB_uniform_buffer_object             (SX) }
{                Added Extension GL_ARB_compatibility                     (SX) }
{                Added Extension GL_ARB_copy_buffer                       (SX) }
{                Added Extension GL_ARB_shader_texture_lod                (SX) }
{                Remove function from GL_NV_present_video                 (SX) }
{                Added Extension WGL_3DL_stereo_control                   (SX) }
{                Added Extension GL_EXT_texture_snorm                     (SX) }
{                Added Extension GL_AMD_draw_buffers_blend                (SX) }
{                Added Extension GL_APPLE_texture_range                   (SX) }
{                Added Extension GL_APPLE_float_pixels                    (SX) }
{                Added Extension GL_APPLE_vertex_program_evaluators       (SX) }
{                Added Extension GL_APPLE_aux_depth_stencil               (SX) }
{                Added Extension GL_APPLE_object_purgeable                (SX) }
{                Added Extension GL_APPLE_row_bytes                       (SX) }
{                Added OpenGL 3.2 Core                                    (SX) }
{                Added Extension GL_ARB_depth_clamp                       (SX) }
{                Added Extension GL_ARB_draw_elements_base_vertex         (SX) }
{                Added Extension GL_ARB_fragment_coord_conventions        (SX) }
{                Added Extension GL_ARB_provoking_vertex                  (SX) }
{                Added Extension GL_ARB_seamless_cube_map                 (SX) }
{                Added Extension GL_ARB_sync                              (SX) }
{                Added Extension GL_ARB_texture_multisample               (SX) }
{                Added Extension GL_ARB_vertex_array_bgra                 (SX) }
{                Added Extension GL_ARB_draw_buffers_blend                (SX) }
{                Added Extension GL_ARB_sample_shading                    (SX) }
{                Added Extension GL_ARB_texture_cube_map_array            (SX) }
{                Added Extension GL_ARB_texture_gather                    (SX) }
{                Added Extension GL_ARB_texture_query_lod                 (SX) }
{                Added Extension WGL_ARB_create_context_profile           (SX) }
{                Added GLX Core up to Version 1.4                         (SX) }
{                Added Extension GLX_ARB_multisample                      (SX) }
{                Added Extension GLX_ARB_fbconfig_float                   (SX) }
{                Added Extension GLX_ARB_get_proc_address                 (SX) }
{                Added Extension GLX_ARB_create_context                   (SX) }
{                Added Extension GLX_ARB_create_context_profile           (SX) }
{                Added Extension GLX_EXT_visual_info                      (SX) }
{                Added Extension GLX_EXT_visual_rating                    (SX) }
{                Added Extension GLX_EXT_import_context                   (SX) }
{                Added Extension GLX_EXT_fbconfig_packed_float            (SX) }
{                Added Extension GLX_EXT_framebuffer_sRGB                 (SX) }
{                Added Extension GLX_EXT_texture_from_pixmap              (SX) }
{ Version 3.2.1  Fixed some problems with Delphi < 6                      (SX) }
{ Version 3.2.2  Added Extension GL_APPLE_rgb_422                         (SX) }
{                Added Extension GL_EXT_separate_shader_objects           (SX) }
{                Added Extension GL_NV_video_capture                      (SX) }
{                Added Extension GL_NV_copy_image                         (SX) }
{                Added Extension GL_NV_parameter_buffer_object2           (SX) }
{                Added Extension GL_NV_shader_buffer_load                 (SX) }
{                Added Extension GL_NV_vertex_buffer_unified_memory       (SX) }
{                Added Extension GL_NV_texture_barrier                    (SX) }
{                Variable GL_EXT_texture_snorm will be filled             (SX) }
{                Variable GL_APPLE_row_bytes will be filled               (SX) }
{                Added Extension WGL_NV_video_capture                     (SX) }
{                Added Extension WGL_NV_copy_image                        (SX) }
{                WGL_NV_video_out now named WGL_NV_video_output           (SX) }
{                Added Extension GLX_EXT_swap_control                     (SX) }
{ Version 3.2.3  Fixed an Problem with glGetAttribLocation                (SX) }
{                Added const GL_UNIFORM_BUFFER_EXT                        (SX) }
{                Functions of GL_NV_texture_barrier now will be loaded    (SX) }
{ Version 4.0    Changes on Extension GL_ARB_texture_gather               (SX) }
{                Changes on Extension GL_NV_shader_buffer_load            (SX) }
{                Added OpenGL 3.3 Core                                    (SX) }
{                Added OpenGL 4.0 Core                                    (SX) }
{                Added Extension GL_AMD_shader_stencil_export             (SX) }
{                Added Extension GL_AMD_seamless_cubemap_per_texture      (SX) }
{                Added Extension GL_ARB_shading_language_include          (SX) }
{                Added Extension GL_ARB_texture_compression_bptc          (SX) }
{                Added Extension GL_ARB_blend_func_extended               (SX) }
{                Added Extension GL_ARB_explicit_attrib_location          (SX) }
{                Added Extension GL_ARB_occlusion_query2                  (SX) }
{                Added Extension GL_ARB_sampler_objects                   (SX) }
{                Added Extension GL_ARB_shader_bit_encoding               (SX) }
{                Added Extension GL_ARB_texture_rgb10_a2ui                (SX) }
{                Added Extension GL_ARB_texture_swizzle                   (SX) }
{                Added Extension GL_ARB_timer_query                       (SX) }
{                Added Extension GL_ARB_vertex_type_2_10_10_10_rev        (SX) }
{                Added Extension GL_ARB_draw_indirect                     (SX) }
{                Added Extension GL_ARB_gpu_shader5                       (SX) }
{                Added Extension GL_ARB_gpu_shader_fp64                   (SX) }
{                Added Extension GL_ARB_shader_subroutine                 (SX) }
{                Added Extension GL_ARB_tessellation_shader               (SX) }
{                Added Extension GL_ARB_texture_buffer_object_rgb32       (SX) }
{                Added Extension GL_ARB_transform_feedback2               (SX) }
{                Added Extension GL_ARB_transform_feedback3               (SX) }
{ Version 4.1    Possible fix some strange linux behavior                 (SX) }
{                All function uses GL instead of TGL types                (SX) }
{                GL_AMD_vertex_shader_tesselator will be read now         (SX) }
{                GL_AMD_draw_buffers_blend will be read now               (SX) }
{                Changes on glStencilFuncSeparate (GL_2_0)                (SX) }
{                Changes on GL_VERSION_3_2                                (SX) }
{                Changes on GL_VERSION_3_3                                (SX) }
{                Changes on GL_VERSION_4_0                                (SX) }
{                Changes on GL_ARB_sample_shading                         (SX) }
{                Changes on GL_ARB_texture_cube_map_array                 (SX) }
{                Changes on GL_ARB_gpu_shader5                            (SX) }
{                Changes on GL_ARB_transform_feedback3                    (SX) }
{                Changes on GL_ARB_sampler_objects                        (SX) }
{                Changes on GL_ARB_gpu_shader_fp64                        (SX) }
{                Changes on GL_APPLE_element_array                        (SX) }
{                Changes on GL_APPLE_vertex_array_range                   (SX) }
{                Changes on GL_NV_transform_feedback                      (SX) }
{                Changes on GL_NV_vertex_buffer_unified_memory            (SX) }
{                Changes on GL_EXT_multi_draw_arrays                      (SX) }
{                Changes on GL_EXT_direct_state_access                    (SX) }
{                Changes on GL_AMD_performance_monitor                    (SX) }
{                Changes on GL_AMD_seamless_cubemap_per_texture           (SX) }
{                Changes on GL_EXT_geometry_shader4                       (SX) }
{                Added OpenGL 4.1 Core                                    (SX) }
{                Added Extension GL_ARB_ES2_compatibility                 (SX) }
{                Added Extension GL_ARB_get_program_binary                (SX) }
{                Added Extension GL_ARB_separate_shader_objects           (SX) }
{                Added Extension GL_ARB_shader_precision                  (SX) }
{                Added Extension GL_ARB_vertex_attrib_64bit               (SX) }
{                Added Extension GL_ARB_viewport_array                    (SX) }
{                Added Extension GL_ARB_cl_event                          (SX) }
{                Added Extension GL_ARB_debug_output                      (SX) }
{                Added Extension GL_ARB_robustness                        (SX) }
{                Added Extension GL_ARB_shader_stencil_export             (SX) }
{                Added Extension GL_AMD_conservative_depth                (SX) }
{                Added Extension GL_EXT_shader_image_load_store           (SX) }
{                Added Extension GL_EXT_vertex_attrib_64bit               (SX) }
{                Added Extension GL_NV_gpu_program5                       (SX) }
{                Added Extension GL_NV_gpu_shader5                        (SX) }
{                Added Extension GL_NV_shader_buffer_store                (SX) }
{                Added Extension GL_NV_tessellation_program5              (SX) }
{                Added Extension GL_NV_vertex_attrib_integer_64bit        (SX) }
{                Added Extension GL_NV_multisample_coverage               (SX) }
{                Added Extension GL_AMD_name_gen_delete                   (SX) }
{                Added Extension GL_AMD_debug_output                      (SX) }
{                Added Extension GL_NV_vdpau_interop                      (SX) }
{                Added Extension GL_AMD_transform_feedback3_lines_triangles (SX) }
{                Added Extension GL_AMD_depth_clamp_separate              (SX) }
{                Added Extension GL_EXT_texture_sRGB_decode               (SX) }
{                Added Extension WGL_ARB_framebuffer_sRGB                 (SX) }
{                Added Extension WGL_ARB_create_context_robustness        (SX) }
{                Added Extension WGL_EXT_create_context_es2_profile       (SX) }
{                Added Extension WGL_NV_multisample_coverage              (SX) }
{                Added Extension GLX_ARB_vertex_buffer_object             (SX) }
{                Added Extension GLX_ARB_framebuffer_sRGB                 (SX) }
{                Added Extension GLX_ARB_create_context_robustness        (SX) }
{                Added Extension GLX_EXT_create_context_es2_profile       (SX) }



{==============================================================================}
{ Header based on glext.h  rev 67 (2010/12/09)                                 }
{ Header based on wglext.h rev 22 (2010/08/06)                                 }
{ Header based on glxext.h rev 32 (2010/08/06)  (only Core/ARB/EXT)            }
{                                                                              }
{ This is an important notice for maintaining. Dont remove it. And make sure   }
{ to keep him up to date                                                       }
{==============================================================================}


{$define DGL_DEPRECATED}
{
  This define defines if the header should use deprecated ARB stuff or not.
  per Default the Header use deprecated Stuff.
}


{.$define DGL_TINY_HEADER}
{
  If you enable the define DGL_TINY_HEADER no function automatically will be loaded if you
  call ActivateRenderingContext. This may some bit faster and the smart linker can delete
  all non used functions. This will reduce the filesize of your binary file. But in this
  case you have to load the functions by yourself. There are two ways to do this.
  
  1. You can load whole extension by calling the func Read_Extensionname. But if you do
     this it's possible to load functions you dont use. So you have the same "problem"
     like before. But it's only an bit smaler.
     > Read_GL_ARB_multitexture;

  2. You are able to load only the functions you exactly need. In this case you are able
     to use the variables of the dglOpenGL.pas. So you only need to load the functions
     and you can use the header like before.
     To do this you have to created and activated an opengl context and than you can load
     the needed functions.
     > ActivateRenderingContext(fDC, fRC);
     > glActiveTextureARB := dglGetProcAddress('glActiveTextureARB');
     > glMultiTexCoord2fARB := dglGetProcAddress('glMultiTexCoord2fARB');

     So only the function "glActiveTextureARB" and "glMultiTexCoord2fARB" will be loaded.


  Please notice that the extension variables won't be loaded if this define is active. But
  you can call dglCheckExtension to check if any extension exists. You can assign them to
  the variables of the dglOpenGL.pas so all code they use this will find them.

  > GL_ARB_shading_language_100 := dglCheckExtension('GL_ARB_shading_language_100');
}


unit dglOpenGL;

interface

// defines to configure freepascal
{$IFDEF FPC}
  {$MODE Delphi}

  {$IFNDEF WINDOWS}
    {$LINKLIB c}
  {$ENDIF}
{$ENDIF}

// known delphi versions
{$IFNDEF FPC}       // if freepascal isnt defined
  {$IFDEF VER140}   // Delphi 6
    {$DEFINE DELPHI6_AND_DOWN}
  {$ENDIF}

  {$IFDEF VER130}   // Delphi 5
    {$DEFINE DELPHI6_AND_DOWN}
  {$ENDIF}

  {$IFDEF VER120}   // Delphi 4
    {$DEFINE DELPHI6_AND_DOWN}
  {$ENDIF}

  {$IFDEF VER110}   // C++ Builder 3
    {$DEFINE DELPHI6_AND_DOWN}
  {$ENDIF}

  {$IFDEF VER100}   // Delphi 3
    {$DEFINE DELPHI6_AND_DOWN}
  {$ENDIF}
{$ENDIF}

// Options for Delphi < 5
{$IFDEF DELPHI6_AND_DOWN}
  {$A+}
{$ELSE}
  {$A4}
{$ENDIF}

// generell options
{$H+,O+,X+}

// detecting Windows
{$IFDEF Win32}          // Delphi and fpc of 32 Bit Windows
  {$DEFINE DGL_WIN}
{$ENDIF}

{$IFDEF Win64}          // Delphi and fpc of 32 Bit Windows
  {$DEFINE DGL_WIN}
{$ENDIF}

// detecting Linux
{$IFDEF linux}          // Linux
  {$DEFINE DGL_LINUX}
{$ENDIF}

// detecting 64 Bit CPU
{$IFDEF CPU64}          // fpc on 64 bit cpus
  {$DEFINE DGL_64BIT}   // dgl define for 64 bit
{$ENDIF}



uses
  SysUtils
  {$IFDEF DGL_WIN}, Windows{$ENDIF}
  {$IFDEF DGL_LINUX}, X, XLib, XUtil{$ENDIF}
  ;

type
  // Needed for Delphi 6 and less (defined in system.pas for Delphi 7)
  PPointer = ^Pointer;
  PCardinal = ^Cardinal;

  GLenum = Cardinal;
  GLboolean = BYTEBOOL;
  GLbitfield = Cardinal;
  GLbyte = Shortint;
  GLshort = SmallInt;
  GLint = Integer;
  GLsizei = Integer;
  GLubyte = Byte;
  GLushort = Word;
  GLuint = Cardinal;
  GLfloat = Single;
  GLclampf = Single;
  GLdouble = Double;
  GLclampd = Double;
  GLvoid = Pointer;
  GLint64 = Int64;
  GLuint64 = {$IFDEF DELPHI6_AND_DOWN} Int64 {$ELSE} UInt64 {$ENDIF};
  
  TGLenum = GLenum;
  TGLboolean = GLboolean;
  TGLbitfield = GLbitfield;
  TGLbyte = GLbyte;
  TGLshort = GLshort;
  TGLint = GLint;
  TGLsizei = GLsizei;
  TGLubyte = GLubyte;
  TGLushort = GLushort;
  TGLuint = GLuint;
  TGLfloat = GLfloat;
  TGLclampf = GLclampf;
  TGLdouble = GLdouble;
  TGLclampd = GLclampd;
  TGLvoid = GLvoid;
  TGLint64 = GLint64;
  TGLuint64 = GLuint64;

  PGLboolean = ^GLboolean;
  PGLbyte = ^GLbyte;
  PGLshort = ^GLshort;
  PGLint = ^GLint;
  PGLsizei = ^GLsizei;
  PGLubyte = ^GLubyte;
  PGLushort = ^GLushort;
  PGLuint = ^GLuint;
  PGLclampf = ^GLclampf;
  PGLfloat = ^GLfloat;
  PGLdouble = ^GLdouble;
  PGLclampd = ^GLclampd;
  PGLenum = ^GLenum;
  PGLvoid = Pointer;
  PPGLvoid = ^PGLvoid;
  PGLint64 = ^GLint64;
  PGLuint64 = ^GLuint64;

  // GL_NV_half_float
  GLhalfNV = WORD;
  TGLhalfNV = GLhalfNV;
  PGLhalfNV = ^GLhalfNV;

  // GL_ARB_shader_objects
  PGLHandleARB = ^GLHandleARB;
  GLHandleARB = Integer;
  GLcharARB = AnsiChar;
  PGLcharARB = PAnsiChar;
  PPGLcharARB = ^PGLcharARB;

  // GL_VERSION_1_5
  GLintptr = GLint;
  GLsizeiptr = GLsizei;

  // GL_ARB_vertex_buffer_object
  GLintptrARB = GLint;
  GLsizeiptrARB = GLsizei;

  // GL_VERSION_2_0
  GLHandle = Integer;
  PGLchar = PAnsiChar;
  PPGLchar = ^PGLChar;

  // GL_EXT_timer_query
  GLint64EXT = Int64;
  TGLint64EXT = GLint64EXT;
  PGLint64EXT = ^GLint64EXT;

  GLuint64EXT = GLuint64;
  TGLuint64EXT = GLuint64EXT;
  PGLuint64EXT = ^GLuint64EXT;

  // WGL_ARB_pbuffer
  HPBUFFERARB = THandle;

  // WGL_EXT_pbuffer
  HPBUFFEREXT = THandle;

  // WGL_NV_present_video
  PHVIDEOOUTPUTDEVICENV = ^HVIDEOOUTPUTDEVICENV;
  HVIDEOOUTPUTDEVICENV = THandle;

  // WGL_NV_video_output
  PHPVIDEODEV = ^HPVIDEODEV;
  HPVIDEODEV = THandle;

  // WGL_NV_gpu_affinity
  PHPGPUNV = ^HPGPUNV;
  PHGPUNV = ^HGPUNV;

  // WGL_NV_video_capture
  HVIDEOINPUTDEVICENV = THandle;
  PHVIDEOINPUTDEVICENV = ^HVIDEOINPUTDEVICENV;
  
  HPGPUNV = THandle;
  HGPUNV = THandle;

  // GL_ARB_sync
  GLsync = Pointer;

  // GL_ARB_cl_event
  { These incomplete types let us declare types compatible with OpenCL's cl_context and cl_event }
  _cl_context = record end;
  _cl_event = record end;
  p_cl_context = ^_cl_context;
  p_cl_event = ^_cl_event;

  // GL_ARB_debug_output
  TglDebugProcARB = procedure (source: GLenum; type_: GLenum; id: GLuint; severity: GLenum; length: GLsizei; const message_: PGLchar; userParam: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_AMD_debug_output
  TglDebugProcAMD = procedure (id: GLuint; category: GLenum; severity: GLenum; length: GLsizei; const message_: PGLchar; userParam: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  
  // GL_NV_vdpau_interop
  GLvdpauSurfaceNV = GLintptr;
  PGLvdpauSurfaceNV = ^GLvdpauSurfaceNV;
  
  
  // GLX
  {$IFDEF DGL_LINUX}
    GLXContext = Pointer;
    GLXContextID = TXID;
    GLXDrawable = TXID;
    GLXFBConfig = Pointer;
    GLXPbuffer = TXID;
    GLXPixmap = TXID;
    GLXWindow = TXID;

    Window = TXID;
    Colormap = TXID;
    Pixmap = TXID;
    Font = TXID;
  {$ENDIF}

  // Datatypes corresponding to GL's types TGL(name)(type)(count)
  TGLVectorub2 = array[0..1] of GLubyte;
  TGLVectori2  = array[0..1] of GLint;
  TGLVectorf2  = array[0..1] of GLfloat;
  TGLVectord2  = array[0..1] of GLdouble;
  TGLVectorp2  = array[0..1] of Pointer;

  TGLVectorub3 = array[0..2] of GLubyte;
  TGLVectori3  = array[0..2] of GLint;
  TGLVectorf3  = array[0..2] of GLfloat;
  TGLVectord3  = array[0..2] of GLdouble;
  TGLVectorp3  = array[0..2] of Pointer;

  TGLVectorub4 = array[0..3] of GLubyte;
  TGLVectori4  = array[0..3] of GLint;
  TGLVectorf4  = array[0..3] of GLfloat;
  TGLVectord4  = array[0..3] of GLdouble;
  TGLVectorp4  = array[0..3] of Pointer;

  TGLArrayf4 = TGLVectorf4;
  TGLArrayf3 = TGLVectorf3;
  TGLArrayd3 = TGLVectord3;
  TGLArrayi4 = TGLVectori4;
  TGLArrayp4 = TGLVectorp4;

  TGlMatrixub3 = array[0..2, 0..2] of GLubyte;
  TGlMatrixi3  = array[0..2, 0..2] of GLint;
  TGLMatrixf3  = array[0..2, 0..2] of GLfloat;
  TGLMatrixd3  = array[0..2, 0..2] of GLdouble;

  TGlMatrixub4 = array[0..3, 0..3] of GLubyte;
  TGlMatrixi4  = array[0..3, 0..3] of GLint;
  TGLMatrixf4  = array[0..3, 0..3] of GLfloat;
  TGLMatrixd4  = array[0..3, 0..3] of GLdouble;

  TGLVector3f = TGLVectorf3;

  // Datatypes corresponding to OpenGL12.pas for easy porting
  TVector3d = TGLVectord3;

  TVector4i = TGLVectori4;
  TVector4f = TGLVectorf4;
  TVector4p = TGLVectorp4;

  TMatrix4f = TGLMatrixf4;
  TMatrix4d = TGLMatrixd4;

  PGLMatrixd4 = ^TGLMatrixd4;
  PVector4i = ^TVector4i;



{$IFDEF FPC}
  TRect = packed record
    Left, Top, Right, Bottom: Longint;
  end;
{$ENDIF}


  PGPU_DEVICE = ^GPU_DEVICE;
  GPU_DEVICE = record
    cb: DWORD;
    DeviceName: array [0..31] of AnsiChar;
    DeviceString: array [0..127] of AnsiChar;
    Flags: DWORD;
    rcVirtualScreen: TRect;
  end;
  

type
{$IFDEF FPC}
  {$IFDEF DGL_WIN}
    PWGLSwap = ^TWGLSwap;
    {$EXTERNALSYM _WGLSWAP}
      _WGLSWAP = packed record
        hdc: HDC;
        uiFlags: UINT;
      end;

    TWGLSwap = _WGLSWAP;
  {$EXTERNALSYM WGLSWAP}
    WGLSWAP = _WGLSWAP;

  {$ENDIF}
{$ENDIF}

  // GLU types
  TGLUNurbs = record
  end;
  TGLUQuadric = record
  end;
  TGLUTesselator = record
  end;
  PGLUNurbs = ^TGLUNurbs;
  PGLUQuadric = ^TGLUQuadric;
  PGLUTesselator = ^TGLUTesselator;
  // backwards compatibility
  TGLUNurbsObj = TGLUNurbs;
  TGLUQuadricObj = TGLUQuadric;
  TGLUTesselatorObj = TGLUTesselator;
  TGLUTriangulatorObj = TGLUTesselator;
  PGLUNurbsObj = PGLUNurbs;
  PGLUQuadricObj = PGLUQuadric;
  PGLUTesselatorObj = PGLUTesselator;
  PGLUTriangulatorObj = PGLUTesselator;

  // GLUQuadricCallback
  TGLUQuadricErrorProc = procedure(errorCode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  // GLUTessCallback
  TGLUTessBeginProc = procedure(AType: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TGLUTessEdgeFlagProc = procedure(Flag: GLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TGLUTessVertexProc = procedure(VertexData: Pointer); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TGLUTessEndProc = procedure; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TGLUTessErrorProc = procedure(ErrNo: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TGLUTessCombineProc = procedure(Coords: TGLArrayd3; VertexData: TGLArrayp4; Weight: TGLArrayf4; OutData: PPointer); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TGLUTessBeginDataProc = procedure(AType: GLenum; UserData: Pointer); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TGLUTessEdgeFlagDataProc = procedure(Flag: GLboolean; UserData: Pointer); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TGLUTessVertexDataProc = procedure(VertexData: Pointer; UserData: Pointer); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TGLUTessEndDataProc = procedure(UserData: Pointer); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TGLUTessErrorDataProc = procedure(ErrNo: GLenum; UserData: Pointer); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TGLUTessCombineDataProc = procedure(Coords: TGLArrayd3; VertexData: TGLArrayp4; Weight: TGLArrayf4; OutData: PPointer; UserData: Pointer); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  // GLUNurbsCallback
  TGLUNurbsErrorProc = procedure(ErrorCode: GLEnum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

var
  GL_VERSION_1_0,
  GL_VERSION_1_1,
  GL_VERSION_1_2,
  GL_VERSION_1_3,
  GL_VERSION_1_4,
  GL_VERSION_1_5,
  GL_VERSION_2_0,
  GL_VERSION_2_1,
  GL_VERSION_3_0,
  GL_VERSION_3_1,
  GL_VERSION_3_2,
  GL_VERSION_3_3,
  GL_VERSION_4_0,
  GL_VERSION_4_1,
  GLU_VERSION_1_1,
  GLU_VERSION_1_2,
  GLU_VERSION_1_3,
  GL_3DFX_multisample,
  GL_3DFX_tbuffer,
  GL_3DFX_texture_compression_FXT1,
  GL_APPLE_client_storage,
  GL_APPLE_element_array,
  GL_APPLE_fence,
  GL_APPLE_specular_vector,
  GL_APPLE_transform_hint,
  GL_APPLE_vertex_array_object,
  GL_APPLE_vertex_array_range,
  GL_APPLE_ycbcr_422,
  GL_APPLE_texture_range,
  GL_APPLE_float_pixels,
  GL_APPLE_vertex_program_evaluators,
  GL_APPLE_aux_depth_stencil,
  GL_APPLE_object_purgeable,
  GL_APPLE_row_bytes,
  GL_APPLE_rgb_422,
  GL_ARB_depth_texture,
  GL_ARB_fragment_program,
  GL_ARB_imaging,
  GL_ARB_matrix_palette,
  GL_ARB_multisample,
  GL_ARB_multitexture,
  GL_ARB_point_parameters,
  GL_ARB_shadow,
  GL_ARB_shadow_ambient,
  GL_ARB_texture_border_clamp,
  GL_ARB_texture_compression,
  GL_ARB_texture_cube_map,
  GL_ARB_texture_env_add,
  GL_ARB_texture_env_combine,
  GL_ARB_texture_env_crossbar,
  GL_ARB_texture_env_dot3,
  GL_ARB_texture_mirrored_repeat,
  GL_ARB_transpose_matrix,
  GL_ARB_vertex_blend,
  GL_ARB_vertex_buffer_object,
  GL_ARB_vertex_program,
  GL_ARB_window_pos,
  GL_ARB_shader_objects,
  GL_ARB_vertex_shader,
  GL_ARB_fragment_shader,
  GL_ARB_shading_language_100,
  GL_ARB_occlusion_query,
  GL_ARB_texture_non_power_of_two,
  GL_ARB_point_sprite,
  GL_ARB_fragment_program_shadow,
  GL_ARB_draw_buffers,
  GL_ARB_texture_rectangle,
  GL_ARB_color_buffer_float,
  GL_ARB_half_float_pixel,
  GL_ARB_texture_float,
  GL_ARB_pixel_buffer_object,
  GL_ARB_depth_buffer_float,
  GL_ARB_draw_instanced,
  GL_ARB_framebuffer_object,
  GL_ARB_framebuffer_sRGB,
  GL_ARB_geometry_shader4,
  GL_ARB_half_float_vertex,
  GL_ARB_instanced_arrays,
  GL_ARB_map_buffer_range,
  GL_ARB_texture_buffer_object,
  GL_ARB_texture_compression_rgtc,
  GL_ARB_texture_rg,
  GL_ARB_vertex_array_object,
  GL_ARB_uniform_buffer_object,
  GL_ARB_compatibility,
  GL_ARB_copy_buffer,
  GL_ARB_shader_texture_lod,
  GL_ARB_depth_clamp,
  GL_ARB_draw_elements_base_vertex,
  GL_ARB_fragment_coord_conventions,
  GL_ARB_provoking_vertex,
  GL_ARB_seamless_cube_map,
  GL_ARB_sync,
  GL_ARB_texture_multisample,
  GL_ARB_vertex_array_bgra,
  GL_ARB_draw_buffers_blend,
  GL_ARB_sample_shading,
  GL_ARB_texture_cube_map_array,
  GL_ARB_texture_gather,
  GL_ARB_texture_query_lod,
  GL_ARB_shading_language_include,
  GL_ARB_texture_compression_bptc,
  GL_ARB_blend_func_extended,
  GL_ARB_explicit_attrib_location,
  GL_ARB_occlusion_query2,
  GL_ARB_sampler_objects,
  GL_ARB_shader_bit_encoding,
  GL_ARB_texture_rgb10_a2ui,
  GL_ARB_texture_swizzle,
  GL_ARB_timer_query,
  GL_ARB_vertex_type_2_10_10_10_rev,
  GL_ARB_draw_indirect,
  GL_ARB_gpu_shader5,
  GL_ARB_gpu_shader_fp64,
  GL_ARB_shader_subroutine,
  GL_ARB_tessellation_shader,
  GL_ARB_texture_buffer_object_rgb32,
  GL_ARB_transform_feedback2,
  GL_ARB_transform_feedback3,
  GL_ARB_ES2_compatibility,
  GL_ARB_get_program_binary,
  GL_ARB_separate_shader_objects,
  GL_ARB_shader_precision,
  GL_ARB_vertex_attrib_64bit,
  GL_ARB_viewport_array,
  GL_ARB_cl_event,
  GL_ARB_debug_output,
  GL_ARB_robustness,
  GL_ARB_shader_stencil_export,  
  GL_ATI_draw_buffers,
  GL_ATI_element_array,
  GL_ATI_envmap_bumpmap,
  GL_ATI_fragment_shader,
  GL_ATI_map_object_buffer,
  GL_ATI_pn_triangles,
  GL_ATI_separate_stencil,
  GL_ATI_text_fragment_shader,
  GL_ATI_texture_env_combine3,
  GL_ATI_texture_float,
  GL_ATI_texture_mirror_once,
  GL_ATI_vertex_array_object,
  GL_ATI_vertex_attrib_array_object,
  GL_ATI_vertex_streams,
  GL_ATI_meminfo,
  GL_AMD_performance_monitor,
  GL_AMD_texture_texture4,
  GL_AMD_vertex_shader_tesselator,
  GL_AMD_draw_buffers_blend,
  GL_AMD_shader_stencil_export,
  GL_AMD_seamless_cubemap_per_texture,
  GL_AMD_conservative_depth,
  GL_AMD_name_gen_delete,
  GL_AMD_debug_output,
  GL_AMD_transform_feedback3_lines_triangles,
  GL_AMD_depth_clamp_separate,
  GL_EXT_422_pixels,
  GL_EXT_abgr,
  GL_EXT_bgra,
  GL_EXT_blend_color,
  GL_EXT_blend_func_separate,
  GL_EXT_blend_logic_op,
  GL_EXT_blend_minmax,
  GL_EXT_blend_subtract,
  GL_EXT_clip_volume_hint,
  GL_EXT_cmyka,
  GL_EXT_color_matrix,
  GL_EXT_color_subtable,
  GL_EXT_compiled_vertex_array,
  GL_EXT_convolution,
  GL_EXT_coordinate_frame,
  GL_EXT_copy_texture,
  GL_EXT_cull_vertex,
  GL_EXT_draw_range_elements,
  GL_EXT_fog_coord,
  GL_EXT_framebuffer_object,
  GL_EXT_histogram,
  GL_EXT_index_array_formats,
  GL_EXT_index_func,
  GL_EXT_index_material,
  GL_EXT_index_texture,
  GL_EXT_light_texture,
  GL_EXT_misc_attribute,
  GL_EXT_multi_draw_arrays,
  GL_EXT_multisample,
  GL_EXT_packed_pixels,
  GL_EXT_paletted_texture,
  GL_EXT_pixel_transform,
  GL_EXT_pixel_transform_color_table,
  GL_EXT_point_parameters,
  GL_EXT_polygon_offset,
  GL_EXT_rescale_normal,
  GL_EXT_secondary_color,
  GL_EXT_separate_specular_color,
  GL_EXT_shadow_funcs,
  GL_EXT_shared_texture_palette,
  GL_EXT_stencil_two_side,
  GL_EXT_stencil_wrap,
  GL_EXT_subtexture,
  GL_EXT_texture,
  GL_EXT_texture3D,
  GL_EXT_texture_compression_s3tc,
  GL_EXT_texture_cube_map,
  GL_EXT_texture_edge_clamp,
  GL_EXT_texture_env_add,
  GL_EXT_texture_env_combine,
  GL_EXT_texture_env_dot3,
  GL_EXT_texture_filter_anisotropic,
  GL_EXT_texture_lod_bias,
  GL_EXT_texture_object,
  GL_EXT_texture_perturb_normal,
  GL_EXT_texture_rectangle,
  GL_EXT_vertex_array,
  GL_EXT_vertex_shader,
  GL_EXT_vertex_weighting,
  GL_EXT_depth_bounds_test,
  GL_EXT_texture_mirror_clamp,
  GL_EXT_blend_equation_separate,
  GL_EXT_pixel_buffer_object,
  GL_EXT_texture_compression_dxt1,
  GL_EXT_stencil_clear_tag,
  GL_EXT_packed_depth_stencil,
  GL_EXT_texture_sRGB,
  GL_EXT_framebuffer_blit,
  GL_EXT_framebuffer_multisample,
  GL_EXT_timer_query,
  GL_EXT_gpu_program_parameters,
  GL_EXT_bindable_uniform,
  GL_EXT_draw_buffers2,
  GL_EXT_draw_instanced,
  GL_EXT_framebuffer_sRGB,
  GL_EXT_geometry_shader4,
  GL_EXT_gpu_shader4,
  GL_EXT_packed_float,
  GL_EXT_texture_array,
  GL_EXT_texture_buffer_object,
  GL_EXT_texture_compression_latc,
  GL_EXT_texture_compression_rgtc,
  GL_EXT_texture_integer,
  GL_EXT_texture_shared_exponent,
  GL_EXT_transform_feedback,
  GL_EXT_direct_state_access,
  GL_EXT_vertex_array_bgra,
  GL_EXT_texture_swizzle,
  GL_EXT_provoking_vertex,
  GL_EXT_texture_snorm,
  GL_EXT_separate_shader_objects,
  GL_EXT_shader_image_load_store,
  GL_EXT_vertex_attrib_64bit,
  GL_EXT_texture_sRGB_decode,
  GL_FfdMaskSGIX,
  GL_HP_convolution_border_modes,
  GL_HP_image_transform,
  GL_HP_occlusion_test,
  GL_HP_texture_lighting,
  GL_IBM_cull_vertex,
  GL_IBM_multimode_draw_arrays,
  GL_IBM_rasterpos_clip,
  GL_IBM_texture_mirrored_repeat,
  GL_IBM_vertex_array_lists,
  GL_INGR_blend_func_separate,
  GL_INGR_color_clamp,
  GL_INGR_interlace_read,
  GL_INGR_palette_buffer,
  GL_INTEL_parallel_arrays,
  GL_INTEL_texture_scissor,
  GL_MESA_resize_buffers,
  GL_MESA_window_pos,
  GL_NV_blend_square,
  GL_NV_copy_depth_to_color,
  GL_NV_depth_clamp,
  GL_NV_evaluators,
  GL_NV_fence,
  GL_NV_float_buffer,
  GL_NV_fog_distance,
  GL_NV_fragment_program,
  GL_NV_half_float,
  GL_NV_light_max_exponent,
  GL_NV_multisample_filter_hint,
  GL_NV_occlusion_query,
  GL_NV_packed_depth_stencil,
  GL_NV_pixel_data_range,
  GL_NV_point_sprite,
  GL_NV_primitive_restart,
  GL_NV_register_combiners,
  GL_NV_register_combiners2,
  GL_NV_texgen_emboss,
  GL_NV_texgen_reflection,
  GL_NV_texture_compression_vtc,
  GL_NV_texture_env_combine4,
  GL_NV_texture_expand_normal,
  GL_NV_texture_rectangle,
  GL_NV_texture_shader,
  GL_NV_texture_shader2,
  GL_NV_texture_shader3,
  GL_NV_vertex_array_range,
  GL_NV_vertex_array_range2,
  GL_NV_vertex_program,
  GL_NV_vertex_program1_1,
  GL_NV_vertex_program2,
  GL_NV_fragment_program_option,
  GL_NV_fragment_program2,
  GL_NV_vertex_program2_option,
  GL_NV_vertex_program3,
  GL_NV_depth_buffer_float,
  GL_NV_fragment_program4,
  GL_NV_framebuffer_multisample_coverage,
  GL_NV_geometry_program4,
  GL_NV_gpu_program4,
  GL_NV_parameter_buffer_object,
  GL_NV_transform_feedback,
  GL_NV_vertex_program4,
  GL_NV_conditional_render,
  GL_NV_present_video,
  GL_NV_explicit_multisample,
  GL_NV_transform_feedback2,
  GL_NV_video_capture,
  GL_NV_copy_image,
  GL_NV_parameter_buffer_object2,
  GL_NV_shader_buffer_load,
  GL_NV_vertex_buffer_unified_memory,
  GL_NV_gpu_program5,
  GL_NV_gpu_shader5,
  GL_NV_shader_buffer_store,
  GL_NV_tessellation_program5,
  GL_NV_vertex_attrib_integer_64bit,
  GL_NV_multisample_coverage,
  GL_NV_vdpau_interop,
  GL_NV_texture_barrier,
  GL_OML_interlace,
  GL_OML_resample,
  GL_OML_subsample,
  GL_PGI_misc_hints,
  GL_PGI_vertex_hints,
  GL_REND_screen_coordinates,
  GL_S3_s3tc,
  GL_SGIS_detail_texture,
  GL_SGIS_fog_function,
  GL_SGIS_generate_mipmap,
  GL_SGIS_multisample,
  GL_SGIS_pixel_texture,
  GL_SGIS_point_line_texgen,
  GL_SGIS_point_parameters,
  GL_SGIS_sharpen_texture,
  GL_SGIS_texture4D,
  GL_SGIS_texture_border_clamp,
  GL_SGIS_texture_color_mask,
  GL_SGIS_texture_edge_clamp,
  GL_SGIS_texture_filter4,
  GL_SGIS_texture_lod,
  GL_SGIS_texture_select,
  GL_SGIX_async,
  GL_SGIX_async_histogram,
  GL_SGIX_async_pixel,
  GL_SGIX_blend_alpha_minmax,
  GL_SGIX_calligraphic_fragment,
  GL_SGIX_clipmap,
  GL_SGIX_convolution_accuracy,
  GL_SGIX_depth_pass_instrument,
  GL_SGIX_depth_texture,
  GL_SGIX_flush_raster,
  GL_SGIX_fog_offset,
  GL_SGIX_fog_scale,
  GL_SGIX_fragment_lighting,
  GL_SGIX_framezoom,
  GL_SGIX_igloo_interface,
  GL_SGIX_impact_pixel_texture,
  GL_SGIX_instruments,
  GL_SGIX_interlace,
  GL_SGIX_ir_instrument1,
  GL_SGIX_list_priority,
  GL_SGIX_pixel_texture,
  GL_SGIX_pixel_tiles,
  GL_SGIX_polynomial_ffd,
  GL_SGIX_reference_plane,
  GL_SGIX_resample,
  GL_SGIX_scalebias_hint,
  GL_SGIX_shadow,
  GL_SGIX_shadow_ambient,
  GL_SGIX_sprite,
  GL_SGIX_subsample,
  GL_SGIX_tag_sample_buffer,
  GL_SGIX_texture_add_env,
  GL_SGIX_texture_coordinate_clamp,
  GL_SGIX_texture_lod_bias,
  GL_SGIX_texture_multi_buffer,
  GL_SGIX_texture_scale_bias,
  GL_SGIX_texture_select,
  GL_SGIX_vertex_preclip,
  GL_SGIX_ycrcb,
  GL_SGIX_ycrcb_subsample,
  GL_SGIX_ycrcba,
  GL_SGI_color_matrix,
  GL_SGI_color_table,
  GL_SGI_depth_pass_instrument,
  GL_SGI_texture_color_table,
  GL_SUNX_constant_data,
  GL_SUN_convolution_border_modes,
  GL_SUN_global_alpha,
  GL_SUN_mesh_array,
  GL_SUN_slice_accum,
  GL_SUN_triangle_list,
  GL_SUN_vertex,

  GL_WIN_phong_shading,
  GL_WIN_specular_fog,
  WGL_3DFX_multisample,
  WGL_ARB_buffer_region,
  WGL_ARB_extensions_string,
  WGL_ARB_make_current_read,
  WGL_ARB_multisample,
  WGL_ARB_pbuffer,
  WGL_ARB_pixel_format,
  WGL_ARB_pixel_format_float,
  WGL_ARB_render_texture,
  WGL_ARB_create_context,
  WGL_ARB_create_context_profile,
  WGL_ARB_framebuffer_sRGB,
  WGL_ARB_create_context_robustness,
  WGL_ATI_pixel_format_float,
  WGL_AMD_gpu_association,
  WGL_EXT_depth_float,
  WGL_EXT_display_color_table,
  WGL_EXT_extensions_string,
  WGL_EXT_make_current_read,
  WGL_EXT_multisample,
  WGL_EXT_pbuffer,
  WGL_EXT_pixel_format,
  WGL_EXT_swap_control,
  WGL_EXT_create_context_es2_profile,
  WGL_I3D_digital_video_control,
  WGL_I3D_gamma,
  WGL_I3D_genlock,
  WGL_I3D_image_buffer,
  WGL_I3D_swap_frame_lock,
  WGL_I3D_swap_frame_usage,
  WGL_NV_float_buffer,
  WGL_NV_render_depth_texture,
  WGL_NV_render_texture_rectangle,
  WGL_NV_vertex_array_range,
  WGL_NV_present_video,
  WGL_NV_video_output,
  WGL_NV_swap_group,
  WGL_NV_gpu_affinity,
  WGL_NV_video_capture,
  WGL_NV_copy_image,
  WGL_NV_multisample_coverage,
  WGL_OML_sync_control,
  WGL_3DL_stereo_control,
  WIN_draw_range_elements,
  WIN_swap_hint,
  
//  GLX_VERSION_1_0,
  GLX_VERSION_1_3,
  GLX_VERSION_1_4,
  GLX_ARB_multisample,
  GLX_ARB_fbconfig_float,
  GLX_ARB_get_proc_address,
  GLX_ARB_create_context,
  GLX_ARB_create_context_profile,
  GLX_ARB_vertex_buffer_object,
  GLX_ARB_framebuffer_sRGB,
  GLX_ARB_create_context_robustness,
  GLX_EXT_visual_info,
  GLX_EXT_visual_rating,
  GLX_EXT_import_context,
  GLX_EXT_fbconfig_packed_float,
  GLX_EXT_framebuffer_sRGB,
  GLX_EXT_texture_from_pixmap,
  GLX_EXT_swap_control,
  GLX_EXT_create_context_es2_profile : Boolean;

const
  // GL_VERSION_1_1
  { AttribMask }
  GL_DEPTH_BUFFER_BIT = $00000100;
  GL_STENCIL_BUFFER_BIT = $00000400;
  GL_COLOR_BUFFER_BIT = $00004000;
  { Boolean }
  GL_TRUE = 1;
  GL_FALSE = 0;
  { BeginMode }
  GL_POINTS = $0000;
  GL_LINES = $0001;
  GL_LINE_LOOP = $0002;
  GL_LINE_STRIP = $0003;
  GL_TRIANGLES = $0004;
  GL_TRIANGLE_STRIP = $0005;
  GL_TRIANGLE_FAN = $0006;
  { AlphaFunction }
  GL_NEVER = $0200;
  GL_LESS = $0201;
  GL_EQUAL = $0202;
  GL_LEQUAL = $0203;
  GL_GREATER = $0204;
  GL_NOTEQUAL = $0205;
  GL_GEQUAL = $0206;
  GL_ALWAYS = $0207;
  { BlendingFactorDest }
  GL_ZERO = 0;
  GL_ONE = 1;
  GL_SRC_COLOR = $0300;
  GL_ONE_MINUS_SRC_COLOR = $0301;
  GL_SRC_ALPHA = $0302;
  GL_ONE_MINUS_SRC_ALPHA = $0303;
  GL_DST_ALPHA = $0304;
  GL_ONE_MINUS_DST_ALPHA = $0305;
  { BlendingFactorSrc }
  GL_DST_COLOR = $0306;
  GL_ONE_MINUS_DST_COLOR = $0307;
  GL_SRC_ALPHA_SATURATE = $0308;
  { DrawBufferMode }
  GL_NONE = 0;
  GL_FRONT_LEFT = $0400;
  GL_FRONT_RIGHT = $0401;
  GL_BACK_LEFT = $0402;
  GL_BACK_RIGHT = $0403;
  GL_FRONT = $0404;
  GL_BACK = $0405;
  GL_LEFT = $0406;
  GL_RIGHT = $0407;
  GL_FRONT_AND_BACK = $0408;
  { ErrorCode }
  GL_NO_ERROR = 0;
  GL_INVALID_ENUM = $0500;
  GL_INVALID_VALUE = $0501;
  GL_INVALID_OPERATION = $0502;
  GL_OUT_OF_MEMORY = $0505;
  { FrontFaceDirection }
  GL_CW = $0900;
  GL_CCW = $0901;
  { GetPName }
  GL_POINT_SIZE = $0B11;
  GL_POINT_SIZE_RANGE = $0B12;
  GL_POINT_SIZE_GRANULARITY = $0B13;
  GL_LINE_SMOOTH = $0B20;
  GL_LINE_WIDTH = $0B21;
  GL_LINE_WIDTH_RANGE = $0B22;
  GL_LINE_WIDTH_GRANULARITY = $0B23;
  GL_POLYGON_SMOOTH = $0B41;
  GL_CULL_FACE = $0B44;
  GL_CULL_FACE_MODE = $0B45;
  GL_FRONT_FACE = $0B46;
  GL_DEPTH_RANGE = $0B70;
  GL_DEPTH_TEST = $0B71;
  GL_DEPTH_WRITEMASK = $0B72;
  GL_DEPTH_CLEAR_VALUE = $0B73;
  GL_DEPTH_FUNC = $0B74;
  GL_STENCIL_TEST = $0B90;
  GL_STENCIL_CLEAR_VALUE = $0B91;
  GL_STENCIL_FUNC = $0B92;
  GL_STENCIL_VALUE_MASK = $0B93;
  GL_STENCIL_FAIL = $0B94;
  GL_STENCIL_PASS_DEPTH_FAIL = $0B95;
  GL_STENCIL_PASS_DEPTH_PASS = $0B96;
  GL_STENCIL_REF = $0B97;
  GL_STENCIL_WRITEMASK = $0B98;
  GL_VIEWPORT = $0BA2;
  GL_DITHER = $0BD0;
  GL_BLEND_DST = $0BE0;
  GL_BLEND_SRC = $0BE1;
  GL_BLEND = $0BE2;
  GL_LOGIC_OP_MODE = $0BF0;
  GL_COLOR_LOGIC_OP = $0BF2;
  GL_DRAW_BUFFER = $0C01;
  GL_READ_BUFFER = $0C02;
  GL_SCISSOR_BOX = $0C10;
  GL_SCISSOR_TEST = $0C11;
  GL_COLOR_CLEAR_VALUE = $0C22;
  GL_COLOR_WRITEMASK = $0C23;
  GL_DOUBLEBUFFER = $0C32;
  GL_STEREO = $0C33;
  GL_LINE_SMOOTH_HINT = $0C52;
  GL_POLYGON_SMOOTH_HINT = $0C53;
  GL_UNPACK_SWAP_BYTES = $0CF0;
  GL_UNPACK_LSB_FIRST = $0CF1;
  GL_UNPACK_ROW_LENGTH = $0CF2;
  GL_UNPACK_SKIP_ROWS = $0CF3;
  GL_UNPACK_SKIP_PIXELS = $0CF4;
  GL_UNPACK_ALIGNMENT = $0CF5;
  GL_PACK_SWAP_BYTES = $0D00;
  GL_PACK_LSB_FIRST = $0D01;
  GL_PACK_ROW_LENGTH = $0D02;
  GL_PACK_SKIP_ROWS = $0D03;
  GL_PACK_SKIP_PIXELS = $0D04;
  GL_PACK_ALIGNMENT = $0D05;
  GL_MAX_TEXTURE_SIZE = $0D33;
  GL_MAX_VIEWPORT_DIMS = $0D3A;
  GL_SUBPIXEL_BITS = $0D50;
  GL_TEXTURE_1D = $0DE0;
  GL_TEXTURE_2D = $0DE1;
  GL_POLYGON_OFFSET_UNITS = $2A00;
  GL_POLYGON_OFFSET_POINT = $2A01;
  GL_POLYGON_OFFSET_LINE = $2A02;
  GL_POLYGON_OFFSET_FILL = $8037;
  GL_POLYGON_OFFSET_FACTOR = $8038;
  GL_TEXTURE_BINDING_1D = $8068;
  GL_TEXTURE_BINDING_2D = $8069;
  { GetTextureParameter }
  GL_TEXTURE_WIDTH = $1000;
  GL_TEXTURE_HEIGHT = $1001;
  GL_TEXTURE_INTERNAL_FORMAT = $1003;
  GL_TEXTURE_BORDER_COLOR = $1004;
  GL_TEXTURE_BORDER = $1005;
  GL_TEXTURE_RED_SIZE = $805C;
  GL_TEXTURE_GREEN_SIZE = $805D;
  GL_TEXTURE_BLUE_SIZE = $805E;
  GL_TEXTURE_ALPHA_SIZE = $805F;
  { HintMode }
  GL_DONT_CARE = $1100;
  GL_FASTEST = $1101;
  GL_NICEST = $1102;
  { DataType }
  GL_BYTE = $1400;
  GL_UNSIGNED_BYTE = $1401;
  GL_SHORT = $1402;
  GL_UNSIGNED_SHORT = $1403;
  GL_INT = $1404;
  GL_UNSIGNED_INT = $1405;
  GL_FLOAT = $1406;
  GL_DOUBLE = $140A;
  { LogicOp }
  GL_CLEAR = $1500;
  GL_AND = $1501;
  GL_AND_REVERSE = $1502;
  GL_COPY = $1503;
  GL_AND_INVERTED = $1504;
  GL_NOOP = $1505;
  GL_XOR = $1506;
  GL_OR = $1507;
  GL_NOR = $1508;
  GL_EQUIV = $1509;
  GL_INVERT = $150A;
  GL_OR_REVERSE = $150B;
  GL_COPY_INVERTED = $150C;
  GL_OR_INVERTED = $150D;
  GL_NAND = $150E;
  GL_SET = $150F;
  { MatrixMode (for gl3.h, FBO attachment type) }
  GL_TEXTURE = $1702;
  { PixelCopyType }
  GL_COLOR = $1800;
  GL_DEPTH = $1801;
  GL_STENCIL = $1802;
  { PixelFormat }
  GL_STENCIL_INDEX = $1901;
  GL_DEPTH_COMPONENT = $1902;
  GL_RED = $1903;
  GL_GREEN = $1904;
  GL_BLUE = $1905;
  GL_ALPHA = $1906;
  GL_RGB = $1907;
  GL_RGBA = $1908;
  { PolygonMode }
  GL_POINT = $1B00;
  GL_LINE = $1B01;
  GL_FILL = $1B02;
  { StencilOp }
  GL_KEEP = $1E00;
  GL_REPLACE = $1E01;
  GL_INCR = $1E02;
  GL_DECR = $1E03;
  { StringName }
  GL_VENDOR = $1F00;
  GL_RENDERER = $1F01;
  GL_VERSION = $1F02;
  GL_EXTENSIONS = $1F03;
  { TextureMagFilter }
  GL_NEAREST = $2600;
  GL_LINEAR = $2601;
  { TextureMinFilter }
  GL_NEAREST_MIPMAP_NEAREST = $2700;
  GL_LINEAR_MIPMAP_NEAREST = $2701;
  GL_NEAREST_MIPMAP_LINEAR = $2702;
  GL_LINEAR_MIPMAP_LINEAR = $2703;
  { TextureParameterName }
  GL_TEXTURE_MAG_FILTER = $2800;
  GL_TEXTURE_MIN_FILTER = $2801;
  GL_TEXTURE_WRAP_S = $2802;
  GL_TEXTURE_WRAP_T = $2803;
  { TextureTarget }
  GL_PROXY_TEXTURE_1D = $8063;
  GL_PROXY_TEXTURE_2D = $8064;
  { TextureWrapMode }
  GL_REPEAT = $2901;
  { PixelInternalFormat }
  GL_R3_G3_B2 = $2A10;
  GL_RGB4 = $804F;
  GL_RGB5 = $8050;
  GL_RGB8 = $8051;
  GL_RGB10 = $8052;
  GL_RGB12 = $8053;
  GL_RGB16 = $8054;
  GL_RGBA2 = $8055;
  GL_RGBA4 = $8056;
  GL_RGB5_A1 = $8057;
  GL_RGBA8 = $8058;
  GL_RGB10_A2 = $8059;
  GL_RGBA12 = $805A;
  GL_RGBA16 = $805B;
{$ifdef DGL_DEPRECATED}
  GL_ACCUM = $0100;
  GL_LOAD = $0101;
  GL_RETURN = $0102;
  GL_MULT = $0103;
  GL_ADD = $0104;
  GL_CURRENT_BIT = $00000001;
  GL_POINT_BIT = $00000002;
  GL_LINE_BIT = $00000004;
  GL_POLYGON_BIT = $00000008;
  GL_POLYGON_STIPPLE_BIT = $00000010;
  GL_PIXEL_MODE_BIT = $00000020;
  GL_LIGHTING_BIT = $00000040;
  GL_FOG_BIT = $00000080;
  GL_ACCUM_BUFFER_BIT = $00000200;
  GL_VIEWPORT_BIT = $00000800;
  GL_TRANSFORM_BIT = $00001000;
  GL_ENABLE_BIT = $00002000;
  GL_HINT_BIT = $00008000;
  GL_EVAL_BIT = $00010000;
  GL_LIST_BIT = $00020000;
  GL_TEXTURE_BIT = $00040000;
  GL_SCISSOR_BIT = $00080000;
  GL_ALL_ATTRIB_BITS = $000FFFFF;
  GL_QUADS = $0007;
  GL_QUAD_STRIP = $0008;
  GL_POLYGON = $0009;
  GL_CLIP_PLANE0 = $3000;
  GL_CLIP_PLANE1 = $3001;
  GL_CLIP_PLANE2 = $3002;
  GL_CLIP_PLANE3 = $3003;
  GL_CLIP_PLANE4 = $3004;
  GL_CLIP_PLANE5 = $3005;
  GL_2_BYTES = $1407;
  GL_3_BYTES = $1408;
  GL_4_BYTES = $1409;
  GL_AUX0 = $0409;
  GL_AUX1 = $040A;
  GL_AUX2 = $040B;
  GL_AUX3 = $040C;
  GL_STACK_OVERFLOW = $0503;
  GL_STACK_UNDERFLOW = $0504;
  GL_2D = $0600;
  GL_3D = $0601;
  GL_3D_COLOR = $0602;
  GL_3D_COLOR_TEXTURE = $0603;
  GL_4D_COLOR_TEXTURE = $0604;
  GL_PASS_THROUGH_TOKEN = $0700;
  GL_POINT_TOKEN = $0701;
  GL_LINE_TOKEN = $0702;
  GL_POLYGON_TOKEN = $0703;
  GL_BITMAP_TOKEN = $0704;
  GL_DRAW_PIXEL_TOKEN = $0705;
  GL_COPY_PIXEL_TOKEN = $0706;
  GL_LINE_RESET_TOKEN = $0707;
  GL_EXP = $0800;
  GL_EXP2 = $0801;
  GL_COEFF = $0A00;
  GL_ORDER = $0A01;
  GL_DOMAIN = $0A02;
  GL_CURRENT_COLOR = $0B00;
  GL_CURRENT_INDEX = $0B01;
  GL_CURRENT_NORMAL = $0B02;
  GL_CURRENT_TEXTURE_COORDS = $0B03;
  GL_CURRENT_RASTER_COLOR = $0B04;
  GL_CURRENT_RASTER_INDEX = $0B05;
  GL_CURRENT_RASTER_TEXTURE_COORDS = $0B06;
  GL_CURRENT_RASTER_POSITION = $0B07;
  GL_CURRENT_RASTER_POSITION_VALID = $0B08;
  GL_CURRENT_RASTER_DISTANCE = $0B09;
  GL_POINT_SMOOTH = $0B10;
  GL_LINE_STIPPLE = $0B24;
  GL_LINE_STIPPLE_PATTERN = $0B25;
  GL_LINE_STIPPLE_REPEAT = $0B26;
  GL_LIST_MODE = $0B30;
  GL_MAX_LIST_NESTING = $0B31;
  GL_LIST_BASE = $0B32;
  GL_LIST_INDEX = $0B33;
  GL_POLYGON_MODE = $0B40;
  GL_POLYGON_STIPPLE = $0B42;
  GL_EDGE_FLAG = $0B43;
  GL_LIGHTING = $0B50;
  GL_LIGHT_MODEL_LOCAL_VIEWER = $0B51;
  GL_LIGHT_MODEL_TWO_SIDE = $0B52;
  GL_LIGHT_MODEL_AMBIENT = $0B53;
  GL_SHADE_MODEL = $0B54;
  GL_COLOR_MATERIAL_FACE = $0B55;
  GL_COLOR_MATERIAL_PARAMETER = $0B56;
  GL_COLOR_MATERIAL = $0B57;
  GL_FOG = $0B60;
  GL_FOG_INDEX = $0B61;
  GL_FOG_DENSITY = $0B62;
  GL_FOG_START = $0B63;
  GL_FOG_END = $0B64;
  GL_FOG_MODE = $0B65;
  GL_FOG_COLOR = $0B66;
  GL_ACCUM_CLEAR_VALUE = $0B80;
  GL_MATRIX_MODE = $0BA0;
  GL_NORMALIZE = $0BA1;
  GL_MODELVIEW_STACK_DEPTH = $0BA3;
  GL_PROJECTION_STACK_DEPTH = $0BA4;
  GL_TEXTURE_STACK_DEPTH = $0BA5;
  GL_MODELVIEW_MATRIX = $0BA6;
  GL_PROJECTION_MATRIX = $0BA7;
  GL_TEXTURE_MATRIX = $0BA8;
  GL_ATTRIB_STACK_DEPTH = $0BB0;
  GL_CLIENT_ATTRIB_STACK_DEPTH = $0BB1;
  GL_ALPHA_TEST = $0BC0;
  GL_ALPHA_TEST_FUNC = $0BC1;
  GL_ALPHA_TEST_REF = $0BC2;
  GL_INDEX_LOGIC_OP = $0BF1;
  GL_AUX_BUFFERS = $0C00;
  GL_INDEX_CLEAR_VALUE = $0C20;
  GL_INDEX_WRITEMASK = $0C21;
  GL_INDEX_MODE = $0C30;
  GL_RGBA_MODE = $0C31;
  GL_RENDER_MODE = $0C40;
  GL_PERSPECTIVE_CORRECTION_HINT = $0C50;
  GL_POINT_SMOOTH_HINT = $0C51;
  GL_FOG_HINT = $0C54;
  GL_TEXTURE_GEN_S = $0C60;
  GL_TEXTURE_GEN_T = $0C61;
  GL_TEXTURE_GEN_R = $0C62;
  GL_TEXTURE_GEN_Q = $0C63;
  GL_PIXEL_MAP_I_TO_I = $0C70;
  GL_PIXEL_MAP_S_TO_S = $0C71;
  GL_PIXEL_MAP_I_TO_R = $0C72;
  GL_PIXEL_MAP_I_TO_G = $0C73;
  GL_PIXEL_MAP_I_TO_B = $0C74;
  GL_PIXEL_MAP_I_TO_A = $0C75;
  GL_PIXEL_MAP_R_TO_R = $0C76;
  GL_PIXEL_MAP_G_TO_G = $0C77;
  GL_PIXEL_MAP_B_TO_B = $0C78;
  GL_PIXEL_MAP_A_TO_A = $0C79;
  GL_PIXEL_MAP_I_TO_I_SIZE = $0CB0;
  GL_PIXEL_MAP_S_TO_S_SIZE = $0CB1;
  GL_PIXEL_MAP_I_TO_R_SIZE = $0CB2;
  GL_PIXEL_MAP_I_TO_G_SIZE = $0CB3;
  GL_PIXEL_MAP_I_TO_B_SIZE = $0CB4;
  GL_PIXEL_MAP_I_TO_A_SIZE = $0CB5;
  GL_PIXEL_MAP_R_TO_R_SIZE = $0CB6;
  GL_PIXEL_MAP_G_TO_G_SIZE = $0CB7;
  GL_PIXEL_MAP_B_TO_B_SIZE = $0CB8;
  GL_PIXEL_MAP_A_TO_A_SIZE = $0CB9;
  GL_MAP_COLOR = $0D10;
  GL_MAP_STENCIL = $0D11;
  GL_INDEX_SHIFT = $0D12;
  GL_INDEX_OFFSET = $0D13;
  GL_RED_SCALE = $0D14;
  GL_RED_BIAS = $0D15;
  GL_ZOOM_X = $0D16;
  GL_ZOOM_Y = $0D17;
  GL_GREEN_SCALE = $0D18;
  GL_GREEN_BIAS = $0D19;
  GL_BLUE_SCALE = $0D1A;
  GL_BLUE_BIAS = $0D1B;
  GL_ALPHA_SCALE = $0D1C;
  GL_ALPHA_BIAS = $0D1D;
  GL_DEPTH_SCALE = $0D1E;
  GL_DEPTH_BIAS = $0D1F;
  GL_MAX_EVAL_ORDER = $0D30;
  GL_MAX_LIGHTS = $0D31;
  GL_MAX_CLIP_PLANES = $0D32;
  GL_MAX_PIXEL_MAP_TABLE = $0D34;
  GL_MAX_ATTRIB_STACK_DEPTH = $0D35;
  GL_MAX_MODELVIEW_STACK_DEPTH = $0D36;
  GL_MAX_NAME_STACK_DEPTH = $0D37;
  GL_MAX_PROJECTION_STACK_DEPTH = $0D38;
  GL_MAX_TEXTURE_STACK_DEPTH = $0D39;
  GL_MAX_CLIENT_ATTRIB_STACK_DEPTH = $0D3B;
  GL_INDEX_BITS = $0D51;
  GL_RED_BITS = $0D52;
  GL_GREEN_BITS = $0D53;
  GL_BLUE_BITS = $0D54;
  GL_ALPHA_BITS = $0D55;
  GL_DEPTH_BITS = $0D56;
  GL_STENCIL_BITS = $0D57;
  GL_ACCUM_RED_BITS = $0D58;
  GL_ACCUM_GREEN_BITS = $0D59;
  GL_ACCUM_BLUE_BITS = $0D5A;
  GL_ACCUM_ALPHA_BITS = $0D5B;
  GL_NAME_STACK_DEPTH = $0D70;
  GL_AUTO_NORMAL = $0D80;
  GL_MAP1_COLOR_4 = $0D90;
  GL_MAP1_INDEX = $0D91;
  GL_MAP1_NORMAL = $0D92;
  GL_MAP1_TEXTURE_COORD_1 = $0D93;
  GL_MAP1_TEXTURE_COORD_2 = $0D94;
  GL_MAP1_TEXTURE_COORD_3 = $0D95;
  GL_MAP1_TEXTURE_COORD_4 = $0D96;
  GL_MAP1_VERTEX_3 = $0D97;
  GL_MAP1_VERTEX_4 = $0D98;
  GL_MAP2_COLOR_4 = $0DB0;
  GL_MAP2_INDEX = $0DB1;
  GL_MAP2_NORMAL = $0DB2;
  GL_MAP2_TEXTURE_COORD_1 = $0DB3;
  GL_MAP2_TEXTURE_COORD_2 = $0DB4;
  GL_MAP2_TEXTURE_COORD_3 = $0DB5;
  GL_MAP2_TEXTURE_COORD_4 = $0DB6;
  GL_MAP2_VERTEX_3 = $0DB7;
  GL_MAP2_VERTEX_4 = $0DB8;
  GL_MAP1_GRID_DOMAIN = $0DD0;
  GL_MAP1_GRID_SEGMENTS = $0DD1;
  GL_MAP2_GRID_DOMAIN = $0DD2;
  GL_MAP2_GRID_SEGMENTS = $0DD3;
  GL_FEEDBACK_BUFFER_POINTER = $0DF0;
  GL_FEEDBACK_BUFFER_SIZE = $0DF1;
  GL_FEEDBACK_BUFFER_TYPE = $0DF2;
  GL_SELECTION_BUFFER_POINTER = $0DF3;
  GL_SELECTION_BUFFER_SIZE = $0DF4;
  GL_LIGHT0 = $4000;
  GL_LIGHT1 = $4001;
  GL_LIGHT2 = $4002;
  GL_LIGHT3 = $4003;
  GL_LIGHT4 = $4004;
  GL_LIGHT5 = $4005;
  GL_LIGHT6 = $4006;
  GL_LIGHT7 = $4007;
  GL_AMBIENT = $1200;
  GL_DIFFUSE = $1201;
  GL_SPECULAR = $1202;
  GL_POSITION = $1203;
  GL_SPOT_DIRECTION = $1204;
  GL_SPOT_EXPONENT = $1205;
  GL_SPOT_CUTOFF = $1206;
  GL_CONSTANT_ATTENUATION = $1207;
  GL_LINEAR_ATTENUATION = $1208;
  GL_QUADRATIC_ATTENUATION = $1209;
  GL_COMPILE = $1300;
  GL_COMPILE_AND_EXECUTE = $1301;
  GL_EMISSION = $1600;
  GL_SHININESS = $1601;
  GL_AMBIENT_AND_DIFFUSE = $1602;
  GL_COLOR_INDEXES = $1603;
  GL_MODELVIEW = $1700;
  GL_PROJECTION = $1701;
  GL_COLOR_INDEX = $1900;
  GL_LUMINANCE = $1909;
  GL_LUMINANCE_ALPHA = $190A;
  GL_BITMAP = $1A00;
  GL_RENDER = $1C00;
  GL_FEEDBACK = $1C01;
  GL_SELECT = $1C02;
  GL_FLAT = $1D00;
  GL_SMOOTH = $1D01;
  GL_S = $2000;
  GL_T = $2001;
  GL_R = $2002;
  GL_Q = $2003;
  GL_MODULATE = $2100;
  GL_DECAL = $2101;
  GL_TEXTURE_ENV_MODE = $2200;
  GL_TEXTURE_ENV_COLOR = $2201;
  GL_TEXTURE_ENV = $2300;
  GL_EYE_LINEAR = $2400;
  GL_OBJECT_LINEAR = $2401;
  GL_SPHERE_MAP = $2402;
  GL_TEXTURE_GEN_MODE = $2500;
  GL_OBJECT_PLANE = $2501;
  GL_EYE_PLANE = $2502;
  GL_CLAMP = $2900;
  GL_CLIENT_PIXEL_STORE_BIT = $00000001;
  GL_CLIENT_VERTEX_ARRAY_BIT = $00000002;
  GL_CLIENT_ALL_ATTRIB_BITS = $FFFFFFFF;
  GL_ALPHA4 = $803B;
  GL_ALPHA8 = $803C;
  GL_ALPHA12 = $803D;
  GL_ALPHA16 = $803E;
  GL_LUMINANCE4 = $803F;
  GL_LUMINANCE8 = $8040;
  GL_LUMINANCE12 = $8041;
  GL_LUMINANCE16 = $8042;
  GL_LUMINANCE4_ALPHA4 = $8043;
  GL_LUMINANCE6_ALPHA2 = $8044;
  GL_LUMINANCE8_ALPHA8 = $8045;
  GL_LUMINANCE12_ALPHA4 = $8046;
  GL_LUMINANCE12_ALPHA12 = $8047;
  GL_LUMINANCE16_ALPHA16 = $8048;
  GL_INTENSITY = $8049;
  GL_INTENSITY4 = $804A;
  GL_INTENSITY8 = $804B;
  GL_INTENSITY12 = $804C;
  GL_INTENSITY16 = $804D;
  GL_TEXTURE_LUMINANCE_SIZE = $8060;
  GL_TEXTURE_INTENSITY_SIZE = $8061;
  GL_TEXTURE_PRIORITY = $8066;
  GL_TEXTURE_RESIDENT = $8067;
  GL_VERTEX_ARRAY = $8074;
  GL_NORMAL_ARRAY = $8075;
  GL_COLOR_ARRAY = $8076;
  GL_INDEX_ARRAY = $8077;
  GL_TEXTURE_COORD_ARRAY = $8078;
  GL_EDGE_FLAG_ARRAY = $8079;
  GL_VERTEX_ARRAY_SIZE = $807A;
  GL_VERTEX_ARRAY_TYPE = $807B;
  GL_VERTEX_ARRAY_STRIDE = $807C;
  GL_NORMAL_ARRAY_TYPE = $807E;
  GL_NORMAL_ARRAY_STRIDE = $807F;
  GL_COLOR_ARRAY_SIZE = $8081;
  GL_COLOR_ARRAY_TYPE = $8082;
  GL_COLOR_ARRAY_STRIDE = $8083;
  GL_INDEX_ARRAY_TYPE = $8085;
  GL_INDEX_ARRAY_STRIDE = $8086;
  GL_TEXTURE_COORD_ARRAY_SIZE = $8088;
  GL_TEXTURE_COORD_ARRAY_TYPE = $8089;
  GL_TEXTURE_COORD_ARRAY_STRIDE = $808A;
  GL_EDGE_FLAG_ARRAY_STRIDE = $808C;
  GL_VERTEX_ARRAY_POINTER = $808E;
  GL_NORMAL_ARRAY_POINTER = $808F;
  GL_COLOR_ARRAY_POINTER = $8090;
  GL_INDEX_ARRAY_POINTER = $8091;
  GL_TEXTURE_COORD_ARRAY_POINTER = $8092;
  GL_EDGE_FLAG_ARRAY_POINTER = $8093;
  GL_V2F = $2A20;
  GL_V3F = $2A21;
  GL_C4UB_V2F = $2A22;
  GL_C4UB_V3F = $2A23;
  GL_C3F_V3F = $2A24;
  GL_N3F_V3F = $2A25;
  GL_C4F_N3F_V3F = $2A26;
  GL_T2F_V3F = $2A27;
  GL_T4F_V4F = $2A28;
  GL_T2F_C4UB_V3F = $2A29;
  GL_T2F_C3F_V3F = $2A2A;
  GL_T2F_N3F_V3F = $2A2B;
  GL_T2F_C4F_N3F_V3F = $2A2C;
  GL_T4F_C4F_N3F_V4F = $2A2D;
  GL_COLOR_TABLE_FORMAT_EXT = $80D8;
  GL_COLOR_TABLE_WIDTH_EXT = $80D9;
  GL_COLOR_TABLE_RED_SIZE_EXT = $80DA;
  GL_COLOR_TABLE_GREEN_SIZE_EXT = $80DB;
  GL_COLOR_TABLE_BLUE_SIZE_EXT = $80DC;
  GL_COLOR_TABLE_ALPHA_SIZE_EXT = $80DD;
  GL_COLOR_TABLE_LUMINANCE_SIZE_EXT = $80DE;
  GL_COLOR_TABLE_INTENSITY_SIZE_EXT = $80DF;
  GL_LOGIC_OP = GL_INDEX_LOGIC_OP;
  GL_TEXTURE_COMPONENTS = GL_TEXTURE_INTERNAL_FORMAT;
{$endif}

  // GL_VERSION_1_2
  GL_UNSIGNED_BYTE_3_3_2 = $8032;
  GL_UNSIGNED_SHORT_4_4_4_4 = $8033;
  GL_UNSIGNED_SHORT_5_5_5_1 = $8034;
  GL_UNSIGNED_INT_8_8_8_8 = $8035;
  GL_UNSIGNED_INT_10_10_10_2 = $8036;
  GL_TEXTURE_BINDING_3D = $806A;
  GL_PACK_SKIP_IMAGES = $806B;
  GL_PACK_IMAGE_HEIGHT = $806C;
  GL_UNPACK_SKIP_IMAGES = $806D;
  GL_UNPACK_IMAGE_HEIGHT = $806E;
  GL_TEXTURE_3D = $806F;
  GL_PROXY_TEXTURE_3D = $8070;
  GL_TEXTURE_DEPTH = $8071;
  GL_TEXTURE_WRAP_R = $8072;
  GL_MAX_3D_TEXTURE_SIZE = $8073;
  GL_UNSIGNED_BYTE_2_3_3_REV = $8362;
  GL_UNSIGNED_SHORT_5_6_5 = $8363;
  GL_UNSIGNED_SHORT_5_6_5_REV = $8364;
  GL_UNSIGNED_SHORT_4_4_4_4_REV = $8365;
  GL_UNSIGNED_SHORT_1_5_5_5_REV = $8366;
  GL_UNSIGNED_INT_8_8_8_8_REV = $8367;
  GL_UNSIGNED_INT_2_10_10_10_REV = $8368;
  GL_BGR = $80E0;
  GL_BGRA = $80E1;
  GL_MAX_ELEMENTS_VERTICES = $80E8;
  GL_MAX_ELEMENTS_INDICES = $80E9;
  GL_CLAMP_TO_EDGE = $812F;
  GL_TEXTURE_MIN_LOD = $813A;
  GL_TEXTURE_MAX_LOD = $813B;
  GL_TEXTURE_BASE_LEVEL = $813C;
  GL_TEXTURE_MAX_LEVEL = $813D;
  GL_SMOOTH_POINT_SIZE_RANGE = $0B12;
  GL_SMOOTH_POINT_SIZE_GRANULARITY = $0B13;
  GL_SMOOTH_LINE_WIDTH_RANGE = $0B22;
  GL_SMOOTH_LINE_WIDTH_GRANULARITY = $0B23;
  GL_ALIASED_LINE_WIDTH_RANGE = $846E;
{$ifdef DGL_DEPRECATED}
  GL_RESCALE_NORMAL = $803A;
  GL_LIGHT_MODEL_COLOR_CONTROL = $81F8;
  GL_SINGLE_COLOR = $81F9;
  GL_SEPARATE_SPECULAR_COLOR = $81FA;
  GL_ALIASED_POINT_SIZE_RANGE = $846D;
{$endif}

  // GL_VERSION_1_3
  GL_TEXTURE0 = $84C0;
  GL_TEXTURE1 = $84C1;
  GL_TEXTURE2 = $84C2;
  GL_TEXTURE3 = $84C3;
  GL_TEXTURE4 = $84C4;
  GL_TEXTURE5 = $84C5;
  GL_TEXTURE6 = $84C6;
  GL_TEXTURE7 = $84C7;
  GL_TEXTURE8 = $84C8;
  GL_TEXTURE9 = $84C9;
  GL_TEXTURE10 = $84CA;
  GL_TEXTURE11 = $84CB;
  GL_TEXTURE12 = $84CC;
  GL_TEXTURE13 = $84CD;
  GL_TEXTURE14 = $84CE;
  GL_TEXTURE15 = $84CF;
  GL_TEXTURE16 = $84D0;
  GL_TEXTURE17 = $84D1;
  GL_TEXTURE18 = $84D2;
  GL_TEXTURE19 = $84D3;
  GL_TEXTURE20 = $84D4;
  GL_TEXTURE21 = $84D5;
  GL_TEXTURE22 = $84D6;
  GL_TEXTURE23 = $84D7;
  GL_TEXTURE24 = $84D8;
  GL_TEXTURE25 = $84D9;
  GL_TEXTURE26 = $84DA;
  GL_TEXTURE27 = $84DB;
  GL_TEXTURE28 = $84DC;
  GL_TEXTURE29 = $84DD;
  GL_TEXTURE30 = $84DE;
  GL_TEXTURE31 = $84DF;
  GL_ACTIVE_TEXTURE = $84E0;
  GL_MULTISAMPLE = $809D;
  GL_SAMPLE_ALPHA_TO_COVERAGE = $809E;
  GL_SAMPLE_ALPHA_TO_ONE = $809F;
  GL_SAMPLE_COVERAGE = $80A0;
  GL_SAMPLE_BUFFERS = $80A8;
  GL_SAMPLES = $80A9;
  GL_SAMPLE_COVERAGE_VALUE = $80AA;
  GL_SAMPLE_COVERAGE_INVERT = $80AB;
  GL_TEXTURE_CUBE_MAP = $8513;
  GL_TEXTURE_BINDING_CUBE_MAP = $8514;
  GL_TEXTURE_CUBE_MAP_POSITIVE_X = $8515;
  GL_TEXTURE_CUBE_MAP_NEGATIVE_X = $8516;
  GL_TEXTURE_CUBE_MAP_POSITIVE_Y = $8517;
  GL_TEXTURE_CUBE_MAP_NEGATIVE_Y = $8518;
  GL_TEXTURE_CUBE_MAP_POSITIVE_Z = $8519;
  GL_TEXTURE_CUBE_MAP_NEGATIVE_Z = $851A;
  GL_PROXY_TEXTURE_CUBE_MAP = $851B;
  GL_MAX_CUBE_MAP_TEXTURE_SIZE = $851C;
  GL_COMPRESSED_RGB = $84ED;
  GL_COMPRESSED_RGBA = $84EE;
  GL_TEXTURE_COMPRESSION_HINT = $84EF;
  GL_TEXTURE_COMPRESSED_IMAGE_SIZE = $86A0;
  GL_TEXTURE_COMPRESSED = $86A1;
  GL_NUM_COMPRESSED_TEXTURE_FORMATS = $86A2;
  GL_COMPRESSED_TEXTURE_FORMATS = $86A3;
  GL_CLAMP_TO_BORDER = $812D;
{$ifdef DGL_DEPRECATED}
  GL_CLIENT_ACTIVE_TEXTURE = $84E1;
  GL_MAX_TEXTURE_UNITS = $84E2;
  GL_TRANSPOSE_MODELVIEW_MATRIX = $84E3;
  GL_TRANSPOSE_PROJECTION_MATRIX = $84E4;
  GL_TRANSPOSE_TEXTURE_MATRIX = $84E5;
  GL_TRANSPOSE_COLOR_MATRIX = $84E6;
  GL_MULTISAMPLE_BIT = $20000000;
  GL_NORMAL_MAP = $8511;
  GL_REFLECTION_MAP = $8512;
  GL_COMPRESSED_ALPHA = $84E9;
  GL_COMPRESSED_LUMINANCE = $84EA;
  GL_COMPRESSED_LUMINANCE_ALPHA = $84EB;
  GL_COMPRESSED_INTENSITY = $84EC;
  GL_COMBINE = $8570;
  GL_COMBINE_RGB = $8571;
  GL_COMBINE_ALPHA = $8572;
  GL_SOURCE0_RGB = $8580;
  GL_SOURCE1_RGB = $8581;
  GL_SOURCE2_RGB = $8582;
  GL_SOURCE0_ALPHA = $8588;
  GL_SOURCE1_ALPHA = $8589;
  GL_SOURCE2_ALPHA = $858A;
  GL_OPERAND0_RGB = $8590;
  GL_OPERAND1_RGB = $8591;
  GL_OPERAND2_RGB = $8592;
  GL_OPERAND0_ALPHA = $8598;
  GL_OPERAND1_ALPHA = $8599;
  GL_OPERAND2_ALPHA = $859A;
  GL_RGB_SCALE = $8573;
  GL_ADD_SIGNED = $8574;
  GL_INTERPOLATE = $8575;
  GL_SUBTRACT = $84E7;
  GL_CONSTANT = $8576;
  GL_PRIMARY_COLOR = $8577;
  GL_PREVIOUS = $8578;
  GL_DOT3_RGB = $86AE;
  GL_DOT3_RGBA = $86AF;
{$endif}

  // GL_VERSION_1_4
  GL_BLEND_DST_RGB = $80C8;
  GL_BLEND_SRC_RGB = $80C9;
  GL_BLEND_DST_ALPHA = $80CA;
  GL_BLEND_SRC_ALPHA = $80CB;
  GL_POINT_FADE_THRESHOLD_SIZE = $8128;
  GL_DEPTH_COMPONENT16 = $81A5;
  GL_DEPTH_COMPONENT24 = $81A6;
  GL_DEPTH_COMPONENT32 = $81A7;
  GL_MIRRORED_REPEAT = $8370;
  GL_MAX_TEXTURE_LOD_BIAS = $84FD;
  GL_TEXTURE_LOD_BIAS = $8501;
  GL_INCR_WRAP = $8507;
  GL_DECR_WRAP = $8508;
  GL_TEXTURE_DEPTH_SIZE = $884A;
  GL_TEXTURE_COMPARE_MODE = $884C;
  GL_TEXTURE_COMPARE_FUNC = $884D;
{$ifdef DGL_DEPRECATED}
  GL_POINT_SIZE_MIN = $8126;
  GL_POINT_SIZE_MAX = $8127;
  GL_POINT_DISTANCE_ATTENUATION = $8129;
  GL_GENERATE_MIPMAP = $8191;
  GL_GENERATE_MIPMAP_HINT = $8192;
  GL_FOG_COORDINATE_SOURCE = $8450;
  GL_FOG_COORDINATE = $8451;
  GL_FRAGMENT_DEPTH = $8452;
  GL_CURRENT_FOG_COORDINATE = $8453;
  GL_FOG_COORDINATE_ARRAY_TYPE = $8454;
  GL_FOG_COORDINATE_ARRAY_STRIDE = $8455;
  GL_FOG_COORDINATE_ARRAY_POINTER = $8456;
  GL_FOG_COORDINATE_ARRAY = $8457;
  GL_COLOR_SUM = $8458;
  GL_CURRENT_SECONDARY_COLOR = $8459;
  GL_SECONDARY_COLOR_ARRAY_SIZE = $845A;
  GL_SECONDARY_COLOR_ARRAY_TYPE = $845B;
  GL_SECONDARY_COLOR_ARRAY_STRIDE = $845C;
  GL_SECONDARY_COLOR_ARRAY_POINTER = $845D;
  GL_SECONDARY_COLOR_ARRAY = $845E;
  GL_TEXTURE_FILTER_CONTROL = $8500;
  GL_DEPTH_TEXTURE_MODE = $884B;
  GL_COMPARE_R_TO_TEXTURE = $884E;
{$endif}

  // GL_VERSION_1_5
  GL_BUFFER_SIZE = $8764;
  GL_BUFFER_USAGE = $8765;
  GL_QUERY_COUNTER_BITS = $8864;
  GL_CURRENT_QUERY = $8865;
  GL_QUERY_RESULT = $8866;
  GL_QUERY_RESULT_AVAILABLE = $8867;
  GL_ARRAY_BUFFER = $8892;
  GL_ELEMENT_ARRAY_BUFFER = $8893;
  GL_ARRAY_BUFFER_BINDING = $8894;
  GL_ELEMENT_ARRAY_BUFFER_BINDING = $8895;
  GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = $889F;
  GL_READ_ONLY = $88B8;
  GL_WRITE_ONLY = $88B9;
  GL_READ_WRITE = $88BA;
  GL_BUFFER_ACCESS = $88BB;
  GL_BUFFER_MAPPED = $88BC;
  GL_BUFFER_MAP_POINTER = $88BD;
  GL_STREAM_DRAW = $88E0;
  GL_STREAM_READ = $88E1;
  GL_STREAM_COPY = $88E2;
  GL_STATIC_DRAW = $88E4;
  GL_STATIC_READ = $88E5;
  GL_STATIC_COPY = $88E6;
  GL_DYNAMIC_DRAW = $88E8;
  GL_DYNAMIC_READ = $88E9;
  GL_DYNAMIC_COPY = $88EA;
  GL_SAMPLES_PASSED = $8914;
{$ifdef DGL_DEPRECATED}
  GL_VERTEX_ARRAY_BUFFER_BINDING = $8896;
  GL_NORMAL_ARRAY_BUFFER_BINDING = $8897;
  GL_COLOR_ARRAY_BUFFER_BINDING = $8898;
  GL_INDEX_ARRAY_BUFFER_BINDING = $8899;
  GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING = $889A;
  GL_EDGE_FLAG_ARRAY_BUFFER_BINDING = $889B;
  GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING = $889C;
  GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING = $889D;
  GL_WEIGHT_ARRAY_BUFFER_BINDING = $889E;
  GL_FOG_COORD_SRC = $8450;
  GL_FOG_COORD = $8451;
  GL_CURRENT_FOG_COORD = $8453;
  GL_FOG_COORD_ARRAY_TYPE = $8454;
  GL_FOG_COORD_ARRAY_STRIDE = $8455;
  GL_FOG_COORD_ARRAY_POINTER = $8456;
  GL_FOG_COORD_ARRAY = $8457;
  GL_FOG_COORD_ARRAY_BUFFER_BINDING = $889D;
  GL_SRC0_RGB = $8580;
  GL_SRC1_RGB = $8581;
  GL_SRC2_RGB = $8582;
  GL_SRC0_ALPHA = $8588;
  GL_SRC1_ALPHA = $8589;
  GL_SRC2_ALPHA = $858A;
{$endif}

  // GL_VERSION_2_0
  GL_BLEND_EQUATION_RGB = $8009;
  GL_VERTEX_ATTRIB_ARRAY_ENABLED = $8622;
  GL_VERTEX_ATTRIB_ARRAY_SIZE = $8623;
  GL_VERTEX_ATTRIB_ARRAY_STRIDE = $8624;
  GL_VERTEX_ATTRIB_ARRAY_TYPE = $8625;
  GL_CURRENT_VERTEX_ATTRIB = $8626;
  GL_VERTEX_PROGRAM_POINT_SIZE = $8642;
  GL_VERTEX_ATTRIB_ARRAY_POINTER = $8645;
  GL_STENCIL_BACK_FUNC = $8800;
  GL_STENCIL_BACK_FAIL = $8801;
  GL_STENCIL_BACK_PASS_DEPTH_FAIL = $8802;
  GL_STENCIL_BACK_PASS_DEPTH_PASS = $8803;
  GL_MAX_DRAW_BUFFERS = $8824;
  GL_DRAW_BUFFER0 = $8825;
  GL_DRAW_BUFFER1 = $8826;
  GL_DRAW_BUFFER2 = $8827;
  GL_DRAW_BUFFER3 = $8828;
  GL_DRAW_BUFFER4 = $8829;
  GL_DRAW_BUFFER5 = $882A;
  GL_DRAW_BUFFER6 = $882B;
  GL_DRAW_BUFFER7 = $882C;
  GL_DRAW_BUFFER8 = $882D;
  GL_DRAW_BUFFER9 = $882E;
  GL_DRAW_BUFFER10 = $882F;
  GL_DRAW_BUFFER11 = $8830;
  GL_DRAW_BUFFER12 = $8831;
  GL_DRAW_BUFFER13 = $8832;
  GL_DRAW_BUFFER14 = $8833;
  GL_DRAW_BUFFER15 = $8834;
  GL_BLEND_EQUATION_ALPHA = $883D;
  GL_MAX_VERTEX_ATTRIBS = $8869;
  GL_VERTEX_ATTRIB_ARRAY_NORMALIZED = $886A;
  GL_MAX_TEXTURE_IMAGE_UNITS = $8872;
  GL_FRAGMENT_SHADER = $8B30;
  GL_VERTEX_SHADER = $8B31;
  GL_MAX_FRAGMENT_UNIFORM_COMPONENTS = $8B49;
  GL_MAX_VERTEX_UNIFORM_COMPONENTS = $8B4A;
  GL_MAX_VARYING_FLOATS = $8B4B;
  GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS = $8B4C;
  GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS = $8B4D;
  GL_SHADER_TYPE = $8B4F;
  GL_FLOAT_VEC2 = $8B50;
  GL_FLOAT_VEC3 = $8B51;
  GL_FLOAT_VEC4 = $8B52;
  GL_INT_VEC2 = $8B53;
  GL_INT_VEC3 = $8B54;
  GL_INT_VEC4 = $8B55;
  GL_BOOL = $8B56;
  GL_BOOL_VEC2 = $8B57;
  GL_BOOL_VEC3 = $8B58;
  GL_BOOL_VEC4 = $8B59;
  GL_FLOAT_MAT2 = $8B5A;
  GL_FLOAT_MAT3 = $8B5B;
  GL_FLOAT_MAT4 = $8B5C;
  GL_SAMPLER_1D = $8B5D;
  GL_SAMPLER_2D = $8B5E;
  GL_SAMPLER_3D = $8B5F;
  GL_SAMPLER_CUBE = $8B60;
  GL_SAMPLER_1D_SHADOW = $8B61;
  GL_SAMPLER_2D_SHADOW = $8B62;
  GL_DELETE_STATUS = $8B80;
  GL_COMPILE_STATUS = $8B81;
  GL_LINK_STATUS = $8B82;
  GL_VALIDATE_STATUS = $8B83;
  GL_INFO_LOG_LENGTH = $8B84;
  GL_ATTACHED_SHADERS = $8B85;
  GL_ACTIVE_UNIFORMS = $8B86;
  GL_ACTIVE_UNIFORM_MAX_LENGTH = $8B87;
  GL_SHADER_SOURCE_LENGTH = $8B88;
  GL_ACTIVE_ATTRIBUTES = $8B89;
  GL_ACTIVE_ATTRIBUTE_MAX_LENGTH = $8B8A;
  GL_FRAGMENT_SHADER_DERIVATIVE_HINT = $8B8B;
  GL_SHADING_LANGUAGE_VERSION = $8B8C;
  GL_CURRENT_PROGRAM = $8B8D;
  GL_POINT_SPRITE_COORD_ORIGIN = $8CA0;
  GL_LOWER_LEFT = $8CA1;
  GL_UPPER_LEFT = $8CA2;
  GL_STENCIL_BACK_REF = $8CA3;
  GL_STENCIL_BACK_VALUE_MASK = $8CA4;
  GL_STENCIL_BACK_WRITEMASK = $8CA5;
{$ifdef DGL_DEPRECATED}
  GL_VERTEX_PROGRAM_TWO_SIDE = $8643;
  GL_POINT_SPRITE = $8861;
  GL_COORD_REPLACE = $8862;
  GL_MAX_TEXTURE_COORDS = $8871;
{$endif}

  // GL_VERSION_2_1
  GL_PIXEL_PACK_BUFFER = $88EB;
  GL_PIXEL_UNPACK_BUFFER = $88EC;
  GL_PIXEL_PACK_BUFFER_BINDING = $88ED;
  GL_PIXEL_UNPACK_BUFFER_BINDING = $88EF;
  GL_FLOAT_MAT2x3 = $8B65;
  GL_FLOAT_MAT2x4 = $8B66;
  GL_FLOAT_MAT3x2 = $8B67;
  GL_FLOAT_MAT3x4 = $8B68;
  GL_FLOAT_MAT4x2 = $8B69;
  GL_FLOAT_MAT4x3 = $8B6A;
  GL_SRGB = $8C40;
  GL_SRGB8 = $8C41;
  GL_SRGB_ALPHA = $8C42;
  GL_SRGB8_ALPHA8 = $8C43;
  GL_COMPRESSED_SRGB = $8C48;
  GL_COMPRESSED_SRGB_ALPHA = $8C49;
{$ifdef DGL_DEPRECATED}
  GL_CURRENT_RASTER_SECONDARY_COLOR = $845F;
  GL_SLUMINANCE_ALPHA = $8C44;
  GL_SLUMINANCE8_ALPHA8 = $8C45;
  GL_SLUMINANCE = $8C46;
  GL_SLUMINANCE8 = $8C47;
  GL_COMPRESSED_SLUMINANCE = $8C4A;
  GL_COMPRESSED_SLUMINANCE_ALPHA = $8C4B;
{$endif}

  // GL_VERSION_3_0
  GL_COMPARE_REF_TO_TEXTURE = $884E;
  GL_CLIP_DISTANCE0 = $3000;
  GL_CLIP_DISTANCE1 = $3001;
  GL_CLIP_DISTANCE2 = $3002;
  GL_CLIP_DISTANCE3 = $3003;
  GL_CLIP_DISTANCE4 = $3004;
  GL_CLIP_DISTANCE5 = $3005;
  GL_CLIP_DISTANCE6 = $3006;
  GL_CLIP_DISTANCE7 = $3007;
  GL_MAX_CLIP_DISTANCES = $0D32;
  GL_MAJOR_VERSION = $821B;
  GL_MINOR_VERSION = $821C;
  GL_NUM_EXTENSIONS = $821D;
  GL_CONTEXT_FLAGS = $821E;
  GL_DEPTH_BUFFER = $8223;
  GL_STENCIL_BUFFER = $8224;
  GL_COMPRESSED_RED = $8225;
  GL_COMPRESSED_RG = $8226;
  GL_CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT = $0001;
  GL_RGBA32F = $8814;
  GL_RGB32F = $8815;
  GL_RGBA16F = $881A;
  GL_RGB16F = $881B;
  GL_VERTEX_ATTRIB_ARRAY_INTEGER = $88FD;
  GL_MAX_ARRAY_TEXTURE_LAYERS = $88FF;
  GL_MIN_PROGRAM_TEXEL_OFFSET = $8904;
  GL_MAX_PROGRAM_TEXEL_OFFSET = $8905;
  GL_CLAMP_READ_COLOR = $891C;
  GL_FIXED_ONLY = $891D;
  GL_MAX_VARYING_COMPONENTS = $8B4B;
  GL_TEXTURE_1D_ARRAY = $8C18;
  GL_PROXY_TEXTURE_1D_ARRAY = $8C19;
  GL_TEXTURE_2D_ARRAY = $8C1A;
  GL_PROXY_TEXTURE_2D_ARRAY = $8C1B;
  GL_TEXTURE_BINDING_1D_ARRAY = $8C1C;
  GL_TEXTURE_BINDING_2D_ARRAY = $8C1D;
  GL_R11F_G11F_B10F = $8C3A;
  GL_UNSIGNED_INT_10F_11F_11F_REV = $8C3B;
  GL_RGB9_E5 = $8C3D;
  GL_UNSIGNED_INT_5_9_9_9_REV = $8C3E;
  GL_TEXTURE_SHARED_SIZE = $8C3F;
  GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH = $8C76;
  GL_TRANSFORM_FEEDBACK_BUFFER_MODE = $8C7F;
  GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS = $8C80;
  GL_TRANSFORM_FEEDBACK_VARYINGS = $8C83;
  GL_TRANSFORM_FEEDBACK_BUFFER_START = $8C84;
  GL_TRANSFORM_FEEDBACK_BUFFER_SIZE = $8C85;
  GL_PRIMITIVES_GENERATED = $8C87;
  GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN = $8C88;
  GL_RASTERIZER_DISCARD = $8C89;
  GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = $8C8A;
  GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS = $8C8B;
  GL_INTERLEAVED_ATTRIBS = $8C8C;
  GL_SEPARATE_ATTRIBS = $8C8D;
  GL_TRANSFORM_FEEDBACK_BUFFER = $8C8E;
  GL_TRANSFORM_FEEDBACK_BUFFER_BINDING = $8C8F;
  GL_RGBA32UI = $8D70;
  GL_RGB32UI = $8D71;
  GL_RGBA16UI = $8D76;
  GL_RGB16UI = $8D77;
  GL_RGBA8UI = $8D7C;
  GL_RGB8UI = $8D7D;
  GL_RGBA32I = $8D82;
  GL_RGB32I = $8D83;
  GL_RGBA16I = $8D88;
  GL_RGB16I = $8D89;
  GL_RGBA8I = $8D8E;
  GL_RGB8I = $8D8F;
  GL_RED_INTEGER = $8D94;
  GL_GREEN_INTEGER = $8D95;
  GL_BLUE_INTEGER = $8D96;
  GL_RGB_INTEGER = $8D98;
  GL_RGBA_INTEGER = $8D99;
  GL_BGR_INTEGER = $8D9A;
  GL_BGRA_INTEGER = $8D9B;
  GL_SAMPLER_1D_ARRAY = $8DC0;
  GL_SAMPLER_2D_ARRAY = $8DC1;
  GL_SAMPLER_1D_ARRAY_SHADOW = $8DC3;
  GL_SAMPLER_2D_ARRAY_SHADOW = $8DC4;
  GL_SAMPLER_CUBE_SHADOW = $8DC5;
  GL_UNSIGNED_INT_VEC2 = $8DC6;
  GL_UNSIGNED_INT_VEC3 = $8DC7;
  GL_UNSIGNED_INT_VEC4 = $8DC8;
  GL_INT_SAMPLER_1D = $8DC9;
  GL_INT_SAMPLER_2D = $8DCA;
  GL_INT_SAMPLER_3D = $8DCB;
  GL_INT_SAMPLER_CUBE = $8DCC;
  GL_INT_SAMPLER_1D_ARRAY = $8DCE;
  GL_INT_SAMPLER_2D_ARRAY = $8DCF;
  GL_UNSIGNED_INT_SAMPLER_1D = $8DD1;
  GL_UNSIGNED_INT_SAMPLER_2D = $8DD2;
  GL_UNSIGNED_INT_SAMPLER_3D = $8DD3;
  GL_UNSIGNED_INT_SAMPLER_CUBE = $8DD4;
  GL_UNSIGNED_INT_SAMPLER_1D_ARRAY = $8DD6;
  GL_UNSIGNED_INT_SAMPLER_2D_ARRAY = $8DD7;
  GL_QUERY_WAIT = $8E13;
  GL_QUERY_NO_WAIT = $8E14;
  GL_QUERY_BY_REGION_WAIT = $8E15;
  GL_QUERY_BY_REGION_NO_WAIT = $8E16;
  GL_BUFFER_ACCESS_FLAGS = $911F;
  GL_BUFFER_MAP_LENGTH = $9120;
  GL_BUFFER_MAP_OFFSET = $9121;
  { Reuse tokens from ARB_depth_buffer_float }
  { reuse GL_DEPTH_COMPONENT32F }
  { reuse GL_DEPTH32F_STENCIL8 }
  { reuse GL_FLOAT_32_UNSIGNED_INT_24_8_REV }
  { Reuse tokens from ARB_framebuffer_object }
  { reuse GL_INVALID_FRAMEBUFFER_OPERATION }
  { reuse GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING }
  { reuse GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE }
  { reuse GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE }
  { reuse GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE }
  { reuse GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE }
  { reuse GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE }
  { reuse GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE }
  { reuse GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE }
  { reuse GL_FRAMEBUFFER_DEFAULT }
  { reuse GL_FRAMEBUFFER_UNDEFINED }
  { reuse GL_DEPTH_STENCIL_ATTACHMENT }
  { reuse GL_INDEX }
  { reuse GL_MAX_RENDERBUFFER_SIZE }
  { reuse GL_DEPTH_STENCIL }
  { reuse GL_UNSIGNED_INT_24_8 }
  { reuse GL_DEPTH24_STENCIL8 }
  { reuse GL_TEXTURE_STENCIL_SIZE }
  { reuse GL_TEXTURE_RED_TYPE }
  { reuse GL_TEXTURE_GREEN_TYPE }
  { reuse GL_TEXTURE_BLUE_TYPE }
  { reuse GL_TEXTURE_ALPHA_TYPE }
  { reuse GL_TEXTURE_DEPTH_TYPE }
  { reuse GL_UNSIGNED_NORMALIZED }
  { reuse GL_FRAMEBUFFER_BINDING }
  { reuse GL_DRAW_FRAMEBUFFER_BINDING }
  { reuse GL_RENDERBUFFER_BINDING }
  { reuse GL_READ_FRAMEBUFFER }
  { reuse GL_DRAW_FRAMEBUFFER }
  { reuse GL_READ_FRAMEBUFFER_BINDING }
  { reuse GL_RENDERBUFFER_SAMPLES }
  { reuse GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE }
  { reuse GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME }
  { reuse GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL }
  { reuse GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE }
  { reuse GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER }
  { reuse GL_FRAMEBUFFER_COMPLETE }
  { reuse GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT }
  { reuse GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT }
  { reuse GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER }
  { reuse GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER }
  { reuse GL_FRAMEBUFFER_UNSUPPORTED }
  { reuse GL_MAX_COLOR_ATTACHMENTS }
  { reuse GL_COLOR_ATTACHMENT0 }
  { reuse GL_COLOR_ATTACHMENT1 }
  { reuse GL_COLOR_ATTACHMENT2 }
  { reuse GL_COLOR_ATTACHMENT3 }
  { reuse GL_COLOR_ATTACHMENT4 }
  { reuse GL_COLOR_ATTACHMENT5 }
  { reuse GL_COLOR_ATTACHMENT6 }
  { reuse GL_COLOR_ATTACHMENT7 }
  { reuse GL_COLOR_ATTACHMENT8 }
  { reuse GL_COLOR_ATTACHMENT9 }
  { reuse GL_COLOR_ATTACHMENT10 }
  { reuse GL_COLOR_ATTACHMENT11 }
  { reuse GL_COLOR_ATTACHMENT12 }
  { reuse GL_COLOR_ATTACHMENT13 }
  { reuse GL_COLOR_ATTACHMENT14 }
  { reuse GL_COLOR_ATTACHMENT15 }
  { reuse GL_DEPTH_ATTACHMENT }
  { reuse GL_STENCIL_ATTACHMENT }
  { reuse GL_FRAMEBUFFER }
  { reuse GL_RENDERBUFFER }
  { reuse GL_RENDERBUFFER_WIDTH }
  { reuse GL_RENDERBUFFER_HEIGHT }
  { reuse GL_RENDERBUFFER_INTERNAL_FORMAT }
  { reuse GL_STENCIL_INDEX1 }
  { reuse GL_STENCIL_INDEX4 }
  { reuse GL_STENCIL_INDEX8 }
  { reuse GL_STENCIL_INDEX16 }
  { reuse GL_RENDERBUFFER_RED_SIZE }
  { reuse GL_RENDERBUFFER_GREEN_SIZE }
  { reuse GL_RENDERBUFFER_BLUE_SIZE }
  { reuse GL_RENDERBUFFER_ALPHA_SIZE }
  { reuse GL_RENDERBUFFER_DEPTH_SIZE }
  { reuse GL_RENDERBUFFER_STENCIL_SIZE }
  { reuse GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE }
  { reuse GL_MAX_SAMPLES }
  { Reuse tokens from ARB_framebuffer_sRGB }
  { reuse GL_FRAMEBUFFER_SRGB }
  { Reuse tokens from ARB_half_float_vertex }
  { reuse GL_HALF_FLOAT }
  { Reuse tokens from ARB_map_buffer_range }
  { reuse GL_MAP_READ_BIT }
  { reuse GL_MAP_WRITE_BIT }
  { reuse GL_MAP_INVALIDATE_RANGE_BIT }
  { reuse GL_MAP_INVALIDATE_BUFFER_BIT }
  { reuse GL_MAP_FLUSH_EXPLICIT_BIT }
  { reuse GL_MAP_UNSYNCHRONIZED_BIT }
  { Reuse tokens from ARB_texture_compression_rgtc }
  { reuse GL_COMPRESSED_RED_RGTC1 }
  { reuse GL_COMPRESSED_SIGNED_RED_RGTC1 }
  { reuse GL_COMPRESSED_RG_RGTC2 }
  { reuse GL_COMPRESSED_SIGNED_RG_RGTC2 }
  { Reuse tokens from ARB_texture_rg }
  { reuse GL_RG }
  { reuse GL_RG_INTEGER }
  { reuse GL_R8 }
  { reuse GL_R16 }
  { reuse GL_RG8 }
  { reuse GL_RG16 }
  { reuse GL_R16F }
  { reuse GL_R32F }
  { reuse GL_RG16F }
  { reuse GL_RG32F }
  { reuse GL_R8I }
  { reuse GL_R8UI }
  { reuse GL_R16I }
  { reuse GL_R16UI }
  { reuse GL_R32I }
  { reuse GL_R32UI }
  { reuse GL_RG8I }
  { reuse GL_RG8UI }
  { reuse GL_RG16I }
  { reuse GL_RG16UI }
  { reuse GL_RG32I }
  { reuse GL_RG32UI }
  { Reuse tokens from ARB_vertex_array_object }
  { reuse GL_VERTEX_ARRAY_BINDING }
{$ifdef DGL_DEPRECATED}
  GL_CLAMP_VERTEX_COLOR = $891A;
  GL_CLAMP_FRAGMENT_COLOR = $891B;
  GL_ALPHA_INTEGER = $8D97;
  { Reuse tokens from ARB_framebuffer_object }
  { reuse GL_TEXTURE_LUMINANCE_TYPE }
  { reuse GL_TEXTURE_INTENSITY_TYPE }
{$endif}

  // GL_VERSION_3_1
  GL_SAMPLER_2D_RECT = $8B63;
  GL_SAMPLER_2D_RECT_SHADOW = $8B64;
  GL_SAMPLER_BUFFER = $8DC2;
  GL_INT_SAMPLER_2D_RECT = $8DCD;
  GL_INT_SAMPLER_BUFFER = $8DD0;
  GL_UNSIGNED_INT_SAMPLER_2D_RECT = $8DD5;
  GL_UNSIGNED_INT_SAMPLER_BUFFER = $8DD8;
  GL_TEXTURE_BUFFER = $8C2A;
  GL_MAX_TEXTURE_BUFFER_SIZE = $8C2B;
  GL_TEXTURE_BINDING_BUFFER = $8C2C;
  GL_TEXTURE_BUFFER_DATA_STORE_BINDING = $8C2D;
  GL_TEXTURE_BUFFER_FORMAT = $8C2E;
  GL_TEXTURE_RECTANGLE = $84F5;
  GL_TEXTURE_BINDING_RECTANGLE = $84F6;
  GL_PROXY_TEXTURE_RECTANGLE = $84F7;
  GL_MAX_RECTANGLE_TEXTURE_SIZE = $84F8;
  GL_RED_SNORM = $8F90;
  GL_RG_SNORM = $8F91;
  GL_RGB_SNORM = $8F92;
  GL_RGBA_SNORM = $8F93;
  GL_R8_SNORM = $8F94;
  GL_RG8_SNORM = $8F95;
  GL_RGB8_SNORM = $8F96;
  GL_RGBA8_SNORM = $8F97;
  GL_R16_SNORM = $8F98;
  GL_RG16_SNORM = $8F99;
  GL_RGB16_SNORM = $8F9A;
  GL_RGBA16_SNORM = $8F9B;
  GL_SIGNED_NORMALIZED = $8F9C;
  GL_PRIMITIVE_RESTART = $8F9D;
  GL_PRIMITIVE_RESTART_INDEX = $8F9E;
  { Reuse tokens from ARB_copy_buffer }
  { reuse GL_COPY_READ_BUFFER }
  { reuse GL_COPY_WRITE_BUFFER }
  { Reuse tokens from ARB_draw_instanced (none) }
  { Reuse tokens from ARB_uniform_buffer_object }
  { reuse GL_UNIFORM_BUFFER }
  { reuse GL_UNIFORM_BUFFER_BINDING }
  { reuse GL_UNIFORM_BUFFER_START }
  { reuse GL_UNIFORM_BUFFER_SIZE }
  { reuse GL_MAX_VERTEX_UNIFORM_BLOCKS }
  { reuse GL_MAX_FRAGMENT_UNIFORM_BLOCKS }
  { reuse GL_MAX_COMBINED_UNIFORM_BLOCKS }
  { reuse GL_MAX_UNIFORM_BUFFER_BINDINGS }
  { reuse GL_MAX_UNIFORM_BLOCK_SIZE }
  { reuse GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS }
  { reuse GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS }
  { reuse GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT }
  { reuse GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH }
  { reuse GL_ACTIVE_UNIFORM_BLOCKS }
  { reuse GL_UNIFORM_TYPE }
  { reuse GL_UNIFORM_SIZE }
  { reuse GL_UNIFORM_NAME_LENGTH }
  { reuse GL_UNIFORM_BLOCK_INDEX }
  { reuse GL_UNIFORM_OFFSET }
  { reuse GL_UNIFORM_ARRAY_STRIDE }
  { reuse GL_UNIFORM_MATRIX_STRIDE }
  { reuse GL_UNIFORM_IS_ROW_MAJOR }
  { reuse GL_UNIFORM_BLOCK_BINDING }
  { reuse GL_UNIFORM_BLOCK_DATA_SIZE }
  { reuse GL_UNIFORM_BLOCK_NAME_LENGTH }
  { reuse GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS }
  { reuse GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES }
  { reuse GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER }
  { reuse GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER }
  { reuse GL_INVALID_INDEX }

  // GL_VERSION_3_2
  GL_CONTEXT_CORE_PROFILE_BIT = $00000001;
  GL_CONTEXT_COMPATIBILITY_PROFILE_BIT = $00000002;
  GL_LINES_ADJACENCY = $000A;
  GL_LINE_STRIP_ADJACENCY = $000B;
  GL_TRIANGLES_ADJACENCY = $000C;
  GL_TRIANGLE_STRIP_ADJACENCY = $000D;
  GL_PROGRAM_POINT_SIZE = $8642;
  GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS = $8C29;
  GL_FRAMEBUFFER_ATTACHMENT_LAYERED = $8DA7;
  GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS = $8DA8;
  GL_GEOMETRY_SHADER = $8DD9;
  GL_GEOMETRY_VERTICES_OUT = $8916;
  GL_GEOMETRY_INPUT_TYPE = $8917;
  GL_GEOMETRY_OUTPUT_TYPE = $8918;
  GL_MAX_GEOMETRY_UNIFORM_COMPONENTS = $8DDF;
  GL_MAX_GEOMETRY_OUTPUT_VERTICES = $8DE0;
  GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS = $8DE1;
  GL_MAX_VERTEX_OUTPUT_COMPONENTS = $9122;
  GL_MAX_GEOMETRY_INPUT_COMPONENTS = $9123;
  GL_MAX_GEOMETRY_OUTPUT_COMPONENTS = $9124;
  GL_MAX_FRAGMENT_INPUT_COMPONENTS = $9125;
  GL_CONTEXT_PROFILE_MASK = $9126;
  { reuse GL_MAX_VARYING_COMPONENTS }
  { reuse GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER }
  { Reuse tokens from ARB_depth_clamp }
  { reuse GL_DEPTH_CLAMP }
  { Reuse tokens from ARB_draw_elements_base_vertex (none) }
  { Reuse tokens from ARB_fragment_coord_conventions (none) }
  { Reuse tokens from ARB_provoking_vertex }
  { reuse GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION }
  { reuse GL_FIRST_VERTEX_CONVENTION }
  { reuse GL_LAST_VERTEX_CONVENTION }
  { reuse GL_PROVOKING_VERTEX }
  { Reuse tokens from ARB_seamless_cube_map }
  { reuse GL_TEXTURE_CUBE_MAP_SEAMLESS }
  { Reuse tokens from ARB_sync }
  { reuse GL_MAX_SERVER_WAIT_TIMEOUT }
  { reuse GL_OBJECT_TYPE }
  { reuse GL_SYNC_CONDITION }
  { reuse GL_SYNC_STATUS }
  { reuse GL_SYNC_FLAGS }
  { reuse GL_SYNC_FENCE }
  { reuse GL_SYNC_GPU_COMMANDS_COMPLETE }
  { reuse GL_UNSIGNALED }
  { reuse GL_SIGNALED }
  { reuse GL_ALREADY_SIGNALED }
  { reuse GL_TIMEOUT_EXPIRED }
  { reuse GL_CONDITION_SATISFIED }
  { reuse GL_WAIT_FAILED }
  { reuse GL_TIMEOUT_IGNORED }
  { reuse GL_SYNC_FLUSH_COMMANDS_BIT }
  { reuse GL_TIMEOUT_IGNORED }
  { Reuse tokens from ARB_texture_multisample }
  { reuse GL_SAMPLE_POSITION }
  { reuse GL_SAMPLE_MASK }
  { reuse GL_SAMPLE_MASK_VALUE }
  { reuse GL_MAX_SAMPLE_MASK_WORDS }
  { reuse GL_TEXTURE_2D_MULTISAMPLE }
  { reuse GL_PROXY_TEXTURE_2D_MULTISAMPLE }
  { reuse GL_TEXTURE_2D_MULTISAMPLE_ARRAY }
  { reuse GL_PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY }
  { reuse GL_TEXTURE_BINDING_2D_MULTISAMPLE }
  { reuse GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY }
  { reuse GL_TEXTURE_SAMPLES }
  { reuse GL_TEXTURE_FIXED_SAMPLE_LOCATIONS }
  { reuse GL_SAMPLER_2D_MULTISAMPLE }
  { reuse GL_INT_SAMPLER_2D_MULTISAMPLE }
  { reuse GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE }
  { reuse GL_SAMPLER_2D_MULTISAMPLE_ARRAY }
  { reuse GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY }
  { reuse GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY }
  { reuse GL_MAX_COLOR_TEXTURE_SAMPLES }
  { reuse GL_MAX_DEPTH_TEXTURE_SAMPLES }
  { reuse GL_MAX_INTEGER_SAMPLES }
  { Don't need to reuse tokens from ARB_vertex_array_bgra since they're already in 1.2 core }

  // GL_VERSION_3_3
  GL_VERTEX_ATTRIB_ARRAY_DIVISOR = $88FE;
  { Reuse tokens from ARB_blend_func_extended }
  { reuse GL_SRC1_COLOR }
  { reuse GL_ONE_MINUS_SRC1_COLOR }
  { reuse GL_ONE_MINUS_SRC1_ALPHA }
  { reuse GL_MAX_DUAL_SOURCE_DRAW_BUFFERS }
  { Reuse tokens from ARB_explicit_attrib_location (none) }
  { Reuse tokens from ARB_occlusion_query2 }
  { reuse GL_ANY_SAMPLES_PASSED }
  { Reuse tokens from ARB_sampler_objects }
  { reuse GL_SAMPLER_BINDING }
  { Reuse tokens from ARB_shader_bit_encoding (none) }
  { Reuse tokens from ARB_texture_rgb10_a2ui }
  { reuse GL_RGB10_A2UI }
  { Reuse tokens from ARB_texture_swizzle }
  { reuse GL_TEXTURE_SWIZZLE_R }
  { reuse GL_TEXTURE_SWIZZLE_G }
  { reuse GL_TEXTURE_SWIZZLE_B }
  { reuse GL_TEXTURE_SWIZZLE_A }
  { reuse GL_TEXTURE_SWIZZLE_RGBA }
  { Reuse tokens from ARB_timer_query }
  { reuse GL_TIME_ELAPSED }
  { reuse GL_TIMESTAMP }
  { Reuse tokens from ARB_vertex_type_2_10_10_10_rev }
  { reuse GL_INT_2_10_10_10_REV }

  // GL_VERSION_4_0
  GL_SAMPLE_SHADING = $8C36;
  GL_MIN_SAMPLE_SHADING_VALUE = $8C37;
  GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET = $8E5E;
  GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET = $8E5F;
  GL_TEXTURE_CUBE_MAP_ARRAY = $9009;
  GL_TEXTURE_BINDING_CUBE_MAP_ARRAY = $900A;
  GL_PROXY_TEXTURE_CUBE_MAP_ARRAY = $900B;
  GL_SAMPLER_CUBE_MAP_ARRAY = $900C;
  GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW = $900D;
  GL_INT_SAMPLER_CUBE_MAP_ARRAY = $900E;
  GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY = $900F;
  { Reuse tokens from ARB_texture_query_lod (none) }
  { Reuse tokens from ARB_draw_buffers_blend (none) }
  { Reuse tokens from ARB_draw_indirect }
  { reuse GL_DRAW_INDIRECT_BUFFER }
  { reuse GL_DRAW_INDIRECT_BUFFER_BINDING }
  { Reuse tokens from ARB_gpu_shader5 }
  { reuse GL_GEOMETRY_SHADER_INVOCATIONS }
  { reuse GL_MAX_GEOMETRY_SHADER_INVOCATIONS }
  { reuse GL_MIN_FRAGMENT_INTERPOLATION_OFFSET }
  { reuse GL_MAX_FRAGMENT_INTERPOLATION_OFFSET }
  { reuse GL_FRAGMENT_INTERPOLATION_OFFSET_BITS }
  { reuse GL_MAX_VERTEX_STREAMS }
  { Reuse tokens from ARB_gpu_shader_fp64 }
  { reuse GL_DOUBLE_VEC2 }
  { reuse GL_DOUBLE_VEC3 }
  { reuse GL_DOUBLE_VEC4 }
  { reuse GL_DOUBLE_MAT2 }
  { reuse GL_DOUBLE_MAT3 }
  { reuse GL_DOUBLE_MAT4 }
  { reuse GL_DOUBLE_MAT2x3 }
  { reuse GL_DOUBLE_MAT2x4 }
  { reuse GL_DOUBLE_MAT3x2 }
  { reuse GL_DOUBLE_MAT3x4 }
  { reuse GL_DOUBLE_MAT4x2 }
  { reuse GL_DOUBLE_MAT4x3 }
  { Reuse tokens from ARB_shader_subroutine }
  { reuse GL_ACTIVE_SUBROUTINES }
  { reuse GL_ACTIVE_SUBROUTINE_UNIFORMS }
  { reuse GL_ACTIVE_SUBROUTINE_UNIFORM_LOCATIONS }
  { reuse GL_ACTIVE_SUBROUTINE_MAX_LENGTH }
  { reuse GL_ACTIVE_SUBROUTINE_UNIFORM_MAX_LENGTH }
  { reuse GL_MAX_SUBROUTINES }
  { reuse GL_MAX_SUBROUTINE_UNIFORM_LOCATIONS }
  { reuse GL_NUM_COMPATIBLE_SUBROUTINES }
  { reuse GL_COMPATIBLE_SUBROUTINES }
  { Reuse tokens from ARB_tessellation_shader }
  { reuse GL_PATCHES }
  { reuse GL_PATCH_VERTICES }
  { reuse GL_PATCH_DEFAULT_INNER_LEVEL }
  { reuse GL_PATCH_DEFAULT_OUTER_LEVEL }
  { reuse GL_TESS_CONTROL_OUTPUT_VERTICES }
  { reuse GL_TESS_GEN_MODE }
  { reuse GL_TESS_GEN_SPACING }
  { reuse GL_TESS_GEN_VERTEX_ORDER }
  { reuse GL_TESS_GEN_POINT_MODE }
  { reuse GL_ISOLINES }
  { reuse GL_FRACTIONAL_ODD }
  { reuse GL_FRACTIONAL_EVEN }
  { reuse GL_MAX_PATCH_VERTICES }
  { reuse GL_MAX_TESS_GEN_LEVEL }
  { reuse GL_MAX_TESS_CONTROL_UNIFORM_COMPONENTS }
  { reuse GL_MAX_TESS_EVALUATION_UNIFORM_COMPONENTS }
  { reuse GL_MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS }
  { reuse GL_MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS }
  { reuse GL_MAX_TESS_CONTROL_OUTPUT_COMPONENTS }
  { reuse GL_MAX_TESS_PATCH_COMPONENTS }
  { reuse GL_MAX_TESS_CONTROL_TOTAL_OUTPUT_COMPONENTS }
  { reuse GL_MAX_TESS_EVALUATION_OUTPUT_COMPONENTS }
  { reuse GL_MAX_TESS_CONTROL_UNIFORM_BLOCKS }
  { reuse GL_MAX_TESS_EVALUATION_UNIFORM_BLOCKS }
  { reuse GL_MAX_TESS_CONTROL_INPUT_COMPONENTS }
  { reuse GL_MAX_TESS_EVALUATION_INPUT_COMPONENTS }
  { reuse GL_MAX_COMBINED_TESS_CONTROL_UNIFORM_COMPONENTS }
  { reuse GL_MAX_COMBINED_TESS_EVALUATION_UNIFORM_COMPONENTS }
  { reuse GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_CONTROL_SHADER }
  { reuse GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_EVALUATION_SHADER }
  { reuse GL_TESS_EVALUATION_SHADER }
  { reuse GL_TESS_CONTROL_SHADER }
  { Reuse tokens from ARB_texture_buffer_object_rgb32 (none) }
  { Reuse tokens from ARB_transform_feedback2 }
  { reuse GL_TRANSFORM_FEEDBACK }
  { reuse GL_TRANSFORM_FEEDBACK_BUFFER_PAUSED }
  { reuse GL_TRANSFORM_FEEDBACK_BUFFER_ACTIVE }
  { reuse GL_TRANSFORM_FEEDBACK_BINDING }
  { Reuse tokens from ARB_transform_feedback3 }
  { reuse GL_MAX_TRANSFORM_FEEDBACK_BUFFERS }
  { reuse GL_MAX_VERTEX_STREAMS }

  // GL_VERSION_4_1
  { Reuse tokens from ARB_ES2_compatibility }
  { reuse GL_FIXED }
  { reuse GL_IMPLEMENTATION_COLOR_READ_TYPE }
  { reuse GL_IMPLEMENTATION_COLOR_READ_FORMAT }
  { reuse GL_LOW_FLOAT }
  { reuse GL_MEDIUM_FLOAT }
  { reuse GL_HIGH_FLOAT }
  { reuse GL_LOW_INT }
  { reuse GL_MEDIUM_INT }
  { reuse GL_HIGH_INT }
  { reuse GL_SHADER_COMPILER }
  { reuse GL_NUM_SHADER_BINARY_FORMATS }
  { reuse GL_MAX_VERTEX_UNIFORM_VECTORS }
  { reuse GL_MAX_VARYING_VECTORS }
  { reuse GL_MAX_FRAGMENT_UNIFORM_VECTORS }
  { Reuse tokens from ARB_get_program_binary }
  { reuse GL_PROGRAM_BINARY_RETRIEVABLE_HINT }
  { reuse GL_PROGRAM_BINARY_LENGTH }
  { reuse GL_NUM_PROGRAM_BINARY_FORMATS }
  { reuse GL_PROGRAM_BINARY_FORMATS }
  { Reuse tokens from ARB_separate_shader_objects }
  { reuse GL_VERTEX_SHADER_BIT }
  { reuse GL_FRAGMENT_SHADER_BIT }
  { reuse GL_GEOMETRY_SHADER_BIT }
  { reuse GL_TESS_CONTROL_SHADER_BIT }
  { reuse GL_TESS_EVALUATION_SHADER_BIT }
  { reuse GL_ALL_SHADER_BITS }
  { reuse GL_PROGRAM_SEPARABLE }
  { reuse GL_ACTIVE_PROGRAM }
  { reuse GL_PROGRAM_PIPELINE_BINDING }
  { Reuse tokens from ARB_shader_precision (none) }
  { Reuse tokens from ARB_vertex_attrib_64bit - all are in GL 3.0 and 4.0 already }
  { Reuse tokens from ARB_viewport_array - some are in GL 1.1 and ARB_provoking_vertex already }
  { reuse GL_MAX_VIEWPORTS }
  { reuse GL_VIEWPORT_SUBPIXEL_BITS }
  { reuse GL_VIEWPORT_BOUNDS_RANGE }
  { reuse GL_LAYER_PROVOKING_VERTEX }
  { reuse GL_VIEWPORT_INDEX_PROVOKING_VERTEX }
  { reuse GL_UNDEFINED_VERTEX }

  // GL_3DFX_multisample
  GL_MULTISAMPLE_3DFX = $86B2;
  GL_SAMPLE_BUFFERS_3DFX = $86B3;
  GL_SAMPLES_3DFX = $86B4;
  GL_MULTISAMPLE_BIT_3DFX = $20000000;

  // GL_3DFX_texture_compression_FXT1
  GL_COMPRESSED_RGB_FXT1_3DFX = $86B0;
  GL_COMPRESSED_RGBA_FXT1_3DFX = $86B1;

  // GL_APPLE_client_storage
  GL_UNPACK_CLIENT_STORAGE_APPLE = $85B2;

  // GL_APPLE_element_array
  GL_ELEMENT_ARRAY_APPLE = $8A0C;
  GL_ELEMENT_ARRAY_TYPE_APPLE = $8A0D;
  GL_ELEMENT_ARRAY_POINTER_APPLE = $8A0E;

  // GL_APPLE_fence
  GL_DRAW_PIXELS_APPLE = $8A0A;
  GL_FENCE_APPLE = $8A0B;

  // GL_APPLE_specular_vector
  GL_LIGHT_MODEL_SPECULAR_VECTOR_APPLE = $85B0;

  // GL_APPLE_transform_hint
  GL_TRANSFORM_HINT_APPLE = $85B1;

  // GL_APPLE_vertex_array_object
  GL_VERTEX_ARRAY_BINDING_APPLE = $85B5;

  // GL_APPLE_vertex_array_range
  GL_VERTEX_ARRAY_RANGE_APPLE = $851D;
  GL_VERTEX_ARRAY_RANGE_LENGTH_APPLE = $851E;
  GL_VERTEX_ARRAY_STORAGE_HINT_APPLE = $851F;
  GL_VERTEX_ARRAY_RANGE_POINTER_APPLE = $8521;
  GL_STORAGE_CLIENT_APPLE = $85B4;
  GL_STORAGE_CACHED_APPLE = $85BE;
  GL_STORAGE_SHARED_APPLE = $85BF;

  // GL_APPLE_ycbcr_422
  GL_YCBCR_422_APPLE = $85B9;
  GL_UNSIGNED_SHORT_8_8_APPLE = $85BA;
  GL_UNSIGNED_SHORT_8_8_REV_APPLE = $85BB;

  // GL_APPLE_texture_range
  GL_TEXTURE_RANGE_LENGTH_APPLE = $85B7;
  GL_TEXTURE_RANGE_POINTER_APPLE = $85B8;
  GL_TEXTURE_STORAGE_HINT_APPLE = $85BC;
  GL_STORAGE_PRIVATE_APPLE = $85BD;
  { reuse GL_STORAGE_CACHED_APPLE }
  { reuse GL_STORAGE_SHARED_APPLE }

  // GL_APPLE_float_pixels
  GL_HALF_APPLE = $140B;
  GL_RGBA_FLOAT32_APPLE = $8814;
  GL_RGB_FLOAT32_APPLE = $8815;
  GL_ALPHA_FLOAT32_APPLE = $8816;
  GL_INTENSITY_FLOAT32_APPLE = $8817;
  GL_LUMINANCE_FLOAT32_APPLE = $8818;
  GL_LUMINANCE_ALPHA_FLOAT32_APPLE = $8819;
  GL_RGBA_FLOAT16_APPLE = $881A;
  GL_RGB_FLOAT16_APPLE = $881B;
  GL_ALPHA_FLOAT16_APPLE = $881C;
  GL_INTENSITY_FLOAT16_APPLE = $881D;
  GL_LUMINANCE_FLOAT16_APPLE = $881E;
  GL_LUMINANCE_ALPHA_FLOAT16_APPLE = $881F;
  GL_COLOR_FLOAT_APPLE = $8A0F;

  // GL_APPLE_vertex_program_evaluators
  GL_VERTEX_ATTRIB_MAP1_APPLE = $8A00;
  GL_VERTEX_ATTRIB_MAP2_APPLE = $8A01;
  GL_VERTEX_ATTRIB_MAP1_SIZE_APPLE = $8A02;
  GL_VERTEX_ATTRIB_MAP1_COEFF_APPLE = $8A03;
  GL_VERTEX_ATTRIB_MAP1_ORDER_APPLE = $8A04;
  GL_VERTEX_ATTRIB_MAP1_DOMAIN_APPLE = $8A05;
  GL_VERTEX_ATTRIB_MAP2_SIZE_APPLE = $8A06;
  GL_VERTEX_ATTRIB_MAP2_COEFF_APPLE = $8A07;
  GL_VERTEX_ATTRIB_MAP2_ORDER_APPLE = $8A08;
  GL_VERTEX_ATTRIB_MAP2_DOMAIN_APPLE = $8A09;

  // GL_APPLE_aux_depth_stencil
  GL_AUX_DEPTH_STENCIL_APPLE = $8A14;

  // GL_APPLE_object_purgeable
  GL_BUFFER_OBJECT_APPLE = $85B3;
  GL_RELEASED_APPLE = $8A19;
  GL_VOLATILE_APPLE = $8A1A;
  GL_RETAINED_APPLE = $8A1B;
  GL_UNDEFINED_APPLE = $8A1C;
  GL_PURGEABLE_APPLE = $8A1D;

  // GL_APPLE_row_bytes
  GL_PACK_ROW_BYTES_APPLE = $8A15;
  GL_UNPACK_ROW_BYTES_APPLE = $8A16;
  
  // GL_APPLE_rgb_422
  { reuse GL_UNSIGNED_SHORT_8_8_APPLE }
  { reuse GL_UNSIGNED_SHORT_8_8_REV_APPLE }  
  
  // GL_ARB_depth_texture
  GL_DEPTH_COMPONENT16_ARB = $81A5;
  GL_DEPTH_COMPONENT24_ARB = $81A6;
  GL_DEPTH_COMPONENT32_ARB = $81A7;
  GL_TEXTURE_DEPTH_SIZE_ARB = $884A;
  GL_DEPTH_TEXTURE_MODE_ARB = $884B;

  // GL_ARB_fragment_program
  GL_FRAGMENT_PROGRAM_ARB = $8804;
  GL_PROGRAM_ALU_INSTRUCTIONS_ARB = $8805;
  GL_PROGRAM_TEX_INSTRUCTIONS_ARB = $8806;
  GL_PROGRAM_TEX_INDIRECTIONS_ARB = $8807;
  GL_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB = $8808;
  GL_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB = $8809;
  GL_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB = $880A;
  GL_MAX_PROGRAM_ALU_INSTRUCTIONS_ARB = $880B;
  GL_MAX_PROGRAM_TEX_INSTRUCTIONS_ARB = $880C;
  GL_MAX_PROGRAM_TEX_INDIRECTIONS_ARB = $880D;
  GL_MAX_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB = $880E;
  GL_MAX_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB = $880F;
  GL_MAX_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB = $8810;
  GL_MAX_TEXTURE_COORDS_ARB = $8871;
  GL_MAX_TEXTURE_IMAGE_UNITS_ARB = $8872;

  // GL_ARB_imaging
  GL_CONSTANT_COLOR_ARB = $8001;
  GL_ONE_MINUS_CONSTANT_COLOR = $8002;
  GL_CONSTANT_ALPHA = $8003;
  GL_ONE_MINUS_CONSTANT_ALPHA = $8004;
  GL_BLEND_COLOR = $8005;
  GL_FUNC_ADD = $8006;
  GL_MIN = $8007;
  GL_MAX = $8008;
  GL_BLEND_EQUATION = $8009;
  GL_FUNC_SUBTRACT = $800A;
  GL_FUNC_REVERSE_SUBTRACT = $800B;
{$ifdef DGL_DEPRECATED}
  GL_CONVOLUTION_1D = $8010;
  GL_CONVOLUTION_2D = $8011;
  GL_SEPARABLE_2D = $8012;
  GL_CONVOLUTION_BORDER_MODE = $8013;
  GL_CONVOLUTION_FILTER_SCALE = $8014;
  GL_CONVOLUTION_FILTER_BIAS = $8015;
  GL_REDUCE = $8016;
  GL_CONVOLUTION_FORMAT = $8017;
  GL_CONVOLUTION_WIDTH = $8018;
  GL_CONVOLUTION_HEIGHT = $8019;
  GL_MAX_CONVOLUTION_WIDTH = $801A;
  GL_MAX_CONVOLUTION_HEIGHT = $801B;
  GL_POST_CONVOLUTION_RED_SCALE = $801C;
  GL_POST_CONVOLUTION_GREEN_SCALE = $801D;
  GL_POST_CONVOLUTION_BLUE_SCALE = $801E;
  GL_POST_CONVOLUTION_ALPHA_SCALE = $801F;
  GL_POST_CONVOLUTION_RED_BIAS = $8020;
  GL_POST_CONVOLUTION_GREEN_BIAS = $8021;
  GL_POST_CONVOLUTION_BLUE_BIAS = $8022;
  GL_POST_CONVOLUTION_ALPHA_BIAS = $8023;
  GL_HISTOGRAM = $8024;
  GL_PROXY_HISTOGRAM = $8025;
  GL_HISTOGRAM_WIDTH = $8026;
  GL_HISTOGRAM_FORMAT = $8027;
  GL_HISTOGRAM_RED_SIZE = $8028;
  GL_HISTOGRAM_GREEN_SIZE = $8029;
  GL_HISTOGRAM_BLUE_SIZE = $802A;
  GL_HISTOGRAM_ALPHA_SIZE = $802B;
  GL_HISTOGRAM_LUMINANCE_SIZE = $802C;
  GL_HISTOGRAM_SINK = $802D;
  GL_MINMAX = $802E;
  GL_MINMAX_FORMAT = $802F;
  GL_MINMAX_SINK = $8030;
  GL_TABLE_TOO_LARGE = $8031;
  GL_COLOR_MATRIX = $80B1;
  GL_COLOR_MATRIX_STACK_DEPTH = $80B2;
  GL_MAX_COLOR_MATRIX_STACK_DEPTH = $80B3;
  GL_POST_COLOR_MATRIX_RED_SCALE = $80B4;
  GL_POST_COLOR_MATRIX_GREEN_SCALE = $80B5;
  GL_POST_COLOR_MATRIX_BLUE_SCALE = $80B6;
  GL_POST_COLOR_MATRIX_ALPHA_SCALE = $80B7;
  GL_POST_COLOR_MATRIX_RED_BIAS = $80B8;
  GL_POST_COLOR_MATRIX_GREEN_BIAS = $80B9;
  GL_POST_COLOR_MATRIX_BLUE_BIAS = $80BA;
  GL_POST_COLOR_MATRIX_ALPHA_BIAS = $80BB;
  GL_COLOR_TABLE = $80D0;
  GL_POST_CONVOLUTION_COLOR_TABLE = $80D1;
  GL_POST_COLOR_MATRIX_COLOR_TABLE = $80D2;
  GL_PROXY_COLOR_TABLE = $80D3;
  GL_PROXY_POST_CONVOLUTION_COLOR_TABLE = $80D4;
  GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE = $80D5;
  GL_COLOR_TABLE_SCALE = $80D6;
  GL_COLOR_TABLE_BIAS = $80D7;
  GL_COLOR_TABLE_FORMAT = $80D8;
  GL_COLOR_TABLE_WIDTH = $80D9;
  GL_COLOR_TABLE_RED_SIZE = $80DA;
  GL_COLOR_TABLE_GREEN_SIZE = $80DB;
  GL_COLOR_TABLE_BLUE_SIZE = $80DC;
  GL_COLOR_TABLE_ALPHA_SIZE = $80DD;
  GL_COLOR_TABLE_LUMINANCE_SIZE = $80DE;
  GL_COLOR_TABLE_INTENSITY_SIZE = $80DF;
  GL_CONSTANT_BORDER = $8151;
  GL_REPLICATE_BORDER = $8153;
  GL_CONVOLUTION_BORDER_COLOR = $8154;
{$endif}

  // GL_ARB_matrix_palette
  GL_MATRIX_PALETTE_ARB = $8840;
  GL_MAX_MATRIX_PALETTE_STACK_DEPTH_ARB = $8841;
  GL_MAX_PALETTE_MATRICES_ARB = $8842;
  GL_CURRENT_PALETTE_MATRIX_ARB = $8843;
  GL_MATRIX_INDEX_ARRAY_ARB = $8844;
  GL_CURRENT_MATRIX_INDEX_ARB = $8845;
  GL_MATRIX_INDEX_ARRAY_SIZE_ARB = $8846;
  GL_MATRIX_INDEX_ARRAY_TYPE_ARB = $8847;
  GL_MATRIX_INDEX_ARRAY_STRIDE_ARB = $8848;
  GL_MATRIX_INDEX_ARRAY_POINTER_ARB = $8849;

  // GL_ARB_multisample
  GL_MULTISAMPLE_ARB = $809D;
  GL_SAMPLE_ALPHA_TO_COVERAGE_ARB = $809E;
  GL_SAMPLE_ALPHA_TO_ONE_ARB = $809F;
  GL_SAMPLE_COVERAGE_ARB = $80A0;
  GL_SAMPLE_BUFFERS_ARB = $80A8;
  GL_SAMPLES_ARB = $80A9;
  GL_SAMPLE_COVERAGE_VALUE_ARB = $80AA;
  GL_SAMPLE_COVERAGE_INVERT_ARB = $80AB;
  GL_MULTISAMPLE_BIT_ARB = $20000000;

  // GL_ARB_multitexture
  GL_TEXTURE0_ARB = $84C0;
  GL_TEXTURE1_ARB = $84C1;
  GL_TEXTURE2_ARB = $84C2;
  GL_TEXTURE3_ARB = $84C3;
  GL_TEXTURE4_ARB = $84C4;
  GL_TEXTURE5_ARB = $84C5;
  GL_TEXTURE6_ARB = $84C6;
  GL_TEXTURE7_ARB = $84C7;
  GL_TEXTURE8_ARB = $84C8;
  GL_TEXTURE9_ARB = $84C9;
  GL_TEXTURE10_ARB = $84CA;
  GL_TEXTURE11_ARB = $84CB;
  GL_TEXTURE12_ARB = $84CC;
  GL_TEXTURE13_ARB = $84CD;
  GL_TEXTURE14_ARB = $84CE;
  GL_TEXTURE15_ARB = $84CF;
  GL_TEXTURE16_ARB = $84D0;
  GL_TEXTURE17_ARB = $84D1;
  GL_TEXTURE18_ARB = $84D2;
  GL_TEXTURE19_ARB = $84D3;
  GL_TEXTURE20_ARB = $84D4;
  GL_TEXTURE21_ARB = $84D5;
  GL_TEXTURE22_ARB = $84D6;
  GL_TEXTURE23_ARB = $84D7;
  GL_TEXTURE24_ARB = $84D8;
  GL_TEXTURE25_ARB = $84D9;
  GL_TEXTURE26_ARB = $84DA;
  GL_TEXTURE27_ARB = $84DB;
  GL_TEXTURE28_ARB = $84DC;
  GL_TEXTURE29_ARB = $84DD;
  GL_TEXTURE30_ARB = $84DE;
  GL_TEXTURE31_ARB = $84DF;
  GL_ACTIVE_TEXTURE_ARB = $84E0;
  GL_CLIENT_ACTIVE_TEXTURE_ARB = $84E1;
  GL_MAX_TEXTURE_UNITS_ARB = $84E2;

  // GL_ARB_point_parameters
  GL_POINT_SIZE_MIN_ARB = $8126;
  GL_POINT_SIZE_MAX_ARB = $8127;
  GL_POINT_FADE_THRESHOLD_SIZE_ARB = $8128;
  GL_POINT_DISTANCE_ATTENUATION_ARB = $8129;

  // GL_ARB_shadow
  GL_TEXTURE_COMPARE_MODE_ARB = $884C;
  GL_TEXTURE_COMPARE_FUNC_ARB = $884D;
  GL_COMPARE_R_TO_TEXTURE_ARB = $884E;

  // GL_ARB_shadow_ambient
  GL_TEXTURE_COMPARE_FAIL_VALUE_ARB = $80BF;

  // GL_ARB_texture_border_clamp
  GL_CLAMP_TO_BORDER_ARB = $812D;

  // GL_ARB_texture_compression
  GL_COMPRESSED_ALPHA_ARB = $84E9;
  GL_COMPRESSED_LUMINANCE_ARB = $84EA;
  GL_COMPRESSED_LUMINANCE_ALPHA_ARB = $84EB;
  GL_COMPRESSED_INTENSITY_ARB = $84EC;
  GL_COMPRESSED_RGB_ARB = $84ED;
  GL_COMPRESSED_RGBA_ARB = $84EE;
  GL_TEXTURE_COMPRESSION_HINT_ARB = $84EF;
  GL_TEXTURE_COMPRESSED_IMAGE_SIZE_ARB = $86A0;
  GL_TEXTURE_COMPRESSED_ARB = $86A1;
  GL_NUM_COMPRESSED_TEXTURE_FORMATS_ARB = $86A2;
  GL_COMPRESSED_TEXTURE_FORMATS_ARB = $86A3;

  // GL_ARB_texture_cube_map
  GL_NORMAL_MAP_ARB = $8511;
  GL_REFLECTION_MAP_ARB = $8512;
  GL_TEXTURE_CUBE_MAP_ARB = $8513;
  GL_TEXTURE_BINDING_CUBE_MAP_ARB = $8514;
  GL_TEXTURE_CUBE_MAP_POSITIVE_X_ARB = $8515;
  GL_TEXTURE_CUBE_MAP_NEGATIVE_X_ARB = $8516;
  GL_TEXTURE_CUBE_MAP_POSITIVE_Y_ARB = $8517;
  GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_ARB = $8518;
  GL_TEXTURE_CUBE_MAP_POSITIVE_Z_ARB = $8519;
  GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_ARB = $851A;
  GL_PROXY_TEXTURE_CUBE_MAP_ARB = $851B;
  GL_MAX_CUBE_MAP_TEXTURE_SIZE_ARB = $851C;

  // GL_ARB_texture_env_combine
  GL_COMBINE_ARB = $8570;
  GL_COMBINE_RGB_ARB = $8571;
  GL_COMBINE_ALPHA_ARB = $8572;
  GL_SOURCE0_RGB_ARB = $8580;
  GL_SOURCE1_RGB_ARB = $8581;
  GL_SOURCE2_RGB_ARB = $8582;
  GL_SOURCE0_ALPHA_ARB = $8588;
  GL_SOURCE1_ALPHA_ARB = $8589;
  GL_SOURCE2_ALPHA_ARB = $858A;
  GL_OPERAND0_RGB_ARB = $8590;
  GL_OPERAND1_RGB_ARB = $8591;
  GL_OPERAND2_RGB_ARB = $8592;
  GL_OPERAND0_ALPHA_ARB = $8598;
  GL_OPERAND1_ALPHA_ARB = $8599;
  GL_OPERAND2_ALPHA_ARB = $859A;
  GL_RGB_SCALE_ARB = $8573;
  GL_ADD_SIGNED_ARB = $8574;
  GL_INTERPOLATE_ARB = $8575;
  GL_SUBTRACT_ARB = $84E7;
  GL_CONSTANT_ARB = $8576;
  GL_PRIMARY_COLOR_ARB = $8577;
  GL_PREVIOUS_ARB = $8578;

  // GL_ARB_texture_env_dot3
  GL_DOT3_RGB_ARB = $86AE;
  GL_DOT3_RGBA_ARB = $86AF;

  // GL_ARB_texture_mirrored_repeat
  GL_MIRRORED_REPEAT_ARB = $8370;

  // GL_ARB_transpose_matrix
  GL_TRANSPOSE_MODELVIEW_MATRIX_ARB = $84E3;
  GL_TRANSPOSE_PROJECTION_MATRIX_ARB = $84E4;
  GL_TRANSPOSE_TEXTURE_MATRIX_ARB = $84E5;
  GL_TRANSPOSE_COLOR_MATRIX_ARB = $84E6;

  // GL_ARB_vertex_blend
  GL_MAX_VERTEX_UNITS_ARB = $86A4;
  GL_ACTIVE_VERTEX_UNITS_ARB = $86A5;
  GL_WEIGHT_SUM_UNITY_ARB = $86A6;
  GL_VERTEX_BLEND_ARB = $86A7;
  GL_CURRENT_WEIGHT_ARB = $86A8;
  GL_WEIGHT_ARRAY_TYPE_ARB = $86A9;
  GL_WEIGHT_ARRAY_STRIDE_ARB = $86AA;
  GL_WEIGHT_ARRAY_SIZE_ARB = $86AB;
  GL_WEIGHT_ARRAY_POINTER_ARB = $86AC;
  GL_WEIGHT_ARRAY_ARB = $86AD;
  GL_MODELVIEW0_ARB = $1700;
  GL_MODELVIEW1_ARB = $850A;
  GL_MODELVIEW2_ARB = $8722;
  GL_MODELVIEW3_ARB = $8723;
  GL_MODELVIEW4_ARB = $8724;
  GL_MODELVIEW5_ARB = $8725;
  GL_MODELVIEW6_ARB = $8726;
  GL_MODELVIEW7_ARB = $8727;
  GL_MODELVIEW8_ARB = $8728;
  GL_MODELVIEW9_ARB = $8729;
  GL_MODELVIEW10_ARB = $872A;
  GL_MODELVIEW11_ARB = $872B;
  GL_MODELVIEW12_ARB = $872C;
  GL_MODELVIEW13_ARB = $872D;
  GL_MODELVIEW14_ARB = $872E;
  GL_MODELVIEW15_ARB = $872F;
  GL_MODELVIEW16_ARB = $8730;
  GL_MODELVIEW17_ARB = $8731;
  GL_MODELVIEW18_ARB = $8732;
  GL_MODELVIEW19_ARB = $8733;
  GL_MODELVIEW20_ARB = $8734;
  GL_MODELVIEW21_ARB = $8735;
  GL_MODELVIEW22_ARB = $8736;
  GL_MODELVIEW23_ARB = $8737;
  GL_MODELVIEW24_ARB = $8738;
  GL_MODELVIEW25_ARB = $8739;
  GL_MODELVIEW26_ARB = $873A;
  GL_MODELVIEW27_ARB = $873B;
  GL_MODELVIEW28_ARB = $873C;
  GL_MODELVIEW29_ARB = $873D;
  GL_MODELVIEW30_ARB = $873E;
  GL_MODELVIEW31_ARB = $873F;

  // GL_ARB_vertex_buffer_object
  GL_BUFFER_SIZE_ARB = $8764;
  GL_BUFFER_USAGE_ARB = $8765;
  GL_ARRAY_BUFFER_ARB = $8892;
  GL_ELEMENT_ARRAY_BUFFER_ARB = $8893;
  GL_ARRAY_BUFFER_BINDING_ARB = $8894;
  GL_ELEMENT_ARRAY_BUFFER_BINDING_ARB = $8895;
  GL_VERTEX_ARRAY_BUFFER_BINDING_ARB = $8896;
  GL_NORMAL_ARRAY_BUFFER_BINDING_ARB = $8897;
  GL_COLOR_ARRAY_BUFFER_BINDING_ARB = $8898;
  GL_INDEX_ARRAY_BUFFER_BINDING_ARB = $8899;
  GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING_ARB = $889A;
  GL_EDGE_FLAG_ARRAY_BUFFER_BINDING_ARB = $889B;
  GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING_ARB = $889C;
  GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING_ARB = $889D;
  GL_WEIGHT_ARRAY_BUFFER_BINDING_ARB = $889E;
  GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING_ARB = $889F;
  GL_READ_ONLY_ARB = $88B8;
  GL_WRITE_ONLY_ARB = $88B9;
  GL_READ_WRITE_ARB = $88BA;
  GL_BUFFER_ACCESS_ARB = $88BB;
  GL_BUFFER_MAPPED_ARB = $88BC;
  GL_BUFFER_MAP_POINTER_ARB = $88BD;
  GL_STREAM_DRAW_ARB = $88E0;
  GL_STREAM_READ_ARB = $88E1;
  GL_STREAM_COPY_ARB = $88E2;
  GL_STATIC_DRAW_ARB = $88E4;
  GL_STATIC_READ_ARB = $88E5;
  GL_STATIC_COPY_ARB = $88E6;
  GL_DYNAMIC_DRAW_ARB = $88E8;
  GL_DYNAMIC_READ_ARB = $88E9;
  GL_DYNAMIC_COPY_ARB = $88EA;

  // GL_ARB_vertex_program
  GL_COLOR_SUM_ARB = $8458;
  GL_VERTEX_PROGRAM_ARB = $8620;
  GL_VERTEX_ATTRIB_ARRAY_ENABLED_ARB = $8622;
  GL_VERTEX_ATTRIB_ARRAY_SIZE_ARB = $8623;
  GL_VERTEX_ATTRIB_ARRAY_STRIDE_ARB = $8624;
  GL_VERTEX_ATTRIB_ARRAY_TYPE_ARB = $8625;
  GL_CURRENT_VERTEX_ATTRIB_ARB = $8626;
  GL_PROGRAM_LENGTH_ARB = $8627;
  GL_PROGRAM_STRING_ARB = $8628;
  GL_MAX_PROGRAM_MATRIX_STACK_DEPTH_ARB = $862E;
  GL_MAX_PROGRAM_MATRICES_ARB = $862F;
  GL_CURRENT_MATRIX_STACK_DEPTH_ARB = $8640;
  GL_CURRENT_MATRIX_ARB = $8641;
  GL_VERTEX_PROGRAM_POINT_SIZE_ARB = $8642;
  GL_VERTEX_PROGRAM_TWO_SIDE_ARB = $8643;
  GL_VERTEX_ATTRIB_ARRAY_POINTER_ARB = $8645;
  GL_PROGRAM_ERROR_POSITION_ARB = $864B;
  GL_PROGRAM_BINDING_ARB = $8677;
  GL_MAX_VERTEX_ATTRIBS_ARB = $8869;
  GL_VERTEX_ATTRIB_ARRAY_NORMALIZED_ARB = $886A;
  GL_PROGRAM_ERROR_STRING_ARB = $8874;
  GL_PROGRAM_FORMAT_ASCII_ARB = $8875;
  GL_PROGRAM_FORMAT_ARB = $8876;
  GL_PROGRAM_INSTRUCTIONS_ARB = $88A0;
  GL_MAX_PROGRAM_INSTRUCTIONS_ARB = $88A1;
  GL_PROGRAM_NATIVE_INSTRUCTIONS_ARB = $88A2;
  GL_MAX_PROGRAM_NATIVE_INSTRUCTIONS_ARB = $88A3;
  GL_PROGRAM_TEMPORARIES_ARB = $88A4;
  GL_MAX_PROGRAM_TEMPORARIES_ARB = $88A5;
  GL_PROGRAM_NATIVE_TEMPORARIES_ARB = $88A6;
  GL_MAX_PROGRAM_NATIVE_TEMPORARIES_ARB = $88A7;
  GL_PROGRAM_PARAMETERS_ARB = $88A8;
  GL_MAX_PROGRAM_PARAMETERS_ARB = $88A9;
  GL_PROGRAM_NATIVE_PARAMETERS_ARB = $88AA;
  GL_MAX_PROGRAM_NATIVE_PARAMETERS_ARB = $88AB;
  GL_PROGRAM_ATTRIBS_ARB = $88AC;
  GL_MAX_PROGRAM_ATTRIBS_ARB = $88AD;
  GL_PROGRAM_NATIVE_ATTRIBS_ARB = $88AE;
  GL_MAX_PROGRAM_NATIVE_ATTRIBS_ARB = $88AF;
  GL_PROGRAM_ADDRESS_REGISTERS_ARB = $88B0;
  GL_MAX_PROGRAM_ADDRESS_REGISTERS_ARB = $88B1;
  GL_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB = $88B2;
  GL_MAX_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB = $88B3;
  GL_MAX_PROGRAM_LOCAL_PARAMETERS_ARB = $88B4;
  GL_MAX_PROGRAM_ENV_PARAMETERS_ARB = $88B5;
  GL_PROGRAM_UNDER_NATIVE_LIMITS_ARB = $88B6;
  GL_TRANSPOSE_CURRENT_MATRIX_ARB = $88B7;
  GL_MATRIX0_ARB = $88C0;
  GL_MATRIX1_ARB = $88C1;
  GL_MATRIX2_ARB = $88C2;
  GL_MATRIX3_ARB = $88C3;
  GL_MATRIX4_ARB = $88C4;
  GL_MATRIX5_ARB = $88C5;
  GL_MATRIX6_ARB = $88C6;
  GL_MATRIX7_ARB = $88C7;
  GL_MATRIX8_ARB = $88C8;
  GL_MATRIX9_ARB = $88C9;
  GL_MATRIX10_ARB = $88CA;
  GL_MATRIX11_ARB = $88CB;
  GL_MATRIX12_ARB = $88CC;
  GL_MATRIX13_ARB = $88CD;
  GL_MATRIX14_ARB = $88CE;
  GL_MATRIX15_ARB = $88CF;
  GL_MATRIX16_ARB = $88D0;
  GL_MATRIX17_ARB = $88D1;
  GL_MATRIX18_ARB = $88D2;
  GL_MATRIX19_ARB = $88D3;
  GL_MATRIX20_ARB = $88D4;
  GL_MATRIX21_ARB = $88D5;
  GL_MATRIX22_ARB = $88D6;
  GL_MATRIX23_ARB = $88D7;
  GL_MATRIX24_ARB = $88D8;
  GL_MATRIX25_ARB = $88D9;
  GL_MATRIX26_ARB = $88DA;
  GL_MATRIX27_ARB = $88DB;
  GL_MATRIX28_ARB = $88DC;
  GL_MATRIX29_ARB = $88DD;
  GL_MATRIX30_ARB = $88DE;
  GL_MATRIX31_ARB = $88DF;

  // GL_ARB_draw_buffers
  GL_MAX_DRAW_BUFFERS_ARB = $8824;
  GL_DRAW_BUFFER0_ARB = $8825;
  GL_DRAW_BUFFER1_ARB = $8826;
  GL_DRAW_BUFFER2_ARB = $8827;
  GL_DRAW_BUFFER3_ARB = $8828;
  GL_DRAW_BUFFER4_ARB = $8829;
  GL_DRAW_BUFFER5_ARB = $882A;
  GL_DRAW_BUFFER6_ARB = $882B;
  GL_DRAW_BUFFER7_ARB = $882C;
  GL_DRAW_BUFFER8_ARB = $882D;
  GL_DRAW_BUFFER9_ARB = $882E;
  GL_DRAW_BUFFER10_ARB = $882F;
  GL_DRAW_BUFFER11_ARB = $8830;
  GL_DRAW_BUFFER12_ARB = $8831;
  GL_DRAW_BUFFER13_ARB = $8832;
  GL_DRAW_BUFFER14_ARB = $8833;
  GL_DRAW_BUFFER15_ARB = $8834;

  // GL_ARB_texture_rectangle
  GL_TEXTURE_RECTANGLE_ARB = $84F5;
  GL_TEXTURE_BINDING_RECTANGLE_ARB = $84F6;
  GL_PROXY_TEXTURE_RECTANGLE_ARB = $84F7;
  GL_MAX_RECTANGLE_TEXTURE_SIZE_ARB = $84F8;

  // GL_ARB_color_buffer_float
  GL_RGBA_FLOAT_MODE_ARB = $8820;
  GL_CLAMP_VERTEX_COLOR_ARB = $891A;
  GL_CLAMP_FRAGMENT_COLOR_ARB = $891B;
  GL_CLAMP_READ_COLOR_ARB = $891C;
  GL_FIXED_ONLY_ARB = $891D;
  WGL_TYPE_RGBA_FLOAT_ARB = $21A0;
  GLX_RGBA_FLOAT_TYPE = $20B9;
  GLX_RGBA_FLOAT_BIT = $00000004;

  // GL_ARB_half_float_pixel
  GL_HALF_FLOAT_ARB = $140B;

  // GL_ARB_texture_float
  GL_TEXTURE_RED_TYPE_ARB = $8C10;
  GL_TEXTURE_GREEN_TYPE_ARB = $8C11;
  GL_TEXTURE_BLUE_TYPE_ARB = $8C12;
  GL_TEXTURE_ALPHA_TYPE_ARB = $8C13;
  GL_TEXTURE_LUMINANCE_TYPE_ARB = $8C14;
  GL_TEXTURE_INTENSITY_TYPE_ARB = $8C15;
  GL_TEXTURE_DEPTH_TYPE_ARB = $8C16;
  GL_UNSIGNED_NORMALIZED_ARB = $8C17;
  GL_RGBA32F_ARB = $8814;
  GL_RGB32F_ARB = $8815;
  GL_ALPHA32F_ARB = $8816;
  GL_INTENSITY32F_ARB = $8817;
  GL_LUMINANCE32F_ARB = $8818;
  GL_LUMINANCE_ALPHA32F_ARB = $8819;
  GL_RGBA16F_ARB = $881A;
  GL_RGB16F_ARB = $881B;
  GL_ALPHA16F_ARB = $881C;
  GL_INTENSITY16F_ARB = $881D;
  GL_LUMINANCE16F_ARB = $881E;
  GL_LUMINANCE_ALPHA16F_ARB = $881F;

  // GL_ARB_pixel_buffer_object
  GL_PIXEL_PACK_BUFFER_ARB = $88EB;
  GL_PIXEL_UNPACK_BUFFER_ARB = $88EC;
  GL_PIXEL_PACK_BUFFER_BINDING_ARB = $88ED;
  GL_PIXEL_UNPACK_BUFFER_BINDING_ARB = $88EF;

  // GL_ARB_depth_buffer_float
  GL_DEPTH_COMPONENT32F = $8CAC;
  GL_DEPTH32F_STENCIL8 = $8CAD;
  GL_FLOAT_32_UNSIGNED_INT_24_8_REV = $8DAD;

  // GL_ARB_framebuffer_object
  GL_INVALID_FRAMEBUFFER_OPERATION = $0506;
  GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = $8210;
  GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = $8211;
  GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE = $8212;
  GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = $8213;
  GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = $8214;
  GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = $8215;
  GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = $8216;
  GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = $8217;
  GL_FRAMEBUFFER_DEFAULT = $8218;
  GL_FRAMEBUFFER_UNDEFINED = $8219;
  GL_DEPTH_STENCIL_ATTACHMENT = $821A;
  GL_MAX_RENDERBUFFER_SIZE = $84E8;
  GL_DEPTH_STENCIL = $84F9;
  GL_UNSIGNED_INT_24_8 = $84FA;
  GL_DEPTH24_STENCIL8 = $88F0;
  GL_TEXTURE_STENCIL_SIZE = $88F1;
  GL_TEXTURE_RED_TYPE = $8C10;
  GL_TEXTURE_GREEN_TYPE = $8C11;
  GL_TEXTURE_BLUE_TYPE = $8C12;
  GL_TEXTURE_ALPHA_TYPE = $8C13;
  GL_TEXTURE_DEPTH_TYPE = $8C16;
  GL_UNSIGNED_NORMALIZED = $8C17;
  GL_FRAMEBUFFER_BINDING = $8CA6;
  GL_DRAW_FRAMEBUFFER_BINDING = GL_FRAMEBUFFER_BINDING;
  GL_RENDERBUFFER_BINDING = $8CA7;
  GL_READ_FRAMEBUFFER = $8CA8;
  GL_DRAW_FRAMEBUFFER = $8CA9;
  GL_READ_FRAMEBUFFER_BINDING = $8CAA;
  GL_RENDERBUFFER_SAMPLES = $8CAB;
  GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = $8CD0;
  GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = $8CD1;
  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = $8CD2;
  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = $8CD3;
  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = $8CD4;
  GL_FRAMEBUFFER_COMPLETE = $8CD5;
  GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT = $8CD6;
  GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = $8CD7;
  GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER = $8CDB;
  GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER = $8CDC;
  GL_FRAMEBUFFER_UNSUPPORTED = $8CDD;
  GL_MAX_COLOR_ATTACHMENTS = $8CDF;
  GL_COLOR_ATTACHMENT0 = $8CE0;
  GL_COLOR_ATTACHMENT1 = $8CE1;
  GL_COLOR_ATTACHMENT2 = $8CE2;
  GL_COLOR_ATTACHMENT3 = $8CE3;
  GL_COLOR_ATTACHMENT4 = $8CE4;
  GL_COLOR_ATTACHMENT5 = $8CE5;
  GL_COLOR_ATTACHMENT6 = $8CE6;
  GL_COLOR_ATTACHMENT7 = $8CE7;
  GL_COLOR_ATTACHMENT8 = $8CE8;
  GL_COLOR_ATTACHMENT9 = $8CE9;
  GL_COLOR_ATTACHMENT10 = $8CEA;
  GL_COLOR_ATTACHMENT11 = $8CEB;
  GL_COLOR_ATTACHMENT12 = $8CEC;
  GL_COLOR_ATTACHMENT13 = $8CED;
  GL_COLOR_ATTACHMENT14 = $8CEE;
  GL_COLOR_ATTACHMENT15 = $8CEF;
  GL_DEPTH_ATTACHMENT = $8D00;
  GL_STENCIL_ATTACHMENT = $8D20;
  GL_FRAMEBUFFER = $8D40;
  GL_RENDERBUFFER = $8D41;
  GL_RENDERBUFFER_WIDTH = $8D42;
  GL_RENDERBUFFER_HEIGHT = $8D43;
  GL_RENDERBUFFER_INTERNAL_FORMAT = $8D44;
  GL_STENCIL_INDEX1 = $8D46;
  GL_STENCIL_INDEX4 = $8D47;
  GL_STENCIL_INDEX8 = $8D48;
  GL_STENCIL_INDEX16 = $8D49;
  GL_RENDERBUFFER_RED_SIZE = $8D50;
  GL_RENDERBUFFER_GREEN_SIZE = $8D51;
  GL_RENDERBUFFER_BLUE_SIZE = $8D52;
  GL_RENDERBUFFER_ALPHA_SIZE = $8D53;
  GL_RENDERBUFFER_DEPTH_SIZE = $8D54;
  GL_RENDERBUFFER_STENCIL_SIZE = $8D55;
  GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = $8D56;
  GL_MAX_SAMPLES = $8D57;
{$ifdef DGL_DEPRECATED}
  GL_INDEX = $8222;
  GL_TEXTURE_LUMINANCE_TYPE = $8C14;
  GL_TEXTURE_INTENSITY_TYPE = $8C15;
{$endif}

  // GL_ARB_framebuffer_sRGB
  GL_FRAMEBUFFER_SRGB = $8DB9;

  // GL_ARB_geometry_shader4
  GL_LINES_ADJACENCY_ARB = $000A;
  GL_LINE_STRIP_ADJACENCY_ARB = $000B;
  GL_TRIANGLES_ADJACENCY_ARB = $000C;
  GL_TRIANGLE_STRIP_ADJACENCY_ARB = $000D;
  GL_PROGRAM_POINT_SIZE_ARB = $8642;
  GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_ARB = $8C29;
  GL_FRAMEBUFFER_ATTACHMENT_LAYERED_ARB = $8DA7;
  GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_ARB = $8DA8;
  GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_ARB = $8DA9;
  GL_GEOMETRY_SHADER_ARB = $8DD9;
  GL_GEOMETRY_VERTICES_OUT_ARB = $8DDA;
  GL_GEOMETRY_INPUT_TYPE_ARB = $8DDB;
  GL_GEOMETRY_OUTPUT_TYPE_ARB = $8DDC;
  GL_MAX_GEOMETRY_VARYING_COMPONENTS_ARB = $8DDD;
  GL_MAX_VERTEX_VARYING_COMPONENTS_ARB = $8DDE;
  GL_MAX_GEOMETRY_UNIFORM_COMPONENTS_ARB = $8DDF;
  GL_MAX_GEOMETRY_OUTPUT_VERTICES_ARB = $8DE0;
  GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_ARB = $8DE1;
  { reuse GL_MAX_VARYING_COMPONENTS }
  { reuse GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER }

  // GL_ARB_half_float_vertex
  GL_HALF_FLOAT = $140B;

  // GL_ARB_instanced_arrays
  GL_VERTEX_ATTRIB_ARRAY_DIVISOR_ARB = $88FE;

  // GL_ARB_map_buffer_range
  GL_MAP_READ_BIT = $0001;
  GL_MAP_WRITE_BIT = $0002;
  GL_MAP_INVALIDATE_RANGE_BIT = $0004;
  GL_MAP_INVALIDATE_BUFFER_BIT = $0008;
  GL_MAP_FLUSH_EXPLICIT_BIT = $0010;
  GL_MAP_UNSYNCHRONIZED_BIT = $0020;

  // GL_ARB_texture_buffer_object
  GL_TEXTURE_BUFFER_ARB = $8C2A;
  GL_MAX_TEXTURE_BUFFER_SIZE_ARB = $8C2B;
  GL_TEXTURE_BINDING_BUFFER_ARB = $8C2C;
  GL_TEXTURE_BUFFER_DATA_STORE_BINDING_ARB = $8C2D;
  GL_TEXTURE_BUFFER_FORMAT_ARB = $8C2E;

  // GL_ARB_texture_compression_rgtc
  GL_COMPRESSED_RED_RGTC1 = $8DBB;
  GL_COMPRESSED_SIGNED_RED_RGTC1 = $8DBC;
  GL_COMPRESSED_RG_RGTC2 = $8DBD;
  GL_COMPRESSED_SIGNED_RG_RGTC2 = $8DBE;

  // GL_ARB_texture_rg
  GL_RG = $8227;
  GL_RG_INTEGER = $8228;
  GL_R8 = $8229;
  GL_R16 = $822A;
  GL_RG8 = $822B;
  GL_RG16 = $822C;
  GL_R16F = $822D;
  GL_R32F = $822E;
  GL_RG16F = $822F;
  GL_RG32F = $8230;
  GL_R8I = $8231;
  GL_R8UI = $8232;
  GL_R16I = $8233;
  GL_R16UI = $8234;
  GL_R32I = $8235;
  GL_R32UI = $8236;
  GL_RG8I = $8237;
  GL_RG8UI = $8238;
  GL_RG16I = $8239;
  GL_RG16UI = $823A;
  GL_RG32I = $823B;
  GL_RG32UI = $823C;

  // GL_ARB_vertex_array_object
  GL_VERTEX_ARRAY_BINDING = $85B5;

  // GL_ARB_uniform_buffer_object
  GL_UNIFORM_BUFFER = $8A11;
  GL_UNIFORM_BUFFER_BINDING = $8A28;
  GL_UNIFORM_BUFFER_START = $8A29;
  GL_UNIFORM_BUFFER_SIZE = $8A2A;
  GL_MAX_VERTEX_UNIFORM_BLOCKS = $8A2B;
  GL_MAX_GEOMETRY_UNIFORM_BLOCKS = $8A2C;
  GL_MAX_FRAGMENT_UNIFORM_BLOCKS = $8A2D;
  GL_MAX_COMBINED_UNIFORM_BLOCKS = $8A2E;
  GL_MAX_UNIFORM_BUFFER_BINDINGS = $8A2F;
  GL_MAX_UNIFORM_BLOCK_SIZE = $8A30;
  GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = $8A31;
  GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS = $8A32;
  GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = $8A33;
  GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT = $8A34;
  GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH = $8A35;
  GL_ACTIVE_UNIFORM_BLOCKS = $8A36;
  GL_UNIFORM_TYPE = $8A37;
  GL_UNIFORM_SIZE = $8A38;
  GL_UNIFORM_NAME_LENGTH = $8A39;
  GL_UNIFORM_BLOCK_INDEX = $8A3A;
  GL_UNIFORM_OFFSET = $8A3B;
  GL_UNIFORM_ARRAY_STRIDE = $8A3C;
  GL_UNIFORM_MATRIX_STRIDE = $8A3D;
  GL_UNIFORM_IS_ROW_MAJOR = $8A3E;
  GL_UNIFORM_BLOCK_BINDING = $8A3F;
  GL_UNIFORM_BLOCK_DATA_SIZE = $8A40;
  GL_UNIFORM_BLOCK_NAME_LENGTH = $8A41;
  GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS = $8A42;
  GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = $8A43;
  GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = $8A44;
  GL_UNIFORM_BLOCK_REFERENCED_BY_GEOMETRY_SHADER = $8A45;
  GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = $8A46;
  GL_INVALID_INDEX = $FFFFFFFF;

  // GL_ARB_compatibility
  { ARB_compatibility just defines tokens from core 3.0 }

  // GL_ARB_copy_buffer
  GL_COPY_READ_BUFFER = $8F36;
  GL_COPY_WRITE_BUFFER = $8F37;

  // GL_ARB_depth_clamp
  GL_DEPTH_CLAMP = $864F;

  // GL_ARB_provoking_vertex
  GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION = $8E4C;
  GL_FIRST_VERTEX_CONVENTION = $8E4D;
  GL_LAST_VERTEX_CONVENTION = $8E4E;
  GL_PROVOKING_VERTEX = $8E4F;

  // GL_ARB_seamless_cube_map
  GL_TEXTURE_CUBE_MAP_SEAMLESS = $884F;

  // GL_ARB_sync
  GL_MAX_SERVER_WAIT_TIMEOUT = $9111;
  GL_OBJECT_TYPE = $9112;
  GL_SYNC_CONDITION = $9113;
  GL_SYNC_STATUS = $9114;
  GL_SYNC_FLAGS = $9115;
  GL_SYNC_FENCE = $9116;
  GL_SYNC_GPU_COMMANDS_COMPLETE = $9117;
  GL_UNSIGNALED = $9118;
  GL_SIGNALED = $9119;
  GL_ALREADY_SIGNALED = $911A;
  GL_TIMEOUT_EXPIRED = $911B;
  GL_CONDITION_SATISFIED = $911C;
  GL_WAIT_FAILED = $911D;
  GL_SYNC_FLUSH_COMMANDS_BIT = $00000001;
  GL_TIMEOUT_IGNORED = $FFFFFFFFFFFFFFFF;

  // GL_ARB_texture_multisample
  GL_SAMPLE_POSITION = $8E50;
  GL_SAMPLE_MASK = $8E51;
  GL_SAMPLE_MASK_VALUE = $8E52;
  GL_MAX_SAMPLE_MASK_WORDS = $8E59;
  GL_TEXTURE_2D_MULTISAMPLE = $9100;
  GL_PROXY_TEXTURE_2D_MULTISAMPLE = $9101;
  GL_TEXTURE_2D_MULTISAMPLE_ARRAY = $9102;
  GL_PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY = $9103;
  GL_TEXTURE_BINDING_2D_MULTISAMPLE = $9104;
  GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY = $9105;
  GL_TEXTURE_SAMPLES = $9106;
  GL_TEXTURE_FIXED_SAMPLE_LOCATIONS = $9107;
  GL_SAMPLER_2D_MULTISAMPLE = $9108;
  GL_INT_SAMPLER_2D_MULTISAMPLE = $9109;
  GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE = $910A;
  GL_SAMPLER_2D_MULTISAMPLE_ARRAY = $910B;
  GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = $910C;
  GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = $910D;
  GL_MAX_COLOR_TEXTURE_SAMPLES = $910E;
  GL_MAX_DEPTH_TEXTURE_SAMPLES = $910F;
  GL_MAX_INTEGER_SAMPLES = $9110;

  // GL_ARB_vertex_array_bgra
  { reuse GL_BGRA }

  // GL_ARB_sample_shading
  GL_SAMPLE_SHADING_ARB = $8C36;
  GL_MIN_SAMPLE_SHADING_VALUE_ARB = $8C37;

  // GL_ARB_texture_cube_map_array
  GL_TEXTURE_CUBE_MAP_ARRAY_ARB = $9009;
  GL_TEXTURE_BINDING_CUBE_MAP_ARRAY_ARB = $900A;
  GL_PROXY_TEXTURE_CUBE_MAP_ARRAY_ARB = $900B;
  GL_SAMPLER_CUBE_MAP_ARRAY_ARB = $900C;
  GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW_ARB = $900D;
  GL_INT_SAMPLER_CUBE_MAP_ARRAY_ARB = $900E;
  GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY_ARB = $900F;

  // GL_ARB_texture_gather
  GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET_ARB = $8E5E;
  GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET_ARB = $8E5F;

  // GL_ARB_shading_language_include
  GL_SHADER_INCLUDE_ARB = $8DAE;
  GL_NAMED_STRING_LENGTH_ARB = $8DE9;
  GL_NAMED_STRING_TYPE_ARB = $8DEA;

  // GL_ARB_texture_compression_bptc
  GL_COMPRESSED_RGBA_BPTC_UNORM_ARB = $8E8C;
  GL_COMPRESSED_SRGB_ALPHA_BPTC_UNORM_ARB = $8E8D;
  GL_COMPRESSED_RGB_BPTC_SIGNED_FLOAT_ARB = $8E8E;
  GL_COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT_ARB = $8E8F;

  // GL_ARB_blend_func_extended
  GL_SRC1_COLOR = $88F9;
  { reuse GL_SRC1_ALPHA }
  GL_ONE_MINUS_SRC1_COLOR = $88FA;
  GL_ONE_MINUS_SRC1_ALPHA = $88FB;
  GL_MAX_DUAL_SOURCE_DRAW_BUFFERS = $88FC;

  // GL_ARB_occlusion_query2
  GL_ANY_SAMPLES_PASSED = $8C2F;

  // GL_ARB_sampler_objects
  GL_SAMPLER_BINDING = $8919;

  // GL_ARB_texture_rgb10_a2ui
  GL_RGB10_A2UI = $906F;

  // GL_ARB_texture_swizzle
  GL_TEXTURE_SWIZZLE_R = $8E42;
  GL_TEXTURE_SWIZZLE_G = $8E43;
  GL_TEXTURE_SWIZZLE_B = $8E44;
  GL_TEXTURE_SWIZZLE_A = $8E45;
  GL_TEXTURE_SWIZZLE_RGBA = $8E46;

  // GL_ARB_timer_query
  GL_TIME_ELAPSED = $88BF;
  GL_TIMESTAMP = $8E28;

  // GL_ARB_vertex_type_2_10_10_10_rev
  { reuse GL_UNSIGNED_INT_2_10_10_10_REV }
  GL_INT_2_10_10_10_REV = $8D9F;

  // GL_ARB_draw_indirect
  GL_DRAW_INDIRECT_BUFFER = $8F3F;
  GL_DRAW_INDIRECT_BUFFER_BINDING = $8F43;

  // GL_ARB_gpu_shader5
  GL_GEOMETRY_SHADER_INVOCATIONS = $887F;
  GL_MAX_GEOMETRY_SHADER_INVOCATIONS = $8E5A;
  GL_MIN_FRAGMENT_INTERPOLATION_OFFSET = $8E5B;
  GL_MAX_FRAGMENT_INTERPOLATION_OFFSET = $8E5C;
  GL_FRAGMENT_INTERPOLATION_OFFSET_BITS = $8E5D;
  { reuse GL_MAX_VERTEX_STREAMS }

  // GL_ARB_gpu_shader_fp64
  { reuse GL_DOUBLE }
  GL_DOUBLE_VEC2 = $8FFC;
  GL_DOUBLE_VEC3 = $8FFD;
  GL_DOUBLE_VEC4 = $8FFE;
  GL_DOUBLE_MAT2 = $8F46;
  GL_DOUBLE_MAT3 = $8F47;
  GL_DOUBLE_MAT4 = $8F48;
  GL_DOUBLE_MAT2x3 = $8F49;
  GL_DOUBLE_MAT2x4 = $8F4A;
  GL_DOUBLE_MAT3x2 = $8F4B;
  GL_DOUBLE_MAT3x4 = $8F4C;
  GL_DOUBLE_MAT4x2 = $8F4D;
  GL_DOUBLE_MAT4x3 = $8F4E;

  // GL_ARB_shader_subroutine
  GL_ACTIVE_SUBROUTINES = $8DE5;
  GL_ACTIVE_SUBROUTINE_UNIFORMS = $8DE6;
  GL_ACTIVE_SUBROUTINE_UNIFORM_LOCATIONS = $8E47;
  GL_ACTIVE_SUBROUTINE_MAX_LENGTH = $8E48;
  GL_ACTIVE_SUBROUTINE_UNIFORM_MAX_LENGTH = $8E49;
  GL_MAX_SUBROUTINES = $8DE7;
  GL_MAX_SUBROUTINE_UNIFORM_LOCATIONS = $8DE8;
  GL_NUM_COMPATIBLE_SUBROUTINES = $8E4A;
  GL_COMPATIBLE_SUBROUTINES = $8E4B;
  { reuse GL_UNIFORM_SIZE }
  { reuse GL_UNIFORM_NAME_LENGTH }

  // GL_ARB_tessellation_shader
  GL_PATCHES = $000E;
  GL_PATCH_VERTICES = $8E72;
  GL_PATCH_DEFAULT_INNER_LEVEL = $8E73;
  GL_PATCH_DEFAULT_OUTER_LEVEL = $8E74;
  GL_TESS_CONTROL_OUTPUT_VERTICES = $8E75;
  GL_TESS_GEN_MODE = $8E76;
  GL_TESS_GEN_SPACING = $8E77;
  GL_TESS_GEN_VERTEX_ORDER = $8E78;
  GL_TESS_GEN_POINT_MODE = $8E79;
  { reuse GL_TRIANGLES }
  { reuse GL_QUADS }
  GL_ISOLINES = $8E7A;
  { reuse GL_EQUAL }
  GL_FRACTIONAL_ODD = $8E7B;
  GL_FRACTIONAL_EVEN = $8E7C;
  { reuse GL_CCW }
  { reuse GL_CW }
  GL_MAX_PATCH_VERTICES = $8E7D;
  GL_MAX_TESS_GEN_LEVEL = $8E7E;
  GL_MAX_TESS_CONTROL_UNIFORM_COMPONENTS = $8E7F;
  GL_MAX_TESS_EVALUATION_UNIFORM_COMPONENTS = $8E80;
  GL_MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS = $8E81;
  GL_MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS = $8E82;
  GL_MAX_TESS_CONTROL_OUTPUT_COMPONENTS = $8E83;
  GL_MAX_TESS_PATCH_COMPONENTS = $8E84;
  GL_MAX_TESS_CONTROL_TOTAL_OUTPUT_COMPONENTS = $8E85;
  GL_MAX_TESS_EVALUATION_OUTPUT_COMPONENTS = $8E86;
  GL_MAX_TESS_CONTROL_UNIFORM_BLOCKS = $8E89;
  GL_MAX_TESS_EVALUATION_UNIFORM_BLOCKS = $8E8A;
  GL_MAX_TESS_CONTROL_INPUT_COMPONENTS = $886C;
  GL_MAX_TESS_EVALUATION_INPUT_COMPONENTS = $886D;
  GL_MAX_COMBINED_TESS_CONTROL_UNIFORM_COMPONENTS = $8E1E;
  GL_MAX_COMBINED_TESS_EVALUATION_UNIFORM_COMPONENTS = $8E1F;
  GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_CONTROL_SHADER = $84F0;
  GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_EVALUATION_SHADER = $84F1;
  GL_TESS_EVALUATION_SHADER = $8E87;
  GL_TESS_CONTROL_SHADER = $8E88;

  // GL_ARB_texture_buffer_object_rgb32
  { reuse GL_RGB32F }
  { reuse GL_RGB32UI }
  { reuse GL_RGB32I }

  // GL_ARB_transform_feedback2
  GL_TRANSFORM_FEEDBACK = $8E22;
  GL_TRANSFORM_FEEDBACK_BUFFER_PAUSED = $8E23;
  GL_TRANSFORM_FEEDBACK_BUFFER_ACTIVE = $8E24;
  GL_TRANSFORM_FEEDBACK_BINDING = $8E25;

  // GL_ARB_transform_feedback3
  GL_MAX_TRANSFORM_FEEDBACK_BUFFERS = $8E70;
  GL_MAX_VERTEX_STREAMS = $8E71;

  // GL_ARB_ES2_compatibility
  GL_FIXED = $140C;
  GL_IMPLEMENTATION_COLOR_READ_TYPE = $8B9A;
  GL_IMPLEMENTATION_COLOR_READ_FORMAT = $8B9B;
  GL_LOW_FLOAT = $8DF0;
  GL_MEDIUM_FLOAT = $8DF1;
  GL_HIGH_FLOAT = $8DF2;
  GL_LOW_INT = $8DF3;
  GL_MEDIUM_INT = $8DF4;
  GL_HIGH_INT = $8DF5;
  GL_SHADER_COMPILER = $8DFA;
  GL_NUM_SHADER_BINARY_FORMATS = $8DF9;
  GL_MAX_VERTEX_UNIFORM_VECTORS = $8DFB;
  GL_MAX_VARYING_VECTORS = $8DFC;
  GL_MAX_FRAGMENT_UNIFORM_VECTORS = $8DFD;

  // GL_ARB_get_program_binary
  GL_PROGRAM_BINARY_RETRIEVABLE_HINT = $8257;
  GL_PROGRAM_BINARY_LENGTH = $8741;
  GL_NUM_PROGRAM_BINARY_FORMATS = $87FE;
  GL_PROGRAM_BINARY_FORMATS = $87FF;

  // GL_ARB_separate_shader_objects
  GL_VERTEX_SHADER_BIT = $00000001;
  GL_FRAGMENT_SHADER_BIT = $00000002;
  GL_GEOMETRY_SHADER_BIT = $00000004;
  GL_TESS_CONTROL_SHADER_BIT = $00000008;
  GL_TESS_EVALUATION_SHADER_BIT = $00000010;
  GL_ALL_SHADER_BITS = $FFFFFFFF;
  GL_PROGRAM_SEPARABLE = $8258;
  GL_ACTIVE_PROGRAM = $8259;
  GL_PROGRAM_PIPELINE_BINDING = $825A;

  // GL_ARB_vertex_attrib_64bit
  { reuse GL_RGB32I }
  { reuse GL_DOUBLE_VEC2 }
  { reuse GL_DOUBLE_VEC3 }
  { reuse GL_DOUBLE_VEC4 }
  { reuse GL_DOUBLE_MAT2 }
  { reuse GL_DOUBLE_MAT3 }
  { reuse GL_DOUBLE_MAT4 }
  { reuse GL_DOUBLE_MAT2x3 }
  { reuse GL_DOUBLE_MAT2x4 }
  { reuse GL_DOUBLE_MAT3x2 }
  { reuse GL_DOUBLE_MAT3x4 }
  { reuse GL_DOUBLE_MAT4x2 }
  { reuse GL_DOUBLE_MAT4x3 }

  // GL_ARB_viewport_array
  { reuse GL_SCISSOR_BOX }
  { reuse GL_VIEWPORT }
  { reuse GL_DEPTH_RANGE }
  { reuse GL_SCISSOR_TEST }
  GL_MAX_VIEWPORTS = $825B;
  GL_VIEWPORT_SUBPIXEL_BITS = $825C;
  GL_VIEWPORT_BOUNDS_RANGE = $825D;
  GL_LAYER_PROVOKING_VERTEX = $825E;
  GL_VIEWPORT_INDEX_PROVOKING_VERTEX = $825F;
  GL_UNDEFINED_VERTEX = $8260;
  { reuse GL_FIRST_VERTEX_CONVENTION }
  { reuse GL_LAST_VERTEX_CONVENTION }
  { reuse GL_PROVOKING_VERTEX }

  // GL_ARB_cl_event
  GL_SYNC_CL_EVENT_ARB = $8240;
  GL_SYNC_CL_EVENT_COMPLETE_ARB = $8241;

  // GL_ARB_debug_output
  GL_DEBUG_OUTPUT_SYNCHRONOUS_ARB = $8242;
  GL_DEBUG_NEXT_LOGGED_MESSAGE_LENGTH_ARB = $8243;
  GL_DEBUG_CALLBACK_FUNCTION_ARB = $8244;
  GL_DEBUG_CALLBACK_USER_PARAM_ARB = $8245;
  GL_DEBUG_SOURCE_API_ARB = $8246;
  GL_DEBUG_SOURCE_WINDOW_SYSTEM_ARB = $8247;
  GL_DEBUG_SOURCE_SHADER_COMPILER_ARB = $8248;
  GL_DEBUG_SOURCE_THIRD_PARTY_ARB = $8249;
  GL_DEBUG_SOURCE_APPLICATION_ARB = $824A;
  GL_DEBUG_SOURCE_OTHER_ARB = $824B;
  GL_DEBUG_TYPE_ERROR_ARB = $824C;
  GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR_ARB = $824D;
  GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR_ARB = $824E;
  GL_DEBUG_TYPE_PORTABILITY_ARB = $824F;
  GL_DEBUG_TYPE_PERFORMANCE_ARB = $8250;
  GL_DEBUG_TYPE_OTHER_ARB = $8251;
  GL_MAX_DEBUG_MESSAGE_LENGTH_ARB = $9143;
  GL_MAX_DEBUG_LOGGED_MESSAGES_ARB = $9144;
  GL_DEBUG_LOGGED_MESSAGES_ARB = $9145;
  GL_DEBUG_SEVERITY_HIGH_ARB = $9146;
  GL_DEBUG_SEVERITY_MEDIUM_ARB = $9147;
  GL_DEBUG_SEVERITY_LOW_ARB = $9148;

  // GL_ARB_robustness
  { reuse GL_NO_ERROR }
  GL_CONTEXT_FLAG_ROBUST_ACCESS_BIT_ARB = $00000004;
  GL_LOSE_CONTEXT_ON_RESET_ARB = $8252;
  GL_GUILTY_CONTEXT_RESET_ARB = $8253;
  GL_INNOCENT_CONTEXT_RESET_ARB = $8254;
  GL_UNKNOWN_CONTEXT_RESET_ARB = $8255;
  GL_RESET_NOTIFICATION_STRATEGY_ARB = $8256;
  GL_NO_RESET_NOTIFICATION_ARB = $8261;

  // GL_ATI_draw_buffers
  GL_MAX_DRAW_BUFFERS_ATI = $8824;
  GL_DRAW_BUFFER0_ATI = $8825;
  GL_DRAW_BUFFER1_ATI = $8826;
  GL_DRAW_BUFFER2_ATI = $8827;
  GL_DRAW_BUFFER3_ATI = $8828;
  GL_DRAW_BUFFER4_ATI = $8829;
  GL_DRAW_BUFFER5_ATI = $882A;
  GL_DRAW_BUFFER6_ATI = $882B;
  GL_DRAW_BUFFER7_ATI = $882C;
  GL_DRAW_BUFFER8_ATI = $882D;
  GL_DRAW_BUFFER9_ATI = $882E;
  GL_DRAW_BUFFER10_ATI = $882F;
  GL_DRAW_BUFFER11_ATI = $8830;
  GL_DRAW_BUFFER12_ATI = $8831;
  GL_DRAW_BUFFER13_ATI = $8832;
  GL_DRAW_BUFFER14_ATI = $8833;
  GL_DRAW_BUFFER15_ATI = $8834;

  // GL_ATI_element_array
  GL_ELEMENT_ARRAY_ATI = $8768;
  GL_ELEMENT_ARRAY_TYPE_ATI = $8769;
  GL_ELEMENT_ARRAY_POINTER_ATI = $876A;

  // GL_ATI_envmap_bumpmap
  GL_BUMP_ROT_MATRIX_ATI = $8775;
  GL_BUMP_ROT_MATRIX_SIZE_ATI = $8776;
  GL_BUMP_NUM_TEX_UNITS_ATI = $8777;
  GL_BUMP_TEX_UNITS_ATI = $8778;
  GL_DUDV_ATI = $8779;
  GL_DU8DV8_ATI = $877A;
  GL_BUMP_ENVMAP_ATI = $877B;
  GL_BUMP_TARGET_ATI = $877C;

  // GL_ATI_fragment_shader
  GL_FRAGMENT_SHADER_ATI = $8920;
  GL_REG_0_ATI = $8921;
  GL_REG_1_ATI = $8922;
  GL_REG_2_ATI = $8923;
  GL_REG_3_ATI = $8924;
  GL_REG_4_ATI = $8925;
  GL_REG_5_ATI = $8926;
  GL_REG_6_ATI = $8927;
  GL_REG_7_ATI = $8928;
  GL_REG_8_ATI = $8929;
  GL_REG_9_ATI = $892A;
  GL_REG_10_ATI = $892B;
  GL_REG_11_ATI = $892C;
  GL_REG_12_ATI = $892D;
  GL_REG_13_ATI = $892E;
  GL_REG_14_ATI = $892F;
  GL_REG_15_ATI = $8930;
  GL_REG_16_ATI = $8931;
  GL_REG_17_ATI = $8932;
  GL_REG_18_ATI = $8933;
  GL_REG_19_ATI = $8934;
  GL_REG_20_ATI = $8935;
  GL_REG_21_ATI = $8936;
  GL_REG_22_ATI = $8937;
  GL_REG_23_ATI = $8938;
  GL_REG_24_ATI = $8939;
  GL_REG_25_ATI = $893A;
  GL_REG_26_ATI = $893B;
  GL_REG_27_ATI = $893C;
  GL_REG_28_ATI = $893D;
  GL_REG_29_ATI = $893E;
  GL_REG_30_ATI = $893F;
  GL_REG_31_ATI = $8940;
  GL_CON_0_ATI = $8941;
  GL_CON_1_ATI = $8942;
  GL_CON_2_ATI = $8943;
  GL_CON_3_ATI = $8944;
  GL_CON_4_ATI = $8945;
  GL_CON_5_ATI = $8946;
  GL_CON_6_ATI = $8947;
  GL_CON_7_ATI = $8948;
  GL_CON_8_ATI = $8949;
  GL_CON_9_ATI = $894A;
  GL_CON_10_ATI = $894B;
  GL_CON_11_ATI = $894C;
  GL_CON_12_ATI = $894D;
  GL_CON_13_ATI = $894E;
  GL_CON_14_ATI = $894F;
  GL_CON_15_ATI = $8950;
  GL_CON_16_ATI = $8951;
  GL_CON_17_ATI = $8952;
  GL_CON_18_ATI = $8953;
  GL_CON_19_ATI = $8954;
  GL_CON_20_ATI = $8955;
  GL_CON_21_ATI = $8956;
  GL_CON_22_ATI = $8957;
  GL_CON_23_ATI = $8958;
  GL_CON_24_ATI = $8959;
  GL_CON_25_ATI = $895A;
  GL_CON_26_ATI = $895B;
  GL_CON_27_ATI = $895C;
  GL_CON_28_ATI = $895D;
  GL_CON_29_ATI = $895E;
  GL_CON_30_ATI = $895F;
  GL_CON_31_ATI = $8960;
  GL_MOV_ATI = $8961;
  GL_ADD_ATI = $8963;
  GL_MUL_ATI = $8964;
  GL_SUB_ATI = $8965;
  GL_DOT3_ATI = $8966;
  GL_DOT4_ATI = $8967;
  GL_MAD_ATI = $8968;
  GL_LERP_ATI = $8969;
  GL_CND_ATI = $896A;
  GL_CND0_ATI = $896B;
  GL_DOT2_ADD_ATI = $896C;
  GL_SECONDARY_INTERPOLATOR_ATI = $896D;
  GL_NUM_FRAGMENT_REGISTERS_ATI = $896E;
  GL_NUM_FRAGMENT_CONSTANTS_ATI = $896F;
  GL_NUM_PASSES_ATI = $8970;
  GL_NUM_INSTRUCTIONS_PER_PASS_ATI = $8971;
  GL_NUM_INSTRUCTIONS_TOTAL_ATI = $8972;
  GL_NUM_INPUT_INTERPOLATOR_COMPONENTS_ATI = $8973;
  GL_NUM_LOOPBACK_COMPONENTS_ATI = $8974;
  GL_COLOR_ALPHA_PAIRING_ATI = $8975;
  GL_SWIZZLE_STR_ATI = $8976;
  GL_SWIZZLE_STQ_ATI = $8977;
  GL_SWIZZLE_STR_DR_ATI = $8978;
  GL_SWIZZLE_STQ_DQ_ATI = $8979;
  GL_SWIZZLE_STRQ_ATI = $897A;
  GL_SWIZZLE_STRQ_DQ_ATI = $897B;
  GL_RED_BIT_ATI = $00000001;
  GL_GREEN_BIT_ATI = $00000002;
  GL_BLUE_BIT_ATI = $00000004;
  GL_2X_BIT_ATI = $00000001;
  GL_4X_BIT_ATI = $00000002;
  GL_8X_BIT_ATI = $00000004;
  GL_HALF_BIT_ATI = $00000008;
  GL_QUARTER_BIT_ATI = $00000010;
  GL_EIGHTH_BIT_ATI = $00000020;
  GL_SATURATE_BIT_ATI = $00000040;
  GL_COMP_BIT_ATI = $00000002;
  GL_NEGATE_BIT_ATI = $00000004;
  GL_BIAS_BIT_ATI = $00000008;

  // GL_ATI_pn_triangles
  GL_PN_TRIANGLES_ATI = $87F0;
  GL_MAX_PN_TRIANGLES_TESSELATION_LEVEL_ATI = $87F1;
  GL_PN_TRIANGLES_POINT_MODE_ATI = $87F2;
  GL_PN_TRIANGLES_NORMAL_MODE_ATI = $87F3;
  GL_PN_TRIANGLES_TESSELATION_LEVEL_ATI = $87F4;
  GL_PN_TRIANGLES_POINT_MODE_LINEAR_ATI = $87F5;
  GL_PN_TRIANGLES_POINT_MODE_CUBIC_ATI = $87F6;
  GL_PN_TRIANGLES_NORMAL_MODE_LINEAR_ATI = $87F7;
  GL_PN_TRIANGLES_NORMAL_MODE_QUADRATIC_ATI = $87F8;

  // GL_ATI_separate_stencil
  GL_STENCIL_BACK_FUNC_ATI = $8800;
  GL_STENCIL_BACK_FAIL_ATI = $8801;
  GL_STENCIL_BACK_PASS_DEPTH_FAIL_ATI = $8802;
  GL_STENCIL_BACK_PASS_DEPTH_PASS_ATI = $8803;

  // GL_ATI_text_fragment_shader
  GL_TEXT_FRAGMENT_SHADER_ATI = $8200;

  // GL_ATI_texture_env_combine3
  GL_MODULATE_ADD_ATI = $8744;
  GL_MODULATE_SIGNED_ADD_ATI = $8745;
  GL_MODULATE_SUBTRACT_ATI = $8746;

  // GL_ATI_texture_float
  GL_RGBA_FLOAT32_ATI = $8814;
  GL_RGB_FLOAT32_ATI = $8815;
  GL_ALPHA_FLOAT32_ATI = $8816;
  GL_INTENSITY_FLOAT32_ATI = $8817;
  GL_LUMINANCE_FLOAT32_ATI = $8818;
  GL_LUMINANCE_ALPHA_FLOAT32_ATI = $8819;
  GL_RGBA_FLOAT16_ATI = $881A;
  GL_RGB_FLOAT16_ATI = $881B;
  GL_ALPHA_FLOAT16_ATI = $881C;
  GL_INTENSITY_FLOAT16_ATI = $881D;
  GL_LUMINANCE_FLOAT16_ATI = $881E;
  GL_LUMINANCE_ALPHA_FLOAT16_ATI = $881F;

  // GL_ATI_texture_mirror_once
  GL_MIRROR_CLAMP_ATI = $8742;
  GL_MIRROR_CLAMP_TO_EDGE_ATI = $8743;

  // GL_ATI_vertex_array_object
  GL_STATIC_ATI = $8760;
  GL_DYNAMIC_ATI = $8761;
  GL_PRESERVE_ATI = $8762;
  GL_DISCARD_ATI = $8763;
  GL_OBJECT_BUFFER_SIZE_ATI = $8764;
  GL_OBJECT_BUFFER_USAGE_ATI = $8765;
  GL_ARRAY_OBJECT_BUFFER_ATI = $8766;
  GL_ARRAY_OBJECT_OFFSET_ATI = $8767;

  // GL_ATI_vertex_streams
  GL_MAX_VERTEX_STREAMS_ATI = $876B;
  GL_VERTEX_STREAM0_ATI = $876C;
  GL_VERTEX_STREAM1_ATI = $876D;
  GL_VERTEX_STREAM2_ATI = $876E;
  GL_VERTEX_STREAM3_ATI = $876F;
  GL_VERTEX_STREAM4_ATI = $8770;
  GL_VERTEX_STREAM5_ATI = $8771;
  GL_VERTEX_STREAM6_ATI = $8772;
  GL_VERTEX_STREAM7_ATI = $8773;
  GL_VERTEX_SOURCE_ATI = $8774;

  // GL_ATI_meminfo
  GL_VBO_FREE_MEMORY_ATI = $87FB;
  GL_TEXTURE_FREE_MEMORY_ATI = $87FC;
  GL_RENDERBUFFER_FREE_MEMORY_ATI = $87FD;

  // GL_AMD_performance_monitor
  GL_COUNTER_TYPE_AMD = $8BC0;
  GL_COUNTER_RANGE_AMD = $8BC1;
  GL_UNSIGNED_INT64_AMD = $8BC2;
  GL_PERCENTAGE_AMD = $8BC3;
  GL_PERFMON_RESULT_AVAILABLE_AMD = $8BC4;
  GL_PERFMON_RESULT_SIZE_AMD = $8BC5;
  GL_PERFMON_RESULT_AMD = $8BC6;
  
  // GL_AMD_vertex_shader_tesselator
  GL_SAMPLER_BUFFER_AMD = $9001;
  GL_INT_SAMPLER_BUFFER_AMD = $9002;
  GL_UNSIGNED_INT_SAMPLER_BUFFER_AMD = $9003;
  GL_TESSELLATION_MODE_AMD = $9004;
  GL_TESSELLATION_FACTOR_AMD = $9005;
  GL_DISCRETE_AMD = $9006;
  GL_CONTINUOUS_AMD = $9007;

  // GL_AMD_seamless_cubemap_per_texture
  { reuse GL_TEXTURE_CUBE_MAP_SEAMLESS }

  // GL_AMD_name_gen_delete
  GL_DATA_BUFFER_AMD = $9151;
  GL_PERFORMANCE_MONITOR_AMD = $9152;
  GL_QUERY_OBJECT_AMD = $9153;
  GL_VERTEX_ARRAY_OBJECT_AMD = $9154;
  GL_SAMPLER_OBJECT_AMD = $9155;

  // GL_AMD_debug_output
  GL_MAX_DEBUG_LOGGED_MESSAGES_AMD = $9144;
  GL_DEBUG_LOGGED_MESSAGES_AMD = $9145;
  GL_DEBUG_SEVERITY_HIGH_AMD = $9146;
  GL_DEBUG_SEVERITY_MEDIUM_AMD = $9147;
  GL_DEBUG_SEVERITY_LOW_AMD = $9148;
  GL_DEBUG_CATEGORY_API_ERROR_AMD = $9149;
  GL_DEBUG_CATEGORY_WINDOW_SYSTEM_AMD = $914A;
  GL_DEBUG_CATEGORY_DEPRECATION_AMD = $914B;
  GL_DEBUG_CATEGORY_UNDEFINED_BEHAVIOR_AMD = $914C;
  GL_DEBUG_CATEGORY_PERFORMANCE_AMD = $914D;
  GL_DEBUG_CATEGORY_SHADER_COMPILER_AMD = $914E;
  GL_DEBUG_CATEGORY_APPLICATION_AMD = $914F;
  GL_DEBUG_CATEGORY_OTHER_AMD = $9150;

  // GL_AMD_depth_clamp_separate
  GL_DEPTH_CLAMP_NEAR_AMD = $901E;
  GL_DEPTH_CLAMP_FAR_AMD = $901F;

  // GL_EXT_422_pixels
  GL_422_EXT = $80CC;
  GL_422_REV_EXT = $80CD;
  GL_422_AVERAGE_EXT = $80CE;
  GL_422_REV_AVERAGE_EXT = $80CF;

  // GL_EXT_abgr
  GL_ABGR_EXT = $8000;

  // GL_EXT_bgra
  GL_BGR_EXT = $80E0;
  GL_BGRA_EXT = $80E1;

  // GL_EXT_blend_color
  GL_CONSTANT_COLOR_EXT = $8001;
  GL_ONE_MINUS_CONSTANT_COLOR_EXT = $8002;
  GL_CONSTANT_ALPHA_EXT = $8003;
  GL_ONE_MINUS_CONSTANT_ALPHA_EXT = $8004;
  GL_BLEND_COLOR_EXT = $8005;

  // GL_EXT_blend_func_separate
  GL_BLEND_DST_RGB_EXT = $80C8;
  GL_BLEND_SRC_RGB_EXT = $80C9;
  GL_BLEND_DST_ALPHA_EXT = $80CA;
  GL_BLEND_SRC_ALPHA_EXT = $80CB;

  // GL_EXT_blend_minmax
  GL_FUNC_ADD_EXT = $8006;
  GL_MIN_EXT = $8007;
  GL_MAX_EXT = $8008;
  GL_BLEND_EQUATION_EXT = $8009;

  // GL_EXT_blend_subtract
  GL_FUNC_SUBTRACT_EXT = $800A;
  GL_FUNC_REVERSE_SUBTRACT_EXT = $800B;

  // GL_EXT_clip_volume_hint
  GL_CLIP_VOLUME_CLIPPING_HINT_EXT = $80F0;

  // GL_EXT_cmyka
  GL_CMYK_EXT = $800C;
  GL_CMYKA_EXT = $800D;
  GL_PACK_CMYK_HINT_EXT = $800E;
  GL_UNPACK_CMYK_HINT_EXT = $800F;

  // GL_EXT_compiled_vertex_array
  GL_ARRAY_ELEMENT_LOCK_FIRST_EXT = $81A8;
  GL_ARRAY_ELEMENT_LOCK_COUNT_EXT = $81A9;

  // GL_EXT_convolution
  GL_CONVOLUTION_1D_EXT = $8010;
  GL_CONVOLUTION_2D_EXT = $8011;
  GL_SEPARABLE_2D_EXT = $8012;
  GL_CONVOLUTION_BORDER_MODE_EXT = $8013;
  GL_CONVOLUTION_FILTER_SCALE_EXT = $8014;
  GL_CONVOLUTION_FILTER_BIAS_EXT = $8015;
  GL_REDUCE_EXT = $8016;
  GL_CONVOLUTION_FORMAT_EXT = $8017;
  GL_CONVOLUTION_WIDTH_EXT = $8018;
  GL_CONVOLUTION_HEIGHT_EXT = $8019;
  GL_MAX_CONVOLUTION_WIDTH_EXT = $801A;
  GL_MAX_CONVOLUTION_HEIGHT_EXT = $801B;
  GL_POST_CONVOLUTION_RED_SCALE_EXT = $801C;
  GL_POST_CONVOLUTION_GREEN_SCALE_EXT = $801D;
  GL_POST_CONVOLUTION_BLUE_SCALE_EXT = $801E;
  GL_POST_CONVOLUTION_ALPHA_SCALE_EXT = $801F;
  GL_POST_CONVOLUTION_RED_BIAS_EXT = $8020;
  GL_POST_CONVOLUTION_GREEN_BIAS_EXT = $8021;
  GL_POST_CONVOLUTION_BLUE_BIAS_EXT = $8022;
  GL_POST_CONVOLUTION_ALPHA_BIAS_EXT = $8023;

  // GL_EXT_coordinate_frame
  GL_TANGENT_ARRAY_EXT = $8439;
  GL_BINORMAL_ARRAY_EXT = $843A;
  GL_CURRENT_TANGENT_EXT = $843B;
  GL_CURRENT_BINORMAL_EXT = $843C;
  GL_TANGENT_ARRAY_TYPE_EXT = $843E;
  GL_TANGENT_ARRAY_STRIDE_EXT = $843F;
  GL_BINORMAL_ARRAY_TYPE_EXT = $8440;
  GL_BINORMAL_ARRAY_STRIDE_EXT = $8441;
  GL_TANGENT_ARRAY_POINTER_EXT = $8442;
  GL_BINORMAL_ARRAY_POINTER_EXT = $8443;
  GL_MAP1_TANGENT_EXT = $8444;
  GL_MAP2_TANGENT_EXT = $8445;
  GL_MAP1_BINORMAL_EXT = $8446;
  GL_MAP2_BINORMAL_EXT = $8447;

  // GL_EXT_cull_vertex
  GL_CULL_VERTEX_EXT = $81AA;
  GL_CULL_VERTEX_EYE_POSITION_EXT = $81AB;
  GL_CULL_VERTEX_OBJECT_POSITION_EXT = $81AC;

  // GL_EXT_draw_range_elements
  GL_MAX_ELEMENTS_VERTICES_EXT = $80E8;
  GL_MAX_ELEMENTS_INDICES_EXT = $80E9;

  // GL_EXT_fog_coord
  GL_FOG_COORDINATE_SOURCE_EXT = $8450;
  GL_FOG_COORDINATE_EXT = $8451;
  GL_FRAGMENT_DEPTH_EXT = $8452;
  GL_CURRENT_FOG_COORDINATE_EXT = $8453;
  GL_FOG_COORDINATE_ARRAY_TYPE_EXT = $8454;
  GL_FOG_COORDINATE_ARRAY_STRIDE_EXT = $8455;
  GL_FOG_COORDINATE_ARRAY_POINTER_EXT = $8456;
  GL_FOG_COORDINATE_ARRAY_EXT = $8457;

  // GL_EXT_framebuffer_object
  GL_FRAMEBUFFER_EXT = $8D40;
  GL_RENDERBUFFER_EXT = $8D41;
  GL_STENCIL_INDEX_EXT = $8D45;
  GL_STENCIL_INDEX1_EXT = $8D46;
  GL_STENCIL_INDEX4_EXT = $8D47;
  GL_STENCIL_INDEX8_EXT = $8D48;
  GL_STENCIL_INDEX16_EXT = $8D49;
  GL_RENDERBUFFER_WIDTH_EXT = $8D42;
  GL_RENDERBUFFER_HEIGHT_EXT = $8D43;
  GL_RENDERBUFFER_INTERNAL_FORMAT_EXT = $8D44;
  GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE_EXT = $8CD0;
  GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME_EXT = $8CD1;
  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL_EXT = $8CD2;
  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE_EXT = $8CD3;
  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_3D_ZOFFSET_EXT = $8CD4;
  GL_COLOR_ATTACHMENT0_EXT = $8CE0;
  GL_COLOR_ATTACHMENT1_EXT = $8CE1;
  GL_COLOR_ATTACHMENT2_EXT = $8CE2;
  GL_COLOR_ATTACHMENT3_EXT = $8CE3;
  GL_COLOR_ATTACHMENT4_EXT = $8CE4;
  GL_COLOR_ATTACHMENT5_EXT = $8CE5;
  GL_COLOR_ATTACHMENT6_EXT = $8CE6;
  GL_COLOR_ATTACHMENT7_EXT = $8CE7;
  GL_COLOR_ATTACHMENT8_EXT = $8CE8;
  GL_COLOR_ATTACHMENT9_EXT = $8CE9;
  GL_COLOR_ATTACHMENT10_EXT = $8CEA;
  GL_COLOR_ATTACHMENT11_EXT = $8CEB;
  GL_COLOR_ATTACHMENT12_EXT = $8CEC;
  GL_COLOR_ATTACHMENT13_EXT = $8CED;
  GL_COLOR_ATTACHMENT14_EXT = $8CEE;
  GL_COLOR_ATTACHMENT15_EXT = $8CEF;
  GL_DEPTH_ATTACHMENT_EXT = $8D00;
  GL_STENCIL_ATTACHMENT_EXT = $8D20;
  GL_FRAMEBUFFER_COMPLETE_EXT = $8CD5;
  GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT_EXT = $8CD6;
  GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT_EXT = $8CD7;
  GL_FRAMEBUFFER_INCOMPLETE_DUPLICATE_ATTACHMENT_EXT = $8CD8;
  GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS_EXT = $8CD9;
  GL_FRAMEBUFFER_INCOMPLETE_FORMATS_EXT = $8CDA;
  GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER_EXT = $8CDB;
  GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER_EXT = $8CDC;
  GL_FRAMEBUFFER_UNSUPPORTED_EXT = $8CDD;
  GL_FRAMEBUFFER_STATUS_ERROR_EXT = $8CDE;
  GL_FRAMEBUFFER_BINDING_EXT = $8CA6;
  GL_RENDERBUFFER_BINDING_EXT = $8CA7;
  GL_MAX_COLOR_ATTACHMENTS_EXT = $8CDF;
  GL_MAX_RENDERBUFFER_SIZE_EXT = $84E8;
  GL_INVALID_FRAMEBUFFER_OPERATION_EXT = $0506;

  // GL_EXT_histogram
  GL_HISTOGRAM_EXT = $8024;
  GL_PROXY_HISTOGRAM_EXT = $8025;
  GL_HISTOGRAM_WIDTH_EXT = $8026;
  GL_HISTOGRAM_FORMAT_EXT = $8027;
  GL_HISTOGRAM_RED_SIZE_EXT = $8028;
  GL_HISTOGRAM_GREEN_SIZE_EXT = $8029;
  GL_HISTOGRAM_BLUE_SIZE_EXT = $802A;
  GL_HISTOGRAM_ALPHA_SIZE_EXT = $802B;
  GL_HISTOGRAM_LUMINANCE_SIZE_EXT = $802C;
  GL_HISTOGRAM_SINK_EXT = $802D;
  GL_MINMAX_EXT = $802E;
  GL_MINMAX_FORMAT_EXT = $802F;
  GL_MINMAX_SINK_EXT = $8030;
  GL_TABLE_TOO_LARGE_EXT = $8031;

  // GL_EXT_index_array_formats
  GL_IUI_V2F_EXT = $81AD;
  GL_IUI_V3F_EXT = $81AE;
  GL_IUI_N3F_V2F_EXT = $81AF;
  GL_IUI_N3F_V3F_EXT = $81B0;
  GL_T2F_IUI_V2F_EXT = $81B1;
  GL_T2F_IUI_V3F_EXT = $81B2;
  GL_T2F_IUI_N3F_V2F_EXT = $81B3;
  GL_T2F_IUI_N3F_V3F_EXT = $81B4;

  // GL_EXT_index_func
  GL_INDEX_TEST_EXT = $81B5;
  GL_INDEX_TEST_FUNC_EXT = $81B6;
  GL_INDEX_TEST_REF_EXT = $81B7;

  // GL_EXT_index_material
  GL_INDEX_MATERIAL_EXT = $81B8;
  GL_INDEX_MATERIAL_PARAMETER_EXT = $81B9;
  GL_INDEX_MATERIAL_FACE_EXT = $81BA;

  // GL_EXT_light_texture
  GL_FRAGMENT_MATERIAL_EXT = $8349;
  GL_FRAGMENT_NORMAL_EXT = $834A;
  GL_FRAGMENT_COLOR_EXT = $834C;
  GL_ATTENUATION_EXT = $834D;
  GL_SHADOW_ATTENUATION_EXT = $834E;
  GL_TEXTURE_APPLICATION_MODE_EXT = $834F;
  GL_TEXTURE_LIGHT_EXT = $8350;
  GL_TEXTURE_MATERIAL_FACE_EXT = $8351;
  GL_TEXTURE_MATERIAL_PARAMETER_EXT = $8352;

  // GL_EXT_multisample
  GL_MULTISAMPLE_EXT = $809D;
  GL_SAMPLE_ALPHA_TO_MASK_EXT = $809E;
  GL_SAMPLE_ALPHA_TO_ONE_EXT = $809F;
  GL_SAMPLE_MASK_EXT = $80A0;
  GL_1PASS_EXT = $80A1;
  GL_2PASS_0_EXT = $80A2;
  GL_2PASS_1_EXT = $80A3;
  GL_4PASS_0_EXT = $80A4;
  GL_4PASS_1_EXT = $80A5;
  GL_4PASS_2_EXT = $80A6;
  GL_4PASS_3_EXT = $80A7;
  GL_SAMPLE_BUFFERS_EXT = $80A8;
  GL_SAMPLES_EXT = $80A9;
  GL_SAMPLE_MASK_VALUE_EXT = $80AA;
  GL_SAMPLE_MASK_INVERT_EXT = $80AB;
  GL_SAMPLE_PATTERN_EXT = $80AC;
  GL_MULTISAMPLE_BIT_EXT = $20000000;

  // GL_EXT_packed_pixels
  GL_UNSIGNED_BYTE_3_3_2_EXT = $8032;
  GL_UNSIGNED_SHORT_4_4_4_4_EXT = $8033;
  GL_UNSIGNED_SHORT_5_5_5_1_EXT = $8034;
  GL_UNSIGNED_INT_8_8_8_8_EXT = $8035;
  GL_UNSIGNED_INT_10_10_10_2_EXT = $8036;

  // GL_EXT_paletted_texture
  GL_COLOR_INDEX1_EXT = $80E2;
  GL_COLOR_INDEX2_EXT = $80E3;
  GL_COLOR_INDEX4_EXT = $80E4;
  GL_COLOR_INDEX8_EXT = $80E5;
  GL_COLOR_INDEX12_EXT = $80E6;
  GL_COLOR_INDEX16_EXT = $80E7;
  GL_TEXTURE_INDEX_SIZE_EXT = $80ED;

  // GL_EXT_pixel_transform
  GL_PIXEL_TRANSFORM_2D_EXT = $8330;
  GL_PIXEL_MAG_FILTER_EXT = $8331;
  GL_PIXEL_MIN_FILTER_EXT = $8332;
  GL_PIXEL_CUBIC_WEIGHT_EXT = $8333;
  GL_CUBIC_EXT = $8334;
  GL_AVERAGE_EXT = $8335;
  GL_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT = $8336;
  GL_MAX_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT = $8337;
  GL_PIXEL_TRANSFORM_2D_MATRIX_EXT = $8338;

  // GL_EXT_point_parameters
  GL_POINT_SIZE_MIN_EXT = $8126;
  GL_POINT_SIZE_MAX_EXT = $8127;
  GL_POINT_FADE_THRESHOLD_SIZE_EXT = $8128;
  GL_DISTANCE_ATTENUATION_EXT = $8129;

  // GL_EXT_polygon_offset
  GL_POLYGON_OFFSET_EXT = $8037;
  GL_POLYGON_OFFSET_FACTOR_EXT = $8038;
  GL_POLYGON_OFFSET_BIAS_EXT = $8039;

  // GL_EXT_rescale_normal
  GL_RESCALE_NORMAL_EXT = $803A;

  // GL_EXT_secondary_color
  GL_COLOR_SUM_EXT = $8458;
  GL_CURRENT_SECONDARY_COLOR_EXT = $8459;
  GL_SECONDARY_COLOR_ARRAY_SIZE_EXT = $845A;
  GL_SECONDARY_COLOR_ARRAY_TYPE_EXT = $845B;
  GL_SECONDARY_COLOR_ARRAY_STRIDE_EXT = $845C;
  GL_SECONDARY_COLOR_ARRAY_POINTER_EXT = $845D;
  GL_SECONDARY_COLOR_ARRAY_EXT = $845E;

  // GL_EXT_separate_specular_color
  GL_LIGHT_MODEL_COLOR_CONTROL_EXT = $81F8;
  GL_SINGLE_COLOR_EXT = $81F9;
  GL_SEPARATE_SPECULAR_COLOR_EXT = $81FA;

  // GL_EXT_shared_texture_palette
  GL_SHARED_TEXTURE_PALETTE_EXT = $81FB;

  // GL_EXT_stencil_two_side
  GL_STENCIL_TEST_TWO_SIDE_EXT = $8910;
  GL_ACTIVE_STENCIL_FACE_EXT = $8911;

  // GL_EXT_stencil_wrap
  GL_INCR_WRAP_EXT = $8507;
  GL_DECR_WRAP_EXT = $8508;

  // GL_EXT_texture
  GL_ALPHA4_EXT = $803B;
  GL_ALPHA8_EXT = $803C;
  GL_ALPHA12_EXT = $803D;
  GL_ALPHA16_EXT = $803E;
  GL_LUMINANCE4_EXT = $803F;
  GL_LUMINANCE8_EXT = $8040;
  GL_LUMINANCE12_EXT = $8041;
  GL_LUMINANCE16_EXT = $8042;
  GL_LUMINANCE4_ALPHA4_EXT = $8043;
  GL_LUMINANCE6_ALPHA2_EXT = $8044;
  GL_LUMINANCE8_ALPHA8_EXT = $8045;
  GL_LUMINANCE12_ALPHA4_EXT = $8046;
  GL_LUMINANCE12_ALPHA12_EXT = $8047;
  GL_LUMINANCE16_ALPHA16_EXT = $8048;
  GL_INTENSITY_EXT = $8049;
  GL_INTENSITY4_EXT = $804A;
  GL_INTENSITY8_EXT = $804B;
  GL_INTENSITY12_EXT = $804C;
  GL_INTENSITY16_EXT = $804D;
  GL_RGB2_EXT = $804E;
  GL_RGB4_EXT = $804F;
  GL_RGB5_EXT = $8050;
  GL_RGB8_EXT = $8051;
  GL_RGB10_EXT = $8052;
  GL_RGB12_EXT = $8053;
  GL_RGB16_EXT = $8054;
  GL_RGBA2_EXT = $8055;
  GL_RGBA4_EXT = $8056;
  GL_RGB5_A1_EXT = $8057;
  GL_RGBA8_EXT = $8058;
  GL_RGB10_A2_EXT = $8059;
  GL_RGBA12_EXT = $805A;
  GL_RGBA16_EXT = $805B;
  GL_TEXTURE_RED_SIZE_EXT = $805C;
  GL_TEXTURE_GREEN_SIZE_EXT = $805D;
  GL_TEXTURE_BLUE_SIZE_EXT = $805E;
  GL_TEXTURE_ALPHA_SIZE_EXT = $805F;
  GL_TEXTURE_LUMINANCE_SIZE_EXT = $8060;
  GL_TEXTURE_INTENSITY_SIZE_EXT = $8061;
  GL_REPLACE_EXT = $8062;
  GL_PROXY_TEXTURE_1D_EXT = $8063;
  GL_PROXY_TEXTURE_2D_EXT = $8064;
  GL_TEXTURE_TOO_LARGE_EXT = $8065;

  // GL_EXT_texture3D
  GL_PACK_SKIP_IMAGES_EXT = $806B;
  GL_PACK_IMAGE_HEIGHT_EXT = $806C;
  GL_UNPACK_SKIP_IMAGES_EXT = $806D;
  GL_UNPACK_IMAGE_HEIGHT_EXT = $806E;
  GL_TEXTURE_3D_EXT = $806F;
  GL_PROXY_TEXTURE_3D_EXT = $8070;
  GL_TEXTURE_DEPTH_EXT = $8071;
  GL_TEXTURE_WRAP_R_EXT = $8072;
  GL_MAX_3D_TEXTURE_SIZE_EXT = $8073;

  // GL_EXT_texture_compression_s3tc
  GL_COMPRESSED_RGB_S3TC_DXT1_EXT = $83F0;
  GL_COMPRESSED_RGBA_S3TC_DXT1_EXT = $83F1;
  GL_COMPRESSED_RGBA_S3TC_DXT3_EXT = $83F2;
  GL_COMPRESSED_RGBA_S3TC_DXT5_EXT = $83F3;

  // GL_EXT_texture_cube_map
  GL_NORMAL_MAP_EXT = $8511;
  GL_REFLECTION_MAP_EXT = $8512;
  GL_TEXTURE_CUBE_MAP_EXT = $8513;
  GL_TEXTURE_BINDING_CUBE_MAP_EXT = $8514;
  GL_TEXTURE_CUBE_MAP_POSITIVE_X_EXT = $8515;
  GL_TEXTURE_CUBE_MAP_NEGATIVE_X_EXT = $8516;
  GL_TEXTURE_CUBE_MAP_POSITIVE_Y_EXT = $8517;
  GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_EXT = $8518;
  GL_TEXTURE_CUBE_MAP_POSITIVE_Z_EXT = $8519;
  GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_EXT = $851A;
  GL_PROXY_TEXTURE_CUBE_MAP_EXT = $851B;
  GL_MAX_CUBE_MAP_TEXTURE_SIZE_EXT = $851C;

  // GL_EXT_texture_edge_clamp
  GL_CLAMP_TO_EDGE_EXT = $812F;

  // GL_EXT_texture_env_combine
  GL_COMBINE_EXT = $8570;
  GL_COMBINE_RGB_EXT = $8571;
  GL_COMBINE_ALPHA_EXT = $8572;
  GL_RGB_SCALE_EXT = $8573;
  GL_ADD_SIGNED_EXT = $8574;
  GL_INTERPOLATE_EXT = $8575;
  GL_CONSTANT_EXT = $8576;
  GL_PRIMARY_COLOR_EXT = $8577;
  GL_PREVIOUS_EXT = $8578;
  GL_SOURCE0_RGB_EXT = $8580;
  GL_SOURCE1_RGB_EXT = $8581;
  GL_SOURCE2_RGB_EXT = $8582;
  GL_SOURCE0_ALPHA_EXT = $8588;
  GL_SOURCE1_ALPHA_EXT = $8589;
  GL_SOURCE2_ALPHA_EXT = $858A;
  GL_OPERAND0_RGB_EXT = $8590;
  GL_OPERAND1_RGB_EXT = $8591;
  GL_OPERAND2_RGB_EXT = $8592;
  GL_OPERAND0_ALPHA_EXT = $8598;
  GL_OPERAND1_ALPHA_EXT = $8599;
  GL_OPERAND2_ALPHA_EXT = $859A;

  // GL_EXT_texture_env_dot3
  GL_DOT3_RGB_EXT = $8740;
  GL_DOT3_RGBA_EXT = $8741;

  // GL_EXT_texture_filter_anisotropic
  GL_TEXTURE_MAX_ANISOTROPY_EXT = $84FE;
  GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT = $84FF;

  // GL_EXT_texture_lod_bias
  GL_MAX_TEXTURE_LOD_BIAS_EXT = $84FD;
  GL_TEXTURE_FILTER_CONTROL_EXT = $8500;
  GL_TEXTURE_LOD_BIAS_EXT = $8501;

  // GL_EXT_texture_object
  GL_TEXTURE_PRIORITY_EXT = $8066;
  GL_TEXTURE_RESIDENT_EXT = $8067;
  GL_TEXTURE_1D_BINDING_EXT = $8068;
  GL_TEXTURE_2D_BINDING_EXT = $8069;
  GL_TEXTURE_3D_BINDING_EXT = $806A;

  // GL_EXT_texture_perturb_normal
  GL_PERTURB_EXT = $85AE;
  GL_TEXTURE_NORMAL_EXT = $85AF;

  // GL_EXT_texture_rectangle
  GL_TEXTURE_RECTANGLE_EXT = $84F5;
  GL_TEXTURE_BINDING_RECTANGLE_EXT = $84F6;
  GL_PROXY_TEXTURE_RECTANGLE_EXT = $84F7;
  GL_MAX_RECTANGLE_TEXTURE_SIZE_EXT = $84F8;

  // GL_EXT_vertex_array
  GL_VERTEX_ARRAY_EXT = $8074;
  GL_NORMAL_ARRAY_EXT = $8075;
  GL_COLOR_ARRAY_EXT = $8076;
  GL_INDEX_ARRAY_EXT = $8077;
  GL_TEXTURE_COORD_ARRAY_EXT = $8078;
  GL_EDGE_FLAG_ARRAY_EXT = $8079;
  GL_VERTEX_ARRAY_SIZE_EXT = $807A;
  GL_VERTEX_ARRAY_TYPE_EXT = $807B;
  GL_VERTEX_ARRAY_STRIDE_EXT = $807C;
  GL_VERTEX_ARRAY_COUNT_EXT = $807D;
  GL_NORMAL_ARRAY_TYPE_EXT = $807E;
  GL_NORMAL_ARRAY_STRIDE_EXT = $807F;
  GL_NORMAL_ARRAY_COUNT_EXT = $8080;
  GL_COLOR_ARRAY_SIZE_EXT = $8081;
  GL_COLOR_ARRAY_TYPE_EXT = $8082;
  GL_COLOR_ARRAY_STRIDE_EXT = $8083;
  GL_COLOR_ARRAY_COUNT_EXT = $8084;
  GL_INDEX_ARRAY_TYPE_EXT = $8085;
  GL_INDEX_ARRAY_STRIDE_EXT = $8086;
  GL_INDEX_ARRAY_COUNT_EXT = $8087;
  GL_TEXTURE_COORD_ARRAY_SIZE_EXT = $8088;
  GL_TEXTURE_COORD_ARRAY_TYPE_EXT = $8089;
  GL_TEXTURE_COORD_ARRAY_STRIDE_EXT = $808A;
  GL_TEXTURE_COORD_ARRAY_COUNT_EXT = $808B;
  GL_EDGE_FLAG_ARRAY_STRIDE_EXT = $808C;
  GL_EDGE_FLAG_ARRAY_COUNT_EXT = $808D;
  GL_VERTEX_ARRAY_POINTER_EXT = $808E;
  GL_NORMAL_ARRAY_POINTER_EXT = $808F;
  GL_COLOR_ARRAY_POINTER_EXT = $8090;
  GL_INDEX_ARRAY_POINTER_EXT = $8091;
  GL_TEXTURE_COORD_ARRAY_POINTER_EXT = $8092;
  GL_EDGE_FLAG_ARRAY_POINTER_EXT = $8093;

  // GL_EXT_vertex_shader
  GL_VERTEX_SHADER_EXT = $8780;
  GL_VERTEX_SHADER_BINDING_EXT = $8781;
  GL_OP_INDEX_EXT = $8782;
  GL_OP_NEGATE_EXT = $8783;
  GL_OP_DOT3_EXT = $8784;
  GL_OP_DOT4_EXT = $8785;
  GL_OP_MUL_EXT = $8786;
  GL_OP_ADD_EXT = $8787;
  GL_OP_MADD_EXT = $8788;
  GL_OP_FRAC_EXT = $8789;
  GL_OP_MAX_EXT = $878A;
  GL_OP_MIN_EXT = $878B;
  GL_OP_SET_GE_EXT = $878C;
  GL_OP_SET_LT_EXT = $878D;
  GL_OP_CLAMP_EXT = $878E;
  GL_OP_FLOOR_EXT = $878F;
  GL_OP_ROUND_EXT = $8790;
  GL_OP_EXP_BASE_2_EXT = $8791;
  GL_OP_LOG_BASE_2_EXT = $8792;
  GL_OP_POWER_EXT = $8793;
  GL_OP_RECIP_EXT = $8794;
  GL_OP_RECIP_SQRT_EXT = $8795;
  GL_OP_SUB_EXT = $8796;
  GL_OP_CROSS_PRODUCT_EXT = $8797;
  GL_OP_MULTIPLY_MATRIX_EXT = $8798;
  GL_OP_MOV_EXT = $8799;
  GL_OUTPUT_VERTEX_EXT = $879A;
  GL_OUTPUT_COLOR0_EXT = $879B;
  GL_OUTPUT_COLOR1_EXT = $879C;
  GL_OUTPUT_TEXTURE_COORD0_EXT = $879D;
  GL_OUTPUT_TEXTURE_COORD1_EXT = $879E;
  GL_OUTPUT_TEXTURE_COORD2_EXT = $879F;
  GL_OUTPUT_TEXTURE_COORD3_EXT = $87A0;
  GL_OUTPUT_TEXTURE_COORD4_EXT = $87A1;
  GL_OUTPUT_TEXTURE_COORD5_EXT = $87A2;
  GL_OUTPUT_TEXTURE_COORD6_EXT = $87A3;
  GL_OUTPUT_TEXTURE_COORD7_EXT = $87A4;
  GL_OUTPUT_TEXTURE_COORD8_EXT = $87A5;
  GL_OUTPUT_TEXTURE_COORD9_EXT = $87A6;
  GL_OUTPUT_TEXTURE_COORD10_EXT = $87A7;
  GL_OUTPUT_TEXTURE_COORD11_EXT = $87A8;
  GL_OUTPUT_TEXTURE_COORD12_EXT = $87A9;
  GL_OUTPUT_TEXTURE_COORD13_EXT = $87AA;
  GL_OUTPUT_TEXTURE_COORD14_EXT = $87AB;
  GL_OUTPUT_TEXTURE_COORD15_EXT = $87AC;
  GL_OUTPUT_TEXTURE_COORD16_EXT = $87AD;
  GL_OUTPUT_TEXTURE_COORD17_EXT = $87AE;
  GL_OUTPUT_TEXTURE_COORD18_EXT = $87AF;
  GL_OUTPUT_TEXTURE_COORD19_EXT = $87B0;
  GL_OUTPUT_TEXTURE_COORD20_EXT = $87B1;
  GL_OUTPUT_TEXTURE_COORD21_EXT = $87B2;
  GL_OUTPUT_TEXTURE_COORD22_EXT = $87B3;
  GL_OUTPUT_TEXTURE_COORD23_EXT = $87B4;
  GL_OUTPUT_TEXTURE_COORD24_EXT = $87B5;
  GL_OUTPUT_TEXTURE_COORD25_EXT = $87B6;
  GL_OUTPUT_TEXTURE_COORD26_EXT = $87B7;
  GL_OUTPUT_TEXTURE_COORD27_EXT = $87B8;
  GL_OUTPUT_TEXTURE_COORD28_EXT = $87B9;
  GL_OUTPUT_TEXTURE_COORD29_EXT = $87BA;
  GL_OUTPUT_TEXTURE_COORD30_EXT = $87BB;
  GL_OUTPUT_TEXTURE_COORD31_EXT = $87BC;
  GL_OUTPUT_FOG_EXT = $87BD;
  GL_SCALAR_EXT = $87BE;
  GL_VECTOR_EXT = $87BF;
  GL_MATRIX_EXT = $87C0;
  GL_VARIANT_EXT = $87C1;
  GL_INVARIANT_EXT = $87C2;
  GL_LOCAL_CONSTANT_EXT = $87C3;
  GL_LOCAL_EXT = $87C4;
  GL_MAX_VERTEX_SHADER_INSTRUCTIONS_EXT = $87C5;
  GL_MAX_VERTEX_SHADER_VARIANTS_EXT = $87C6;
  GL_MAX_VERTEX_SHADER_INVARIANTS_EXT = $87C7;
  GL_MAX_VERTEX_SHADER_LOCAL_CONSTANTS_EXT = $87C8;
  GL_MAX_VERTEX_SHADER_LOCALS_EXT = $87C9;
  GL_MAX_OPTIMIZED_VERTEX_SHADER_INSTRUCTIONS_EXT = $87CA;
  GL_MAX_OPTIMIZED_VERTEX_SHADER_VARIANTS_EXT = $87CB;
  GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCAL_CONSTANTS_EXT = $87CC;
  GL_MAX_OPTIMIZED_VERTEX_SHADER_INVARIANTS_EXT = $87CD;
  GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCALS_EXT = $87CE;
  GL_VERTEX_SHADER_INSTRUCTIONS_EXT = $87CF;
  GL_VERTEX_SHADER_VARIANTS_EXT = $87D0;
  GL_VERTEX_SHADER_INVARIANTS_EXT = $87D1;
  GL_VERTEX_SHADER_LOCAL_CONSTANTS_EXT = $87D2;
  GL_VERTEX_SHADER_LOCALS_EXT = $87D3;
  GL_VERTEX_SHADER_OPTIMIZED_EXT = $87D4;
  GL_X_EXT = $87D5;
  GL_Y_EXT = $87D6;
  GL_Z_EXT = $87D7;
  GL_W_EXT = $87D8;
  GL_NEGATIVE_X_EXT = $87D9;
  GL_NEGATIVE_Y_EXT = $87DA;
  GL_NEGATIVE_Z_EXT = $87DB;
  GL_NEGATIVE_W_EXT = $87DC;
  GL_ZERO_EXT = $87DD;
  GL_ONE_EXT = $87DE;
  GL_NEGATIVE_ONE_EXT = $87DF;
  GL_NORMALIZED_RANGE_EXT = $87E0;
  GL_FULL_RANGE_EXT = $87E1;
  GL_CURRENT_VERTEX_EXT = $87E2;
  GL_MVP_MATRIX_EXT = $87E3;
  GL_VARIANT_VALUE_EXT = $87E4;
  GL_VARIANT_DATATYPE_EXT = $87E5;
  GL_VARIANT_ARRAY_STRIDE_EXT = $87E6;
  GL_VARIANT_ARRAY_TYPE_EXT = $87E7;
  GL_VARIANT_ARRAY_EXT = $87E8;
  GL_VARIANT_ARRAY_POINTER_EXT = $87E9;
  GL_INVARIANT_VALUE_EXT = $87EA;
  GL_INVARIANT_DATATYPE_EXT = $87EB;
  GL_LOCAL_CONSTANT_VALUE_EXT = $87EC;
  GL_LOCAL_CONSTANT_DATATYPE_EXT = $87ED;

  // GL_EXT_vertex_weighting
  GL_MODELVIEW0_STACK_DEPTH_EXT = $0BA3;
  GL_MODELVIEW1_STACK_DEPTH_EXT = $8502;
  GL_MODELVIEW0_MATRIX_EXT = $0BA6;
  GL_MODELVIEW1_MATRIX_EXT = $8506;
  GL_VERTEX_WEIGHTING_EXT = $8509;
  GL_MODELVIEW0_EXT = $1700;
  GL_MODELVIEW1_EXT = $850A;
  GL_CURRENT_VERTEX_WEIGHT_EXT = $850B;
  GL_VERTEX_WEIGHT_ARRAY_EXT = $850C;
  GL_VERTEX_WEIGHT_ARRAY_SIZE_EXT = $850D;
  GL_VERTEX_WEIGHT_ARRAY_TYPE_EXT = $850E;
  GL_VERTEX_WEIGHT_ARRAY_STRIDE_EXT = $850F;
  GL_VERTEX_WEIGHT_ARRAY_POINTER_EXT = $8510;

  // GL_EXT_depth_bounds_test
  GL_DEPTH_BOUNDS_TEST_EXT = $8890;
  GL_DEPTH_BOUNDS_EXT = $8891;

  // GL_EXT_texture_mirror_clamp
  GL_MIRROR_CLAMP_EXT = $8742;
  GL_MIRROR_CLAMP_TO_EDGE_EXT = $8743;
  GL_MIRROR_CLAMP_TO_BORDER_EXT = $8912;

  // GL_EXT_blend_equation_separate
  GL_BLEND_EQUATION_RGB_EXT = $8009; 
  GL_BLEND_EQUATION_ALPHA_EXT = $883D;

  // GL_EXT_pixel_buffer_object
  GL_PIXEL_PACK_BUFFER_EXT = $88EB;
  GL_PIXEL_UNPACK_BUFFER_EXT = $88EC;
  GL_PIXEL_PACK_BUFFER_BINDING_EXT = $88ED;
  GL_PIXEL_UNPACK_BUFFER_BINDING_EXT = $88EF;

  // GL_EXT_stencil_clear_tag
  GL_STENCIL_TAG_BITS_EXT = $88F2;
  GL_STENCIL_CLEAR_TAG_VALUE_EXT = $88F3;

  // GL_EXT_packed_depth_stencil
  GL_DEPTH_STENCIL_EXT = $84F9;
  GL_UNSIGNED_INT_24_8_EXT = $84FA;
  GL_DEPTH24_STENCIL8_EXT = $88F0;
  GL_TEXTURE_STENCIL_SIZE_EXT = $88F1;

  // GL_EXT_texture_sRGB
  GL_SRGB_EXT = $8C40;
  GL_SRGB8_EXT = $8C41;
  GL_SRGB_ALPHA_EXT = $8C42;
  GL_SRGB8_ALPHA8_EXT = $8C43;
  GL_SLUMINANCE_ALPHA_EXT = $8C44;
  GL_SLUMINANCE8_ALPHA8_EXT = $8C45;
  GL_SLUMINANCE_EXT = $8C46;
  GL_SLUMINANCE8_EXT = $8C47;
  GL_COMPRESSED_SRGB_EXT = $8C48;
  GL_COMPRESSED_SRGB_ALPHA_EXT = $8C49;
  GL_COMPRESSED_SLUMINANCE_EXT = $8C4A;
  GL_COMPRESSED_SLUMINANCE_ALPHA_EXT = $8C4B;
  GL_COMPRESSED_SRGB_S3TC_DXT1_EXT = $8C4C;
  GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT1_EXT = $8C4D;
  GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT3_EXT = $8C4E;
  GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT = $8C4F;

  // GL_EXT_framebuffer_blit
  GL_READ_FRAMEBUFFER_EXT = $8CA8;
  GL_DRAW_FRAMEBUFFER_EXT = $8CA9;
  GL_READ_FRAMEBUFFER_BINDING_EXT = GL_FRAMEBUFFER_BINDING_EXT;
  GL_DRAW_FRAMEBUFFER_BINDING_EXT = $8CAA;

  // GL_EXT_framebuffer_multisample
  GL_RENDERBUFFER_SAMPLES_EXT = $8CAB;
  GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_EXT = $8D56;
  GL_MAX_SAMPLES_EXT = $8D57;

  // GL_EXT_timer_query
  GL_TIME_ELAPSED_EXT = $88BF;

  // GL_EXT_bindable_uniform
  GL_MAX_VERTEX_BINDABLE_UNIFORMS_EXT = $8DE2;
  GL_MAX_FRAGMENT_BINDABLE_UNIFORMS_EXT = $8DE3;
  GL_MAX_GEOMETRY_BINDABLE_UNIFORMS_EXT = $8DE4;
  GL_MAX_BINDABLE_UNIFORM_SIZE_EXT = $8DED;
  GL_UNIFORM_BUFFER_EXT = $8DEE;
  GL_UNIFORM_BUFFER_BINDING_EXT = $8DEF;

  // GL_EXT_framebuffer_sRGB
  GLX_FRAMEBUFFER_SRGB_CAPABLE_EXT = $20B2;
  WGL_FRAMEBUFFER_SRGB_CAPABLE_EXT = $20A9;
  GL_FRAMEBUFFER_SRGB_EXT = $8DB9;
  GL_FRAMEBUFFER_SRGB_CAPABLE_EXT = $8DBA;

  // GL_EXT_geometry_shader4
  GL_GEOMETRY_SHADER_EXT = $8DD9;
  GL_GEOMETRY_VERTICES_OUT_EXT = $8DDA;
  GL_GEOMETRY_INPUT_TYPE_EXT = $8DDB;
  GL_GEOMETRY_OUTPUT_TYPE_EXT = $8DDC;
  GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_EXT = $8C29;
  GL_MAX_GEOMETRY_VARYING_COMPONENTS_EXT = $8DDD;
  GL_MAX_VERTEX_VARYING_COMPONENTS_EXT = $8DDE;
  GL_MAX_VARYING_COMPONENTS_EXT = $8B4B;
  GL_MAX_GEOMETRY_UNIFORM_COMPONENTS_EXT = $8DDF;
  GL_MAX_GEOMETRY_OUTPUT_VERTICES_EXT = $8DE0;
  GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_EXT = $8DE1;
  GL_LINES_ADJACENCY_EXT = $A;
  GL_LINE_STRIP_ADJACENCY_EXT = $B;
  GL_TRIANGLES_ADJACENCY_EXT = $C;
  GL_TRIANGLE_STRIP_ADJACENCY_EXT = $D;
  GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_EXT = $8DA8;
  GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_EXT = $8DA9;
  GL_FRAMEBUFFER_ATTACHMENT_LAYERED_EXT = $8DA7;
  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER_EXT = $8CD4;
  GL_PROGRAM_POINT_SIZE_EXT = $8642;

  // GL_EXT_gpu_shader4
  GL_VERTEX_ATTRIB_ARRAY_INTEGER_EXT = $88FD;
  GL_SAMPLER_1D_ARRAY_EXT = $8DC0;
  GL_SAMPLER_2D_ARRAY_EXT = $8DC1;
  GL_SAMPLER_BUFFER_EXT = $8DC2;
  GL_SAMPLER_1D_ARRAY_SHADOW_EXT = $8DC3;
  GL_SAMPLER_2D_ARRAY_SHADOW_EXT = $8DC4;
  GL_SAMPLER_CUBE_SHADOW_EXT = $8DC5;
  GL_UNSIGNED_INT_VEC2_EXT = $8DC6;
  GL_UNSIGNED_INT_VEC3_EXT = $8DC7;
  GL_UNSIGNED_INT_VEC4_EXT = $8DC8;
  GL_INT_SAMPLER_1D_EXT = $8DC9;
  GL_INT_SAMPLER_2D_EXT = $8DCA;
  GL_INT_SAMPLER_3D_EXT = $8DCB;
  GL_INT_SAMPLER_CUBE_EXT = $8DCC;
  GL_INT_SAMPLER_2D_RECT_EXT = $8DCD;
  GL_INT_SAMPLER_1D_ARRAY_EXT = $8DCE;
  GL_INT_SAMPLER_2D_ARRAY_EXT = $8DCF;
  GL_INT_SAMPLER_BUFFER_EXT = $8DD0;
  GL_UNSIGNED_INT_SAMPLER_1D_EXT = $8DD1;
  GL_UNSIGNED_INT_SAMPLER_2D_EXT = $8DD2;
  GL_UNSIGNED_INT_SAMPLER_3D_EXT = $8DD3;
  GL_UNSIGNED_INT_SAMPLER_CUBE_EXT = $8DD4;
  GL_UNSIGNED_INT_SAMPLER_2D_RECT_EXT = $8DD5;
  GL_UNSIGNED_INT_SAMPLER_1D_ARRAY_EXT = $8DD6;
  GL_UNSIGNED_INT_SAMPLER_2D_ARRAY_EXT = $8DD7;
  GL_UNSIGNED_INT_SAMPLER_BUFFER_EXT = $8DD8;
  GL_MIN_PROGRAM_TEXEL_OFFSET_EXT = $8904;
  GL_MAX_PROGRAM_TEXEL_OFFSET_EXT = $8905;

  // GL_EXT_packed_float
  GL_R11F_G11F_B10F_EXT = $8C3A;
  GL_UNSIGNED_INT_10F_11F_11F_REV_EXT = $8C3B;
  RGBA_SIGNED_COMPONENTS_EXT = $8C3C;
  WGL_TYPE_RGBA_UNSIGNED_FLOAT_EXT = $20A8;
  GLX_RGBA_UNSIGNED_FLOAT_TYPE_EXT = $20B1;
  GLX_RGBA_UNSIGNED_FLOAT_BIT_EXT = $00000008;

  // GL_EXT_texture_array
  GL_TEXTURE_1D_ARRAY_EXT = $8C18;
  GL_TEXTURE_2D_ARRAY_EXT = $8C1A;
  GL_PROXY_TEXTURE_2D_ARRAY_EXT = $8C1B;
  GL_PROXY_TEXTURE_1D_ARRAY_EXT = $8C19;
  GL_TEXTURE_BINDING_1D_ARRAY_EXT = $8C1C;
  GL_TEXTURE_BINDING_2D_ARRAY_EXT = $8C1D;
  GL_MAX_ARRAY_TEXTURE_LAYERS_EXT = $88FF;
  GL_COMPARE_REF_DEPTH_TO_TEXTURE_EXT = $884E;

  // GL_EXT_texture_buffer_object
  GL_TEXTURE_BUFFER_EXT = $8C2A;
  GL_MAX_TEXTURE_BUFFER_SIZE_EXT = $8C2B;
  GL_TEXTURE_BINDING_BUFFER_EXT = $8C2C;
  GL_TEXTURE_BUFFER_DATA_STORE_BINDING_EXT = $8C2D;
  GL_TEXTURE_BUFFER_FORMAT_EXT = $8C2E;

  // GL_EXT_texture_compression_latc
  GL_COMPRESSED_LUMINANCE_LATC1_EXT = $8C70;
  GL_COMPRESSED_SIGNED_LUMINANCE_LATC1_EXT = $8C71;
  GL_COMPRESSED_LUMINANCE_ALPHA_LATC2_EXT = $8C72;
  GL_COMPRESSED_SIGNED_LUMINANCE_ALPHA_LATC2_EXT = $8C73;

  // GL_EXT_texture_compression_rgtc
  GL_COMPRESSED_RED_RGTC1_EXT = $8DBB;
  GL_COMPRESSED_SIGNED_RED_RGTC1_EXT = $8DBC;
  GL_COMPRESSED_RED_GREEN_RGTC2_EXT = $8DBD;
  GL_COMPRESSED_SIGNED_RED_GREEN_RGTC2_EXT = $8DBE;

  // GL_EXT_texture_integer
  GL_RGBA_INTEGER_MODE_EXT = $8D9E;
  GL_RGBA32UI_EXT = $8D70;
  GL_RGB32UI_EXT = $8D71;
  GL_ALPHA32UI_EXT = $8D72;
  GL_INTENSITY32UI_EXT = $8D73;
  GL_LUMINANCE32UI_EXT = $8D74;
  GL_LUMINANCE_ALPHA32UI_EXT = $8D75;
  GL_RGBA16UI_EXT = $8D76;
  GL_RGB16UI_EXT = $8D77;
  GL_ALPHA16UI_EXT = $8D78;
  GL_INTENSITY16UI_EXT = $8D79;
  GL_LUMINANCE16UI_EXT = $8D7A;
  GL_LUMINANCE_ALPHA16UI_EXT = $8D7B;
  GL_RGBA8UI_EXT = $8D7C;
  GL_RGB8UI_EXT = $8D7D;
  GL_ALPHA8UI_EXT = $8D7E;
  GL_INTENSITY8UI_EXT = $8D7F;
  GL_LUMINANCE8UI_EXT = $8D80;
  GL_LUMINANCE_ALPHA8UI_EXT = $8D81;
  GL_RGBA32I_EXT = $8D82;
  GL_RGB32I_EXT = $8D83;
  GL_ALPHA32I_EXT = $8D84;
  GL_INTENSITY32I_EXT = $8D85;
  GL_LUMINANCE32I_EXT = $8D86;
  GL_LUMINANCE_ALPHA32I_EXT = $8D87;
  GL_RGBA16I_EXT = $8D88;
  GL_RGB16I_EXT = $8D89;
  GL_ALPHA16I_EXT = $8D8A;
  GL_INTENSITY16I_EXT = $8D8B;
  GL_LUMINANCE16I_EXT = $8D8C;
  GL_LUMINANCE_ALPHA16I_EXT = $8D8D;
  GL_RGBA8I_EXT = $8D8E;
  GL_RGB8I_EXT = $8D8F;
  GL_ALPHA8I_EXT = $8D90;
  GL_INTENSITY8I_EXT = $8D91;
  GL_LUMINANCE8I_EXT = $8D92;
  GL_LUMINANCE_ALPHA8I_EXT = $8D93;
  GL_RED_INTEGER_EXT = $8D94;
  GL_GREEN_INTEGER_EXT = $8D95;
  GL_BLUE_INTEGER_EXT = $8D96;
  GL_ALPHA_INTEGER_EXT = $8D97;
  GL_RGB_INTEGER_EXT = $8D98;
  GL_RGBA_INTEGER_EXT = $8D99;
  GL_BGR_INTEGER_EXT = $8D9A;
  GL_BGRA_INTEGER_EXT = $8D9B;
  GL_LUMINANCE_INTEGER_EXT = $8D9C;
  GL_LUMINANCE_ALPHA_INTEGER_EXT = $8D9D;

  // GL_EXT_texture_shared_exponent
  GL_RGB9_E5_EXT = $8C3D;
  GL_UNSIGNED_INT_5_9_9_9_REV_EXT = $8C3E;
  GL_TEXTURE_SHARED_SIZE_EXT = $8C3F;

  // GL_EXT_transform_feedback
  GL_TRANSFORM_FEEDBACK_BUFFER_EXT = $8C8E;
  GL_TRANSFORM_FEEDBACK_BUFFER_START_EXT = $8C84;
  GL_TRANSFORM_FEEDBACK_BUFFER_SIZE_EXT = $8C85;
  GL_TRANSFORM_FEEDBACK_BUFFER_BINDING_EXT = $8C8F;
  GL_INTERLEAVED_ATTRIBS_EXT = $8C8C;
  GL_SEPARATE_ATTRIBS_EXT = $8C8D;
  GL_PRIMITIVES_GENERATED_EXT = $8C87;
  GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN_EXT = $8C88;
  GL_RASTERIZER_DISCARD_EXT = $8C89;
  GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS_EXT = $8C8A;
  GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS_EXT = $8C8B;
  GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS_EXT = $8C80;
  GL_TRANSFORM_FEEDBACK_VARYINGS_EXT = $8C83;
  GL_TRANSFORM_FEEDBACK_BUFFER_MODE_EXT = $8C7F;
  GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH_EXT = $8C76;

  // GL_EXT_direct_state_access
  GL_PROGRAM_MATRIX_EXT = $8E2D;
  GL_TRANSPOSE_PROGRAM_MATRIX_EXT = $8E2E;
  GL_PROGRAM_MATRIX_STACK_DEPTH_EXT = $8E2F;

  // GL_EXT_texture_swizzle
  GL_TEXTURE_SWIZZLE_R_EXT = $8E42;
  GL_TEXTURE_SWIZZLE_G_EXT = $8E43;
  GL_TEXTURE_SWIZZLE_B_EXT = $8E44;
  GL_TEXTURE_SWIZZLE_A_EXT = $8E45;
  GL_TEXTURE_SWIZZLE_RGBA_EXT = $8E46;

  // GL_EXT_provoking_vertex
  GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION_EXT = $8E4C;
  GL_FIRST_VERTEX_CONVENTION_EXT = $8E4D;
  GL_LAST_VERTEX_CONVENTION_EXT = $8E4E;
  GL_PROVOKING_VERTEX_EXT = $8E4F;
  
  // GL_EXT_texture_snorm
  GL_ALPHA_SNORM = $9010;
  GL_LUMINANCE_SNORM = $9011;
  GL_LUMINANCE_ALPHA_SNORM = $9012;
  GL_INTENSITY_SNORM = $9013;
  GL_ALPHA8_SNORM = $9014;
  GL_LUMINANCE8_SNORM = $9015;
  GL_LUMINANCE8_ALPHA8_SNORM = $9016;
  GL_INTENSITY8_SNORM = $9017;
  GL_ALPHA16_SNORM = $9018;
  GL_LUMINANCE16_SNORM = $9019;
  GL_LUMINANCE16_ALPHA16_SNORM = $901A;
  GL_INTENSITY16_SNORM = $901B;
  { reuse GL_RED_SNORM }
  { reuse GL_RG_SNORM }
  { reuse GL_RGB_SNORM }
  { reuse GL_RGBA_SNORM }
  { reuse GL_R8_SNORM }
  { reuse GL_RG8_SNORM }
  { reuse GL_RGB8_SNORM }
  { reuse GL_RGBA8_SNORM }
  { reuse GL_R16_SNORM }
  { reuse GL_RG16_SNORM }
  { reuse GL_RGB16_SNORM }
  { reuse GL_RGBA16_SNORM }
  { reuse GL_SIGNED_NORMALIZED }
  
  // GL_EXT_separate_shader_objects
  GL_ACTIVE_PROGRAM_EXT = $8B8D;
  
  // GL_EXT_shader_image_load_store
  GL_MAX_IMAGE_UNITS_EXT = $8F38;
  GL_MAX_COMBINED_IMAGE_UNITS_AND_FRAGMENT_OUTPUTS_EXT = $8F39;
  GL_IMAGE_BINDING_NAME_EXT = $8F3A;
  GL_IMAGE_BINDING_LEVEL_EXT = $8F3B;
  GL_IMAGE_BINDING_LAYERED_EXT = $8F3C;
  GL_IMAGE_BINDING_LAYER_EXT = $8F3D;
  GL_IMAGE_BINDING_ACCESS_EXT = $8F3E;
  GL_IMAGE_1D_EXT = $904C;
  GL_IMAGE_2D_EXT = $904D;
  GL_IMAGE_3D_EXT = $904E;
  GL_IMAGE_2D_RECT_EXT = $904F;
  GL_IMAGE_CUBE_EXT = $9050;
  GL_IMAGE_BUFFER_EXT = $9051;
  GL_IMAGE_1D_ARRAY_EXT = $9052;
  GL_IMAGE_2D_ARRAY_EXT = $9053;
  GL_IMAGE_CUBE_MAP_ARRAY_EXT = $9054;
  GL_IMAGE_2D_MULTISAMPLE_EXT = $9055;
  GL_IMAGE_2D_MULTISAMPLE_ARRAY_EXT = $9056;
  GL_INT_IMAGE_1D_EXT = $9057;
  GL_INT_IMAGE_2D_EXT = $9058;
  GL_INT_IMAGE_3D_EXT = $9059;
  GL_INT_IMAGE_2D_RECT_EXT = $905A;
  GL_INT_IMAGE_CUBE_EXT = $905B;
  GL_INT_IMAGE_BUFFER_EXT = $905C;
  GL_INT_IMAGE_1D_ARRAY_EXT = $905D;
  GL_INT_IMAGE_2D_ARRAY_EXT = $905E;
  GL_INT_IMAGE_CUBE_MAP_ARRAY_EXT = $905F;
  GL_INT_IMAGE_2D_MULTISAMPLE_EXT = $9060;
  GL_INT_IMAGE_2D_MULTISAMPLE_ARRAY_EXT = $9061;
  GL_UNSIGNED_INT_IMAGE_1D_EXT = $9062;
  GL_UNSIGNED_INT_IMAGE_2D_EXT = $9063;
  GL_UNSIGNED_INT_IMAGE_3D_EXT = $9064;
  GL_UNSIGNED_INT_IMAGE_2D_RECT_EXT = $9065;
  GL_UNSIGNED_INT_IMAGE_CUBE_EXT = $9066;
  GL_UNSIGNED_INT_IMAGE_BUFFER_EXT = $9067;
  GL_UNSIGNED_INT_IMAGE_1D_ARRAY_EXT = $9068;
  GL_UNSIGNED_INT_IMAGE_2D_ARRAY_EXT = $9069;
  GL_UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY_EXT = $906A;
  GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_EXT = $906B;
  GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_ARRAY_EXT = $906C;
  GL_MAX_IMAGE_SAMPLES_EXT = $906D;
  GL_IMAGE_BINDING_FORMAT_EXT = $906E;
  GL_VERTEX_ATTRIB_ARRAY_BARRIER_BIT_EXT = $00000001;
  GL_ELEMENT_ARRAY_BARRIER_BIT_EXT = $00000002;
  GL_UNIFORM_BARRIER_BIT_EXT = $00000004;
  GL_TEXTURE_FETCH_BARRIER_BIT_EXT = $00000008;
  GL_SHADER_IMAGE_ACCESS_BARRIER_BIT_EXT = $00000020;
  GL_COMMAND_BARRIER_BIT_EXT = $00000040;
  GL_PIXEL_BUFFER_BARRIER_BIT_EXT = $00000080;
  GL_TEXTURE_UPDATE_BARRIER_BIT_EXT = $00000100;
  GL_BUFFER_UPDATE_BARRIER_BIT_EXT = $00000200;
  GL_FRAMEBUFFER_BARRIER_BIT_EXT = $00000400;
  GL_TRANSFORM_FEEDBACK_BARRIER_BIT_EXT = $00000800;
  GL_ATOMIC_COUNTER_BARRIER_BIT_EXT = $00001000;
  GL_ALL_BARRIER_BITS_EXT = $FFFFFFFF;
  
  // GL_EXT_vertex_attrib_64bit
  { reuse GL_DOUBLE }
  GL_DOUBLE_VEC2_EXT = $8FFC;
  GL_DOUBLE_VEC3_EXT = $8FFD;
  GL_DOUBLE_VEC4_EXT = $8FFE;
  GL_DOUBLE_MAT2_EXT = $8F46;
  GL_DOUBLE_MAT3_EXT = $8F47;
  GL_DOUBLE_MAT4_EXT = $8F48;
  GL_DOUBLE_MAT2x3_EXT = $8F49;
  GL_DOUBLE_MAT2x4_EXT = $8F4A;
  GL_DOUBLE_MAT3x2_EXT = $8F4B;
  GL_DOUBLE_MAT3x4_EXT = $8F4C;
  GL_DOUBLE_MAT4x2_EXT = $8F4D;
  GL_DOUBLE_MAT4x3_EXT = $8F4E;

  // GL_EXT_texture_sRGB_decode
  GL_TEXTURE_SRGB_DECODE_EXT = $8A48;
  GL_DECODE_EXT = $8A49;
  GL_SKIP_DECODE_EXT = $8A4A;

  // GL_FfdMaskSGIX
  GL_TEXTURE_DEFORMATION_BIT_SGIX = $00000001;
  GL_GEOMETRY_DEFORMATION_BIT_SGIX = $00000002;

  // GL_HP_convolution_border_modes
  GL_IGNORE_BORDER_HP = $8150;
  GL_CONSTANT_BORDER_HP = $8151;
  GL_REPLICATE_BORDER_HP = $8153;
  GL_CONVOLUTION_BORDER_COLOR_HP = $8154;

  // GL_HP_image_transform
  GL_IMAGE_SCALE_X_HP = $8155;
  GL_IMAGE_SCALE_Y_HP = $8156;
  GL_IMAGE_TRANSLATE_X_HP = $8157;
  GL_IMAGE_TRANSLATE_Y_HP = $8158;
  GL_IMAGE_ROTATE_ANGLE_HP = $8159;
  GL_IMAGE_ROTATE_ORIGIN_X_HP = $815A;
  GL_IMAGE_ROTATE_ORIGIN_Y_HP = $815B;
  GL_IMAGE_MAG_FILTER_HP = $815C;
  GL_IMAGE_MIN_FILTER_HP = $815D;
  GL_IMAGE_CUBIC_WEIGHT_HP = $815E;
  GL_CUBIC_HP = $815F;
  GL_AVERAGE_HP = $8160;
  GL_IMAGE_TRANSFORM_2D_HP = $8161;
  GL_POST_IMAGE_TRANSFORM_COLOR_TABLE_HP = $8162;
  GL_PROXY_POST_IMAGE_TRANSFORM_COLOR_TABLE_HP = $8163;

  // GL_HP_occlusion_test
  GL_OCCLUSION_TEST_HP = $8165;
  GL_OCCLUSION_TEST_RESULT_HP = $8166;

  // GL_HP_texture_lighting
  GL_TEXTURE_LIGHTING_MODE_HP = $8167;
  GL_TEXTURE_POST_SPECULAR_HP = $8168;
  GL_TEXTURE_PRE_SPECULAR_HP = $8169;

  // GL_IBM_cull_vertex
  GL_CULL_VERTEX_IBM = 103050;

  // GL_IBM_rasterpos_clip
  GL_RASTER_POSITION_UNCLIPPED_IBM = $19262;

  // GL_IBM_texture_mirrored_repeat
  GL_MIRRORED_REPEAT_IBM = $8370;

  // GL_IBM_vertex_array_lists
  GL_VERTEX_ARRAY_LIST_IBM = 103070;
  GL_NORMAL_ARRAY_LIST_IBM = 103071;
  GL_COLOR_ARRAY_LIST_IBM = 103072;
  GL_INDEX_ARRAY_LIST_IBM = 103073;
  GL_TEXTURE_COORD_ARRAY_LIST_IBM = 103074;
  GL_EDGE_FLAG_ARRAY_LIST_IBM = 103075;
  GL_FOG_COORDINATE_ARRAY_LIST_IBM = 103076;
  GL_SECONDARY_COLOR_ARRAY_LIST_IBM = 103077;
  GL_VERTEX_ARRAY_LIST_STRIDE_IBM = 103080;
  GL_NORMAL_ARRAY_LIST_STRIDE_IBM = 103081;
  GL_COLOR_ARRAY_LIST_STRIDE_IBM = 103082;
  GL_INDEX_ARRAY_LIST_STRIDE_IBM = 103083;
  GL_TEXTURE_COORD_ARRAY_LIST_STRIDE_IBM = 103084;
  GL_EDGE_FLAG_ARRAY_LIST_STRIDE_IBM = 103085;
  GL_FOG_COORDINATE_ARRAY_LIST_STRIDE_IBM = 103086;
  GL_SECONDARY_COLOR_ARRAY_LIST_STRIDE_IBM = 103087;

  // GL_INGR_color_clamp
  GL_RED_MIN_CLAMP_INGR = $8560;
  GL_GREEN_MIN_CLAMP_INGR = $8561;
  GL_BLUE_MIN_CLAMP_INGR = $8562;
  GL_ALPHA_MIN_CLAMP_INGR = $8563;
  GL_RED_MAX_CLAMP_INGR = $8564;
  GL_GREEN_MAX_CLAMP_INGR = $8565;
  GL_BLUE_MAX_CLAMP_INGR = $8566;
  GL_ALPHA_MAX_CLAMP_INGR = $8567;

  // GL_INGR_interlace_read
  GL_INTERLACE_READ_INGR = $8568;

  // GL_INTEL_parallel_arrays
  GL_PARALLEL_ARRAYS_INTEL = $83F4;
  GL_VERTEX_ARRAY_PARALLEL_POINTERS_INTEL = $83F5;
  GL_NORMAL_ARRAY_PARALLEL_POINTERS_INTEL = $83F6;
  GL_COLOR_ARRAY_PARALLEL_POINTERS_INTEL = $83F7;
  GL_TEXTURE_COORD_ARRAY_PARALLEL_POINTERS_INTEL = $83F8;

  // GL_NV_copy_depth_to_color
  GL_DEPTH_STENCIL_TO_RGBA_NV = $886E;
  GL_DEPTH_STENCIL_TO_BGRA_NV = $886F;

  // GL_NV_depth_clamp
  GL_DEPTH_CLAMP_NV = $864F;

  // GL_NV_evaluators
  GL_EVAL_2D_NV = $86C0;
  GL_EVAL_TRIANGULAR_2D_NV = $86C1;
  GL_MAP_TESSELLATION_NV = $86C2;
  GL_MAP_ATTRIB_U_ORDER_NV = $86C3;
  GL_MAP_ATTRIB_V_ORDER_NV = $86C4;
  GL_EVAL_FRACTIONAL_TESSELLATION_NV = $86C5;
  GL_EVAL_VERTEX_ATTRIB0_NV = $86C6;
  GL_EVAL_VERTEX_ATTRIB1_NV = $86C7;
  GL_EVAL_VERTEX_ATTRIB2_NV = $86C8;
  GL_EVAL_VERTEX_ATTRIB3_NV = $86C9;
  GL_EVAL_VERTEX_ATTRIB4_NV = $86CA;
  GL_EVAL_VERTEX_ATTRIB5_NV = $86CB;
  GL_EVAL_VERTEX_ATTRIB6_NV = $86CC;
  GL_EVAL_VERTEX_ATTRIB7_NV = $86CD;
  GL_EVAL_VERTEX_ATTRIB8_NV = $86CE;
  GL_EVAL_VERTEX_ATTRIB9_NV = $86CF;
  GL_EVAL_VERTEX_ATTRIB10_NV = $86D0;
  GL_EVAL_VERTEX_ATTRIB11_NV = $86D1;
  GL_EVAL_VERTEX_ATTRIB12_NV = $86D2;
  GL_EVAL_VERTEX_ATTRIB13_NV = $86D3;
  GL_EVAL_VERTEX_ATTRIB14_NV = $86D4;
  GL_EVAL_VERTEX_ATTRIB15_NV = $86D5;
  GL_MAX_MAP_TESSELLATION_NV = $86D6;
  GL_MAX_RATIONAL_EVAL_ORDER_NV = $86D7;

  // GL_NV_fence
  GL_ALL_COMPLETED_NV = $84F2;
  GL_FENCE_STATUS_NV = $84F3;
  GL_FENCE_CONDITION_NV = $84F4;

  // GL_NV_float_buffer
  GL_FLOAT_R_NV = $8880;
  GL_FLOAT_RG_NV = $8881;
  GL_FLOAT_RGB_NV = $8882;
  GL_FLOAT_RGBA_NV = $8883;
  GL_FLOAT_R16_NV = $8884;
  GL_FLOAT_R32_NV = $8885;
  GL_FLOAT_RG16_NV = $8886;
  GL_FLOAT_RG32_NV = $8887;
  GL_FLOAT_RGB16_NV = $8888;
  GL_FLOAT_RGB32_NV = $8889;
  GL_FLOAT_RGBA16_NV = $888A;
  GL_FLOAT_RGBA32_NV = $888B;
  GL_TEXTURE_FLOAT_COMPONENTS_NV = $888C;
  GL_FLOAT_CLEAR_COLOR_VALUE_NV = $888D;
  GL_FLOAT_RGBA_MODE_NV = $888E;

  // GL_NV_fog_distance
  GL_FOG_DISTANCE_MODE_NV = $855A;
  GL_EYE_RADIAL_NV = $855B;
  GL_EYE_PLANE_ABSOLUTE_NV = $855C;

  // GL_NV_fragment_program
  GL_MAX_FRAGMENT_PROGRAM_LOCAL_PARAMETERS_NV = $8868;
  GL_FRAGMENT_PROGRAM_NV = $8870;
  GL_MAX_TEXTURE_COORDS_NV = $8871;
  GL_MAX_TEXTURE_IMAGE_UNITS_NV = $8872;
  GL_FRAGMENT_PROGRAM_BINDING_NV = $8873;
  GL_PROGRAM_ERROR_STRING_NV = $8874;

  // GL_NV_half_float
  GL_HALF_FLOAT_NV = $140B;

  // GL_NV_light_max_exponent
  GL_MAX_SHININESS_NV = $8504;
  GL_MAX_SPOT_EXPONENT_NV = $8505;

  // GL_NV_multisample_filter_hint
  GL_MULTISAMPLE_FILTER_HINT_NV = $8534;

  // GL_NV_occlusion_query
  GL_PIXEL_COUNTER_BITS_NV = $8864;
  GL_CURRENT_OCCLUSION_QUERY_ID_NV = $8865;
  GL_PIXEL_COUNT_NV = $8866;
  GL_PIXEL_COUNT_AVAILABLE_NV = $8867;

  // GL_NV_packed_depth_stencil
  GL_DEPTH_STENCIL_NV = $84F9;
  GL_UNSIGNED_INT_24_8_NV = $84FA;

  // GL_NV_pixel_data_range
  GL_WRITE_PIXEL_DATA_RANGE_NV = $8878;
  GL_READ_PIXEL_DATA_RANGE_NV = $8879;
  GL_WRITE_PIXEL_DATA_RANGE_LENGTH_NV = $887A;
  GL_READ_PIXEL_DATA_RANGE_LENGTH_NV = $887B;
  GL_WRITE_PIXEL_DATA_RANGE_POINTER_NV = $887C;
  GL_READ_PIXEL_DATA_RANGE_POINTER_NV = $887D;

  // GL_NV_point_sprite
  GL_POINT_SPRITE_NV = $8861;
  GL_COORD_REPLACE_NV = $8862;
  GL_POINT_SPRITE_R_MODE_NV = $8863;

  // GL_NV_primitive_restart
  GL_PRIMITIVE_RESTART_NV = $8558;
  GL_PRIMITIVE_RESTART_INDEX_NV = $8559;

  // GL_NV_register_combiners
  GL_REGISTER_COMBINERS_NV = $8522;
  GL_VARIABLE_A_NV = $8523;
  GL_VARIABLE_B_NV = $8524;
  GL_VARIABLE_C_NV = $8525;
  GL_VARIABLE_D_NV = $8526;
  GL_VARIABLE_E_NV = $8527;
  GL_VARIABLE_F_NV = $8528;
  GL_VARIABLE_G_NV = $8529;
  GL_CONSTANT_COLOR0_NV = $852A;
  GL_CONSTANT_COLOR1_NV = $852B;
  GL_PRIMARY_COLOR_NV = $852C;
  GL_SECONDARY_COLOR_NV = $852D;
  GL_SPARE0_NV = $852E;
  GL_SPARE1_NV = $852F;
  GL_DISCARD_NV = $8530;
  GL_E_TIMES_F_NV = $8531;
  GL_SPARE0_PLUS_SECONDARY_COLOR_NV = $8532;
  GL_UNSIGNED_IDENTITY_NV = $8536;
  GL_UNSIGNED_INVERT_NV = $8537;
  GL_EXPAND_NORMAL_NV = $8538;
  GL_EXPAND_NEGATE_NV = $8539;
  GL_HALF_BIAS_NORMAL_NV = $853A;
  GL_HALF_BIAS_NEGATE_NV = $853B;
  GL_SIGNED_IDENTITY_NV = $853C;
  GL_SIGNED_NEGATE_NV = $853D;
  GL_SCALE_BY_TWO_NV = $853E;
  GL_SCALE_BY_FOUR_NV = $853F;
  GL_SCALE_BY_ONE_HALF_NV = $8540;
  GL_BIAS_BY_NEGATIVE_ONE_HALF_NV = $8541;
  GL_COMBINER_INPUT_NV = $8542;
  GL_COMBINER_MAPPING_NV = $8543;
  GL_COMBINER_COMPONENT_USAGE_NV = $8544;
  GL_COMBINER_AB_DOT_PRODUCT_NV = $8545;
  GL_COMBINER_CD_DOT_PRODUCT_NV = $8546;
  GL_COMBINER_MUX_SUM_NV = $8547;
  GL_COMBINER_SCALE_NV = $8548;
  GL_COMBINER_BIAS_NV = $8549;
  GL_COMBINER_AB_OUTPUT_NV = $854A;
  GL_COMBINER_CD_OUTPUT_NV = $854B;
  GL_COMBINER_SUM_OUTPUT_NV = $854C;
  GL_MAX_GENERAL_COMBINERS_NV = $854D;
  GL_NUM_GENERAL_COMBINERS_NV = $854E;
  GL_COLOR_SUM_CLAMP_NV = $854F;
  GL_COMBINER0_NV = $8550;
  GL_COMBINER1_NV = $8551;
  GL_COMBINER2_NV = $8552;
  GL_COMBINER3_NV = $8553;
  GL_COMBINER4_NV = $8554;
  GL_COMBINER5_NV = $8555;
  GL_COMBINER6_NV = $8556;
  GL_COMBINER7_NV = $8557;

  // GL_NV_register_combiners2
  GL_PER_STAGE_CONSTANTS_NV = $8535;

  // GL_NV_texgen_emboss
  GL_EMBOSS_LIGHT_NV = $855D;
  GL_EMBOSS_CONSTANT_NV = $855E;
  GL_EMBOSS_MAP_NV = $855F;

  // GL_NV_texgen_reflection
  GL_NORMAL_MAP_NV = $8511;
  GL_REFLECTION_MAP_NV = $8512;

  // GL_NV_texture_env_combine4
  GL_COMBINE4_NV = $8503;
  GL_SOURCE3_RGB_NV = $8583;
  GL_SOURCE3_ALPHA_NV = $858B;
  GL_OPERAND3_RGB_NV = $8593;
  GL_OPERAND3_ALPHA_NV = $859B;

  // GL_NV_texture_expand_normal
  GL_TEXTURE_UNSIGNED_REMAP_MODE_NV = $888F;

  // GL_NV_texture_rectangle
  GL_TEXTURE_RECTANGLE_NV = $84F5;
  GL_TEXTURE_BINDING_RECTANGLE_NV = $84F6;
  GL_PROXY_TEXTURE_RECTANGLE_NV = $84F7;
  GL_MAX_RECTANGLE_TEXTURE_SIZE_NV = $84F8;

  // GL_NV_texture_shader
  GL_OFFSET_TEXTURE_RECTANGLE_NV = $864C;
  GL_OFFSET_TEXTURE_RECTANGLE_SCALE_NV = $864D;
  GL_DOT_PRODUCT_TEXTURE_RECTANGLE_NV = $864E;
  GL_RGBA_UNSIGNED_DOT_PRODUCT_MAPPING_NV = $86D9;
  GL_UNSIGNED_INT_S8_S8_8_8_NV = $86DA;
  GL_UNSIGNED_INT_8_8_S8_S8_REV_NV = $86DB;
  GL_DSDT_MAG_INTENSITY_NV = $86DC;
  GL_SHADER_CONSISTENT_NV = $86DD;
  GL_TEXTURE_SHADER_NV = $86DE;
  GL_SHADER_OPERATION_NV = $86DF;
  GL_CULL_MODES_NV = $86E0;
  GL_OFFSET_TEXTURE_MATRIX_NV = $86E1;
  GL_OFFSET_TEXTURE_SCALE_NV = $86E2;
  GL_OFFSET_TEXTURE_BIAS_NV = $86E3;
  GL_OFFSET_TEXTURE_2D_MATRIX_NV = GL_OFFSET_TEXTURE_MATRIX_NV;
  GL_OFFSET_TEXTURE_2D_SCALE_NV = GL_OFFSET_TEXTURE_SCALE_NV;
  GL_OFFSET_TEXTURE_2D_BIAS_NV = GL_OFFSET_TEXTURE_BIAS_NV;
  GL_PREVIOUS_TEXTURE_INPUT_NV = $86E4;
  GL_CONST_EYE_NV = $86E5;
  GL_PASS_THROUGH_NV = $86E6;
  GL_CULL_FRAGMENT_NV = $86E7;
  GL_OFFSET_TEXTURE_2D_NV = $86E8;
  GL_DEPENDENT_AR_TEXTURE_2D_NV = $86E9;
  GL_DEPENDENT_GB_TEXTURE_2D_NV = $86EA;
  GL_DOT_PRODUCT_NV = $86EC;
  GL_DOT_PRODUCT_DEPTH_REPLACE_NV = $86ED;
  GL_DOT_PRODUCT_TEXTURE_2D_NV = $86EE;
  GL_DOT_PRODUCT_TEXTURE_CUBE_MAP_NV = $86F0;
  GL_DOT_PRODUCT_DIFFUSE_CUBE_MAP_NV = $86F1;
  GL_DOT_PRODUCT_REFLECT_CUBE_MAP_NV = $86F2;
  GL_DOT_PRODUCT_CONST_EYE_REFLECT_CUBE_MAP_NV = $86F3;
  GL_HILO_NV = $86F4;
  GL_DSDT_NV = $86F5;
  GL_DSDT_MAG_NV = $86F6;
  GL_DSDT_MAG_VIB_NV = $86F7;
  GL_HILO16_NV = $86F8;
  GL_SIGNED_HILO_NV = $86F9;
  GL_SIGNED_HILO16_NV = $86FA;
  GL_SIGNED_RGBA_NV = $86FB;
  GL_SIGNED_RGBA8_NV = $86FC;
  GL_SIGNED_RGB_NV = $86FE;
  GL_SIGNED_RGB8_NV = $86FF;
  GL_SIGNED_LUMINANCE_NV = $8701;
  GL_SIGNED_LUMINANCE8_NV = $8702;
  GL_SIGNED_LUMINANCE_ALPHA_NV = $8703;
  GL_SIGNED_LUMINANCE8_ALPHA8_NV = $8704;
  GL_SIGNED_ALPHA_NV = $8705;
  GL_SIGNED_ALPHA8_NV = $8706;
  GL_SIGNED_INTENSITY_NV = $8707;
  GL_SIGNED_INTENSITY8_NV = $8708;
  GL_DSDT8_NV = $8709;
  GL_DSDT8_MAG8_NV = $870A;
  GL_DSDT8_MAG8_INTENSITY8_NV = $870B;
  GL_SIGNED_RGB_UNSIGNED_ALPHA_NV = $870C;
  GL_SIGNED_RGB8_UNSIGNED_ALPHA8_NV = $870D;
  GL_HI_SCALE_NV = $870E;
  GL_LO_SCALE_NV = $870F;
  GL_DS_SCALE_NV = $8710;
  GL_DT_SCALE_NV = $8711;
  GL_MAGNITUDE_SCALE_NV = $8712;
  GL_VIBRANCE_SCALE_NV = $8713;
  GL_HI_BIAS_NV = $8714;
  GL_LO_BIAS_NV = $8715;
  GL_DS_BIAS_NV = $8716;
  GL_DT_BIAS_NV = $8717;
  GL_MAGNITUDE_BIAS_NV = $8718;
  GL_VIBRANCE_BIAS_NV = $8719;
  GL_TEXTURE_BORDER_VALUES_NV = $871A;
  GL_TEXTURE_HI_SIZE_NV = $871B;
  GL_TEXTURE_LO_SIZE_NV = $871C;
  GL_TEXTURE_DS_SIZE_NV = $871D;
  GL_TEXTURE_DT_SIZE_NV = $871E;
  GL_TEXTURE_MAG_SIZE_NV = $871F;

  // GL_NV_texture_shader2
  GL_DOT_PRODUCT_TEXTURE_3D_NV = $86EF;

  // GL_NV_texture_shader3
  GL_OFFSET_PROJECTIVE_TEXTURE_2D_NV = $8850;
  GL_OFFSET_PROJECTIVE_TEXTURE_2D_SCALE_NV = $8851;
  GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_NV = $8852;
  GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_SCALE_NV = $8853;
  GL_OFFSET_HILO_TEXTURE_2D_NV = $8854;
  GL_OFFSET_HILO_TEXTURE_RECTANGLE_NV = $8855;
  GL_OFFSET_HILO_PROJECTIVE_TEXTURE_2D_NV = $8856;
  GL_OFFSET_HILO_PROJECTIVE_TEXTURE_RECTANGLE_NV = $8857;
  GL_DEPENDENT_HILO_TEXTURE_2D_NV = $8858;
  GL_DEPENDENT_RGB_TEXTURE_3D_NV = $8859;
  GL_DEPENDENT_RGB_TEXTURE_CUBE_MAP_NV = $885A;
  GL_DOT_PRODUCT_PASS_THROUGH_NV = $885B;
  GL_DOT_PRODUCT_TEXTURE_1D_NV = $885C;
  GL_DOT_PRODUCT_AFFINE_DEPTH_REPLACE_NV = $885D;
  GL_HILO8_NV = $885E;
  GL_SIGNED_HILO8_NV = $885F;
  GL_FORCE_BLUE_TO_ONE_NV = $8860;

  // GL_NV_vertex_array_range
  GL_VERTEX_ARRAY_RANGE_NV = $851D;
  GL_VERTEX_ARRAY_RANGE_LENGTH_NV = $851E;
  GL_VERTEX_ARRAY_RANGE_VALID_NV = $851F;
  GL_MAX_VERTEX_ARRAY_RANGE_ELEMENT_NV = $8520;
  GL_VERTEX_ARRAY_RANGE_POINTER_NV = $8521;

  // GL_NV_vertex_array_range2
  GL_VERTEX_ARRAY_RANGE_WITHOUT_FLUSH_NV = $8533;

  // GL_NV_vertex_program
  GL_VERTEX_PROGRAM_NV = $8620;
  GL_VERTEX_STATE_PROGRAM_NV = $8621;
  GL_ATTRIB_ARRAY_SIZE_NV = $8623;
  GL_ATTRIB_ARRAY_STRIDE_NV = $8624;
  GL_ATTRIB_ARRAY_TYPE_NV = $8625;
  GL_CURRENT_ATTRIB_NV = $8626;
  GL_PROGRAM_LENGTH_NV = $8627;
  GL_PROGRAM_STRING_NV = $8628;
  GL_MODELVIEW_PROJECTION_NV = $8629;
  GL_IDENTITY_NV = $862A;
  GL_INVERSE_NV = $862B;
  GL_TRANSPOSE_NV = $862C;
  GL_INVERSE_TRANSPOSE_NV = $862D;
  GL_MAX_TRACK_MATRIX_STACK_DEPTH_NV = $862E;
  GL_MAX_TRACK_MATRICES_NV = $862F;
  GL_MATRIX0_NV = $8630;
  GL_MATRIX1_NV = $8631;
  GL_MATRIX2_NV = $8632;
  GL_MATRIX3_NV = $8633;
  GL_MATRIX4_NV = $8634;
  GL_MATRIX5_NV = $8635;
  GL_MATRIX6_NV = $8636;
  GL_MATRIX7_NV = $8637;
  GL_CURRENT_MATRIX_STACK_DEPTH_NV = $8640;
  GL_CURRENT_MATRIX_NV = $8641;
  GL_VERTEX_PROGRAM_POINT_SIZE_NV = $8642;
  GL_VERTEX_PROGRAM_TWO_SIDE_NV = $8643;
  GL_PROGRAM_PARAMETER_NV = $8644;
  GL_ATTRIB_ARRAY_POINTER_NV = $8645;
  GL_PROGRAM_TARGET_NV = $8646;
  GL_PROGRAM_RESIDENT_NV = $8647;
  GL_TRACK_MATRIX_NV = $8648;
  GL_TRACK_MATRIX_TRANSFORM_NV = $8649;
  GL_VERTEX_PROGRAM_BINDING_NV = $864A;
  GL_PROGRAM_ERROR_POSITION_NV = $864B;
  GL_VERTEX_ATTRIB_ARRAY0_NV = $8650;
  GL_VERTEX_ATTRIB_ARRAY1_NV = $8651;
  GL_VERTEX_ATTRIB_ARRAY2_NV = $8652;
  GL_VERTEX_ATTRIB_ARRAY3_NV = $8653;
  GL_VERTEX_ATTRIB_ARRAY4_NV = $8654;
  GL_VERTEX_ATTRIB_ARRAY5_NV = $8655;
  GL_VERTEX_ATTRIB_ARRAY6_NV = $8656;
  GL_VERTEX_ATTRIB_ARRAY7_NV = $8657;
  GL_VERTEX_ATTRIB_ARRAY8_NV = $8658;
  GL_VERTEX_ATTRIB_ARRAY9_NV = $8659;
  GL_VERTEX_ATTRIB_ARRAY10_NV = $865A;
  GL_VERTEX_ATTRIB_ARRAY11_NV = $865B;
  GL_VERTEX_ATTRIB_ARRAY12_NV = $865C;
  GL_VERTEX_ATTRIB_ARRAY13_NV = $865D;
  GL_VERTEX_ATTRIB_ARRAY14_NV = $865E;
  GL_VERTEX_ATTRIB_ARRAY15_NV = $865F;
  GL_MAP1_VERTEX_ATTRIB0_4_NV = $8660;
  GL_MAP1_VERTEX_ATTRIB1_4_NV = $8661;
  GL_MAP1_VERTEX_ATTRIB2_4_NV = $8662;
  GL_MAP1_VERTEX_ATTRIB3_4_NV = $8663;
  GL_MAP1_VERTEX_ATTRIB4_4_NV = $8664;
  GL_MAP1_VERTEX_ATTRIB5_4_NV = $8665;
  GL_MAP1_VERTEX_ATTRIB6_4_NV = $8666;
  GL_MAP1_VERTEX_ATTRIB7_4_NV = $8667;
  GL_MAP1_VERTEX_ATTRIB8_4_NV = $8668;
  GL_MAP1_VERTEX_ATTRIB9_4_NV = $8669;
  GL_MAP1_VERTEX_ATTRIB10_4_NV = $866A;
  GL_MAP1_VERTEX_ATTRIB11_4_NV = $866B;
  GL_MAP1_VERTEX_ATTRIB12_4_NV = $866C;
  GL_MAP1_VERTEX_ATTRIB13_4_NV = $866D;
  GL_MAP1_VERTEX_ATTRIB14_4_NV = $866E;
  GL_MAP1_VERTEX_ATTRIB15_4_NV = $866F;
  GL_MAP2_VERTEX_ATTRIB0_4_NV = $8670;
  GL_MAP2_VERTEX_ATTRIB1_4_NV = $8671;
  GL_MAP2_VERTEX_ATTRIB2_4_NV = $8672;
  GL_MAP2_VERTEX_ATTRIB3_4_NV = $8673;
  GL_MAP2_VERTEX_ATTRIB4_4_NV = $8674;
  GL_MAP2_VERTEX_ATTRIB5_4_NV = $8675;
  GL_MAP2_VERTEX_ATTRIB6_4_NV = $8676;
  GL_MAP2_VERTEX_ATTRIB7_4_NV = $8677;
  GL_MAP2_VERTEX_ATTRIB8_4_NV = $8678;
  GL_MAP2_VERTEX_ATTRIB9_4_NV = $8679;
  GL_MAP2_VERTEX_ATTRIB10_4_NV = $867A;
  GL_MAP2_VERTEX_ATTRIB11_4_NV = $867B;
  GL_MAP2_VERTEX_ATTRIB12_4_NV = $867C;
  GL_MAP2_VERTEX_ATTRIB13_4_NV = $867D;
  GL_MAP2_VERTEX_ATTRIB14_4_NV = $867E;
  GL_MAP2_VERTEX_ATTRIB15_4_NV = $867F;

  // GL_NV_fragment_program2 and GL_NV_vertex_program2_option
  GL_MAX_PROGRAM_EXEC_INSTRUCTIONS_NV = $88F4;
  GL_MAX_PROGRAM_CALL_DEPTH_NV = $88F5;

  // GL_NV_fragment_program2
  GL_MAX_PROGRAM_IF_DEPTH_NV = $88F6;
  GL_MAX_PROGRAM_LOOP_DEPTH_NV = $88F7;
  GL_MAX_PROGRAM_LOOP_COUNT_NV = $88F8;

  // GL_NV_vertex_program3
  MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB = $8B4C;

  // GL_NV_depth_buffer_float
  GL_FLOAT_32_UNSIGNED_INT_24_8_REV_NV = $8DAD;
  GL_DEPTH_BUFFER_FLOAT_MODE_NV = $8DAF;

  // GL_NV_framebuffer_multisample_coverage
  GL_RENDERBUFFER_COVERAGE_SAMPLES_NV = $8CAB;
  GL_RENDERBUFFER_COLOR_SAMPLES_NV = $8E10;

  // GL_NV_geometry_program4
  GL_GEOMETRY_PROGRAM_NV = $8C26;
  GL_MAX_PROGRAM_OUTPUT_VERTICES_NV = $8C27;
  GL_MAX_PROGRAM_TOTAL_OUTPUT_COMPONENTS_NV = $8C28;

  // GL_NV_gpu_program4
  GL_PROGRAM_ATTRIB_COMPONENTS_NV = $8906;
  GL_PROGRAM_RESULT_COMPONENTS_NV = $8907;
  GL_MAX_PROGRAM_ATTRIB_COMPONENTS_NV = $8908;
  GL_MAX_PROGRAM_RESULT_COMPONENTS_NV = $8909;
  GL_MAX_PROGRAM_GENERIC_ATTRIBS_NV = $8DA5;
  GL_MAX_PROGRAM_GENERIC_RESULTS_NV = $8DA6;

  // GL_NV_parameter_buffer_object
  GL_MAX_PROGRAM_PARAMETER_BUFFER_BINDINGS_NV = $8DA0;
  GL_MAX_PROGRAM_PARAMETER_BUFFER_SIZE_NV = $8DA1;
  GL_VERTEX_PROGRAM_PARAMETER_BUFFER_NV = $8DA2;
  GL_GEOMETRY_PROGRAM_PARAMETER_BUFFER_NV = $8DA3;
  GL_FRAGMENT_PROGRAM_PARAMETER_BUFFER_NV = $8DA4;

  // GL_NV_transform_feedback
  GL_TRANSFORM_FEEDBACK_BUFFER_NV = $8C8E;
  GL_TRANSFORM_FEEDBACK_BUFFER_START_NV = $8C84;
  GL_TRANSFORM_FEEDBACK_BUFFER_SIZE_NV = $8C85;
  GL_TRANSFORM_FEEDBACK_RECORD_NV = $8C86;
  GL_TRANSFORM_FEEDBACK_BUFFER_BINDING_NV = $8C8F;
  GL_INTERLEAVED_ATTRIBS_NV = $8C8C;
  GL_SEPARATE_ATTRIBS_NV = $8C8D;
  GL_PRIMITIVES_GENERATED_NV = $8C87;
  GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN_NV = $8C88;
  GL_RASTERIZER_DISCARD_NV = $8C89;
  GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS_NV = $8C8A;
  GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS_NV = $8C8B;
  GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS_NV = $8C80;
  GL_TRANSFORM_FEEDBACK_ATTRIBS_NV = $8C7E;
  GL_ACTIVE_VARYINGS_NV = $8C81;
  GL_ACTIVE_VARYING_MAX_LENGTH_NV = $8C82;
  GL_TRANSFORM_FEEDBACK_VARYINGS_NV = $8C83;
  GL_TRANSFORM_FEEDBACK_BUFFER_MODE_NV = $8C7F;
  GL_BACK_PRIMARY_COLOR_NV = $8C77;
  GL_BACK_SECONDARY_COLOR_NV = $8C78;
  GL_TEXTURE_COORD_NV = $8C79;
  GL_CLIP_DISTANCE_NV = $8C7A;
  GL_VERTEX_ID_NV = $8C7B;
  GL_PRIMITIVE_ID_NV = $8C7C;
  GL_GENERIC_ATTRIB_NV = $8C7D;
  GL_LAYER_NV = $8DAA;
  GL_NEXT_BUFFER_NV = -2;
  GL_SKIP_COMPONENTS4_NV = -3;
  GL_SKIP_COMPONENTS3_NV = -4;
  GL_SKIP_COMPONENTS2_NV = -5;
  GL_SKIP_COMPONENTS1_NV = -6;

  // GL_NV_conditional_render
  GL_QUERY_WAIT_NV = $8E13;
  GL_QUERY_NO_WAIT_NV = $8E14;
  GL_QUERY_BY_REGION_WAIT_NV = $8E15;
  GL_QUERY_BY_REGION_NO_WAIT_NV = $8E16;

  // GL_NV_present_video
  GL_FRAME_NV = $8E26;
  GL_FIELDS_NV = $8E27;
  GL_CURRENT_TIME_NV = $8E28;
  GL_NUM_FILL_STREAMS_NV = $8E29;
  GL_PRESENT_TIME_NV = $8E2A;
  GL_PRESENT_DURATION_NV = $8E2B;

  // GL_NV_explicit_multisample
  GL_SAMPLE_POSITION_NV = $8E50;
  GL_SAMPLE_MASK_NV = $8E51;
  GL_SAMPLE_MASK_VALUE_NV = $8E52;
  GL_TEXTURE_BINDING_RENDERBUFFER_NV = $8E53;
  GL_TEXTURE_RENDERBUFFER_DATA_STORE_BINDING_NV = $8E54;
  GL_TEXTURE_RENDERBUFFER_NV = $8E55;
  GL_SAMPLER_RENDERBUFFER_NV = $8E56;
  GL_INT_SAMPLER_RENDERBUFFER_NV = $8E57;
  GL_UNSIGNED_INT_SAMPLER_RENDERBUFFER_NV = $8E58;
  GL_MAX_SAMPLE_MASK_WORDS_NV = $8E59;

  // GL_NV_transform_feedback2
  GL_TRANSFORM_FEEDBACK_NV = $8E22;
  GL_TRANSFORM_FEEDBACK_BUFFER_PAUSED_NV = $8E23;
  GL_TRANSFORM_FEEDBACK_BUFFER_ACTIVE_NV = $8E24;
  GL_TRANSFORM_FEEDBACK_BINDING_NV = $8E25;
  
  // GL_NV_video_capture
  GL_VIDEO_BUFFER_NV = $9020;
  GL_VIDEO_BUFFER_BINDING_NV = $9021;
  GL_FIELD_UPPER_NV = $9022;
  GL_FIELD_LOWER_NV = $9023;
  GL_NUM_VIDEO_CAPTURE_STREAMS_NV = $9024;
  GL_NEXT_VIDEO_CAPTURE_BUFFER_STATUS_NV = $9025;
  GL_VIDEO_CAPTURE_TO_422_SUPPORTED_NV = $9026;
  GL_LAST_VIDEO_CAPTURE_STATUS_NV = $9027;
  GL_VIDEO_BUFFER_PITCH_NV = $9028;
  GL_VIDEO_COLOR_CONVERSION_MATRIX_NV = $9029;
  GL_VIDEO_COLOR_CONVERSION_MAX_NV = $902A;
  GL_VIDEO_COLOR_CONVERSION_MIN_NV = $902B;
  GL_VIDEO_COLOR_CONVERSION_OFFSET_NV = $902C;
  GL_VIDEO_BUFFER_INTERNAL_FORMAT_NV = $902D;
  GL_PARTIAL_SUCCESS_NV = $902E;
  GL_SUCCESS_NV = $902F;
  GL_FAILURE_NV = $9030;
  GL_YCBYCR8_422_NV = $9031;
  GL_YCBAYCR8A_4224_NV = $9032;
  GL_Z6Y10Z6CB10Z6Y10Z6CR10_422_NV = $9033;
  GL_Z6Y10Z6CB10Z6A10Z6Y10Z6CR10Z6A10_4224_NV = $9034;
  GL_Z4Y12Z4CB12Z4Y12Z4CR12_422_NV = $9035;
  GL_Z4Y12Z4CB12Z4A12Z4Y12Z4CR12Z4A12_4224_NV = $9036;
  GL_Z4Y12Z4CB12Z4CR12_444_NV = $9037;
  GL_VIDEO_CAPTURE_FRAME_WIDTH_NV = $9038;
  GL_VIDEO_CAPTURE_FRAME_HEIGHT_NV = $9039;
  GL_VIDEO_CAPTURE_FIELD_UPPER_HEIGHT_NV = $903A;
  GL_VIDEO_CAPTURE_FIELD_LOWER_HEIGHT_NV = $903B;
  GL_VIDEO_CAPTURE_SURFACE_ORIGIN_NV = $903C;
  
  // GL_NV_shader_buffer_load
  GL_BUFFER_GPU_ADDRESS_NV = $8F1D;
  GL_GPU_ADDRESS_NV = $8F34;
  GL_MAX_SHADER_BUFFER_ADDRESS_NV = $8F35;

  // GL_NV_vertex_buffer_unified_memory
  GL_VERTEX_ATTRIB_ARRAY_UNIFIED_NV = $8F1E;
  GL_ELEMENT_ARRAY_UNIFIED_NV = $8F1F;
  GL_VERTEX_ATTRIB_ARRAY_ADDRESS_NV = $8F20;
  GL_VERTEX_ARRAY_ADDRESS_NV = $8F21;
  GL_NORMAL_ARRAY_ADDRESS_NV = $8F22;
  GL_COLOR_ARRAY_ADDRESS_NV = $8F23;
  GL_INDEX_ARRAY_ADDRESS_NV = $8F24;
  GL_TEXTURE_COORD_ARRAY_ADDRESS_NV = $8F25;
  GL_EDGE_FLAG_ARRAY_ADDRESS_NV = $8F26;
  GL_SECONDARY_COLOR_ARRAY_ADDRESS_NV = $8F27;
  GL_FOG_COORD_ARRAY_ADDRESS_NV = $8F28;
  GL_ELEMENT_ARRAY_ADDRESS_NV = $8F29;
  GL_VERTEX_ATTRIB_ARRAY_LENGTH_NV = $8F2A;
  GL_VERTEX_ARRAY_LENGTH_NV = $8F2B;
  GL_NORMAL_ARRAY_LENGTH_NV = $8F2C;
  GL_COLOR_ARRAY_LENGTH_NV = $8F2D;
  GL_INDEX_ARRAY_LENGTH_NV = $8F2E;
  GL_TEXTURE_COORD_ARRAY_LENGTH_NV = $8F2F;
  GL_EDGE_FLAG_ARRAY_LENGTH_NV = $8F30;
  GL_SECONDARY_COLOR_ARRAY_LENGTH_NV = $8F31;
  GL_FOG_COORD_ARRAY_LENGTH_NV = $8F32;
  GL_ELEMENT_ARRAY_LENGTH_NV = $8F33;
  GL_DRAW_INDIRECT_UNIFIED_NV = $8F40;
  GL_DRAW_INDIRECT_ADDRESS_NV = $8F41;
  GL_DRAW_INDIRECT_LENGTH_NV = $8F42;

  // GL_NV_gpu_program5
  GL_MAX_GEOMETRY_PROGRAM_INVOCATIONS_NV = $8E5A;
  GL_MIN_FRAGMENT_INTERPOLATION_OFFSET_NV = $8E5B;
  GL_MAX_FRAGMENT_INTERPOLATION_OFFSET_NV = $8E5C;
  GL_FRAGMENT_PROGRAM_INTERPOLATION_OFFSET_BITS_NV = $8E5D;
  GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET_NV = $8E5E;
  GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET_NV = $8E5F;
  GL_MAX_PROGRAM_SUBROUTINE_PARAMETERS_NV = $8F44;
  GL_MAX_PROGRAM_SUBROUTINE_NUM_NV = $8F45;

  // GL_NV_gpu_shader5
  GL_INT64_NV = $140E;
  GL_UNSIGNED_INT64_NV = $140F;
  GL_INT8_NV = $8FE0;
  GL_INT8_VEC2_NV = $8FE1;
  GL_INT8_VEC3_NV = $8FE2;
  GL_INT8_VEC4_NV = $8FE3;
  GL_INT16_NV = $8FE4;
  GL_INT16_VEC2_NV = $8FE5;
  GL_INT16_VEC3_NV = $8FE6;
  GL_INT16_VEC4_NV = $8FE7;
  GL_INT64_VEC2_NV = $8FE9;
  GL_INT64_VEC3_NV = $8FEA;
  GL_INT64_VEC4_NV = $8FEB;
  GL_UNSIGNED_INT8_NV = $8FEC;
  GL_UNSIGNED_INT8_VEC2_NV = $8FED;
  GL_UNSIGNED_INT8_VEC3_NV = $8FEE;
  GL_UNSIGNED_INT8_VEC4_NV = $8FEF;
  GL_UNSIGNED_INT16_NV = $8FF0;
  GL_UNSIGNED_INT16_VEC2_NV = $8FF1;
  GL_UNSIGNED_INT16_VEC3_NV = $8FF2;
  GL_UNSIGNED_INT16_VEC4_NV = $8FF3;
  GL_UNSIGNED_INT64_VEC2_NV = $8FF5;
  GL_UNSIGNED_INT64_VEC3_NV = $8FF6;
  GL_UNSIGNED_INT64_VEC4_NV = $8FF7;
  GL_FLOAT16_NV = $8FF8;
  GL_FLOAT16_VEC2_NV = $8FF9;
  GL_FLOAT16_VEC3_NV = $8FFA;
  GL_FLOAT16_VEC4_NV = $8FFB;
  { reuse GL_PATCHES }

  // GL_NV_shader_buffer_store
  GL_SHADER_GLOBAL_ACCESS_BARRIER_BIT_NV = $00000010;
  { reuse GL_READ_WRITE }
  { reuse GL_WRITE_ONLY }

  // GL_NV_tessellation_program5
  GL_MAX_PROGRAM_PATCH_ATTRIBS_NV = $86D8;
  GL_TESS_CONTROL_PROGRAM_NV = $891E;
  GL_TESS_EVALUATION_PROGRAM_NV = $891F;
  GL_TESS_CONTROL_PROGRAM_PARAMETER_BUFFER_NV = $8C74;
  GL_TESS_EVALUATION_PROGRAM_PARAMETER_BUFFER_NV = $8C75;

  // GL_NV_vertex_attrib_integer_64bit
  { reuse GL_INT64_NV }
  { reuse GL_UNSIGNED_INT64_NV }

  // GL_NV_multisample_coverage
  GL_COVERAGE_SAMPLES_NV = $80A9;
  GL_COLOR_SAMPLES_NV = $8E20;

  // GL_NV_vdpau_interop
  GL_SURFACE_STATE_NV = $86EB;
  GL_SURFACE_REGISTERED_NV = $86FD;
  GL_SURFACE_MAPPED_NV = $8700;
  GL_WRITE_DISCARD_NV = $88BE;

  // GL_OML_interlace
  GL_INTERLACE_OML = $8980;
  GL_INTERLACE_READ_OML = $8981;

  // GL_OML_resample
  GL_PACK_RESAMPLE_OML = $8984;
  GL_UNPACK_RESAMPLE_OML = $8985;
  GL_RESAMPLE_REPLICATE_OML = $8986;
  GL_RESAMPLE_ZERO_FILL_OML = $8987;
  GL_RESAMPLE_AVERAGE_OML = $8988;
  GL_RESAMPLE_DECIMATE_OML = $8989;

  // GL_OML_subsample
  GL_FORMAT_SUBSAMPLE_24_24_OML = $8982;
  GL_FORMAT_SUBSAMPLE_244_244_OML = $8983;

  // GL_PGI_misc_hints
  GL_PREFER_DOUBLEBUFFER_HINT_PGI = $1A1F8;
  GL_CONSERVE_MEMORY_HINT_PGI = $1A1FD;
  GL_RECLAIM_MEMORY_HINT_PGI = $1A1FE;
  GL_NATIVE_GRAPHICS_HANDLE_PGI = $1A202;
  GL_NATIVE_GRAPHICS_BEGIN_HINT_PGI = $1A203;
  GL_NATIVE_GRAPHICS_END_HINT_PGI = $1A204;
  GL_ALWAYS_FAST_HINT_PGI = $1A20C;
  GL_ALWAYS_SOFT_HINT_PGI = $1A20D;
  GL_ALLOW_DRAW_OBJ_HINT_PGI = $1A20E;
  GL_ALLOW_DRAW_WIN_HINT_PGI = $1A20F;
  GL_ALLOW_DRAW_FRG_HINT_PGI = $1A210;
  GL_ALLOW_DRAW_MEM_HINT_PGI = $1A211;
  GL_STRICT_DEPTHFUNC_HINT_PGI = $1A216;
  GL_STRICT_LIGHTING_HINT_PGI = $1A217;
  GL_STRICT_SCISSOR_HINT_PGI = $1A218;
  GL_FULL_STIPPLE_HINT_PGI = $1A219;
  GL_CLIP_NEAR_HINT_PGI = $1A220;
  GL_CLIP_FAR_HINT_PGI = $1A221;
  GL_WIDE_LINE_HINT_PGI = $1A222;
  GL_BACK_NORMALS_HINT_PGI = $1A223;

  // GL_PGI_vertex_hints
  GL_VERTEX_DATA_HINT_PGI = $1A22A;
  GL_VERTEX_CONSISTENT_HINT_PGI = $1A22B;
  GL_MATERIAL_SIDE_HINT_PGI = $1A22C;
  GL_MAX_VERTEX_HINT_PGI = $1A22D;
  GL_COLOR3_BIT_PGI = $00010000;
  GL_COLOR4_BIT_PGI = $00020000;
  GL_EDGEFLAG_BIT_PGI = $00040000;
  GL_INDEX_BIT_PGI = $00080000;
  GL_MAT_AMBIENT_BIT_PGI = $00100000;
  GL_MAT_AMBIENT_AND_DIFFUSE_BIT_PGI = $00200000;
  GL_MAT_DIFFUSE_BIT_PGI = $00400000;
  GL_MAT_EMISSION_BIT_PGI = $00800000;
  GL_MAT_COLOR_INDEXES_BIT_PGI = $01000000;
  GL_MAT_SHININESS_BIT_PGI = $02000000;
  GL_MAT_SPECULAR_BIT_PGI = $04000000;
  GL_NORMAL_BIT_PGI = $08000000;
  GL_TEXCOORD1_BIT_PGI = $10000000;
  GL_TEXCOORD2_BIT_PGI = $20000000;
  GL_TEXCOORD3_BIT_PGI = $40000000;
  GL_TEXCOORD4_BIT_PGI = $80000000;
  GL_VERTEX23_BIT_PGI = $00000004;
  GL_VERTEX4_BIT_PGI = $00000008;

  // GL_REND_screen_coordinates
  GL_SCREEN_COORDINATES_REND = $8490;
  GL_INVERTED_SCREEN_W_REND = $8491;

  // GL_S3_s3tc
  GL_RGB_S3TC = $83A0;
  GL_RGB4_S3TC = $83A1;
  GL_RGBA_S3TC = $83A2;
  GL_RGBA4_S3TC = $83A3;

  // GL_SGIS_detail_texture
  GL_DETAIL_TEXTURE_2D_SGIS = $8095;
  GL_DETAIL_TEXTURE_2D_BINDING_SGIS = $8096;
  GL_LINEAR_DETAIL_SGIS = $8097;
  GL_LINEAR_DETAIL_ALPHA_SGIS = $8098;
  GL_LINEAR_DETAIL_COLOR_SGIS = $8099;
  GL_DETAIL_TEXTURE_LEVEL_SGIS = $809A;
  GL_DETAIL_TEXTURE_MODE_SGIS = $809B;
  GL_DETAIL_TEXTURE_FUNC_POINTS_SGIS = $809C;

  // GL_SGIS_fog_function
  GL_FOG_FUNC_SGIS = $812A;
  GL_FOG_FUNC_POINTS_SGIS = $812B;
  GL_MAX_FOG_FUNC_POINTS_SGIS = $812C;

  // GL_SGIS_generate_mipmap
  GL_GENERATE_MIPMAP_SGIS = $8191;
  GL_GENERATE_MIPMAP_HINT_SGIS = $8192;

  // GL_SGIS_multisample
  GL_MULTISAMPLE_SGIS = $809D;
  GL_SAMPLE_ALPHA_TO_MASK_SGIS = $809E;
  GL_SAMPLE_ALPHA_TO_ONE_SGIS = $809F;
  GL_SAMPLE_MASK_SGIS = $80A0;
  GL_1PASS_SGIS = $80A1;
  GL_2PASS_0_SGIS = $80A2;
  GL_2PASS_1_SGIS = $80A3;
  GL_4PASS_0_SGIS = $80A4;
  GL_4PASS_1_SGIS = $80A5;
  GL_4PASS_2_SGIS = $80A6;
  GL_4PASS_3_SGIS = $80A7;
  GL_SAMPLE_BUFFERS_SGIS = $80A8;
  GL_SAMPLES_SGIS = $80A9;
  GL_SAMPLE_MASK_VALUE_SGIS = $80AA;
  GL_SAMPLE_MASK_INVERT_SGIS = $80AB;
  GL_SAMPLE_PATTERN_SGIS = $80AC;

  // GL_SGIS_pixel_texture
  GL_PIXEL_TEXTURE_SGIS = $8353;
  GL_PIXEL_FRAGMENT_RGB_SOURCE_SGIS = $8354;
  GL_PIXEL_FRAGMENT_ALPHA_SOURCE_SGIS = $8355;
  GL_PIXEL_GROUP_COLOR_SGIS = $8356;

  // GL_SGIS_point_line_texgen
  GL_EYE_DISTANCE_TO_POINT_SGIS = $81F0;
  GL_OBJECT_DISTANCE_TO_POINT_SGIS = $81F1;
  GL_EYE_DISTANCE_TO_LINE_SGIS = $81F2;
  GL_OBJECT_DISTANCE_TO_LINE_SGIS = $81F3;
  GL_EYE_POINT_SGIS = $81F4;
  GL_OBJECT_POINT_SGIS = $81F5;
  GL_EYE_LINE_SGIS = $81F6;
  GL_OBJECT_LINE_SGIS = $81F7;

  // GL_SGIS_point_parameters
  GL_POINT_SIZE_MIN_SGIS = $8126;
  GL_POINT_SIZE_MAX_SGIS = $8127;
  GL_POINT_FADE_THRESHOLD_SIZE_SGIS = $8128;
  GL_DISTANCE_ATTENUATION_SGIS = $8129;

  // GL_SGIS_sharpen_texture
  GL_LINEAR_SHARPEN_SGIS = $80AD;
  GL_LINEAR_SHARPEN_ALPHA_SGIS = $80AE;
  GL_LINEAR_SHARPEN_COLOR_SGIS = $80AF;
  GL_SHARPEN_TEXTURE_FUNC_POINTS_SGIS = $80B0;

  // GL_SGIS_texture4D
  GL_PACK_SKIP_VOLUMES_SGIS = $8130;
  GL_PACK_IMAGE_DEPTH_SGIS = $8131;
  GL_UNPACK_SKIP_VOLUMES_SGIS = $8132;
  GL_UNPACK_IMAGE_DEPTH_SGIS = $8133;
  GL_TEXTURE_4D_SGIS = $8134;
  GL_PROXY_TEXTURE_4D_SGIS = $8135;
  GL_TEXTURE_4DSIZE_SGIS = $8136;
  GL_TEXTURE_WRAP_Q_SGIS = $8137;
  GL_MAX_4D_TEXTURE_SIZE_SGIS = $8138;
  GL_TEXTURE_4D_BINDING_SGIS = $814F;

  // GL_SGIS_texture_color_mask
  GL_TEXTURE_COLOR_WRITEMASK_SGIS = $81EF;

  // GL_SGIS_texture_edge_clamp
  GL_CLAMP_TO_EDGE_SGIS = $812F;

  // GL_SGIS_texture_filter4
  GL_FILTER4_SGIS = $8146;
  GL_TEXTURE_FILTER4_SIZE_SGIS = $8147;

  // GL_SGIS_texture_lod
  GL_TEXTURE_MIN_LOD_SGIS = $813A;
  GL_TEXTURE_MAX_LOD_SGIS = $813B;
  GL_TEXTURE_BASE_LEVEL_SGIS = $813C;
  GL_TEXTURE_MAX_LEVEL_SGIS = $813D;

  // GL_SGIS_texture_select
  GL_DUAL_ALPHA4_SGIS = $8110;
  GL_DUAL_ALPHA8_SGIS = $8111;
  GL_DUAL_ALPHA12_SGIS = $8112;
  GL_DUAL_ALPHA16_SGIS = $8113;
  GL_DUAL_LUMINANCE4_SGIS = $8114;
  GL_DUAL_LUMINANCE8_SGIS = $8115;
  GL_DUAL_LUMINANCE12_SGIS = $8116;
  GL_DUAL_LUMINANCE16_SGIS = $8117;
  GL_DUAL_INTENSITY4_SGIS = $8118;
  GL_DUAL_INTENSITY8_SGIS = $8119;
  GL_DUAL_INTENSITY12_SGIS = $811A;
  GL_DUAL_INTENSITY16_SGIS = $811B;
  GL_DUAL_LUMINANCE_ALPHA4_SGIS = $811C;
  GL_DUAL_LUMINANCE_ALPHA8_SGIS = $811D;
  GL_QUAD_ALPHA4_SGIS = $811E;
  GL_QUAD_ALPHA8_SGIS = $811F;
  GL_QUAD_LUMINANCE4_SGIS = $8120;
  GL_QUAD_LUMINANCE8_SGIS = $8121;
  GL_QUAD_INTENSITY4_SGIS = $8122;
  GL_QUAD_INTENSITY8_SGIS = $8123;
  GL_DUAL_TEXTURE_SELECT_SGIS = $8124;
  GL_QUAD_TEXTURE_SELECT_SGIS = $8125;

  // GL_SGIX_async
  GL_ASYNC_MARKER_SGIX = $8329;

  // GL_SGIX_async_histogram
  GL_ASYNC_HISTOGRAM_SGIX = $832C;
  GL_MAX_ASYNC_HISTOGRAM_SGIX = $832D;

  // GL_SGIX_async_pixel
  GL_ASYNC_TEX_IMAGE_SGIX = $835C;
  GL_ASYNC_DRAW_PIXELS_SGIX = $835D;
  GL_ASYNC_READ_PIXELS_SGIX = $835E;
  GL_MAX_ASYNC_TEX_IMAGE_SGIX = $835F;
  GL_MAX_ASYNC_DRAW_PIXELS_SGIX = $8360;
  GL_MAX_ASYNC_READ_PIXELS_SGIX = $8361;

  // GL_SGIX_blend_alpha_minmax
  GL_ALPHA_MIN_SGIX = $8320;
  GL_ALPHA_MAX_SGIX = $8321;

  // GL_SGIX_calligraphic_fragment
  GL_CALLIGRAPHIC_FRAGMENT_SGIX = $8183;

  // GL_SGIX_clipmap
  GL_LINEAR_CLIPMAP_LINEAR_SGIX = $8170;
  GL_TEXTURE_CLIPMAP_CENTER_SGIX = $8171;
  GL_TEXTURE_CLIPMAP_FRAME_SGIX = $8172;
  GL_TEXTURE_CLIPMAP_OFFSET_SGIX = $8173;
  GL_TEXTURE_CLIPMAP_VIRTUAL_DEPTH_SGIX = $8174;
  GL_TEXTURE_CLIPMAP_LOD_OFFSET_SGIX = $8175;
  GL_TEXTURE_CLIPMAP_DEPTH_SGIX = $8176;
  GL_MAX_CLIPMAP_DEPTH_SGIX = $8177;
  GL_MAX_CLIPMAP_VIRTUAL_DEPTH_SGIX = $8178;
  GL_NEAREST_CLIPMAP_NEAREST_SGIX = $844D;
  GL_NEAREST_CLIPMAP_LINEAR_SGIX = $844E;
  GL_LINEAR_CLIPMAP_NEAREST_SGIX = $844F;

  // GL_SGIX_convolution_accuracy
  GL_CONVOLUTION_HINT_SGIX = $8316;

  // GL_SGIX_depth_texture
  GL_DEPTH_COMPONENT16_SGIX = $81A5;
  GL_DEPTH_COMPONENT24_SGIX = $81A6;
  GL_DEPTH_COMPONENT32_SGIX = $81A7;

  // GL_SGIX_fog_offset
  GL_FOG_OFFSET_SGIX = $8198;
  GL_FOG_OFFSET_VALUE_SGIX = $8199;

  // GL_SGIX_fog_scale
  GL_FOG_SCALE_SGIX = $81FC;
  GL_FOG_SCALE_VALUE_SGIX = $81FD;

  // GL_SGIX_fragment_lighting
  GL_FRAGMENT_LIGHTING_SGIX = $8400;
  GL_FRAGMENT_COLOR_MATERIAL_SGIX = $8401;
  GL_FRAGMENT_COLOR_MATERIAL_FACE_SGIX = $8402;
  GL_FRAGMENT_COLOR_MATERIAL_PARAMETER_SGIX = $8403;
  GL_MAX_FRAGMENT_LIGHTS_SGIX = $8404;
  GL_MAX_ACTIVE_LIGHTS_SGIX = $8405;
  GL_CURRENT_RASTER_NORMAL_SGIX = $8406;
  GL_LIGHT_ENV_MODE_SGIX = $8407;
  GL_FRAGMENT_LIGHT_MODEL_LOCAL_VIEWER_SGIX = $8408;
  GL_FRAGMENT_LIGHT_MODEL_TWO_SIDE_SGIX = $8409;
  GL_FRAGMENT_LIGHT_MODEL_AMBIENT_SGIX = $840A;
  GL_FRAGMENT_LIGHT_MODEL_NORMAL_INTERPOLATION_SGIX = $840B;
  GL_FRAGMENT_LIGHT0_SGIX = $840C;
  GL_FRAGMENT_LIGHT1_SGIX = $840D;
  GL_FRAGMENT_LIGHT2_SGIX = $840E;
  GL_FRAGMENT_LIGHT3_SGIX = $840F;
  GL_FRAGMENT_LIGHT4_SGIX = $8410;
  GL_FRAGMENT_LIGHT5_SGIX = $8411;
  GL_FRAGMENT_LIGHT6_SGIX = $8412;
  GL_FRAGMENT_LIGHT7_SGIX = $8413;

  // GL_SGIX_framezoom
  GL_FRAMEZOOM_SGIX = $818B;
  GL_FRAMEZOOM_FACTOR_SGIX = $818C;
  GL_MAX_FRAMEZOOM_FACTOR_SGIX = $818D;

  // GL_SGIX_impact_pixel_texture
  GL_PIXEL_TEX_GEN_Q_CEILING_SGIX = $8184;
  GL_PIXEL_TEX_GEN_Q_ROUND_SGIX = $8185;
  GL_PIXEL_TEX_GEN_Q_FLOOR_SGIX = $8186;
  GL_PIXEL_TEX_GEN_ALPHA_REPLACE_SGIX = $8187;
  GL_PIXEL_TEX_GEN_ALPHA_NO_REPLACE_SGIX = $8188;
  GL_PIXEL_TEX_GEN_ALPHA_LS_SGIX = $8189;
  GL_PIXEL_TEX_GEN_ALPHA_MS_SGIX = $818A;

  // GL_SGIX_instruments
  GL_INSTRUMENT_BUFFER_POINTER_SGIX = $8180;
  GL_INSTRUMENT_MEASUREMENTS_SGIX = $8181;

  // GL_SGIX_interlace
  GL_INTERLACE_SGIX = $8094;

  // GL_SGIX_ir_instrument1
  GL_IR_INSTRUMENT1_SGIX = $817F;

  // GL_SGIX_list_priority
  GL_LIST_PRIORITY_SGIX = $8182;

  // GL_SGIX_pixel_texture
  GL_PIXEL_TEX_GEN_SGIX = $8139;
  GL_PIXEL_TEX_GEN_MODE_SGIX = $832B;

  // GL_SGIX_pixel_tiles
  GL_PIXEL_TILE_BEST_ALIGNMENT_SGIX = $813E;
  GL_PIXEL_TILE_CACHE_INCREMENT_SGIX = $813F;
  GL_PIXEL_TILE_WIDTH_SGIX = $8140;
  GL_PIXEL_TILE_HEIGHT_SGIX = $8141;
  GL_PIXEL_TILE_GRID_WIDTH_SGIX = $8142;
  GL_PIXEL_TILE_GRID_HEIGHT_SGIX = $8143;
  GL_PIXEL_TILE_GRID_DEPTH_SGIX = $8144;
  GL_PIXEL_TILE_CACHE_SIZE_SGIX = $8145;

  // GL_SGIX_polynomial_ffd
  GL_GEOMETRY_DEFORMATION_SGIX = $8194;
  GL_TEXTURE_DEFORMATION_SGIX = $8195;
  GL_DEFORMATIONS_MASK_SGIX = $8196;
  GL_MAX_DEFORMATION_ORDER_SGIX = $8197;

  // GL_SGIX_reference_plane
  GL_REFERENCE_PLANE_SGIX = $817D;
  GL_REFERENCE_PLANE_EQUATION_SGIX = $817E;

  // GL_SGIX_resample
  GL_PACK_RESAMPLE_SGIX = $842C;
  GL_UNPACK_RESAMPLE_SGIX = $842D;
  GL_RESAMPLE_REPLICATE_SGIX = $842E;
  GL_RESAMPLE_ZERO_FILL_SGIX = $842F;
  GL_RESAMPLE_DECIMATE_SGIX = $8430;

  // GL_SGIX_scalebias_hint
  GL_SCALEBIAS_HINT_SGIX = $8322;

  // GL_SGIX_shadow
  GL_TEXTURE_COMPARE_SGIX = $819A;
  GL_TEXTURE_COMPARE_OPERATOR_SGIX = $819B;
  GL_TEXTURE_LEQUAL_R_SGIX = $819C;
  GL_TEXTURE_GEQUAL_R_SGIX = $819D;

  // GL_SGIX_shadow_ambient
  GL_SHADOW_AMBIENT_SGIX = $80BF;

  // GL_SGIX_sprite
  GL_SPRITE_SGIX = $8148;
  GL_SPRITE_MODE_SGIX = $8149;
  GL_SPRITE_AXIS_SGIX = $814A;
  GL_SPRITE_TRANSLATION_SGIX = $814B;
  GL_SPRITE_AXIAL_SGIX = $814C;
  GL_SPRITE_OBJECT_ALIGNED_SGIX = $814D;
  GL_SPRITE_EYE_ALIGNED_SGIX = $814E;

  // GL_SGIX_subsample
  GL_PACK_SUBSAMPLE_RATE_SGIX = $85A0;
  GL_UNPACK_SUBSAMPLE_RATE_SGIX = $85A1;
  GL_PIXEL_SUBSAMPLE_4444_SGIX = $85A2;
  GL_PIXEL_SUBSAMPLE_2424_SGIX = $85A3;
  GL_PIXEL_SUBSAMPLE_4242_SGIX = $85A4;

  // GL_SGIX_texture_add_env
  GL_TEXTURE_ENV_BIAS_SGIX = $80BE;

  // GL_SGIX_texture_coordinate_clamp
  GL_TEXTURE_MAX_CLAMP_S_SGIX = $8369;
  GL_TEXTURE_MAX_CLAMP_T_SGIX = $836A;
  GL_TEXTURE_MAX_CLAMP_R_SGIX = $836B;

  // GL_SGIX_texture_lod_bias
  GL_TEXTURE_LOD_BIAS_S_SGIX = $818E;
  GL_TEXTURE_LOD_BIAS_T_SGIX = $818F;
  GL_TEXTURE_LOD_BIAS_R_SGIX = $8190;

  // GL_SGIX_texture_multi_buffer
  GL_TEXTURE_MULTI_BUFFER_HINT_SGIX = $812E;

  // GL_SGIX_texture_scale_bias
  GL_POST_TEXTURE_FILTER_BIAS_SGIX = $8179;
  GL_POST_TEXTURE_FILTER_SCALE_SGIX = $817A;
  GL_POST_TEXTURE_FILTER_BIAS_RANGE_SGIX = $817B;
  GL_POST_TEXTURE_FILTER_SCALE_RANGE_SGIX = $817C;

  // GL_SGIX_vertex_preclip
  GL_VERTEX_PRECLIP_SGIX = $83EE;
  GL_VERTEX_PRECLIP_HINT_SGIX = $83EF;

  // GL_SGIX_ycrcb
  GL_YCRCB_422_SGIX = $81BB;
  GL_YCRCB_444_SGIX = $81BC;

  // GL_SGIX_ycrcba
  GL_YCRCB_SGIX = $8318;
  GL_YCRCBA_SGIX = $8319;

  // GL_SGI_color_matrix
  GL_COLOR_MATRIX_SGI = $80B1;
  GL_COLOR_MATRIX_STACK_DEPTH_SGI = $80B2;
  GL_MAX_COLOR_MATRIX_STACK_DEPTH_SGI = $80B3;
  GL_POST_COLOR_MATRIX_RED_SCALE_SGI = $80B4;
  GL_POST_COLOR_MATRIX_GREEN_SCALE_SGI = $80B5;
  GL_POST_COLOR_MATRIX_BLUE_SCALE_SGI = $80B6;
  GL_POST_COLOR_MATRIX_ALPHA_SCALE_SGI = $80B7;
  GL_POST_COLOR_MATRIX_RED_BIAS_SGI = $80B8;
  GL_POST_COLOR_MATRIX_GREEN_BIAS_SGI = $80B9;
  GL_POST_COLOR_MATRIX_BLUE_BIAS_SGI = $80BA;
  GL_POST_COLOR_MATRIX_ALPHA_BIAS_SGI = $80BB;

  // GL_SGI_color_table
  GL_COLOR_TABLE_SGI = $80D0;
  GL_POST_CONVOLUTION_COLOR_TABLE_SGI = $80D1;
  GL_POST_COLOR_MATRIX_COLOR_TABLE_SGI = $80D2;
  GL_PROXY_COLOR_TABLE_SGI = $80D3;
  GL_PROXY_POST_CONVOLUTION_COLOR_TABLE_SGI = $80D4;
  GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE_SGI = $80D5;
  GL_COLOR_TABLE_SCALE_SGI = $80D6;
  GL_COLOR_TABLE_BIAS_SGI = $80D7;
  GL_COLOR_TABLE_FORMAT_SGI = $80D8;
  GL_COLOR_TABLE_WIDTH_SGI = $80D9;
  GL_COLOR_TABLE_RED_SIZE_SGI = $80DA;
  GL_COLOR_TABLE_GREEN_SIZE_SGI = $80DB;
  GL_COLOR_TABLE_BLUE_SIZE_SGI = $80DC;
  GL_COLOR_TABLE_ALPHA_SIZE_SGI = $80DD;
  GL_COLOR_TABLE_LUMINANCE_SIZE_SGI = $80DE;
  GL_COLOR_TABLE_INTENSITY_SIZE_SGI = $80DF;

  // GL_SGI_depth_pass_instrument
  GL_DEPTH_PASS_INSTRUMENT_SGIX = $8310;
  GL_DEPTH_PASS_INSTRUMENT_COUNTERS_SGIX = $8311;
  GL_DEPTH_PASS_INSTRUMENT_MAX_SGIX = $8312;

  // GL_SGI_texture_color_table
  GL_TEXTURE_COLOR_TABLE_SGI = $80BC;
  GL_PROXY_TEXTURE_COLOR_TABLE_SGI = $80BD;

  // GL_SUNX_constant_data
  GL_UNPACK_CONSTANT_DATA_SUNX = $81D5;
  GL_TEXTURE_CONSTANT_DATA_SUNX = $81D6;

  // GL_SUN_convolution_border_modes
  GL_WRAP_BORDER_SUN = $81D4;

  // GL_SUN_global_alpha
  GL_GLOBAL_ALPHA_SUN = $81D9;
  GL_GLOBAL_ALPHA_FACTOR_SUN = $81DA;

  // GL_SUN_mesh_array
  GL_QUAD_MESH_SUN = $8614;
  GL_TRIANGLE_MESH_SUN = $8615;

  // GL_SUN_slice_accum
  GL_SLICE_ACCUM_SUN = $85CC;

  // GL_SUN_triangle_list
  GL_RESTART_SUN = $0001;
  GL_REPLACE_MIDDLE_SUN = $0002;
  GL_REPLACE_OLDEST_SUN = $0003;
  GL_TRIANGLE_LIST_SUN = $81D7;
  GL_REPLACEMENT_CODE_SUN = $81D8;
  GL_REPLACEMENT_CODE_ARRAY_SUN = $85C0;
  GL_REPLACEMENT_CODE_ARRAY_TYPE_SUN = $85C1;
  GL_REPLACEMENT_CODE_ARRAY_STRIDE_SUN = $85C2;
  GL_REPLACEMENT_CODE_ARRAY_POINTER_SUN = $85C3;
  GL_R1UI_V3F_SUN = $85C4;
  GL_R1UI_C4UB_V3F_SUN = $85C5;
  GL_R1UI_C3F_V3F_SUN = $85C6;
  GL_R1UI_N3F_V3F_SUN = $85C7;
  GL_R1UI_C4F_N3F_V3F_SUN = $85C8;
  GL_R1UI_T2F_V3F_SUN = $85C9;
  GL_R1UI_T2F_N3F_V3F_SUN = $85CA;
  GL_R1UI_T2F_C4F_N3F_V3F_SUN = $85CB;

  // GL_WIN_phong_shading
  GL_PHONG_WIN = $80EA;
  GL_PHONG_HINT_WIN = $80EB;

  // GL_WIN_specular_fog
  GL_FOG_SPECULAR_TEXTURE_WIN = $80EC;

   // GL_ARB_vertex_shader
  GL_VERTEX_SHADER_ARB = $8B31;
  GL_MAX_VERTEX_UNIFORM_COMPONENTS_ARB = $8B4A;
  GL_MAX_VARYING_FLOATS_ARB = $8B4B;
  GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB = $8B4C;
  GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS_ARB = $8B4D;
  GL_OBJECT_ACTIVE_ATTRIBUTES_ARB = $8B89;
  GL_OBJECT_ACTIVE_ATTRIBUTE_MAX_LENGTH_ARB = $8B8A;

  // GL_ARB_fragment_shader
  GL_FRAGMENT_SHADER_ARB = $8B30;
  GL_MAX_FRAGMENT_UNIFORM_COMPONENTS_ARB = $8B49; // 1.4
  GL_FRAGMENT_SHADER_DERIVATIVE_HINT_ARB = $8B8B; // 1.4

  // GL_ARB_occlusion_query
  GL_SAMPLES_PASSED_ARB = $8914;
  GL_QUERY_COUNTER_BITS_ARB = $8864;
  GL_CURRENT_QUERY_ARB = $8865;
  GL_QUERY_RESULT_ARB = $8866;
  GL_QUERY_RESULT_AVAILABLE_ARB = $8867;

  // GL_ARB_point_sprite
  GL_POINT_SPRITE_ARB = $8861;
  GL_COORD_REPLACE_ARB = $8862;

  // GL_ARB_shading_language_100
  GL_SHADING_LANGUAGE_VERSION_ARB = $8B8C; // 1.4

  // GL_ARB_shader_objects
  GL_PROGRAM_OBJECT_ARB = $8B40;

  GL_OBJECT_TYPE_ARB = $8B4E;
  GL_OBJECT_SUBTYPE_ARB = $8B4F;
  GL_OBJECT_DELETE_STATUS_ARB = $8B80;
  GL_OBJECT_COMPILE_STATUS_ARB = $8B81;
  GL_OBJECT_LINK_STATUS_ARB = $8B82;
  GL_OBJECT_VALIDATE_STATUS_ARB = $8B83;
  GL_OBJECT_INFO_LOG_LENGTH_ARB = $8B84;
  GL_OBJECT_ATTACHED_OBJECTS_ARB = $8B85;
  GL_OBJECT_ACTIVE_UNIFORMS_ARB = $8B86;
  GL_OBJECT_ACTIVE_UNIFORM_MAX_LENGTH_ARB = $8B87;
  GL_OBJECT_SHADER_SOURCE_LENGTH_ARB = $8B88;

  GL_SHADER_OBJECT_ARB = $8B48;

  GL_FLOAT_VEC2_ARB = $8B50;
  GL_FLOAT_VEC3_ARB = $8B51;
  GL_FLOAT_VEC4_ARB = $8B52;
  GL_INT_VEC2_ARB = $8B53;
  GL_INT_VEC3_ARB = $8B54;
  GL_INT_VEC4_ARB = $8B55;
  GL_BOOL_ARB = $8B56;
  GL_BOOL_VEC2_ARB = $8B57;
  GL_BOOL_VEC3_ARB = $8B58;
  GL_BOOL_VEC4_ARB = $8B59;
  GL_FLOAT_MAT2_ARB = $8B5A;
  GL_FLOAT_MAT3_ARB = $8B5B;
  GL_FLOAT_MAT4_ARB = $8B5C;
  GL_SAMPLER_1D_ARB = $8B5D;
  GL_SAMPLER_2D_ARB = $8B5E;
  GL_SAMPLER_3D_ARB = $8B5F;
  GL_SAMPLER_CUBE_ARB = $8B60;
  GL_SAMPLER_1D_SHADOW_ARB = $8B61;
  GL_SAMPLER_2D_SHADOW_ARB = $8B62;
  GL_SAMPLER_2D_RECT_ARB = $8B63;
  GL_SAMPLER_2D_RECT_SHADOW_ARB = $8B64;

  // WGL_3DFX_multisample
  WGL_SAMPLE_BUFFERS_3DFX = $2060;
  WGL_SAMPLES_3DFX = $2061;

  // WGL_ARB_buffer_region
  WGL_FRONT_COLOR_BUFFER_BIT_ARB = $00000001;
  WGL_BACK_COLOR_BUFFER_BIT_ARB = $00000002;
  WGL_DEPTH_BUFFER_BIT_ARB = $00000004;
  WGL_STENCIL_BUFFER_BIT_ARB = $00000008;

  // WGL_ARB_make_current_read
  ERROR_INVALID_PIXEL_TYPE_ARB = $2043;
  ERROR_INCOMPATIBLE_DEVICE_CONTEXTS_ARB = $2054;

  // WGL_ARB_multisample
  WGL_SAMPLE_BUFFERS_ARB = $2041;
  WGL_SAMPLES_ARB = $2042;

  // WGL_ARB_pbuffer
  WGL_DRAW_TO_PBUFFER_ARB = $202D;
  WGL_MAX_PBUFFER_PIXELS_ARB = $202E;
  WGL_MAX_PBUFFER_WIDTH_ARB = $202F;
  WGL_MAX_PBUFFER_HEIGHT_ARB = $2030;
  WGL_PBUFFER_LARGEST_ARB = $2033;
  WGL_PBUFFER_WIDTH_ARB = $2034;
  WGL_PBUFFER_HEIGHT_ARB = $2035;
  WGL_PBUFFER_LOST_ARB = $2036;

  // WGL_ARB_pixel_format
  WGL_NUMBER_PIXEL_FORMATS_ARB = $2000;
  WGL_DRAW_TO_WINDOW_ARB = $2001;
  WGL_DRAW_TO_BITMAP_ARB = $2002;
  WGL_ACCELERATION_ARB = $2003;
  WGL_NEED_PALETTE_ARB = $2004;
  WGL_NEED_SYSTEM_PALETTE_ARB = $2005;
  WGL_SWAP_LAYER_BUFFERS_ARB = $2006;
  WGL_SWAP_METHOD_ARB = $2007;
  WGL_NUMBER_OVERLAYS_ARB = $2008;
  WGL_NUMBER_UNDERLAYS_ARB = $2009;
  WGL_TRANSPARENT_ARB = $200A;
  WGL_TRANSPARENT_RED_VALUE_ARB = $2037;
  WGL_TRANSPARENT_GREEN_VALUE_ARB = $2038;
  WGL_TRANSPARENT_BLUE_VALUE_ARB = $2039;
  WGL_TRANSPARENT_ALPHA_VALUE_ARB = $203A;
  WGL_TRANSPARENT_INDEX_VALUE_ARB = $203B;
  WGL_SHARE_DEPTH_ARB = $200C;
  WGL_SHARE_STENCIL_ARB = $200D;
  WGL_SHARE_ACCUM_ARB = $200E;
  WGL_SUPPORT_GDI_ARB = $200F;
  WGL_SUPPORT_OPENGL_ARB = $2010;
  WGL_DOUBLE_BUFFER_ARB = $2011;
  WGL_STEREO_ARB = $2012;
  WGL_PIXEL_TYPE_ARB = $2013;
  WGL_COLOR_BITS_ARB = $2014;
  WGL_RED_BITS_ARB = $2015;
  WGL_RED_SHIFT_ARB = $2016;
  WGL_GREEN_BITS_ARB = $2017;
  WGL_GREEN_SHIFT_ARB = $2018;
  WGL_BLUE_BITS_ARB = $2019;
  WGL_BLUE_SHIFT_ARB = $201A;
  WGL_ALPHA_BITS_ARB = $201B;
  WGL_ALPHA_SHIFT_ARB = $201C;
  WGL_ACCUM_BITS_ARB = $201D;
  WGL_ACCUM_RED_BITS_ARB = $201E;
  WGL_ACCUM_GREEN_BITS_ARB = $201F;
  WGL_ACCUM_BLUE_BITS_ARB = $2020;
  WGL_ACCUM_ALPHA_BITS_ARB = $2021;
  WGL_DEPTH_BITS_ARB = $2022;
  WGL_STENCIL_BITS_ARB = $2023;
  WGL_AUX_BUFFERS_ARB = $2024;
  WGL_NO_ACCELERATION_ARB = $2025;
  WGL_GENERIC_ACCELERATION_ARB = $2026;
  WGL_FULL_ACCELERATION_ARB = $2027;
  WGL_SWAP_EXCHANGE_ARB = $2028;
  WGL_SWAP_COPY_ARB = $2029;
  WGL_SWAP_UNDEFINED_ARB = $202A;
  WGL_TYPE_RGBA_ARB = $202B;
  WGL_TYPE_COLORINDEX_ARB = $202C;

  // WGL_ARB_pixel_format_float
  WGL_RGBA_FLOAT_MODE_ARB = $8820;
  WGL_CLAMP_VERTEX_COLOR_ARB = $891A;
  WGL_CLAMP_FRAGMENT_COLOR_ARB = $891B;
  WGL_CLAMP_READ_COLOR_ARB = $891C;
  WGL_FIXED_ONLY_ARB = $891D;

  // WGL_ARB_render_texture
  WGL_BIND_TO_TEXTURE_RGB_ARB = $2070;
  WGL_BIND_TO_TEXTURE_RGBA_ARB = $2071;
  WGL_TEXTURE_FORMAT_ARB = $2072;
  WGL_TEXTURE_TARGET_ARB = $2073;
  WGL_MIPMAP_TEXTURE_ARB = $2074;
  WGL_TEXTURE_RGB_ARB = $2075;
  WGL_TEXTURE_RGBA_ARB = $2076;
  WGL_NO_TEXTURE_ARB = $2077;
  WGL_TEXTURE_CUBE_MAP_ARB = $2078;
  WGL_TEXTURE_1D_ARB = $2079;
  WGL_TEXTURE_2D_ARB = $207A;
  WGL_MIPMAP_LEVEL_ARB = $207B;
  WGL_CUBE_MAP_FACE_ARB = $207C;
  WGL_TEXTURE_CUBE_MAP_POSITIVE_X_ARB = $207D;
  WGL_TEXTURE_CUBE_MAP_NEGATIVE_X_ARB = $207E;
  WGL_TEXTURE_CUBE_MAP_POSITIVE_Y_ARB = $207F;
  WGL_TEXTURE_CUBE_MAP_NEGATIVE_Y_ARB = $2080;
  WGL_TEXTURE_CUBE_MAP_POSITIVE_Z_ARB = $2081;
  WGL_TEXTURE_CUBE_MAP_NEGATIVE_Z_ARB = $2082;
  WGL_FRONT_LEFT_ARB = $2083;
  WGL_FRONT_RIGHT_ARB = $2084;
  WGL_BACK_LEFT_ARB = $2085;
  WGL_BACK_RIGHT_ARB = $2086;
  WGL_AUX0_ARB = $2087;
  WGL_AUX1_ARB = $2088;
  WGL_AUX2_ARB = $2089;
  WGL_AUX3_ARB = $208A;
  WGL_AUX4_ARB = $208B;
  WGL_AUX5_ARB = $208C;
  WGL_AUX6_ARB = $208D;
  WGL_AUX7_ARB = $208E;
  WGL_AUX8_ARB = $208F;
  WGL_AUX9_ARB = $2090;

  // WGL_ARB_create_context
  WGL_CONTEXT_DEBUG_BIT_ARB = $00000001;
  WGL_CONTEXT_FORWARD_COMPATIBLE_BIT_ARB = $00000002;
  WGL_CONTEXT_MAJOR_VERSION_ARB = $2091;
  WGL_CONTEXT_MINOR_VERSION_ARB = $2092;
  WGL_CONTEXT_LAYER_PLANE_ARB = $2093;
  WGL_CONTEXT_FLAGS_ARB = $2094;
  ERROR_INVALID_VERSION_ARB = $2095;

  // WGL_ARB_create_context_profile
  WGL_CONTEXT_PROFILE_MASK_ARB = $9126;
  WGL_CONTEXT_CORE_PROFILE_BIT_ARB = $00000001;
  WGL_CONTEXT_COMPATIBILITY_PROFILE_BIT_ARB = $00000002;
  ERROR_INVALID_PROFILE_ARB = $2096;

  // WGL_ARB_framebuffer_sRGB
  WGL_FRAMEBUFFER_SRGB_CAPABLE_ARB = $20A9;

  // WGL_ARB_create_context_robustness
  WGL_CONTEXT_ROBUST_ACCESS_BIT_ARB = $00000004;
  WGL_LOSE_CONTEXT_ON_RESET_ARB = $8252;
  WGL_CONTEXT_RESET_NOTIFICATION_STRATEGY_ARB = $8256;
  WGL_NO_RESET_NOTIFICATION_ARB = $8261;

  // WGL_ATI_pixel_format_float
  WGL_TYPE_RGBA_FLOAT_ATI = $21A0;
  GL_TYPE_RGBA_FLOAT_ATI = $8820;
  GL_COLOR_CLEAR_UNCLAMPED_VALUE_ATI = $8835;

  // WGL_AMD_gpu_association
  WGL_GPU_VENDOR_AMD = $1F00;
  WGL_GPU_RENDERER_STRING_AMD = $1F01;
  WGL_GPU_OPENGL_VERSION_STRING_AMD = $1F02;
  WGL_GPU_FASTEST_TARGET_GPUS_AMD = $21A2;
  WGL_GPU_RAM_AMD = $21A3;
  WGL_GPU_CLOCK_AMD = $21A4;
  WGL_GPU_NUM_PIPES_AMD = $21A5;
  WGL_GPU_NUM_SIMD_AMD = $21A6;
  WGL_GPU_NUM_RB_AMD = $21A7;
  WGL_GPU_NUM_SPI_AMD = $21A8;

  // WGL_EXT_depth_float
  WGL_DEPTH_FLOAT_EXT = $2040;

  // WGL_EXT_make_current_read
  ERROR_INVALID_PIXEL_TYPE_EXT = $2043;

  // WGL_EXT_multisample
  WGL_SAMPLE_BUFFERS_EXT = $2041;
  WGL_SAMPLES_EXT = $2042;

  // WGL_EXT_pbuffer
  WGL_DRAW_TO_PBUFFER_EXT = $202D;
  WGL_MAX_PBUFFER_PIXELS_EXT = $202E;
  WGL_MAX_PBUFFER_WIDTH_EXT = $202F;
  WGL_MAX_PBUFFER_HEIGHT_EXT = $2030;
  WGL_OPTIMAL_PBUFFER_WIDTH_EXT = $2031;
  WGL_OPTIMAL_PBUFFER_HEIGHT_EXT = $2032;
  WGL_PBUFFER_LARGEST_EXT = $2033;
  WGL_PBUFFER_WIDTH_EXT = $2034;
  WGL_PBUFFER_HEIGHT_EXT = $2035;

  // WGL_EXT_pixel_format
  WGL_NUMBER_PIXEL_FORMATS_EXT = $2000;
  WGL_DRAW_TO_WINDOW_EXT = $2001;
  WGL_DRAW_TO_BITMAP_EXT = $2002;
  WGL_ACCELERATION_EXT = $2003;
  WGL_NEED_PALETTE_EXT = $2004;
  WGL_NEED_SYSTEM_PALETTE_EXT = $2005;
  WGL_SWAP_LAYER_BUFFERS_EXT = $2006;
  WGL_SWAP_METHOD_EXT = $2007;
  WGL_NUMBER_OVERLAYS_EXT = $2008;
  WGL_NUMBER_UNDERLAYS_EXT = $2009;
  WGL_TRANSPARENT_EXT = $200A;
  WGL_TRANSPARENT_VALUE_EXT = $200B;
  WGL_SHARE_DEPTH_EXT = $200C;
  WGL_SHARE_STENCIL_EXT = $200D;
  WGL_SHARE_ACCUM_EXT = $200E;
  WGL_SUPPORT_GDI_EXT = $200F;
  WGL_SUPPORT_OPENGL_EXT = $2010;
  WGL_DOUBLE_BUFFER_EXT = $2011;
  WGL_STEREO_EXT = $2012;
  WGL_PIXEL_TYPE_EXT = $2013;
  WGL_COLOR_BITS_EXT = $2014;
  WGL_RED_BITS_EXT = $2015;
  WGL_RED_SHIFT_EXT = $2016;
  WGL_GREEN_BITS_EXT = $2017;
  WGL_GREEN_SHIFT_EXT = $2018;
  WGL_BLUE_BITS_EXT = $2019;
  WGL_BLUE_SHIFT_EXT = $201A;
  WGL_ALPHA_BITS_EXT = $201B;
  WGL_ALPHA_SHIFT_EXT = $201C;
  WGL_ACCUM_BITS_EXT = $201D;
  WGL_ACCUM_RED_BITS_EXT = $201E;
  WGL_ACCUM_GREEN_BITS_EXT = $201F;
  WGL_ACCUM_BLUE_BITS_EXT = $2020;
  WGL_ACCUM_ALPHA_BITS_EXT = $2021;
  WGL_DEPTH_BITS_EXT = $2022;
  WGL_STENCIL_BITS_EXT = $2023;
  WGL_AUX_BUFFERS_EXT = $2024;
  WGL_NO_ACCELERATION_EXT = $2025;
  WGL_GENERIC_ACCELERATION_EXT = $2026;
  WGL_FULL_ACCELERATION_EXT = $2027;
  WGL_SWAP_EXCHANGE_EXT = $2028;
  WGL_SWAP_COPY_EXT = $2029;
  WGL_SWAP_UNDEFINED_EXT = $202A;
  WGL_TYPE_RGBA_EXT = $202B;
  WGL_TYPE_COLORINDEX_EXT = $202C;

  // WGL_I3D_digital_video_control
  WGL_DIGITAL_VIDEO_CURSOR_ALPHA_FRAMEBUFFER_I3D = $2050;
  WGL_DIGITAL_VIDEO_CURSOR_ALPHA_VALUE_I3D = $2051;
  WGL_DIGITAL_VIDEO_CURSOR_INCLUDED_I3D = $2052;
  WGL_DIGITAL_VIDEO_GAMMA_CORRECTED_I3D = $2053;

  // WGL_I3D_gamma
  WGL_GAMMA_TABLE_SIZE_I3D = $204E;
  WGL_GAMMA_EXCLUDE_DESKTOP_I3D = $204F;

  // WGL_I3D_genlock
  WGL_GENLOCK_SOURCE_MULTIVIEW_I3D = $2044;
  WGL_GENLOCK_SOURCE_EXTENAL_SYNC_I3D = $2045;
  WGL_GENLOCK_SOURCE_EXTENAL_FIELD_I3D = $2046;
  WGL_GENLOCK_SOURCE_EXTENAL_TTL_I3D = $2047;
  WGL_GENLOCK_SOURCE_DIGITAL_SYNC_I3D = $2048;
  WGL_GENLOCK_SOURCE_DIGITAL_FIELD_I3D = $2049;
  WGL_GENLOCK_SOURCE_EDGE_FALLING_I3D = $204A;
  WGL_GENLOCK_SOURCE_EDGE_RISING_I3D = $204B;
  WGL_GENLOCK_SOURCE_EDGE_BOTH_I3D = $204C;

  // WGL_I3D_image_buffer
  WGL_IMAGE_BUFFER_MIN_ACCESS_I3D = $00000001;
  WGL_IMAGE_BUFFER_LOCK_I3D = $00000002;

  // WGL_NV_float_buffer
  WGL_FLOAT_COMPONENTS_NV = $20B0;
  WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_R_NV = $20B1;
  WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_RG_NV = $20B2;
  WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_RGB_NV = $20B3;
  WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_RGBA_NV = $20B4;
  WGL_TEXTURE_FLOAT_R_NV = $20B5;
  WGL_TEXTURE_FLOAT_RG_NV = $20B6;
  WGL_TEXTURE_FLOAT_RGB_NV = $20B7;
  WGL_TEXTURE_FLOAT_RGBA_NV = $20B8;

  // WGL_NV_render_depth_texture
  WGL_BIND_TO_TEXTURE_DEPTH_NV = $20A3;
  WGL_BIND_TO_TEXTURE_RECTANGLE_DEPTH_NV = $20A4;
  WGL_DEPTH_TEXTURE_FORMAT_NV = $20A5;
  WGL_TEXTURE_DEPTH_COMPONENT_NV = $20A6;
  WGL_DEPTH_COMPONENT_NV = $20A7;

  // WGL_NV_render_texture_rectangle
  WGL_BIND_TO_TEXTURE_RECTANGLE_RGB_NV = $20A0;
  WGL_BIND_TO_TEXTURE_RECTANGLE_RGBA_NV = $20A1;
  WGL_TEXTURE_RECTANGLE_NV = $20A2;

  // WGL_NV_present_video
  WGL_NUM_VIDEO_SLOTS_NV = $20F0;
  
  // WGL_NV_video_output
  WGL_BIND_TO_VIDEO_RGB_NV = $20C0;
  WGL_BIND_TO_VIDEO_RGBA_NV = $20C1;
  WGL_BIND_TO_VIDEO_RGB_AND_DEPTH_NV = $20C2;
  WGL_VIDEO_OUT_COLOR_NV = $20C3;
  WGL_VIDEO_OUT_ALPHA_NV = $20C4;
  WGL_VIDEO_OUT_DEPTH_NV = $20C5;
  WGL_VIDEO_OUT_COLOR_AND_ALPHA_NV = $20C6;
  WGL_VIDEO_OUT_COLOR_AND_DEPTH_NV = $20C7;
  WGL_VIDEO_OUT_FRAME = $20C8;
  WGL_VIDEO_OUT_FIELD_1 = $20C9;
  WGL_VIDEO_OUT_FIELD_2 = $20CA;
  WGL_VIDEO_OUT_STACKED_FIELDS_1_2 = $20CB;
  WGL_VIDEO_OUT_STACKED_FIELDS_2_1 = $20CC;

  // WGL_NV_gpu_affinity
  WGL_ERROR_INCOMPATIBLE_AFFINITY_MASKS_NV = $20D0;
  WGL_ERROR_MISSING_AFFINITY_MASK_NV = $20D1;

  // WGL_NV_video_capture
  WGL_UNIQUE_ID_NV = $20CE;
  WGL_NUM_VIDEO_CAPTURE_SLOTS_NV = $20CF;
  
  // WGL_NV_multisample_coverage
  WGL_COVERAGE_SAMPLES_NV = $2042;
  WGL_COLOR_SAMPLES_NV = $20B9;

  // WIN_draw_range_elements
  GL_MAX_ELEMENTS_VERTICES_WIN = $80E8;
  GL_MAX_ELEMENTS_INDICES_WIN = $80E9;

  // GLX 1.1 and later:
  GLX_VENDOR = 1;
  GLX_VERSION = 2;
  GLX_EXTENSIONS = 3;

  GLX_USE_GL = 1;
  GLX_BUFFER_SIZE = 2;
  GLX_LEVEL = 3;
  GLX_RGBA = 4;
  GLX_DOUBLEBUFFER = 5;
  GLX_STEREO = 6;
  GLX_AUX_BUFFERS = 7;
  GLX_RED_SIZE = 8;
  GLX_GREEN_SIZE = 9;
  GLX_BLUE_SIZE = 10;
  GLX_ALPHA_SIZE = 11;
  GLX_DEPTH_SIZE = 12;
  GLX_STENCIL_SIZE = 13;
  GLX_ACCUM_RED_SIZE = 14;
  GLX_ACCUM_GREEN_SIZE = 15;
  GLX_ACCUM_BLUE_SIZE = 16;
  GLX_ACCUM_ALPHA_SIZE = 17;

  // GLX_VERSION_1_3
  GLX_WINDOW_BIT = $00000001;
  GLX_PIXMAP_BIT = $00000002;
  GLX_PBUFFER_BIT = $00000004;
  GLX_RGBA_BIT = $00000001;
  GLX_COLOR_INDEX_BIT = $00000002;
  GLX_PBUFFER_CLOBBER_MASK = $08000000;
  GLX_FRONT_LEFT_BUFFER_BIT = $00000001;
  GLX_FRONT_RIGHT_BUFFER_BIT = $00000002;
  GLX_BACK_LEFT_BUFFER_BIT = $00000004;
  GLX_BACK_RIGHT_BUFFER_BIT = $00000008;
  GLX_AUX_BUFFERS_BIT = $00000010;
  GLX_DEPTH_BUFFER_BIT = $00000020;
  GLX_STENCIL_BUFFER_BIT = $00000040;
  GLX_ACCUM_BUFFER_BIT = $00000080;
  GLX_CONFIG_CAVEAT = $20;
  GLX_X_VISUAL_TYPE = $22;
  GLX_TRANSPARENT_TYPE = $23;
  GLX_TRANSPARENT_INDEX_VALUE = $24;
  GLX_TRANSPARENT_RED_VALUE = $25;
  GLX_TRANSPARENT_GREEN_VALUE = $26;
  GLX_TRANSPARENT_BLUE_VALUE = $27;
  GLX_TRANSPARENT_ALPHA_VALUE = $28;
  GLX_DONT_CARE = $FFFFFFFF;
  GLX_NONE = $8000;
  GLX_SLOW_CONFIG = $8001;
  GLX_TRUE_COLOR = $8002;
  GLX_DIRECT_COLOR = $8003;
  GLX_PSEUDO_COLOR = $8004;
  GLX_STATIC_COLOR = $8005;
  GLX_GRAY_SCALE = $8006;
  GLX_STATIC_GRAY = $8007;
  GLX_TRANSPARENT_RGB = $8008;
  GLX_TRANSPARENT_INDEX = $8009;
  GLX_VISUAL_ID = $800B;
  GLX_SCREEN = $800C;
  GLX_NON_CONFORMANT_CONFIG = $800D;
  GLX_DRAWABLE_TYPE = $8010;
  GLX_RENDER_TYPE = $8011;
  GLX_X_RENDERABLE = $8012;
  GLX_FBCONFIG_ID = $8013;
  GLX_RGBA_TYPE = $8014;
  GLX_COLOR_INDEX_TYPE = $8015;
  GLX_MAX_PBUFFER_WIDTH = $8016;
  GLX_MAX_PBUFFER_HEIGHT = $8017;
  GLX_MAX_PBUFFER_PIXELS = $8018;
  GLX_PRESERVED_CONTENTS = $801B;
  GLX_LARGEST_PBUFFER = $801C;
  GLX_WIDTH = $801D;
  GLX_HEIGHT = $801E;
  GLX_EVENT_MASK = $801F;
  GLX_DAMAGED = $8020;
  GLX_SAVED = $8021;
  GLX_WINDOW = $8022;
  GLX_PBUFFER = $8023;
  GLX_PBUFFER_HEIGHT = $8040;
  GLX_PBUFFER_WIDTH = $8041;

  // GLX_VERSION_1_4
  GLX_SAMPLE_BUFFERS = 100000;
  GLX_SAMPLES = 100001;

  // GLX_ARB_multisample
  GLX_SAMPLE_BUFFERS_ARB = 100000;
  GLX_SAMPLES_ARB = 100001;

  // GLX_ARB_fbconfig_float
  GLX_RGBA_FLOAT_TYPE_ARB = $20B9;
  GLX_RGBA_FLOAT_BIT_ARB = $00000004;

  // GLX_ARB_create_context
  GLX_CONTEXT_DEBUG_BIT_ARB = $00000001;
  GLX_CONTEXT_FORWARD_COMPATIBLE_BIT_ARB = $00000002;
  GLX_CONTEXT_MAJOR_VERSION_ARB = $2091;
  GLX_CONTEXT_MINOR_VERSION_ARB = $2092;
  GLX_CONTEXT_FLAGS_ARB = $2094;

  // GLX_ARB_create_context_profile
  GLX_CONTEXT_CORE_PROFILE_BIT_ARB = $00000001;
  GLX_CONTEXT_COMPATIBILITY_PROFILE_BIT_ARB = $00000002;
  GLX_CONTEXT_PROFILE_MASK_ARB = $9126;

  // GLX_ARB_vertex_buffer_object
  GLX_CONTEXT_ALLOW_BUFFER_BYTE_ORDER_MISMATCH_ARB = $2095;

  // GLX_ARB_framebuffer_sRGB
  GLX_FRAMEBUFFER_SRGB_CAPABLE_ARB = $20B2;

  // GLX_ARB_create_context_robustness
  GLX_CONTEXT_ROBUST_ACCESS_BIT_ARB = $00000004;
  GLX_LOSE_CONTEXT_ON_RESET_ARB = $8252;
  GLX_CONTEXT_RESET_NOTIFICATION_STRATEGY_ARB = $8256;
  GLX_NO_RESET_NOTIFICATION_ARB = $8261;

  // GLX_EXT_visual_info
  GLX_X_VISUAL_TYPE_EXT = $22;
  GLX_TRANSPARENT_TYPE_EXT = $23;
  GLX_TRANSPARENT_INDEX_VALUE_EXT = $24;
  GLX_TRANSPARENT_RED_VALUE_EXT = $25;
  GLX_TRANSPARENT_GREEN_VALUE_EXT = $26;
  GLX_TRANSPARENT_BLUE_VALUE_EXT = $27;
  GLX_TRANSPARENT_ALPHA_VALUE_EXT = $28;
  GLX_NONE_EXT = $8000;
  GLX_TRUE_COLOR_EXT = $8002;
  GLX_DIRECT_COLOR_EXT = $8003;
  GLX_PSEUDO_COLOR_EXT = $8004;
  GLX_STATIC_COLOR_EXT = $8005;
  GLX_GRAY_SCALE_EXT = $8006;
  GLX_STATIC_GRAY_EXT = $8007;
  GLX_TRANSPARENT_RGB_EXT = $8008;
  GLX_TRANSPARENT_INDEX_EXT = $8009;
  
  // GLX_EXT_visual_rating
  GLX_VISUAL_CAVEAT_EXT = $20;
  GLX_SLOW_VISUAL_EXT = $8001;
  GLX_NON_CONFORMANT_VISUAL_EXT = $800D;
  (* reuse GLX_NONE_EXT *)
  
  // GLX_EXT_import_context
  GLX_SHARE_CONTEXT_EXT = $800A;
  GLX_VISUAL_ID_EXT = $800B;
  GLX_SCREEN_EXT = $800C;

  // GLX_EXT_fbconfig_packed_float
//  GLX_RGBA_UNSIGNED_FLOAT_TYPE_EXT = $20B1;
//  GLX_RGBA_UNSIGNED_FLOAT_BIT_EXT = $00000008;

  // GLX_EXT_framebuffer_sRGB
//  GLX_FRAMEBUFFER_SRGB_CAPABLE_EXT = $20B2;

  // GLX_EXT_texture_from_pixmap
  GLX_TEXTURE_1D_BIT_EXT = $00000001;
  GLX_TEXTURE_2D_BIT_EXT = $00000002;
  GLX_TEXTURE_RECTANGLE_BIT_EXT = $00000004;
  GLX_BIND_TO_TEXTURE_RGB_EXT = $20D0;
  GLX_BIND_TO_TEXTURE_RGBA_EXT = $20D1;
  GLX_BIND_TO_MIPMAP_TEXTURE_EXT = $20D2;
  GLX_BIND_TO_TEXTURE_TARGETS_EXT = $20D3;
  GLX_Y_INVERTED_EXT = $20D4;
  GLX_TEXTURE_FORMAT_EXT = $20D5;
  GLX_TEXTURE_TARGET_EXT = $20D6;
  GLX_MIPMAP_TEXTURE_EXT = $20D7;
  GLX_TEXTURE_FORMAT_NONE_EXT = $20D8;
  GLX_TEXTURE_FORMAT_RGB_EXT = $20D9;
  GLX_TEXTURE_FORMAT_RGBA_EXT = $20DA;
  GLX_TEXTURE_1D_EXT = $20DB;
  GLX_TEXTURE_2D_EXT = $20DC;
  GLX_TEXTURE_RECTANGLE_EXT = $20DD;
  GLX_FRONT_LEFT_EXT = $20DE;
  GLX_FRONT_RIGHT_EXT = $20DF;
  GLX_BACK_LEFT_EXT = $20E0;
  GLX_BACK_RIGHT_EXT = $20E1;
  GLX_FRONT_EXT = GLX_FRONT_LEFT_EXT;
  GLX_BACK_EXT = GLX_BACK_LEFT_EXT;
  GLX_AUX0_EXT = $20E2;
  GLX_AUX1_EXT = $20E3;
  GLX_AUX2_EXT = $20E4;
  GLX_AUX3_EXT = $20E5;
  GLX_AUX4_EXT = $20E6;
  GLX_AUX5_EXT = $20E7;
  GLX_AUX6_EXT = $20E8;
  GLX_AUX7_EXT = $20E9;
  GLX_AUX8_EXT = $20EA;
  GLX_AUX9_EXT = $20EB;

  // GLX_EXT_swap_control
  GLX_SWAP_INTERVAL_EXT = $20F1;
  GLX_MAX_SWAP_INTERVAL_EXT = $20F2;

  // GLX_EXT_create_context_es2_profile
  GLX_CONTEXT_ES2_PROFILE_BIT_EXT = $00000004;

  // GLU
  GLU_INVALID_ENUM = 100900;
  GLU_INVALID_VALUE = 100901;
  GLU_OUT_OF_MEMORY = 100902;
  GLU_INCOMPATIBLE_GL_VERSION = 100903;
  GLU_VERSION = 100800;
  GLU_EXTENSIONS = 100801;
  GLU_TRUE = GL_TRUE;
  GLU_FALSE = GL_FALSE;
  GLU_SMOOTH = 100000;
  GLU_FLAT = 100001;
  GLU_NONE = 100002;
  GLU_POINT = 100010;
  GLU_LINE = 100011;
  GLU_FILL = 100012;
  GLU_SILHOUETTE = 100013;
  GLU_OUTSIDE = 100020;
  GLU_INSIDE = 100021;
  GLU_TESS_MAX_COORD = 1.0E150;
  GLU_TESS_WINDING_RULE = 100140;
  GLU_TESS_BOUNDARY_ONLY = 100141;
  GLU_TESS_TOLERANCE = 100142;
  GLU_TESS_WINDING_ODD = 100130;
  GLU_TESS_WINDING_NONZERO = 100131;
  GLU_TESS_WINDING_POSITIVE = 100132;
  GLU_TESS_WINDING_NEGATIVE = 100133;
  GLU_TESS_WINDING_ABS_GEQ_TWO = 100134;
  GLU_TESS_BEGIN = 100100; // TGLUTessBeginProc
  GLU_TESS_VERTEX = 100101; // TGLUTessVertexProc
  GLU_TESS_END = 100102; // TGLUTessEndProc
  GLU_TESS_ERROR = 100103; // TGLUTessErrorProc
  GLU_TESS_EDGE_FLAG = 100104; // TGLUTessEdgeFlagProc
  GLU_TESS_COMBINE = 100105; // TGLUTessCombineProc
  GLU_TESS_BEGIN_DATA = 100106; // TGLUTessBeginDataProc
  GLU_TESS_VERTEX_DATA = 100107; // TGLUTessVertexDataProc
  GLU_TESS_END_DATA = 100108; // TGLUTessEndDataProc
  GLU_TESS_ERROR_DATA = 100109; // TGLUTessErrorDataProc
  GLU_TESS_EDGE_FLAG_DATA = 100110; // TGLUTessEdgeFlagDataProc
  GLU_TESS_COMBINE_DATA = 100111; // TGLUTessCombineDataProc
  GLU_TESS_ERROR1 = 100151;
  GLU_TESS_ERROR2 = 100152;
  GLU_TESS_ERROR3 = 100153;
  GLU_TESS_ERROR4 = 100154;
  GLU_TESS_ERROR5 = 100155;
  GLU_TESS_ERROR6 = 100156;
  GLU_TESS_ERROR7 = 100157;
  GLU_TESS_ERROR8 = 100158;
  GLU_TESS_MISSING_BEGIN_POLYGON = GLU_TESS_ERROR1;
  GLU_TESS_MISSING_BEGIN_CONTOUR = GLU_TESS_ERROR2;
  GLU_TESS_MISSING_END_POLYGON = GLU_TESS_ERROR3;
  GLU_TESS_MISSING_END_CONTOUR = GLU_TESS_ERROR4;
  GLU_TESS_COORD_TOO_LARGE = GLU_TESS_ERROR5;
  GLU_TESS_NEED_COMBINE_CALLBACK = GLU_TESS_ERROR6;
  GLU_AUTO_LOAD_MATRIX = 100200;
  GLU_CULLING = 100201;
  GLU_SAMPLING_TOLERANCE = 100203;
  GLU_DISPLAY_MODE = 100204;
  GLU_PARAMETRIC_TOLERANCE = 100202;
  GLU_SAMPLING_METHOD = 100205;
  GLU_U_STEP = 100206;
  GLU_V_STEP = 100207;
  GLU_PATH_LENGTH = 100215;
  GLU_PARAMETRIC_ERROR = 100216;
  GLU_DOMAIN_DISTANCE = 100217;
  GLU_MAP1_TRIM_2 = 100210;
  GLU_MAP1_TRIM_3 = 100211;
  GLU_OUTLINE_POLYGON = 100240;
  GLU_OUTLINE_PATCH = 100241;
  GLU_NURBS_ERROR1 = 100251;
  GLU_NURBS_ERROR2 = 100252;
  GLU_NURBS_ERROR3 = 100253;
  GLU_NURBS_ERROR4 = 100254;
  GLU_NURBS_ERROR5 = 100255;
  GLU_NURBS_ERROR6 = 100256;
  GLU_NURBS_ERROR7 = 100257;
  GLU_NURBS_ERROR8 = 100258;
  GLU_NURBS_ERROR9 = 100259;
  GLU_NURBS_ERROR10 = 100260;
  GLU_NURBS_ERROR11 = 100261;
  GLU_NURBS_ERROR12 = 100262;
  GLU_NURBS_ERROR13 = 100263;
  GLU_NURBS_ERROR14 = 100264;
  GLU_NURBS_ERROR15 = 100265;
  GLU_NURBS_ERROR16 = 100266;
  GLU_NURBS_ERROR17 = 100267;
  GLU_NURBS_ERROR18 = 100268;
  GLU_NURBS_ERROR19 = 100269;
  GLU_NURBS_ERROR20 = 100270;
  GLU_NURBS_ERROR21 = 100271;
  GLU_NURBS_ERROR22 = 100272;
  GLU_NURBS_ERROR23 = 100273;
  GLU_NURBS_ERROR24 = 100274;
  GLU_NURBS_ERROR25 = 100275;
  GLU_NURBS_ERROR26 = 100276;
  GLU_NURBS_ERROR27 = 100277;
  GLU_NURBS_ERROR28 = 100278;
  GLU_NURBS_ERROR29 = 100279;
  GLU_NURBS_ERROR30 = 100280;
  GLU_NURBS_ERROR31 = 100281;
  GLU_NURBS_ERROR32 = 100282;
  GLU_NURBS_ERROR33 = 100283;
  GLU_NURBS_ERROR34 = 100284;
  GLU_NURBS_ERROR35 = 100285;
  GLU_NURBS_ERROR36 = 100286;
  GLU_NURBS_ERROR37 = 100287;
  GLU_CW = 100120;
  GLU_CCW = 100121;
  GLU_INTERIOR = 100122;
  GLU_EXTERIOR = 100123;
  GLU_UNKNOWN = 100124;
  GLU_BEGIN = GLU_TESS_BEGIN;
  GLU_VERTEX = GLU_TESS_VERTEX;
  GLU_END = GLU_TESS_END;
  GLU_ERROR = GLU_TESS_ERROR;
  GLU_EDGE_FLAG = GLU_TESS_EDGE_FLAG;

type
  // GL_VERSION_1_0
  TglCullFace = procedure(mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFrontFace = procedure(mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglHint = procedure(target: GLenum; mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLineWidth = procedure(width: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPointSize = procedure(size: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPolygonMode = procedure(face: GLenum; mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglScissor = procedure(x: GLint; y: GLint; width: GLsizei; height: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexParameterf = procedure(target: GLenum; pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexParameterfv = procedure(target: GLenum; pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexParameteri = procedure(target: GLenum; pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexParameteriv = procedure(target: GLenum; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexImage1D = procedure(target: GLenum; level: GLint; internalformat: GLint; width: GLsizei; border: GLint; format: GLenum; _type: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexImage2D = procedure(target: GLenum; level: GLint; internalformat: GLint; width: GLsizei; height: GLsizei; border: GLint; format: GLenum; _type: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDrawBuffer = procedure(mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglClear = procedure(mask: GLbitfield); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglClearColor = procedure(red: GLclampf; green: GLclampf; blue: GLclampf; alpha: GLclampf); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglClearStencil = procedure(s: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglClearDepth = procedure(depth: GLclampd); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglStencilMask = procedure(mask: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColorMask = procedure(red: GLboolean; green: GLboolean; blue: GLboolean; alpha: GLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDepthMask = procedure(flag: GLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDisable = procedure(cap: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEnable = procedure(cap: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFinish = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFlush = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBlendFunc = procedure(sfactor: GLenum; dfactor: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLogicOp = procedure(opcode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglStencilFunc = procedure(func: GLenum; ref: GLint; mask: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglStencilOp = procedure(fail: GLenum; zfail: GLenum; zpass: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDepthFunc = procedure(func: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPixelStoref = procedure(pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPixelStorei = procedure(pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReadBuffer = procedure(mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReadPixels = procedure(x: GLint; y: GLint; width: GLsizei; height: GLsizei; format: GLenum; _type: GLenum; pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetBooleanv = procedure(pname: GLenum; params: PGLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetDoublev = procedure(pname: GLenum; params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetError = function(): GLenum; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetFloatv = procedure(pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetIntegerv = procedure(pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetString = function(name: GLenum): PAnsiChar; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTexImage = procedure(target: GLenum; level: GLint; format: GLenum; _type: GLenum; pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTexParameteriv = procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTexParameterfv = procedure(target: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTexLevelParameterfv = procedure(target: GLenum; level: GLint; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTexLevelParameteriv = procedure(target: GLenum; level: GLint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsEnabled = function(cap: GLenum): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDepthRange = procedure(zNear: GLclampd; zFar: GLclampd); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglViewport = procedure(x: GLint; y: GLint; width: GLsizei; height: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_VERSION_1_1
  TglDrawArrays = procedure(mode: GLenum; first: GLint; count: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDrawElements = procedure(mode: GLenum; count: GLsizei; _type: GLenum; const indices: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetPointerv = procedure(pname: GLenum; params: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPolygonOffset = procedure(factor: GLfloat; units: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyTexImage1D = procedure(target: GLenum; level: GLint; internalFormat: GLenum; x: GLint; y: GLint; width: GLsizei; border: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyTexImage2D = procedure(target: GLenum; level: GLint; internalFormat: GLenum; x: GLint; y: GLint; width: GLsizei; height: GLsizei; border: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyTexSubImage1D = procedure(target: GLenum; level: GLint; xoffset: GLint; x: GLint; y: GLint; width: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyTexSubImage2D = procedure(target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; x: GLint; y: GLint; width: GLsizei; height: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexSubImage1D = procedure(target: GLenum; level: GLint; xoffset: GLint; width: GLsizei; format: GLenum; _type: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexSubImage2D = procedure(target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; width: GLsizei; height: GLsizei; format: GLenum; _type: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindTexture = procedure(target: GLenum; texture: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteTextures = procedure(n: GLsizei; const textures: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenTextures = procedure(n: GLsizei; textures: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  
{$ifdef DGL_DEPRECATED}
  TglAccum = procedure(op: GLenum; value: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglAlphaFunc = procedure(func: GLenum; ref: GLclampf); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglAreTexturesResident = function(n: GLsizei; const textures: PGLuint; residences: PGLboolean): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglArrayElement = procedure(i: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBegin = procedure(mode: GLenum); {$IFNDEF CLR}{$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}{$ENDIF}
  TglBitmap = procedure(width: GLsizei; height: GLsizei; xorig: GLfloat; yorig: GLfloat; xmove: GLfloat; ymove: GLfloat; const bitmap: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCallList = procedure(list: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCallLists = procedure(n: GLsizei; _type: GLenum; const lists: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglClearAccum = procedure(red: GLfloat; green: GLfloat; blue: GLfloat; alpha: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglClearIndex = procedure(c: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglClipPlane = procedure(plane: GLenum; const equation: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor3b = procedure(red: GLbyte; green: GLbyte; blue: GLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor3bv = procedure(const v: PGLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor3d = procedure(red: GLdouble; green: GLdouble; blue: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor3dv = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor3f = procedure(red: GLfloat; green: GLfloat; blue: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor3fv = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor3i = procedure(red: GLint; green: GLint; blue: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor3iv = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor3s = procedure(red: GLshort; green: GLshort; blue: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor3sv = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor3ub = procedure(red: GLubyte; green: GLubyte; blue: GLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor3ubv = procedure(const v: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor3ui = procedure(red: GLuint; green: GLuint; blue: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor3uiv = procedure(const v: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor3us = procedure(red: GLushort; green: GLushort; blue: GLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor3usv = procedure(const v: PGLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4b = procedure(red: GLbyte; green: GLbyte; blue: GLbyte; alpha: GLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4bv = procedure(const v: PGLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4d = procedure(red: GLdouble; green: GLdouble; blue: GLdouble; alpha: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4dv = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4f = procedure(red: GLfloat; green: GLfloat; blue: GLfloat; alpha: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4fv = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4i = procedure(red: GLint; green: GLint; blue: GLint; alpha: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4iv = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4s = procedure(red: GLshort; green: GLshort; blue: GLshort; alpha: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4sv = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4ub = procedure(red: GLubyte; green: GLubyte; blue: GLubyte; alpha: GLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4ubv = procedure(const v: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4ui = procedure(red: GLuint; green: GLuint; blue: GLuint; alpha: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4uiv = procedure(const v: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4us = procedure(red: GLushort; green: GLushort; blue: GLushort; alpha: GLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4usv = procedure(const v: PGLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColorMaterial = procedure(face: GLenum; mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColorPointer = procedure(size: GLint; _type: GLenum; stride: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyPixels = procedure(x: GLint; y: GLint; width: GLsizei; height: GLsizei; _type: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteLists = procedure(list: GLuint; range: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDisableClientState = procedure(_array: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDrawPixels = procedure(width: GLsizei; height: GLsizei; format: GLenum; _type: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEdgeFlag = procedure(flag: GLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEdgeFlagPointer = procedure(stride: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEdgeFlagv = procedure(const flag: PGLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEnableClientState = procedure(_array: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEnd = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEndList = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEvalCoord1d = procedure(u: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEvalCoord1dv = procedure(const u: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEvalCoord1f = procedure(u: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEvalCoord1fv = procedure(const u: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEvalCoord2d = procedure(u: GLdouble; v: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEvalCoord2dv = procedure(const u: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEvalCoord2f = procedure(u: GLfloat; v: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEvalCoord2fv = procedure(const u: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEvalMesh1 = procedure(mode: GLenum; i1: GLint; i2: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEvalMesh2 = procedure(mode: GLenum; i1: GLint; i2: GLint; j1: GLint; j2: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEvalPoint1 = procedure(i: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEvalPoint2 = procedure(i: GLint; j: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFeedbackBuffer = procedure(size: GLsizei; _type: GLenum; buffer: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFogf = procedure(pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFogfv = procedure(pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFogi = procedure(pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFogiv = procedure(pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFrustum = procedure(left: GLdouble; right: GLdouble; bottom: GLdouble; top: GLdouble; zNear: GLdouble; zFar: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenLists = function(range: GLsizei): GLuint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetClipPlane = procedure(plane: GLenum; equation: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetLightfv = procedure(light: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetLightiv = procedure(light: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMapdv = procedure(target: GLenum; query: GLenum; v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMapfv = procedure(target: GLenum; query: GLenum; v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMapiv = procedure(target: GLenum; query: GLenum; v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMaterialfv = procedure(face: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMaterialiv = procedure(face: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetPixelMapfv = procedure(map: GLenum; values: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetPixelMapuiv = procedure(map: GLenum; values: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetPixelMapusv = procedure(map: GLenum; values: PGLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetPolygonStipple = procedure(mask: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTexEnvfv = procedure(target: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTexEnviv = procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTexGendv = procedure(coord: GLenum; pname: GLenum; params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTexGenfv = procedure(coord: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTexGeniv = procedure(coord: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIndexMask = procedure(mask: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIndexPointer = procedure(_type: GLenum; stride: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIndexd = procedure(c: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIndexdv = procedure(const c: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIndexf = procedure(c: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIndexfv = procedure(const c: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIndexi = procedure(c: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIndexiv = procedure(const c: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIndexs = procedure(c: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIndexsv = procedure(const c: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIndexub = procedure(c: GLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIndexubv = procedure(const c: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglInitNames = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglInterleavedArrays = procedure(format: GLenum; stride: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsList = function(list: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsTexture = function(texture: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLightModelf = procedure(pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLightModelfv = procedure(pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLightModeli = procedure(pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLightModeliv = procedure(pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLightf = procedure(light: GLenum; pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLightfv = procedure(light: GLenum; pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLighti = procedure(light: GLenum; pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLightiv = procedure(light: GLenum; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLineStipple = procedure(factor: GLint; pattern: GLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglListBase = procedure(base: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLoadIdentity = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLoadMatrixd = procedure(const m: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLoadMatrixf = procedure(const m: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLoadName = procedure(name: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMap1d = procedure(target: GLenum; u1: GLdouble; u2: GLdouble; stride: GLint; order: GLint; const points: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMap1f = procedure(target: GLenum; u1: GLfloat; u2: GLfloat; stride: GLint; order: GLint; const points: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMap2d = procedure(target: GLenum; u1: GLdouble; u2: GLdouble; ustride: GLint; uorder: GLint; v1: GLdouble; v2: GLdouble; vstride: GLint; vorder: GLint; const points: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMap2f = procedure(target: GLenum; u1: GLfloat; u2: GLfloat; ustride: GLint; uorder: GLint; v1: GLfloat; v2: GLfloat; vstride: GLint; vorder: GLint; const points: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMapGrid1d = procedure(un: GLint; u1: GLdouble; u2: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMapGrid1f = procedure(un: GLint; u1: GLfloat; u2: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMapGrid2d = procedure(un: GLint; u1: GLdouble; u2: GLdouble; vn: GLint; v1: GLdouble; v2: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMapGrid2f = procedure(un: GLint; u1: GLfloat; u2: GLfloat; vn: GLint; v1: GLfloat; v2: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMaterialf = procedure(face: GLenum; pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMaterialfv = procedure(face: GLenum; pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMateriali = procedure(face: GLenum; pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMaterialiv = procedure(face: GLenum; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixMode = procedure(mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultMatrixd = procedure(const m: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultMatrixf = procedure(const m: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNewList = procedure(list: GLuint; mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormal3b = procedure(nx: GLbyte; ny: GLbyte; nz: GLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormal3bv = procedure(const v: PGLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormal3d = procedure(nx: GLdouble; ny: GLdouble; nz: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormal3dv = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormal3f = procedure(nx: GLfloat; ny: GLfloat; nz: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormal3fv = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormal3i = procedure(nx: GLint; ny: GLint; nz: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormal3iv = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormal3s = procedure(nx: GLshort; ny: GLshort; nz: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormal3sv = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormalPointer = procedure(_type: GLenum; stride: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglOrtho = procedure(left: GLdouble; right: GLdouble; bottom: GLdouble; top: GLdouble; zNear: GLdouble; zFar: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPassThrough = procedure(token: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPixelMapfv = procedure(map: GLenum; mapsize: GLsizei; const values: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPixelMapuiv = procedure(map: GLenum; mapsize: GLsizei; const values: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPixelMapusv = procedure(map: GLenum; mapsize: GLsizei; const values: PGLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPixelTransferf = procedure(pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPixelTransferi = procedure(pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPixelZoom = procedure(xfactor: GLfloat; yfactor: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPolygonStipple = procedure(const mask: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPopAttrib = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPopClientAttrib = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPopMatrix = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPopName = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPrioritizeTextures = procedure(n: GLsizei; const textures: PGLuint; const priorities: PGLclampf); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPushAttrib = procedure(mask: GLbitfield); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPushClientAttrib = procedure(mask: GLbitfield); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPushMatrix = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPushName = procedure(name: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos2d = procedure(x: GLdouble; y: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos2dv = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos2f = procedure(x: GLfloat; y: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos2fv = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos2i = procedure(x: GLint; y: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos2iv = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos2s = procedure(x: GLshort; y: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos2sv = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos3d = procedure(x: GLdouble; y: GLdouble; z: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos3dv = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos3f = procedure(x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos3fv = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos3i = procedure(x: GLint; y: GLint; z: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos3iv = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos3s = procedure(x: GLshort; y: GLshort; z: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos3sv = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos4d = procedure(x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos4dv = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos4f = procedure(x: GLfloat; y: GLfloat; z: GLfloat; w: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos4fv = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos4i = procedure(x: GLint; y: GLint; z: GLint; w: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos4iv = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos4s = procedure(x: GLshort; y: GLshort; z: GLshort; w: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRasterPos4sv = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRectd = procedure(x1: GLdouble; y1: GLdouble; x2: GLdouble; y2: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRectdv = procedure(const v1: PGLdouble; const v2: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRectf = procedure(x1: GLfloat; y1: GLfloat; x2: GLfloat; y2: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRectfv = procedure(const v1: PGLfloat; const v2: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRecti = procedure(x1: GLint; y1: GLint; x2: GLint; y2: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRectiv = procedure(const v1: PGLint; const v2: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRects = procedure(x1: GLshort; y1: GLshort; x2: GLshort; y2: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRectsv = procedure(const v1: PGLshort; const v2: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRenderMode = function(mode: GLenum): GLint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRotated = procedure(angle: GLdouble; x: GLdouble; y: GLdouble; z: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRotatef = procedure(angle: GLfloat; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglScaled = procedure(x: GLdouble; y: GLdouble; z: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglScalef = procedure(x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSelectBuffer = procedure(size: GLsizei; buffer: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglShadeModel = procedure(mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord1d = procedure(s: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord1dv = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord1f = procedure(s: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord1fv = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord1i = procedure(s: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord1iv = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord1s = procedure(s: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord1sv = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord2d = procedure(s: GLdouble; t: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord2dv = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord2f = procedure(s: GLfloat; t: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord2fv = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord2i = procedure(s: GLint; t: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord2iv = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord2s = procedure(s: GLshort; t: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord2sv = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord3d = procedure(s: GLdouble; t: GLdouble; r: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord3dv = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord3f = procedure(s: GLfloat; t: GLfloat; r: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord3fv = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord3i = procedure(s: GLint; t: GLint; r: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord3iv = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord3s = procedure(s: GLshort; t: GLshort; r: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord3sv = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord4d = procedure(s: GLdouble; t: GLdouble; r: GLdouble; q: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord4dv = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord4f = procedure(s: GLfloat; t: GLfloat; r: GLfloat; q: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord4fv = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord4i = procedure(s: GLint; t: GLint; r: GLint; q: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord4iv = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord4s = procedure(s: GLshort; t: GLshort; r: GLshort; q: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord4sv = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoordPointer = procedure(size: GLint; _type: GLenum; stride: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexEnvf = procedure(target: GLenum; pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexEnvfv = procedure(target: GLenum; pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexEnvi = procedure(target: GLenum; pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexEnviv = procedure(target: GLenum; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexGend = procedure(coord: GLenum; pname: GLenum; param: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexGendv = procedure(coord: GLenum; pname: GLenum; const params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexGenf = procedure(coord: GLenum; pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexGenfv = procedure(coord: GLenum; pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexGeni = procedure(coord: GLenum; pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexGeniv = procedure(coord: GLenum; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}


  TglTranslated = procedure(x: GLdouble; y: GLdouble; z: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTranslatef = procedure(x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex2d = procedure(x: GLdouble; y: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex2dv = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex2f = procedure(x: GLfloat; y: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex2fv = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex2i = procedure(x: GLint; y: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex2iv = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex2s = procedure(x: GLshort; y: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex2sv = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex3d = procedure(x: GLdouble; y: GLdouble; z: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex3dv = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex3f = procedure(x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex3fv = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex3i = procedure(x: GLint; y: GLint; z: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex3iv = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex3s = procedure(x: GLshort; y: GLshort; z: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex3sv = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex4d = procedure(x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex4dv = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex4f = procedure(x: GLfloat; y: GLfloat; z: GLfloat; w: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex4fv = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex4i = procedure(x: GLint; y: GLint; z: GLint; w: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex4iv = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex4s = procedure(x: GLshort; y: GLshort; z: GLshort; w: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex4sv = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexPointer = procedure(size: GLint; _type: GLenum; stride: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
{$endif}

  // GL_VERSION_1_2
  TglBlendColor = procedure(red: GLclampf; green: GLclampf; blue: GLclampf; alpha: GLclampf); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBlendEquation = procedure(mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDrawRangeElements = procedure(mode: GLenum; start: GLuint; _end: GLuint; count: GLsizei; _type: GLenum; const indices: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexImage3D = procedure(target: GLenum; level: GLint; internalformat: GLint; width: GLsizei; height: GLsizei; depth: GLsizei; border: GLint; format: GLenum; _type: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexSubImage3D = procedure(target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; zoffset: GLint; width: GLsizei; height: GLsizei; depth: GLsizei; format: GLenum; _type: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyTexSubImage3D = procedure(target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; zoffset: GLint; x: GLint; y: GLint; width: GLsizei; height: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
{$ifdef DGL_DEPRECATED}
  TglColorTable = procedure(target: GLenum; internalformat: GLenum; width: GLsizei; format: GLenum; _type: GLenum; const table: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColorTableParameterfv = procedure(target: GLenum; pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColorTableParameteriv = procedure(target: GLenum; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyColorTable = procedure(target: GLenum; internalformat: GLenum; x: GLint; y: GLint; width: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetColorTable = procedure(target: GLenum; format: GLenum; _type: GLenum; table: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetColorTableParameterfv = procedure(target: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetColorTableParameteriv = procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColorSubTable = procedure(target: GLenum; start: GLsizei; count: GLsizei; format: GLenum; _type: GLenum; const data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyColorSubTable = procedure(target: GLenum; start: GLsizei; x: GLint; y: GLint; width: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglConvolutionFilter1D = procedure(target: GLenum; internalformat: GLenum; width: GLsizei; format: GLenum; _type: GLenum; const image: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglConvolutionFilter2D = procedure(target: GLenum; internalformat: GLenum; width: GLsizei; height: GLsizei; format: GLenum; _type: GLenum; const image: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglConvolutionParameterf = procedure(target: GLenum; pname: GLenum; params: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglConvolutionParameterfv = procedure(target: GLenum; pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglConvolutionParameteri = procedure(target: GLenum; pname: GLenum; params: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglConvolutionParameteriv = procedure(target: GLenum; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyConvolutionFilter1D = procedure(target: GLenum; internalformat: GLenum; x: GLint; y: GLint; width: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyConvolutionFilter2D = procedure(target: GLenum; internalformat: GLenum; x: GLint; y: GLint; width: GLsizei; height: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetConvolutionFilter = procedure(target: GLenum; format: GLenum; _type: GLenum; image: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetConvolutionParameterfv = procedure(target: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetConvolutionParameteriv = procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetSeparableFilter = procedure(target: GLenum; format: GLenum; _type: GLenum; row: PGLvoid; column: PGLvoid; span: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSeparableFilter2D = procedure(target: GLenum; internalformat: GLenum; width: GLsizei; height: GLsizei; format: GLenum; _type: GLenum; const row: PGLvoid; const column: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetHistogram = procedure(target: GLenum; reset: GLboolean; format: GLenum; _type: GLenum; values: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetHistogramParameterfv = procedure(target: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetHistogramParameteriv = procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMinmax = procedure(target: GLenum; reset: GLboolean; format: GLenum; _type: GLenum; values: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMinmaxParameterfv = procedure(target: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMinmaxParameteriv = procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglHistogram = procedure(target: GLenum; width: GLsizei; internalformat: GLenum; sink: GLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMinmax = procedure(target: GLenum; internalformat: GLenum; sink: GLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglResetHistogram = procedure(target: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglResetMinmax = procedure(target: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
{$endif}

  // GL_VERSION_1_3
  TglActiveTexture = procedure(texture: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSampleCoverage = procedure(value: GLclampf; invert: GLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedTexImage3D = procedure(target: GLenum; level: GLint; internalformat: GLenum; width: GLsizei; height: GLsizei; depth: GLsizei; border: GLint; imageSize: GLsizei; const data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedTexImage2D = procedure(target: GLenum; level: GLint; internalformat: GLenum; width: GLsizei; height: GLsizei; border: GLint; imageSize: GLsizei; const data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedTexImage1D = procedure(target: GLenum; level: GLint; internalformat: GLenum; width: GLsizei; border: GLint; imageSize: GLsizei; const data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedTexSubImage3D = procedure(target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; zoffset: GLint; width: GLsizei; height: GLsizei; depth: GLsizei; format: GLenum; imageSize: GLsizei; const data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedTexSubImage2D = procedure(target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; width: GLsizei; height: GLsizei; format: GLenum; imageSize: GLsizei; const data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedTexSubImage1D = procedure(target: GLenum; level: GLint; xoffset: GLint; width: GLsizei; format: GLenum; imageSize: GLsizei; const data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetCompressedTexImage = procedure(target: GLenum; level: GLint; img: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
{$ifdef DGL_DEPRECATED}
  TglClientActiveTexture = procedure(texture: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord1d = procedure(target: GLenum; s: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord1dv = procedure(target: GLenum; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord1f = procedure(target: GLenum; s: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord1fv = procedure(target: GLenum; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord1i = procedure(target: GLenum; s: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord1iv = procedure(target: GLenum; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord1s = procedure(target: GLenum; s: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord1sv = procedure(target: GLenum; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord2d = procedure(target: GLenum; s: GLdouble; t: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord2dv = procedure(target: GLenum; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord2f = procedure(target: GLenum; s: GLfloat; t: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord2fv = procedure(target: GLenum; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord2i = procedure(target: GLenum; s: GLint; t: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord2iv = procedure(target: GLenum; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord2s = procedure(target: GLenum; s: GLshort; t: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord2sv = procedure(target: GLenum; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord3d = procedure(target: GLenum; s: GLdouble; t: GLdouble; r: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord3dv = procedure(target: GLenum; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord3f = procedure(target: GLenum; s: GLfloat; t: GLfloat; r: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord3fv = procedure(target: GLenum; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord3i = procedure(target: GLenum; s: GLint; t: GLint; r: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord3iv = procedure(target: GLenum; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord3s = procedure(target: GLenum; s: GLshort; t: GLshort; r: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord3sv = procedure(target: GLenum; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord4d = procedure(target: GLenum; s: GLdouble; t: GLdouble; r: GLdouble; q: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord4dv = procedure(target: GLenum; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord4f = procedure(target: GLenum; s: GLfloat; t: GLfloat; r: GLfloat; q: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord4fv = procedure(target: GLenum; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord4i = procedure(target: GLenum; s: GLint; t: GLint; r: GLint; q: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord4iv = procedure(target: GLenum; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord4s = procedure(target: GLenum; s: GLshort; t: GLshort; r: GLshort; q: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord4sv = procedure(target: GLenum; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLoadTransposeMatrixf = procedure(const m: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLoadTransposeMatrixd = procedure(const m: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultTransposeMatrixf = procedure(const m: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultTransposeMatrixd = procedure(const m: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
{$endif}

  // GL_VERSION_1_4
  TglBlendFuncSeparate = procedure(sfactorRGB: GLenum; dfactorRGB: GLenum; sfactorAlpha: GLenum; dfactorAlpha: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiDrawArrays = procedure(mode: GLenum; const first: PGLint; const count: PGLsizei; primcount: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiDrawElements = procedure(mode: GLenum; const count: PGLsizei; _type: GLenum; const indices: PGLvoid; primcount: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPointParameterf = procedure(pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPointParameterfv = procedure(pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPointParameteri = procedure(pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPointParameteriv = procedure(pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
{$ifdef DGL_DEPRECATED}
  TglFogCoordf = procedure(coord: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFogCoordfv = procedure(const coord: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFogCoordd = procedure(coord: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFogCoorddv = procedure(const coord: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFogCoordPointer = procedure(_type: GLenum; stride: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3b = procedure(red: GLbyte; green: GLbyte; blue: GLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3bv = procedure(const v: PGLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3d = procedure(red: GLdouble; green: GLdouble; blue: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3dv = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3f = procedure(red: GLfloat; green: GLfloat; blue: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3fv = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3i = procedure(red: GLint; green: GLint; blue: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3iv = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3s = procedure(red: GLshort; green: GLshort; blue: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3sv = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3ub = procedure(red: GLubyte; green: GLubyte; blue: GLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3ubv = procedure(const v: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3ui = procedure(red: GLuint; green: GLuint; blue: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3uiv = procedure(const v: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3us = procedure(red: GLushort; green: GLushort; blue: GLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3usv = procedure(const v: PGLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColorPointer = procedure(size: GLint; _type: GLenum; stride: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2d = procedure(x: GLdouble; y: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2dv = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2f = procedure(x: GLfloat; y: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2fv = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2i = procedure(x: GLint; y: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2iv = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2s = procedure(x: GLshort; y: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2sv = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3d = procedure(x: GLdouble; y: GLdouble; z: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3dv = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3f = procedure(x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3fv = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3i = procedure(x: GLint; y: GLint; z: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3iv = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3s = procedure(x: GLshort; y: GLshort; z: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3sv = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
{$endif}

  // GL_VERSION_1_5
  TglGenQueries = procedure(n: GLsizei; ids: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteQueries = procedure(n: GLsizei; const ids: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsQuery = function(id: GLuint): boolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBeginQuery = procedure(target: GLenum; id: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEndQuery = procedure(target: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetQueryiv = procedure(target, pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetQueryObjectiv = procedure(id: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetQueryObjectuiv = procedure(id: GLuint; pname: GLenum; params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindBuffer = procedure(target: GLenum; buffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteBuffers = procedure(n: GLsizei; const buffers: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenBuffers = procedure(n: GLsizei; buffers: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsBuffer = function(buffer: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBufferData = procedure(target: GLenum; size: GLsizeiptr; const data: PGLvoid; usage: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBufferSubData = procedure(target: GLenum; offset: GLintptr; size: GLsizeiptr; const data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetBufferSubData = procedure(target: GLenum; offset: GLintptr; size: GLsizeiptr; data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMapBuffer = function(target: GLenum; access: GLenum): PGLvoid; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUnmapBuffer = function(target: GLenum): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetBufferParameteriv = procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetBufferPointerv = procedure(target: GLenum; pname: GLenum; params: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_VERSION_2_0
  TglBlendEquationSeparate = procedure(modeRGB: GLenum; modeAlpha: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDrawBuffers = procedure(n: GLsizei; const bufs: PGLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglStencilOpSeparate = procedure(face: GLenum; sfail: GLenum; dpfail: GLenum; dppass: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglStencilFuncSeparate = procedure(face: GLenum; func: GLenum; ref: GLint; mask: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglStencilMaskSeparate = procedure(face: GLenum; mask: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglAttachShader = procedure(programObj, shaderObj: GLhandle); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindAttribLocation = procedure(programObj: GLhandle; index: GLuint; name: PGLChar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompileShader = procedure(shaderObj: GLhandle); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCreateProgram = function: GLhandle; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCreateShader = function(shaderType: GLenum): GLhandle; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteProgram = procedure(programObj: GLhandle); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteShader = procedure(shaderObj: GLhandle); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDetachShader = procedure(programObj, shaderObj: GLhandle); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDisableVertexAttribArray = procedure(index: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEnableVertexAttribArray = procedure(index: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetActiveAttrib = procedure(programObj: GLhandle; index: GLuint; maxlength: GLsizei; var length: GLint; var size: GLint; var _type: GLenum; name: PGLChar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetActiveUniform = procedure(programObj: GLhandle; index: GLuint; maxLength: GLsizei; var length: GLsizei; var size: GLint; var _type: GLenum; name: PGLChar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetAttachedShaders = procedure(programObj: GLhandle; MaxCount: GLsizei; var Count: GLint; shaders: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetAttribLocation = function(programObj: GLhandle; char: PGLChar): glint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramiv = procedure(programObj: GLhandle; pname: GLenum; params: PGLInt); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramInfoLog = procedure(programObj: GLHandle; maxLength: glsizei; var length: GLint; infoLog: PGLChar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetShaderiv = procedure(shaderObj: GLhandle; pname: GLenum; params: PGLInt); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetShaderInfoLog = procedure(shaderObj: GLHandle; maxLength: glsizei; var length: glint; infoLog: PGLChar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetShaderSource = procedure(shaderObj: GLhandle; maxlength: GLsizei; var length: GLsizei; source: PGLChar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetUniformLocation = function(programObj: GLhandle; const char: PGLChar): glint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetUniformfv = procedure(programObj: GLhandle; location: GLint; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetUniformiv = procedure(programObj: GLhandle; location: GLint; params: PGLInt); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVertexAttribfv = procedure(index: GLuint; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVertexAttribiv = procedure(index: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVertexAttribPointerv = procedure(index: GLuint; pname: GLenum; _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsProgram = function(programObj: GLhandle) : GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsShader = function(shaderObj: GLhandle) : GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLinkProgram = procedure(programObj: GLHandle); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglShaderSource = procedure(shaderObj: GLHandle; count: glsizei; _string: PPGLChar; lengths: pglint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUseProgram = procedure(programObj: GLhandle); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform1f = procedure(location: GLint; v0: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform2f = procedure(location: GLint; v0, v1: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform3f = procedure(location: GLint; v0, v1, v2: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform4f = procedure(location: GLint; v0, v1, v2, v3: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform1i = procedure(location: GLint; v0: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform2i = procedure(location: GLint; v0, v1: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform3i = procedure(location: GLint; v0, v1, v2: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform4i = procedure(location: GLint; v0, v1, v2, v3: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform1fv = procedure(location: GLint; count: GLsizei; value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform2fv = procedure(location: GLint; count: GLsizei; value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform3fv = procedure(location: GLint; count: GLsizei; value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform4fv = procedure(location: GLint; count: GLsizei; value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform1iv = procedure(location: GLint; count: GLsizei; value: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform2iv = procedure(location: GLint; count: GLsizei; value: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform3iv = procedure(location: GLint; count: GLsizei; value: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform4iv = procedure(location: GLint; count: GLsizei; value: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformMatrix2fv = procedure(location: GLint; count: GLsizei; transpose: GLboolean; value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformMatrix3fv = procedure(location: GLint; count: GLsizei; transpose: GLboolean; value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformMatrix4fv = procedure(location: GLint; count: GLsizei; transpose: GLboolean; value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglValidateProgram = procedure(programObj: GLhandle); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib1d = procedure(index: GLuint; x: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib1dv = procedure(index: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib1f = procedure(index: GLuint; x: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib1fv = procedure(index: GLuint; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib1s = procedure(index: GLuint; x: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib1sv = procedure(index: GLuint; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib2d = procedure(index: GLuint; x: GLdouble; y: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib2dv = procedure(index: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib2f = procedure(index: GLuint; x: GLfloat; y: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib2fv = procedure(index: GLuint; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib2s = procedure(index: GLuint; x: GLshort; y: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib2sv = procedure(index: GLuint; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib3d = procedure(index: GLuint; x: GLdouble; y: GLdouble; z: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib3dv = procedure(index: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib3f = procedure(index: GLuint; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib3fv = procedure(index: GLuint; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib3s = procedure(index: GLuint; x: GLshort; y: GLshort; z: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib3sv = procedure(index: GLuint; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4Nbv = procedure(index: GLuint; const v: PGLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4Niv = procedure(index: GLuint; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4Nsv = procedure(index: GLuint; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4Nub = procedure(index: GLuint; x: GLubyte; y: GLubyte; z: GLubyte; w: GLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4Nubv = procedure(index: GLuint; const v: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4Nuiv = procedure(index: GLuint; const v: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4Nusv = procedure(index: GLuint; const v: PGLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4bv = procedure(index: GLuint; const v: PGLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4d = procedure(index: GLuint; x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4dv = procedure(index: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4f = procedure(index: GLuint; x: GLfloat; y: GLfloat; z: GLfloat; w: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4fv = procedure(index: GLuint; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4iv = procedure(index: GLuint; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4s = procedure(index: GLuint; x: GLshort; y: GLshort; z: GLshort; w: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4sv = procedure(index: GLuint; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4ubv = procedure(index: GLuint; const v: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4uiv = procedure(index: GLuint; const v: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4usv = procedure(index: GLuint; const v: PGLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribPointer = procedure(index: GLuint; size: GLint; _type: GLenum; normalized: GLboolean; stride: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_VERSION_2_1
  TglUniformMatrix2x3fv = procedure(location: GLint; count: GLsizei; transpose: GLboolean; value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformMatrix3x2fv = procedure(location: GLint; count: GLsizei; transpose: GLboolean; value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformMatrix2x4fv = procedure(location: GLint; count: GLsizei; transpose: GLboolean; value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformMatrix4x2fv = procedure(location: GLint; count: GLsizei; transpose: GLboolean; value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformMatrix3x4fv = procedure(location: GLint; count: GLsizei; transpose: GLboolean; value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformMatrix4x3fv = procedure(location: GLint; count: GLsizei; transpose: GLboolean; value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_VERSION_3_0
  { OpenGL 3.0 also reuses entry points from these extensions: }
  { ARB_framebuffer_object }
  { ARB_map_buffer_range }
  { ARB_vertex_array_object }
  TglColorMaski = procedure(index_: GLuint; r: GLboolean; g: GLboolean; b: GLboolean; a: GLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetBooleani_v = procedure(target: GLenum; index_: GLuint; data: PGLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetIntegeri_v = procedure(target: GLenum; index_: GLuint; data: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEnablei = procedure(target: GLenum; index_: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDisablei = procedure(target: GLenum; index_: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsEnabledi = function(target: GLenum; index_: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBeginTransformFeedback = procedure(primitiveMode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEndTransformFeedback = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindBufferRange = procedure(target: GLenum; index_: GLuint; buffer: GLuint; offset: GLintptr; size: GLsizeiptr); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindBufferBase = procedure(target: GLenum; index_: GLuint; buffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTransformFeedbackVaryings = procedure(program_: GLuint; count: GLsizei; const varyings: PPGLchar; bufferMode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTransformFeedbackVarying = procedure(program_: GLuint; index_: GLuint; bufSize: GLsizei; length: PGLsizei; size: PGLsizei; type_: PGLsizei; name: PGLchar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglClampColor = procedure(targe: GLenum; clamp: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBeginConditionalRender = procedure(id: GLuint; mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEndConditionalRender = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribIPointer = procedure(index_: GLuint; size: GLint; type_: GLenum; stride: GLsizei; const pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVertexAttribIiv = procedure(index_: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVertexAttribIuiv = procedure(index_: GLuint; pname: GLenum; params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI1i = procedure(index_: GLuint; x: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI2i = procedure(index_: GLuint; x: GLint; y: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI3i = procedure(index_: GLuint; x: GLint; y: GLint; z: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI4i = procedure(index_: GLuint; x: GLint; y: GLint; z: GLint; w: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI1ui = procedure(index_: GLuint; x: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI2ui = procedure(index_: GLuint; x: GLuint; y: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI3ui = procedure(index_: GLuint; x: GLuint; y: GLuint; z: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI4ui = procedure(index_: GLuint; x: GLuint; y: GLuint; z: GLuint; w: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI1iv = procedure(index_: GLuint; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI2iv = procedure(index_: GLuint; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI3iv = procedure(index_: GLuint; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI4iv = procedure(index_: GLuint; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI1uiv = procedure(index_: GLuint; const v: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI2uiv = procedure(index_: GLuint; const v: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI3uiv = procedure(index_: GLuint; const v: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI4uiv = procedure(index_: GLuint; const v: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI4bv = procedure(index_: GLuint; const v: PGLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI4sv = procedure(index_: GLuint; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI4ubv = procedure(index_: GLuint; const v: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI4usv = procedure(index_: GLuint; const v: PGLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetUniformuiv = procedure(program_: GLuint; location: GLint; params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindFragDataLocation = procedure(program_: GLuint; color: GLuint; const name: PGLChar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetFragDataLocation = function(program_: GLuint; const name: PGLChar): GLint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform1ui = procedure(location: GLint; v0: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform2ui = procedure(location: GLint; v0: GLuint; v1: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform3ui = procedure(location: GLint; v0: GLuint; v1: GLuint; v2: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform4ui = procedure(location: GLint; v0: GLuint; v1: GLuint; v2: GLuint; v3: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform1uiv = procedure(location: GLint; count: GLsizei; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform2uiv = procedure(location: GLint; count: GLsizei; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform3uiv = procedure(location: GLint; count: GLsizei; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform4uiv = procedure(location: GLint; count: GLsizei; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexParameterIiv = procedure(target: GLenum; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexParameterIuiv = procedure(target: GLenum; pname: GLenum; const params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTexParameterIiv = procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTexParameterIuiv = procedure(target: GLenum; pname: GLenum; params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglClearBufferiv = procedure(buffer: GLenum; drawbuffer: GLint; const value: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglClearBufferuiv = procedure(buffer: GLenum; drawbuffer: GLint; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglClearBufferfv = procedure(buffer: GLenum; drawbuffer: GLint; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglClearBufferfi = procedure(buffer: GLenum; drawbuffer: GLint; depth: GLfloat; stencil: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetStringi = function(name: GLenum; index: GLuint): PGLubyte; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_VERSION_3_1
  { OpenGL 3.1 also reuses entry points from these extensions: }
  { ARB_copy_buffer }
  { ARB_uniform_buffer_object }
  TglDrawArraysInstanced = procedure(mode: GLenum; first: GLint; count: GLsizei; primcount: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDrawElementsInstanced = procedure(mode: GLenum; count: GLsizei; type_: GLenum; const indices: PGLvoid; primcount: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexBuffer = procedure(target: GLenum; internalformat: GLenum; buffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPrimitiveRestartIndex = procedure(index_: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_VERSION_3_2
  { OpenGL 3.2 also reuses entry points from these extensions: }
  { ARB_draw_elements_base_vertex }
  { ARB_provoking_vertex }
  { ARB_sync }
  { ARB_texture_multisample }
  TglGetInteger64i_v = procedure(target: GLenum; index_: GLuint; data: PGLint64); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetBufferParameteri64v = procedure(target: GLenum; pname: GLenum; params: PGLint64); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFramebufferTexture = procedure(target: GLenum; attachment: GLenum; texture: GLuint; level: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
//  TglFramebufferTextureFace = procedure(target: GLenum; attachment: GLenum; texture: GLuint; level: GLint; face: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  
  // GL_VERSION_3_3
  { OpenGL 3.3 also reuses entry points from these extensions: }
  { ARB_blend_func_extended }
  { ARB_sampler_objects }
  { ARB_explicit_attrib_location, but it has none }
  { ARB_occlusion_query2 (no entry points) }
  { ARB_shader_bit_encoding (no entry points) }
  { ARB_texture_rgb10_a2ui (no entry points) }
  { ARB_texture_swizzle (no entry points) }
  { ARB_timer_query }
  { ARB_vertex_type_2_10_10_10_rev }
  TglVertexAttribDivisor = procedure(index: GLuint; divisor: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  
  // GL_VERSION_4_0
  { OpenGL 4.0 also reuses entry points from these extensions: }
  { ARB_texture_query_lod (no entry points) }
  { ARB_draw_indirect }
  { ARB_gpu_shader5 (no entry points) }
  { ARB_gpu_shader_fp64 }
  { ARB_shader_subroutine }
  { ARB_tessellation_shader }
  { ARB_texture_buffer_object_rgb32 (no entry points) }
  { ARB_texture_cube_map_array (no entry points) }
  { ARB_texture_gather (no entry points) }
  { ARB_transform_feedback2 }
  { ARB_transform_feedback3 }
  TglMinSampleShading = procedure(value: GLclampf); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBlendEquationi = procedure(buf: GLuint; mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBlendEquationSeparatei = procedure(buf: GLuint; modeRGB: GLenum; modeAlpha: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBlendFunci = procedure(buf: GLuint; src: GLenum; dst: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBlendFuncSeparatei = procedure(buf: GLuint; srcRGB: GLenum; dstRGB: GLenum; srcAlpha: GLenum; dstAlpha: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_VERSION_4_1
  { OpenGL 4.1 also reuses entry points from these extensions: }
  { ARB_ES2_compatibility }
  { ARB_get_program_binary }
  { ARB_separate_shader_objects }
  { ARB_shader_precision (no entry points) }
  { ARB_vertex_attrib_64bit }
  { ARB_viewport_array }
  
  // GL_3DFX_tbuffer
  TglTbufferMask3DFX = procedure(mask: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_APPLE_element_array
  TglElementPointerAPPLE = procedure(_type: GLenum; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDrawElementArrayAPPLE = procedure(mode: GLenum; first: GLint; count: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDrawRangeElementArrayAPPLE = procedure(mode: GLenum; start: GLuint; _end: GLuint; first: GLint; count: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiDrawElementArrayAPPLE = procedure(mode: GLenum; const first: PGLint; const count: PGLsizei; primcount: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiDrawRangeElementArrayAPPLE = procedure(mode: GLenum; start: GLuint; _end: GLuint; const first: PGLint; const count: PGLsizei; primcount: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_APPLE_fence
  TglGenFencesAPPLE = procedure(n: GLsizei; fences: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteFencesAPPLE = procedure(n: GLsizei; const fences: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSetFenceAPPLE = procedure(fence: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsFenceAPPLE = function(fence: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTestFenceAPPLE = function(fence: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFinishFenceAPPLE = procedure(fence: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTestObjectAPPLE = function(_object: GLenum; name: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFinishObjectAPPLE = procedure(_object: GLenum; name: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_APPLE_vertex_array_object
  TglBindVertexArrayAPPLE = procedure(_array: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteVertexArraysAPPLE = procedure(n: GLsizei; const arrays: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenVertexArraysAPPLE = procedure(n: GLsizei; const arrays: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsVertexArrayAPPLE = function(_array: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_APPLE_vertex_array_range
  TglVertexArrayRangeAPPLE = procedure(length: GLsizei; _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFlushVertexArrayRangeAPPLE = procedure(length: GLsizei; _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexArrayParameteriAPPLE = procedure(pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_APPLE_texture_range
  TglTextureRangeAPPLE = procedure(target: GLenum; length: GLsizei; const Pointer_: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTexParameterPointervAPPLE = procedure(target: GLenum; pname: GLenum; params: PPGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_APPLE_vertex_program_evaluators
  TglEnableVertexAttribAPPLE = procedure(index_: GLuint; pname: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDisableVertexAttribAPPLE = procedure(index_: GLuint; pname: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsVertexAttribEnabledAPPLE = function(index_: GLuint; pname: GLenum): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMapVertexAttrib1dAPPLE = procedure(index_: GLuint; size: GLuint; u1: GLdouble; u2: GLdouble; stride: GLint; order: GLint; const points: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMapVertexAttrib1fAPPLE = procedure(index_: GLuint; size: GLuint; u1: GLfloat; u2: GLfloat; stride: GLint; order: GLint; const points: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMapVertexAttrib2dAPPLE = procedure(index_: GLuint; size: GLuint; u1: GLdouble; u2: GLdouble; ustride: GLint; uorder: GLint; v1: GLdouble; v2: GLdouble; vstride: GLint; vorder: GLint; const points: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMapVertexAttrib2fAPPLE = procedure(index_: GLuint; size: GLuint; u1: GLfloat; u2: GLfloat; ustride: GLint; order: GLint; v1: GLfloat; v2: GLfloat; vstride: GLint; vorder: GLint; const points: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_APPLE_object_purgeable
  TglObjectPurgeableAPPLE = function(objectType: GLenum; name: GLuint; option: GLenum): GLenum; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglObjectUnpurgeableAPPLE = function(objectType: GLenum; name: GLuint; option: GLenum): GLenum; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetObjectParameterivAPPLE = procedure(objectType: GLenum; name: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_matrix_palette
  TglCurrentPaletteMatrixARB = procedure(index: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixIndexubvARB = procedure(size: GLint; const indices: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixIndexusvARB = procedure(size: GLint; const indices: PGLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixIndexuivARB = procedure(size: GLint; const indices: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixIndexPointerARB = procedure(size: GLint; _type: GLenum; stride: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_multisample
  TglSampleCoverageARB = procedure(value: GLclampf; invert: GLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_multitexture
  TglActiveTextureARB = procedure(texture: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglClientActiveTextureARB = procedure(texture: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord1dARB = procedure(target: GLenum; s: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord1dvARB = procedure(target: GLenum; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord1fARB = procedure(target: GLenum; s: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord1fvARB = procedure(target: GLenum; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord1iARB = procedure(target: GLenum; s: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord1ivARB = procedure(target: GLenum; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord1sARB = procedure(target: GLenum; s: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord1svARB = procedure(target: GLenum; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord2dARB = procedure(target: GLenum; s: GLdouble; t: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord2dvARB = procedure(target: GLenum; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord2fARB = procedure(target: GLenum; s: GLfloat; t: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord2fvARB = procedure(target: GLenum; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord2iARB = procedure(target: GLenum; s: GLint; t: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord2ivARB = procedure(target: GLenum; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord2sARB = procedure(target: GLenum; s: GLshort; t: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord2svARB = procedure(target: GLenum; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord3dARB = procedure(target: GLenum; s: GLdouble; t: GLdouble; r: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord3dvARB = procedure(target: GLenum; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord3fARB = procedure(target: GLenum; s: GLfloat; t: GLfloat; r: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord3fvARB = procedure(target: GLenum; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord3iARB = procedure(target: GLenum; s: GLint; t: GLint; r: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord3ivARB = procedure(target: GLenum; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord3sARB = procedure(target: GLenum; s: GLshort; t: GLshort; r: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord3svARB = procedure(target: GLenum; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord4dARB = procedure(target: GLenum; s: GLdouble; t: GLdouble; r: GLdouble; q: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord4dvARB = procedure(target: GLenum; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord4fARB = procedure(target: GLenum; s: GLfloat; t: GLfloat; r: GLfloat; q: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord4fvARB = procedure(target: GLenum; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord4iARB = procedure(target: GLenum; s: GLint; t: GLint; r: GLint; q: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord4ivARB = procedure(target: GLenum; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord4sARB = procedure(target: GLenum; s: GLshort; t: GLshort; r: GLshort; q: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord4svARB = procedure(target: GLenum; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_point_parameters
  TglPointParameterfARB = procedure(pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPointParameterfvARB = procedure(pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_texture_compression
  TglCompressedTexImage3DARB = procedure(target: GLenum; level: GLint; internalformat: GLenum; width: GLsizei; height: GLsizei; depth: GLsizei; border: GLint; imageSize: GLsizei; const data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedTexImage2DARB = procedure(target: GLenum; level: GLint; internalformat: GLenum; width: GLsizei; height: GLsizei; border: GLint; imageSize: GLsizei; const data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedTexImage1DARB = procedure(target: GLenum; level: GLint; internalformat: GLenum; width: GLsizei; border: GLint; imageSize: GLsizei; const data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedTexSubImage3DARB = procedure(target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; zoffset: GLint; width: GLsizei; height: GLsizei; depth: GLsizei; format: GLenum; imageSize: GLsizei; const data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedTexSubImage2DARB = procedure(target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; width: GLsizei; height: GLsizei; format: GLenum; imageSize: GLsizei; const data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedTexSubImage1DARB = procedure(target: GLenum; level: GLint; xoffset: GLint; width: GLsizei; format: GLenum; imageSize: GLsizei; const data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetCompressedTexImageARB = procedure(target: GLenum; level: GLint; img: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_transpose_matrix
  TglLoadTransposeMatrixfARB = procedure(const m: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLoadTransposeMatrixdARB = procedure(const m: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultTransposeMatrixfARB = procedure(const m: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultTransposeMatrixdARB = procedure(const m: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_vertex_blend
  TglWeightbvARB = procedure(size: GLint; const weights: PGLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWeightsvARB = procedure(size: GLint; const weights: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWeightivARB = procedure(size: GLint; const weights: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWeightfvARB = procedure(size: GLint; const weights: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWeightdvARB = procedure(size: GLint; const weights: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWeightubvARB = procedure(size: GLint; const weights: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWeightusvARB = procedure(size: GLint; const weights: PGLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWeightuivARB = procedure(size: GLint; const weights: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWeightPointerARB = procedure(size: GLint; _type: GLenum; stride: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexBlendARB = procedure(count: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_vertex_buffer_object
  TglBindBufferARB = procedure(target: GLenum; buffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteBuffersARB = procedure(n: GLsizei; const buffers: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenBuffersARB = procedure(n: GLsizei; buffers: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsBufferARB = function(buffer: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBufferDataARB = procedure(target: GLenum; size: GLsizeiptrARB; const data: PGLvoid; usage: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBufferSubDataARB = procedure(target: GLenum; offset: GLintptrARB; size: GLsizeiptrARB; const data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetBufferSubDataARB = procedure(target: GLenum; offset: GLintptrARB; size: GLsizeiptrARB; data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMapBufferARB = function(target: GLenum; access: GLenum): PGLvoid; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUnmapBufferARB = function(target: GLenum): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetBufferParameterivARB = procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetBufferPointervARB = procedure(target: GLenum; pname: GLenum; params: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_vertex_program
  TglVertexAttrib1dARB = procedure(index: GLuint; x: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib1dvARB = procedure(index: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib1fARB = procedure(index: GLuint; x: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib1fvARB = procedure(index: GLuint; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib1sARB = procedure(index: GLuint; x: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib1svARB = procedure(index: GLuint; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib2dARB = procedure(index: GLuint; x: GLdouble; y: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib2dvARB = procedure(index: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib2fARB = procedure(index: GLuint; x: GLfloat; y: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib2fvARB = procedure(index: GLuint; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib2sARB = procedure(index: GLuint; x: GLshort; y: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib2svARB = procedure(index: GLuint; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib3dARB = procedure(index: GLuint; x: GLdouble; y: GLdouble; z: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib3dvARB = procedure(index: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib3fARB = procedure(index: GLuint; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib3fvARB = procedure(index: GLuint; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib3sARB = procedure(index: GLuint; x: GLshort; y: GLshort; z: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib3svARB = procedure(index: GLuint; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4NbvARB = procedure(index: GLuint; const v: PGLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4NivARB = procedure(index: GLuint; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4NsvARB = procedure(index: GLuint; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4NubARB = procedure(index: GLuint; x: GLubyte; y: GLubyte; z: GLubyte; w: GLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4NubvARB = procedure(index: GLuint; const v: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4NuivARB = procedure(index: GLuint; const v: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4NusvARB = procedure(index: GLuint; const v: PGLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4bvARB = procedure(index: GLuint; const v: PGLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4dARB = procedure(index: GLuint; x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4dvARB = procedure(index: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4fARB = procedure(index: GLuint; x: GLfloat; y: GLfloat; z: GLfloat; w: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4fvARB = procedure(index: GLuint; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4ivARB = procedure(index: GLuint; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4sARB = procedure(index: GLuint; x: GLshort; y: GLshort; z: GLshort; w: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4svARB = procedure(index: GLuint; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4ubvARB = procedure(index: GLuint; const v: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4uivARB = procedure(index: GLuint; const v: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4usvARB = procedure(index: GLuint; const v: PGLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribPointerARB = procedure(index: GLuint; size: GLint; _type: GLenum; normalized: GLboolean; stride: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEnableVertexAttribArrayARB = procedure(index: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDisableVertexAttribArrayARB = procedure(index: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramStringARB = procedure(target: GLenum; format: GLenum; len: GLsizei; const _string: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindProgramARB = procedure(target: GLenum; _program: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteProgramsARB = procedure(n: GLsizei; const programs: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenProgramsARB = procedure(n: GLsizei; programs: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramEnvParameter4dARB = procedure(target: GLenum; index: GLuint; x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramEnvParameter4dvARB = procedure(target: GLenum; index: GLuint; const params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramEnvParameter4fARB = procedure(target: GLenum; index: GLuint; x: GLfloat; y: GLfloat; z: GLfloat; w: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramEnvParameter4fvARB = procedure(target: GLenum; index: GLuint; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramLocalParameter4dARB = procedure(target: GLenum; index: GLuint; x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramLocalParameter4dvARB = procedure(target: GLenum; index: GLuint; const params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramLocalParameter4fARB = procedure(target: GLenum; index: GLuint; x: GLfloat; y: GLfloat; z: GLfloat; w: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramLocalParameter4fvARB = procedure(target: GLenum; index: GLuint; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramEnvParameterdvARB = procedure(target: GLenum; index: GLuint; params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramEnvParameterfvARB = procedure(target: GLenum; index: GLuint; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramLocalParameterdvARB = procedure(target: GLenum; index: GLuint; params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramLocalParameterfvARB = procedure(target: GLenum; index: GLuint; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramivARB = procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramStringARB = procedure(target: GLenum; pname: GLenum; _string: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVertexAttribdvARB = procedure(index: GLuint; pname: GLenum; params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVertexAttribfvARB = procedure(index: GLuint; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVertexAttribivARB = procedure(index: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVertexAttribPointervARB = procedure(index: GLuint; pname: GLenum; _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsProgramARB = function(_program: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_window_pos
  TglWindowPos2dARB = procedure(x: GLdouble; y: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2dvARB = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2fARB = procedure(x: GLfloat; y: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2fvARB = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2iARB = procedure(x: GLint; y: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2ivARB = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2sARB = procedure(x: GLshort; y: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2svARB = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3dARB = procedure(x: GLdouble; y: GLdouble; z: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3dvARB = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3fARB = procedure(x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3fvARB = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3iARB = procedure(x: GLint; y: GLint; z: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3ivARB = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3sARB = procedure(x: GLshort; y: GLshort; z: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3svARB = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_draw_buffers
  TglDrawBuffersARB = procedure(n: GLsizei; bufs: PGLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_color_buffer_float
  TglClampColorARB = procedure(target: GLenum; clamp: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_vertex_shader
  TglGetActiveAttribARB = procedure(programobj: GLhandleARB; index: GLuint; maxLength: GLsizei; var length: GLsizei; var size: GLint; var _type: GLenum; name: PGLcharARB); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetAttribLocationARB = function(programObj: GLhandleARB; const char: PGLcharARB): glint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindAttribLocationARB = procedure(programObj: GLhandleARB; index: GLuint; const name: PGLcharARB); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_shader_objects
  TglDeleteObjectARB = procedure(Obj: GLHandleARB); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetHandleARB = function(pname: GlEnum): GLHandleARB; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDetachObjectARB = procedure(container, attached: GLHandleARB); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCreateShaderObjectARB = function(shaderType: glenum): GLHandleARB; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglShaderSourceARB = procedure(shaderObj: GLHandleARB; count: glsizei; _string: PPGLCharARB; lengths: pglint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompileShaderARB = procedure(shaderObj: GLHandleARB); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCreateProgramObjectARB = function: GLHandleARB; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglAttachObjectARB = procedure(programObj, shaderObj: GLhandleARB); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLinkProgramARB = procedure(programObj: GLHandleARB); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUseProgramObjectARB = procedure(programObj: GLHandleARB); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglValidateProgramARB = procedure(programObj: GLhandleARB); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform1fARB = procedure(location: glint; v0: glfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform2fARB = procedure(location: glint; v0, v1: glfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform3fARB = procedure(location: glint; v0, v1, v2: glfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform4fARB = procedure(location: glint; v0, v1, v2, v3: glfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform1iARB = procedure(location: glint; v0: glint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform2iARB = procedure(location: glint; v0, v1: glint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform3iARB = procedure(location: glint; v0, v1, v2: glint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform4iARB = procedure(location: glint; v0, v1, v2, v3: glint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform1fvARB = procedure(location: glint; count: GLsizei; value: pglfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform2fvARB = procedure(location: glint; count: GLsizei; value: pglfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform3fvARB = procedure(location: glint; count: GLsizei; value: pglfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform4fvARB = procedure(location: glint; count: GLsizei; value: pglfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform1ivARB = procedure(location: glint; count: GLsizei; value: pglint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform2ivARB = procedure(location: glint; count: GLsizei; value: pglint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform3ivARB = procedure(location: glint; count: GLsizei; value: pglint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform4ivARB = procedure(location: glint; count: GLsizei; value: pglint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformMatrix2fvARB = procedure(location: glint; count: glsizei; transpose: glboolean; value: pglfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformMatrix3fvARB = procedure(location: glint; count: glsizei; transpose: glboolean; value: pglfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformMatrix4fvARB = procedure(location: glint; count: glsizei; transpose: glboolean; value: pglfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetObjectParameterfvARB = procedure(Obj: GLHandleARB; pname: GLEnum; params: PGLFloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetObjectParameterivARB = procedure(Obj: GLHandleARB; pname: GLEnum; params: PGLInt); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetInfoLogARB = procedure(shaderObj: GLHandleARB; maxLength: glsizei; var length: glint; infoLog: PGLcharARB); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetAttachedObjectsARB = procedure(programobj: GLhandleARB; maxCount: GLsizei; var count: GLsizei; objects: PGLhandleARB); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetUniformLocationARB = function(programObj: GLhandleARB; const char: PGLcharARB): glint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetActiveUniformARB = procedure(programobj: GLhandleARB; index: GLuint; maxLength: GLsizei; var length: GLsizei; var size: GLint; var _type: GLenum; name: PGLcharARB); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetUniformfvARB = procedure(programObj: GLhandleARB; location: GLint; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetUniformivARB = procedure(programObj: GLhandleARB; location: GLint; params: PGLInt); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetShaderSourceARB = procedure(shader: GLhandleARB; maxLength: GLsizei; var length: GLsizei; source: PGLcharARB); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_Occlusion_Query
  TglGenQueriesARB = procedure(n: GLsizei; ids: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteQueriesARB = procedure(n: GLsizei; const ids: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsQueryARB = function(id: GLuint): boolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBeginQueryARB = procedure(target: GLenum; id: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEndQueryARB = procedure(target: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetQueryivARB = procedure(target, pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetQueryObjectivARB = procedure(id: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetQueryObjectuivARB = procedure(id: GLuint; pname: GLenum; params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_draw_instanced
  TglDrawArraysInstancedARB = procedure(mode: GLenum; first: GLint; count: GLsizei; primcount: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDrawElementsInstancedARB = procedure(mode: GLenum; count: GLsizei; type_: GLenum; const indices: PGLvoid; primcount: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_framebuffer_object
  TglIsRenderbuffer = function(renderbuffer: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindRenderbuffer = procedure(target: GLenum; renderbuffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteRenderbuffers = procedure(n: GLsizei; const renderbuffers: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenRenderbuffers = procedure(n: GLsizei; renderbuffers: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRenderbufferStorage = procedure(target: GLenum; internalformat: GLenum; width: GLsizei; height: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetRenderbufferParameteriv = procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsFramebuffer = function(framebuffer: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindFramebuffer = procedure(target: GLenum; framebuffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteFramebuffers = procedure(n: GLsizei; const framebuffers: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenFramebuffers = procedure(n: GLsizei; framebuffers: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCheckFramebufferStatus = function(target: GLenum): GLenum; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFramebufferTexture1D = procedure(target: GLenum; attachment: GLenum; textarget: GLenum; texture: GLuint; level: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFramebufferTexture2D = procedure(target: GLenum; attachment: GLenum; textarget: GLenum; texture: GLuint; level: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFramebufferTexture3D = procedure(target: GLenum; attachment: GLenum; textarget: GLenum; texture: GLuint; level: GLint; zoffset: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFramebufferRenderbuffer = procedure(target: GLenum; attachment: GLenum; renderbuffertarget: GLenum; renderbuffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetFramebufferAttachmentParameteriv = procedure(target: GLenum; attachment: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenerateMipmap = procedure(target: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBlitFramebuffer = procedure(srcX0: GLint; srcY0: GLint; srcX1: GLint; srcY1: GLint; dstX0: GLint; dstY0: GLint; dstX1: GLint; dstY1: GLint; mask: GLbitfield; filter: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRenderbufferStorageMultisample = procedure(target: GLenum; samples: GLsizei; internalformat: GLenum; width: GLsizei; height: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFramebufferTextureLayer = procedure(target: GLenum; attachment: GLenum; texture: GLuint; level: GLint; layer: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_geometry_shader4
  TglProgramParameteriARB = procedure(program_: GLuint; pname: GLenum; value: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFramebufferTextureARB = procedure(target: GLenum; attachment: GLenum; texture: GLuint; level: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFramebufferTextureLayerARB = procedure(target: GLenum; attachment: GLenum; texture: GLuint; level: GLint; layer: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFramebufferTextureFaceARB = procedure(target: GLenum; attachment: GLenum; texture: GLuint; level: GLint; face: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_instanced_arrays
  TglVertexAttribDivisorARB = procedure(index_: GLuint; divisor: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_map_buffer_range
  TglMapBufferRange = function(target: GLenum; offset: GLintptr; length: GLsizeiptr; access: GLbitfield): PGLvoid; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFlushMappedBufferRange = procedure(target: GLenum; offset: GLintptr; length: GLsizeiptr); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_texture_buffer_object
  TglTexBufferARB = procedure(target: GLenum; internalformat: GLenum; buffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_vertex_array_object
  TglBindVertexArray = procedure(array_: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteVertexArrays = procedure(n: GLsizei; const arrays: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenVertexArrays = procedure(n: GLsizei; arrays: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsVertexArray = function(array_: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_uniform_buffer_object
  TglGetUniformIndices = procedure(program_: GLuint; uniformCount: GLsizei; const uniformNames: PPGLchar; uniformIndices: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetActiveUniformsiv = procedure(program_: GLuint; uniformCount: GLsizei; const uniformIndices: PGLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetActiveUniformName = procedure(program_: GLuint; uniformIndex: GLuint; bufSize: GLsizei; length: PGLsizei; uniformName: PGLchar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetUniformBlockIndex = function(program_: GLuint; const uniformBlockName: PGLchar): GLuint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetActiveUniformBlockiv = procedure(program_: GLuint; uniformBlockIndex: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetActiveUniformBlockName = procedure(program_: GLuint; uniformBlockIndex: GLuint; bufSize: GLsizei; length: PGLsizei; uniformBlockName: PGLchar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformBlockBinding = procedure(program_: GLuint; uniformBlockIndex: GLuint; uniformBlockBinding: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_copy_buffer
  TglCopyBufferSubData = procedure(readTarget: GLenum; writeTarget: GLenum; readOffset: GLintptr; writeOffset: GLintptr; size: GLsizeiptr); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_draw_elements_base_vertex
  TglDrawElementsBaseVertex = procedure(mode: GLenum; count: GLsizei; type_: GLenum; const indices: PGLvoid; basevertex: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDrawRangeElementsBaseVertex = procedure(mode: GLenum; start: GLuint; end_: GLuint; count: GLsizei; type_: GLenum; const indices: PGLvoid; basevertex: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDrawElementsInstancedBaseVertex = procedure(mode: GLenum; count: GLsizei; type_: GLenum; const indices: PGLvoid; primcount: GLsizei; basevertex: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiDrawElementsBaseVertex = procedure(mode: GLenum; const count: PGLsizei; type_: GLenum; const indices: PPGLvoid; primcount: GLsizei; const basevertex: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_provoking_vertex
  TglProvokingVertex = procedure(mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_sync
  TglFenceSync = function(condition: GLenum; flags: GLbitfield): GLsync; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsSync = function(sync: GLsync): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteSync = procedure(sync: GLsync); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglClientWaitSync = function(sync: GLsync; flags: GLbitfield; timeout: GLuint64): GLenum; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWaitSync = procedure(sync: GLsync; flags: GLbitfield; timeout: GLuint64); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetInteger64v = procedure(pname: GLenum; params: PGLint64); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetSynciv = procedure(sync: GLsync; pname: GLenum; butSize: GLsizei; length: PGLsizei; values: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_texture_multisample
  TglTexImage2DMultisample = procedure(target: GLenum; samples: GLsizei; internalformat: GLint; width: GLsizei; height: GLsizei; fixedsamplelocations: GLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexImage3DMultisample = procedure(target: GLenum; samples: GLsizei; internalformat: GLint; width: GLsizei; height: GLsizei; depth: GLsizei; fixedsamplelocations: GLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMultisamplefv = procedure(pname: GLenum; index_: GLuint; val: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSampleMaski = procedure(index_: GLuint; mask: GLbitfield); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_draw_buffers_blend
  TglBlendEquationiARB = procedure(buf: GLuint; mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBlendEquationSeparateiARB = procedure(buf: GLuint; modeRGB: GLenum; modeAlpha: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBlendFunciARB = procedure(buf: GLuint; src: GLenum; dst: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBlendFuncSeparateiARB = procedure(buf: GLuint; srcRGB: GLenum; dstRGB: GLenum; srcAlpha: GLenum; dstAlpha: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_sample_shading
  TglMinSampleShadingARB = procedure(value: GLclampf); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_shading_language_include
  TglNamedStringARB = procedure(type_: GLenum; namelen: GLint; const name: PGLchar; stringlen: GLint; const string_: PGLchar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteNamedStringARB = procedure(namelen: GLint; const name: PGLchar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompileShaderIncludeARB = procedure (shader: GLuint; count: GLsizei; const path: PPGLchar; const length: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsNamedStringARB = function(namelen: GLint; const name: PGLchar): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetNamedStringARB = procedure(namelen: GLint; const name: PGLchar; bufSize: GLsizei; stringlen: GLint; string_: PGLchar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetNamedStringivARB = procedure(namelen: GLint; const name: PGLchar; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_blend_func_extended
  TglBindFragDataLocationIndexed = procedure(program_: GLuint; colorNumber: GLuint; index: GLuint; const name: PGLchar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetFragDataIndex = function(program_: GLuint; const name: PGLchar): GLint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_sampler_objects
  TglGenSamplers = procedure(count: GLsizei; samplers: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteSamplers = procedure(count: GLsizei; const samplers: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsSampler = function(sampler: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindSampler = procedure(unit_: GLuint; sampler: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSamplerParameteri = procedure(sampler: GLuint; pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSamplerParameteriv = procedure(sampler: GLuint; pname: GLenum; const param: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSamplerParameterf = procedure(sampler: GLuint; pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSamplerParameterfv = procedure(sampler: GLuint; pname: GLenum; const param: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSamplerParameterIiv = procedure(sampler: GLuint; pname: GLenum; const param: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSamplerParameterIuiv = procedure(sampler: GLuint; pname: GLenum; const param: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetSamplerParameteriv = procedure(sampler: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetSamplerParameterIiv = procedure(sampler: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetSamplerParameterfv = procedure(sampler: GLuint; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetSamplerParameterIuiv = procedure(sampler: GLuint; pname: GLenum; params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_timer_query
  TglQueryCounter = procedure(id: GLuint; target: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetQueryObjecti64v = procedure(id: GLuint; pname: GLenum; params: PGLint64); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetQueryObjectui64v = procedure(id: GLuint; pname: GLenum; params: PGLuint64); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_vertex_type_2_10_10_10_rev
  TglVertexP2ui = procedure(type_: GLenum; value: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexP2uiv = procedure(type_: GLenum; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexP3ui = procedure(type_: GLenum; value: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexP3uiv = procedure(type_: GLenum; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexP4ui = procedure(type_: GLenum; value: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexP4uiv = procedure(type_: GLenum; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoordP1ui = procedure(type_: GLenum; coords: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoordP1uiv = procedure(type_: GLenum; const coords: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoordP2ui = procedure(type_: GLenum; coords: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoordP2uiv = procedure(type_: GLenum; const coords: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoordP3ui = procedure(type_: GLenum; coords: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoordP3uiv = procedure(type_: GLenum; const coords: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoordP4ui = procedure(type_: GLenum; coords: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoordP4uiv = procedure(type_: GLenum; const coords: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoordP1ui = procedure(texture: GLenum; type_: GLenum; coords: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoordP1uiv = procedure(texture: GLenum; type_: GLenum; const coords: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoordP2ui = procedure(texture: GLenum; type_: GLenum; coords: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoordP2uiv = procedure(texture: GLenum; type_: GLenum; const coords: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoordP3ui = procedure(texture: GLenum; type_: GLenum; coords: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoordP3uiv = procedure(texture: GLenum; type_: GLenum; const coords: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoordP4ui = procedure(texture: GLenum; type_: GLenum; coords: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoordP4uiv = procedure(texture: GLenum; type_: GLenum; const coords: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormalP3ui = procedure(type_: GLenum; coords: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormalP3uiv = procedure(type_: GLenum; const coords: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColorP3ui = procedure(type_: GLenum; color: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColorP3uiv = procedure(type_: GLenum; const color: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColorP4ui = procedure(type_: GLenum; color: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColorP4uiv = procedure(type_: GLenum; const color: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColorP3ui = procedure(type_: GLenum; color: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColorP3uiv = procedure(type_: GLenum; const color: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribP1ui = procedure(index: GLuint; type_: GLenum; normalized: GLboolean; value: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribP1uiv = procedure(index: GLuint; type_: GLenum; normalized: GLboolean; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribP2ui = procedure(index: GLuint; type_: GLenum; normalized: GLboolean; value: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribP2uiv = procedure(index: GLuint; type_: GLenum; normalized: GLboolean; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribP3ui = procedure(index: GLuint; type_: GLenum; normalized: GLboolean; value: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribP3uiv = procedure(index: GLuint; type_: GLenum; normalized: GLboolean; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribP4ui = procedure(index: GLuint; type_: GLenum; normalized: GLboolean; value: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribP4uiv = procedure(index: GLuint; type_: GLenum; normalized: GLboolean; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_draw_indirect
  TglDrawArraysIndirect = procedure(mode: GLenum; const indirect: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDrawElementsIndirect = procedure(mode: GLenum; type_: GLenum; const indirect: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_gpu_shader_fp64
  TglUniform1d = procedure(location: GLint; x: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform2d = procedure(location: GLint; x: GLdouble; y: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform3d = procedure(location: GLint; x: GLdouble; y: GLdouble; z: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform4d = procedure(location: GLint; x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform1dv = procedure(location: GLint; count: GLsizei; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform2dv = procedure(location: GLint; count: GLsizei; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform3dv = procedure(location: GLint; count: GLsizei; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform4dv = procedure(location: GLint; count: GLsizei; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformMatrix2dv = procedure(location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformMatrix3dv = procedure(location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformMatrix4dv = procedure(location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformMatrix2x3dv = procedure(location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformMatrix2x4dv = procedure(location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformMatrix3x2dv = procedure(location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformMatrix3x4dv = procedure(location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformMatrix4x2dv = procedure(location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformMatrix4x3dv = procedure(location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetUniformdv = procedure(program_: GLuint; location: GLint; params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_shader_subroutine
  TglGetSubroutineUniformLocation = function(program_: GLuint; shadertype: GLenum; const name: PGLchar): GLint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetSubroutineIndex = function(program_: GLuint; shadertype: GLenum; const name: PGLchar): GLuint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetActiveSubroutineUniformiv = procedure(program_: GLuint; shadertype: GLenum; index: GLuint; pname: GLenum; values: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetActiveSubroutineUniformName = procedure(program_: GLuint; shadertype: GLenum; index: GLuint; bufsize: GLsizei; length: PGLsizei; name: PGLchar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetActiveSubroutineName = procedure(program_: GLuint; shadertype: GLenum; index: GLuint; bufsize: GLsizei; length: PGLsizei; name: PGLchar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformSubroutinesuiv = procedure(shadertype: GLenum; count: GLsizei; const indices: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetUniformSubroutineuiv = procedure(shadertype: GLenum; location: GLint; params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramStageiv = procedure(program_: GLuint; shadertype: GLenum; pname: GLenum; values: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_tessellation_shader
  TglPatchParameteri = procedure(pname: GLenum; value: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPatchParameterfv = procedure(pname: GLenum; const values: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_transform_feedback2
  TglBindTransformFeedback = procedure(target: GLenum; id: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteTransformFeedbacks = procedure(n: GLsizei; const ids: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenTransformFeedbacks = procedure(n: GLsizei; ids: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsTransformFeedback = function(id: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPauseTransformFeedback = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglResumeTransformFeedback = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDrawTransformFeedback = procedure(mode: GLenum; id: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_transform_feedback3
  TglDrawTransformFeedbackStream = procedure(mode: GLenum; id: GLuint; stream: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBeginQueryIndexed = procedure(target: GLenum; index: GLuint; id: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEndQueryIndexed = procedure(target: GLenum; index: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetQueryIndexediv = procedure(target: GLenum; index: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_ES2_compatibility
  TglReleaseShaderCompiler = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglShaderBinary = procedure(count: GLsizei; const shaders: PGLuint; binaryformat: GLenum; const binary: PGLvoid; length: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetShaderPrecisionFormat = procedure(shadertype: GLenum; precisiontype: GLenum; range: PGLint; precision: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDepthRangef = procedure(n: GLclampf; f: GLclampf); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglClearDepthf = procedure(d: GLclampf); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_get_program_binary
  TglGetProgramBinary = procedure(program_: GLuint; bufSize: GLsizei; length: PGLsizei; binaryFormat: PGLenum; binary: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramBinary = procedure(program_: GLuint; binaryFormat: GLenum; const binary: PGLvoid; length: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramParameteri = procedure(program_: GLuint; pname: GLenum; value: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  
  // GL_ARB_separate_shader_objects
  TglUseProgramStages = procedure(pipeline: GLuint; stages: GLbitfield; program_: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglActiveShaderProgram = procedure(pipeline: GLuint; program_: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCreateShaderProgramv = function(type_: GLenum; count: GLsizei; const strings: PPGLchar): GLuint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindProgramPipeline = procedure(pipeline: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteProgramPipelines = procedure(n: GLsizei; const pipelines: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenProgramPipelines = procedure(n: GLsizei; pipelines: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsProgramPipeline = function(pipeline: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramPipelineiv = procedure(pipeline: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform1i = procedure(program_: GLuint; location: GLint; v0: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform1iv = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform1f = procedure(program_: GLuint; location: GLint; v0: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform1fv = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform1d = procedure(program_: GLuint; location: GLint; v0: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform1dv = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform1ui = procedure(program_: GLuint; location: GLint; v0: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform1uiv = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform2i = procedure(program_: GLuint; location: GLint; v0: GLint; v1: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform2iv = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform2f = procedure(program_: GLuint; location: GLint; v0: GLfloat; v1: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform2fv = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform2d = procedure(program_: GLuint; location: GLint; v0: GLdouble; v1: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform2dv = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform2ui = procedure(program_: GLuint; location: GLint; v0: GLuint; v1: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform2uiv = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform3i = procedure(program_: GLuint; location: GLint; v0: GLint; v1: GLint; v2: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform3iv = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform3f = procedure(program_: GLuint; location: GLint; v0: GLfloat; v1: GLfloat; v2: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform3fv = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform3d = procedure(program_: GLuint; location: GLint; v0: GLdouble; v1: GLdouble; v2: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform3dv = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform3ui = procedure(program_: GLuint; location: GLint; v0: GLuint; v1: GLuint; v2: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform3uiv = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform4i = procedure(program_: GLuint; location: GLint; v0: GLint; v1: GLint; v2: GLint; v3: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform4iv = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform4f = procedure(program_: GLuint; location: GLint; v0: GLfloat; v1: GLfloat; v2: GLfloat; v3: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform4fv = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform4d = procedure(program_: GLuint; location: GLint; v0: GLdouble; v1: GLdouble; v2: GLdouble; v3: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform4dv = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform4ui = procedure(program_: GLuint; location: GLint; v0: GLuint; v1: GLuint; v2: GLuint; v3: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform4uiv = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix2fv = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix3fv = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix4fv = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix2dv = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix3dv = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix4dv = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix2x3fv = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix3x2fv = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix2x4fv = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix4x2fv = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix3x4fv = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix4x3fv = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix2x3dv = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix3x2dv = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix2x4dv = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix4x2dv = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix3x4dv = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix4x3dv = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglValidateProgramPipeline = procedure(pipeline: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramPipelineInfoLog = procedure(pipeline: GLuint; bufSize: GLsizei; length: PGLsizei; infoLog: PGLchar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_vertex_attrib_64bit
  TglVertexAttribL1d = procedure(index: GLuint; x: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL2d = procedure(index: GLuint; x: GLdouble; y: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL3d = procedure(index: GLuint; x: GLdouble; y: GLdouble; z: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL4d = procedure(index: GLuint; x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL1dv = procedure(index: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL2dv = procedure(index: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL3dv = procedure(index: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL4dv = procedure(index: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribLPointer = procedure(index: GLuint; size: GLint; type_: GLenum; stride: GLsizei; const pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVertexAttribLdv = procedure(index: GLuint; pname: GLenum; params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_viewport_array
  TglViewportArrayv = procedure(first: GLuint; count: GLsizei; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglViewportIndexedf = procedure(index: GLuint; x: GLfloat; y: GLfloat; w: GLfloat; h: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglViewportIndexedfv = procedure(index: GLuint; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglScissorArrayv = procedure(first: GLuint; count: GLsizei; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglScissorIndexed = procedure(index: GLuint; left: GLint; bottom: GLint; width: GLsizei; height: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglScissorIndexedv = procedure(index: GLuint; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDepthRangeArrayv = procedure(first: GLuint; count: GLsizei; const v: PGLclampd); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDepthRangeIndexed = procedure(index: GLuint; n: GLclampd; f: GLclampd); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetFloati_v = procedure(target: GLenum; index: GLuint; data: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetDoublei_v = procedure(target: GLenum; index: GLuint; data: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_cl_event
  TglCreateSyncFromCLeventARB = function(context: p_cl_context; event: p_cl_event; flags: GLbitfield): GLsync; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_debug_output
  TglDebugMessageControlARB = procedure(source: GLenum; type_: GLenum; severity: GLenum; count: GLsizei; const ids: PGLuint; enabled: GLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDebugMessageInsertARB = procedure(source: GLenum; type_: GLenum; id: GLuint; severity: GLenum; length: GLsizei; const buf: PGLchar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDebugMessageCallbackARB = procedure(callback: TglDebugProcARB; const userParam: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetDebugMessageLogARB = function(count: GLuint; bufsize: GLsizei; sources: PGLenum; types: PGLenum; ids: PGLuint; severities: PGLenum; lengths: PGLsizei; messageLog: PGLchar): GLuint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ARB_robustness
  TglGetGraphicsResetStatusARB = function(): GLenum; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetnMapdvARB = procedure(target: GLenum; query: GLenum; bufSize: GLsizei; v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetnMapfvARB = procedure(target: GLenum; query: GLenum; bufSize: GLsizei; v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetnMapivARB = procedure(target: GLenum; query: GLenum; bufSize: GLsizei; v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetnPixelMapfvARB = procedure(map: GLenum; bufSize: GLsizei; values: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetnPixelMapuivARB = procedure(map: GLenum; bufSize: GLsizei; values: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetnPixelMapusvARB = procedure(map: GLenum; bufSize: GLsizei; values: PGLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetnPolygonStippleARB = procedure(bufSize: GLsizei; pattern: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetnColorTableARB = procedure(target: GLenum; format: GLenum; type_: GLenum; bufSize: GLsizei; table: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetnConvolutionFilterARB = procedure(target: GLenum; format: GLenum; type_: GLenum; bufSize: GLsizei; image: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetnSeparableFilterARB = procedure(target: GLenum; format: GLenum; type_: GLenum; rowBufSize: GLsizei; row: PGLvoid; columnBufSize: GLsizei; column: PGLvoid; span: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetnHistogramARB = procedure(target: GLenum; reset: GLboolean; format: GLenum; type_: GLenum; bufSize: GLsizei; values: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetnMinmaxARB = procedure(target: GLenum; reset: GLboolean; format: GLenum; type_: GLenum; bufSize: GLsizei; values: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetnTexImageARB = procedure(target: GLenum; level: GLint; format: GLenum; type_: GLenum; bufSize: GLsizei; img: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReadnPixelsARB = procedure(x: GLint; y: GLint; width: GLsizei; height: GLsizei; format: GLenum; type_: GLenum; bufSize: GLsizei; data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetnCompressedTexImageARB = procedure(target: GLenum; lod: GLint; bufSize: GLsizei; img: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetnUniformfvARB = procedure(program_: GLuint; location: GLint; bufSize: GLsizei; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetnUniformivARB = procedure(program_: GLuint; location: GLint; bufSize: GLsizei; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetnUniformuivARB = procedure(program_: GLuint; location: GLint; bufSize: GLsizei; params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetnUniformdvARB = procedure(program_: GLuint; location: GLint; bufSize: GLsizei; params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ATI_draw_buffers
  TglDrawBuffersATI = procedure(n: GLsizei; const bufs: PGLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ATI_element_array
  TglElementPointerATI = procedure(_type: GLenum; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDrawElementArrayATI = procedure(mode: GLenum; count: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDrawRangeElementArrayATI = procedure(mode: GLenum; start: GLuint; _end: GLuint; count: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ATI_envmap_bumpmap
  TglTexBumpParameterivATI = procedure(pname: GLenum; const param: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexBumpParameterfvATI = procedure(pname: GLenum; const param: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTexBumpParameterivATI = procedure(pname: GLenum; param: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTexBumpParameterfvATI = procedure(pname: GLenum; param: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ATI_fragment_shader
  TglGenFragmentShadersATI = function(range: GLuint): GLuint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindFragmentShaderATI = procedure(id: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteFragmentShaderATI = procedure(id: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBeginFragmentShaderATI = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEndFragmentShaderATI = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPassTexCoordATI = procedure(dst: GLuint; coord: GLuint; swizzle: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSampleMapATI = procedure(dst: GLuint; interp: GLuint; swizzle: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColorFragmentOp1ATI = procedure(op: GLenum; dst: GLuint; dstMask: GLuint; dstMod: GLuint; arg1: GLuint; arg1Rep: GLuint; arg1Mod: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColorFragmentOp2ATI = procedure(op: GLenum; dst: GLuint; dstMask: GLuint; dstMod: GLuint; arg1: GLuint; arg1Rep: GLuint; arg1Mod: GLuint; arg2: GLuint; arg2Rep: GLuint; arg2Mod: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColorFragmentOp3ATI = procedure(op: GLenum; dst: GLuint; dstMask: GLuint; dstMod: GLuint; arg1: GLuint; arg1Rep: GLuint; arg1Mod: GLuint; arg2: GLuint; arg2Rep: GLuint; arg2Mod: GLuint; arg3: GLuint; arg3Rep: GLuint; arg3Mod: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglAlphaFragmentOp1ATI = procedure(op: GLenum; dst: GLuint; dstMod: GLuint; arg1: GLuint; arg1Rep: GLuint; arg1Mod: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglAlphaFragmentOp2ATI = procedure(op: GLenum; dst: GLuint; dstMod: GLuint; arg1: GLuint; arg1Rep: GLuint; arg1Mod: GLuint; arg2: GLuint; arg2Rep: GLuint; arg2Mod: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglAlphaFragmentOp3ATI = procedure(op: GLenum; dst: GLuint; dstMod: GLuint; arg1: GLuint; arg1Rep: GLuint; arg1Mod: GLuint; arg2: GLuint; arg2Rep: GLuint; arg2Mod: GLuint; arg3: GLuint; arg3Rep: GLuint; arg3Mod: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSetFragmentShaderConstantATI = procedure(dst: GLuint; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ATI_map_object_buffer
  TglMapObjectBufferATI = function(buffer: GLuint): PGLvoid; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUnmapObjectBufferATI = procedure(buffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ATI_pn_triangles
  TglPNTrianglesiATI = procedure(pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPNTrianglesfATI = procedure(pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ATI_separate_stencil
  TglStencilOpSeparateATI = procedure(face: GLenum; sfail: GLenum; dpfail: GLenum; dppass: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglStencilFuncSeparateATI = procedure(frontfunc: GLenum; backfunc: GLenum; ref: GLint; mask: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ATI_vertex_array_object
  TglNewObjectBufferATI = function(size: GLsizei; const _pointer: PGLvoid; usage: GLenum): GLuint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsObjectBufferATI = function(buffer: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUpdateObjectBufferATI = procedure(buffer: GLuint; offset: GLuint; size: GLsizei; const _pointer: PGLvoid; preserve: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetObjectBufferfvATI = procedure(buffer: GLuint; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetObjectBufferivATI = procedure(buffer: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFreeObjectBufferATI = procedure(buffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglArrayObjectATI = procedure(_array: GLenum; size: GLint; _type: GLenum; stride: GLsizei; buffer: GLuint; offset: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetArrayObjectfvATI = procedure(_array: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetArrayObjectivATI = procedure(_array: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVariantArrayObjectATI = procedure(id: GLuint; _type: GLenum; stride: GLsizei; buffer: GLuint; offset: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVariantArrayObjectfvATI = procedure(id: GLuint; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVariantArrayObjectivATI = procedure(id: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ATI_vertex_attrib_array_object
  TglVertexAttribArrayObjectATI = procedure(index: GLuint; size: GLint; _type: GLenum; normalized: GLboolean; stride: GLsizei; buffer: GLuint; offset: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVertexAttribArrayObjectfvATI = procedure(index: GLuint; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVertexAttribArrayObjectivATI = procedure(index: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_ATI_vertex_streams
  TglVertexStream1sATI = procedure(stream: GLenum; x: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream1svATI = procedure(stream: GLenum; const coords: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream1iATI = procedure(stream: GLenum; x: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream1ivATI = procedure(stream: GLenum; const coords: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream1fATI = procedure(stream: GLenum; x: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream1fvATI = procedure(stream: GLenum; const coords: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream1dATI = procedure(stream: GLenum; x: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream1dvATI = procedure(stream: GLenum; const coords: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream2sATI = procedure(stream: GLenum; x: GLshort; y: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream2svATI = procedure(stream: GLenum; const coords: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream2iATI = procedure(stream: GLenum; x: GLint; y: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream2ivATI = procedure(stream: GLenum; const coords: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream2fATI = procedure(stream: GLenum; x: GLfloat; y: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream2fvATI = procedure(stream: GLenum; const coords: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream2dATI = procedure(stream: GLenum; x: GLdouble; y: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream2dvATI = procedure(stream: GLenum; const coords: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream3sATI = procedure(stream: GLenum; x: GLshort; y: GLshort; z: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream3svATI = procedure(stream: GLenum; const coords: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream3iATI = procedure(stream: GLenum; x: GLint; y: GLint; z: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream3ivATI = procedure(stream: GLenum; const coords: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream3fATI = procedure(stream: GLenum; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream3fvATI = procedure(stream: GLenum; const coords: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream3dATI = procedure(stream: GLenum; x: GLdouble; y: GLdouble; z: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream3dvATI = procedure(stream: GLenum; const coords: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream4sATI = procedure(stream: GLenum; x: GLshort; y: GLshort; z: GLshort; w: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream4svATI = procedure(stream: GLenum; const coords: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream4iATI = procedure(stream: GLenum; x: GLint; y: GLint; z: GLint; w: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream4ivATI = procedure(stream: GLenum; const coords: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream4fATI = procedure(stream: GLenum; x: GLfloat; y: GLfloat; z: GLfloat; w: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream4fvATI = procedure(stream: GLenum; const coords: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream4dATI = procedure(stream: GLenum; x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexStream4dvATI = procedure(stream: GLenum; const coords: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormalStream3bATI = procedure(stream: GLenum; nx: GLbyte; ny: GLbyte; nz: GLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormalStream3bvATI = procedure(stream: GLenum; const coords: PGLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormalStream3sATI = procedure(stream: GLenum; nx: GLshort; ny: GLshort; nz: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormalStream3svATI = procedure(stream: GLenum; const coords: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormalStream3iATI = procedure(stream: GLenum; nx: GLint; ny: GLint; nz: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormalStream3ivATI = procedure(stream: GLenum; const coords: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormalStream3fATI = procedure(stream: GLenum; nx: GLfloat; ny: GLfloat; nz: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormalStream3fvATI = procedure(stream: GLenum; const coords: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormalStream3dATI = procedure(stream: GLenum; nx: GLdouble; ny: GLdouble; nz: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormalStream3dvATI = procedure(stream: GLenum; const coords: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglClientActiveVertexStreamATI = procedure(stream: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexBlendEnviATI = procedure(pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexBlendEnvfATI = procedure(pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_AMD_performance_monitor
  TglGetPerfMonitorGroupsAMD = procedure(numGroups: PGLint; groupsSize: GLsizei; groups: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetPerfMonitorCountersAMD = procedure(group: GLuint; numCounters: PGLint; maxActiveCouters: PGLint; counterSize: GLsizei; counters: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetPerfMonitorGroupStringAMD = procedure(group: GLuint; bufSize: GLsizei; length: PGLsizei; groupString: PGLchar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetPerfMonitorCounterStringAMD = procedure(group: GLuint; counter: GLuint; bufSize: GLsizei; length: PGLsizei; counterString: PGLchar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetPerfMonitorCounterInfoAMD = procedure(group: GLuint; counter: GLuint; pname: GLenum; data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenPerfMonitorsAMD = procedure(n: GLsizei; monitors: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeletePerfMonitorsAMD = procedure(n: GLsizei; monitors: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSelectPerfMonitorCountersAMD = procedure(monitor: GLuint; enable: GLboolean; group: GLuint; numCounters: GLint; counterList: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBeginPerfMonitorAMD = procedure(monitor: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEndPerfMonitorAMD = procedure(monitor: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetPerfMonitorCounterDataAMD = procedure(monitor: GLuint; pname: GLenum; dataSize: GLsizei; data: PGLuint; bytesWritten: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_AMD_vertex_shader_tesselator
  TglTessellationFactorAMD = procedure(factor: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTessellationModeAMD = procedure(mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_AMD_draw_buffers_blend
  TglBlendFuncIndexedAMD = procedure(buf: GLuint; src: GLenum; dst: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBlendFuncSeparateIndexedAMD = procedure(buf: GLuint; srcRGB: GLenum; dstRGB: GLenum; srcAlpha: GLenum; dstAlpha: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBlendEquationIndexedAMD = procedure(buf: GLuint; mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBlendEquationSeparateIndexedAMD = procedure(buf: GLuint; modeRGB: GLenum; modeAlpha: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_AMD_name_gen_delete
  TglGenNamesAMD = procedure(identifier: GLenum; num: GLuint; names: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteNamesAMD = procedure(identifier: GLenum; num: GLuint; const names: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsNameAMD = function(identifier: GLenum; name: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_AMD_debug_output
  TglDebugMessageEnableAMD = procedure(category: GLenum; severity: GLenum; count: GLsizei; const ids: PGLuint; enabled: GLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDebugMessageInsertAMD = procedure(category: GLenum; severity: GLenum; id: GLuint; length: GLsizei; const buf: PGLchar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDebugMessageCallbackAMD = procedure(callback: TGLDebugProcAMD; userParam: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetDebugMessageLogAMD = function(count: GLuint; bufsize: GLsizei; categories: PGLenum; severities: PGLuint; ids: PGLuint; lengths: PGLsizei; message: PGLchar): GLuint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_blend_color
  TglBlendColorEXT = procedure(red: GLclampf; green: GLclampf; blue: GLclampf; alpha: GLclampf); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_blend_func_separate
  TglBlendFuncSeparateEXT = procedure(sfactorRGB: GLenum; dfactorRGB: GLenum; sfactorAlpha: GLenum; dfactorAlpha: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_blend_minmax
  TglBlendEquationEXT = procedure(mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_color_subtable
  TglColorSubTableEXT = procedure(target: GLenum; start: GLsizei; count: GLsizei; format: GLenum; _type: GLenum; const data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyColorSubTableEXT = procedure(target: GLenum; start: GLsizei; x: GLint; y: GLint; width: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_compiled_vertex_array
  TglLockArraysEXT = procedure(first: GLint; count: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUnlockArraysEXT = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_convolution
  TglConvolutionFilter1DEXT = procedure(target: GLenum; internalformat: GLenum; width: GLsizei; format: GLenum; _type: GLenum; const image: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglConvolutionFilter2DEXT = procedure(target: GLenum; internalformat: GLenum; width: GLsizei; height: GLsizei; format: GLenum; _type: GLenum; const image: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglConvolutionParameterfEXT = procedure(target: GLenum; pname: GLenum; params: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglConvolutionParameterfvEXT = procedure(target: GLenum; pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglConvolutionParameteriEXT = procedure(target: GLenum; pname: GLenum; params: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglConvolutionParameterivEXT = procedure(target: GLenum; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyConvolutionFilter1DEXT = procedure(target: GLenum; internalformat: GLenum; x: GLint; y: GLint; width: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyConvolutionFilter2DEXT = procedure(target: GLenum; internalformat: GLenum; x: GLint; y: GLint; width: GLsizei; height: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetConvolutionFilterEXT = procedure(target: GLenum; format: GLenum; _type: GLenum; image: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetConvolutionParameterfvEXT = procedure(target: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetConvolutionParameterivEXT = procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetSeparableFilterEXT = procedure(target: GLenum; format: GLenum; _type: GLenum; row: PGLvoid; column: PGLvoid; span: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSeparableFilter2DEXT = procedure(target: GLenum; internalformat: GLenum; width: GLsizei; height: GLsizei; format: GLenum; _type: GLenum; const row: PGLvoid; const column: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_coordinate_frame
  TglTangent3bEXT = procedure(tx: GLbyte; ty: GLbyte; tz: GLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTangent3bvEXT = procedure(const v: PGLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTangent3dEXT = procedure(tx: GLdouble; ty: GLdouble; tz: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTangent3dvEXT = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTangent3fEXT = procedure(tx: GLfloat; ty: GLfloat; tz: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTangent3fvEXT = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTangent3iEXT = procedure(tx: GLint; ty: GLint; tz: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTangent3ivEXT = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTangent3sEXT = procedure(tx: GLshort; ty: GLshort; tz: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTangent3svEXT = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBinormal3bEXT = procedure(bx: GLbyte; by: GLbyte; bz: GLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBinormal3bvEXT = procedure(const v: PGLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBinormal3dEXT = procedure(bx: GLdouble; by: GLdouble; bz: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBinormal3dvEXT = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBinormal3fEXT = procedure(bx: GLfloat; by: GLfloat; bz: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBinormal3fvEXT = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBinormal3iEXT = procedure(bx: GLint; by: GLint; bz: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBinormal3ivEXT = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBinormal3sEXT = procedure(bx: GLshort; by: GLshort; bz: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBinormal3svEXT = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTangentPointerEXT = procedure(_type: GLenum; stride: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBinormalPointerEXT = procedure(_type: GLenum; stride: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_copy_texture
  TglCopyTexImage1DEXT = procedure(target: GLenum; level: GLint; internalformat: GLenum; x: GLint; y: GLint; width: GLsizei; border: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyTexImage2DEXT = procedure(target: GLenum; level: GLint; internalformat: GLenum; x: GLint; y: GLint; width: GLsizei; height: GLsizei; border: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyTexSubImage1DEXT = procedure(target: GLenum; level: GLint; xoffset: GLint; x: GLint; y: GLint; width: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyTexSubImage2DEXT = procedure(target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; x: GLint; y: GLint; width: GLsizei; height: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyTexSubImage3DEXT = procedure(target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; zoffset: GLint; x: GLint; y: GLint; width: GLsizei; height: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_cull_vertex
  TglCullParameterdvEXT = procedure(pname: GLenum; params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCullParameterfvEXT = procedure(pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_draw_range_elements
  TglDrawRangeElementsEXT = procedure(mode: GLenum; start: GLuint; _end: GLuint; count: GLsizei; _type: GLenum; const indices: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_fog_coord
  TglFogCoordfEXT = procedure(coord: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFogCoordfvEXT = procedure(const coord: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFogCoorddEXT = procedure(coord: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFogCoorddvEXT = procedure(const coord: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFogCoordPointerEXT = procedure(_type: GLenum; stride: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_framebuffer_object
  TglIsRenderbufferEXT = function(renderbuffer: GLuint): Boolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindRenderbufferEXT = procedure(target: GLenum; renderbuffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteRenderbuffersEXT = procedure(n: GLsizei; const renderbuffers: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenRenderbuffersEXT = procedure(n: GLsizei; renderbuffers: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRenderbufferStorageEXT = procedure(target: GLenum; internalformat: GLenum; width: GLsizei; height: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetRenderbufferParameterivEXT = procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsFramebufferEXT = function(framebuffer: GLuint): Boolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindFramebufferEXT = procedure(target: GLenum; framebuffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteFramebuffersEXT = procedure(n: GLsizei; const framebuffers: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenFramebuffersEXT = procedure(n: GLsizei; framebuffers: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCheckFramebufferStatusEXT = function(target: GLenum): GLenum; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFramebufferTexture1DEXT = procedure(target: GLenum; attachment: GLenum; textarget: GLenum; texture: GLuint; level: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFramebufferTexture2DEXT = procedure(target: GLenum; attachment: GLenum; textarget: GLenum; texture: GLuint; level: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFramebufferTexture3DEXT = procedure(target: GLenum; attachment: GLenum; textarget: GLenum; texture: GLuint; level: GLint; zoffset: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFramebufferRenderbufferEXT = procedure(target: GLenum; attachment: GLenum; renderbuffertarget: GLenum; renderbuffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetFramebufferAttachmentParameterivEXT = procedure(target: GLenum; attachment: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenerateMipmapEXT = procedure(target: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_histogram
  TglGetHistogramEXT = procedure(target: GLenum; reset: GLboolean; format: GLenum; _type: GLenum; values: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetHistogramParameterfvEXT = procedure(target: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetHistogramParameterivEXT = procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMinmaxEXT = procedure(target: GLenum; reset: GLboolean; format: GLenum; _type: GLenum; values: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMinmaxParameterfvEXT = procedure(target: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMinmaxParameterivEXT = procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglHistogramEXT = procedure(target: GLenum; width: GLsizei; internalformat: GLenum; sink: GLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMinmaxEXT = procedure(target: GLenum; internalformat: GLenum; sink: GLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglResetHistogramEXT = procedure(target: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglResetMinmaxEXT = procedure(target: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_index_func
  TglIndexFuncEXT = procedure(func: GLenum; ref: GLclampf); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_index_material
  TglIndexMaterialEXT = procedure(face: GLenum; mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_light_texture
  TglApplyTextureEXT = procedure(mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTextureLightEXT = procedure(pname: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTextureMaterialEXT = procedure(face: GLenum; mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_multi_draw_arrays
  TglMultiDrawArraysEXT = procedure(mode: GLenum; const first: PGLint; const count: PGLsizei; primcount: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiDrawElementsEXT = procedure(mode: GLenum; const count: PGLsizei; _type: GLenum; const indices: PGLvoid; primcount: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_multisample
  TglSampleMaskEXT = procedure(value: GLclampf; invert: GLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSamplePatternEXT = procedure(pattern: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_paletted_texture
  TglColorTableEXT = procedure(target: GLenum; internalFormat: GLenum; width: GLsizei; format: GLenum; _type: GLenum; const table: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetColorTableEXT = procedure(target: GLenum; format: GLenum; _type: GLenum; data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetColorTableParameterivEXT = procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetColorTableParameterfvEXT = procedure(target: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_pixel_transform
  TglPixelTransformParameteriEXT = procedure(target: GLenum; pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPixelTransformParameterfEXT = procedure(target: GLenum; pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPixelTransformParameterivEXT = procedure(target: GLenum; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPixelTransformParameterfvEXT = procedure(target: GLenum; pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_point_parameters
  TglPointParameterfEXT = procedure(pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPointParameterfvEXT = procedure(pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_polygon_offset
  TglPolygonOffsetEXT = procedure(factor: GLfloat; bias: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_secondary_color
  TglSecondaryColor3bEXT = procedure(red: GLbyte; green: GLbyte; blue: GLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3bvEXT = procedure(const v: PGLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3dEXT = procedure(red: GLdouble; green: GLdouble; blue: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3dvEXT = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3fEXT = procedure(red: GLfloat; green: GLfloat; blue: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3fvEXT = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3iEXT = procedure(red: GLint; green: GLint; blue: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3ivEXT = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3sEXT = procedure(red: GLshort; green: GLshort; blue: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3svEXT = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3ubEXT = procedure(red: GLubyte; green: GLubyte; blue: GLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3ubvEXT = procedure(const v: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3uiEXT = procedure(red: GLuint; green: GLuint; blue: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3uivEXT = procedure(const v: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3usEXT = procedure(red: GLushort; green: GLushort; blue: GLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3usvEXT = procedure(const v: PGLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColorPointerEXT = procedure(size: GLint; _type: GLenum; stride: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_stencil_two_side
  TglActiveStencilFaceEXT = procedure(face: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_subtexture
  TglTexSubImage1DEXT = procedure(target: GLenum; level: GLint; xoffset: GLint; width: GLsizei; format: GLenum; _type: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexSubImage2DEXT = procedure(target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; width: GLsizei; height: GLsizei; format: GLenum; _type: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_texture3D
  TglTexImage3DEXT = procedure(target: GLenum; level: GLint; internalformat: GLenum; width: GLsizei; height: GLsizei; depth: GLsizei; border: GLint; format: GLenum; _type: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexSubImage3DEXT = procedure(target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; zoffset: GLint; width: GLsizei; height: GLsizei; depth: GLsizei; format: GLenum; _type: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_texture_object
  TglAreTexturesResidentEXT = function(n: GLsizei; const textures: PGLuint; residences: PGLboolean): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindTextureEXT = procedure(target: GLenum; texture: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteTexturesEXT = procedure(n: GLsizei; const textures: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenTexturesEXT = procedure(n: GLsizei; textures: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsTextureEXT = function(texture: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPrioritizeTexturesEXT = procedure(n: GLsizei; const textures: PGLuint; const priorities: PGLclampf); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_texture_perturb_normal
  TglTextureNormalEXT = procedure(mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_vertex_array
  TglArrayElementEXT = procedure(i: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColorPointerEXT = procedure(size: GLint; _type: GLenum; stride: GLsizei; count: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDrawArraysEXT = procedure(mode: GLenum; first: GLint; count: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEdgeFlagPointerEXT = procedure(stride: GLsizei; count: GLsizei; const _pointer: PGLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetPointervEXT = procedure(pname: GLenum; params: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIndexPointerEXT = procedure(_type: GLenum; stride: GLsizei; count: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormalPointerEXT = procedure(_type: GLenum; stride: GLsizei; count: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoordPointerEXT = procedure(size: GLint; _type: GLenum; stride: GLsizei; count: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexPointerEXT = procedure(size: GLint; _type: GLenum; stride: GLsizei; count: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_vertex_shader
  TglBeginVertexShaderEXT = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEndVertexShaderEXT = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindVertexShaderEXT = procedure(id: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenVertexShadersEXT = function(range: GLuint): GLuint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteVertexShaderEXT = procedure(id: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglShaderOp1EXT = procedure(op: GLenum; res: GLuint; arg1: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglShaderOp2EXT = procedure(op: GLenum; res: GLuint; arg1: GLuint; arg2: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglShaderOp3EXT = procedure(op: GLenum; res: GLuint; arg1: GLuint; arg2: GLuint; arg3: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSwizzleEXT = procedure(res: GLuint; _in: GLuint; outX: GLenum; outY: GLenum; outZ: GLenum; outW: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWriteMaskEXT = procedure(res: GLuint; _in: GLuint; outX: GLenum; outY: GLenum; outZ: GLenum; outW: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglInsertComponentEXT = procedure(res: GLuint; src: GLuint; num: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglExtractComponentEXT = procedure(res: GLuint; src: GLuint; num: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenSymbolsEXT = function(datatype: GLenum; storagetype: GLenum; range: GLenum; components: GLuint): GLuint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSetInvariantEXT = procedure(id: GLuint; _type: GLenum; const addr: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSetLocalConstantEXT = procedure(id: GLuint; _type: GLenum; const addr: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVariantbvEXT = procedure(id: GLuint; const addr: PGLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVariantsvEXT = procedure(id: GLuint; const addr: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVariantivEXT = procedure(id: GLuint; const addr: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVariantfvEXT = procedure(id: GLuint; const addr: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVariantdvEXT = procedure(id: GLuint; const addr: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVariantubvEXT = procedure(id: GLuint; const addr: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVariantusvEXT = procedure(id: GLuint; const addr: PGLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVariantuivEXT = procedure(id: GLuint; const addr: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVariantPointerEXT = procedure(id: GLuint; _type: GLenum; stride: GLuint; const addr: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEnableVariantClientStateEXT = procedure(id: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDisableVariantClientStateEXT = procedure(id: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindLightParameterEXT = function(light: GLenum; value: GLenum): GLuint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindMaterialParameterEXT = function(face: GLenum; value: GLenum): GLuint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindTexGenParameterEXT = function(_unit: GLenum; coord: GLenum; value: GLenum): GLuint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindTextureUnitParameterEXT = function(_unit: GLenum; value: GLenum): GLuint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindParameterEXT = function(value: GLenum): GLuint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsVariantEnabledEXT = function(id: GLuint; cap: GLenum): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVariantBooleanvEXT = procedure(id: GLuint; value: GLenum; data: PGLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVariantIntegervEXT = procedure(id: GLuint; value: GLenum; data: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVariantFloatvEXT = procedure(id: GLuint; value: GLenum; data: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVariantPointervEXT = procedure(id: GLuint; value: GLenum; data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetInvariantBooleanvEXT = procedure(id: GLuint; value: GLenum; data: PGLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetInvariantIntegervEXT = procedure(id: GLuint; value: GLenum; data: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetInvariantFloatvEXT = procedure(id: GLuint; value: GLenum; data: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetLocalConstantBooleanvEXT = procedure(id: GLuint; value: GLenum; data: PGLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetLocalConstantIntegervEXT = procedure(id: GLuint; value: GLenum; data: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetLocalConstantFloatvEXT = procedure(id: GLuint; value: GLenum; data: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_vertex_weighting
  TglVertexWeightfEXT = procedure(weight: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexWeightfvEXT = procedure(const weight: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexWeightPointerEXT = procedure(size: GLsizei; _type: GLenum; stride: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_stencil_clear_tag
  TglStencilClearTagEXT = procedure(stencilTagBits: GLsizei; stencilClearTag: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_framebuffer_blit
  TglBlitFramebufferEXT = procedure(srcX0: GLint; srcY0: GLint; srcX1: GLint; srcY1: GLint; dstX0: GLint; dstY0: GLint; dstX1: GLint; dstY1: GLint; mask: GLbitfield; filter: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_framebuffer_multisample
  TglRenderbufferStorageMultisampleEXT = procedure(target: GLenum; samples: GLsizei; internalformat: GLenum; width: GLsizei; height: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_timer_query
  TglGetQueryObjecti64vEXT = procedure(id: GLuint; pname: GLenum; params: PGLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetQueryObjectui64vEXT = procedure(id: GLuint; pname: GLenum; params: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_gpu_program_parameters
  TglProgramEnvParameters4fvEXT = procedure(target: GLenum; index: GLuint; count: GLsizei; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramLocalParameters4fvEXT = procedure(target: GLenum; index: GLuint; count: GLsizei; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_bindable_uniform
  TglUniformBufferEXT = procedure(_program: GLuint; location: GLint; buffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetUniformBufferSizeEXT = function(_program: GLuint; location: GLint): GLint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetUniformOffsetEXT = function(_program: GLuint; location: GLint): GLintptr; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_draw_buffers2
  TglColorMaskIndexedEXT = procedure(buf: GLuint; r: GLboolean; g: GLboolean; b: GLboolean; a: GLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetBooleanIndexedvEXT = procedure(value: GLenum; index: GLuint; data: PGLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetIntegerIndexedvEXT = procedure(value: GLenum; index: GLuint; data: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEnableIndexedEXT = procedure(target: GLenum; index: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDisableIndexedEXT = procedure(target: GLenum; index: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsEnabledIndexedEXT = function(target: GLenum; index: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_draw_instanced
  TglDrawArraysInstancedEXT = procedure(mode: GLenum; first: GLint; count: GLsizei; primcount: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDrawElementsInstancedEXT = procedure(mode: GLenum; count: GLsizei; _type: GLenum; const indices: Pointer; primcount: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_geometry_shader4
  TglProgramParameteriEXT = procedure (_program: GLuint; pname: GLenum; value: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFramebufferTextureEXT = procedure(target: GLenum; attachment: GLenum; texture: GLuint; level: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
//  TglFramebufferTextureLayerEXT = procedure(target: GLenum; attachment: GLenum; texture: GLuint; level: GLint; layer: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFramebufferTextureFaceEXT = procedure(target: GLenum; attachment: GLenum; texture: GLuint; level: GLint; face: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_gpu_shader4
  TglVertexAttribI1iEXT = procedure(index: GLuint; x: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI2iEXT = procedure(index: GLuint; x: GLint; y: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI3iEXT = procedure(index: GLuint; x: GLint; y: GLint; z: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI4iEXT = procedure(index: GLuint; x: GLint; y: GLint; z: GLint; w: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI1uiEXT = procedure(index: GLuint; x: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI2uiEXT = procedure(index: GLuint; x: GLuint; y: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI3uiEXT = procedure(index: GLuint; x: GLuint; y: GLuint; z: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI4uiEXT = procedure(index: GLuint; x: GLuint; y: GLuint; z: GLuint; w: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI1ivEXT = procedure(index: GLuint; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI2ivEXT = procedure(index: GLuint; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI3ivEXT = procedure(index: GLuint; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI4ivEXT = procedure(index: GLuint; const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI1uivEXT = procedure(index: GLuint; const v: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI2uivEXT = procedure(index: GLuint; const v: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI3uivEXT = procedure(index: GLuint; const v: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI4uivEXT = procedure(index: GLuint; const v: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI4bvEXT = procedure(index: GLuint; const v: PGLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI4svEXT = procedure(index: GLuint; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI4ubvEXT = procedure(index: GLuint; const v: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribI4usvEXT = procedure(index: GLuint; const v: PGLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribIPointerEXT = procedure(index: GLuint; size: GLint; _type: GLenum; stride: GLsizei; const _pointer: Pointer); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVertexAttribIivEXT = procedure(index: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVertexAttribIuivEXT = procedure(index: GLuint; pname: GLenum; params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform1uiEXT = procedure(location: GLint; v0: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform2uiEXT = procedure(location: GLint; v0: GLuint; v1: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform3uiEXT = procedure(location: GLint; v0: GLuint; v1: GLuint; v2: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform4uiEXT = procedure(location: GLint; v0: GLuint; v1: GLuint; v2: GLuint; v3: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform1uivEXT = procedure(location: GLint; count: GLsizei; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform2uivEXT = procedure(location: GLint; count: GLsizei; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform3uivEXT = procedure(location: GLint; count: GLsizei; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform4uivEXT = procedure(location: GLint; count: GLsizei; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetUniformuivEXT = procedure(_program: GLuint; location: GLint; params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindFragDataLocationEXT = procedure(_program: GLuint; colorNumber: GLuint; const name: PGLchar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetFragDataLocationEXT = function(_program: GLuint; const name: PGLchar): GLint;

  // GL_EXT_texture_array
  TglFramebufferTextureLayerEXT = procedure(target: GLenum; attachment: GLenum; texture: GLuint; level: GLint; layer: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_texture_buffer_object
  TglTexBufferEXT = procedure(target: GLenum; internalformat: GLenum; buffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_texture_integer
  TglClearColorIiEXT = procedure(r: GLint; g: GLint; b: GLint; a: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglClearColorIuiEXT = procedure(r: GLuint; g: GLuint; b: GLuint; a: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexParameterIivEXT = procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexParameterIuivEXT = procedure(target: GLenum; pname: GLenum; params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTexParameterIivEXT = procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTexParameterIiuvEXT = procedure(target: GLenum; pname: GLenum; params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_HP_image_transform
  TglImageTransformParameteriHP = procedure(target: GLenum; pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglImageTransformParameterfHP = procedure(target: GLenum; pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglImageTransformParameterivHP = procedure(target: GLenum; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglImageTransformParameterfvHP = procedure(target: GLenum; pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetImageTransformParameterivHP = procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetImageTransformParameterfvHP = procedure(target: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_depth_bounds_test
  TglDepthBoundsEXT = procedure(zmin: GLclampd; zmax: GLclampd); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_blend_equation_separate
  TglBlendEquationSeparateEXT = procedure(modeRGB: GLenum; modeAlpha: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_transform_feedback
  TglBeginTransformFeedbackEXT = procedure(primitiveMode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEndTransformFeedbackEXT = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindBufferRangeEXT = procedure(target: GLenum; index_: GLuint; buffer: GLuint; offset: GLintptr; size: GLsizeiptr); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindBufferOffsetEXT = procedure(target: GLenum; index_: GLuint; buffer: GLuint; offset: GLintptr); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindBufferBaseEXT = procedure(target: GLenum; index_: GLuint; buffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTransformFeedbackVaryingsEXT = procedure(program_: GLuint; count: GLsizei; const locations: PGLint; bufferMode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTransformFeedbackVaryingEXT = procedure(program_: GLuint; index_: GLuint; location: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_direct_state_access
  TglClientAttribDefaultEXT = procedure(mask: GLbitfield); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPushClientAttribDefaultEXT = procedure(mask: GLbitfield); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixLoadfEXT = procedure(mode: GLenum; const m: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixLoaddEXT = procedure(mode: GLenum; const m: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixMultfEXT = procedure(mode: GLenum; const m: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixMultdEXT = procedure(mode: GLenum; const m: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixLoadIdentityEXT = procedure(mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixRotatefEXT = procedure(mode: GLenum; angle: GLfloat; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixRotatedEXT = procedure(mode: GLenum; angle: GLdouble; x: GLdouble; y: GLdouble; z: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixScalefEXT = procedure(mode: GLenum; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixScaledEXT = procedure(mode: GLenum; x: GLdouble; y: GLdouble; z: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixTranslatefEXT = procedure(mode: GLenum; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixTranslatedEXT = procedure(mode: GLenum; x: GLdouble; y: GLdouble; z: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixFrustumEXT = procedure(mode: GLenum; left: GLdouble; right: GLdouble; bottom: GLdouble; top: GLdouble; zNear: GLdouble; zFar: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixOrthoEXT = procedure(mode: GLenum; left: GLdouble; right: GLdouble; bottom: GLdouble; top: GLdouble; zNear: GLdouble; zFar: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixPopEXT = procedure(mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixPushEXT = procedure(mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixLoadTransposefEXT = procedure(mode: GLenum; const m: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixLoadTransposedEXT = procedure(mode: GLenum; const m: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixMultTransposefEXT = procedure(mode: GLenum; const m: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMatrixMultTransposedEXT = procedure(mode: GLenum; const m: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTextureParameterfEXT = procedure(texture: GLuint; target: GLenum; pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTextureParameterfvEXT = procedure(texture: GLuint; target: GLenum; pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTextureParameteriEXT = procedure(texture: GLuint; target: GLenum; pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTextureParameterivEXT = procedure(texture: GLuint; target: GLenum; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTextureImage1DEXT = procedure(texture: GLuint; target: GLenum; level: GLint; internalformat: GLenum; width: GLsizei; border: GLint; format: GLenum; type_: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTextureImage2DEXT = procedure(texture: GLuint; target: GLenum; level: GLint; internalformat: GLenum; width: GLsizei; height: GLsizei; border: GLint; format: GLenum; type_: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTextureSubImage1DEXT = procedure(texture: GLuint; target: GLenum; level: GLint; xoffset: GLint; width: GLsizei; format: GLenum; type_: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTextureSubImage2DEXT = procedure(texture: GLuint; target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; width: GLsizei; height: GLsizei; format: GLenum; type_: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyTextureImage1DEXT = procedure(texture: GLuint; target: GLenum; level: GLint; internalformat: GLenum; x: GLint; y: GLint; width: GLsizei; border: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyTextureImage2DEXT = procedure(texture: GLuint; target: GLenum; level: GLint; internalformat: GLenum; x: GLint; y: GLint; width: GLsizei; height: GLsizei; border: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyTextureSubImage1DEXT = procedure(texture: GLuint; target: GLenum; level: GLint; xoffset: GLint; x: GLint; y: GLint; width: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyTextureSubImage2DEXT = procedure(texture: GLuint; target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; x: GLint; y: GLint; width: GLsizei; height: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTextureImageEXT = procedure(texture: GLuint; target: GLenum; level: GLint; format: GLenum; type_: GLenum; pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTextureParameterfvEXT = procedure(texture: GLuint; target: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTextureParameterivEXT = procedure(texture: GLuint; target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTextureLevelParameterfvEXT = procedure(texture: GLuint; target: GLenum; level: GLint; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTextureLevelParameterivEXT = procedure(texture: GLuint; target: GLenum; level: GLint; pname: GLenum; params: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTextureImage3DEXT = procedure(texture: GLuint; target: GLenum; level: GLint; internalformat: GLenum; width: GLsizei; height: GLsizei; depth: GLsizei; border: GLint; format: GLenum; type_: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTextureSubImage3DEXT = procedure(texture: GLuint; target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; zoffset: GLint; width: GLsizei; height: GLsizei; depth: GLsizei; format: GLenum; type_: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyTextureSubImage3DEXT = procedure(texture: GLuint; target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; zoffset: GLint; x: GLint; y: GLint; width: GLsizei; height: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexParameterfEXT = procedure(texunit: GLenum; target: GLenum; pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexParameterfvEXT = procedure(texunit: GLenum; target: GLenum; pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexParameteriEXT = procedure(texunit: GLenum; target: GLenum; pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexParameterivEXT = procedure(texunit: GLenum; target: GLenum; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexImage1DEXT = procedure(texunit: GLenum; target: GLenum; level: GLint; internalformat: GLenum; width: GLsizei; border: GLint; format: GLenum; type_: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexImage2DEXT = procedure(texunit: GLenum; target: GLenum; level: GLint; internalformat: GLenum; width: GLsizei; height: GLsizei; border: GLint; format: GLenum; type_: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexSubImage1DEXT = procedure(texunit: GLenum; target: GLenum; level: GLint; xoffset: GLint; width: GLsizei; format: GLenum; type_: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexSubImage2DEXT = procedure(texunit: GLenum; target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; width: GLsizei; height: GLsizei; format: GLenum; type_: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyMultiTexImage1DEXT = procedure(texunit: GLenum; target: GLenum; level: GLint; internalformat: GLenum; x: GLint; y: GLint; width: GLsizei; border: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyMultiTexImage2DEXT = procedure(texunit: GLenum; target: GLenum; level: GLint; internalformat: GLenum; x: GLint; y: GLint; width: GLsizei; height: GLsizei; border: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyMultiTexSubImage1DEXT = procedure(texunit: GLenum; target: GLenum; level: GLint; xoffset: GLint; x: GLint; y: GLint; width: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyMultiTexSubImage2DEXT = procedure(texunit: GLenum; target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; x: GLint; y: GLint; width: GLsizei; height: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMultiTexImageEXT = procedure(texunit: GLenum; target: GLenum; level: GLint; format: GLenum; type_: GLenum; pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMultiTexParameterfvEXT = procedure(texunit: GLenum; target: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMultiTexParameterivEXT = procedure(texunit: GLenum; target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMultiTexLevelParameterfvEXT = procedure(texunit: GLenum; target: GLenum; level: GLint; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMultiTexLevelParameterivEXT = procedure(texunit: GLenum; target: GLenum; level: GLint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexImage3DEXT = procedure(texunit: GLenum; target: GLenum; level: GLint; internalformat: GLenum; width: GLsizei; height: GLsizei; depth: GLsizei; border: GLint; format: GLenum; type_: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexSubImage3DEXT = procedure(texunit: GLenum; target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; zoffset: GLint; width: GLsizei; height: GLsizei; depth: GLsizei; format: GLenum; type_: GLenum; const pixels:PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyMultiTexSubImage3DEXT = procedure(texunit: GLenum; target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; zoffset: GLint; x: GLint; y: GLint; width: GLsizei; height: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindMultiTextureEXT = procedure(texunit: GLenum; target: GLenum; texture: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEnableClientStateIndexedEXT = procedure(array_: GLenum; index_: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDisableClientStateIndexedEXT = procedure(array_: GLenum; index_: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoordPointerEXT = procedure(texunit: GLenum; size: GLint; type_: GLenum; stride: GLsizei; const pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexEnvfEXT = procedure(texunit: GLenum; target: GLenum; pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexEnvfvEXT = procedure(texunit: GLenum; target: GLenum; pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexEnviEXT = procedure(texunit: GLenum; target: GLenum; pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexEnvivEXT = procedure(texunit: GLenum; target: GLenum; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexGendEXT = procedure(texunit: GLenum; target: GLenum; pname: GLenum; param: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexGendvEXT = procedure(texunit: GLenum; target: GLenum; pname: GLenum; const params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexGenfEXT = procedure(texunit: GLenum; target: GLenum; pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexGenfvEXT = procedure(texunit: GLenum; target: GLenum; pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexGeniEXT = procedure(texunit: GLenum; target: GLenum; pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexGenivEXT = procedure(texunit: GLenum; target: GLenum; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMultiTexEnvfvEXT = procedure(texunit: GLenum; target: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMultiTexEnvivEXT = procedure(texunit: GLenum; target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMultiTexGendvEXT = procedure(texunit: GLenum; coord: GLenum; pname: GLenum; params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMultiTexGenfvEXT = procedure(texunit: GLenum; coord: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMultiTexGenivEXT = procedure(texunit: GLenum; coord: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetFloatIndexedvEXT = procedure(target: GLenum; index_: GLuint; data: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetDoubleIndexedvEXT = procedure(target: GLenum; index_: GLuint; data: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetPointerIndexedvEXT = procedure(target: GLenum; index_: GLuint; data: PPGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedTextureImage3DEXT = procedure(texture: GLuint; target: GLenum; level: GLint; internalformat: GLenum; width: GLsizei; height: GLsizei; depth: GLsizei; border: GLint; imageSize: GLsizei; const bits: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedTextureImage2DEXT = procedure(texture: GLuint; target: GLenum; level: GLint; internalformat: GLenum; width: GLsizei; height: GLsizei; border: GLint; imageSize: GLsizei; const bits: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedTextureImage1DEXT = procedure(texture: GLuint; target: GLenum; level: GLint; internalformat: GLenum; width: GLsizei; border: GLint; imageSize: GLsizei; const bits: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedTextureSubImage3DEXT = procedure(texture: GLuint; target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; zoffset: GLint; width: GLsizei; height: GLsizei; depth: GLsizei; format: GLenum; imageSize: GLsizei; const bits: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedTextureSubImage2DEXT = procedure(texture: GLuint; target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; width: GLsizei; height: GLsizei; format: GLenum; imageSize: GLsizei; const bits: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedTextureSubImage1DEXT = procedure(texture: GLuint; target: GLenum; level: GLint; xoffset: GLint; width: GLsizei; format: GLenum; imageSize: GLsizei; const bits: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetCompressedTextureImageEXT = procedure(texture: GLuint; target: GLenum; lod: GLint; img: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedMultiTexImage3DEXT = procedure(texunit: GLenum; target: GLenum; level: GLint; internalformat: GLenum; width: GLsizei; height: GLsizei; depth: GLsizei; border: GLint; imageSize: GLsizei; const bits: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedMultiTexImage2DEXT = procedure(texunit: GLenum; target: GLenum; level: GLint; internalformat: GLenum; width: GLsizei; height: GLsizei; border: GLint; imageSize: GLsizei; const bits: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedMultiTexImage1DEXT = procedure(texunit: GLenum; target: GLenum; level: GLint; internalformat: GLenum; width: GLsizei; border: GLint; imageSize: GLsizei; const bits: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedMultiTexSubImage3DEXT = procedure(texunit: GLenum; target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; zoffset: GLint; width: GLsizei; height: GLsizei; depth: GLsizei; format: GLenum; imageSize: GLsizei; const bits: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedMultiTexSubImage2DEXT = procedure(texunit: GLenum; target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; width: GLsizei; height: GLsizei; format: GLenum; imageSize: GLsizei; const bits: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCompressedMultiTexSubImage1DEXT = procedure(texunit: GLenum; target: GLenum; level: GLint; xoffset: GLint; width: GLsizei; format: GLenum; imageSize: GLsizei; const bits: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetCompressedMultiTexImageEXT = procedure(texunit: GLenum; target: GLenum; lod: GLint; img: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedProgramStringEXT = procedure(program_: GLuint; target: GLenum; format: GLenum; len: GLsizei; const string_: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedProgramLocalParameter4dEXT = procedure(program_: GLuint; target: GLenum; index_: GLuint; x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedProgramLocalParameter4dvEXT = procedure(program_: GLuint; target: GLenum; index_: GLuint; const params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedProgramLocalParameter4fEXT = procedure(program_: GLuint; target: GLenum; index_: GLuint; x: GLfloat; y: GLfloat; z: GLfloat; w: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedProgramLocalParameter4fvEXT = procedure(program_: GLuint; target: GLenum; index_: GLuint; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetNamedProgramLocalParameterdvEXT = procedure(program_: GLuint; target: GLenum; index_: GLuint; params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetNamedProgramLocalParameterfvEXT = procedure(program_: GLuint; target: GLenum; index_: GLuint; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetNamedProgramivEXT = procedure(program_: GLuint; target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetNamedProgramStringEXT = procedure(program_: GLuint; target: GLenum; pname: GLenum; string_: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedProgramLocalParameters4fvEXT = procedure(program_: GLuint; target: GLenum; index_: GLuint; count: GLsizei; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedProgramLocalParameterI4iEXT = procedure(program_: GLuint; target: GLenum; index_: GLuint; x: GLint; y: GLint; z: GLint; w: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedProgramLocalParameterI4ivEXT = procedure(program_: GLuint; target: GLenum; index_: GLuint; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedProgramLocalParametersI4ivEXT = procedure(program_: GLuint; target: GLenum; index_: GLuint; count: GLsizei; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedProgramLocalParameterI4uiEXT = procedure(program_: GLuint; target: GLenum; index_: GLuint; x: GLuint; y: GLuint; z: GLuint; w: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedProgramLocalParameterI4uivEXT = procedure(program_: GLuint; target: GLenum; index_: GLuint; const params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedProgramLocalParametersI4uivEXT = procedure(program_: GLuint; target: GLenum; index_: GLuint; count: GLsizei; const params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetNamedProgramLocalParameterIivEXT = procedure(program_: GLuint; target: GLenum; index_: GLuint; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetNamedProgramLocalParameterIuivEXT = procedure(program_: GLuint; target: GLenum; index_: GLuint; params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTextureParameterIivEXT = procedure(texture: GLuint; target: GLenum; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTextureParameterIuivEXT = procedure(texture: GLuint; target: GLenum; pname: GLenum; const params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTextureParameterIivEXT = procedure(texture: GLuint; target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTextureParameterIuivEXT = procedure(texture: GLuint; target: GLenum; pname: GLenum; params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexParameterIivEXT = procedure(texture: GLuint; target: GLenum; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexParameterIuivEXT = procedure(texture: GLuint; target: GLenum; pname: GLenum; const params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMultiTexParameterIivEXT = procedure(texture: GLuint; target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMultiTexParameterIuivEXT = procedure(texture: GLuint; target: GLenum; pname: GLenum; params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform1fEXT = procedure(program_: GLuint; location: GLint; v0: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform2fEXT = procedure(program_: GLuint; location: GLint; v0: GLfloat; v1: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform3fEXT = procedure(program_: GLuint; location: GLint; v0: GLfloat; v1: GLfloat; v2: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform4fEXT = procedure(program_: GLuint; location: GLint; v0: GLfloat; v1: GLfloat; v2: GLfloat; v3: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform1iEXT = procedure(program_: GLuint; location: GLint; v0: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform2iEXT = procedure(program_: GLuint; location: GLint; v0: GLint; v1: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform3iEXT = procedure(program_: GLuint; location: GLint; v0: GLint; v1: GLint; v2: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform4iEXT = procedure(program_: GLuint; location: GLint; v0: GLint; v1: GLint; v2: GLint; v3: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform1fvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform2fvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform3fvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform4fvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform1ivEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform2ivEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform3ivEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform4ivEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix2fvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix3fvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix4fvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix2x3fvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix3x2fvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix2x4fvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix4x2fvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix3x4fvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix4x3fvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform1uiEXT = procedure(program_: GLuint; location: GLint; v0: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform2uiEXT = procedure(program_: GLuint; location: GLint; v0: GLuint; v1: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform3uiEXT = procedure(program_: GLuint; location: GLint; v0: GLuint; v1: GLuint; v2: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform4uiEXT = procedure(program_: GLuint; location: GLint; v0: GLuint; v1: GLuint; v2: GLuint; v3: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform1uivEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform2uivEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform3uivEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform4uivEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedBufferDataEXT = procedure(buffer: GLuint; size: GLsizei; const data: PGLvoid; usage: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedBufferSubDataEXT = procedure(buffer: GLuint; offset: GLintptr; size: GLsizeiptr; const data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMapNamedBufferEXT = function(buffer: GLuint; access: GLenum): PGLvoid; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUnmapNamedBufferEXT = function(buffer: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMapNamedBufferRangeEXT = function(buffer: GLuint; offset: GLintptr; length: GLsizeiptr; access: GLbitfield): PGLvoid; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFlushMappedNamedBufferRangeEXT = procedure(buffer: GLuint; offset: GLintptr; length: GLsizeiptr); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedCopyBufferSubDataEXT = procedure(readBuffer: GLuint; writeBuffer: GLuint; readOffset: GLintptr; writeOffset: GLintptr; size: GLsizeiptr); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetNamedBufferParameterivEXT = procedure(buffer: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetNamedBufferPointervEXT = procedure(buffer: GLuint; pname: GLenum; params: PPGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetNamedBufferSubDataEXT = procedure(buffer: GLuint; offset: GLintptr; size: GLsizeiptr; data: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTextureBufferEXT = procedure(texture: GLuint; target: GLenum; internalformat: GLenum; buffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexBufferEXT = procedure(texunit: GLenum; target: GLenum; interformat: GLenum; buffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedRenderbufferStorageEXT = procedure(renderbuffer: GLuint; interformat: GLenum; width: GLsizei; height: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetNamedRenderbufferParameterivEXT = procedure(renderbuffer: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCheckNamedFramebufferStatusEXT = function(framebuffer: GLuint; target: GLenum): GLenum; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedFramebufferTexture1DEXT = procedure(framebuffer: GLuint; attachment: GLenum; textarget: GLenum; texture: GLuint; level: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedFramebufferTexture2DEXT = procedure(framebuffer: GLuint; attachment: GLenum; textarget: GLenum; texture: GLuint; level: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedFramebufferTexture3DEXT = procedure(framebuffer: GLuint; attachment: GLenum; textarget: GLenum; texture: GLuint; level: GLint; zoffset: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedFramebufferRenderbufferEXT = procedure(framebuffer: GLuint; attachment: GLenum; renderbuffertarget: GLenum; renderbuffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetNamedFramebufferAttachmentParameterivEXT = procedure(framebuffer: GLuint; attachment: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenerateTextureMipmapEXT = procedure(texture: GLuint; target: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenerateMultiTexMipmapEXT = procedure(texunit: GLenum; target: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFramebufferDrawBufferEXT = procedure(framebuffer: GLuint; mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFramebufferDrawBuffersEXT = procedure(framebuffer: GLuint; n: GLsizei; const bufs: PGLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFramebufferReadBufferEXT = procedure(framebuffer: GLuint; mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetFramebufferParameterivEXT = procedure(framebuffer: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedRenderbufferStorageMultisampleEXT = procedure(renderbuffer: GLuint; samples: GLsizei; internalformat: GLenum; width: GLsizei; height: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedRenderbufferStorageMultisampleCoverageEXT = procedure(renderbuffer: GLuint; coverageSamples: GLsizei; colorSamples: GLsizei; internalformat: GLenum; width: GLsizei; height: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedFramebufferTextureEXT = procedure(framebuffer: GLuint; attachment: GLenum; texture: GLuint; level: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedFramebufferTextureLayerEXT = procedure(framebuffer: GLuint; attachment: GLenum; texture: GLuint; level: GLint; layer: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNamedFramebufferTextureFaceEXT = procedure(framebuffer: GLuint; attachment: GLenum; texture: GLuint; level: GLint; face: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTextureRenderbufferEXT = procedure(texture: GLuint; target: GLenum; renderbuffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexRenderbufferEXT = procedure(texunit: GLenum; target: GLenum; renderbuffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform1dEXT = procedure(program_: GLuint; location: GLint; x: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform2dEXT = procedure(program_: GLuint; location: GLint; x: GLdouble; y: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform3dEXT = procedure(program_: GLuint; location: GLint; x: GLdouble; y: GLdouble; z: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform4dEXT = procedure(program_: GLuint; location: GLint; x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform1dvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform2dvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform3dvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform4dvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix2dvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix3dvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix4dvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix2x3dvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix2x4dvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix3x2dvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix3x4dvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix4x2dvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformMatrix4x3dvEXT = procedure(program_: GLuint; location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_separate_shader_objects
  TglUseShaderProgramEXT = procedure(_type: GLenum; _program: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglActiveProgramEXT = procedure(_program: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCreateShaderProgramEXT = function(_type: GLenum; const _string: PGLchar): GLuint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_shader_image_load_store
  TglBindImageTextureEXT = procedure(index: GLuint; texture: GLuint; level: GLint; layered: GLboolean; layer: GLint; access: GLenum; format: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMemoryBarrierEXT = procedure(barriers: GLbitfield); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_EXT_vertex_attrib_64bit
  TglVertexAttribL1dEXT = procedure(index: GLuint; x: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL2dEXT = procedure(index: GLuint; x: GLdouble; y: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL3dEXT = procedure(index: GLuint; x: GLdouble; y: GLdouble; z: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL4dEXT = procedure(index: GLuint; x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL1dvEXT = procedure(index: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL2dvEXT = procedure(index: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL3dvEXT = procedure(index: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL4dvEXT = procedure(index: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribLPointerEXT = procedure(index: GLuint; size: GLint; type_: GLenum; stride: GLsizei; const pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVertexAttribLdvEXT = procedure(index: GLuint; pname: GLenum; params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexArrayVertexAttribLOffsetEXT = procedure(vaobj: GLuint; buffer: GLuint; index: GLuint; size: GLint; type_: GLenum; stride: GLsizei; offset: GLintptr); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_IBM_multimode_draw_arrays
  TglMultiModeDrawArraysIBM = procedure(mode: GLenum; const first: PGLint; const count: PGLsizei; primcount: GLsizei; modestride: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiModeDrawElementsIBM = procedure(const mode: PGLenum; const count: PGLsizei; _type: GLenum; const indices: PGLvoid; primcount: GLsizei; modestride: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_IBM_vertex_array_lists
  TglColorPointerListIBM = procedure(size: GLint; _type: GLenum; stride: GLint; const _pointer: PGLvoid; ptrstride: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColorPointerListIBM = procedure(size: GLint; _type: GLenum; stride: GLint; const _pointer: PGLvoid; ptrstride: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEdgeFlagPointerListIBM = procedure(stride: GLint; const _pointer: PGLboolean; ptrstride: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFogCoordPointerListIBM = procedure(_type: GLenum; stride: GLint; const _pointer: PGLvoid; ptrstride: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIndexPointerListIBM = procedure(_type: GLenum; stride: GLint; const _pointer: PGLvoid; ptrstride: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormalPointerListIBM = procedure(_type: GLenum; stride: GLint; const _pointer: PGLvoid; ptrstride: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoordPointerListIBM = procedure(size: GLint; _type: GLenum; stride: GLint; const _pointer: PGLvoid; ptrstride: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexPointerListIBM = procedure(size: GLint; _type: GLenum; stride: GLint; const _pointer: PGLvoid; ptrstride: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_INGR_blend_func_separate
  TglBlendFuncSeparateINGR = procedure(sfactorRGB: GLenum; dfactorRGB: GLenum; sfactorAlpha: GLenum; dfactorAlpha: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_INTEL_parallel_arrays
  TglVertexPointervINTEL = procedure(size: GLint; _type: GLenum; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormalPointervINTEL = procedure(_type: GLenum; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColorPointervINTEL = procedure(size: GLint; _type: GLenum; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoordPointervINTEL = procedure(size: GLint; _type: GLenum; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_MESA_resize_buffers
  TglResizeBuffersMESA = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_MESA_window_pos
  TglWindowPos2dMESA = procedure(x: GLdouble; y: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2dvMESA = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2fMESA = procedure(x: GLfloat; y: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2fvMESA = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2iMESA = procedure(x: GLint; y: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2ivMESA = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2sMESA = procedure(x: GLshort; y: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos2svMESA = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3dMESA = procedure(x: GLdouble; y: GLdouble; z: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3dvMESA = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3fMESA = procedure(x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3fvMESA = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3iMESA = procedure(x: GLint; y: GLint; z: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3ivMESA = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3sMESA = procedure(x: GLshort; y: GLshort; z: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos3svMESA = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos4dMESA = procedure(x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos4dvMESA = procedure(const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos4fMESA = procedure(x: GLfloat; y: GLfloat; z: GLfloat; w: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos4fvMESA = procedure(const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos4iMESA = procedure(x: GLint; y: GLint; z: GLint; w: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos4ivMESA = procedure(const v: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos4sMESA = procedure(x: GLshort; y: GLshort; z: GLshort; w: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglWindowPos4svMESA = procedure(const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_evaluators
  TglMapControlPointsNV = procedure(target: GLenum; index: GLuint; _type: GLenum; ustride: GLsizei; vstride: GLsizei; uorder: GLint; vorder: GLint; _packed: GLboolean; const points: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMapParameterivNV = procedure(target: GLenum; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMapParameterfvNV = procedure(target: GLenum; pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMapControlPointsNV = procedure(target: GLenum; index: GLuint; _type: GLenum; ustride: GLsizei; vstride: GLsizei; _packed: GLboolean; points: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMapParameterivNV = procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMapParameterfvNV = procedure(target: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMapAttribParameterivNV = procedure(target: GLenum; index: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetMapAttribParameterfvNV = procedure(target: GLenum; index: GLuint; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEvalMapsNV = procedure(target: GLenum; mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_fence
  TglDeleteFencesNV = procedure(n: GLsizei; const fences: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenFencesNV = procedure(n: GLsizei; fences: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsFenceNV = function(fence: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTestFenceNV = function(fence: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetFenceivNV = procedure(fence: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFinishFenceNV = procedure(fence: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSetFenceNV = procedure(fence: GLuint; condition: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_fragment_program
  TglProgramNamedParameter4fNV = procedure(id: GLuint; len: GLsizei; const name: PGLubyte; x: GLfloat; y: GLfloat; z: GLfloat; w: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramNamedParameter4dNV = procedure(id: GLuint; len: GLsizei; const name: PGLubyte; x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramNamedParameter4fvNV = procedure(id: GLuint; len: GLsizei; const name: PGLubyte; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramNamedParameter4dvNV = procedure(id: GLuint; len: GLsizei; const name: PGLubyte; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramNamedParameterfvNV = procedure(id: GLuint; len: GLsizei; const name: PGLubyte; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramNamedParameterdvNV = procedure(id: GLuint; len: GLsizei; const name: PGLubyte; params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_half_float
  TglVertex2hNV = procedure(x: GLhalfNV; y: GLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex2hvNV = procedure(const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex3hNV = procedure(x: GLhalfNV; y: GLhalfNV; z: GLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex3hvNV = procedure(const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex4hNV = procedure(x: GLhalfNV; y: GLhalfNV; z: GLhalfNV; w: GLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertex4hvNV = procedure(const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormal3hNV = procedure(nx: GLhalfNV; ny: GLhalfNV; nz: GLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormal3hvNV = procedure(const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor3hNV = procedure(red: GLhalfNV; green: GLhalfNV; blue: GLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor3hvNV = procedure(const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4hNV = procedure(red: GLhalfNV; green: GLhalfNV; blue: GLhalfNV; alpha: GLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4hvNV = procedure(const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord1hNV = procedure(s: GLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord1hvNV = procedure(const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord2hNV = procedure(s: GLhalfNV; t: GLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord2hvNV = procedure(const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord3hNV = procedure(s: GLhalfNV; t: GLhalfNV; r: GLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord3hvNV = procedure(const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord4hNV = procedure(s: GLhalfNV; t: GLhalfNV; r: GLhalfNV; q: GLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord4hvNV = procedure(const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord1hNV = procedure(target: GLenum; s: GLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord1hvNV = procedure(target: GLenum; const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord2hNV = procedure(target: GLenum; s: GLhalfNV; t: GLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord2hvNV = procedure(target: GLenum; const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord3hNV = procedure(target: GLenum; s: GLhalfNV; t: GLhalfNV; r: GLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord3hvNV = procedure(target: GLenum; const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord4hNV = procedure(target: GLenum; s: GLhalfNV; t: GLhalfNV; r: GLhalfNV; q: GLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMultiTexCoord4hvNV = procedure(target: GLenum; const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFogCoordhNV = procedure(fog: GLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFogCoordhvNV = procedure(const fog: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3hNV = procedure(red: GLhalfNV; green: GLhalfNV; blue: GLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColor3hvNV = procedure(const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexWeighthNV = procedure(weight: GLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexWeighthvNV = procedure(const weight: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib1hNV = procedure(index: GLuint; x: GLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib1hvNV = procedure(index: GLuint; const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib2hNV = procedure(index: GLuint; x: GLhalfNV; y: GLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib2hvNV = procedure(index: GLuint; const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib3hNV = procedure(index: GLuint; x: GLhalfNV; y: GLhalfNV; z: GLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib3hvNV = procedure(index: GLuint; const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4hNV = procedure(index: GLuint; x: GLhalfNV; y: GLhalfNV; z: GLhalfNV; w: GLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4hvNV = procedure(index: GLuint; const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribs1hvNV = procedure(index: GLuint; n: GLsizei; const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribs2hvNV = procedure(index: GLuint; n: GLsizei; const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribs3hvNV = procedure(index: GLuint; n: GLsizei; const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribs4hvNV = procedure(index: GLuint; n: GLsizei; const v: PGLhalfNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_occlusion_query
  TglGenOcclusionQueriesNV = procedure(n: GLsizei; ids: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteOcclusionQueriesNV = procedure(n: GLsizei; const ids: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsOcclusionQueryNV = function(id: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBeginOcclusionQueryNV = procedure(id: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEndOcclusionQueryNV = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetOcclusionQueryivNV = procedure(id: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetOcclusionQueryuivNV = procedure(id: GLuint; pname: GLenum; params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_pixel_data_range
  TglPixelDataRangeNV = procedure(target: GLenum; length: GLsizei; _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFlushPixelDataRangeNV = procedure(target: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_point_sprite
  TglPointParameteriNV = procedure(pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPointParameterivNV = procedure(pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_primitive_restart
  TglPrimitiveRestartNV = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPrimitiveRestartIndexNV = procedure(index: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_register_combiners
  TglCombinerParameterfvNV = procedure(pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCombinerParameterfNV = procedure(pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCombinerParameterivNV = procedure(pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCombinerParameteriNV = procedure(pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCombinerInputNV = procedure(stage: GLenum; portion: GLenum; variable: GLenum; input: GLenum; mapping: GLenum; componentUsage: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCombinerOutputNV = procedure(stage: GLenum; portion: GLenum; abOutput: GLenum; cdOutput: GLenum; sumOutput: GLenum; scale: GLenum; bias: GLenum; abDotProduct: GLboolean; cdDotProduct: GLboolean; muxSum: GLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFinalCombinerInputNV = procedure(variable: GLenum; input: GLenum; mapping: GLenum; componentUsage: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetCombinerInputParameterfvNV = procedure(stage: GLenum; portion: GLenum; variable: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetCombinerInputParameterivNV = procedure(stage: GLenum; portion: GLenum; variable: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetCombinerOutputParameterfvNV = procedure(stage: GLenum; portion: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetCombinerOutputParameterivNV = procedure(stage: GLenum; portion: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetFinalCombinerInputParameterfvNV = procedure(variable: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetFinalCombinerInputParameterivNV = procedure(variable: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_register_combiners2
  TglCombinerStageParameterfvNV = procedure(stage: GLenum; pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetCombinerStageParameterfvNV = procedure(stage: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_vertex_array_range
  TglFlushVertexArrayRangeNV = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexArrayRangeNV = procedure(length: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_vertex_program
  TglAreProgramsResidentNV = function(n: GLsizei; const programs: PGLuint; residences: PGLboolean): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindProgramNV = procedure(target: GLenum; id: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteProgramsNV = procedure(n: GLsizei; const programs: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglExecuteProgramNV = procedure(target: GLenum; id: GLuint; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenProgramsNV = procedure(n: GLsizei; programs: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramParameterdvNV = procedure(target: GLenum; index: GLuint; pname: GLenum; params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramParameterfvNV = procedure(target: GLenum; index: GLuint; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramivNV = procedure(id: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramStringNV = procedure(id: GLuint; pname: GLenum; _program: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTrackMatrixivNV = procedure(target: GLenum; address: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVertexAttribdvNV = procedure(index: GLuint; pname: GLenum; params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVertexAttribfvNV = procedure(index: GLuint; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVertexAttribivNV = procedure(index: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVertexAttribPointervNV = procedure(index: GLuint; pname: GLenum; _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsProgramNV = function(id: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLoadProgramNV = procedure(target: GLenum; id: GLuint; len: GLsizei; const _program: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramParameter4dNV = procedure(target: GLenum; index: GLuint; x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramParameter4dvNV = procedure(target: GLenum; index: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramParameter4fNV = procedure(target: GLenum; index: GLuint; x: GLfloat; y: GLfloat; z: GLfloat; w: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramParameter4fvNV = procedure(target: GLenum; index: GLuint; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramParameters4dvNV = procedure(target: GLenum; index: GLuint; count: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramParameters4fvNV = procedure(target: GLenum; index: GLuint; count: GLuint; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglRequestResidentProgramsNV = procedure(n: GLsizei; const programs: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTrackMatrixNV = procedure(target: GLenum; address: GLuint; matrix: GLenum; transform: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribPointerNV = procedure(index: GLuint; fsize: GLint; _type: GLenum; stride: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib1dNV = procedure(index: GLuint; x: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib1dvNV = procedure(index: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib1fNV = procedure(index: GLuint; x: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib1fvNV = procedure(index: GLuint; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib1sNV = procedure(index: GLuint; x: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib1svNV = procedure(index: GLuint; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib2dNV = procedure(index: GLuint; x: GLdouble; y: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib2dvNV = procedure(index: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib2fNV = procedure(index: GLuint; x: GLfloat; y: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib2fvNV = procedure(index: GLuint; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib2sNV = procedure(index: GLuint; x: GLshort; y: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib2svNV = procedure(index: GLuint; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib3dNV = procedure(index: GLuint; x: GLdouble; y: GLdouble; z: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib3dvNV = procedure(index: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib3fNV = procedure(index: GLuint; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib3fvNV = procedure(index: GLuint; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib3sNV = procedure(index: GLuint; x: GLshort; y: GLshort; z: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib3svNV = procedure(index: GLuint; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4dNV = procedure(index: GLuint; x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4dvNV = procedure(index: GLuint; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4fNV = procedure(index: GLuint; x: GLfloat; y: GLfloat; z: GLfloat; w: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4fvNV = procedure(index: GLuint; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4sNV = procedure(index: GLuint; x: GLshort; y: GLshort; z: GLshort; w: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4svNV = procedure(index: GLuint; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4ubNV = procedure(index: GLuint; x: GLubyte; y: GLubyte; z: GLubyte; w: GLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttrib4ubvNV = procedure(index: GLuint; const v: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribs1dvNV = procedure(index: GLuint; count: GLsizei; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribs1fvNV = procedure(index: GLuint; count: GLsizei; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribs1svNV = procedure(index: GLuint; count: GLsizei; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribs2dvNV = procedure(index: GLuint; count: GLsizei; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribs2fvNV = procedure(index: GLuint; count: GLsizei; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribs2svNV = procedure(index: GLuint; count: GLsizei; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribs3dvNV = procedure(index: GLuint; count: GLsizei; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribs3fvNV = procedure(index: GLuint; count: GLsizei; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribs3svNV = procedure(index: GLuint; count: GLsizei; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribs4dvNV = procedure(index: GLuint; count: GLsizei; const v: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribs4fvNV = procedure(index: GLuint; count: GLsizei; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribs4svNV = procedure(index: GLuint; count: GLsizei; const v: PGLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribs4ubvNV = procedure(index: GLuint; count: GLsizei; const v: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_depth_buffer_float
  TglDepthRangedNV = procedure(n: GLdouble; f: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglClearDepthdNV = procedure(d: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDepthBoundsdNV = procedure(zmin: GLdouble; zmax: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_framebuffer_multisample_coverage
  TglRenderbufferStorageMultsampleCoverageNV = procedure(target: GLenum; coverageSamples: GLsizei; colorSamples: GLsizei; internalformat: GLenum; width: GLsizei; height: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_geometry_program4
  TglProgramVertexLimitNV = procedure(target: GLenum; limit: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_gpu_program4
  TglProgramLocalParameterI4iNV = procedure(target: GLenum; index: GLuint; x: GLint; y: GLint; z: GLint; w: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramLocalParameterI4ivNV = procedure(target: GLenum; index: GLuint; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramLocalParametersI4ivNV = procedure(target: GLenum; index: GLuint; count: GLsizei; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramLocalParameterI4uiNV = procedure(target: GLenum; index: GLuint; x: GLuint; y: GLuint; z: GLuint; w: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramLocalParameterI4uivNV = procedure(target: GLenum; index: GLuint; const params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramLocalParametersI4uivNV = procedure(target: GLenum; index: GLuint; count: GLsizei; const params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramEnvParameterI4iNV = procedure(target: GLenum; index: GLuint; x: GLint; y: GLint; z: GLint; w: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramEnvParameterI4ivNV = procedure(target: GLenum; index: GLuint; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramEnvParametersI4ivNV = procedure(target: GLenum; index: GLuint; count: GLsizei; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramEnvParameterI4uiNV = procedure(target: GLenum; index: GLuint; x: GLuint; y: GLuint; z: GLuint; w: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramEnvParameterI4uivNV = procedure(target: GLenum; index: GLuint; const params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramEnvParametersI4uivNV = procedure(target: GLenum; index: GLuint; count: GLsizei; const params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramLocalParameterIivNV = procedure(target: GLenum; index: GLuint; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramLocalParameterIuivNV = procedure(target: GLenum; index: GLuint; params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramEnvParameterIivNV = procedure(target: GLenum; index: GLuint; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramEnvParameterIuivNV = procedure(target: GLenum; index: GLuint; params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_parameter_buffer_object
  TglProgramBufferParametersfvNV = procedure(target: GLenum; buffer: GLuint; index: GLuint; count: GLsizei; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramBufferParametersIivNV = procedure(target: GLenum; buffer: GLuint; index: GLuint; count: GLsizei; const params: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramBufferParametersIuivNV = procedure(target: GLenum; buffer: GLuint; index: GLuint; count: GLuint; const params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_transform_feedback
  TglBeginTransformFeedbackNV = procedure(primitiveMode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEndTransformFeedbackNV = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTransformFeedbackAttribsNV = procedure(count: GLsizei; const attribs: GLint; bufferMode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindBufferRangeNV = procedure(target: GLenum; index: GLuint; buffer: GLuint; offset: GLintptr; size: GLsizeiptr); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindBufferOffsetNV = procedure(target: GLenum; index: GLuint; buffer: GLuint; offset: GLintptr); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindBufferBaseNV = procedure(target: GLenum; index: GLuint; buffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTransformFeedbackVaryingsNV = procedure(program_: GLuint; count: GLsizei; const locations: PGLint; bufferMode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglActiveVaryingNV = procedure(program_: GLuint; const name: PGLchar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVaryingLocationNV = function(program_: GLuint; const name: PGLchar): GLint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetActiveVaryingNV = procedure(program_: GLuint; index: GLuint; bufSize: GLsizei; length: PGLsizei; size: PGLsizei; _type: PGLenum; name: PGLchar); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetTransformFeedbackVaryingNV = procedure(program_: GLuint; index: GLuint; location: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTransformFeedbackStreamAttribsNV = procedure(count: GLsizei; const attribs: PGLint; nbuffers: GLsizei; const bufstreams: PGLint; bufferMode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_conditional_render
  TglBeginConditionalRenderNV = procedure(id: GLuint; mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEndConditionalRenderNV = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_present_video
  TglPresentFrameKeyedNV = procedure(video_slot: GLuint; minPresentTime: GLuint64EXT; beginPresentTimeId: GLuint; presentDuratioId: GLuint; type_: GLenum; target0: GLenum; fill0: GLuint; key0: GLuint; target1: GLenum; fill1: GLuint; key1: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPresentFrameDualFillNV = procedure(video_slot: GLuint; minPresentTime: GLuint64EXT; beginPresentTimeId: GLuint; presentDurationId: GLuint; type_: GLenum; target0: GLenum; fill0: GLuint; target1: GLenum; fill1: GLuint; target2: GLenum; fill2: GLuint; target3: GLenum; fill3: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVideoivNV = procedure(video_slot: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVideouivNV = procedure(video_slot: GLuint; pname: GLenum; params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVideoi64vNV = procedure(video_slot: GLuint; pname: GLenum; params: PGLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVideoui64vNV = procedure(video_slot: GLuint; pname: GLenum; params: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
//  TglVideoParameterivNV = procedure(video_slot: GLuint; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  
  // GL_NV_explicit_multisample
  TglGetMultisamplefvNV = procedure (pname: GLenum; index: GLuint; val: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSampleMaskIndexedNV = procedure (index: GLuint; mask: GLbitfield); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexRenderbufferNV = procedure (target: GLenum; renderbuffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_transform_feedback2
  TglBindTransformFeedbackNV = procedure(target: GLenum; id: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteTransformFeedbacksNV = procedure(n: GLsizei; ids: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenTransformFeedbacksNV = procedure(n: GLsizei; ids: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsTransformFeedbackNV = function (id: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPauseTransformFeedbackNV = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglResumeTransformFeedbackNV = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDrawTransformFeedbackNV = procedure(mode: GLenum; id: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_video_capture
  TglBeginVideoCaptureNV = procedure(video_capture_slot: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindVideoCaptureStreamBufferNV = procedure(video_capture_slot: GLuint; stream: GLuint; frame_region: GLenum; offset: GLintptrARB); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglBindVideoCaptureStreamTextureNV = procedure(video_capture_slot: GLuint; stream: GLuint; frame_region: GLenum; target: GLenum; texture: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEndVideoCaptureNV = procedure(video_capture_slot: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVideoCaptureivNV = procedure(video_capture_slot: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVideoCaptureStreamivNV = procedure(video_capture_slot: GLuint; stream: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVideoCaptureStreamfvNV = procedure(video_capture_slot: GLuint; stream: GLuint; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVideoCaptureStreamdvNV = procedure(video_capture_slot: GLuint; stream: GLuint; pname: GLenum; params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVideoCaptureNV = function(video_capture_slot: GLuint; sequence_num: PGLuint; capture_time: PGLuint64EXT): GLenum; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVideoCaptureStreamParameterivNV = procedure(video_capture_slot: GLuint; stream: GLuint; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVideoCaptureStreamParameterfvNV = procedure(video_capture_slot: GLuint; stream: GLuint; pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVideoCaptureStreamParameterdvNV = procedure(video_capture_slot: GLuint; stream: GLuint; pname: GLenum; const params: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_copy_image
  TglCopyImageSubDataNV = procedure(srcName: GLuint; srcTarget: GLenum; srcLevel: GLint; srcX: GLint; srcY: GLint; srcZ: GLint; dstName: GLuint; dstTarget: GLenum; dstLevel: GLint; dstX: GLint; dstY: GLint; dstZ: GLint; width: GLsizei; height: GLsizei; depth: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_shader_buffer_load
  TglMakeBufferResidentNV = procedure(target: GLenum; access: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMakeBufferNonResidentNV = procedure(target: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsBufferResidentNV = function(target: GLenum): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMakeNamedBufferResidentNV = procedure(buffer: GLuint; access: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglMakeNamedBufferNonResidentNV = procedure(buffer: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsNamedBufferResidentNV = function(buffer: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetBufferParameterui64vNV = procedure(target: GLenum; pname: GLenum; params: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetNamedBufferParameterui64vNV = procedure(buffer: GLuint; pname: GLenum; params: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetIntegerui64vNV = procedure(value: GLenum; result: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformui64NV = procedure(location: GLint; value: GLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniformui64vNV = procedure(location: GLint; count: GLsizei; const value: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetUniformui64vNV = procedure(_program: GLuint; location: GLint; params: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformui64NV = procedure(_program: GLuint; location: GLint; value: GLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniformui64vNV = procedure(_program: GLuint; location: GLint; count: GLsizei; const value: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_vertex_buffer_unified_memory
  TglBufferAddressRangeNV = procedure(pname: GLenum; index: GLuint; adress: GLuint64EXT; length: GLsizeiptr); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexFormatNV = procedure(size: GLint; _type: GLenum; stride: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormalFormatNV = procedure(_type: GLenum; stride: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColorFormatNV = procedure(size: GLint; _type: GLenum; stride: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIndexFormatNV = procedure(_type: GLenum; stride: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoordFormatNV = procedure(size: GLint; _type: GLenum; stride: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglEdgeFlagFormatNV = procedure(stride: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSecondaryColorFormatNV = procedure(size: GLint; _type: GLenum; stride: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFogCoordFormatNV = procedure(_type: GLenum; stride: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribFormatNV = procedure(index: GLuint; size: GLint; _type: GLenum; normalized: GLboolean; stride: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribIFormatNV = procedure(index: GLuint; size: GLint; _type: GLenum; stride: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetIntegerui64i_vNV = procedure(value: GLenum; index: GLuint; Result: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_gpu_program5
  TglProgramSubroutineParametersuivNV = procedure(target: GLenum; count: GLsizei; const params: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetProgramSubroutineParameteruivNV = procedure(target: GLenum; index: GLuint; param: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_gpu_shader5
  TglUniform1i64NV = procedure(location: GLint; x: GLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform2i64NV = procedure(location: GLint; x: GLint64EXT; y: GLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform3i64NV = procedure(location: GLint; x: GLint64EXT; y: GLint64EXT; z: GLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform4i64NV = procedure(location: GLint; x: GLint64EXT; y: GLint64EXT; z: GLint64EXT; w: GLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform1i64vNV = procedure(location: GLint; count: GLsizei; const value: PGLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform2i64vNV = procedure(location: GLint; count: GLsizei; const value: PGLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform3i64vNV = procedure(location: GLint; count: GLsizei; const value: PGLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform4i64vNV = procedure(location: GLint; count: GLsizei; const value: PGLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform1ui64NV = procedure(location: GLint; x: GLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform2ui64NV = procedure(location: GLint; x: GLuint64EXT; y: GLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform3ui64NV = procedure(location: GLint; x: GLuint64EXT; y: GLuint64EXT; z: GLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform4ui64NV = procedure(location: GLint; x: GLuint64EXT; y: GLuint64EXT; z: GLuint64EXT; w: GLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform1ui64vNV = procedure(location: GLint; count: GLsizei; const value: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform2ui64vNV = procedure(location: GLint; count: GLsizei; const value: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform3ui64vNV = procedure(location: GLint; count: GLsizei; const value: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglUniform4ui64vNV = procedure(location: GLint; count: GLsizei; const value: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetUniformi64vNV = procedure(program_: GLuint; location: GLint; params: PGLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform1i64NV = procedure(program_: GLuint; location: GLint; x: GLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform2i64NV = procedure(program_: GLuint; location: GLint; x: GLint64EXT; y: GLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform3i64NV = procedure(program_: GLuint; location: GLint; x: GLint64EXT; y: GLint64EXT; z: GLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform4i64NV = procedure(program_: GLuint; location: GLint; x: GLint64EXT; y: GLint64EXT; z: GLint64EXT; w: GLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform1i64vNV = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform2i64vNV = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform3i64vNV = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform4i64vNV = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform1ui64NV = procedure(program_: GLuint; location: GLint; x: GLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform2ui64NV = procedure(program_: GLuint; location: GLint; x: GLuint64EXT; y: GLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform3ui64NV = procedure(program_: GLuint; location: GLint; x: GLuint64EXT; y: GLuint64EXT; z: GLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform4ui64NV = procedure(program_: GLuint; location: GLint; x: GLuint64EXT; y: GLuint64EXT; z: GLuint64EXT; w: GLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform1ui64vNV = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform2ui64vNV = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform3ui64vNV = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglProgramUniform4ui64vNV = procedure(program_: GLuint; location: GLint; count: GLsizei; const value: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_vertex_attrib_integer_64bit
  TglVertexAttribL1i64NV = procedure(index: GLuint; x: GLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL2i64NV = procedure(index: GLuint; x: GLint64EXT; y: GLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL3i64NV = procedure(index: GLuint; x: GLint64EXT; y: GLint64EXT; z: GLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL4i64NV = procedure(index: GLuint; x: GLint64EXT; y: GLint64EXT; z: GLint64EXT; w: GLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL1i64vNV = procedure(index: GLuint; const v: PGLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL2i64vNV = procedure(index: GLuint; const v: PGLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL3i64vNV = procedure(index: GLuint; const v: PGLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL4i64vNV = procedure(index: GLuint; const v: PGLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL1ui64NV = procedure(index: GLuint; x: GLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL2ui64NV = procedure(index: GLuint; x: GLuint64EXT; y: GLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL3ui64NV = procedure(index: GLuint; x: GLuint64EXT; y: GLuint64EXT; z: GLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL4ui64NV = procedure(index: GLuint; x: GLuint64EXT; y: GLuint64EXT; z: GLuint64EXT; w: GLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL1ui64vNV = procedure(index: GLuint; const v: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL2ui64vNV = procedure(index: GLuint; const v: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL3ui64vNV = procedure(index: GLuint; const v: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribL4ui64vNV = procedure(index: GLuint; const v: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVertexAttribLi64vNV = procedure(index: GLuint; pname: GLenum; params: PGLint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetVertexAttribLui64vNV = procedure(index: GLuint; pname: GLenum; params: PGLuint64EXT); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVertexAttribLFormatNV = procedure(index: GLuint; size: GLint; type_: GLenum; stride: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_vdpau_interop
  TglVDPAUInitNV = procedure(const vdpDevice: PGLvoid; const getProcAddress: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVDPAUFiniNV = procedure; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVDPAURegisterVideoSurfaceNV = function(vdpSurface: PGLvoid; target: GLenum; numTextureNames: GLsizei; const textureNames: PGLuint): GLvdpauSurfaceNV; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVDPAURegisterOutputSurfaceNV = function(vdpSurface: PGLvoid; target: GLenum; numTextureNames: GLsizei; const textureNames: PGLuint): GLvdpauSurfaceNV; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVDPAUIsSurfaceNV = procedure(surface: GLvdpauSurfaceNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVDPAUUnregisterSurfaceNV = procedure(surface: GLvdpauSurfaceNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVDPAUGetSurfaceivNV = procedure(surface: GLvdpauSurfaceNV; pname: GLenum; bufSize: GLsizei; length: PGLsizei; values: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVDPAUSurfaceAccessNV = procedure(surface: GLvdpauSurfaceNV; access: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVDPAUMapSurfacesNV = procedure(numSurfaces: GLsizei; const surfaces: PGLvdpauSurfaceNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglVDPAUUnmapSurfacesNV = procedure(numSurface: GLsizei; const surfaces: PGLvdpauSurfaceNV); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_NV_texture_barrier
  TglTextureBarrierNV = procedure; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_PGI_misc_hints
  TglHintPGI = procedure(target: GLenum; mode: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGIS_detail_texture
  TglDetailTexFuncSGIS = procedure(target: GLenum; n: GLsizei; const points: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetDetailTexFuncSGIS = procedure(target: GLenum; points: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGIS_fog_function
  TglFogFuncSGIS = procedure(n: GLsizei; const points: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetFogFuncSGIS = procedure(points: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGIS_multisample
  TglSampleMaskSGIS = procedure(value: GLclampf; invert: GLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSamplePatternSGIS = procedure(pattern: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGIS_pixel_texture
  TglPixelTexGenParameteriSGIS = procedure(pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPixelTexGenParameterivSGIS = procedure(pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPixelTexGenParameterfSGIS = procedure(pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPixelTexGenParameterfvSGIS = procedure(pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetPixelTexGenParameterivSGIS = procedure(pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetPixelTexGenParameterfvSGIS = procedure(pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGIS_point_parameters
  TglPointParameterfSGIS = procedure(pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPointParameterfvSGIS = procedure(pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGIS_sharpen_texture
  TglSharpenTexFuncSGIS = procedure(target: GLenum; n: GLsizei; const points: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetSharpenTexFuncSGIS = procedure(target: GLenum; points: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGIS_texture4D
  TglTexImage4DSGIS = procedure(target: GLenum; level: GLint; internalformat: GLenum; width: GLsizei; height: GLsizei; depth: GLsizei; size4d: GLsizei; border: GLint; format: GLenum; _type: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexSubImage4DSGIS = procedure(target: GLenum; level: GLint; xoffset: GLint; yoffset: GLint; zoffset: GLint; woffset: GLint; width: GLsizei; height: GLsizei; depth: GLsizei; size4d: GLsizei; format: GLenum; _type: GLenum; const pixels: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGIS_texture_color_mask
  TglTextureColorMaskSGIS = procedure(red: GLboolean; green: GLboolean; blue: GLboolean; alpha: GLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGIS_texture_filter4
  TglGetTexFilterFuncSGIS = procedure(target: GLenum; filter: GLenum; weights: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexFilterFuncSGIS = procedure(target: GLenum; filter: GLenum; n: GLsizei; const weights: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGIX_async
  TglAsyncMarkerSGIX = procedure(marker: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFinishAsyncSGIX = function(markerp: PGLuint): GLint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPollAsyncSGIX = function(markerp: PGLuint): GLint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGenAsyncMarkersSGIX = function(range: GLsizei): GLuint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeleteAsyncMarkersSGIX = procedure(marker: GLuint; range: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglIsAsyncMarkerSGIX = function(marker: GLuint): GLboolean; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGIX_flush_raster
  TglFlushRasterSGIX = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGIX_fragment_lighting
  TglFragmentColorMaterialSGIX = procedure(face: GLenum; mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFragmentLightfSGIX = procedure(light: GLenum; pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFragmentLightfvSGIX = procedure(light: GLenum; pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFragmentLightiSGIX = procedure(light: GLenum; pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFragmentLightivSGIX = procedure(light: GLenum; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFragmentLightModelfSGIX = procedure(pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFragmentLightModelfvSGIX = procedure(pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFragmentLightModeliSGIX = procedure(pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFragmentLightModelivSGIX = procedure(pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFragmentMaterialfSGIX = procedure(face: GLenum; pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFragmentMaterialfvSGIX = procedure(face: GLenum; pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFragmentMaterialiSGIX = procedure(face: GLenum; pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglFragmentMaterialivSGIX = procedure(face: GLenum; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetFragmentLightfvSGIX = procedure(light: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetFragmentLightivSGIX = procedure(light: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetFragmentMaterialfvSGIX = procedure(face: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetFragmentMaterialivSGIX = procedure(face: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLightEnviSGIX = procedure(pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGIX_framezoom
  TglFrameZoomSGIX = procedure(factor: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGIX_igloo_interface
  TglIglooInterfaceSGIX = procedure(pname: GLenum; const params: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGIX_instruments
  TglGetInstrumentsSGIX = function(): GLint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglInstrumentsBufferSGIX = procedure(size: GLsizei; buffer: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglPollInstrumentsSGIX = function(marker_p: PGLint): GLint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReadInstrumentsSGIX = procedure(marker: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglStartInstrumentsSGIX = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglStopInstrumentsSGIX = procedure(marker: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGIX_list_priority
  TglGetListParameterfvSGIX = procedure(list: GLuint; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetListParameterivSGIX = procedure(list: GLuint; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglListParameterfSGIX = procedure(list: GLuint; pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglListParameterfvSGIX = procedure(list: GLuint; pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglListParameteriSGIX = procedure(list: GLuint; pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglListParameterivSGIX = procedure(list: GLuint; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGIX_pixel_texture
  TglPixelTexGenSGIX = procedure(mode: GLenum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGIX_polynomial_ffd
  TglDeformationMap3dSGIX = procedure(target: GLenum; u1: GLdouble; u2: GLdouble; ustride: GLint; uorder: GLint; v1: GLdouble; v2: GLdouble; vstride: GLint; vorder: GLint; w1: GLdouble; w2: GLdouble; wstride: GLint; worder: GLint; const points: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeformationMap3fSGIX = procedure(target: GLenum; u1: GLfloat; u2: GLfloat; ustride: GLint; uorder: GLint; v1: GLfloat; v2: GLfloat; vstride: GLint; vorder: GLint; w1: GLfloat; w2: GLfloat; wstride: GLint; worder: GLint; const points: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglDeformSGIX = procedure(mask: GLbitfield); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglLoadIdentityDeformationMapSGIX = procedure(mask: GLbitfield); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGIX_reference_plane
  TglReferencePlaneSGIX = procedure(const equation: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGIX_sprite
  TglSpriteParameterfSGIX = procedure(pname: GLenum; param: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSpriteParameterfvSGIX = procedure(pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSpriteParameteriSGIX = procedure(pname: GLenum; param: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglSpriteParameterivSGIX = procedure(pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGIX_tag_sample_buffer
  TglTagSampleBufferSGIX = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SGI_color_table
  TglColorTableSGI = procedure(target: GLenum; internalformat: GLenum; width: GLsizei; format: GLenum; _type: GLenum; const table: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColorTableParameterfvSGI = procedure(target: GLenum; pname: GLenum; const params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColorTableParameterivSGI = procedure(target: GLenum; pname: GLenum; const params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglCopyColorTableSGI = procedure(target: GLenum; internalformat: GLenum; x: GLint; y: GLint; width: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetColorTableSGI = procedure(target: GLenum; format: GLenum; _type: GLenum; table: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetColorTableParameterfvSGI = procedure(target: GLenum; pname: GLenum; params: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGetColorTableParameterivSGI = procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SUNX_constant_data
  TglFinishTextureSUNX = procedure(); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SUN_global_alpha
  TglGlobalAlphaFactorbSUN = procedure(factor: GLbyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGlobalAlphaFactorsSUN = procedure(factor: GLshort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGlobalAlphaFactoriSUN = procedure(factor: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGlobalAlphaFactorfSUN = procedure(factor: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGlobalAlphaFactordSUN = procedure(factor: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGlobalAlphaFactorubSUN = procedure(factor: GLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGlobalAlphaFactorusSUN = procedure(factor: GLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglGlobalAlphaFactoruiSUN = procedure(factor: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SUN_mesh_array
  TglDrawMeshArraysSUN = procedure(mode: GLenum; first: GLint; count: GLsizei; width: GLsizei); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SUN_triangle_list
  TglReplacementCodeuiSUN = procedure(code: GLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodeusSUN = procedure(code: GLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodeubSUN = procedure(code: GLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodeuivSUN = procedure(const code: PGLuint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodeusvSUN = procedure(const code: PGLushort); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodeubvSUN = procedure(const code: PGLubyte); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodePointerSUN = procedure(_type: GLenum; stride: GLsizei; const _pointer: PGLvoid); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // GL_SUN_vertex
  TglColor4ubVertex2fSUN = procedure(r: GLubyte; g: GLubyte; b: GLubyte; a: GLubyte; x: GLfloat; y: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4ubVertex2fvSUN = procedure(const c: PGLubyte; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4ubVertex3fSUN = procedure(r: GLubyte; g: GLubyte; b: GLubyte; a: GLubyte; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4ubVertex3fvSUN = procedure(const c: PGLubyte; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor3fVertex3fSUN = procedure(r: GLfloat; g: GLfloat; b: GLfloat; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor3fVertex3fvSUN = procedure(const c: PGLfloat; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormal3fVertex3fSUN = procedure(nx: GLfloat; ny: GLfloat; nz: GLfloat; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglNormal3fVertex3fvSUN = procedure(const n: PGLfloat; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4fNormal3fVertex3fSUN = procedure(r: GLfloat; g: GLfloat; b: GLfloat; a: GLfloat; nx: GLfloat; ny: GLfloat; nz: GLfloat; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglColor4fNormal3fVertex3fvSUN = procedure(const c: PGLfloat; const n: PGLfloat; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord2fVertex3fSUN = procedure(s: GLfloat; t: GLfloat; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord2fVertex3fvSUN = procedure(const tc: PGLfloat; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord4fVertex4fSUN = procedure(s: GLfloat; t: GLfloat; p: GLfloat; q: GLfloat; x: GLfloat; y: GLfloat; z: GLfloat; w: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord4fVertex4fvSUN = procedure(const tc: PGLfloat; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord2fColor4ubVertex3fSUN = procedure(s: GLfloat; t: GLfloat; r: GLubyte; g: GLubyte; b: GLubyte; a: GLubyte; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord2fColor4ubVertex3fvSUN = procedure(const tc: PGLfloat; const c: PGLubyte; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord2fColor3fVertex3fSUN = procedure(s: GLfloat; t: GLfloat; r: GLfloat; g: GLfloat; b: GLfloat; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord2fColor3fVertex3fvSUN = procedure(const tc: PGLfloat; const c: PGLfloat; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord2fNormal3fVertex3fSUN = procedure(s: GLfloat; t: GLfloat; nx: GLfloat; ny: GLfloat; nz: GLfloat; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord2fNormal3fVertex3fvSUN = procedure(const tc: PGLfloat; const n: PGLfloat; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord2fColor4fNormal3fVertex3fSUN = procedure(s: GLfloat; t: GLfloat; r: GLfloat; g: GLfloat; b: GLfloat; a: GLfloat; nx: GLfloat; ny: GLfloat; nz: GLfloat; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord2fColor4fNormal3fVertex3fvSUN = procedure(const tc: PGLfloat; const c: PGLfloat; const n: PGLfloat; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord4fColor4fNormal3fVertex4fSUN = procedure(s: GLfloat; t: GLfloat; p: GLfloat; q: GLfloat; r: GLfloat; g: GLfloat; b: GLfloat; a: GLfloat; nx: GLfloat; ny: GLfloat; nz: GLfloat; x: GLfloat; y: GLfloat; z: GLfloat; w: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglTexCoord4fColor4fNormal3fVertex4fvSUN = procedure(const tc: PGLfloat; const c: PGLfloat; const n: PGLfloat; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodeuiVertex3fSUN = procedure(rc: GLuint; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodeuiVertex3fvSUN = procedure(const rc: PGLuint; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodeuiColor4ubVertex3fSUN = procedure(rc: GLuint; r: GLubyte; g: GLubyte; b: GLubyte; a: GLubyte; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodeuiColor4ubVertex3fvSUN = procedure(const rc: PGLuint; const c: PGLubyte; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodeuiColor3fVertex3fSUN = procedure(rc: GLuint; r: GLfloat; g: GLfloat; b: GLfloat; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodeuiColor3fVertex3fvSUN = procedure(const rc: PGLuint; const c: PGLfloat; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodeuiNormal3fVertex3fSUN = procedure(rc: GLuint; nx: GLfloat; ny: GLfloat; nz: GLfloat; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodeuiNormal3fVertex3fvSUN = procedure(const rc: PGLuint; const n: PGLfloat; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodeuiColor4fNormal3fVertex3fSUN = procedure(rc: GLuint; r: GLfloat; g: GLfloat; b: GLfloat; a: GLfloat; nx: GLfloat; ny: GLfloat; nz: GLfloat; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodeuiColor4fNormal3fVertex3fvSUN = procedure(const rc: PGLuint; const c: PGLfloat; const n: PGLfloat; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodeuiTexCoord2fVertex3fSUN = procedure(rc: GLuint; s: GLfloat; t: GLfloat; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodeuiTexCoord2fVertex3fvSUN = procedure(const rc: PGLuint; const tc: PGLfloat; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodeuiTexCoord2fNormal3fVertex3fSUN = procedure(rc: GLuint; s: GLfloat; t: GLfloat; nx: GLfloat; ny: GLfloat; nz: GLfloat; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN = procedure(const rc: PGLuint; const tc: PGLfloat; const n: PGLfloat; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN = procedure(rc: GLuint; s: GLfloat; t: GLfloat; r: GLfloat; g: GLfloat; b: GLfloat; a: GLfloat; nx: GLfloat; ny: GLfloat; nz: GLfloat; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TglReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN = procedure(const rc: PGLuint; const tc: PGLfloat; const c: PGLfloat; const n: PGLfloat; const v: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

  // window support functions
{$IFDEF DGL_WIN}
  TwglGetProcAddress = function(ProcName: PAnsiChar): Pointer; stdcall;
  TwglCopyContext = function(p1: HGLRC; p2: HGLRC; p3: Cardinal): BOOL; stdcall;
  TwglCreateContext = function(DC: HDC): HGLRC; stdcall;
  TwglCreateLayerContext = function(p1: HDC; p2: Integer): HGLRC; stdcall;
  TwglDeleteContext = function(p1: HGLRC): BOOL; stdcall;
  TwglDescribeLayerPlane = function(p1: HDC; p2, p3: Integer; p4: Cardinal; p5: PLayerPlaneDescriptor): BOOL; stdcall;
  TwglGetCurrentContext = function: HGLRC; stdcall;
  TwglGetCurrentDC = function: HDC; stdcall;
  TwglGetLayerPaletteEntries = function(p1: HDC; p2, p3, p4: Integer; var pcr): Integer; stdcall;
  TwglMakeCurrent = function(DC: HDC; p2: HGLRC): BOOL; stdcall;
  TwglRealizeLayerPalette = function(p1: HDC; p2: Integer; p3: BOOL): BOOL; stdcall;
  TwglSetLayerPaletteEntries = function(p1: HDC; p2, p3, p4: Integer; var pcr): Integer; stdcall;
  TwglShareLists = function(p1, p2: HGLRC): BOOL; stdcall;
  TwglSwapLayerBuffers = function(p1: HDC; p2: Cardinal): BOOL; stdcall;
  TwglSwapMultipleBuffers = function(p1: UINT; const p2: PWGLSWAP): DWORD; stdcall;
  TwglUseFontBitmapsA = function(DC: HDC; p2, p3, p4: DWORD): BOOL; stdcall;
  TwglUseFontBitmapsW = function(DC: HDC; p2, p3, p4: DWORD): BOOL; stdcall;
  TwglUseFontBitmaps = function(DC: HDC; p2, p3, p4: DWORD): BOOL; stdcall;

  TwglUseFontOutlinesA = function(p1: HDC; p2, p3, p4: DWORD; p5, p6: Single; p7: Integer; p8: PGlyphMetricsFloat): BOOL; stdcall;
  TwglUseFontOutlinesW = function(p1: HDC; p2, p3, p4: DWORD; p5, p6: Single; p7: Integer; p8: PGlyphMetricsFloat): BOOL; stdcall;
  TwglUseFontOutlines = function(p1: HDC; p2, p3, p4: DWORD; p5, p6: Single; p7: Integer; p8: PGlyphMetricsFloat): BOOL; stdcall;


  // WGL_ARB_buffer_region
  TwglCreateBufferRegionARB = function(hDC: HDC; iLayerPlane: GLint; uType: GLuint): THandle; stdcall;
  TwglDeleteBufferRegionARB = procedure(hRegion: THandle); stdcall;
  TwglSaveBufferRegionARB = function(hRegion: THandle; x: GLint; y: GLint; width: GLint; height: GLint): Boolean; stdcall;
  TwglRestoreBufferRegionARB = function(hRegion: THandle; x: GLint; y: GLint; width: GLint; height: GLint; xSrc: GLint; ySrc: GLint): Boolean; stdcall;

  // WGL_ARB_extensions_string
  TwglGetExtensionsStringARB = function(hdc: HDC): PAnsiChar; stdcall;

  // WGL_ARB_make_current_read
  TwglMakeContextCurrentARB = function(hDrawDC: HDC; hReadDC: HDC; hglrc: HGLRC): Boolean; stdcall;
  TwglGetCurrentReadDCARB = function(): HDC; stdcall;

  // WGL_ARB_pbuffer
  TwglCreatePbufferARB = function(hDC: HDC; iPixelFormat: GLint; iWidth: GLint; iHeight: GLint; const piAttribList: PGLint): HPBUFFERARB; stdcall;
  TwglGetPbufferDCARB = function(hPbuffer: HPBUFFERARB): HDC; stdcall;
  TwglReleasePbufferDCARB = function(hPbuffer: HPBUFFERARB; hDC: HDC): GLint; stdcall;
  TwglDestroyPbufferARB = function(hPbuffer: HPBUFFERARB): Boolean; stdcall;
  TwglQueryPbufferARB = function(hPbuffer: HPBUFFERARB; iAttribute: GLint; piValue: PGLint): Boolean; stdcall;

  // WGL_ARB_pixel_format
  TwglGetPixelFormatAttribivARB = function(hdc: HDC; iPixelFormat: GLint; iLayerPlane: GLint; nAttributes: GLuint; const piAttributes: PGLint; piValues: PGLint): Boolean; stdcall;
  TwglGetPixelFormatAttribfvARB = function(hdc: HDC; iPixelFormat: GLint; iLayerPlane: GLint; nAttributes: GLuint; const piAttributes: PGLint; pfValues: PGLfloat): Boolean; stdcall;
  TwglChoosePixelFormatARB = function(hdc: HDC; const piAttribIList: PGLint; const pfAttribFList: PGLfloat; nMaxFormats: GLuint; piFormats: PGLint; nNumFormats: PGLuint): BOOL; stdcall;

  // WGL_ARB_color_buffer_float
  TwglClampColorARB = procedure(target: GLenum; clamp: GLenum); stdcall;

  // WGL_ARB_render_texture
  TwglBindTexImageARB = function(hPbuffer: HPBUFFERARB; iBuffer: GLint): Boolean; stdcall;
  TwglReleaseTexImageARB = function(hPbuffer: HPBUFFERARB; iBuffer: GLint): Boolean; stdcall;
  TwglSetPbufferAttribARB = function(hPbuffer: HPBUFFERARB; const piAttribList: PGLint): Boolean; stdcall;

  // WGL_ARB_create_context
  TwglCreateContextAttribsARB = function(hDC: HDC; hShareContext: HGLRC; const attribList: PGLint): HGLRC; stdcall;

  // WGL_AMD_gpu_association
  TwglGetGPUIDsAMD = function(maxCount: Cardinal; ids: PCardinal): Cardinal; stdcall;
  TwglGetGPUInfoAMD = function(id: Cardinal; property_: Integer; dataType: GLenum; size: Cardinal; data: Pointer): Integer; stdcall;
  TwglGetContextGPUIDAMD = function(hglrc: HGLRC): Cardinal; stdcall;
  TwglCreateAssociatedContextAMD = function(id: Cardinal): HGLRC; stdcall;
  TwglCreateAssociatedContextAttribsAMD = function(id: Cardinal; hShareContext: HGLRC; const attribList: PInteger): HGLRC; stdcall;
  TwglDeleteAssociatedContextAMD = function(hglrc: HGLRC): Boolean; stdcall;
  TwglMakeAssociatedContextCurrentAMD = function(hglrc: HGLRC): Boolean; stdcall;
  TwglGetCurrentAssociatedContextAMD = function(): HGLRC; stdcall;
  TwglBlitContextFramebufferAMD = procedure(dstCtx: HGLRC; srcX0: GLint; srcY0: GLint; srcX1: GLint; srcY1: GLint; dstX0: GLint; dstY0: GLint; dstX1: GLint; dstY1: GLint; mask: GLbitfield; filter: GLenum); stdcall;

  // WGL_EXT_display_color_table
  TwglCreateDisplayColorTableEXT = function(id: GLushort): GLboolean; stdcall;
  TwglLoadDisplayColorTableEXT = function(const table: PGLushort; length: GLuint): GLboolean; stdcall;
  TwglBindDisplayColorTableEXT = function(id: GLushort): GLboolean; stdcall;
  TwglDestroyDisplayColorTableEXT = procedure(id: GLushort); stdcall;

  // WGL_EXT_extensions_string
  TwglGetExtensionsStringEXT = function(): PAnsiChar; stdcall;

  // WGL_EXT_make_current_read
  TwglMakeContextCurrentEXT = function(hDrawDC: HDC; hReadDC: HDC; hglrc: HGLRC): Boolean; stdcall;
  TwglGetCurrentReadDCEXT = function(): HDC; stdcall;

  // WGL_EXT_pbuffer
  TwglCreatePbufferEXT = function(hDC: HDC; iPixelFormat: GLint; iWidth: GLint; iHeight: GLint; const piAttribList: PGLint): HPBUFFEREXT; stdcall;
  TwglGetPbufferDCEXT = function(hPbuffer: HPBUFFEREXT): HDC; stdcall;
  TwglReleasePbufferDCEXT = function(hPbuffer: HPBUFFEREXT; hDC: HDC): GLint; stdcall;
  TwglDestroyPbufferEXT = function(hPbuffer: HPBUFFEREXT): Boolean; stdcall;
  TwglQueryPbufferEXT = function(hPbuffer: HPBUFFEREXT; iAttribute: GLint; piValue: PGLint): Boolean; stdcall;

  // WGL_EXT_pixel_format
  TwglGetPixelFormatAttribivEXT = function(hdc: HDC; iPixelFormat: GLint; iLayerPlane: GLint; nAttributes: GLuint; piAttributes: PGLint; piValues: PGLint): Boolean; stdcall;
  TwglGetPixelFormatAttribfvEXT = function(hdc: HDC; iPixelFormat: GLint; iLayerPlane: GLint; nAttributes: GLuint; piAttributes: PGLint; pfValues: PGLfloat): Boolean; stdcall;
  TwglChoosePixelFormatEXT = function(hdc: HDC; const piAttribIList: PGLint; const pfAttribFList: PGLfloat; nMaxFormats: GLuint; piFormats: PGLint; nNumFormats: PGLuint): Boolean; stdcall;

  // WGL_EXT_swap_control
  TwglSwapIntervalEXT = function(interval: GLint): Boolean; stdcall;
  TwglGetSwapIntervalEXT = function(): GLint; stdcall;

  // WGL_I3D_digital_video_control
  TwglGetDigitalVideoParametersI3D = function(hDC: HDC; iAttribute: GLint; piValue: PGLint): Boolean; stdcall;
  TwglSetDigitalVideoParametersI3D = function(hDC: HDC; iAttribute: GLint; const piValue: PGLint): Boolean; stdcall;

  // WGL_I3D_gamma
  TwglGetGammaTableParametersI3D = function(hDC: HDC; iAttribute: GLint; piValue: PGLint): Boolean; stdcall;
  TwglSetGammaTableParametersI3D = function(hDC: HDC; iAttribute: GLint; const piValue: PGLint): Boolean; stdcall;
  TwglGetGammaTableI3D = function(hDC: HDC; iEntries: GLint; puRed: PGLushort; puGreen: PGLushort; puBlue: PGLushort): Boolean; stdcall;
  TwglSetGammaTableI3D = function(hDC: HDC; iEntries: GLint; const puRed: PGLushort; const puGreen: PGLushort; const puBlue: PGLushort): Boolean; stdcall;

  // WGL_I3D_genlock
  TwglEnableGenlockI3D = function(hDC: HDC): Boolean; stdcall;
  TwglDisableGenlockI3D = function(hDC: HDC): Boolean; stdcall;
  TwglIsEnabledGenlockI3D = function(hDC: HDC; pFlag: Boolean): Boolean; stdcall;
  TwglGenlockSourceI3D = function(hDC: HDC; uSource: GLuint): Boolean; stdcall;
  TwglGetGenlockSourceI3D = function(hDC: HDC; uSource: PGLuint): Boolean; stdcall;
  TwglGenlockSourceEdgeI3D = function(hDC: HDC; uEdge: GLuint): Boolean; stdcall;
  TwglGetGenlockSourceEdgeI3D = function(hDC: HDC; uEdge: PGLuint): Boolean; stdcall;
  TwglGenlockSampleRateI3D = function(hDC: HDC; uRate: GLuint): Boolean; stdcall;
  TwglGetGenlockSampleRateI3D = function(hDC: HDC; uRate: PGLuint): Boolean; stdcall;
  TwglGenlockSourceDelayI3D = function(hDC: HDC; uDelay: GLuint): Boolean; stdcall;
  TwglGetGenlockSourceDelayI3D = function(hDC: HDC; uDelay: PGLuint): Boolean; stdcall;
  TwglQueryGenlockMaxSourceDelayI3D = function(hDC: HDC; uMaxLineDelay: PGLuint; uMaxPixelDelay: PGLuint): Boolean; stdcall;

  // WGL_I3D_image_buffer
  TwglCreateImageBufferI3D = function(hDC: HDC; dwSize: GLuint; uFlags: GLuint): GLvoid; stdcall;
  TwglDestroyImageBufferI3D = function(hDC: HDC; pAddress: GLvoid): Boolean; stdcall;
  TwglAssociateImageBufferEventsI3D = function(hDC: HDC; const pEvent: THandle; const pAddress: PGLvoid; const pSize: PGLuint; count: GLuint): Boolean; stdcall;
  TwglReleaseImageBufferEventsI3D = function(hDC: HDC; const pAddress: PGLvoid; count: GLuint): Boolean; stdcall;

  // WGL_I3D_swap_frame_lock
  TwglEnableFrameLockI3D = function(): Boolean; stdcall;
  TwglDisableFrameLockI3D = function(): Boolean; stdcall;
  TwglIsEnabledFrameLockI3D = function(pFlag: Boolean): Boolean; stdcall;
  TwglQueryFrameLockMasterI3D = function(pFlag: Boolean): Boolean; stdcall;

  // WGL_I3D_swap_frame_usage
  TwglGetFrameUsageI3D = function(pUsage: PGLfloat): Boolean; stdcall;
  TwglBeginFrameTrackingI3D = function(): Boolean; stdcall;
  TwglEndFrameTrackingI3D = function(): Boolean; stdcall;
  TwglQueryFrameTrackingI3D = function(pFrameCount: PGLuint; pMissedFrames: PGLuint; pLastMissedUsage: PGLfloat): Boolean; stdcall;

  // WGL_NV_vertex_array_range
  TwglAllocateMemoryNV = procedure(size: GLsizei; readfreq: GLfloat; writefreq: GLfloat; priority: GLfloat); stdcall;
  TwglFreeMemoryNV = procedure(_pointer: Pointer); stdcall;

  // WGL_NV_present_video
  TwglEnumerateVideoDevicesNV = function(hdc: HDC; phDeviceList: PHVIDEOOUTPUTDEVICENV): Integer; stdcall;
  TwglBindVideoDeviceNV = function(hd: HDC; uVideoSlot: Cardinal; hVideoDevice: HVIDEOOUTPUTDEVICENV; piAttribList: PInteger): Boolean; stdcall;
  TwglQueryCurrentContextNV = function(iAttribute: Integer; piValue: PInteger): Boolean; stdcall;

  // WGL_NV_video_output
  TwglGetVideoDeviceNV = function(hDC: HDC; numDevices: Integer; hVideoDevice: PHPVIDEODEV): Boolean; stdcall;
  TwglReleaseVideoDeviceNV = function(hVideoDevice: HPVIDEODEV): Boolean; stdcall;
  TwglBindVideoImageNV = function(hVideoDevice: HPVIDEODEV; hPbuffer: HPBUFFERARB; iVideoBuffer: Integer): Boolean; stdcall;
  TwglReleaseVideoImageNV = function(hPbuffer: HPBUFFERARB; iVideoBuffer: Integer): Boolean; stdcall;
  TwglSendPbufferToVideoNV = function(hPbuffer: HPBUFFERARB; iBufferType: Integer; pulCounterPbuffer: PCardinal; bBlock: Boolean): Boolean; stdcall;
  TwglGetVideoInfoNV = function(hpVideoDevice: HPVIDEODEV; pulCounterOutputPbuffer: PCardinal; pulCounterOutputVideo: PCardinal): Boolean; stdcall;

  // WGL_NV_swap_group
  TwglJoinSwapGroupNV = function(hDC: HDC; group: GLuint): Boolean; stdcall;
  TwglBindSwapBarrierNV = function(group: GLuint; barrier: GLuint): Boolean; stdcall;
  TwglQuerySwapGroupNV = function(hDC: HDC; group: PGLuint; barrier: PGLuint): Boolean; stdcall;
  TwglQueryMaxSwapGroupsNV = function(hDC: HDC; mxGroups: PGLuint; maxBarriers: PGLuint): Boolean; stdcall;
  TwglQueryFrameCountNV = function(hDC: HDC; count: PGLuint): Boolean; stdcall;
  TwglResetFrameCountNV = function(hDC: HDC): Boolean; stdcall;

  // WGL_NV_gpu_affinity
  TwglEnumGpusNV = function(iGpuIndex: Cardinal; phGpu: PHGPUNV): Boolean; stdcall;
  TwglEnumGpuDevicesNV = function(hGpu: HGPUNV; iDeviceIndex: Cardinal; lpGpuDevice: PGPU_DEVICE): Boolean; stdcall;
  TwglCreateAffinityDCNV = function(const phGpuList: PHGPUNV): HDC; stdcall;
  TwglEnumGpusFromAffinityDCNV = function(hAffinityDC: HDC; iGpuIndex: Cardinal; hGpu: PHGPUNV): Boolean; stdcall;
  TwglDeleteDCNV = function(hDC: HDC): Boolean; stdcall;

  // WGL_NV_video_capture
  TwglBindVideoCaptureDeviceNV = function(uVideoSlot: Cardinal; hDevice: HVIDEOINPUTDEVICENV): Boolean; stdcall;
  TwglEnumerateVideoCaptureDevicesNV = function(hDc: HDC; phDeviceList: PHVIDEOINPUTDEVICENV): Cardinal; stdcall;
  TwglLockVideoCaptureDeviceNV = function(hDc: HDC; hDevice: HVIDEOINPUTDEVICENV): Boolean; stdcall;
  TwglQueryVideoCaptureDeviceNV = function(hDc: HDC; hDevice: HVIDEOINPUTDEVICENV; iAttribute: Integer; piValue: PInteger): Boolean; stdcall;
  TwglReleaseVideoCaptureDeviceNV = function(hDc: HDC; hDevice: HVIDEOINPUTDEVICENV): Boolean; stdcall;

  // WGL_NV_copy_image
  TwglCopyImageSubDataNV = function(hSrcRc: HGLRC; srcName: GLuint; srcTarget: GLenum; srcLevel: GLint; srcX: GLint; srcY: GLint; srcZ: GLint; hDstRC: HGLRC; dstName: GLuint; dstTarget: GLenum; dstLevel: GLint; dstX: GLint; dstY: GLint; dstZ: GLint; width: GLsizei; height: GLsizei; depth: GLsizei): Boolean; stdcall;

  // WGL_OML_sync_control
  TwglGetSyncValuesOML = function(hdc: HDC; ust: PGLint64; msc: PGLint64; sbc: PGLint64): Boolean; stdcall;
  TwglGetMscRateOML = function(hdc: HDC; numerator: PGLint; denominator: PGLint): Boolean; stdcall;
  TwglSwapBuffersMscOML = function(hdc: HDC; target_msc: GLint64; divisor: GLint64; remainder: GLint64): GLint64; stdcall;
  TwglSwapLayerBuffersMscOML = function(hdc: HDC; fuPlanes: GLint; target_msc: GLint64; divisor: GLint64; remainder: GLint64): GLint64; stdcall;
  TwglWaitForMscOML = function(hdc: HDC; target_msc: GLint64; divisor: GLint64; remainder: GLint64; ust: PGLint64; msc: PGLint64; sbc: PGLint64): Boolean; stdcall;
  TwglWaitForSbcOML = function(hdc: HDC; target_sbc: GLint64; ust: PGLint64; msc: PGLint64; sbc: PGLint64): Boolean; stdcall;

  // WGL_3DL_stereo_control
  TwglSetStereoEmitterState3DL = function(hDC: HDC; uState: UINT): Boolean; stdcall;
  
  // WIN_draw_range_elements
  TglDrawRangeElementsWIN = procedure(mode: GLenum; start: GLuint; _end: GLuint; count: GLsizei; _type: GLenum; const indices: PGLvoid); stdcall;

  // WIN_swap_hint
  TglAddSwapHintRectWIN = procedure(x: GLint; y: GLint; width: GLsizei; height: GLsizei); stdcall;
{$ENDIF}

{$IFDEF DGL_LINUX}
  TglXChooseVisual = function(dpy: PDisplay; screen: GLint; attribList: PGLint): PXVisualInfo; cdecl;
  TglXCopyContext = procedure(dpy: PDisplay; src: GLXContext; dst: GLXContext; mask: GLuint); cdecl;
  TglXCreateContext = function(dpy: PDisplay; vis: PXVisualInfo; shareList: GLXContext; direct: GLboolean): GLXContext; cdecl;
  TglXCreateGLXPixmap = function(dpy: PDisplay; vis: PXVisualInfo; pixmap: Pixmap): GLXPixmap cdecl;
  TglXDestroyContext = procedure(dpy: PDisplay; ctx: GLXContext); cdecl;
  TglXDestroyGLXPixmap = procedure(dpy : PDisplay; pix: GLXPixmap); cdecl;
  TglXGetConfig = function(dpy : PDisplay; vis: PXVisualInfo; attrib: GLint; value: PGLint): GLint; cdecl;
  TglXGetCurrentContext = function: GLXContext cdecl;
  TglXGetCurrentDrawable = function: GLXDrawable cdecl;
  TglXIsDirect = function(dpy: PDisplay; ctx: GLXContext): glboolean; cdecl;
  TglXMakeCurrent = function(dpy: PDisplay; drawable: GLXDrawable; ctx: GLXContext): GLboolean cdecl;
  TglXQueryExtension = function(dpy: PDisplay; errorBase: PGLint; eventBase: PGLint): GLboolean; cdecl;
  TglXQueryVersion = function(dpy: PDisplay; major: PGLint; minor: PGLint): GLboolean cdecl;
  TglXSwapBuffers = procedure(dpy: PDisplay; drawable: GLXDrawable); cdecl;
  TglXUseXFont = procedure(font: Font; first: GLint; count: GLint; listBase: GLint); cdecl;
  TglXWaitGL = procedure; cdecl; 
  TglXWaitX = procedure; cdecl;

  TglXGetClientString = function(dpy: PDisplay; name: GLint): PGLchar; cdecl;
  TglXQueryServerString = function(dpy: PDisplay; screen: GLint; name: GLint): PGLchar; cdecl;
  TglXQueryExtensionsString = function(dpy: PDisplay; screen: GLint): PGLchar; cdecl;

  // GLX_VERSION_1_3
  TglXGetFBConfigs = function(dpy: PDisplay; screen: GLint; nelements: PGLint): GLXFBConfig; cdecl;
  TglXChooseFBConfig = function(dpy: PDisplay; screen: GLint; attrib_list: PGLint; nelements: PGLint): GLXFBConfig; cdecl;
  TglXGetFBConfigAttrib = function(dpy: PDisplay; config: GLXFBConfig; attribute: GLint; value: PGLint): glint; cdecl;
  TglXGetVisualFromFBConfig = function(dpy: PDisplay; config: GLXFBConfig) : PXVisualInfo;
  TglXCreateWindow = function(dpy: PDisplay; config: GLXFBConfig; win: Window; attrib_list: PGLint): GLXWindow; cdecl;
  TglXDestroyWindow = procedure(dpy: PDisplay; win: GLXWindow); cdecl;
  TglXCreatePixmap = function(dpy: PDisplay; config: GLXFBConfig; pixmap: Pixmap; attrib_list: PGLint): GLXPixmap; cdecl;

  TglXDestroyPixmap = procedure(dpy: PDisplay; pixmap: GLXPixmap); cdecl;
  TglXCreatePbuffer = function(dpy: PDisplay; config: GLXFBConfig; attrib_list: PGLint): GLXPbuffer; cdecl;
  TglXDestroyPbuffer = procedure(dpy: PDisplay; pbuf: GLXPbuffer); cdecl;
  TglXQueryDrawable = procedure(dpy: PDisplay; draw: GLXDrawable; attribute: GLint; value: PGLuint); cdecl;
  TglXCreateNewContext = function(dpy: PDisplay; config: GLXFBConfig; render_type: GLint; share_list: GLXContext; direct: GLboolean): GLXContext cdecl;
  TglXMakeContextCurrent = function(display: PDisplay; draw: GLXDrawable; read_: GLXDrawable; ctx: GLXContext): GLboolean; cdecl;
  TglXGetCurrentReadDrawable = function: GLXDrawable; cdecl;
  TglXGetCurreentDisplay = function: PDisplay;

  TglXQueryContext = function(dpy: PDisplay; ctx: GLXContext; attribute: GLint; value: PGLint): GLint; cdecl;
  TglXSelectEvent = procedure(dpy: PDisplay; draw: GLXDrawable; event_mask: GLuint); cdecl;
  TglXGetSelectedEvent = procedure(dpy: PDisplay; draw: GLXDrawable; event_mask: PGLuint); cdecl;

  // GLX_VERSION_1_4
  TglXGetProcAddress = function(const name: PAnsiChar): pointer; cdecl;

  // GLX_ARB_get_proc_address
  TglXGetProcAddressARB = function(const name: PAnsiChar): pointer; cdecl;

  // GLX_ARB_create_context
  TglXCreateContextAttribsARB = function(dpy: PDisplay; config: GLXFBConfig; share_context: GLXContext; direct: GLboolean; const attrib_list: PGLint): GLXContext; cdecl;

  // GLX_EXT_import_context
  TglXGetCurrentDisplayEXT = function: PDisplay; cdecl;
  TglXQueryContextInfoEXT = function(dpy: PDisplay; context: GLXContext; attribute: GLint; value: PGLint): GLint; cdecl;
  TglXGetContextIDEXT = function(const context: GLXContext): GLXContextID; cdecl;
  TglXImportContextEXT = function(dpy: PDisplay; contextID: GLXContextID): GLXContext; cdecl;
  TglXFreeContextEXT = procedure(dpy: PDisplay; context: GLXContext); cdecl;
  
  // GLX_EXT_texture_from_pixmap
  TglXBindTexImageEXT = procedure(dpy: PDisplay; drawable: GLXDrawable; buffer: GLint; const attrib_list: PGLint); cdecl;
  TglXReleaseTexImageEXT = procedure(dpy: PDisplay; drawable: GLXDrawable; buffer: GLint); cdecl;
{$ENDIF}

  // GL utility functions and procedures
  TgluErrorString = function(errCode: GLEnum): PAnsiChar; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluGetString = function(name: GLEnum): PAnsiChar; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluOrtho2D = procedure(left, right, bottom, top: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluPerspective = procedure(fovy, aspect, zNear, zFar: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluPickMatrix = procedure(x, y, width, height: GLdouble; const viewport: TVector4i); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluLookAt = procedure(eyex, eyey, eyez, centerx, centery, centerz, upx, upy, upz: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluProject = function(objx, objy, objz: GLdouble; const modelMatrix: TGLMatrixd4; const projMatrix: TGLMatrixd4; const viewport: TVector4i; winx, winy, winz: PGLdouble): GLint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluUnProject = function(winx, winy, winz: GLdouble; const modelMatrix: TGLMatrixd4; const projMatrix: TGLMatrixd4; const viewport: TVector4i; objx, objy, objz: PGLdouble): GLint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluScaleImage = function(format: GLEnum; widthin, heightin: GLint; typein: GLEnum; datain: Pointer; widthout, heightout: GLint; typeout: GLEnum; const dataout: Pointer): GLint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluBuild1DMipmaps = function(target: GLEnum; components, width: GLint; format, atype: GLEnum; const data: Pointer): GLint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluBuild2DMipmaps = function(target: GLEnum; components, width, height: GLint; format, atype: GLEnum; const Data: Pointer): GLint; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluNewQuadric = function: PGLUquadric; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluDeleteQuadric = procedure(state: PGLUquadric); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluQuadricNormals = procedure(quadObject: PGLUquadric; normals: GLEnum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluQuadricTexture = procedure(quadObject: PGLUquadric; textureCoords: GLboolean); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluQuadricOrientation = procedure(quadObject: PGLUquadric; orientation: GLEnum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluQuadricDrawStyle = procedure(quadObject: PGLUquadric; drawStyle: GLEnum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluCylinder = procedure(quadObject: PGLUquadric; baseRadius, topRadius, height: GLdouble; slices, stacks: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluDisk = procedure(quadObject: PGLUquadric; innerRadius, outerRadius: GLdouble; slices, loops: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluPartialDisk = procedure(quadObject: PGLUquadric; innerRadius, outerRadius: GLdouble; slices, loops: GLint; startAngle, sweepAngle: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluSphere = procedure(quadObject: PGLUquadric; radius: GLdouble; slices, stacks: GLint); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluQuadricCallback = procedure(quadObject: PGLUquadric; which: GLEnum; fn: TGLUQuadricErrorProc); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluNewTess = function: PGLUtesselator; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluDeleteTess = procedure(tess: PGLUtesselator); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluTessBeginPolygon = procedure(tess: PGLUtesselator; polygon_data: Pointer); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluTessBeginContour = procedure(tess: PGLUtesselator); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluTessVertex = procedure(tess: PGLUtesselator; const coords: TGLArrayd3; data: Pointer); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluTessEndContour = procedure(tess: PGLUtesselator); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluTessEndPolygon = procedure(tess: PGLUtesselator); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluTessProperty = procedure(tess: PGLUtesselator; which: GLEnum; value: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluTessNormal = procedure(tess: PGLUtesselator; x, y, z: GLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluTessCallback = procedure(tess: PGLUtesselator; which: GLEnum; fn: Pointer); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluGetTessProperty = procedure(tess: PGLUtesselator; which: GLEnum; value: PGLdouble); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluNewNurbsRenderer = function: PGLUnurbs; {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluDeleteNurbsRenderer = procedure(nobj: PGLUnurbs); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluBeginSurface = procedure(nobj: PGLUnurbs); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluBeginCurve = procedure(nobj: PGLUnurbs); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluEndCurve = procedure(nobj: PGLUnurbs); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluEndSurface = procedure(nobj: PGLUnurbs); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluBeginTrim = procedure(nobj: PGLUnurbs); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluEndTrim = procedure(nobj: PGLUnurbs); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluPwlCurve = procedure(nobj: PGLUnurbs; count: GLint; points: PGLfloat; stride: GLint; atype: GLEnum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluNurbsCurve = procedure(nobj: PGLUnurbs; nknots: GLint; knot: PGLfloat; stride: GLint; ctlarray: PGLfloat; order: GLint; atype: GLEnum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluNurbsSurface = procedure(nobj: PGLUnurbs; sknot_count: GLint; sknot: PGLfloat; tknot_count: GLint; tknot: PGLfloat; s_stride, t_stride: GLint; ctlarray: PGLfloat; sorder, torder: GLint; atype: GLEnum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluLoadSamplingMatrices = procedure(nobj: PGLUnurbs; const modelMatrix, projMatrix: TGLMatrixf4; const viewport: TVector4i); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluNurbsProperty = procedure(nobj: PGLUnurbs; aproperty: GLEnum; value: GLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluGetNurbsProperty = procedure(nobj: PGLUnurbs; aproperty: GLEnum; value: PGLfloat); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluNurbsCallback = procedure(nobj: PGLUnurbs; which: GLEnum; fn: TGLUNurbsErrorProc); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluBeginPolygon = procedure(tess: PGLUtesselator); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluNextContour = procedure(tess: PGLUtesselator; atype: GLEnum); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}
  TgluEndPolygon = procedure(tess: PGLUtesselator); {$IFDEF DGL_WIN}stdcall; {$ELSE}cdecl; {$ENDIF}

var
  // GL_VERSION_1_0
  glCullFace: TglCullFace;
  glFrontFace: TglFrontFace;
  glHint: TglHint;
  glLineWidth: TglLineWidth;
  glPointSize: TglPointSize;
  glPolygonMode: TglPolygonMode;
  glScissor: TglScissor;
  glTexParameterf: TglTexParameterf;
  glTexParameterfv: TglTexParameterfv;
  glTexParameteri: TglTexParameteri;
  glTexParameteriv: TglTexParameteriv;
  glTexImage1D: TglTexImage1D;
  glTexImage2D: TglTexImage2D;
  glDrawBuffer: TglDrawBuffer;
  glClear: TglClear;
  glClearColor: TglClearColor;
  glClearStencil: TglClearStencil;
  glClearDepth: TglClearDepth;
  glStencilMask: TglStencilMask;
  glColorMask: TglColorMask;
  glDepthMask: TglDepthMask;
  glDisable: TglDisable;
  glEnable: TglEnable;
  glFinish: TglFinish;
  glFlush: TglFlush;
  glBlendFunc: TglBlendFunc;
  glLogicOp: TglLogicOp;
  glStencilFunc: TglStencilFunc;
  glStencilOp: TglStencilOp;
  glDepthFunc: TglDepthFunc;
  glPixelStoref: TglPixelStoref;
  glPixelStorei: TglPixelStorei;
  glReadBuffer: TglReadBuffer;
  glReadPixels: TglReadPixels;
  glGetBooleanv: TglGetBooleanv;
  glGetDoublev: TglGetDoublev;
  glGetError: TglGetError;
  glGetFloatv: TglGetFloatv;
  glGetIntegerv: TglGetIntegerv;
  glGetString: TglGetString;
  glGetTexImage: TglGetTexImage;
  glGetTexParameteriv: TglGetTexParameteriv;
  glGetTexParameterfv: TglGetTexParameterfv;
  glGetTexLevelParameterfv: TglGetTexLevelParameterfv;
  glGetTexLevelParameteriv: TglGetTexLevelParameteriv;
  glIsEnabled: TglIsEnabled;
  glDepthRange: TglDepthRange;
  glViewport: TglViewport;

  // GL_VERSION_1_1
  glDrawArrays: TglDrawArrays;
  glDrawElements: TglDrawElements;
  glGetPointerv: TglGetPointerv;
  glPolygonOffset: TglPolygonOffset;
  glCopyTexImage1D: TglCopyTexImage1D;
  glCopyTexImage2D: TglCopyTexImage2D;
  glCopyTexSubImage1D: TglCopyTexSubImage1D;
  glCopyTexSubImage2D: TglCopyTexSubImage2D;
  glTexSubImage1D: TglTexSubImage1D;
  glTexSubImage2D: TglTexSubImage2D;
  glBindTexture: TglBindTexture;
  glDeleteTextures: TglDeleteTextures;
  glGenTextures: TglGenTextures;
{$ifdef DGL_DEPRECATED}
  glAccum: TglAccum;
  glAlphaFunc: TglAlphaFunc;
  glAreTexturesResident: TglAreTexturesResident;
  glArrayElement: TglArrayElement;
  glBegin: TglBegin;
  glBitmap: TglBitmap;
  glCallList: TglCallList;
  glCallLists: TglCallLists;
  glClearAccum: TglClearAccum;
  glClearIndex: TglClearIndex;
  glClipPlane: TglClipPlane;
  glColor3b: TglColor3b;
  glColor3bv: TglColor3bv;
  glColor3d: TglColor3d;
  glColor3dv: TglColor3dv;
  glColor3f: TglColor3f;
  glColor3fv: TglColor3fv;
  glColor3i: TglColor3i;
  glColor3iv: TglColor3iv;
  glColor3s: TglColor3s;
  glColor3sv: TglColor3sv;
  glColor3ub: TglColor3ub;
  glColor3ubv: TglColor3ubv;
  glColor3ui: TglColor3ui;
  glColor3uiv: TglColor3uiv;
  glColor3us: TglColor3us;
  glColor3usv: TglColor3usv;
  glColor4b: TglColor4b;
  glColor4bv: TglColor4bv;
  glColor4d: TglColor4d;
  glColor4dv: TglColor4dv;
  glColor4f: TglColor4f;
  glColor4fv: TglColor4fv;
  glColor4i: TglColor4i;
  glColor4iv: TglColor4iv;
  glColor4s: TglColor4s;
  glColor4sv: TglColor4sv;
  glColor4ub: TglColor4ub;
  glColor4ubv: TglColor4ubv;
  glColor4ui: TglColor4ui;
  glColor4uiv: TglColor4uiv;
  glColor4us: TglColor4us;
  glColor4usv: TglColor4usv;
  glColorMaterial: TglColorMaterial;
  glColorPointer: TglColorPointer;
  glCopyPixels: TglCopyPixels;
  glDeleteLists: TglDeleteLists;
  glDisableClientState: TglDisableClientState;
  glDrawPixels: TglDrawPixels;
  glEdgeFlag: TglEdgeFlag;
  glEdgeFlagPointer: TglEdgeFlagPointer;
  glEdgeFlagv: TglEdgeFlagv;
  glEnableClientState: TglEnableClientState;
  glEnd: TglEnd;
  glEndList: TglEndList;
  glEvalCoord1d: TglEvalCoord1d;
  glEvalCoord1dv: TglEvalCoord1dv;
  glEvalCoord1f: TglEvalCoord1f;
  glEvalCoord1fv: TglEvalCoord1fv;
  glEvalCoord2d: TglEvalCoord2d;
  glEvalCoord2dv: TglEvalCoord2dv;
  glEvalCoord2f: TglEvalCoord2f;
  glEvalCoord2fv: TglEvalCoord2fv;
  glEvalMesh1: TglEvalMesh1;
  glEvalMesh2: TglEvalMesh2;
  glEvalPoint1: TglEvalPoint1;
  glEvalPoint2: TglEvalPoint2;
  glFeedbackBuffer: TglFeedbackBuffer;
  glFogf: TglFogf;
  glFogfv: TglFogfv;
  glFogi: TglFogi;
  glFogiv: TglFogiv;
  glFrustum: TglFrustum;
  glGenLists: TglGenLists;
  glGetClipPlane: TglGetClipPlane;
  glGetLightfv: TglGetLightfv;
  glGetLightiv: TglGetLightiv;
  glGetMapdv: TglGetMapdv;
  glGetMapfv: TglGetMapfv;
  glGetMapiv: TglGetMapiv;
  glGetMaterialfv: TglGetMaterialfv;
  glGetMaterialiv: TglGetMaterialiv;
  glGetPixelMapfv: TglGetPixelMapfv;
  glGetPixelMapuiv: TglGetPixelMapuiv;
  glGetPixelMapusv: TglGetPixelMapusv;
  glGetPolygonStipple: TglGetPolygonStipple;
  glGetTexEnvfv: TglGetTexEnvfv;
  glGetTexEnviv: TglGetTexEnviv;
  glGetTexGendv: TglGetTexGendv;
  glGetTexGenfv: TglGetTexGenfv;
  glGetTexGeniv: TglGetTexGeniv;
  glIndexMask: TglIndexMask;
  glIndexPointer: TglIndexPointer;
  glIndexd: TglIndexd;
  glIndexdv: TglIndexdv;
  glIndexf: TglIndexf;
  glIndexfv: TglIndexfv;
  glIndexi: TglIndexi;
  glIndexiv: TglIndexiv;
  glIndexs: TglIndexs;
  glIndexsv: TglIndexsv;
  glIndexub: TglIndexub;
  glIndexubv: TglIndexubv;
  glInitNames: TglInitNames;
  glInterleavedArrays: TglInterleavedArrays;
  glIsList: TglIsList;
  glIsTexture: TglIsTexture;
  glLightModelf: TglLightModelf;
  glLightModelfv: TglLightModelfv;
  glLightModeli: TglLightModeli;
  glLightModeliv: TglLightModeliv;
  glLightf: TglLightf;
  glLightfv: TglLightfv;
  glLighti: TglLighti;
  glLightiv: TglLightiv;
  glLineStipple: TglLineStipple;
  glListBase: TglListBase;
  glLoadIdentity: TglLoadIdentity;
  glLoadMatrixd: TglLoadMatrixd;
  glLoadMatrixf: TglLoadMatrixf;
  glLoadName: TglLoadName;
  glMap1d: TglMap1d;
  glMap1f: TglMap1f;
  glMap2d: TglMap2d;
  glMap2f: TglMap2f;
  glMapGrid1d: TglMapGrid1d;
  glMapGrid1f: TglMapGrid1f;
  glMapGrid2d: TglMapGrid2d;
  glMapGrid2f: TglMapGrid2f;
  glMaterialf: TglMaterialf;
  glMaterialfv: TglMaterialfv;
  glMateriali: TglMateriali;
  glMaterialiv: TglMaterialiv;
  glMatrixMode: TglMatrixMode;
  glMultMatrixd: TglMultMatrixd;
  glMultMatrixf: TglMultMatrixf;
  glNewList: TglNewList;
  glNormal3b: TglNormal3b;
  glNormal3bv: TglNormal3bv;
  glNormal3d: TglNormal3d;
  glNormal3dv: TglNormal3dv;
  glNormal3f: TglNormal3f;
  glNormal3fv: TglNormal3fv;
  glNormal3i: TglNormal3i;
  glNormal3iv: TglNormal3iv;
  glNormal3s: TglNormal3s;
  glNormal3sv: TglNormal3sv;
  glNormalPointer: TglNormalPointer;
  glOrtho: TglOrtho;
  glPassThrough: TglPassThrough;
  glPixelMapfv: TglPixelMapfv;
  glPixelMapuiv: TglPixelMapuiv;
  glPixelMapusv: TglPixelMapusv;
  glPixelTransferf: TglPixelTransferf;
  glPixelTransferi: TglPixelTransferi;
  glPixelZoom: TglPixelZoom;
  glPolygonStipple: TglPolygonStipple;
  glPopAttrib: TglPopAttrib;
  glPopClientAttrib: TglPopClientAttrib;
  glPopMatrix: TglPopMatrix;
  glPopName: TglPopName;
  glPrioritizeTextures: TglPrioritizeTextures;
  glPushAttrib: TglPushAttrib;
  glPushClientAttrib: TglPushClientAttrib;
  glPushMatrix: TglPushMatrix;
  glPushName: TglPushName;
  glRasterPos2d: TglRasterPos2d;
  glRasterPos2dv: TglRasterPos2dv;
  glRasterPos2f: TglRasterPos2f;
  glRasterPos2fv: TglRasterPos2fv;
  glRasterPos2i: TglRasterPos2i;
  glRasterPos2iv: TglRasterPos2iv;
  glRasterPos2s: TglRasterPos2s;
  glRasterPos2sv: TglRasterPos2sv;
  glRasterPos3d: TglRasterPos3d;
  glRasterPos3dv: TglRasterPos3dv;
  glRasterPos3f: TglRasterPos3f;
  glRasterPos3fv: TglRasterPos3fv;
  glRasterPos3i: TglRasterPos3i;
  glRasterPos3iv: TglRasterPos3iv;
  glRasterPos3s: TglRasterPos3s;
  glRasterPos3sv: TglRasterPos3sv;
  glRasterPos4d: TglRasterPos4d;
  glRasterPos4dv: TglRasterPos4dv;
  glRasterPos4f: TglRasterPos4f;
  glRasterPos4fv: TglRasterPos4fv;
  glRasterPos4i: TglRasterPos4i;
  glRasterPos4iv: TglRasterPos4iv;
  glRasterPos4s: TglRasterPos4s;
  glRasterPos4sv: TglRasterPos4sv;
  glRectd: TglRectd;
  glRectdv: TglRectdv;
  glRectf: TglRectf;
  glRectfv: TglRectfv;
  glRecti: TglRecti;
  glRectiv: TglRectiv;
  glRects: TglRects;
  glRectsv: TglRectsv;
  glRenderMode: TglRenderMode;
  glRotated: TglRotated;
  glRotatef: TglRotatef;
  glScaled: TglScaled;
  glScalef: TglScalef;
  glSelectBuffer: TglSelectBuffer;
  glShadeModel: TglShadeModel;
  glTexCoord1d: TglTexCoord1d;
  glTexCoord1dv: TglTexCoord1dv;
  glTexCoord1f: TglTexCoord1f;
  glTexCoord1fv: TglTexCoord1fv;
  glTexCoord1i: TglTexCoord1i;
  glTexCoord1iv: TglTexCoord1iv;
  glTexCoord1s: TglTexCoord1s;
  glTexCoord1sv: TglTexCoord1sv;
  glTexCoord2d: TglTexCoord2d;
  glTexCoord2dv: TglTexCoord2dv;
  glTexCoord2f: TglTexCoord2f;
  glTexCoord2fv: TglTexCoord2fv;
  glTexCoord2i: TglTexCoord2i;
  glTexCoord2iv: TglTexCoord2iv;
  glTexCoord2s: TglTexCoord2s;
  glTexCoord2sv: TglTexCoord2sv;
  glTexCoord3d: TglTexCoord3d;
  glTexCoord3dv: TglTexCoord3dv;
  glTexCoord3f: TglTexCoord3f;
  glTexCoord3fv: TglTexCoord3fv;
  glTexCoord3i: TglTexCoord3i;
  glTexCoord3iv: TglTexCoord3iv;
  glTexCoord3s: TglTexCoord3s;
  glTexCoord3sv: TglTexCoord3sv;
  glTexCoord4d: TglTexCoord4d;
  glTexCoord4dv: TglTexCoord4dv;
  glTexCoord4f: TglTexCoord4f;
  glTexCoord4fv: TglTexCoord4fv;
  glTexCoord4i: TglTexCoord4i;
  glTexCoord4iv: TglTexCoord4iv;
  glTexCoord4s: TglTexCoord4s;
  glTexCoord4sv: TglTexCoord4sv;
  glTexCoordPointer: TglTexCoordPointer;
  glTexEnvf: TglTexEnvf;
  glTexEnvfv: TglTexEnvfv;
  glTexEnvi: TglTexEnvi;
  glTexEnviv: TglTexEnviv;
  glTexGend: TglTexGend;
  glTexGendv: TglTexGendv;
  glTexGenf: TglTexGenf;
  glTexGenfv: TglTexGenfv;
  glTexGeni: TglTexGeni;
  glTexGeniv: TglTexGeniv;
  glTranslated: TglTranslated;
  glTranslatef: TglTranslatef;
  glVertex2d: TglVertex2d;
  glVertex2dv: TglVertex2dv;
  glVertex2f: TglVertex2f;
  glVertex2fv: TglVertex2fv;
  glVertex2i: TglVertex2i;
  glVertex2iv: TglVertex2iv;
  glVertex2s: TglVertex2s;
  glVertex2sv: TglVertex2sv;
  glVertex3d: TglVertex3d;
  glVertex3dv: TglVertex3dv;
  glVertex3f: TglVertex3f;
  glVertex3fv: TglVertex3fv;
  glVertex3i: TglVertex3i;
  glVertex3iv: TglVertex3iv;
  glVertex3s: TglVertex3s;
  glVertex3sv: TglVertex3sv;
  glVertex4d: TglVertex4d;
  glVertex4dv: TglVertex4dv;
  glVertex4f: TglVertex4f;
  glVertex4fv: TglVertex4fv;
  glVertex4i: TglVertex4i;
  glVertex4iv: TglVertex4iv;
  glVertex4s: TglVertex4s;
  glVertex4sv: TglVertex4sv;
  glVertexPointer: TglVertexPointer;
{$endif}

  // GL_VERSION_1_2
  glBlendColor: TglBlendColor;
  glBlendEquation: TglBlendEquation;
  glDrawRangeElements: TglDrawRangeElements;
  glTexImage3D: TglTexImage3D;
  glTexSubImage3D: TglTexSubImage3D;
  glCopyTexSubImage3D: TglCopyTexSubImage3D;
{$ifdef DGL_DEPRECATED}
  glColorTable: TglColorTable;
  glColorTableParameterfv: TglColorTableParameterfv;
  glColorTableParameteriv: TglColorTableParameteriv;
  glCopyColorTable: TglCopyColorTable;
  glGetColorTable: TglGetColorTable;
  glGetColorTableParameterfv: TglGetColorTableParameterfv;
  glGetColorTableParameteriv: TglGetColorTableParameteriv;
  glColorSubTable: TglColorSubTable;
  glCopyColorSubTable: TglCopyColorSubTable;
  glConvolutionFilter1D: TglConvolutionFilter1D;
  glConvolutionFilter2D: TglConvolutionFilter2D;
  glConvolutionParameterf: TglConvolutionParameterf;
  glConvolutionParameterfv: TglConvolutionParameterfv;
  glConvolutionParameteri: TglConvolutionParameteri;
  glConvolutionParameteriv: TglConvolutionParameteriv;
  glCopyConvolutionFilter1D: TglCopyConvolutionFilter1D;
  glCopyConvolutionFilter2D: TglCopyConvolutionFilter2D;
  glGetConvolutionFilter: TglGetConvolutionFilter;
  glGetConvolutionParameterfv: TglGetConvolutionParameterfv;
  glGetConvolutionParameteriv: TglGetConvolutionParameteriv;
  glGetSeparableFilter: TglGetSeparableFilter;
  glSeparableFilter2D: TglSeparableFilter2D;
  glGetHistogram: TglGetHistogram;
  glGetHistogramParameterfv: TglGetHistogramParameterfv;
  glGetHistogramParameteriv: TglGetHistogramParameteriv;
  glGetMinmax: TglGetMinmax;
  glGetMinmaxParameterfv: TglGetMinmaxParameterfv;
  glGetMinmaxParameteriv: TglGetMinmaxParameteriv;
  glHistogram: TglHistogram;
  glMinmax: TglMinmax;
  glResetHistogram: TglResetHistogram;
  glResetMinmax: TglResetMinmax;
{$endif}

  // GL_VERSION_1_3
  glActiveTexture: TglActiveTexture;
  glSampleCoverage: TglSampleCoverage;
  glCompressedTexImage3D: TglCompressedTexImage3D;
  glCompressedTexImage2D: TglCompressedTexImage2D;
  glCompressedTexImage1D: TglCompressedTexImage1D;
  glCompressedTexSubImage3D: TglCompressedTexSubImage3D;
  glCompressedTexSubImage2D: TglCompressedTexSubImage2D;
  glCompressedTexSubImage1D: TglCompressedTexSubImage1D;
  glGetCompressedTexImage: TglGetCompressedTexImage;
{$ifdef DGL_DEPRECATED}
  glClientActiveTexture: TglClientActiveTexture;
  glMultiTexCoord1d: TglMultiTexCoord1d;
  glMultiTexCoord1dv: TglMultiTexCoord1dv;
  glMultiTexCoord1f: TglMultiTexCoord1f;
  glMultiTexCoord1fv: TglMultiTexCoord1fv;
  glMultiTexCoord1i: TglMultiTexCoord1i;
  glMultiTexCoord1iv: TglMultiTexCoord1iv;
  glMultiTexCoord1s: TglMultiTexCoord1s;
  glMultiTexCoord1sv: TglMultiTexCoord1sv;
  glMultiTexCoord2d: TglMultiTexCoord2d;
  glMultiTexCoord2dv: TglMultiTexCoord2dv;
  glMultiTexCoord2f: TglMultiTexCoord2f;
  glMultiTexCoord2fv: TglMultiTexCoord2fv;
  glMultiTexCoord2i: TglMultiTexCoord2i;
  glMultiTexCoord2iv: TglMultiTexCoord2iv;
  glMultiTexCoord2s: TglMultiTexCoord2s;
  glMultiTexCoord2sv: TglMultiTexCoord2sv;
  glMultiTexCoord3d: TglMultiTexCoord3d;
  glMultiTexCoord3dv: TglMultiTexCoord3dv;
  glMultiTexCoord3f: TglMultiTexCoord3f;
  glMultiTexCoord3fv: TglMultiTexCoord3fv;
  glMultiTexCoord3i: TglMultiTexCoord3i;
  glMultiTexCoord3iv: TglMultiTexCoord3iv;
  glMultiTexCoord3s: TglMultiTexCoord3s;
  glMultiTexCoord3sv: TglMultiTexCoord3sv;
  glMultiTexCoord4d: TglMultiTexCoord4d;
  glMultiTexCoord4dv: TglMultiTexCoord4dv;
  glMultiTexCoord4f: TglMultiTexCoord4f;
  glMultiTexCoord4fv: TglMultiTexCoord4fv;
  glMultiTexCoord4i: TglMultiTexCoord4i;
  glMultiTexCoord4iv: TglMultiTexCoord4iv;
  glMultiTexCoord4s: TglMultiTexCoord4s;
  glMultiTexCoord4sv: TglMultiTexCoord4sv;
  glLoadTransposeMatrixf: TglLoadTransposeMatrixf;
  glLoadTransposeMatrixd: TglLoadTransposeMatrixd;
  glMultTransposeMatrixf: TglMultTransposeMatrixf;
  glMultTransposeMatrixd: TglMultTransposeMatrixd;
{$endif}

  // GL_VERSION_1_4
  glBlendFuncSeparate: TglBlendFuncSeparate;
  glMultiDrawArrays: TglMultiDrawArrays;
  glMultiDrawElements: TglMultiDrawElements;
  glPointParameterf: TglPointParameterf;
  glPointParameterfv: TglPointParameterfv;
  glPointParameteri: TglPointParameteri;
  glPointParameteriv: TglPointParameteriv;
{$ifdef DGL_DEPRECATED}
  glFogCoordf: TglFogCoordf;
  glFogCoordfv: TglFogCoordfv;
  glFogCoordd: TglFogCoordd;
  glFogCoorddv: TglFogCoorddv;
  glFogCoordPointer: TglFogCoordPointer;
  glSecondaryColor3b: TglSecondaryColor3b;
  glSecondaryColor3bv: TglSecondaryColor3bv;
  glSecondaryColor3d: TglSecondaryColor3d;
  glSecondaryColor3dv: TglSecondaryColor3dv;
  glSecondaryColor3f: TglSecondaryColor3f;
  glSecondaryColor3fv: TglSecondaryColor3fv;
  glSecondaryColor3i: TglSecondaryColor3i;
  glSecondaryColor3iv: TglSecondaryColor3iv;
  glSecondaryColor3s: TglSecondaryColor3s;
  glSecondaryColor3sv: TglSecondaryColor3sv;
  glSecondaryColor3ub: TglSecondaryColor3ub;
  glSecondaryColor3ubv: TglSecondaryColor3ubv;
  glSecondaryColor3ui: TglSecondaryColor3ui;
  glSecondaryColor3uiv: TglSecondaryColor3uiv;
  glSecondaryColor3us: TglSecondaryColor3us;
  glSecondaryColor3usv: TglSecondaryColor3usv;
  glSecondaryColorPointer: TglSecondaryColorPointer;
  glWindowPos2d: TglWindowPos2d;
  glWindowPos2dv: TglWindowPos2dv;
  glWindowPos2f: TglWindowPos2f;
  glWindowPos2fv: TglWindowPos2fv;
  glWindowPos2i: TglWindowPos2i;
  glWindowPos2iv: TglWindowPos2iv;
  glWindowPos2s: TglWindowPos2s;
  glWindowPos2sv: TglWindowPos2sv;
  glWindowPos3d: TglWindowPos3d;
  glWindowPos3dv: TglWindowPos3dv;
  glWindowPos3f: TglWindowPos3f;
  glWindowPos3fv: TglWindowPos3fv;
  glWindowPos3i: TglWindowPos3i;
  glWindowPos3iv: TglWindowPos3iv;
  glWindowPos3s: TglWindowPos3s;
  glWindowPos3sv: TglWindowPos3sv;
{$endif}

  // GL_VERSION_1_5
  glGenQueries: TglGenQueries;
  glDeleteQueries: TglDeleteQueries;
  glIsQuery: TglIsQuery;
  glBeginQuery: TglBeginQuery;
  glEndQuery: TglEndQuery;
  glGetQueryiv: TglGetQueryiv;
  glGetQueryObjectiv: TglGetQueryObjectiv;
  glGetQueryObjectuiv: TglGetQueryObjectuiv;
  glBindBuffer: TglBindBuffer;
  glDeleteBuffers: TglDeleteBuffers;
  glGenBuffers: TglGenBuffers;
  glIsBuffer: TglIsBuffer;
  glBufferData: TglBufferData;
  glBufferSubData: TglBufferSubData;
  glGetBufferSubData: TglGetBufferSubData;
  glMapBuffer: TglMapBuffer;
  glUnmapBuffer: TglUnmapBuffer;
  glGetBufferParameteriv: TglGetBufferParameteriv;
  glGetBufferPointerv: TglGetBufferPointerv;

  // GL_VERSION_2_0
  glBlendEquationSeparate: TglBlendEquationSeparate;
  glDrawBuffers: TglDrawBuffers;
  glStencilOpSeparate: TglStencilOpSeparate;
  glStencilFuncSeparate: TglStencilFuncSeparate;
  glStencilMaskSeparate: TglStencilMaskSeparate;
  glAttachShader: TglAttachShader;
  glBindAttribLocation: TglBindAttribLocation;
  glCompileShader: TglCompileShader;
  glCreateProgram: TglCreateProgram;
  glCreateShader: TglCreateShader;
  glDeleteProgram: TglDeleteProgram;
  glDeleteShader: TglDeleteShader;
  glDetachShader: TglDetachShader;
  glDisableVertexAttribArray: TglDisableVertexAttribArray;
  glEnableVertexAttribArray: TglEnableVertexAttribArray;
  glGetActiveAttrib: TglGetActiveAttrib;
  glGetActiveUniform: TglGetActiveUniform;
  glGetAttachedShaders: TglGetAttachedShaders;
  glGetAttribLocation: TglGetAttribLocation;
  glGetProgramiv: TglGetProgramiv;
  glGetProgramInfoLog: TglGetProgramInfoLog;
  glGetShaderiv: TglGetShaderiv;
  glGetShaderInfoLog: TglGetShaderInfoLog;
  glGetShaderSource: TglGetShaderSource;
  glGetUniformLocation: TglGetUniformLocation;
  glGetUniformfv: TglGetUniformfv;
  glGetUniformiv: TglGetUniformiv;
  glGetVertexAttribfv: TglGetVertexAttribfv;
  glGetVertexAttribiv: TglGetVertexAttribiv;
  glGetVertexAttribPointerv: TglGetVertexAttribPointerv;
  glIsProgram: TglIsProgram;
  glIsShader: TglIsShader;
  glLinkProgram: TglLinkProgram;
  glShaderSource: TglShaderSource;
  glUseProgram: TglUseProgram;
  glUniform1f: TglUniform1f;
  glUniform2f: TglUniform2f;
  glUniform3f: TglUniform3f;
  glUniform4f: TglUniform4f;
  glUniform1i: TglUniform1i;
  glUniform2i: TglUniform2i;
  glUniform3i: TglUniform3i;
  glUniform4i: TglUniform4i;
  glUniform1fv: TglUniform1fv;
  glUniform2fv: TglUniform2fv;
  glUniform3fv: TglUniform3fv;
  glUniform4fv: TglUniform4fv;
  glUniform1iv: TglUniform1iv;
  glUniform2iv: TglUniform2iv;
  glUniform3iv: TglUniform3iv;
  glUniform4iv: TglUniform4iv;
  glUniformMatrix2fv: TglUniformMatrix2fv;
  glUniformMatrix3fv: TglUniformMatrix3fv;
  glUniformMatrix4fv: TglUniformMatrix4fv;
  glValidateProgram: TglValidateProgram;
  glVertexAttrib1d: TglVertexAttrib1d;
  glVertexAttrib1dv: TglVertexAttrib1dv;
  glVertexAttrib1f: TglVertexAttrib1f;
  glVertexAttrib1fv: TglVertexAttrib1fv;
  glVertexAttrib1s: TglVertexAttrib1s;
  glVertexAttrib1sv: TglVertexAttrib1sv;
  glVertexAttrib2d: TglVertexAttrib2d;
  glVertexAttrib2dv: TglVertexAttrib2dv;
  glVertexAttrib2f: TglVertexAttrib2f;
  glVertexAttrib2fv: TglVertexAttrib2fv;
  glVertexAttrib2s: TglVertexAttrib2s;
  glVertexAttrib2sv: TglVertexAttrib2sv;
  glVertexAttrib3d: TglVertexAttrib3d;
  glVertexAttrib3dv: TglVertexAttrib3dv;
  glVertexAttrib3f: TglVertexAttrib3f;
  glVertexAttrib3fv: TglVertexAttrib3fv;
  glVertexAttrib3s: TglVertexAttrib3s;
  glVertexAttrib3sv: TglVertexAttrib3sv;
  glVertexAttrib4Nbv: TglVertexAttrib4Nbv;
  glVertexAttrib4Niv: TglVertexAttrib4Niv;
  glVertexAttrib4Nsv: TglVertexAttrib4Nsv;
  glVertexAttrib4Nub: TglVertexAttrib4Nub;
  glVertexAttrib4Nubv: TglVertexAttrib4Nubv;
  glVertexAttrib4Nuiv: TglVertexAttrib4Nuiv;
  glVertexAttrib4Nusv: TglVertexAttrib4Nusv;
  glVertexAttrib4bv: TglVertexAttrib4bv;
  glVertexAttrib4d: TglVertexAttrib4d;
  glVertexAttrib4dv: TglVertexAttrib4dv;
  glVertexAttrib4f: TglVertexAttrib4f;
  glVertexAttrib4fv: TglVertexAttrib4fv;
  glVertexAttrib4iv: TglVertexAttrib4iv;
  glVertexAttrib4s: TglVertexAttrib4s;
  glVertexAttrib4sv: TglVertexAttrib4sv;
  glVertexAttrib4ubv: TglVertexAttrib4ubv;
  glVertexAttrib4uiv: TglVertexAttrib4uiv;
  glVertexAttrib4usv: TglVertexAttrib4usv;
  glVertexAttribPointer: TglVertexAttribPointer;

  // GL_VERSION_2_1
  glUniformMatrix2x3fv: TglUniformMatrix2x3fv;
  glUniformMatrix3x2fv: TglUniformMatrix3x2fv;
  glUniformMatrix2x4fv: TglUniformMatrix2x4fv;
  glUniformMatrix4x2fv: TglUniformMatrix4x2fv;
  glUniformMatrix3x4fv: TglUniformMatrix3x4fv;
  glUniformMatrix4x3fv: TglUniformMatrix4x3fv;

  // GL_VERSION_3_0
  glColorMaski: TglColorMaski;
  glGetBooleani_v: TglGetBooleani_v;
  glGetIntegeri_v: TglGetIntegeri_v;
  glEnablei: TglEnablei;
  glDisablei: TglDisablei;
  glIsEnabledi: TglIsEnabledi;
  glBeginTransformFeedback: TglBeginTransformFeedback;
  glEndTransformFeedback: TglEndTransformFeedback;
  glBindBufferRange: TglBindBufferRange;
  glBindBufferBase: TglBindBufferBase;
  glTransformFeedbackVaryings: TglTransformFeedbackVaryings;
  glGetTransformFeedbackVarying: TglGetTransformFeedbackVarying;
  glClampColor: TglClampColor;
  glBeginConditionalRender: TglBeginConditionalRender;
  glEndConditionalRender: TglEndConditionalRender;
  glVertexAttribI1i: TglVertexAttribI1i;
  glVertexAttribI2i: TglVertexAttribI2i;
  glVertexAttribI3i: TglVertexAttribI3i;
  glVertexAttribI4i: TglVertexAttribI4i;
  glVertexAttribI1ui: TglVertexAttribI1ui;
  glVertexAttribI2ui: TglVertexAttribI2ui;
  glVertexAttribI3ui: TglVertexAttribI3ui;
  glVertexAttribI4ui: TglVertexAttribI4ui;
  glVertexAttribI1iv: TglVertexAttribI1iv;
  glVertexAttribI2iv: TglVertexAttribI2iv;
  glVertexAttribI3iv: TglVertexAttribI3iv;
  glVertexAttribI4iv: TglVertexAttribI4iv;
  glVertexAttribI1uiv: TglVertexAttribI1uiv;
  glVertexAttribI2uiv: TglVertexAttribI2uiv;
  glVertexAttribI3uiv: TglVertexAttribI3uiv;
  glVertexAttribI4uiv: TglVertexAttribI4uiv;
  glVertexAttribI4bv: TglVertexAttribI4bv;
  glVertexAttribI4sv: TglVertexAttribI4sv;
  glVertexAttribI4ubv: TglVertexAttribI4ubv;
  glVertexAttribI4usv: TglVertexAttribI4usv;
  glVertexAttribIPointer: TglVertexAttribIPointer;
  glGetVertexAttribIiv: TglGetVertexAttribIiv;
  glGetVertexAttribIuiv: TglGetVertexAttribIuiv;
  glGetUniformuiv: TglGetUniformuiv;
  glBindFragDataLocation: TglBindFragDataLocation;
  glGetFragDataLocation: TglGetFragDataLocation;
  glUniform1ui: TglUniform1ui;
  glUniform2ui: TglUniform2ui;
  glUniform3ui: TglUniform3ui;
  glUniform4ui: TglUniform4ui;
  glUniform1uiv: TglUniform1uiv;
  glUniform2uiv: TglUniform2uiv;
  glUniform3uiv: TglUniform3uiv;
  glUniform4uiv: TglUniform4uiv;
  glTexParameterIiv: TglTexParameterIiv;
  glTexParameterIuiv: TglTexParameterIuiv;
  glGetTexParameterIiv: TglGetTexParameterIiv;
  glGetTexParameterIuiv: TglGetTexParameterIuiv;
  glClearBufferiv: TglClearBufferiv;
  glClearBufferuiv: TglClearBufferuiv;
  glClearBufferfv: TglClearBufferfv;
  glClearBufferfi: TglClearBufferfi;
  glGetStringi: TglGetStringi;

  // GL_VERSION_3_1
  glDrawArraysInstanced: TglDrawArraysInstanced;
  glDrawElementsInstanced: TglDrawElementsInstanced;
  glTexBuffer: TglTexBuffer;
  glPrimitiveRestartIndex: TglPrimitiveRestartIndex;

  // GL_VERSION_3_2
  { OpenGL 3.2 also reuses entry points from these extensions: }
  { ARB_draw_elements_base_vertex }
  { ARB_provoking_vertex }
  { ARB_sync }
  { ARB_texture_multisample }
  glGetInteger64i_v: TglGetInteger64i_v;
  glGetBufferParameteri64v: TglGetBufferParameteri64v;
  glFramebufferTexture: TglFramebufferTexture;
//  glFramebufferTextureFace: TglFramebufferTextureFace;

  // GL_VERSION_3_3
  glVertexAttribDivisor: TglVertexAttribDivisor;
  
  // GL_VERSION_4_0
  { OpenGL 4.0 also reuses entry points from these extensions: }
  { ARB_texture_query_lod (no entry points) }
  { ARB_draw_indirect }
  { ARB_gpu_shader5 (no entry points) }
  { ARB_gpu_shader_fp64 }
  { ARB_shader_subroutine }
  { ARB_tessellation_shader }
  { ARB_texture_buffer_object_rgb32 (no entry points) }
  { ARB_texture_cube_map_array (no entry points) }
  { ARB_texture_gather (no entry points) }
  { ARB_transform_feedback2 }
  { ARB_transform_feedback3 }
  glMinSampleShading: TglMinSampleShading;
  glBlendEquationi: TglBlendEquationi;
  glBlendEquationSeparatei: TglBlendEquationSeparatei;
  glBlendFunci: TglBlendFunci;
  glBlendFuncSeparatei: TglBlendFuncSeparatei;

  // GL_3DFX_tbuffer
  glTbufferMask3DFX: TglTbufferMask3DFX;

  // GL_APPLE_element_array
  glElementPointerAPPLE: TglElementPointerAPPLE;
  glDrawElementArrayAPPLE: TglDrawElementArrayAPPLE;
  glDrawRangeElementArrayAPPLE: TglDrawRangeElementArrayAPPLE;
  glMultiDrawElementArrayAPPLE: TglMultiDrawElementArrayAPPLE;
  glMultiDrawRangeElementArrayAPPLE: TglMultiDrawRangeElementArrayAPPLE;

  // GL_APPLE_fence
  glGenFencesAPPLE: TglGenFencesAPPLE;
  glDeleteFencesAPPLE: TglDeleteFencesAPPLE;
  glSetFenceAPPLE: TglSetFenceAPPLE;
  glIsFenceAPPLE: TglIsFenceAPPLE;
  glTestFenceAPPLE: TglTestFenceAPPLE;
  glFinishFenceAPPLE: TglFinishFenceAPPLE;
  glTestObjectAPPLE: TglTestObjectAPPLE;
  glFinishObjectAPPLE: TglFinishObjectAPPLE;

  // GL_APPLE_vertex_array_object
  glBindVertexArrayAPPLE: TglBindVertexArrayAPPLE;
  glDeleteVertexArraysAPPLE: TglDeleteVertexArraysAPPLE;
  glGenVertexArraysAPPLE: TglGenVertexArraysAPPLE;
  glIsVertexArrayAPPLE: TglIsVertexArrayAPPLE;

  // GL_APPLE_vertex_array_range
  glVertexArrayRangeAPPLE: TglVertexArrayRangeAPPLE;
  glFlushVertexArrayRangeAPPLE: TglFlushVertexArrayRangeAPPLE;
  glVertexArrayParameteriAPPLE: TglVertexArrayParameteriAPPLE;

  // GL_APPLE_texture_range
  glTextureRangeAPPLE: TglTextureRangeAPPLE;
  glGetTexParameterPointervAPPLE: TglGetTexParameterPointervAPPLE;

  // GL_APPLE_vertex_program_evaluators
  glEnableVertexAttribAPPLE: TglEnableVertexAttribAPPLE;
  glDisableVertexAttribAPPLE: TglDisableVertexAttribAPPLE;
  glIsVertexAttribEnabledAPPLE: TglIsVertexAttribEnabledAPPLE;
  glMapVertexAttrib1dAPPLE: TglMapVertexAttrib1dAPPLE;
  glMapVertexAttrib1fAPPLE: TglMapVertexAttrib1fAPPLE;
  glMapVertexAttrib2dAPPLE: TglMapVertexAttrib2dAPPLE;
  glMapVertexAttrib2fAPPLE: TglMapVertexAttrib2fAPPLE;

  // GL_APPLE_object_purgeable
  glObjectPurgeableAPPLE: TglObjectPurgeableAPPLE;
  glObjectUnpurgeableAPPLE: TglObjectUnpurgeableAPPLE;
  glGetObjectParameterivAPPLE: TglGetObjectParameterivAPPLE;

  // GL_ARB_matrix_palette
  glCurrentPaletteMatrixARB: TglCurrentPaletteMatrixARB;
  glMatrixIndexubvARB: TglMatrixIndexubvARB;
  glMatrixIndexusvARB: TglMatrixIndexusvARB;
  glMatrixIndexuivARB: TglMatrixIndexuivARB;
  glMatrixIndexPointerARB: TglMatrixIndexPointerARB;

  // GL_ARB_multisample
  glSampleCoverageARB: TglSampleCoverageARB;

  // GL_ARB_multitexture
  glActiveTextureARB: TglActiveTextureARB;
  glClientActiveTextureARB: TglClientActiveTextureARB;
  glMultiTexCoord1dARB: TglMultiTexCoord1dARB;
  glMultiTexCoord1dvARB: TglMultiTexCoord1dvARB;
  glMultiTexCoord1fARB: TglMultiTexCoord1fARB;
  glMultiTexCoord1fvARB: TglMultiTexCoord1fvARB;
  glMultiTexCoord1iARB: TglMultiTexCoord1iARB;
  glMultiTexCoord1ivARB: TglMultiTexCoord1ivARB;
  glMultiTexCoord1sARB: TglMultiTexCoord1sARB;
  glMultiTexCoord1svARB: TglMultiTexCoord1svARB;
  glMultiTexCoord2dARB: TglMultiTexCoord2dARB;
  glMultiTexCoord2dvARB: TglMultiTexCoord2dvARB;
  glMultiTexCoord2fARB: TglMultiTexCoord2fARB;
  glMultiTexCoord2fvARB: TglMultiTexCoord2fvARB;
  glMultiTexCoord2iARB: TglMultiTexCoord2iARB;
  glMultiTexCoord2ivARB: TglMultiTexCoord2ivARB;
  glMultiTexCoord2sARB: TglMultiTexCoord2sARB;
  glMultiTexCoord2svARB: TglMultiTexCoord2svARB;
  glMultiTexCoord3dARB: TglMultiTexCoord3dARB;
  glMultiTexCoord3dvARB: TglMultiTexCoord3dvARB;
  glMultiTexCoord3fARB: TglMultiTexCoord3fARB;
  glMultiTexCoord3fvARB: TglMultiTexCoord3fvARB;
  glMultiTexCoord3iARB: TglMultiTexCoord3iARB;
  glMultiTexCoord3ivARB: TglMultiTexCoord3ivARB;
  glMultiTexCoord3sARB: TglMultiTexCoord3sARB;
  glMultiTexCoord3svARB: TglMultiTexCoord3svARB;
  glMultiTexCoord4dARB: TglMultiTexCoord4dARB;
  glMultiTexCoord4dvARB: TglMultiTexCoord4dvARB;
  glMultiTexCoord4fARB: TglMultiTexCoord4fARB;
  glMultiTexCoord4fvARB: TglMultiTexCoord4fvARB;
  glMultiTexCoord4iARB: TglMultiTexCoord4iARB;
  glMultiTexCoord4ivARB: TglMultiTexCoord4ivARB;
  glMultiTexCoord4sARB: TglMultiTexCoord4sARB;
  glMultiTexCoord4svARB: TglMultiTexCoord4svARB;

  // GL_ARB_point_parameters
  glPointParameterfARB: TglPointParameterfARB;
  glPointParameterfvARB: TglPointParameterfvARB;

  // GL_ARB_texture_compression
  glCompressedTexImage3DARB: TglCompressedTexImage3DARB;
  glCompressedTexImage2DARB: TglCompressedTexImage2DARB;
  glCompressedTexImage1DARB: TglCompressedTexImage1DARB;
  glCompressedTexSubImage3DARB: TglCompressedTexSubImage3DARB;
  glCompressedTexSubImage2DARB: TglCompressedTexSubImage2DARB;
  glCompressedTexSubImage1DARB: TglCompressedTexSubImage1DARB;
  glGetCompressedTexImageARB: TglGetCompressedTexImageARB;

  // GL_ARB_transpose_matrix
  glLoadTransposeMatrixfARB: TglLoadTransposeMatrixfARB;
  glLoadTransposeMatrixdARB: TglLoadTransposeMatrixdARB;
  glMultTransposeMatrixfARB: TglMultTransposeMatrixfARB;
  glMultTransposeMatrixdARB: TglMultTransposeMatrixdARB;

  // GL_ARB_vertex_blend
  glWeightbvARB: TglWeightbvARB;
  glWeightsvARB: TglWeightsvARB;
  glWeightivARB: TglWeightivARB;
  glWeightfvARB: TglWeightfvARB;
  glWeightdvARB: TglWeightdvARB;
  glWeightubvARB: TglWeightubvARB;
  glWeightusvARB: TglWeightusvARB;
  glWeightuivARB: TglWeightuivARB;
  glWeightPointerARB: TglWeightPointerARB;
  glVertexBlendARB: TglVertexBlendARB;

  // GL_ARB_vertex_buffer_object
  glBindBufferARB: TglBindBufferARB;
  glDeleteBuffersARB: TglDeleteBuffersARB;
  glGenBuffersARB: TglGenBuffersARB;
  glIsBufferARB: TglIsBufferARB;
  glBufferDataARB: TglBufferDataARB;
  glBufferSubDataARB: TglBufferSubData;
  glGetBufferSubDataARB: TglGetBufferSubDataARB;
  glMapBufferARB: TglMapBufferARB;
  glUnmapBufferARB: TglUnmapBufferARB;
  glGetBufferParameterivARB: TglGetBufferParameterivARB;
  glGetBufferPointervARB: TglGetBufferPointervARB;

  // GL_ARB_vertex_program
  glVertexAttrib1dARB: TglVertexAttrib1dARB;
  glVertexAttrib1dvARB: TglVertexAttrib1dvARB;
  glVertexAttrib1fARB: TglVertexAttrib1fARB;
  glVertexAttrib1fvARB: TglVertexAttrib1fvARB;
  glVertexAttrib1sARB: TglVertexAttrib1sARB;
  glVertexAttrib1svARB: TglVertexAttrib1svARB;
  glVertexAttrib2dARB: TglVertexAttrib2dARB;
  glVertexAttrib2dvARB: TglVertexAttrib2dvARB;
  glVertexAttrib2fARB: TglVertexAttrib2fARB;
  glVertexAttrib2fvARB: TglVertexAttrib2fvARB;
  glVertexAttrib2sARB: TglVertexAttrib2sARB;
  glVertexAttrib2svARB: TglVertexAttrib2svARB;
  glVertexAttrib3dARB: TglVertexAttrib3dARB;
  glVertexAttrib3dvARB: TglVertexAttrib3dvARB;
  glVertexAttrib3fARB: TglVertexAttrib3fARB;
  glVertexAttrib3fvARB: TglVertexAttrib3fvARB;
  glVertexAttrib3sARB: TglVertexAttrib3sARB;
  glVertexAttrib3svARB: TglVertexAttrib3svARB;
  glVertexAttrib4NbvARB: TglVertexAttrib4NbvARB;
  glVertexAttrib4NivARB: TglVertexAttrib4NivARB;
  glVertexAttrib4NsvARB: TglVertexAttrib4NsvARB;
  glVertexAttrib4NubARB: TglVertexAttrib4NubARB;
  glVertexAttrib4NubvARB: TglVertexAttrib4NubvARB;
  glVertexAttrib4NuivARB: TglVertexAttrib4NuivARB;
  glVertexAttrib4NusvARB: TglVertexAttrib4NusvARB;
  glVertexAttrib4bvARB: TglVertexAttrib4bvARB;
  glVertexAttrib4dARB: TglVertexAttrib4dARB;
  glVertexAttrib4dvARB: TglVertexAttrib4dvARB;
  glVertexAttrib4fARB: TglVertexAttrib4fARB;
  glVertexAttrib4fvARB: TglVertexAttrib4fvARB;
  glVertexAttrib4ivARB: TglVertexAttrib4ivARB;
  glVertexAttrib4sARB: TglVertexAttrib4sARB;
  glVertexAttrib4svARB: TglVertexAttrib4svARB;
  glVertexAttrib4ubvARB: TglVertexAttrib4ubvARB;
  glVertexAttrib4uivARB: TglVertexAttrib4uivARB;
  glVertexAttrib4usvARB: TglVertexAttrib4usvARB;
  glVertexAttribPointerARB: TglVertexAttribPointerARB;
  glEnableVertexAttribArrayARB: TglEnableVertexAttribArrayARB;
  glDisableVertexAttribArrayARB: TglDisableVertexAttribArrayARB;
  glProgramStringARB: TglProgramStringARB;
  glBindProgramARB: TglBindProgramARB;
  glDeleteProgramsARB: TglDeleteProgramsARB;
  glGenProgramsARB: TglGenProgramsARB;

  glProgramEnvParameter4dARB: TglProgramEnvParameter4dARB;
  glProgramEnvParameter4dvARB: TglProgramEnvParameter4dvARB;
  glProgramEnvParameter4fARB: TglProgramEnvParameter4fARB;
  glProgramEnvParameter4fvARB: TglProgramEnvParameter4fvARB;
  glProgramLocalParameter4dARB: TglProgramLocalParameter4dARB;
  glProgramLocalParameter4dvARB: TglProgramLocalParameter4dvARB;
  glProgramLocalParameter4fARB: TglProgramLocalParameter4fARB;
  glProgramLocalParameter4fvARB: TglProgramLocalParameter4fvARB;
  glGetProgramEnvParameterdvARB: TglGetProgramEnvParameterdvARB;
  glGetProgramEnvParameterfvARB: TglGetProgramEnvParameterfvARB;
  glGetProgramLocalParameterdvARB: TglGetProgramLocalParameterdvARB;
  glGetProgramLocalParameterfvARB: TglGetProgramLocalParameterfvARB;
  glGetProgramivARB: TglGetProgramivARB;
  glGetProgramStringARB: TglGetProgramStringARB;
  glGetVertexAttribdvARB: TglGetVertexAttribdvARB;
  glGetVertexAttribfvARB: TglGetVertexAttribfvARB;
  glGetVertexAttribivARB: TglGetVertexAttribivARB;
  glGetVertexAttribPointervARB: TglGetVertexAttribPointervARB;
  glIsProgramARB: TglIsProgramARB;

  // GL_ARB_window_pos
  glWindowPos2dARB: TglWindowPos2dARB;
  glWindowPos2dvARB: TglWindowPos2dvARB;
  glWindowPos2fARB: TglWindowPos2fARB;
  glWindowPos2fvARB: TglWindowPos2fvARB;
  glWindowPos2iARB: TglWindowPos2iARB;
  glWindowPos2ivARB: TglWindowPos2ivARB;
  glWindowPos2sARB: TglWindowPos2sARB;
  glWindowPos2svARB: TglWindowPos2svARB;
  glWindowPos3dARB: TglWindowPos3dARB;
  glWindowPos3dvARB: TglWindowPos3dvARB;
  glWindowPos3fARB: TglWindowPos3fARB;
  glWindowPos3fvARB: TglWindowPos3fvARB;
  glWindowPos3iARB: TglWindowPos3iARB;
  glWindowPos3ivARB: TglWindowPos3ivARB;
  glWindowPos3sARB: TglWindowPos3sARB;
  glWindowPos3svARB: TglWindowPos3svARB;

  // GL_ARB_draw_buffers
  glDrawBuffersARB: TglDrawBuffersARB;

  // GL_ARB_color_buffer_float
  glClampColorARB: TglClampColorARB;

  // GL_ARB_vertex_shader
  glGetActiveAttribARB: TglGetActiveAttribARB;
  glGetAttribLocationARB: TglGetAttribLocationARB;
  glBindAttribLocationARB: TglBindAttribLocationARB;

  // GL_ARB_shader_objects
  glDeleteObjectARB: TglDeleteObjectARB;
  glGetHandleARB: TglGetHandleARB;
  glDetachObjectARB: TglDetachObjectARB;
  glCreateShaderObjectARB: TglCreateShaderObjectARB;
  glShaderSourceARB: TglShaderSourceARB;
  glCompileShaderARB: TglCompileShaderARB;
  glCreateProgramObjectARB: TglCreateProgramObjectARB;
  glAttachObjectARB: TglAttachObjectARB;
  glLinkProgramARB: TglLinkProgramARB;
  glUseProgramObjectARB: TglUseProgramObjectARB;
  glValidateProgramARB: TglValidateProgramARB;
  glUniform1fARB: TglUniform1fARB;
  glUniform2fARB: TglUniform2fARB;
  glUniform3fARB: TglUniform3fARB;
  glUniform4fARB: TglUniform4fARB;
  glUniform1iARB: TglUniform1iARB;
  glUniform2iARB: TglUniform2iARB;
  glUniform3iARB: TglUniform3iARB;
  glUniform4iARB: TglUniform4iARB;
  glUniform1fvARB: TglUniform1fvARB;
  glUniform2fvARB: TglUniform2fvARB;
  glUniform3fvARB: TglUniform3fvARB;
  glUniform4fvARB: TglUniform4fvARB;
  glUniform1ivARB: TglUniform1ivARB;
  glUniform2ivARB: TglUniform2ivARB;
  glUniform3ivARB: TglUniform3ivARB;
  glUniform4ivARB: TglUniform4ivARB;
  glUniformMatrix2fvARB: TglUniformMatrix2fvARB;
  glUniformMatrix3fvARB: TglUniformMatrix3fvARB;
  glUniformMatrix4fvARB: TglUniformMatrix4fvARB;
  glGetObjectParameterfvARB: TglGetObjectParameterfvARB;
  glGetObjectParameterivARB: TglGetObjectParameterivARB;
  glGetInfoLogARB: TglGetInfoLogARB;
  glGetAttachedObjectsARB: TglGetAttachedObjectsARB;
  glGetUniformLocationARB: TglGetUniformLocationARB;
  glGetActiveUniformARB: TglGetActiveUniformARB;
  glGetUniformfvARB: TglGetUniformfvARB;
  glGetUniformivARB: TglGetUniformivARB;
  glGetShaderSourceARB: TglGetShaderSourceARB;

  // GL_ARB_Occlusion_Query
  glGenQueriesARB: TglGenQueriesARB;
  glDeleteQueriesARB: TglDeleteQueriesARB;
  glIsQueryARB: TglIsQueryARB;
  glBeginQueryARB: TglBeginQueryARB;
  glEndQueryARB: TglEndQueryARB;
  glGetQueryivARB: TglGetQueryivARB;
  glGetQueryObjectivARB: TglGetQueryObjectivARB;
  glGetQueryObjectuivARB: TglGetQueryObjectuivARB;

  // GL_ARB_draw_instanced
  glDrawArraysInstancedARB: TglDrawArraysInstancedARB;
  glDrawElementsInstancedARB: TglDrawElementsInstancedARB;

  // GL_ARB_framebuffer_object
  glIsRenderbuffer: TglIsRenderbuffer;
  glBindRenderbuffer: TglBindRenderbuffer;
  glDeleteRenderbuffers: TglDeleteRenderbuffers;
  glGenRenderbuffers: TglGenRenderbuffers;
  glRenderbufferStorage: TglRenderbufferStorage;
  glGetRenderbufferParameteriv: TglGetRenderbufferParameteriv;
  glIsFramebuffer: TglIsFramebuffer;
  glBindFramebuffer: TglBindFramebuffer;
  glDeleteFramebuffers: TglDeleteFramebuffers;
  glGenFramebuffers: TglGenFramebuffers;
  glCheckFramebufferStatus: TglCheckFramebufferStatus;
  glFramebufferTexture1D: TglFramebufferTexture1D;
  glFramebufferTexture2D: TglFramebufferTexture2D;
  glFramebufferTexture3D: TglFramebufferTexture3D;
  glFramebufferRenderbuffer: TglFramebufferRenderbuffer;
  glGetFramebufferAttachmentParameteriv: TglGetFramebufferAttachmentParameteriv;
  glGenerateMipmap: TglGenerateMipmap;
  glBlitFramebuffer: TglBlitFramebuffer;
  glRenderbufferStorageMultisample: TglRenderbufferStorageMultisample;
  glFramebufferTextureLayer: TglFramebufferTextureLayer;

  // GL_ARB_geometry_shader4
  glProgramParameteriARB: TglProgramParameteriARB;
  glFramebufferTextureARB: TglFramebufferTextureARB;
  glFramebufferTextureLayerARB: TglFramebufferTextureLayerARB;
  glFramebufferTextureFaceARB: TglFramebufferTextureFaceARB;

  // GL_ARB_instanced_arrays
  glVertexAttribDivisorARB: TglVertexAttribDivisorARB;

  // GL_ARB_map_buffer_range
  glMapBufferRange: TglMapBufferRange;
  glFlushMappedBufferRange: TglFlushMappedBufferRange;

  // GL_ARB_texture_buffer_object
  glTexBufferARB: TglTexBufferARB;

  // GL_ARB_vertex_array_object
  glBindVertexArray: TglBindVertexArray;
  glDeleteVertexArrays: TglDeleteVertexArrays;
  glGenVertexArrays: TglGenVertexArrays;
  glIsVertexArray: TglIsVertexArray;

  // GL_ARB_uniform_buffer_object
  glGetUniformIndices: TglGetUniformIndices;
  glGetActiveUniformsiv: TglGetActiveUniformsiv;
  glGetActiveUniformName: TglGetActiveUniformName;
  glGetUniformBlockIndex: TglGetUniformBlockIndex;
  glGetActiveUniformBlockiv: TglGetActiveUniformBlockiv;
  glGetActiveUniformBlockName: TglGetActiveUniformBlockName;
  glUniformBlockBinding: TglUniformBlockBinding;

  // GL_ARB_copy_buffer
  glCopyBufferSubData: TglCopyBufferSubData;

  // GL_ARB_draw_elements_base_vertex
  glDrawElementsBaseVertex: TglDrawElementsBaseVertex;
  glDrawRangeElementsBaseVertex: TglDrawRangeElementsBaseVertex;
  glDrawElementsInstancedBaseVertex: TglDrawElementsInstancedBaseVertex;
  glMultiDrawElementsBaseVertex: TglMultiDrawElementsBaseVertex;

  // GL_ARB_provoking_vertex
  glProvokingVertex: TglProvokingVertex;

  // GL_ARB_sync
  glFenceSync: TglFenceSync;
  glIsSync: TglIsSync;
  glDeleteSync: TglDeleteSync;
  glClientWaitSync: TglClientWaitSync;
  glWaitSync: TglWaitSync;
  glGetInteger64v: TglGetInteger64v;
  glGetSynciv: TglGetSynciv;

  // GL_ARB_texture_multisample
  glTexImage2DMultisample: TglTexImage2DMultisample;
  glTexImage3DMultisample: TglTexImage3DMultisample;
  glGetMultisamplefv: TglGetMultisamplefv;
  glSampleMaski: TglSampleMaski;

  // GL_ARB_draw_buffers_blend
  glBlendEquationiARB: TglBlendEquationiARB;
  glBlendEquationSeparateiARB: TglBlendEquationSeparateiARB;
  glBlendFunciARB: TglBlendFunciARB;
  glBlendFuncSeparateiARB: TglBlendFuncSeparateiARB;

  // GL_ARB_sample_shading
  glMinSampleShadingARB: TglMinSampleShadingARB;

  // GL_ARB_shading_language_include
  glNamedStringARB: TglNamedStringARB;
  glDeleteNamedStringARB: TglDeleteNamedStringARB;
  glCompileShaderIncludeARB: TglCompileShaderIncludeARB;
  glIsNamedStringARB: TglIsNamedStringARB;
  glGetNamedStringARB: TglGetNamedStringARB;
  glGetNamedStringivARB: TglGetNamedStringivARB;

  // GL_ARB_blend_func_extended
  glBindFragDataLocationIndexed: TglBindFragDataLocationIndexed;
  glGetFragDataIndex: TglGetFragDataIndex;

  // GL_ARB_sampler_objects
  glGenSamplers: TglGenSamplers;
  glDeleteSamplers: TglDeleteSamplers;
  glIsSampler: TglIsSampler;
  glBindSampler: TglBindSampler;
  glSamplerParameteri: TglSamplerParameteri;
  glSamplerParameteriv: TglSamplerParameteriv;
  glSamplerParameterf: TglSamplerParameterf;
  glSamplerParameterfv: TglSamplerParameterfv;
  glSamplerParameterIiv: TglSamplerParameterIiv;
  glSamplerParameterIuiv: TglSamplerParameterIuiv;
  glGetSamplerParameteriv: TglGetSamplerParameteriv;
  glGetSamplerParameterIiv: TglGetSamplerParameterIiv;
  glGetSamplerParameterfv: TglGetSamplerParameterfv;
  glGetSamplerParameterIuiv: TglGetSamplerParameterIuiv;

  // GL_ARB_timer_query
  glQueryCounter: TglQueryCounter;
  glGetQueryObjecti64v: TglGetQueryObjecti64v;
  glGetQueryObjectui64v: TglGetQueryObjectui64v;

  // GL_ARB_vertex_type_2_10_10_10_rev
  glVertexP2ui: TglVertexP2ui;
  glVertexP2uiv: TglVertexP2uiv;
  glVertexP3ui: TglVertexP3ui;
  glVertexP3uiv: TglVertexP3uiv;
  glVertexP4ui: TglVertexP4ui;
  glVertexP4uiv: TglVertexP4uiv;
  glTexCoordP1ui: TglTexCoordP1ui;
  glTexCoordP1uiv: TglTexCoordP1uiv;
  glTexCoordP2ui: TglTexCoordP2ui;
  glTexCoordP2uiv: TglTexCoordP2uiv;
  glTexCoordP3ui: TglTexCoordP3ui;
  glTexCoordP3uiv: TglTexCoordP3uiv;
  glTexCoordP4ui: TglTexCoordP4ui;
  glTexCoordP4uiv: TglTexCoordP4uiv;
  glMultiTexCoordP1ui: TglMultiTexCoordP1ui;
  glMultiTexCoordP1uiv: TglMultiTexCoordP1uiv;
  glMultiTexCoordP2ui: TglMultiTexCoordP2ui;
  glMultiTexCoordP2uiv: TglMultiTexCoordP2uiv;
  glMultiTexCoordP3ui: TglMultiTexCoordP3ui;
  glMultiTexCoordP3uiv: TglMultiTexCoordP3uiv;
  glMultiTexCoordP4ui: TglMultiTexCoordP4ui;
  glMultiTexCoordP4uiv: TglMultiTexCoordP4uiv;
  glNormalP3ui: TglNormalP3ui;
  glNormalP3uiv: TglNormalP3uiv;
  glColorP3ui: TglColorP3ui;
  glColorP3uiv: TglColorP3uiv;
  glColorP4ui: TglColorP4ui;
  glColorP4uiv: TglColorP4uiv;
  glSecondaryColorP3ui: TglSecondaryColorP3ui;
  glSecondaryColorP3uiv: TglSecondaryColorP3uiv;
  glVertexAttribP1ui: TglVertexAttribP1ui;
  glVertexAttribP1uiv: TglVertexAttribP1uiv;
  glVertexAttribP2ui: TglVertexAttribP2ui;
  glVertexAttribP2uiv: TglVertexAttribP2uiv;
  glVertexAttribP3ui: TglVertexAttribP3ui;
  glVertexAttribP3uiv: TglVertexAttribP3uiv;
  glVertexAttribP4ui: TglVertexAttribP4ui;
  glVertexAttribP4uiv: TglVertexAttribP4uiv;

  // GL_ARB_draw_indirect
  glDrawArraysIndirect: TglDrawArraysIndirect;
  glDrawElementsIndirect: TglDrawElementsIndirect;

  // GL_ARB_gpu_shader_fp64
  glUniform1d: TglUniform1d;
  glUniform2d: TglUniform2d;
  glUniform3d: TglUniform3d;
  glUniform4d: TglUniform4d;
  glUniform1dv: TglUniform1dv;
  glUniform2dv: TglUniform2dv;
  glUniform3dv: TglUniform3dv;
  glUniform4dv: TglUniform4dv;
  glUniformMatrix2dv: TglUniformMatrix2dv;
  glUniformMatrix3dv: TglUniformMatrix3dv;
  glUniformMatrix4dv: TglUniformMatrix4dv;
  glUniformMatrix2x3dv: TglUniformMatrix2x3dv;
  glUniformMatrix2x4dv: TglUniformMatrix2x4dv;
  glUniformMatrix3x2dv: TglUniformMatrix3x2dv;
  glUniformMatrix3x4dv: TglUniformMatrix3x4dv;
  glUniformMatrix4x2dv: TglUniformMatrix4x2dv;
  glUniformMatrix4x3dv: TglUniformMatrix4x3dv;
  glGetUniformdv: TglGetUniformdv;

  // GL_ARB_shader_subroutine
  glGetSubroutineUniformLocation: TglGetSubroutineUniformLocation;
  glGetSubroutineIndex: TglGetSubroutineIndex;
  glGetActiveSubroutineUniformiv: TglGetActiveSubroutineUniformiv;
  glGetActiveSubroutineUniformName: TglGetActiveSubroutineUniformName;
  glGetActiveSubroutineName: TglGetActiveSubroutineName;
  glUniformSubroutinesuiv: TglUniformSubroutinesuiv;
  glGetUniformSubroutineuiv: TglGetUniformSubroutineuiv;
  glGetProgramStageiv: TglGetProgramStageiv;

  // GL_ARB_tessellation_shader
  glPatchParameteri: TglPatchParameteri;
  glPatchParameterfv: TglPatchParameterfv;

  // GL_ARB_transform_feedback2
  glBindTransformFeedback: TglBindTransformFeedback;
  glDeleteTransformFeedbacks: TglDeleteTransformFeedbacks;
  glGenTransformFeedbacks: TglGenTransformFeedbacks;
  glIsTransformFeedback: TglIsTransformFeedback;
  glPauseTransformFeedback: TglPauseTransformFeedback;
  glResumeTransformFeedback: TglResumeTransformFeedback;
  glDrawTransformFeedback: TglDrawTransformFeedback;

  // GL_ARB_transform_feedback3
  glDrawTransformFeedbackStream: TglDrawTransformFeedbackStream;
  glBeginQueryIndexed: TglBeginQueryIndexed;
  glEndQueryIndexed: TglEndQueryIndexed;
  glGetQueryIndexediv: TglGetQueryIndexediv;

  // GL_ARB_ES2_compatibility
  glReleaseShaderCompiler: TglReleaseShaderCompiler;
  glShaderBinary: TglShaderBinary;
  glGetShaderPrecisionFormat: TglGetShaderPrecisionFormat;
  glDepthRangef: TglDepthRangef;
  glClearDepthf: TglClearDepthf;

  // GL_ARB_get_program_binary
  glGetProgramBinary: TglGetProgramBinary;
  glProgramBinary: TglProgramBinary;
  glProgramParameteri: TglProgramParameteri;
  
  // GL_ARB_separate_shader_objects
  glUseProgramStages: TglUseProgramStages;
  glActiveShaderProgram: TglActiveShaderProgram;
  glCreateShaderProgramv: TglCreateShaderProgramv;
  glBindProgramPipeline: TglBindProgramPipeline;
  glDeleteProgramPipelines: TglDeleteProgramPipelines;
  glGenProgramPipelines: TglGenProgramPipelines;
  glIsProgramPipeline: TglIsProgramPipeline;
  glGetProgramPipelineiv: TglGetProgramPipelineiv;
  glProgramUniform1i: TglProgramUniform1i;
  glProgramUniform1iv: TglProgramUniform1iv;
  glProgramUniform1f: TglProgramUniform1f;
  glProgramUniform1fv: TglProgramUniform1fv;
  glProgramUniform1d: TglProgramUniform1d;
  glProgramUniform1dv: TglProgramUniform1dv;
  glProgramUniform1ui: TglProgramUniform1ui;
  glProgramUniform1uiv: TglProgramUniform1uiv;
  glProgramUniform2i: TglProgramUniform2i;
  glProgramUniform2iv: TglProgramUniform2iv;
  glProgramUniform2f: TglProgramUniform2f;
  glProgramUniform2fv: TglProgramUniform2fv;
  glProgramUniform2d: TglProgramUniform2d;
  glProgramUniform2dv: TglProgramUniform2dv;
  glProgramUniform2ui: TglProgramUniform2ui;
  glProgramUniform2uiv: TglProgramUniform2uiv;
  glProgramUniform3i: TglProgramUniform3i;
  glProgramUniform3iv: TglProgramUniform3iv;
  glProgramUniform3f: TglProgramUniform3f;
  glProgramUniform3fv: TglProgramUniform3fv;
  glProgramUniform3d: TglProgramUniform3d;
  glProgramUniform3dv: TglProgramUniform3dv;
  glProgramUniform3ui: TglProgramUniform3ui;
  glProgramUniform3uiv: TglProgramUniform3uiv;
  glProgramUniform4i: TglProgramUniform4i;
  glProgramUniform4iv: TglProgramUniform4iv;
  glProgramUniform4f: TglProgramUniform4f;
  glProgramUniform4fv: TglProgramUniform4fv;
  glProgramUniform4d: TglProgramUniform4d;
  glProgramUniform4dv: TglProgramUniform4dv;
  glProgramUniform4ui: TglProgramUniform4ui;
  glProgramUniform4uiv: TglProgramUniform4uiv;
  glProgramUniformMatrix2fv: TglProgramUniformMatrix2fv;
  glProgramUniformMatrix3fv: TglProgramUniformMatrix3fv;
  glProgramUniformMatrix4fv: TglProgramUniformMatrix4fv;
  glProgramUniformMatrix2dv: TglProgramUniformMatrix2dv;
  glProgramUniformMatrix3dv: TglProgramUniformMatrix3dv;
  glProgramUniformMatrix4dv: TglProgramUniformMatrix4dv;
  glProgramUniformMatrix2x3fv: TglProgramUniformMatrix2x3fv;
  glProgramUniformMatrix3x2fv: TglProgramUniformMatrix3x2fv;
  glProgramUniformMatrix2x4fv: TglProgramUniformMatrix2x4fv;
  glProgramUniformMatrix4x2fv: TglProgramUniformMatrix4x2fv;
  glProgramUniformMatrix3x4fv: TglProgramUniformMatrix3x4fv;
  glProgramUniformMatrix4x3fv: TglProgramUniformMatrix4x3fv;
  glProgramUniformMatrix2x3dv: TglProgramUniformMatrix2x3dv;
  glProgramUniformMatrix3x2dv: TglProgramUniformMatrix3x2dv;
  glProgramUniformMatrix2x4dv: TglProgramUniformMatrix2x4dv;
  glProgramUniformMatrix4x2dv: TglProgramUniformMatrix4x2dv;
  glProgramUniformMatrix3x4dv: TglProgramUniformMatrix3x4dv;
  glProgramUniformMatrix4x3dv: TglProgramUniformMatrix4x3dv;
  glValidateProgramPipeline: TglValidateProgramPipeline;
  glGetProgramPipelineInfoLog: TglGetProgramPipelineInfoLog;

  // GL_ARB_vertex_attrib_64bit
  glVertexAttribL1d: TglVertexAttribL1d;
  glVertexAttribL2d: TglVertexAttribL2d;
  glVertexAttribL3d: TglVertexAttribL3d;
  glVertexAttribL4d: TglVertexAttribL4d;
  glVertexAttribL1dv: TglVertexAttribL1dv;
  glVertexAttribL2dv: TglVertexAttribL2dv;
  glVertexAttribL3dv: TglVertexAttribL3dv;
  glVertexAttribL4dv: TglVertexAttribL4dv;
  glVertexAttribLPointer: TglVertexAttribLPointer;
  glGetVertexAttribLdv: TglGetVertexAttribLdv;

  // GL_ARB_viewport_array
  glViewportArrayv: TglViewportArrayv;
  glViewportIndexedf: TglViewportIndexedf;
  glViewportIndexedfv: TglViewportIndexedfv;
  glScissorArrayv: TglScissorArrayv;
  glScissorIndexed: TglScissorIndexed;
  glScissorIndexedv: TglScissorIndexedv;
  glDepthRangeArrayv: TglDepthRangeArrayv;
  glDepthRangeIndexed: TglDepthRangeIndexed;
  glGetFloati_v: TglGetFloati_v;
  glGetDoublei_v: TglGetDoublei_v;

  // GL_ARB_cl_event
  glCreateSyncFromCLeventARB: TglCreateSyncFromCLeventARB;

  // GL_ARB_debug_output
  glDebugMessageControlARB: TglDebugMessageControlARB;
  glDebugMessageInsertARB: TglDebugMessageInsertARB;
  glDebugMessageCallbackARB: TglDebugMessageCallbackARB;
  glGetDebugMessageLogARB: TglGetDebugMessageLogARB;

  // GL_ARB_robustness
  glGetGraphicsResetStatusARB: TglGetGraphicsResetStatusARB;
  glGetnMapdvARB: TglGetnMapdvARB;
  glGetnMapfvARB: TglGetnMapfvARB;
  glGetnMapivARB: TglGetnMapivARB;
  glGetnPixelMapfvARB: TglGetnPixelMapfvARB;
  glGetnPixelMapuivARB: TglGetnPixelMapuivARB;
  glGetnPixelMapusvARB: TglGetnPixelMapusvARB;
  glGetnPolygonStippleARB: TglGetnPolygonStippleARB;
  glGetnColorTableARB: TglGetnColorTableARB;
  glGetnConvolutionFilterARB: TglGetnConvolutionFilterARB;
  glGetnSeparableFilterARB: TglGetnSeparableFilterARB;
  glGetnHistogramARB: TglGetnHistogramARB;
  glGetnMinmaxARB: TglGetnMinmaxARB;
  glGetnTexImageARB: TglGetnTexImageARB;
  glReadnPixelsARB: TglReadnPixelsARB;
  glGetnCompressedTexImageARB: TglGetnCompressedTexImageARB;
  glGetnUniformfvARB: TglGetnUniformfvARB;
  glGetnUniformivARB: TglGetnUniformivARB;
  glGetnUniformuivARB: TglGetnUniformuivARB;
  glGetnUniformdvARB: TglGetnUniformdvARB;

  // GL_ATI_draw_buffers
  glDrawBuffersATI: TglDrawBuffersATI;

  // GL_ATI_element_array
  glElementPointerATI: TglElementPointerATI;
  glDrawElementArrayATI: TglDrawElementArrayATI;
  glDrawRangeElementArrayATI: TglDrawRangeElementArrayATI;

  // GL_ATI_envmap_bumpmap
  glTexBumpParameterivATI: TglTexBumpParameterivATI;
  glTexBumpParameterfvATI: TglTexBumpParameterfvATI;
  glGetTexBumpParameterivATI: TglGetTexBumpParameterivATI;
  glGetTexBumpParameterfvATI: TglGetTexBumpParameterfvATI;

  // GL_ATI_fragment_shader
  glGenFragmentShadersATI: TglGenFragmentShadersATI;
  glBindFragmentShaderATI: TglBindFragmentShaderATI;
  glDeleteFragmentShaderATI: TglDeleteFragmentShaderATI;
  glBeginFragmentShaderATI: TglBeginFragmentShaderATI;
  glEndFragmentShaderATI: TglEndFragmentShaderATI;
  glPassTexCoordATI: TglPassTexCoordATI;
  glSampleMapATI: TglSampleMapATI;
  glColorFragmentOp1ATI: TglColorFragmentOp1ATI;
  glColorFragmentOp2ATI: TglColorFragmentOp2ATI;
  glColorFragmentOp3ATI: TglColorFragmentOp3ATI;
  glAlphaFragmentOp1ATI: TglAlphaFragmentOp1ATI;
  glAlphaFragmentOp2ATI: TglAlphaFragmentOp2ATI;
  glAlphaFragmentOp3ATI: TglAlphaFragmentOp3ATI;
  glSetFragmentShaderConstantATI: TglSetFragmentShaderConstantATI;

  // GL_ATI_map_object_buffer
  glMapObjectBufferATI: TglMapObjectBufferATI;
  glUnmapObjectBufferATI: TglUnmapObjectBufferATI;

  // GL_ATI_pn_triangles
  glPNTrianglesiATI: TglPNTrianglesiATI;
  glPNTrianglesfATI: TglPNTrianglesfATI;

  // GL_ATI_separate_stencil
  glStencilOpSeparateATI: TglStencilOpSeparateATI;
  glStencilFuncSeparateATI: TglStencilFuncSeparateATI;

  // GL_ATI_vertex_array_object
  glNewObjectBufferATI: TglNewObjectBufferATI;
  glIsObjectBufferATI: TglIsObjectBufferATI;
  glUpdateObjectBufferATI: TglUpdateObjectBufferATI;
  glGetObjectBufferfvATI: TglGetObjectBufferfvATI;
  glGetObjectBufferivATI: TglGetObjectBufferivATI;
  glFreeObjectBufferATI: TglFreeObjectBufferATI;
  glArrayObjectATI: TglArrayObjectATI;
  glGetArrayObjectfvATI: TglGetArrayObjectfvATI;
  glGetArrayObjectivATI: TglGetArrayObjectivATI;
  glVariantArrayObjectATI: TglVariantArrayObjectATI;
  glGetVariantArrayObjectfvATI: TglGetVariantArrayObjectfvATI;
  glGetVariantArrayObjectivATI: TglGetVariantArrayObjectivATI;
  glVertexAttribArrayObjectATI: TglVertexAttribArrayObjectATI;
  glGetVertexAttribArrayObjectfvATI: TglGetVertexAttribArrayObjectfvATI;
  glGetVertexAttribArrayObjectivATI: TglGetVertexAttribArrayObjectivATI;

  // GL_ATI_vertex_streams
  glVertexStream1sATI: TglVertexStream1sATI;
  glVertexStream1svATI: TglVertexStream1svATI;
  glVertexStream1iATI: TglVertexStream1iATI;
  glVertexStream1ivATI: TglVertexStream1ivATI;
  glVertexStream1fATI: TglVertexStream1fATI;
  glVertexStream1fvATI: TglVertexStream1fvATI;
  glVertexStream1dATI: TglVertexStream1dATI;
  glVertexStream1dvATI: TglVertexStream1dvATI;
  glVertexStream2sATI: TglVertexStream2sATI;
  glVertexStream2svATI: TglVertexStream2svATI;
  glVertexStream2iATI: TglVertexStream2iATI;
  glVertexStream2ivATI: TglVertexStream2ivATI;
  glVertexStream2fATI: TglVertexStream2fATI;
  glVertexStream2fvATI: TglVertexStream2fvATI;
  glVertexStream2dATI: TglVertexStream2dATI;
  glVertexStream2dvATI: TglVertexStream2dvATI;
  glVertexStream3sATI: TglVertexStream3sATI;
  glVertexStream3svATI: TglVertexStream3svATI;
  glVertexStream3iATI: TglVertexStream3iATI;
  glVertexStream3ivATI: TglVertexStream3ivATI;
  glVertexStream3fATI: TglVertexStream3fATI;
  glVertexStream3fvATI: TglVertexStream3fvATI;
  glVertexStream3dATI: TglVertexStream3dATI;
  glVertexStream3dvATI: TglVertexStream3dvATI;
  glVertexStream4sATI: TglVertexStream4sATI;
  glVertexStream4svATI: TglVertexStream4svATI;
  glVertexStream4iATI: TglVertexStream4iATI;
  glVertexStream4ivATI: TglVertexStream4ivATI;
  glVertexStream4fATI: TglVertexStream4fATI;
  glVertexStream4fvATI: TglVertexStream4fvATI;
  glVertexStream4dATI: TglVertexStream4dATI;
  glVertexStream4dvATI: TglVertexStream4dvATI;
  glNormalStream3bATI: TglNormalStream3bATI;
  glNormalStream3bvATI: TglNormalStream3bvATI;
  glNormalStream3sATI: TglNormalStream3sATI;
  glNormalStream3svATI: TglNormalStream3svATI;
  glNormalStream3iATI: TglNormalStream3iATI;
  glNormalStream3ivATI: TglNormalStream3ivATI;
  glNormalStream3fATI: TglNormalStream3fATI;
  glNormalStream3fvATI: TglNormalStream3fvATI;
  glNormalStream3dATI: TglNormalStream3dATI;
  glNormalStream3dvATI: TglNormalStream3dvATI;
  glClientActiveVertexStreamATI: TglClientActiveVertexStreamATI;
  glVertexBlendEnviATI: TglVertexBlendEnviATI;
  glVertexBlendEnvfATI: TglVertexBlendEnvfATI;

  // GL_AMD_performance_monitor
  glGetPerfMonitorGroupsAMD: TglGetPerfMonitorGroupsAMD;
  glGetPerfMonitorCountersAMD: TglGetPerfMonitorCountersAMD;
  glGetPerfMonitorGroupStringAMD: TglGetPerfMonitorGroupStringAMD;
  glGetPerfMonitorCounterStringAMD: TglGetPerfMonitorCounterStringAMD;
  glGetPerfMonitorCounterInfoAMD: TglGetPerfMonitorCounterInfoAMD;
  glGenPerfMonitorsAMD: TglGenPerfMonitorsAMD;
  glDeletePerfMonitorsAMD: TglDeletePerfMonitorsAMD;
  glSelectPerfMonitorCountersAMD: TglSelectPerfMonitorCountersAMD;
  glBeginPerfMonitorAMD: TglBeginPerfMonitorAMD;
  glEndPerfMonitorAMD: TglEndPerfMonitorAMD;
  glGetPerfMonitorCounterDataAMD: TglGetPerfMonitorCounterDataAMD;

  // GL_AMD_vertex_shader_tesselator
  glTessellationFactorAMD: TglTessellationFactorAMD;
  glTessellationModeAMD: TglTessellationModeAMD;
  
  // GL_AMD_draw_buffers_blend
  glBlendFuncIndexedAMD: TglBlendFuncIndexedAMD;
  glBlendFuncSeparateIndexedAMD: TglBlendFuncSeparateIndexedAMD;
  glBlendEquationIndexedAMD: TglBlendEquationIndexedAMD;
  glBlendEquationSeparateIndexedAMD: TglBlendEquationSeparateIndexedAMD;

  // GL_AMD_name_gen_delete
  glGenNamesAMD: TglGenNamesAMD;
  glDeleteNamesAMD: TglDeleteNamesAMD;
  glIsNameAMD: TglIsNameAMD;

  // GL_AMD_debug_output
  glDebugMessageEnableAMD: TglDebugMessageEnableAMD;
  glDebugMessageInsertAMD: TglDebugMessageInsertAMD;
  glDebugMessageCallbackAMD: TglDebugMessageCallbackAMD;
  glGetDebugMessageLogAMD: TglGetDebugMessageLogAMD;

  // GL_EXT_blend_color
  glBlendColorEXT: TglBlendColorEXT;

  // GL_EXT_blend_func_separate
  glBlendFuncSeparateEXT: TglBlendFuncSeparateEXT;

  // GL_EXT_blend_minmax
  glBlendEquationEXT: TglBlendEquationEXT;

  // GL_EXT_color_subtable
  glColorSubTableEXT: TglColorSubTableEXT;
  glCopyColorSubTableEXT: TglCopyColorSubTableEXT;

  // GL_EXT_compiled_vertex_array
  glLockArraysEXT: TglLockArraysEXT;
  glUnlockArraysEXT: TglUnlockArraysEXT;

  // GL_EXT_convolution
  glConvolutionFilter1DEXT: TglConvolutionFilter1DEXT;
  glConvolutionFilter2DEXT: TglConvolutionFilter2DEXT;
  glConvolutionParameterfEXT: TglConvolutionParameterfEXT;
  glConvolutionParameterfvEXT: TglConvolutionParameterfvEXT;
  glConvolutionParameteriEXT: TglConvolutionParameteriEXT;
  glConvolutionParameterivEXT: TglConvolutionParameterivEXT;
  glCopyConvolutionFilter1DEXT: TglCopyConvolutionFilter1DEXT;
  glCopyConvolutionFilter2DEXT: TglCopyConvolutionFilter2DEXT;
  glGetConvolutionFilterEXT: TglGetConvolutionFilterEXT;
  glGetConvolutionParameterfvEXT: TglGetConvolutionParameterfvEXT;
  glGetConvolutionParameterivEXT: TglGetConvolutionParameterivEXT;
  glGetSeparableFilterEXT: TglGetSeparableFilterEXT;
  glSeparableFilter2DEXT: TglSeparableFilter2DEXT;

  // GL_EXT_coordinate_frame
  glTangent3bEXT: TglTangent3bEXT;
  glTangent3bvEXT: TglTangent3bvEXT;
  glTangent3dEXT: TglTangent3dEXT;
  glTangent3dvEXT: TglTangent3dvEXT;
  glTangent3fEXT: TglTangent3fEXT;
  glTangent3fvEXT: TglTangent3fvEXT;
  glTangent3iEXT: TglTangent3iEXT;
  glTangent3ivEXT: TglTangent3ivEXT;
  glTangent3sEXT: TglTangent3sEXT;
  glTangent3svEXT: TglTangent3svEXT;
  glBinormal3bEXT: TglBinormal3bEXT;
  glBinormal3bvEXT: TglBinormal3bvEXT;
  glBinormal3dEXT: TglBinormal3dEXT;
  glBinormal3dvEXT: TglBinormal3dvEXT;
  glBinormal3fEXT: TglBinormal3fEXT;
  glBinormal3fvEXT: TglBinormal3fvEXT;
  glBinormal3iEXT: TglBinormal3iEXT;
  glBinormal3ivEXT: TglBinormal3ivEXT;
  glBinormal3sEXT: TglBinormal3sEXT;
  glBinormal3svEXT: TglBinormal3svEXT;
  glTangentPointerEXT: TglTangentPointerEXT;
  glBinormalPointerEXT: TglBinormalPointerEXT;

  // GL_EXT_copy_texture
  glCopyTexImage1DEXT: TglCopyTexImage1DEXT;
  glCopyTexImage2DEXT: TglCopyTexImage2DEXT;
  glCopyTexSubImage1DEXT: TglCopyTexSubImage1DEXT;
  glCopyTexSubImage2DEXT: TglCopyTexSubImage2DEXT;
  glCopyTexSubImage3DEXT: TglCopyTexSubImage3DEXT;

  // GL_EXT_cull_vertex
  glCullParameterdvEXT: TglCullParameterdvEXT;
  glCullParameterfvEXT: TglCullParameterfvEXT;

  // GL_EXT_draw_range_elements
  glDrawRangeElementsEXT: TglDrawRangeElementsEXT;

  // GL_EXT_fog_coord
  glFogCoordfEXT: TglFogCoordfEXT;
  glFogCoordfvEXT: TglFogCoordfvEXT;
  glFogCoorddEXT: TglFogCoorddEXT;
  glFogCoorddvEXT: TglFogCoorddvEXT;
  glFogCoordPointerEXT: TglFogCoordPointerEXT;

  // GL_EXT_framebuffer_object
  glIsRenderbufferEXT: TglIsRenderbufferEXT;
  glBindRenderbufferEXT: TglBindRenderbufferEXT;
  glDeleteRenderbuffersEXT: TglDeleteRenderbuffersEXT;
  glGenRenderbuffersEXT: TglGenRenderbuffersEXT;
  glRenderbufferStorageEXT: TglRenderbufferStorageEXT;
  glGetRenderbufferParameterivEXT: TglGetRenderbufferParameterivEXT;
  glIsFramebufferEXT: TglIsFramebufferEXT;
  glBindFramebufferEXT: TglBindFramebufferEXT;
  glDeleteFramebuffersEXT: TglDeleteFramebuffersEXT;
  glGenFramebuffersEXT: TglGenFramebuffersEXT;
  glCheckFramebufferStatusEXT: TglCheckFramebufferStatusEXT;
  glFramebufferTexture1DEXT: TglFramebufferTexture1DEXT;
  glFramebufferTexture2DEXT: TglFramebufferTexture2DEXT;
  glFramebufferTexture3DEXT: TglFramebufferTexture3DEXT;
  glFramebufferRenderbufferEXT: TglFramebufferRenderbufferEXT;
  glGetFramebufferAttachmentParameterivEXT: TglGetFramebufferAttachmentParameterivEXT;
  glGenerateMipmapEXT: TglGenerateMipmapEXT;

  // GL_EXT_histogram
  glGetHistogramEXT: TglGetHistogramEXT;
  glGetHistogramParameterfvEXT: TglGetHistogramParameterfvEXT;
  glGetHistogramParameterivEXT: TglGetHistogramParameterivEXT;
  glGetMinmaxEXT: TglGetMinmaxEXT;
  glGetMinmaxParameterfvEXT: TglGetMinmaxParameterfvEXT;
  glGetMinmaxParameterivEXT: TglGetMinmaxParameterivEXT;
  glHistogramEXT: TglHistogramEXT;
  glMinmaxEXT: TglMinmaxEXT;
  glResetHistogramEXT: TglResetHistogramEXT;
  glResetMinmaxEXT: TglResetMinmaxEXT;

  // GL_EXT_index_func
  glIndexFuncEXT: TglIndexFuncEXT;

  // GL_EXT_index_material
  glIndexMaterialEXT: TglIndexMaterialEXT;

  // GL_EXT_light_texture
  glApplyTextureEXT: TglApplyTextureEXT;
  glTextureLightEXT: TglTextureLightEXT;
  glTextureMaterialEXT: TglTextureMaterialEXT;

  // GL_EXT_multi_draw_arrays
  glMultiDrawArraysEXT: TglMultiDrawArraysEXT;
  glMultiDrawElementsEXT: TglMultiDrawElementsEXT;

  // GL_EXT_multisample
  glSampleMaskEXT: TglSampleMaskEXT;
  glSamplePatternEXT: TglSamplePatternEXT;

  // GL_EXT_paletted_texture
  glColorTableEXT: TglColorTableEXT;
  glGetColorTableEXT: TglGetColorTableEXT;
  glGetColorTableParameterivEXT: TglGetColorTableParameterivEXT;
  glGetColorTableParameterfvEXT: TglGetColorTableParameterfvEXT;

  // GL_EXT_pixel_transform
  glPixelTransformParameteriEXT: TglPixelTransformParameteriEXT;
  glPixelTransformParameterfEXT: TglPixelTransformParameterfEXT;
  glPixelTransformParameterivEXT: TglPixelTransformParameterivEXT;
  glPixelTransformParameterfvEXT: TglPixelTransformParameterfvEXT;

  // GL_EXT_point_parameters
  glPointParameterfEXT: TglPointParameterfEXT;
  glPointParameterfvEXT: TglPointParameterfvEXT;

  // GL_EXT_polygon_offset
  glPolygonOffsetEXT: TglPolygonOffsetEXT;

  // GL_EXT_secondary_color
  glSecondaryColor3bEXT: TglSecondaryColor3bEXT;
  glSecondaryColor3bvEXT: TglSecondaryColor3bvEXT;
  glSecondaryColor3dEXT: TglSecondaryColor3dEXT;
  glSecondaryColor3dvEXT: TglSecondaryColor3dvEXT;
  glSecondaryColor3fEXT: TglSecondaryColor3fEXT;
  glSecondaryColor3fvEXT: TglSecondaryColor3fvEXT;
  glSecondaryColor3iEXT: TglSecondaryColor3iEXT;
  glSecondaryColor3ivEXT: TglSecondaryColor3ivEXT;
  glSecondaryColor3sEXT: TglSecondaryColor3sEXT;
  glSecondaryColor3svEXT: TglSecondaryColor3svEXT;
  glSecondaryColor3ubEXT: TglSecondaryColor3ubEXT;
  glSecondaryColor3ubvEXT: TglSecondaryColor3ubvEXT;
  glSecondaryColor3uiEXT: TglSecondaryColor3uiEXT;
  glSecondaryColor3uivEXT: TglSecondaryColor3uivEXT;
  glSecondaryColor3usEXT: TglSecondaryColor3usEXT;
  glSecondaryColor3usvEXT: TglSecondaryColor3usvEXT;
  glSecondaryColorPointerEXT: TglSecondaryColorPointerEXT;

  // GL_EXT_stencil_two_side
  glActiveStencilFaceEXT: TglActiveStencilFaceEXT;

  // GL_EXT_subtexture
  glTexSubImage1DEXT: TglTexSubImage1DEXT;
  glTexSubImage2DEXT: TglTexSubImage2DEXT;

  // GL_EXT_texture3D
  glTexImage3DEXT: TglTexImage3DEXT;
  glTexSubImage3DEXT: TglTexSubImage3DEXT;

  // GL_EXT_texture_object
  glAreTexturesResidentEXT: TglAreTexturesResidentEXT;
  glBindTextureEXT: TglBindTextureEXT;
  glDeleteTexturesEXT: TglDeleteTexturesEXT;
  glGenTexturesEXT: TglGenTexturesEXT;
  glIsTextureEXT: TglIsTextureEXT;
  glPrioritizeTexturesEXT: TglPrioritizeTexturesEXT;

  // GL_EXT_texture_perturb_normal
  glTextureNormalEXT: TglTextureNormalEXT;

  // GL_EXT_vertex_array
  glArrayElementEXT: TglArrayElementEXT;
  glColorPointerEXT: TglColorPointerEXT;
  glDrawArraysEXT: TglDrawArraysEXT;
  glEdgeFlagPointerEXT: TglEdgeFlagPointerEXT;
  glGetPointervEXT: TglGetPointervEXT;
  glIndexPointerEXT: TglIndexPointerEXT;
  glNormalPointerEXT: TglNormalPointerEXT;
  glTexCoordPointerEXT: TglTexCoordPointerEXT;
  glVertexPointerEXT: TglVertexPointerEXT;

  // GL_EXT_vertex_shader
  glBeginVertexShaderEXT: TglBeginVertexShaderEXT;
  glEndVertexShaderEXT: TglEndVertexShaderEXT;
  glBindVertexShaderEXT: TglBindVertexShaderEXT;
  glGenVertexShadersEXT: TglGenVertexShadersEXT;
  glDeleteVertexShaderEXT: TglDeleteVertexShaderEXT;
  glShaderOp1EXT: TglShaderOp1EXT;
  glShaderOp2EXT: TglShaderOp2EXT;
  glShaderOp3EXT: TglShaderOp3EXT;
  glSwizzleEXT: TglSwizzleEXT;
  glWriteMaskEXT: TglWriteMaskEXT;
  glInsertComponentEXT: TglInsertComponentEXT;
  glExtractComponentEXT: TglExtractComponentEXT;
  glGenSymbolsEXT: TglGenSymbolsEXT;
  glSetInvariantEXT: TglSetInvariantEXT;
  glSetLocalConstantEXT: TglSetLocalConstantEXT;
  glVariantbvEXT: TglVariantbvEXT;
  glVariantsvEXT: TglVariantsvEXT;
  glVariantivEXT: TglVariantivEXT;
  glVariantfvEXT: TglVariantfvEXT;
  glVariantdvEXT: TglVariantdvEXT;
  glVariantubvEXT: TglVariantubvEXT;
  glVariantusvEXT: TglVariantusvEXT;
  glVariantuivEXT: TglVariantuivEXT;
  glVariantPointerEXT: TglVariantPointerEXT;
  glEnableVariantClientStateEXT: TglEnableVariantClientStateEXT;
  glDisableVariantClientStateEXT: TglDisableVariantClientStateEXT;
  glBindLightParameterEXT: TglBindLightParameterEXT;
  glBindMaterialParameterEXT: TglBindMaterialParameterEXT;
  glBindTexGenParameterEXT: TglBindTexGenParameterEXT;
  glBindTextureUnitParameterEXT: TglBindTextureUnitParameterEXT;
  glBindParameterEXT: TglBindParameterEXT;
  glIsVariantEnabledEXT: TglIsVariantEnabledEXT;
  glGetVariantBooleanvEXT: TglGetVariantBooleanvEXT;
  glGetVariantIntegervEXT: TglGetVariantIntegervEXT;
  glGetVariantFloatvEXT: TglGetVariantFloatvEXT;
  glGetVariantPointervEXT: TglGetVariantPointervEXT;
  glGetInvariantBooleanvEXT: TglGetInvariantBooleanvEXT;
  glGetInvariantIntegervEXT: TglGetInvariantIntegervEXT;
  glGetInvariantFloatvEXT: TglGetInvariantFloatvEXT;
  glGetLocalConstantBooleanvEXT: TglGetLocalConstantBooleanvEXT;
  glGetLocalConstantIntegervEXT: TglGetLocalConstantIntegervEXT;
  glGetLocalConstantFloatvEXT: TglGetLocalConstantFloatvEXT;

  // GL_EXT_vertex_weighting
  glVertexWeightfEXT: TglVertexWeightfEXT;
  glVertexWeightfvEXT: TglVertexWeightfvEXT;
  glVertexWeightPointerEXT: TglVertexWeightPointerEXT;

  // GL_EXT_stencil_clear_tag
  glStencilClearTagEXT: TglStencilClearTagEXT;

  // GL_EXT_framebuffer_blit
  glBlitFramebufferEXT: TglBlitFramebufferEXT;

  // GL_EXT_framebuffer_multisample
  glRenderbufferStorageMultisampleEXT: TglRenderbufferStorageMultisampleEXT;

  // GL_EXT_timer_query
  glGetQueryObjecti64vEXT: TglGetQueryObjecti64vEXT;
  glGetQueryObjectui64vEXT: TglGetQueryObjectui64vEXT;

  // GL_EXT_gpu_program_parameters
  glProgramEnvParameters4fvEXT: TglProgramEnvParameters4fvEXT;
  glProgramLocalParameters4fvEXT: TglProgramLocalParameters4fvEXT;

  // GL_EXT_bindable_uniform
  glUniformBufferEXT: TglUniformBufferEXT;
  glGetUniformBufferSizeEXT: TglGetUniformBufferSizeEXT;
  glGetUniformOffsetEXT: TglGetUniformOffsetEXT;

  // GL_EXT_draw_buffers2
  glColorMaskIndexedEXT: TglColorMaskIndexedEXT;
  glGetBooleanIndexedvEXT: TglGetBooleanIndexedvEXT;
  glGetIntegerIndexedvEXT: TglGetIntegerIndexedvEXT;
  glEnableIndexedEXT: TglEnableIndexedEXT;
  glDisableIndexedEXT: TglDisableIndexedEXT;
  glIsEnabledIndexedEXT: TglIsEnabledIndexedEXT;

  // GL_EXT_draw_instanced
  glDrawArraysInstancedEXT: TglDrawArraysInstancedEXT;
  glDrawElementsInstancedEXT: TglDrawElementsInstancedEXT;

  // GL_EXT_geometry_shader4
  glProgramParameteriEXT: TglProgramParameteriEXT;
  glFramebufferTextureEXT: TglFramebufferTextureEXT;
//  glFramebufferTextureLayerEXT: TglFramebufferTextureLayerEXT;
  glFramebufferTextureFaceEXT: TglFramebufferTextureFaceEXT;

  // GL_EXT_gpu_shader4
  glVertexAttribI1iEXT: TglVertexAttribI1iEXT;
  glVertexAttribI2iEXT: TglVertexAttribI2iEXT;
  glVertexAttribI3iEXT: TglVertexAttribI3iEXT;
  glVertexAttribI4iEXT: TglVertexAttribI4iEXT;
  glVertexAttribI1uiEXT: TglVertexAttribI1uiEXT;
  glVertexAttribI2uiEXT: TglVertexAttribI2uiEXT;
  glVertexAttribI3uiEXT: TglVertexAttribI3uiEXT;
  glVertexAttribI4uiEXT: TglVertexAttribI4uiEXT;
  glVertexAttribI1ivEXT: TglVertexAttribI1ivEXT;
  glVertexAttribI2ivEXT: TglVertexAttribI2ivEXT;
  glVertexAttribI3ivEXT: TglVertexAttribI3ivEXT;
  glVertexAttribI4ivEXT: TglVertexAttribI4ivEXT;
  glVertexAttribI1uivEXT: TglVertexAttribI1uivEXT;
  glVertexAttribI2uivEXT: TglVertexAttribI2uivEXT;
  glVertexAttribI3uivEXT: TglVertexAttribI3uivEXT;
  glVertexAttribI4uivEXT: TglVertexAttribI4uivEXT;
  glVertexAttribI4bvEXT: TglVertexAttribI4bvEXT;
  glVertexAttribI4svEXT: TglVertexAttribI4svEXT;
  glVertexAttribI4ubvEXT: TglVertexAttribI4ubvEXT;
  glVertexAttribI4usvEXT: TglVertexAttribI4usvEXT;
  glVertexAttribIPointerEXT: TglVertexAttribIPointerEXT;
  glGetVertexAttribIivEXT: TglGetVertexAttribIivEXT;
  glGetVertexAttribIuivEXT: TglGetVertexAttribIuivEXT;
  glUniform1uiEXT: TglUniform1uiEXT;
  glUniform2uiEXT: TglUniform2uiEXT;
  glUniform3uiEXT: TglUniform3uiEXT;
  glUniform4uiEXT: TglUniform4uiEXT;
  glUniform1uivEXT: TglUniform1uivEXT;
  glUniform2uivEXT: TglUniform2uivEXT;
  glUniform3uivEXT: TglUniform3uivEXT;
  glUniform4uivEXT: TglUniform4uivEXT;
  glGetUniformuivEXT: TglGetUniformuivEXT;
  glBindFragDataLocationEXT: TglBindFragDataLocationEXT;
  glGetFragDataLocationEXT: TglGetFragDataLocationEXT;

  // GL_EXT_texture_array
  glFramebufferTextureLayerEXT: TglFramebufferTextureLayerEXT;

  // GL_EXT_texture_buffer_object
  glTexBufferEXT: TglTexBufferEXT;

  // GL_EXT_texture_integer
  glClearColorIiEXT: TglClearColorIiEXT;
  glClearColorIuiEXT: TglClearColorIuiEXT;
  glTexParameterIivEXT: TglTexParameterIivEXT;
  glTexParameterIuivEXT: TglTexParameterIuivEXT;
  glGetTexParameterIivEXT: TglGetTexParameterIivEXT;
  glGetTexParameterIiuvEXT: TglGetTexParameterIiuvEXT;

  // GL_EXT_transform_feedback
  glBeginTransformFeedbackEXT: TglBeginTransformFeedbackEXT;
  glEndTransformFeedbackEXT: TglEndTransformFeedbackEXT;
  glBindBufferRangeEXT: TglBindBufferRangeEXT;
  glBindBufferOffsetEXT: TglBindBufferOffsetEXT;
  glBindBufferBaseEXT: TglBindBufferBaseEXT;
  glTransformFeedbackVaryingsEXT: TglTransformFeedbackVaryingsEXT;
  glGetTransformFeedbackVaryingEXT: TglGetTransformFeedbackVaryingEXT;

  // GL_EXT_direct_state_access
  glClientAttribDefaultEXT: TglClientAttribDefaultEXT;
  glPushClientAttribDefaultEXT: TglPushClientAttribDefaultEXT;
  glMatrixLoadfEXT: TglMatrixLoadfEXT;
  glMatrixLoaddEXT: TglMatrixLoaddEXT;
  glMatrixMultfEXT: TglMatrixMultfEXT;
  glMatrixMultdEXT: TglMatrixMultdEXT;
  glMatrixLoadIdentityEXT: TglMatrixLoadIdentityEXT;
  glMatrixRotatefEXT: TglMatrixRotatefEXT;
  glMatrixRotatedEXT: TglMatrixRotatedEXT;
  glMatrixScalefEXT: TglMatrixScalefEXT;
  glMatrixScaledEXT: TglMatrixScaledEXT;
  glMatrixTranslatefEXT: TglMatrixTranslatefEXT;
  glMatrixTranslatedEXT: TglMatrixTranslatedEXT;
  glMatrixFrustumEXT: TglMatrixFrustumEXT;
  glMatrixOrthoEXT: TglMatrixOrthoEXT;
  glMatrixPopEXT: TglMatrixPopEXT;
  glMatrixPushEXT: TglMatrixPushEXT;
  glMatrixLoadTransposefEXT: TglMatrixLoadTransposefEXT;
  glMatrixLoadTransposedEXT: TglMatrixLoadTransposedEXT;
  glMatrixMultTransposefEXT: TglMatrixMultTransposefEXT;
  glMatrixMultTransposedEXT: TglMatrixMultTransposedEXT;
  glTextureParameterfEXT: TglTextureParameterfEXT;
  glTextureParameterfvEXT: TglTextureParameterfvEXT;
  glTextureParameteriEXT: TglTextureParameteriEXT;
  glTextureParameterivEXT: TglTextureParameterivEXT;
  glTextureImage1DEXT: TglTextureImage1DEXT;
  glTextureImage2DEXT: TglTextureImage2DEXT;
  glTextureSubImage1DEXT: TglTextureSubImage1DEXT;
  glTextureSubImage2DEXT: TglTextureSubImage2DEXT;
  glCopyTextureImage1DEXT: TglCopyTextureImage1DEXT;
  glCopyTextureImage2DEXT: TglCopyTextureImage2DEXT;
  glCopyTextureSubImage1DEXT: TglCopyTextureSubImage1DEXT;
  glCopyTextureSubImage2DEXT: TglCopyTextureSubImage2DEXT;
  glGetTextureImageEXT: TglGetTextureImageEXT;
  glGetTextureParameterfvEXT: TglGetTextureParameterfvEXT;
  glGetTextureParameterivEXT: TglGetTextureParameterivEXT;
  glGetTextureLevelParameterfvEXT: TglGetTextureLevelParameterfvEXT;
  glGetTextureLevelParameterivEXT: TglGetTextureLevelParameterivEXT;
  glTextureImage3DEXT: TglTextureImage3DEXT;
  glTextureSubImage3DEXT: TglTextureSubImage3DEXT;
  glCopyTextureSubImage3DEXT: TglCopyTextureSubImage3DEXT;
  glMultiTexParameterfEXT: TglMultiTexParameterfEXT;
  glMultiTexParameterfvEXT: TglMultiTexParameterfvEXT;
  glMultiTexParameteriEXT: TglMultiTexParameteriEXT;
  glMultiTexParameterivEXT: TglMultiTexParameterivEXT;
  glMultiTexImage1DEXT: TglMultiTexImage1DEXT;
  glMultiTexImage2DEXT: TglMultiTexImage2DEXT;
  glMultiTexSubImage1DEXT: TglMultiTexSubImage1DEXT;
  glMultiTexSubImage2DEXT: TglMultiTexSubImage2DEXT;
  glCopyMultiTexImage1DEXT: TglCopyMultiTexImage1DEXT;
  glCopyMultiTexImage2DEXT: TglCopyMultiTexImage2DEXT;
  glCopyMultiTexSubImage1DEXT: TglCopyMultiTexSubImage1DEXT;
  glCopyMultiTexSubImage2DEXT: TglCopyMultiTexSubImage2DEXT;
  glGetMultiTexImageEXT: TglGetMultiTexImageEXT;
  glGetMultiTexParameterfvEXT: TglGetMultiTexParameterfvEXT;
  glGetMultiTexParameterivEXT: TglGetMultiTexParameterivEXT;
  glGetMultiTexLevelParameterfvEXT: TglGetMultiTexLevelParameterfvEXT;
  glGetMultiTexLevelParameterivEXT: TglGetMultiTexLevelParameterivEXT;
  glMultiTexImage3DEXT: TglMultiTexImage3DEXT;
  glMultiTexSubImage3DEXT: TglMultiTexSubImage3DEXT;
  glCopyMultiTexSubImage3DEXT: TglCopyMultiTexSubImage3DEXT;
  glBindMultiTextureEXT: TglBindMultiTextureEXT;
  glEnableClientStateIndexedEXT: TglEnableClientStateIndexedEXT;
  glDisableClientStateIndexedEXT: TglDisableClientStateIndexedEXT;
  glMultiTexCoordPointerEXT: TglMultiTexCoordPointerEXT;
  glMultiTexEnvfEXT: TglMultiTexEnvfEXT;
  glMultiTexEnvfvEXT: TglMultiTexEnvfvEXT;
  glMultiTexEnviEXT: TglMultiTexEnviEXT;
  glMultiTexEnvivEXT: TglMultiTexEnvivEXT;
  glMultiTexGendEXT: TglMultiTexGendEXT;
  glMultiTexGendvEXT: TglMultiTexGendvEXT;
  glMultiTexGenfEXT: TglMultiTexGenfEXT;
  glMultiTexGenfvEXT: TglMultiTexGenfvEXT;
  glMultiTexGeniEXT: TglMultiTexGeniEXT;
  glMultiTexGenivEXT: TglMultiTexGenivEXT;
  glGetMultiTexEnvfvEXT: TglGetMultiTexEnvfvEXT;
  glGetMultiTexEnvivEXT: TglGetMultiTexEnvivEXT;
  glGetMultiTexGendvEXT: TglGetMultiTexGendvEXT;
  glGetMultiTexGenfvEXT: TglGetMultiTexGenfvEXT;
  glGetMultiTexGenivEXT: TglGetMultiTexGenivEXT;
  glGetFloatIndexedvEXT: TglGetFloatIndexedvEXT;
  glGetDoubleIndexedvEXT: TglGetDoubleIndexedvEXT;
  glGetPointerIndexedvEXT: TglGetPointerIndexedvEXT;
  glCompressedTextureImage3DEXT: TglCompressedTextureImage3DEXT;
  glCompressedTextureImage2DEXT: TglCompressedTextureImage2DEXT;
  glCompressedTextureImage1DEXT: TglCompressedTextureImage1DEXT;
  glCompressedTextureSubImage3DEXT: TglCompressedTextureSubImage3DEXT;
  glCompressedTextureSubImage2DEXT: TglCompressedTextureSubImage2DEXT;
  glCompressedTextureSubImage1DEXT: TglCompressedTextureSubImage1DEXT;
  glGetCompressedTextureImageEXT: TglGetCompressedTextureImageEXT;
  glCompressedMultiTexImage3DEXT: TglCompressedMultiTexImage3DEXT;
  glCompressedMultiTexImage2DEXT: TglCompressedMultiTexImage2DEXT;
  glCompressedMultiTexImage1DEXT: TglCompressedMultiTexImage1DEXT;
  glCompressedMultiTexSubImage3DEXT: TglCompressedMultiTexSubImage3DEXT;
  glCompressedMultiTexSubImage2DEXT: TglCompressedMultiTexSubImage2DEXT;
  glCompressedMultiTexSubImage1DEXT: TglCompressedMultiTexSubImage1DEXT;
  glGetCompressedMultiTexImageEXT: TglGetCompressedMultiTexImageEXT;
  glNamedProgramStringEXT: TglNamedProgramStringEXT;
  glNamedProgramLocalParameter4dEXT: TglNamedProgramLocalParameter4dEXT;
  glNamedProgramLocalParameter4dvEXT: TglNamedProgramLocalParameter4dvEXT;
  glNamedProgramLocalParameter4fEXT: TglNamedProgramLocalParameter4fEXT;
  glNamedProgramLocalParameter4fvEXT: TglNamedProgramLocalParameter4fvEXT;
  glGetNamedProgramLocalParameterdvEXT: TglGetNamedProgramLocalParameterdvEXT;
  glGetNamedProgramLocalParameterfvEXT: TglGetNamedProgramLocalParameterfvEXT;
  glGetNamedProgramivEXT: TglGetNamedProgramivEXT;
  glGetNamedProgramStringEXT: TglGetNamedProgramStringEXT;
  glNamedProgramLocalParameters4fvEXT: TglNamedProgramLocalParameters4fvEXT;
  glNamedProgramLocalParameterI4iEXT: TglNamedProgramLocalParameterI4iEXT;
  glNamedProgramLocalParameterI4ivEXT: TglNamedProgramLocalParameterI4ivEXT;
  glNamedProgramLocalParametersI4ivEXT: TglNamedProgramLocalParametersI4ivEXT;
  glNamedProgramLocalParameterI4uiEXT: TglNamedProgramLocalParameterI4uiEXT;
  glNamedProgramLocalParameterI4uivEXT: TglNamedProgramLocalParameterI4uivEXT;
  glNamedProgramLocalParametersI4uivEXT: TglNamedProgramLocalParametersI4uivEXT;
  glGetNamedProgramLocalParameterIivEXT: TglGetNamedProgramLocalParameterIivEXT;
  glGetNamedProgramLocalParameterIuivEXT: TglGetNamedProgramLocalParameterIuivEXT;
  glTextureParameterIivEXT: TglTextureParameterIivEXT;
  glTextureParameterIuivEXT: TglTextureParameterIuivEXT;
  glGetTextureParameterIivEXT: TglGetTextureParameterIivEXT;
  glGetTextureParameterIuivEXT: TglGetTextureParameterIuivEXT;
  glMultiTexParameterIivEXT: TglMultiTexParameterIivEXT;
  glMultiTexParameterIuivEXT: TglMultiTexParameterIuivEXT;
  glGetMultiTexParameterIivEXT: TglGetMultiTexParameterIivEXT;
  glGetMultiTexParameterIuivEXT: TglGetMultiTexParameterIuivEXT;
  glProgramUniform1fEXT: TglProgramUniform1fEXT;
  glProgramUniform2fEXT: TglProgramUniform2fEXT;
  glProgramUniform3fEXT: TglProgramUniform3fEXT;
  glProgramUniform4fEXT: TglProgramUniform4fEXT;
  glProgramUniform1iEXT: TglProgramUniform1iEXT;
  glProgramUniform2iEXT: TglProgramUniform2iEXT;
  glProgramUniform3iEXT: TglProgramUniform3iEXT;
  glProgramUniform4iEXT: TglProgramUniform4iEXT;
  glProgramUniform1fvEXT: TglProgramUniform1fvEXT;
  glProgramUniform2fvEXT: TglProgramUniform2fvEXT;
  glProgramUniform3fvEXT: TglProgramUniform3fvEXT;
  glProgramUniform4fvEXT: TglProgramUniform4fvEXT;
  glProgramUniform1ivEXT: TglProgramUniform1ivEXT;
  glProgramUniform2ivEXT: TglProgramUniform2ivEXT;
  glProgramUniform3ivEXT: TglProgramUniform3ivEXT;
  glProgramUniform4ivEXT: TglProgramUniform4ivEXT;
  glProgramUniformMatrix2fvEXT: TglProgramUniformMatrix2fvEXT;
  glProgramUniformMatrix3fvEXT: TglProgramUniformMatrix3fvEXT;
  glProgramUniformMatrix4fvEXT: TglProgramUniformMatrix4fvEXT;
  glProgramUniformMatrix2x3fvEXT: TglProgramUniformMatrix2x3fvEXT;
  glProgramUniformMatrix3x2fvEXT: TglProgramUniformMatrix3x2fvEXT;
  glProgramUniformMatrix2x4fvEXT: TglProgramUniformMatrix2x4fvEXT;
  glProgramUniformMatrix4x2fvEXT: TglProgramUniformMatrix4x2fvEXT;
  glProgramUniformMatrix3x4fvEXT: TglProgramUniformMatrix3x4fvEXT;
  glProgramUniformMatrix4x3fvEXT: TglProgramUniformMatrix4x3fvEXT;
  glProgramUniform1uiEXT: TglProgramUniform1uiEXT;
  glProgramUniform2uiEXT: TglProgramUniform2uiEXT;
  glProgramUniform3uiEXT: TglProgramUniform3uiEXT;
  glProgramUniform4uiEXT: TglProgramUniform4uiEXT;
  glProgramUniform1uivEXT: TglProgramUniform1uivEXT;
  glProgramUniform2uivEXT: TglProgramUniform2uivEXT;
  glProgramUniform3uivEXT: TglProgramUniform3uivEXT;
  glProgramUniform4uivEXT: TglProgramUniform4uivEXT;
  glNamedBufferDataEXT: TglNamedBufferDataEXT;
  glNamedBufferSubDataEXT: TglNamedBufferSubDataEXT;
  glMapNamedBufferEXT: TglMapNamedBufferEXT;
  glUnmapNamedBufferEXT: TglUnmapNamedBufferEXT;
  glMapNamedBufferRangeEXT: TglMapNamedBufferRangeEXT;
  glFlushMappedNamedBufferRangeEXT: TglFlushMappedNamedBufferRangeEXT;
  glNamedCopyBufferSubDataEXT: TglNamedCopyBufferSubDataEXT;
  glGetNamedBufferParameterivEXT: TglGetNamedBufferParameterivEXT;
  glGetNamedBufferPointervEXT: TglGetNamedBufferPointervEXT;
  glGetNamedBufferSubDataEXT: TglGetNamedBufferSubDataEXT;
  glTextureBufferEXT: TglTextureBufferEXT;
  glMultiTexBufferEXT: TglMultiTexBufferEXT;
  glNamedRenderbufferStorageEXT: TglNamedRenderbufferStorageEXT;
  glGetNamedRenderbufferParameterivEXT: TglGetNamedRenderbufferParameterivEXT;
  glCheckNamedFramebufferStatusEXT: TglCheckNamedFramebufferStatusEXT;
  glNamedFramebufferTexture1DEXT: TglNamedFramebufferTexture1DEXT;
  glNamedFramebufferTexture2DEXT: TglNamedFramebufferTexture2DEXT;
  glNamedFramebufferTexture3DEXT: TglNamedFramebufferTexture3DEXT;
  glNamedFramebufferRenderbufferEXT: TglNamedFramebufferRenderbufferEXT;
  glGetNamedFramebufferAttachmentParameterivEXT: TglGetNamedFramebufferAttachmentParameterivEXT;
  glGenerateTextureMipmapEXT: TglGenerateTextureMipmapEXT;
  glGenerateMultiTexMipmapEXT: TglGenerateMultiTexMipmapEXT;
  glFramebufferDrawBufferEXT: TglFramebufferDrawBufferEXT;
  glFramebufferDrawBuffersEXT: TglFramebufferDrawBuffersEXT;
  glFramebufferReadBufferEXT: TglFramebufferReadBufferEXT;
  glGetFramebufferParameterivEXT: TglGetFramebufferParameterivEXT;
  glNamedRenderbufferStorageMultisampleEXT: TglNamedRenderbufferStorageMultisampleEXT;
  glNamedRenderbufferStorageMultisampleCoverageEXT: TglNamedRenderbufferStorageMultisampleCoverageEXT;
  glNamedFramebufferTextureEXT: TglNamedFramebufferTextureEXT;
  glNamedFramebufferTextureLayerEXT: TglNamedFramebufferTextureLayerEXT;
  glNamedFramebufferTextureFaceEXT: TglNamedFramebufferTextureFaceEXT;
  glTextureRenderbufferEXT: TglTextureRenderbufferEXT;
  glMultiTexRenderbufferEXT: TglMultiTexRenderbufferEXT;
  glProgramUniform1dEXT: TglProgramUniform1dEXT;
  glProgramUniform2dEXT: TglProgramUniform2dEXT;
  glProgramUniform3dEXT: TglProgramUniform3dEXT;
  glProgramUniform4dEXT: TglProgramUniform4dEXT;
  glProgramUniform1dvEXT: TglProgramUniform1dvEXT;
  glProgramUniform2dvEXT: TglProgramUniform2dvEXT;
  glProgramUniform3dvEXT: TglProgramUniform3dvEXT;
  glProgramUniform4dvEXT: TglProgramUniform4dvEXT;
  glProgramUniformMatrix2dvEXT: TglProgramUniformMatrix2dvEXT;
  glProgramUniformMatrix3dvEXT: TglProgramUniformMatrix3dvEXT;
  glProgramUniformMatrix4dvEXT: TglProgramUniformMatrix4dvEXT;
  glProgramUniformMatrix2x3dvEXT: TglProgramUniformMatrix2x3dvEXT;
  glProgramUniformMatrix2x4dvEXT: TglProgramUniformMatrix2x4dvEXT;
  glProgramUniformMatrix3x2dvEXT: TglProgramUniformMatrix3x2dvEXT;
  glProgramUniformMatrix3x4dvEXT: TglProgramUniformMatrix3x4dvEXT;
  glProgramUniformMatrix4x2dvEXT: TglProgramUniformMatrix4x2dvEXT;
  glProgramUniformMatrix4x3dvEXT: TglProgramUniformMatrix4x3dvEXT;

  // GL_EXT_separate_shader_objects
  glUseShaderProgramEXT: TglUseShaderProgramEXT;
  glActiveProgramEXT: TglActiveProgramEXT;
  glCreateShaderProgramEXT: TglCreateShaderProgramEXT;

  // GL_EXT_shader_image_load_store
  glBindImageTextureEXT: TglBindImageTextureEXT;
  glMemoryBarrierEXT: TglMemoryBarrierEXT;

  // GL_EXT_vertex_attrib_64bit
  glVertexAttribL1dEXT: TglVertexAttribL1dEXT;
  glVertexAttribL2dEXT: TglVertexAttribL2dEXT;
  glVertexAttribL3dEXT: TglVertexAttribL3dEXT;
  glVertexAttribL4dEXT: TglVertexAttribL4dEXT;
  glVertexAttribL1dvEXT: TglVertexAttribL1dvEXT;
  glVertexAttribL2dvEXT: TglVertexAttribL2dvEXT;
  glVertexAttribL3dvEXT: TglVertexAttribL3dvEXT;
  glVertexAttribL4dvEXT: TglVertexAttribL4dvEXT;
  glVertexAttribLPointerEXT: TglVertexAttribLPointerEXT;
  glGetVertexAttribLdvEXT: TglGetVertexAttribLdvEXT;
  glVertexArrayVertexAttribLOffsetEXT: TglVertexArrayVertexAttribLOffsetEXT;
  
  // GL_HP_image_transform
  glImageTransformParameteriHP: TglImageTransformParameteriHP;
  glImageTransformParameterfHP: TglImageTransformParameterfHP;
  glImageTransformParameterivHP: TglImageTransformParameterivHP;
  glImageTransformParameterfvHP: TglImageTransformParameterfvHP;
  glGetImageTransformParameterivHP: TglGetImageTransformParameterivHP;
  glGetImageTransformParameterfvHP: TglGetImageTransformParameterfvHP;

  // GL_EXT_depth_bounds_test
  glDepthBoundsEXT: TglDepthBoundsEXT;

  // GL_EXT_blend_equation_separate
  glBlendEquationSeparateEXT: TglBlendEquationSeparateEXT;

  // GL_IBM_multimode_draw_arrays
  glMultiModeDrawArraysIBM: TglMultiModeDrawArraysIBM;
  glMultiModeDrawElementsIBM: TglMultiModeDrawElementsIBM;

  // GL_IBM_vertex_array_lists
  glColorPointerListIBM: TglColorPointerListIBM;
  glSecondaryColorPointerListIBM: TglSecondaryColorPointerListIBM;
  glEdgeFlagPointerListIBM: TglEdgeFlagPointerListIBM;
  glFogCoordPointerListIBM: TglFogCoordPointerListIBM;
  glIndexPointerListIBM: TglIndexPointerListIBM;
  glNormalPointerListIBM: TglNormalPointerListIBM;
  glTexCoordPointerListIBM: TglTexCoordPointerListIBM;
  glVertexPointerListIBM: TglVertexPointerListIBM;

  // GL_INGR_blend_func_separate
  glBlendFuncSeparateINGR: TglBlendFuncSeparateINGR;

  // GL_INTEL_parallel_arrays
  glVertexPointervINTEL: TglVertexPointervINTEL;
  glNormalPointervINTEL: TglNormalPointervINTEL;
  glColorPointervINTEL: TglColorPointervINTEL;
  glTexCoordPointervINTEL: TglTexCoordPointervINTEL;

  // GL_MESA_resize_buffers
  glResizeBuffersMESA: TglResizeBuffersMESA;

  // GL_MESA_window_pos
  glWindowPos2dMESA: TglWindowPos2dMESA;
  glWindowPos2dvMESA: TglWindowPos2dvMESA;
  glWindowPos2fMESA: TglWindowPos2fMESA;
  glWindowPos2fvMESA: TglWindowPos2fvMESA;
  glWindowPos2iMESA: TglWindowPos2iMESA;
  glWindowPos2ivMESA: TglWindowPos2ivMESA;
  glWindowPos2sMESA: TglWindowPos2sMESA;
  glWindowPos2svMESA: TglWindowPos2svMESA;
  glWindowPos3dMESA: TglWindowPos3dMESA;
  glWindowPos3dvMESA: TglWindowPos3dvMESA;
  glWindowPos3fMESA: TglWindowPos3fMESA;
  glWindowPos3fvMESA: TglWindowPos3fvMESA;
  glWindowPos3iMESA: TglWindowPos3iMESA;
  glWindowPos3ivMESA: TglWindowPos3ivMESA;
  glWindowPos3sMESA: TglWindowPos3sMESA;
  glWindowPos3svMESA: TglWindowPos3svMESA;
  glWindowPos4dMESA: TglWindowPos4dMESA;
  glWindowPos4dvMESA: TglWindowPos4dvMESA;
  glWindowPos4fMESA: TglWindowPos4fMESA;
  glWindowPos4fvMESA: TglWindowPos4fvMESA;
  glWindowPos4iMESA: TglWindowPos4iMESA;
  glWindowPos4ivMESA: TglWindowPos4ivMESA;
  glWindowPos4sMESA: TglWindowPos4sMESA;
  glWindowPos4svMESA: TglWindowPos4svMESA;

  // GL_NV_evaluators
  glMapControlPointsNV: TglMapControlPointsNV;
  glMapParameterivNV: TglMapParameterivNV;
  glMapParameterfvNV: TglMapParameterfvNV;
  glGetMapControlPointsNV: TglGetMapControlPointsNV;
  glGetMapParameterivNV: TglGetMapParameterivNV;
  glGetMapParameterfvNV: TglGetMapParameterfvNV;
  glGetMapAttribParameterivNV: TglGetMapAttribParameterivNV;
  glGetMapAttribParameterfvNV: TglGetMapAttribParameterfvNV;
  glEvalMapsNV: TglEvalMapsNV;

  // GL_NV_fence
  glDeleteFencesNV: TglDeleteFencesNV;
  glGenFencesNV: TglGenFencesNV;
  glIsFenceNV: TglIsFenceNV;
  glTestFenceNV: TglTestFenceNV;
  glGetFenceivNV: TglGetFenceivNV;
  glFinishFenceNV: TglFinishFenceNV;
  glSetFenceNV: TglSetFenceNV;

  // GL_NV_fragment_program
  glProgramNamedParameter4fNV: TglProgramNamedParameter4fNV;
  glProgramNamedParameter4dNV: TglProgramNamedParameter4dNV;
  glProgramNamedParameter4fvNV: TglProgramNamedParameter4fvNV;
  glProgramNamedParameter4dvNV: TglProgramNamedParameter4dvNV;
  glGetProgramNamedParameterfvNV: TglGetProgramNamedParameterfvNV;
  glGetProgramNamedParameterdvNV: TglGetProgramNamedParameterdvNV;

  // GL_NV_half_float
  glVertex2hNV: TglVertex2hNV;
  glVertex2hvNV: TglVertex2hvNV;
  glVertex3hNV: TglVertex3hNV;
  glVertex3hvNV: TglVertex3hvNV;
  glVertex4hNV: TglVertex4hNV;
  glVertex4hvNV: TglVertex4hvNV;
  glNormal3hNV: TglNormal3hNV;
  glNormal3hvNV: TglNormal3hvNV;
  glColor3hNV: TglColor3hNV;
  glColor3hvNV: TglColor3hvNV;
  glColor4hNV: TglColor4hNV;
  glColor4hvNV: TglColor4hvNV;
  glTexCoord1hNV: TglTexCoord1hNV;
  glTexCoord1hvNV: TglTexCoord1hvNV;
  glTexCoord2hNV: TglTexCoord2hNV;
  glTexCoord2hvNV: TglTexCoord2hvNV;
  glTexCoord3hNV: TglTexCoord3hNV;
  glTexCoord3hvNV: TglTexCoord3hvNV;
  glTexCoord4hNV: TglTexCoord4hNV;
  glTexCoord4hvNV: TglTexCoord4hvNV;
  glMultiTexCoord1hNV: TglMultiTexCoord1hNV;
  glMultiTexCoord1hvNV: TglMultiTexCoord1hvNV;
  glMultiTexCoord2hNV: TglMultiTexCoord2hNV;
  glMultiTexCoord2hvNV: TglMultiTexCoord2hvNV;
  glMultiTexCoord3hNV: TglMultiTexCoord3hNV;
  glMultiTexCoord3hvNV: TglMultiTexCoord3hvNV;
  glMultiTexCoord4hNV: TglMultiTexCoord4hNV;
  glMultiTexCoord4hvNV: TglMultiTexCoord4hvNV;
  glFogCoordhNV: TglFogCoordhNV;
  glFogCoordhvNV: TglFogCoordhvNV;
  glSecondaryColor3hNV: TglSecondaryColor3hNV;
  glSecondaryColor3hvNV: TglSecondaryColor3hvNV;
  glVertexWeighthNV: TglVertexWeighthNV;
  glVertexWeighthvNV: TglVertexWeighthvNV;
  glVertexAttrib1hNV: TglVertexAttrib1hNV;
  glVertexAttrib1hvNV: TglVertexAttrib1hvNV;
  glVertexAttrib2hNV: TglVertexAttrib2hNV;
  glVertexAttrib2hvNV: TglVertexAttrib2hvNV;
  glVertexAttrib3hNV: TglVertexAttrib3hNV;
  glVertexAttrib3hvNV: TglVertexAttrib3hvNV;
  glVertexAttrib4hNV: TglVertexAttrib4hNV;
  glVertexAttrib4hvNV: TglVertexAttrib4hvNV;
  glVertexAttribs1hvNV: TglVertexAttribs1hvNV;
  glVertexAttribs2hvNV: TglVertexAttribs2hvNV;
  glVertexAttribs3hvNV: TglVertexAttribs3hvNV;
  glVertexAttribs4hvNV: TglVertexAttribs4hvNV;

  // GL_NV_occlusion_query
  glGenOcclusionQueriesNV: TglGenOcclusionQueriesNV;
  glDeleteOcclusionQueriesNV: TglDeleteOcclusionQueriesNV;
  glIsOcclusionQueryNV: TglIsOcclusionQueryNV;
  glBeginOcclusionQueryNV: TglBeginOcclusionQueryNV;
  glEndOcclusionQueryNV: TglEndOcclusionQueryNV;
  glGetOcclusionQueryivNV: TglGetOcclusionQueryivNV;
  glGetOcclusionQueryuivNV: TglGetOcclusionQueryuivNV;

  // GL_NV_pixel_data_range
  glPixelDataRangeNV: TglPixelDataRangeNV;
  glFlushPixelDataRangeNV: TglFlushPixelDataRangeNV;

  // GL_NV_point_sprite
  glPointParameteriNV: TglPointParameteriNV;
  glPointParameterivNV: TglPointParameterivNV;

  // GL_NV_primitive_restart
  glPrimitiveRestartNV: TglPrimitiveRestartNV;
  glPrimitiveRestartIndexNV: TglPrimitiveRestartIndexNV;

  // GL_NV_register_combiners
  glCombinerParameterfvNV: TglCombinerParameterfvNV;
  glCombinerParameterfNV: TglCombinerParameterfNV;
  glCombinerParameterivNV: TglCombinerParameterivNV;
  glCombinerParameteriNV: TglCombinerParameteriNV;
  glCombinerInputNV: TglCombinerInputNV;
  glCombinerOutputNV: TglCombinerOutputNV;
  glFinalCombinerInputNV: TglFinalCombinerInputNV;
  glGetCombinerInputParameterfvNV: TglGetCombinerInputParameterfvNV;
  glGetCombinerInputParameterivNV: TglGetCombinerInputParameterivNV;
  glGetCombinerOutputParameterfvNV: TglGetCombinerOutputParameterfvNV;
  glGetCombinerOutputParameterivNV: TglGetCombinerOutputParameterivNV;
  glGetFinalCombinerInputParameterfvNV: TglGetFinalCombinerInputParameterfvNV;
  glGetFinalCombinerInputParameterivNV: TglGetFinalCombinerInputParameterivNV;

  // GL_NV_register_combiners2
  glCombinerStageParameterfvNV: TglCombinerStageParameterfvNV;
  glGetCombinerStageParameterfvNV: TglGetCombinerStageParameterfvNV;

  // GL_NV_vertex_array_range
  glFlushVertexArrayRangeNV: TglFlushVertexArrayRangeNV;
  glVertexArrayRangeNV: TglVertexArrayRangeNV;

  // GL_NV_vertex_program
  glAreProgramsResidentNV: TglAreProgramsResidentNV;
  glBindProgramNV: TglBindProgramNV;
  glDeleteProgramsNV: TglDeleteProgramsNV;
  glExecuteProgramNV: TglExecuteProgramNV;
  glGenProgramsNV: TglGenProgramsNV;
  glGetProgramParameterdvNV: TglGetProgramParameterdvNV;
  glGetProgramParameterfvNV: TglGetProgramParameterfvNV;
  glGetProgramivNV: TglGetProgramivNV;
  glGetProgramStringNV: TglGetProgramStringNV;
  glGetTrackMatrixivNV: TglGetTrackMatrixivNV;
  glGetVertexAttribdvNV: TglGetVertexAttribdvNV;
  glGetVertexAttribfvNV: TglGetVertexAttribfvNV;
  glGetVertexAttribivNV: TglGetVertexAttribivNV;
  glGetVertexAttribPointervNV: TglGetVertexAttribPointervNV;
  glIsProgramNV: TglIsProgramNV;
  glLoadProgramNV: TglLoadProgramNV;
  glProgramParameter4dNV: TglProgramParameter4dNV;
  glProgramParameter4dvNV: TglProgramParameter4dvNV;
  glProgramParameter4fNV: TglProgramParameter4fNV;
  glProgramParameter4fvNV: TglProgramParameter4fvNV;
  glProgramParameters4dvNV: TglProgramParameters4dvNV;
  glProgramParameters4fvNV: TglProgramParameters4fvNV;
  glRequestResidentProgramsNV: TglRequestResidentProgramsNV;
  glTrackMatrixNV: TglTrackMatrixNV;
  glVertexAttribPointerNV: TglVertexAttribPointerNV;
  glVertexAttrib1dNV: TglVertexAttrib1dNV;
  glVertexAttrib1dvNV: TglVertexAttrib1dvNV;
  glVertexAttrib1fNV: TglVertexAttrib1fNV;
  glVertexAttrib1fvNV: TglVertexAttrib1fvNV;
  glVertexAttrib1sNV: TglVertexAttrib1sNV;
  glVertexAttrib1svNV: TglVertexAttrib1svNV;
  glVertexAttrib2dNV: TglVertexAttrib2dNV;
  glVertexAttrib2dvNV: TglVertexAttrib2dvNV;
  glVertexAttrib2fNV: TglVertexAttrib2fNV;
  glVertexAttrib2fvNV: TglVertexAttrib2fvNV;
  glVertexAttrib2sNV: TglVertexAttrib2sNV;
  glVertexAttrib2svNV: TglVertexAttrib2svNV;
  glVertexAttrib3dNV: TglVertexAttrib3dNV;
  glVertexAttrib3dvNV: TglVertexAttrib3dvNV;
  glVertexAttrib3fNV: TglVertexAttrib3fNV;
  glVertexAttrib3fvNV: TglVertexAttrib3fvNV;
  glVertexAttrib3sNV: TglVertexAttrib3sNV;
  glVertexAttrib3svNV: TglVertexAttrib3svNV;
  glVertexAttrib4dNV: TglVertexAttrib4dNV;
  glVertexAttrib4dvNV: TglVertexAttrib4dvNV;
  glVertexAttrib4fNV: TglVertexAttrib4fNV;
  glVertexAttrib4fvNV: TglVertexAttrib4fvNV;
  glVertexAttrib4sNV: TglVertexAttrib4sNV;
  glVertexAttrib4svNV: TglVertexAttrib4svNV;
  glVertexAttrib4ubNV: TglVertexAttrib4ubNV;
  glVertexAttrib4ubvNV: TglVertexAttrib4ubvNV;
  glVertexAttribs1dvNV: TglVertexAttribs1dvNV;
  glVertexAttribs1fvNV: TglVertexAttribs1fvNV;
  glVertexAttribs1svNV: TglVertexAttribs1svNV;
  glVertexAttribs2dvNV: TglVertexAttribs2dvNV;
  glVertexAttribs2fvNV: TglVertexAttribs2fvNV;
  glVertexAttribs2svNV: TglVertexAttribs2svNV;
  glVertexAttribs3dvNV: TglVertexAttribs3dvNV;
  glVertexAttribs3fvNV: TglVertexAttribs3fvNV;
  glVertexAttribs3svNV: TglVertexAttribs3svNV;
  glVertexAttribs4dvNV: TglVertexAttribs4dvNV;
  glVertexAttribs4fvNV: TglVertexAttribs4fvNV;
  glVertexAttribs4svNV: TglVertexAttribs4svNV;
  glVertexAttribs4ubvNV: TglVertexAttribs4ubvNV;

  // GL_NV_depth_buffer_float
  glDepthRangedNV: TglDepthRangedNV;
  glClearDepthdNV: TglClearDepthdNV;
  glDepthBoundsdNV: TglDepthBoundsdNV;

  // GL_NV_framebuffer_multisample_coverage
  glRenderbufferStorageMultsampleCoverageNV: TglRenderbufferStorageMultsampleCoverageNV;

  // GL_NV_geometry_program4
  glProgramVertexLimitNV: TglProgramVertexLimitNV;

  // GL_NV_gpu_program4
  glProgramLocalParameterI4iNV: TglProgramLocalParameterI4iNV;
  glProgramLocalParameterI4ivNV: TglProgramLocalParameterI4ivNV;
  glProgramLocalParametersI4ivNV: TglProgramLocalParametersI4ivNV;
  glProgramLocalParameterI4uiNV: TglProgramLocalParameterI4uiNV;
  glProgramLocalParameterI4uivNV: TglProgramLocalParameterI4uivNV;
  glProgramLocalParametersI4uivNV: TglProgramLocalParametersI4uivNV;
  glProgramEnvParameterI4iNV: TglProgramEnvParameterI4iNV;
  glProgramEnvParameterI4ivNV: TglProgramEnvParameterI4ivNV;
  glProgramEnvParametersI4ivNV: TglProgramEnvParametersI4ivNV;
  glProgramEnvParameterI4uiNV: TglProgramEnvParameterI4uiNV;
  glProgramEnvParameterI4uivNV: TglProgramEnvParameterI4uivNV;
  glProgramEnvParametersI4uivNV: TglProgramEnvParametersI4uivNV;
  glGetProgramLocalParameterIivNV: TglGetProgramLocalParameterIivNV;
  glGetProgramLocalParameterIuivNV: TglGetProgramLocalParameterIuivNV;
  glGetProgramEnvParameterIivNV: TglGetProgramEnvParameterIivNV;
  glGetProgramEnvParameterIuivNV: TglGetProgramEnvParameterIuivNV;

  // GL_NV_parameter_buffer_object
  glProgramBufferParametersfvNV: TglProgramBufferParametersfvNV;
  glProgramBufferParametersIivNV: TglProgramBufferParametersIivNV;
  glProgramBufferParametersIuivNV: TglProgramBufferParametersIuivNV;

  // GL_NV_transform_feedback
  glBeginTransformFeedbackNV: TglBeginTransformFeedbackNV;
  glEndTransformFeedbackNV: TglEndTransformFeedbackNV;
  glTransformFeedbackAttribsNV: TglTransformFeedbackAttribsNV;
  glBindBufferRangeNV: TglBindBufferRangeNV;
  glBindBufferOffsetNV: TglBindBufferOffsetNV;
  glBindBufferBaseNV: TglBindBufferBaseNV;
  glTransformFeedbackVaryingsNV: TglTransformFeedbackVaryingsNV;
  glActiveVaryingNV: TglActiveVaryingNV;
  glGetVaryingLocationNV: TglGetVaryingLocationNV;
  glGetActiveVaryingNV: TglGetActiveVaryingNV;
  glGetTransformFeedbackVaryingNV: TglGetTransformFeedbackVaryingNV;
  glTransformFeedbackStreamAttribsNV: TglTransformFeedbackStreamAttribsNV;

  // GL_NV_conditional_render
  glBeginConditionalRenderNV: TglBeginConditionalRenderNV;
  glEndConditionalRenderNV: TglEndConditionalRenderNV;

  // GL_NV_present_video
  glPresentFrameKeyedNV: TglPresentFrameKeyedNV;
  glPresentFrameDualFillNV: TglPresentFrameDualFillNV;
  glGetVideoivNV: TglGetVideoivNV;
  glGetVideouivNV: TglGetVideouivNV;
  glGetVideoi64vNV: TglGetVideoi64vNV;
  glGetVideoui64vNV: TglGetVideoui64vNV;
//  glVideoParameterivNV: TglVideoParameterivNV;

  // GL_NV_explicit_multisample
  glGetMultisamplefvNV: TglGetMultisamplefvNV;
  glSampleMaskIndexedNV: TglSampleMaskIndexedNV;
  glTexRenderbufferNV: TglTexRenderbufferNV;

  // GL_NV_transform_feedback2
  glBindTransformFeedbackNV: TglBindTransformFeedbackNV;
  glDeleteTransformFeedbacksNV: TglDeleteTransformFeedbacksNV;
  glGenTransformFeedbacksNV: TglGenTransformFeedbacksNV;
  glIsTransformFeedbackNV: TglIsTransformFeedbackNV;
  glPauseTransformFeedbackNV: TglPauseTransformFeedbackNV;
  glResumeTransformFeedbackNV: TglResumeTransformFeedbackNV;
  glDrawTransformFeedbackNV: TglDrawTransformFeedbackNV;

  // GL_NV_video_capture
  glBeginVideoCaptureNV: TglBeginVideoCaptureNV;
  glBindVideoCaptureStreamBufferNV: TglBindVideoCaptureStreamBufferNV;
  glBindVideoCaptureStreamTextureNV: TglBindVideoCaptureStreamTextureNV;
  glEndVideoCaptureNV: TglEndVideoCaptureNV;
  glGetVideoCaptureivNV: TglGetVideoCaptureivNV;
  glGetVideoCaptureStreamivNV: TglGetVideoCaptureStreamivNV;
  glGetVideoCaptureStreamfvNV: TglGetVideoCaptureStreamfvNV;
  glGetVideoCaptureStreamdvNV: TglGetVideoCaptureStreamdvNV;
  glVideoCaptureNV: TglVideoCaptureNV;
  glVideoCaptureStreamParameterivNV: TglVideoCaptureStreamParameterivNV;
  glVideoCaptureStreamParameterfvNV: TglVideoCaptureStreamParameterfvNV;
  glVideoCaptureStreamParameterdvNV: TglVideoCaptureStreamParameterdvNV;

  // GL_NV_copy_image
  glCopyImageSubDataNV: TglCopyImageSubDataNV;

  // GL_NV_shader_buffer_load
  glMakeBufferResidentNV: TglMakeBufferResidentNV;
  glMakeBufferNonResidentNV: TglMakeBufferNonResidentNV;
  glIsBufferResidentNV: TglIsBufferResidentNV;
  glMakeNamedBufferResidentNV: TglMakeNamedBufferResidentNV;
  glMakeNamedBufferNonResidentNV: TglMakeNamedBufferNonResidentNV;
  glIsNamedBufferResidentNV: TglIsNamedBufferResidentNV;
  glGetBufferParameterui64vNV: TglGetBufferParameterui64vNV;
  glGetNamedBufferParameterui64vNV: TglGetNamedBufferParameterui64vNV;
  glGetIntegerui64vNV: TglGetIntegerui64vNV;
  glUniformui64NV: TglUniformui64NV;
  glUniformui64vNV: TglUniformui64vNV;
  glGetUniformui64vNV: TglGetUniformui64vNV;
  glProgramUniformui64NV: TglProgramUniformui64NV;
  glProgramUniformui64vNV: TglProgramUniformui64vNV;

  // GL_NV_vertex_buffer_unified_memory
  glBufferAddressRangeNV: TglBufferAddressRangeNV;
  glVertexFormatNV: TglVertexFormatNV;
  glNormalFormatNV: TglNormalFormatNV;
  glColorFormatNV: TglColorFormatNV;
  glIndexFormatNV: TglIndexFormatNV;
  glTexCoordFormatNV: TglTexCoordFormatNV;
  glEdgeFlagFormatNV: TglEdgeFlagFormatNV;
  glSecondaryColorFormatNV: TglSecondaryColorFormatNV;
  glFogCoordFormatNV: TglFogCoordFormatNV;
  glVertexAttribFormatNV: TglVertexAttribFormatNV;
  glVertexAttribIFormatNV: TglVertexAttribIFormatNV;
  glGetIntegerui64i_vNV: TglGetIntegerui64i_vNV;

  // GL_NV_gpu_program5
  glProgramSubroutineParametersuivNV: TglProgramSubroutineParametersuivNV;
  glGetProgramSubroutineParameteruivNV: TglGetProgramSubroutineParameteruivNV;

  // GL_NV_gpu_shader5
  glUniform1i64NV: TglUniform1i64NV;
  glUniform2i64NV: TglUniform2i64NV;
  glUniform3i64NV: TglUniform3i64NV;
  glUniform4i64NV: TglUniform4i64NV;
  glUniform1i64vNV: TglUniform1i64vNV;
  glUniform2i64vNV: TglUniform2i64vNV;
  glUniform3i64vNV: TglUniform3i64vNV;
  glUniform4i64vNV: TglUniform4i64vNV;
  glUniform1ui64NV: TglUniform1ui64NV;
  glUniform2ui64NV: TglUniform2ui64NV;
  glUniform3ui64NV: TglUniform3ui64NV;
  glUniform4ui64NV: TglUniform4ui64NV;
  glUniform1ui64vNV: TglUniform1ui64vNV;
  glUniform2ui64vNV: TglUniform2ui64vNV;
  glUniform3ui64vNV: TglUniform3ui64vNV;
  glUniform4ui64vNV: TglUniform4ui64vNV;
  glGetUniformi64vNV: TglGetUniformi64vNV;
  glProgramUniform1i64NV: TglProgramUniform1i64NV;
  glProgramUniform2i64NV: TglProgramUniform2i64NV;
  glProgramUniform3i64NV: TglProgramUniform3i64NV;
  glProgramUniform4i64NV: TglProgramUniform4i64NV;
  glProgramUniform1i64vNV: TglProgramUniform1i64vNV;
  glProgramUniform2i64vNV: TglProgramUniform2i64vNV;
  glProgramUniform3i64vNV: TglProgramUniform3i64vNV;
  glProgramUniform4i64vNV: TglProgramUniform4i64vNV;
  glProgramUniform1ui64NV: TglProgramUniform1ui64NV;
  glProgramUniform2ui64NV: TglProgramUniform2ui64NV;
  glProgramUniform3ui64NV: TglProgramUniform3ui64NV;
  glProgramUniform4ui64NV: TglProgramUniform4ui64NV;
  glProgramUniform1ui64vNV: TglProgramUniform1ui64vNV;
  glProgramUniform2ui64vNV: TglProgramUniform2ui64vNV;
  glProgramUniform3ui64vNV: TglProgramUniform3ui64vNV;
  glProgramUniform4ui64vNV: TglProgramUniform4ui64vNV;

  // GL_NV_vertex_attrib_integer_64bit
  glVertexAttribL1i64NV: TglVertexAttribL1i64NV;
  glVertexAttribL2i64NV: TglVertexAttribL2i64NV;
  glVertexAttribL3i64NV: TglVertexAttribL3i64NV;
  glVertexAttribL4i64NV: TglVertexAttribL4i64NV;
  glVertexAttribL1i64vNV: TglVertexAttribL1i64vNV;
  glVertexAttribL2i64vNV: TglVertexAttribL2i64vNV;
  glVertexAttribL3i64vNV: TglVertexAttribL3i64vNV;
  glVertexAttribL4i64vNV: TglVertexAttribL4i64vNV;
  glVertexAttribL1ui64NV: TglVertexAttribL1ui64NV;
  glVertexAttribL2ui64NV: TglVertexAttribL2ui64NV;
  glVertexAttribL3ui64NV: TglVertexAttribL3ui64NV;
  glVertexAttribL4ui64NV: TglVertexAttribL4ui64NV;
  glVertexAttribL1ui64vNV: TglVertexAttribL1ui64vNV;
  glVertexAttribL2ui64vNV: TglVertexAttribL2ui64vNV;
  glVertexAttribL3ui64vNV: TglVertexAttribL3ui64vNV;
  glVertexAttribL4ui64vNV: TglVertexAttribL4ui64vNV;
  glGetVertexAttribLi64vNV: TglGetVertexAttribLi64vNV;
  glGetVertexAttribLui64vNV: TglGetVertexAttribLui64vNV;
  glVertexAttribLFormatNV: TglVertexAttribLFormatNV;

  // GL_NV_vdpau_interop
  glVDPAUInitNV: TglVDPAUInitNV;
  glVDPAUFiniNV: TglVDPAUFiniNV;
  glVDPAURegisterVideoSurfaceNV: TglVDPAURegisterVideoSurfaceNV;
  glVDPAURegisterOutputSurfaceNV: TglVDPAURegisterOutputSurfaceNV;
  glVDPAUIsSurfaceNV: TglVDPAUIsSurfaceNV;
  glVDPAUUnregisterSurfaceNV: TglVDPAUUnregisterSurfaceNV;
  glVDPAUGetSurfaceivNV: TglVDPAUGetSurfaceivNV;
  glVDPAUSurfaceAccessNV: TglVDPAUSurfaceAccessNV;
  glVDPAUMapSurfacesNV: TglVDPAUMapSurfacesNV;
  glVDPAUUnmapSurfacesNV: TglVDPAUUnmapSurfacesNV;

  // GL_NV_texture_barrier
  glTextureBarrierNV: TglTextureBarrierNV;

  // GL_PGI_misc_hints
  glHintPGI: TglHintPGI;

  // GL_SGIS_detail_texture
  glDetailTexFuncSGIS: TglDetailTexFuncSGIS;
  glGetDetailTexFuncSGIS: TglGetDetailTexFuncSGIS;

  // GL_SGIS_fog_function
  glFogFuncSGIS: TglFogFuncSGIS;
  glGetFogFuncSGIS: TglGetFogFuncSGIS;

  // GL_SGIS_multisample
  glSampleMaskSGIS: TglSampleMaskSGIS;
  glSamplePatternSGIS: TglSamplePatternSGIS;

  // GL_SGIS_pixel_texture
  glPixelTexGenParameteriSGIS: TglPixelTexGenParameteriSGIS;
  glPixelTexGenParameterivSGIS: TglPixelTexGenParameterivSGIS;
  glPixelTexGenParameterfSGIS: TglPixelTexGenParameterfSGIS;
  glPixelTexGenParameterfvSGIS: TglPixelTexGenParameterfvSGIS;
  glGetPixelTexGenParameterivSGIS: TglGetPixelTexGenParameterivSGIS;
  glGetPixelTexGenParameterfvSGIS: TglGetPixelTexGenParameterfvSGIS;

  // GL_SGIS_point_parameters
  glPointParameterfSGIS: TglPointParameterfSGIS;
  glPointParameterfvSGIS: TglPointParameterfvSGIS;

  // GL_SGIS_sharpen_texture
  glSharpenTexFuncSGIS: TglSharpenTexFuncSGIS;
  glGetSharpenTexFuncSGIS: TglGetSharpenTexFuncSGIS;

  // GL_SGIS_texture4D
  glTexImage4DSGIS: TglTexImage4DSGIS;
  glTexSubImage4DSGIS: TglTexSubImage4DSGIS;

  // GL_SGIS_texture_color_mask
  glTextureColorMaskSGIS: TglTextureColorMaskSGIS;

  // GL_SGIS_texture_filter4
  glGetTexFilterFuncSGIS: TglGetTexFilterFuncSGIS;
  glTexFilterFuncSGIS: TglTexFilterFuncSGIS;

  // GL_SGIX_async
  glAsyncMarkerSGIX: TglAsyncMarkerSGIX;
  glFinishAsyncSGIX: TglFinishAsyncSGIX;
  glPollAsyncSGIX: TglPollAsyncSGIX;
  glGenAsyncMarkersSGIX: TglGenAsyncMarkersSGIX;
  glDeleteAsyncMarkersSGIX: TglDeleteAsyncMarkersSGIX;
  glIsAsyncMarkerSGIX: TglIsAsyncMarkerSGIX;

  // GL_SGIX_flush_raster
  glFlushRasterSGIX: TglFlushRasterSGIX;

  // GL_SGIX_fragment_lighting
  glFragmentColorMaterialSGIX: TglFragmentColorMaterialSGIX;
  glFragmentLightfSGIX: TglFragmentLightfSGIX;
  glFragmentLightfvSGIX: TglFragmentLightfvSGIX;
  glFragmentLightiSGIX: TglFragmentLightiSGIX;
  glFragmentLightivSGIX: TglFragmentLightivSGIX;
  glFragmentLightModelfSGIX: TglFragmentLightModelfSGIX;
  glFragmentLightModelfvSGIX: TglFragmentLightModelfvSGIX;
  glFragmentLightModeliSGIX: TglFragmentLightModeliSGIX;
  glFragmentLightModelivSGIX: TglFragmentLightModelivSGIX;
  glFragmentMaterialfSGIX: TglFragmentMaterialfSGIX;
  glFragmentMaterialfvSGIX: TglFragmentMaterialfvSGIX;
  glFragmentMaterialiSGIX: TglFragmentMaterialiSGIX;
  glFragmentMaterialivSGIX: TglFragmentMaterialivSGIX;
  glGetFragmentLightfvSGIX: TglGetFragmentLightfvSGIX;
  glGetFragmentLightivSGIX: TglGetFragmentLightivSGIX;
  glGetFragmentMaterialfvSGIX: TglGetFragmentMaterialfvSGIX;
  glGetFragmentMaterialivSGIX: TglGetFragmentMaterialivSGIX;
  glLightEnviSGIX: TglLightEnviSGIX;

  // GL_SGIX_framezoom
  glFrameZoomSGIX: TglFrameZoomSGIX;

  // GL_SGIX_igloo_interface
  glIglooInterfaceSGIX: TglIglooInterfaceSGIX;

  // GL_SGIX_instruments
  glGetInstrumentsSGIX: TglGetInstrumentsSGIX;
  glInstrumentsBufferSGIX: TglInstrumentsBufferSGIX;
  glPollInstrumentsSGIX: TglPollInstrumentsSGIX;
  glReadInstrumentsSGIX: TglReadInstrumentsSGIX;
  glStartInstrumentsSGIX: TglStartInstrumentsSGIX;
  glStopInstrumentsSGIX: TglStopInstrumentsSGIX;

  // GL_SGIX_list_priority
  glGetListParameterfvSGIX: TglGetListParameterfvSGIX;
  glGetListParameterivSGIX: TglGetListParameterivSGIX;
  glListParameterfSGIX: TglListParameterfSGIX;
  glListParameterfvSGIX: TglListParameterfvSGIX;
  glListParameteriSGIX: TglListParameteriSGIX;
  glListParameterivSGIX: TglListParameterivSGIX;

  // GL_SGIX_pixel_texture
  glPixelTexGenSGIX: TglPixelTexGenSGIX;

  // GL_SGIX_polynomial_ffd
  glDeformationMap3dSGIX: TglDeformationMap3dSGIX;
  glDeformationMap3fSGIX: TglDeformationMap3fSGIX;
  glDeformSGIX: TglDeformSGIX;
  glLoadIdentityDeformationMapSGIX: TglLoadIdentityDeformationMapSGIX;

  // GL_SGIX_reference_plane
  glReferencePlaneSGIX: TglReferencePlaneSGIX;

  // GL_SGIX_sprite
  glSpriteParameterfSGIX: TglSpriteParameterfSGIX;
  glSpriteParameterfvSGIX: TglSpriteParameterfvSGIX;
  glSpriteParameteriSGIX: TglSpriteParameteriSGIX;
  glSpriteParameterivSGIX: TglSpriteParameterivSGIX;

  // GL_SGIX_tag_sample_buffer
  glTagSampleBufferSGIX: TglTagSampleBufferSGIX;

  // GL_SGI_color_table
  glColorTableSGI: TglColorTableSGI;
  glColorTableParameterfvSGI: TglColorTableParameterfvSGI;
  glColorTableParameterivSGI: TglColorTableParameterivSGI;
  glCopyColorTableSGI: TglCopyColorTableSGI;
  glGetColorTableSGI: TglGetColorTableSGI;
  glGetColorTableParameterfvSGI: TglGetColorTableParameterfvSGI;
  glGetColorTableParameterivSGI: TglGetColorTableParameterivSGI;

  // GL_SUNX_constant_data
  glFinishTextureSUNX: TglFinishTextureSUNX;

  // GL_SUN_global_alpha
  glGlobalAlphaFactorbSUN: TglGlobalAlphaFactorbSUN;
  glGlobalAlphaFactorsSUN: TglGlobalAlphaFactorsSUN;
  glGlobalAlphaFactoriSUN: TglGlobalAlphaFactoriSUN;
  glGlobalAlphaFactorfSUN: TglGlobalAlphaFactorfSUN;
  glGlobalAlphaFactordSUN: TglGlobalAlphaFactordSUN;
  glGlobalAlphaFactorubSUN: TglGlobalAlphaFactorubSUN;
  glGlobalAlphaFactorusSUN: TglGlobalAlphaFactorusSUN;
  glGlobalAlphaFactoruiSUN: TglGlobalAlphaFactoruiSUN;

  // GL_SUN_mesh_array
  glDrawMeshArraysSUN: TglDrawMeshArraysSUN;

  // GL_SUN_triangle_list
  glReplacementCodeuiSUN: TglReplacementCodeuiSUN;
  glReplacementCodeusSUN: TglReplacementCodeusSUN;
  glReplacementCodeubSUN: TglReplacementCodeubSUN;
  glReplacementCodeuivSUN: TglReplacementCodeuivSUN;
  glReplacementCodeusvSUN: TglReplacementCodeusvSUN;
  glReplacementCodeubvSUN: TglReplacementCodeubvSUN;
  glReplacementCodePointerSUN: TglReplacementCodePointerSUN;

  // GL_SUN_vertex
  glColor4ubVertex2fSUN: TglColor4ubVertex2fSUN;
  glColor4ubVertex2fvSUN: TglColor4ubVertex2fvSUN;
  glColor4ubVertex3fSUN: TglColor4ubVertex3fSUN;
  glColor4ubVertex3fvSUN: TglColor4ubVertex3fvSUN;
  glColor3fVertex3fSUN: TglColor3fVertex3fSUN;
  glColor3fVertex3fvSUN: TglColor3fVertex3fvSUN;
  glNormal3fVertex3fSUN: TglNormal3fVertex3fSUN;
  glNormal3fVertex3fvSUN: TglNormal3fVertex3fvSUN;
  glColor4fNormal3fVertex3fSUN: TglColor4fNormal3fVertex3fSUN;
  glColor4fNormal3fVertex3fvSUN: TglColor4fNormal3fVertex3fvSUN;
  glTexCoord2fVertex3fSUN: TglTexCoord2fVertex3fSUN;
  glTexCoord2fVertex3fvSUN: TglTexCoord2fVertex3fvSUN;
  glTexCoord4fVertex4fSUN: TglTexCoord4fVertex4fSUN;
  glTexCoord4fVertex4fvSUN: TglTexCoord4fVertex4fvSUN;
  glTexCoord2fColor4ubVertex3fSUN: TglTexCoord2fColor4ubVertex3fSUN;
  glTexCoord2fColor4ubVertex3fvSUN: TglTexCoord2fColor4ubVertex3fvSUN;
  glTexCoord2fColor3fVertex3fSUN: TglTexCoord2fColor3fVertex3fSUN;
  glTexCoord2fColor3fVertex3fvSUN: TglTexCoord2fColor3fVertex3fvSUN;
  glTexCoord2fNormal3fVertex3fSUN: TglTexCoord2fNormal3fVertex3fSUN;
  glTexCoord2fNormal3fVertex3fvSUN: TglTexCoord2fNormal3fVertex3fvSUN;
  glTexCoord2fColor4fNormal3fVertex3fSUN: TglTexCoord2fColor4fNormal3fVertex3fSUN;
  glTexCoord2fColor4fNormal3fVertex3fvSUN: TglTexCoord2fColor4fNormal3fVertex3fvSUN;
  glTexCoord4fColor4fNormal3fVertex4fSUN: TglTexCoord4fColor4fNormal3fVertex4fSUN;
  glTexCoord4fColor4fNormal3fVertex4fvSUN: TglTexCoord4fColor4fNormal3fVertex4fvSUN;
  glReplacementCodeuiVertex3fSUN: TglReplacementCodeuiVertex3fSUN;
  glReplacementCodeuiVertex3fvSUN: TglReplacementCodeuiVertex3fvSUN;
  glReplacementCodeuiColor4ubVertex3fSUN: TglReplacementCodeuiColor4ubVertex3fSUN;
  glReplacementCodeuiColor4ubVertex3fvSUN: TglReplacementCodeuiColor4ubVertex3fvSUN;
  glReplacementCodeuiColor3fVertex3fSUN: TglReplacementCodeuiColor3fVertex3fSUN;
  glReplacementCodeuiColor3fVertex3fvSUN: TglReplacementCodeuiColor3fVertex3fvSUN;
  glReplacementCodeuiNormal3fVertex3fSUN: TglReplacementCodeuiNormal3fVertex3fSUN;
  glReplacementCodeuiNormal3fVertex3fvSUN: TglReplacementCodeuiNormal3fVertex3fvSUN;
  glReplacementCodeuiColor4fNormal3fVertex3fSUN: TglReplacementCodeuiColor4fNormal3fVertex3fSUN;
  glReplacementCodeuiColor4fNormal3fVertex3fvSUN: TglReplacementCodeuiColor4fNormal3fVertex3fvSUN;
  glReplacementCodeuiTexCoord2fVertex3fSUN: TglReplacementCodeuiTexCoord2fVertex3fSUN;
  glReplacementCodeuiTexCoord2fVertex3fvSUN: TglReplacementCodeuiTexCoord2fVertex3fvSUN;
  glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN: TglReplacementCodeuiTexCoord2fNormal3fVertex3fSUN;
  glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN: TglReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN;
  glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN: TglReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN;
  glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN: TglReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN;

{$IFDEF DGL_WIN}
  wglGetProcAddress: TwglGetProcAddress;
  wglCopyContext: TwglCopyContext;
  wglCreateContext: TwglCreateContext;
  wglCreateLayerContext: TwglCreateLayerContext;
  wglDeleteContext: TwglDeleteContext;
  wglDescribeLayerPlane: TwglDescribeLayerPlane;
  wglGetCurrentContext: TwglGetCurrentContext;
  wglGetCurrentDC: TwglGetCurrentDC;
  wglGetLayerPaletteEntries: TwglGetLayerPaletteEntries;
  wglMakeCurrent: TwglMakeCurrent;
  wglRealizeLayerPalette: TwglRealizeLayerPalette;
  wglSetLayerPaletteEntries: TwglSetLayerPaletteEntries;
  wglShareLists: TwglShareLists;
  wglSwapLayerBuffers: TwglSwapLayerBuffers;
  wglSwapMultipleBuffers: TwglSwapMultipleBuffers;
  wglUseFontBitmapsA: TwglUseFontBitmapsA;
  wglUseFontOutlinesA: TwglUseFontOutlinesA;
  wglUseFontBitmapsW: TwglUseFontBitmapsW;
  wglUseFontOutlinesW: TwglUseFontOutlinesW;
  wglUseFontBitmaps: TwglUseFontBitmaps;
  wglUseFontOutlines: TwglUseFontOutlines;

   // WGL_ARB_buffer_region
  wglCreateBufferRegionARB: TwglCreateBufferRegionARB;
  wglDeleteBufferRegionARB: TwglDeleteBufferRegionARB;
  wglSaveBufferRegionARB: TwglSaveBufferRegionARB;
  wglRestoreBufferRegionARB: TwglRestoreBufferRegionARB;

  // WGL_ARB_extensions_string
  wglGetExtensionsStringARB: TwglGetExtensionsStringARB;

  // WGL_ARB_make_current_read
  wglMakeContextCurrentARB: TwglMakeContextCurrentARB;
  wglGetCurrentReadDCARB: TwglGetCurrentReadDCARB;

  // WGL_ARB_pbuffer
  wglCreatePbufferARB: TwglCreatePbufferARB;
  wglGetPbufferDCARB: TwglGetPbufferDCARB;
  wglReleasePbufferDCARB: TwglReleasePbufferDCARB;
  wglDestroyPbufferARB: TwglDestroyPbufferARB;
  wglQueryPbufferARB: TwglQueryPbufferARB;

  // WGL_ARB_pixel_format
  wglGetPixelFormatAttribivARB: TwglGetPixelFormatAttribivARB;
  wglGetPixelFormatAttribfvARB: TwglGetPixelFormatAttribfvARB;
  wglChoosePixelFormatARB: TwglChoosePixelFormatARB;
  // WGL_ARB_color_buffer_float
  wglClampColorARB: TwglClampColorARB;

  // WGL_ARB_render_texture
  wglBindTexImageARB: TwglBindTexImageARB;
  wglReleaseTexImageARB: TwglReleaseTexImageARB;
  wglSetPbufferAttribARB: TwglSetPbufferAttribARB;

  // WGL_ARB_create_context
  wglCreateContextAttribsARB: TwglCreateContextAttribsARB;

  // WGL_AMD_gpu_association
  wglGetGPUIDsAMD: TwglGetGPUIDsAMD;
  wglGetGPUInfoAMD: TwglGetGPUInfoAMD;
  wglGetContextGPUIDAMD: TwglGetContextGPUIDAMD;
  wglCreateAssociatedContextAMD: TwglCreateAssociatedContextAMD;
  wglCreateAssociatedContextAttribsAMD: TwglCreateAssociatedContextAttribsAMD;
  wglDeleteAssociatedContextAMD: TwglDeleteAssociatedContextAMD;
  wglMakeAssociatedContextCurrentAMD: TwglMakeAssociatedContextCurrentAMD;
  wglGetCurrentAssociatedContextAMD: TwglGetCurrentAssociatedContextAMD;
  wglBlitContextFramebufferAMD: TwglBlitContextFramebufferAMD;

  // WGL_EXT_display_color_table
  wglCreateDisplayColorTableEXT: TwglCreateDisplayColorTableEXT;
  wglLoadDisplayColorTableEXT: TwglLoadDisplayColorTableEXT;
  wglBindDisplayColorTableEXT: TwglBindDisplayColorTableEXT;
  wglDestroyDisplayColorTableEXT: TwglDestroyDisplayColorTableEXT;

  // WGL_EXT_extensions_string
  wglGetExtensionsStringEXT: TwglGetExtensionsStringEXT;

  // WGL_EXT_make_current_read
  wglMakeContextCurrentEXT: TwglMakeContextCurrentEXT;
  wglGetCurrentReadDCEXT: TwglGetCurrentReadDCEXT;

  // WGL_EXT_pbuffer
  wglCreatePbufferEXT: TwglCreatePbufferEXT;
  wglGetPbufferDCEXT: TwglGetPbufferDCEXT;
  wglReleasePbufferDCEXT: TwglReleasePbufferDCEXT;
  wglDestroyPbufferEXT: TwglDestroyPbufferEXT;
  wglQueryPbufferEXT: TwglQueryPbufferEXT;

  // WGL_EXT_pixel_format
  wglGetPixelFormatAttribivEXT: TwglGetPixelFormatAttribivEXT;
  wglGetPixelFormatAttribfvEXT: TwglGetPixelFormatAttribfvEXT;
  wglChoosePixelFormatEXT: TwglChoosePixelFormatEXT;

  // WGL_EXT_swap_control
  wglSwapIntervalEXT: TwglSwapIntervalEXT;
  wglGetSwapIntervalEXT: TwglGetSwapIntervalEXT;

  // WGL_I3D_digital_video_control
  wglGetDigitalVideoParametersI3D: TwglGetDigitalVideoParametersI3D;
  wglSetDigitalVideoParametersI3D: TwglSetDigitalVideoParametersI3D;

  // WGL_I3D_gamma
  wglGetGammaTableParametersI3D: TwglGetGammaTableParametersI3D;
  wglSetGammaTableParametersI3D: TwglSetGammaTableParametersI3D;
  wglGetGammaTableI3D: TwglGetGammaTableI3D;
  wglSetGammaTableI3D: TwglSetGammaTableI3D;

  // WGL_I3D_genlock
  wglEnableGenlockI3D: TwglEnableGenlockI3D;
  wglDisableGenlockI3D: TwglDisableGenlockI3D;
  wglIsEnabledGenlockI3D: TwglIsEnabledGenlockI3D;
  wglGenlockSourceI3D: TwglGenlockSourceI3D;
  wglGetGenlockSourceI3D: TwglGetGenlockSourceI3D;
  wglGenlockSourceEdgeI3D: TwglGenlockSourceEdgeI3D;
  wglGetGenlockSourceEdgeI3D: TwglGetGenlockSourceEdgeI3D;
  wglGenlockSampleRateI3D: TwglGenlockSampleRateI3D;
  wglGetGenlockSampleRateI3D: TwglGetGenlockSampleRateI3D;
  wglGenlockSourceDelayI3D: TwglGenlockSourceDelayI3D;
  wglGetGenlockSourceDelayI3D: TwglGetGenlockSourceDelayI3D;
  wglQueryGenlockMaxSourceDelayI3D: TwglQueryGenlockMaxSourceDelayI3D;

  // WGL_I3D_image_buffer
  wglCreateImageBufferI3D: TwglCreateImageBufferI3D;
  wglDestroyImageBufferI3D: TwglDestroyImageBufferI3D;
  wglAssociateImageBufferEventsI3D: TwglAssociateImageBufferEventsI3D;
  wglReleaseImageBufferEventsI3D: TwglReleaseImageBufferEventsI3D;

  // WGL_I3D_swap_frame_lock
  wglEnableFrameLockI3D: TwglEnableFrameLockI3D;
  wglDisableFrameLockI3D: TwglDisableFrameLockI3D;
  wglIsEnabledFrameLockI3D: TwglIsEnabledFrameLockI3D;
  wglQueryFrameLockMasterI3D: TwglQueryFrameLockMasterI3D;

  // WGL_I3D_swap_frame_usage
  wglGetFrameUsageI3D: TwglGetFrameUsageI3D;
  wglBeginFrameTrackingI3D: TwglBeginFrameTrackingI3D;
  wglEndFrameTrackingI3D: TwglEndFrameTrackingI3D;
  wglQueryFrameTrackingI3D: TwglQueryFrameTrackingI3D;

  // WGL_NV_vertex_array_range
  wglAllocateMemoryNV: TwglAllocateMemoryNV;
  wglFreeMemoryNV: TwglFreeMemoryNV;

  // WGL_NV_present_video
  wglEnumerateVideoDevicesNV: TwglEnumerateVideoDevicesNV;
  wglBindVideoDeviceNV: TwglBindVideoDeviceNV;
  wglQueryCurrentContextNV: TwglQueryCurrentContextNV;

  // WGL_NV_video_output
  wglGetVideoDeviceNV: TwglGetVideoDeviceNV;
  wglReleaseVideoDeviceNV: TwglReleaseVideoDeviceNV;
  wglBindVideoImageNV: TwglBindVideoImageNV;
  wglReleaseVideoImageNV: TwglReleaseVideoImageNV;
  wglSendPbufferToVideoNV: TwglSendPbufferToVideoNV;
  wglGetVideoInfoNV: TwglGetVideoInfoNV;

  // WGL_NV_swap_group
  wglJoinSwapGroupNV: TwglJoinSwapGroupNV;
  wglBindSwapBarrierNV: TwglBindSwapBarrierNV;
  wglQuerySwapGroupNV: TwglQuerySwapGroupNV;
  wglQueryMaxSwapGroupsNV: TwglQueryMaxSwapGroupsNV;
  wglQueryFrameCountNV: TwglQueryFrameCountNV;
  wglResetFrameCountNV: TwglResetFrameCountNV;

  // WGL_NV_gpu_affinity
  wglEnumGpusNV: TwglEnumGpusNV;
  wglEnumGpuDevicesNV: TwglEnumGpuDevicesNV;
  wglCreateAffinityDCNV: TwglCreateAffinityDCNV;
  wglEnumGpusFromAffinityDCNV: TwglEnumGpusFromAffinityDCNV;
  wglDeleteDCNV: TwglDeleteDCNV;

  // WGL_NV_video_capture
  wglBindVideoCaptureDeviceNV: TwglBindVideoCaptureDeviceNV;
  wglEnumerateVideoCaptureDevicesNV: TwglEnumerateVideoCaptureDevicesNV;
  wglLockVideoCaptureDeviceNV: TwglLockVideoCaptureDeviceNV;
  wglQueryVideoCaptureDeviceNV: TwglQueryVideoCaptureDeviceNV;
  wglReleaseVideoCaptureDeviceNV: TwglReleaseVideoCaptureDeviceNV;

  // WGL_NV_copy_image
  wglCopyImageSubDataNV: TwglCopyImageSubDataNV;

  // WGL_OML_sync_control
  wglGetSyncValuesOML: TwglGetSyncValuesOML;
  wglGetMscRateOML: TwglGetMscRateOML;
  wglSwapBuffersMscOML: TwglSwapBuffersMscOML;
  wglSwapLayerBuffersMscOML: TwglSwapLayerBuffersMscOML;
  wglWaitForMscOML: TwglWaitForMscOML;
  wglWaitForSbcOML: TwglWaitForSbcOML;

  // WGL_3DL_stereo_control
  wglSetStereoEmitterState3DL: TwglSetStereoEmitterState3DL;

  // WIN_draw_range_elements
  glDrawRangeElementsWIN: TglDrawRangeElementsWIN;

  // WIN_swap_hint
  glAddSwapHintRectWIN: TglAddSwapHintRectWIN;
{$ENDIF}

{$IFDEF DGL_LINUX}
  glXChooseVisual: TglXChooseVisual;
  glXCopyContext: TglXCopyContext;
  glXCreateContext: TglXCreateContext;
  glXCreateGLXPixmap: TglXCreateGLXPixmap;
  glXDestroyContext: TglXDestroyContext;
  glXDestroyGLXPixmap: TglXDestroyGLXPixmap;
  glXGetConfig: TglXGetConfig;
  glXGetCurrentContext: TglXGetCurrentContext;
  glXGetCurrentDrawable: TglXGetCurrentDrawable;
  glXIsDirect: TglXIsDirect;
  glXMakeCurrent: TglXMakeCurrent;
  glXQueryExtension: TglXQueryExtension;
  glXQueryVersion: TglXQueryVersion;
  glXSwapBuffers: TglXSwapBuffers;
  glXUseXFont: TglXUseXFont;
  glXWaitGL: TglXWaitGL;
  glXWaitX: TglXWaitX;

  glXGetClientString: TglXGetClientString;
  glXQueryServerString: TglXQueryServerString;
  glXQueryExtensionsString: TglXQueryExtensionsString;

  // GLX_VERSION_1_3
  glXGetFBConfigs: TglXGetFBConfigs;
  glXChooseFBConfig: TglXChooseFBConfig;
  glXGetFBConfigAttrib: TglXGetFBConfigAttrib;
  glXGetVisualFromFBConfig: TglXGetVisualFromFBConfig;
  glXCreateWindow: TglXCreateWindow;
  glXDestroyWindow: TglXDestroyWindow;
  glXCreatePixmap: TglXCreatePixmap;

  glXDestroyPixmap: TglXDestroyPixmap;
  glXCreatePbuffer: TglXCreatePbuffer;
  glXDestroyPbuffer: TglXDestroyPbuffer;
  glXQueryDrawable: TglXQueryDrawable;
  glXCreateNewContext: TglXCreateNewContext;
  glXMakeContextCurrent: TglXMakeContextCurrent;
  glXGetCurrentReadDrawable: TglXGetCurrentReadDrawable;
  glXGetCurreentDisplay: TglXGetCurreentDisplay;

  glXQueryContext: TglXQueryContext;
  glXSelectEvent: TglXSelectEvent;
  glXGetSelectedEvent: TglXGetSelectedEvent;

  // GLX_VERSION_1_4
  glXGetProcAddress: TglXGetProcAddress;

  // GLX_ARB_get_proc_address
  glXGetProcAddressARB: TglXGetProcAddressARB;

  // GLX_ARB_create_context
  glXCreateContextAttribsARB: TglXCreateContextAttribsARB;
  
  // GLX_EXT_import_context
  glXGetCurrentDisplayEXT: TglXGetCurrentDisplayEXT;
  glXQueryContextInfoEXT: TglXQueryContextInfoEXT;
  glXGetContextIDEXT: TglXGetContextIDEXT;
  glXImportContextEXT: TglXImportContextEXT;
  glXFreeContextEXT: TglXFreeContextEXT;
  
  // GLX_EXT_texture_from_pixmap
  glXBindTexImageEXT: TglXBindTexImageEXT;
  glXReleaseTexImageEXT: TglXReleaseTexImageEXT;
{$ENDIF}

  // GL utility functions and procedures
  gluErrorString: TgluErrorString;
  gluGetString: TgluGetString;
  gluOrtho2D: TgluOrtho2D;
  gluPerspective: TgluPerspective;
  gluPickMatrix: TgluPickMatrix;
  gluLookAt: TgluLookAt;
  gluProject: TgluProject;
  gluUnProject: TgluUnProject;
  gluScaleImage: TgluScaleImage;
  gluBuild1DMipmaps: TgluBuild1DMipmaps;
  gluBuild2DMipmaps: TgluBuild2DMipmaps;
  gluNewQuadric: TgluNewQuadric;
  gluDeleteQuadric: TgluDeleteQuadric;
  gluQuadricNormals: TgluQuadricNormals;
  gluQuadricTexture: TgluQuadricTexture;
  gluQuadricOrientation: TgluQuadricOrientation;
  gluQuadricDrawStyle: TgluQuadricDrawStyle;
  gluCylinder: TgluCylinder;
  gluDisk: TgluDisk;
  gluPartialDisk: TgluPartialDisk;
  gluSphere: TgluSphere;
  gluQuadricCallback: TgluQuadricCallback;
  gluNewTess: TgluNewTess;
  gluDeleteTess: TgluDeleteTess;
  gluTessBeginPolygon: TgluTessBeginPolygon;
  gluTessBeginContour: TgluTessBeginContour;
  gluTessVertex: TgluTessVertex;
  gluTessEndContour: TgluTessEndContour;
  gluTessEndPolygon: TgluTessEndPolygon;
  gluTessProperty: TgluTessProperty;
  gluTessNormal: TgluTessNormal;
  gluTessCallback: TgluTessCallback;
  gluGetTessProperty: TgluGetTessProperty;
  gluNewNurbsRenderer: TgluNewNurbsRenderer;
  gluDeleteNurbsRenderer: TgluDeleteNurbsRenderer;
  gluBeginSurface: TgluBeginSurface;
  gluBeginCurve: TgluBeginCurve;
  gluEndCurve: TgluEndCurve;
  gluEndSurface: TgluEndSurface;
  gluBeginTrim: TgluBeginTrim;
  gluEndTrim: TgluEndTrim;
  gluPwlCurve: TgluPwlCurve;
  gluNurbsCurve: TgluNurbsCurve;
  gluNurbsSurface: TgluNurbsSurface;
  gluLoadSamplingMatrices: TgluLoadSamplingMatrices;
  gluNurbsProperty: TgluNurbsProperty;
  gluGetNurbsProperty: TgluGetNurbsProperty;
  gluNurbsCallback: TgluNurbsCallback;
  gluBeginPolygon: TgluBeginPolygon;
  gluNextContour: TgluNextContour;
  gluEndPolygon: TgluEndPolygon;


type
  TRCOptions = set of (opDoubleBuffered, opGDI, opStereo);

var
  GL_LibHandle: Pointer = nil;
  GLU_LibHandle: Pointer = nil;

  LastPixelFormat: Integer;
  ExtensionsRead: Boolean;
  ImplementationRead: Boolean;


const
{$IFDEF DGL_WIN}
  OPENGL_LIBNAME = 'OpenGL32.dll';
  GLU_LIBNAME = 'GLU32.dll';
{$ELSE}
  {$IFDEF darwin}
    OPENGL_LIBNAME = 'libGL.dylib';
    GLU_LIBNAME = 'libGLU.dylib';
  {$ELSE}
    OPENGL_LIBNAME = 'libGL.so.1';
    GLU_LIBNAME = 'libGLU.so.1';
  {$ENDIF}
{$ENDIF}

function InitOpenGL(LibName: String = OPENGL_LIBNAME; GLULibName: String = GLU_LIBNAME): Boolean;

function dglGetProcAddress(ProcName: PAnsiChar; LibHandle: Pointer = nil {$IFDEF DGL_LINUX}; ForceDLSym: Boolean = False{$ENDIF}): Pointer;
function dglCheckExtension(Extension: AnsiString): Boolean;

procedure ReadExtensions;
procedure ReadImplementationProperties;

// =============================================================================
// Helper-Functions
// =============================================================================
{$IFDEF DGL_WIN}
  function CreateRenderingContext(DC: HDC; Options: TRCOptions; ColorBits, ZBits, StencilBits, AccumBits, AuxBuffers: Integer; Layer: Integer): HGLRC;
  procedure DestroyRenderingContext(RC: HGLRC);

  procedure ActivateRenderingContext(DC: HDC; RC: HGLRC; loadext: boolean = true);
  procedure DeactivateRenderingContext;
{$ENDIF}


procedure ReadOpenGLCore;
procedure Read_GL_3DFX_tbuffer;
procedure Read_GL_APPLE_element_array;
procedure Read_GL_APPLE_fence;
procedure Read_GL_APPLE_vertex_array_object;
procedure Read_GL_APPLE_vertex_array_range;
procedure Read_GL_APPLE_texture_range;
procedure Read_GL_APPLE_vertex_program_evaluators;
procedure Read_GL_APPLE_object_purgeable;
procedure Read_GL_ARB_matrix_palette;
procedure Read_GL_ARB_multitexture;
procedure Read_GL_ARB_point_parameters;
procedure Read_GL_ARB_texture_compression;
procedure Read_GL_ARB_transpose_matrix;
procedure Read_GL_ARB_vertex_blend;
procedure Read_GL_ARB_vertex_buffer_object;
procedure Read_GL_ARB_vertex_program;
procedure Read_GL_ARB_window_pos;
procedure Read_GL_ARB_color_buffer_float;
procedure Read_GL_ARB_Shader_Objects;
procedure Read_GL_ARB_occlusion_query;
procedure Read_GL_ARB_draw_instanced;
procedure Read_GL_ARB_framebuffer_object;
procedure Read_GL_ARB_geometry_shader4;
procedure Read_GL_ARB_instanced_arrays;
procedure Read_GL_ARB_map_buffer_range;
procedure Read_GL_ARB_texture_buffer_object;
procedure Read_GL_ARB_vertex_array_object;
procedure Read_GL_ARB_uniform_buffer_object;
procedure Read_GL_ARB_copy_buffer;
procedure Read_GL_ARB_draw_elements_base_vertex;
procedure Read_GL_ARB_provoking_vertex;
procedure Read_GL_ARB_sync;
procedure Read_GL_ARB_texture_multisample;
procedure Read_GL_ARB_draw_buffers_blend;
procedure Read_GL_ARB_sample_shading;
procedure Read_GL_ARB_shading_language_include;
procedure Read_GL_ARB_blend_func_extended;
procedure Read_GL_ARB_sampler_objects;
procedure Read_GL_ARB_timer_query;
procedure Read_GL_ARB_vertex_type_2_10_10_10_rev;
procedure Read_GL_ARB_draw_indirect;
procedure Read_GL_ARB_gpu_shader_fp64;
procedure Read_GL_ARB_shader_subroutine;
procedure Read_GL_ARB_tessellation_shader;
procedure Read_GL_ARB_transform_feedback2;
procedure Read_GL_ARB_transform_feedback3;
procedure Read_GL_ARB_ES2_compatibility;
procedure Read_GL_ARB_get_program_binary;
procedure Read_GL_ARB_separate_shader_objects;
procedure Read_GL_ARB_vertex_attrib_64bit;
procedure Read_GL_ARB_viewport_array;
procedure Read_GL_ARB_cl_event;
procedure Read_GL_ARB_debug_output;
procedure Read_GL_ARB_robustness;
procedure Read_GL_ATI_draw_buffers;
procedure Read_GL_ATI_element_array;
procedure Read_GL_ATI_envmap_bumpmap;
procedure Read_GL_ATI_fragment_shader;
procedure Read_GL_ATI_map_object_buffer;
procedure Read_GL_ATI_pn_triangles;
procedure Read_GL_ATI_separate_stencil;
procedure Read_GL_ATI_vertex_array_object;
procedure Read_GL_ATI_vertex_attrib_array_object;
procedure Read_GL_ATI_vertex_streams;
procedure Read_GL_AMD_performance_monitor;
procedure Read_GL_AMD_vertex_shader_tesselator;
procedure Read_GL_AMD_draw_buffers_blend;
procedure Read_GL_AMD_name_gen_delete;
procedure Read_GL_AMD_debug_output;
procedure Read_GL_EXT_blend_color;
procedure Read_GL_EXT_blend_func_separate;
procedure Read_GL_EXT_blend_minmax;
procedure Read_GL_EXT_color_subtable;
procedure Read_GL_EXT_compiled_vertex_array;
procedure Read_GL_EXT_convolution;
procedure Read_GL_EXT_coordinate_frame;
procedure Read_GL_EXT_copy_texture;
procedure Read_GL_EXT_cull_vertex;
procedure Read_GL_EXT_draw_range_elements;
procedure Read_GL_EXT_fog_coord;
procedure Read_GL_EXT_framebuffer_object;
procedure Read_GL_EXT_histogram;
procedure Read_GL_EXT_index_func;
procedure Read_GL_EXT_index_material;
procedure Read_GL_EXT_multi_draw_arrays;
procedure Read_GL_EXT_multisample;
procedure Read_GL_EXT_paletted_texture;
procedure Read_GL_EXT_pixel_transform;
procedure Read_GL_EXT_point_parameters;
procedure Read_GL_EXT_polygon_offset;
procedure Read_GL_EXT_secondary_color;
procedure Read_GL_EXT_stencil_two_side;
procedure Read_GL_EXT_subtexture;
procedure Read_GL_EXT_texture3D;
procedure Read_GL_EXT_texture_object;
procedure Read_GL_EXT_texture_perturb_normal;
procedure Read_GL_EXT_vertex_array;
procedure Read_GL_EXT_vertex_shader;
procedure Read_GL_EXT_vertex_weighting;
procedure Read_GL_EXT_depth_bounds_test;
procedure Read_GL_EXT_blend_equation_separate;
procedure Read_GL_EXT_stencil_clear_tag;
procedure Read_GL_EXT_framebuffer_blit;
procedure Read_GL_EXT_framebuffer_multisample;
procedure Read_GL_EXT_timer_query;
procedure Read_GL_EXT_gpu_program_parameters;
procedure Read_GL_EXT_bindable_uniform;
procedure Read_GL_EXT_draw_buffers2;
procedure Read_GL_EXT_draw_instanced;
procedure Read_GL_EXT_geometry_shader4;
procedure Read_GL_EXT_gpu_shader4;
procedure Read_GL_EXT_texture_array;
procedure Read_GL_EXT_texture_buffer_object;
procedure Read_GL_EXT_texture_integer;
procedure Read_GL_EXT_transform_feedback;
procedure Read_GL_EXT_direct_state_access;
procedure Read_GL_EXT_separate_shader_objects;
procedure Read_GL_EXT_shader_image_load_store;
procedure Read_GL_EXT_vertex_attrib_64bit;
procedure Read_GL_HP_image_transform;
procedure Read_GL_IBM_multimode_draw_arrays;
procedure Read_GL_IBM_vertex_array_lists;
procedure Read_GL_INGR_blend_func_separate;
procedure Read_GL_INTEL_parallel_arrays;
procedure Read_GL_MESA_resize_buffers;
procedure Read_GL_MESA_window_pos;
procedure Read_GL_NV_evaluators;
procedure Read_GL_NV_fence;
procedure Read_GL_NV_fragment_program;
procedure Read_GL_NV_half_float;
procedure Read_GL_NV_occlusion_query;
procedure Read_GL_NV_pixel_data_range;
procedure Read_GL_NV_point_sprite;
procedure Read_GL_NV_primitive_restart;
procedure Read_GL_NV_register_combiners;
procedure Read_GL_NV_register_combiners2;
procedure Read_GL_NV_vertex_array_range;
procedure Read_GL_NV_vertex_program;
procedure Read_GL_NV_depth_buffer_float;
procedure Read_GL_NV_framebuffer_multisample_coverage;
procedure Read_GL_NV_geometry_program4;
procedure Read_GL_NV_gpu_program4;
procedure Read_GL_NV_parameter_buffer_object;
procedure Read_GL_NV_transform_feedback;
procedure Read_GL_NV_conditional_render;
procedure Read_GL_NV_present_video;
procedure Read_GL_NV_explicit_multisample;
procedure Read_GL_NV_transform_feedback2;
procedure Read_GL_NV_video_capture;
procedure Read_GL_NV_copy_image;
procedure Read_GL_NV_shader_buffer_load;
procedure Read_GL_NV_vertex_buffer_unified_memory;
procedure Read_GL_NV_gpu_program5;
procedure Read_GL_NV_gpu_shader5;
procedure Read_GL_NV_vertex_attrib_integer_64bit;
procedure Read_GL_NV_vdpau_interop;
procedure Read_GL_NV_texture_barrier;
procedure Read_GL_PGI_misc_hints;
procedure Read_GL_SGIS_detail_texture;
procedure Read_GL_SGIS_fog_function;
procedure Read_GL_SGIS_multisample;
procedure Read_GL_SGIS_pixel_texture;
procedure Read_GL_SGIS_point_parameters;
procedure Read_GL_SGIS_sharpen_texture;
procedure Read_GL_SGIS_texture4D;
procedure Read_GL_SGIS_texture_color_mask;
procedure Read_GL_SGIS_texture_filter4;
procedure Read_GL_SGIX_async;
procedure Read_GL_SGIX_flush_raster;
procedure Read_GL_SGIX_fragment_lighting;
procedure Read_GL_SGIX_framezoom;
procedure Read_GL_SGIX_igloo_interface;
procedure Read_GL_SGIX_instruments;
procedure Read_GL_SGIX_list_priority;
procedure Read_GL_SGIX_pixel_texture;
procedure Read_GL_SGIX_polynomial_ffd;
procedure Read_GL_SGIX_reference_plane;
procedure Read_GL_SGIX_sprite;
procedure Read_GL_SGIX_tag_sample_buffer;
procedure Read_GL_SGI_color_table;
procedure Read_GL_SUNX_constant_data;
procedure Read_GL_SUN_global_alpha;
procedure Read_GL_SUN_mesh_array;
procedure Read_GL_SUN_triangle_list;
procedure Read_GL_SUN_vertex;

{$IFDEF DGL_WIN}
procedure Read_WGL_ARB_buffer_region;
procedure Read_WGL_ARB_extensions_string;
procedure Read_WGL_ARB_make_current_read;
procedure Read_WGL_ARB_pbuffer;
procedure Read_WGL_ARB_pixel_format;
procedure Read_WGL_ARB_pixel_format_float;
procedure Read_WGL_ARB_render_texture;
procedure Read_WGL_ARB_create_context;
procedure Read_WGL_AMD_gpu_association;
procedure Read_WGL_EXT_display_color_table;
procedure Read_WGL_EXT_extensions_string;
procedure Read_WGL_EXT_make_current_read;
procedure Read_WGL_EXT_pbuffer;
procedure Read_WGL_EXT_pixel_format;
procedure Read_WGL_EXT_swap_control;
procedure Read_WGL_I3D_digital_video_control;
procedure Read_WGL_I3D_gamma;
procedure Read_WGL_I3D_genlock;
procedure Read_WGL_I3D_image_buffer;
procedure Read_WGL_I3D_swap_frame_lock;
procedure Read_WGL_I3D_swap_frame_usage;
procedure Read_WGL_NV_vertex_array_range;
procedure Read_WGL_NV_present_video;
procedure Read_WGL_NV_video_output;
procedure Read_WGL_NV_swap_group;
procedure Read_WGL_NV_gpu_affinity;
procedure Read_WGL_NV_video_capture;
procedure Read_WGL_NV_copy_image;
procedure Read_WGL_OML_sync_control;
procedure Read_WGL_3DL_stereo_control;

procedure Read_WIN_draw_range_elements;
procedure Read_WIN_swap_hint;
{$ENDIF}


implementation


{$IFDEF DGL_LINUX}
const
  RTLD_LAZY = $001;
  RTLD_NOW = $002;
  RTLD_BINDING_MASK = $003;

  // Seems to work on Debian / Fedora
  LibraryLib = {$IFDEF Linux} 'libdl.so.2'{$ELSE} 'c'{$ENDIF};

function dlopen(Name: PAnsiChar; Flags: LongInt): Pointer; cdecl; external LibraryLib name 'dlopen';
function dlclose(Lib: Pointer): LongInt; cdecl; external LibraryLib name 'dlclose';

function dlsym(Lib: Pointer; Name: PAnsiChar): Pointer; cdecl; external LibraryLib name 'dlsym';
{$ENDIF}


function dglLoadLibrary(Name: PChar): Pointer;
begin
  {$IFDEF DGL_WIN}
  Result := Pointer(LoadLibrary(Name));
  {$ENDIF}

  {$IFDEF DGL_LINUX}
  Result := dlopen(Name, RTLD_LAZY);
  {$ENDIF}
end;


function dglFreeLibrary(LibHandle: Pointer): Boolean;
begin
  if LibHandle = nil then
    Result := False
  else
    {$IFDEF DGL_WIN}
    Result := FreeLibrary(HMODULE(LibHandle));
    {$ENDIF}

    {$IFDEF DGL_LINUX}
    Result := dlclose(LibHandle) = 0;
    {$ENDIF}
end;


function dglGetProcAddress(ProcName: PAnsiChar; LibHandle: Pointer = nil {$IFDEF DGL_LINUX}; ForceDLSym: Boolean{$ENDIF}): Pointer;
begin
  if LibHandle = nil then
    LibHandle := GL_LibHandle;

  Result :=  nil;
   
  {$IFDEF DGL_WIN}
    Result := GetProcAddress(HMODULE(LibHandle), ProcName);

    if result <> nil then
      exit;

    if Addr(wglGetProcAddress) <> nil then
      Result := wglGetProcAddress(ProcName);
  {$ENDIF}

  {$IFDEF DGL_LINUX}
    if not ForceDLSym then begin
      if Addr(glXGetProcAddress) <> nil then
        Result := glXGetProcAddress(ProcName);

      if result <> nil then
        exit;

      if Addr(glXGetProcAddressARB) <> nil then
        Result := glXGetProcAddressARB(ProcName);

      if result <> nil then
        exit;
    end;

    Result := dlsym(LibHandle, ProcName);
  {$ENDIF}
end;


function Int_GetExtensionString: AnsiString;
begin
  // generel extension string
  if not Assigned(@glGetString) then
    glGetString := dglGetProcAddress('glGetString');

  if Assigned(@glGetString) then
    Result := glGetString(GL_EXTENSIONS)
  else
    Result := '';

  if (GL_LibHandle <> nil) then begin
    {$IFDEF DGL_WIN}
      // wglGetExtensionsStringEXT
      if not Assigned(@wglGetExtensionsStringEXT) then
        wglGetExtensionsStringEXT := dglGetProcAddress('wglGetExtensionsStringEXT');

      if Assigned(@wglGetExtensionsStringEXT) then
        Result := Result + #32 + wglGetExtensionsStringEXT;

      // wglGetExtensionsStringARB
      if not Assigned(@wglGetExtensionsStringARB) then
        wglGetExtensionsStringARB := dglGetProcAddress('wglGetExtensionsStringARB');

      if Assigned(@wglGetExtensionsStringARB) then
        Result := Result + #32 + wglGetExtensionsStringARB(wglGetCurrentDC);
    {$ENDIF}
  end;

  Result := #32 + Result + #32;
end;


function Int_CheckExtension(AllExtensions, CheckExtension: AnsiString): Boolean;
begin
  Result := Pos(#32 + CheckExtension + #32, AllExtensions) > 0;
end;


function dglCheckExtension(Extension: AnsiString): Boolean;
var
  Extensions: AnsiString;
begin
  Extensions := Int_GetExtensionString;
  Result := Int_CheckExtension(Extensions, Extension);
end;



function InitOpenGL(LibName: String; GLULibName: String): Boolean;
begin
  Result := False;

  // free opened libraries
  if GL_LibHandle <> nil then
    dglFreeLibrary(GL_LibHandle);

  if GLU_LibHandle <> nil then
    dglFreeLibrary(GLU_LibHandle);

  // load library
  GL_LibHandle := dglLoadLibrary(PChar(LibName));
  GLU_LibHandle := dglLoadLibrary(PChar(GLULibName));

  // load GL functions
  if (GL_LibHandle <> nil) then begin
    {$IFDEF DGL_WIN}
      wglCopyContext := dglGetProcAddress('wglCopyContext');
      wglCreateLayerContext := dglGetProcAddress('wglCreateLayerContext');
      wglCreateContext := dglGetProcAddress('wglCreateContext');
      wglDeleteContext := dglGetProcAddress('wglDeleteContext');
      wglDescribeLayerPlane := dglGetProcAddress('wglDescribeLayerPlane');
      wglGetCurrentContext := dglGetProcAddress('wglGetCurrentContext');
      wglGetCurrentDC := dglGetProcAddress('wglGetCurrentDC');
      wglGetLayerPaletteEntries := dglGetProcAddress('wglGetLayerPaletteEntries');
      wglGetProcAddress := dglGetProcAddress('wglGetProcAddress');
      wglMakeCurrent := dglGetProcAddress('wglMakeCurrent');
      wglRealizeLayerPalette := dglGetProcAddress('wglRealizeLayerPalette');
      wglSetLayerPaletteEntries := dglGetProcAddress('wglSetLayerPaletteEntries');
      wglShareLists := dglGetProcAddress('wglShareLists');
      wglSwapLayerBuffers := dglGetProcAddress('wglSwapLayerBuffers');
      wglSwapMultipleBuffers := dglGetProcAddress('wglSwapMultipleBuffers');
      wglUseFontBitmapsA := dglGetProcAddress('wglUseFontBitmapsA');
      wglUseFontOutlinesA := dglGetProcAddress('wglUseFontOutlinesA');
      wglUseFontBitmapsW := dglGetProcAddress('wglUseFontBitmapsW');
      wglUseFontOutlinesW := dglGetProcAddress('wglUseFontOutlinesW');
      wglUseFontBitmaps := dglGetProcAddress('wglUseFontBitmapsA');
      wglUseFontOutlines := dglGetProcAddress('wglUseFontOutlinesA');
    {$ENDIF}

    {$IFDEF DGL_LINUX}
      // GLX_VERSION_1_4 (needs to be first)
      glXGetProcAddress := dglGetProcAddress('glXGetProcAddress', nil, True);

      // GLX_ARB_get_proc_address  (also needs to be first)
      glXGetProcAddressARB := dglGetProcAddress('glXGetProcAddressARB', nil, True);

      glXChooseVisual := dglGetProcAddress('glXChooseVisual');
      glXCopyContext := dglGetProcAddress('glXCopyContext');
      glXCreateContext := dglGetProcAddress('glXCreateContext');
      glXCreateGLXPixmap := dglGetProcAddress('glXCreateGLXPixmap');
      glXDestroyContext := dglGetProcAddress('glXDestroyContext');
      glXDestroyGLXPixmap := dglGetProcAddress('glXDestroyGLXPixmap');
      glXGetConfig := dglGetProcAddress('glXGetConfig');
      glXGetCurrentContext := dglGetProcAddress('glXGetCurrentContext');
      glXGetCurrentDrawable := dglGetProcAddress('glXGetCurrentDrawable');
      glXIsDirect := dglGetProcAddress('glXIsDirect');
      glXMakeCurrent := dglGetProcAddress('glXMakeCurrent');
      glXQueryExtension := dglGetProcAddress('glXQueryExtension');
      glXQueryVersion := dglGetProcAddress('glXQueryVersion');
      glXSwapBuffers := dglGetProcAddress('glXSwapBuffers');
      glXUseXFont := dglGetProcAddress('glXUseXFont');
      glXWaitGL := dglGetProcAddress('glXWaitGL');
      glXWaitX := dglGetProcAddress('glXWaitX');

      glXGetClientString := dglGetProcAddress('glXGetClientString');
      glXQueryServerString := dglGetProcAddress('glXQueryServerString');
      glXQueryExtensionsString := dglGetProcAddress('glXQueryExtensionsString');

      // GLX_VERSION_1_3
      glXGetFBConfigs := dglGetProcAddress('glXGetFBConfigs');
      glXChooseFBConfig := dglGetProcAddress('glXChooseFBConfig');
      glXGetFBConfigAttrib := dglGetProcAddress('glXGetFBConfigAttrib');
      glXGetVisualFromFBConfig := dglGetProcAddress('glXGetVisualFromFBConfig');
      glXCreateWindow := dglGetProcAddress('glXCreateWindow');
      glXDestroyWindow := dglGetProcAddress('glXDestroyWindow');
      glXCreatePixmap := dglGetProcAddress('glXCreatePixmap');

      glXDestroyPixmap := dglGetProcAddress('glXDestroyPixmap');
      glXCreatePbuffer := dglGetProcAddress('glXCreatePbuffer');
      glXDestroyPbuffer := dglGetProcAddress('glXDestroyPbuffer');
      glXQueryDrawable := dglGetProcAddress('glXQueryDrawable');
      glXCreateNewContext := dglGetProcAddress('glXCreateNewContext');
      glXMakeContextCurrent := dglGetProcAddress('glXMakeContextCurrent');
      glXGetCurrentReadDrawable := dglGetProcAddress('glXGetCurrentReadDrawable');
      glXGetCurreentDisplay := dglGetProcAddress('glXGetCurreentDisplay');

      glXQueryContext := dglGetProcAddress('glXQueryContext');
      glXSelectEvent := dglGetProcAddress('glXSelectEvent');
      glXGetSelectedEvent := dglGetProcAddress('glXGetSelectedEvent');

      // GLX_ARB_create_context
      glXCreateContextAttribsARB := dglGetProcAddress('glXCreateContextAttribsARB');

      // GLX_EXT_import_context
      glXGetCurrentDisplayEXT := dglGetProcAddress('glXGetCurrentDisplayEXT');
      glXQueryContextInfoEXT := dglGetProcAddress('glXQueryContextInfoEXT');
      glXGetContextIDEXT := dglGetProcAddress('glXGetContextIDEXT');
      glXImportContextEXT := dglGetProcAddress('glXImportContextEXT');
      glXFreeContextEXT := dglGetProcAddress('glXFreeContextEXT');
      
      // GLX_EXT_texture_from_pixmap
      glXBindTexImageEXT := dglGetProcAddress('glXBindTexImageEXT');
      glXReleaseTexImageEXT := dglGetProcAddress('glXReleaseTexImageEXT');
    {$ENDIF}

    Result := True;
  end;

  // load GLU functions
  if GLU_LibHandle <> nil then begin
    // GLU ========================================================================
    gluBeginCurve := dglGetProcAddress('gluBeginCurve', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluBeginPolygon := dglGetProcAddress('gluBeginPolygon', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluBeginSurface := dglGetProcAddress('gluBeginSurface', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluBeginTrim := dglGetProcAddress('gluBeginTrim', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluBuild1DMipmaps := dglGetProcAddress('gluBuild1DMipmaps', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluBuild2DMipmaps := dglGetProcAddress('gluBuild2DMipmaps', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluCylinder := dglGetProcAddress('gluCylinder', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluDeleteNurbsRenderer := dglGetProcAddress('gluDeleteNurbsRenderer', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluDeleteQuadric := dglGetProcAddress('gluDeleteQuadric', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluDeleteTess := dglGetProcAddress('gluDeleteTess', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluDisk := dglGetProcAddress('gluDisk', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluEndCurve := dglGetProcAddress('gluEndCurve', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluEndPolygon := dglGetProcAddress('gluEndPolygon', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluEndSurface := dglGetProcAddress('gluEndSurface', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluEndTrim := dglGetProcAddress('gluEndTrim', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluErrorString := dglGetProcAddress('gluErrorString', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluGetNurbsProperty := dglGetProcAddress('gluGetNurbsProperty', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluGetString := dglGetProcAddress('gluGetString', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluGetTessProperty := dglGetProcAddress('gluGetTessProperty', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluLoadSamplingMatrices := dglGetProcAddress('gluLoadSamplingMatrices', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluLookAt := dglGetProcAddress('gluLookAt', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluNewNurbsRenderer := dglGetProcAddress('gluNewNurbsRenderer', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluNewQuadric := dglGetProcAddress('gluNewQuadric', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluNewTess := dglGetProcAddress('gluNewTess', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluNextContour := dglGetProcAddress('gluNextContour', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluNurbsCallback := dglGetProcAddress('gluNurbsCallback', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluNurbsCurve := dglGetProcAddress('gluNurbsCurve', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluNurbsProperty := dglGetProcAddress('gluNurbsProperty', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluNurbsSurface := dglGetProcAddress('gluNurbsSurface', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluOrtho2D := dglGetProcAddress('gluOrtho2D', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluPartialDisk := dglGetProcAddress('gluPartialDisk', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluPerspective := dglGetProcAddress('gluPerspective', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluPickMatrix := dglGetProcAddress('gluPickMatrix', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluProject := dglGetProcAddress('gluProject', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluPwlCurve := dglGetProcAddress('gluPwlCurve', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluQuadricCallback := dglGetProcAddress('gluQuadricCallback', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluQuadricDrawStyle := dglGetProcAddress('gluQuadricDrawStyle', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluQuadricNormals := dglGetProcAddress('gluQuadricNormals', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluQuadricOrientation := dglGetProcAddress('gluQuadricOrientation', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluQuadricTexture := dglGetProcAddress('gluQuadricTexture', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluScaleImage := dglGetProcAddress('gluScaleImage', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluSphere := dglGetProcAddress('gluSphere', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluTessBeginContour := dglGetProcAddress('gluTessBeginContour', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluTessBeginPolygon := dglGetProcAddress('gluTessBeginPolygon', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluTessCallback := dglGetProcAddress('gluTessCallback', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluTessEndContour := dglGetProcAddress('gluTessEndContour', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluTessEndPolygon := dglGetProcAddress('gluTessEndPolygon', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluTessNormal := dglGetProcAddress('gluTessNormal', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluTessProperty := dglGetProcAddress('gluTessProperty', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluTessVertex := dglGetProcAddress('gluTessVertex', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
    gluUnProject := dglGetProcAddress('gluUnProject', GLU_LibHandle {$IFDEF DGL_LINUX}, True{$ENDIF});
  end;
end;

procedure ReadOpenGLCore;
begin
  // GL_VERSION_1_0
  glCullFace := dglGetProcAddress('glCullFace');
  glFrontFace := dglGetProcAddress('glFrontFace');
  glHint := dglGetProcAddress('glHint');
  glLineWidth := dglGetProcAddress('glLineWidth');
  glPointSize := dglGetProcAddress('glPointSize');
  glPolygonMode := dglGetProcAddress('glPolygonMode');
  glScissor := dglGetProcAddress('glScissor');
  glTexParameterf := dglGetProcAddress('glTexParameterf');
  glTexParameterfv := dglGetProcAddress('glTexParameterfv');
  glTexParameteri := dglGetProcAddress('glTexParameteri');
  glTexParameteriv := dglGetProcAddress('glTexParameteriv');
  glTexImage1D := dglGetProcAddress('glTexImage1D');
  glTexImage2D := dglGetProcAddress('glTexImage2D');
  glDrawBuffer := dglGetProcAddress('glDrawBuffer');
  glClear := dglGetProcAddress('glClear');
  glClearColor := dglGetProcAddress('glClearColor');
  glClearStencil := dglGetProcAddress('glClearStencil');
  glClearDepth := dglGetProcAddress('glClearDepth');
  glStencilMask := dglGetProcAddress('glStencilMask');
  glColorMask := dglGetProcAddress('glColorMask');
  glDepthMask := dglGetProcAddress('glDepthMask');
  glDisable := dglGetProcAddress('glDisable');
  glEnable := dglGetProcAddress('glEnable');
  glFinish := dglGetProcAddress('glFinish');
  glFlush := dglGetProcAddress('glFlush');
  glBlendFunc := dglGetProcAddress('glBlendFunc');
  glLogicOp := dglGetProcAddress('glLogicOp');
  glStencilFunc := dglGetProcAddress('glStencilFunc');
  glStencilOp := dglGetProcAddress('glStencilOp');
  glDepthFunc := dglGetProcAddress('glDepthFunc');
  glPixelStoref := dglGetProcAddress('glPixelStoref');
  glPixelStorei := dglGetProcAddress('glPixelStorei');
  glReadBuffer := dglGetProcAddress('glReadBuffer');
  glReadPixels := dglGetProcAddress('glReadPixels');
  glGetBooleanv := dglGetProcAddress('glGetBooleanv');
  glGetDoublev := dglGetProcAddress('glGetDoublev');
  glGetError := dglGetProcAddress('glGetError');
  glGetFloatv := dglGetProcAddress('glGetFloatv');
  glGetIntegerv := dglGetProcAddress('glGetIntegerv');
  glGetString := dglGetProcAddress('glGetString');
  glGetTexImage := dglGetProcAddress('glGetTexImage');
  glGetTexParameteriv := dglGetProcAddress('glGetTexParameteriv');
  glGetTexParameterfv := dglGetProcAddress('glGetTexParameterfv');
  glGetTexLevelParameterfv := dglGetProcAddress('glGetTexLevelParameterfv');
  glGetTexLevelParameteriv := dglGetProcAddress('glGetTexLevelParameteriv');
  glIsEnabled := dglGetProcAddress('glIsEnabled');
  glDepthRange := dglGetProcAddress('glDepthRange');
  glViewport := dglGetProcAddress('glViewport');

  // GL_VERSION_1_1
  glDrawArrays := dglGetProcAddress('glDrawArrays');
  glDrawElements := dglGetProcAddress('glDrawElements');
  glGetPointerv := dglGetProcAddress('glGetPointerv');
  glPolygonOffset := dglGetProcAddress('glPolygonOffset');
  glCopyTexImage1D := dglGetProcAddress('glCopyTexImage1D');
  glCopyTexImage2D := dglGetProcAddress('glCopyTexImage2D');
  glCopyTexSubImage1D := dglGetProcAddress('glCopyTexSubImage1D');
  glCopyTexSubImage2D := dglGetProcAddress('glCopyTexSubImage2D');
  glTexSubImage1D := dglGetProcAddress('glTexSubImage1D');
  glTexSubImage2D := dglGetProcAddress('glTexSubImage2D');
  glBindTexture := dglGetProcAddress('glBindTexture');
  glDeleteTextures := dglGetProcAddress('glDeleteTextures');
  glGenTextures := dglGetProcAddress('glGenTextures');

{$ifdef DGL_DEPRECATED}
  glAccum := dglGetProcAddress('glAccum');
  glAlphaFunc := dglGetProcAddress('glAlphaFunc');
  glAreTexturesResident := dglGetProcAddress('glAreTexturesResident');
  glArrayElement := dglGetProcAddress('glArrayElement');
  glBegin := dglGetProcAddress('glBegin');
  glBitmap := dglGetProcAddress('glBitmap');
  glCallList := dglGetProcAddress('glCallList');
  glCallLists := dglGetProcAddress('glCallLists');
  glClearAccum := dglGetProcAddress('glClearAccum');
  glClearIndex := dglGetProcAddress('glClearIndex');
  glClipPlane := dglGetProcAddress('glClipPlane');
  glColor3b := dglGetProcAddress('glColor3b');
  glColor3bv := dglGetProcAddress('glColor3bv');
  glColor3d := dglGetProcAddress('glColor3d');
  glColor3dv := dglGetProcAddress('glColor3dv');
  glColor3f := dglGetProcAddress('glColor3f');
  glColor3fv := dglGetProcAddress('glColor3fv');
  glColor3i := dglGetProcAddress('glColor3i');
  glColor3iv := dglGetProcAddress('glColor3iv');
  glColor3s := dglGetProcAddress('glColor3s');
  glColor3sv := dglGetProcAddress('glColor3sv');
  glColor3ub := dglGetProcAddress('glColor3ub');
  glColor3ubv := dglGetProcAddress('glColor3ubv');
  glColor3ui := dglGetProcAddress('glColor3ui');
  glColor3uiv := dglGetProcAddress('glColor3uiv');
  glColor3us := dglGetProcAddress('glColor3us');
  glColor3usv := dglGetProcAddress('glColor3usv');
  glColor4b := dglGetProcAddress('glColor4b');
  glColor4bv := dglGetProcAddress('glColor4bv');
  glColor4d := dglGetProcAddress('glColor4d');
  glColor4dv := dglGetProcAddress('glColor4dv');
  glColor4f := dglGetProcAddress('glColor4f');
  glColor4fv := dglGetProcAddress('glColor4fv');
  glColor4i := dglGetProcAddress('glColor4i');
  glColor4iv := dglGetProcAddress('glColor4iv');
  glColor4s := dglGetProcAddress('glColor4s');
  glColor4sv := dglGetProcAddress('glColor4sv');
  glColor4ub := dglGetProcAddress('glColor4ub');
  glColor4ubv := dglGetProcAddress('glColor4ubv');
  glColor4ui := dglGetProcAddress('glColor4ui');
  glColor4uiv := dglGetProcAddress('glColor4uiv');
  glColor4us := dglGetProcAddress('glColor4us');
  glColor4usv := dglGetProcAddress('glColor4usv');
  glColorMaterial := dglGetProcAddress('glColorMaterial');
  glColorPointer := dglGetProcAddress('glColorPointer');
  glCopyPixels := dglGetProcAddress('glCopyPixels');
  glDeleteLists := dglGetProcAddress('glDeleteLists');
  glDisableClientState := dglGetProcAddress('glDisableClientState');
  glDrawPixels := dglGetProcAddress('glDrawPixels');
  glEdgeFlag := dglGetProcAddress('glEdgeFlag');
  glEdgeFlagPointer := dglGetProcAddress('glEdgeFlagPointer');
  glEdgeFlagv := dglGetProcAddress('glEdgeFlagv');
  glEnableClientState := dglGetProcAddress('glEnableClientState');
  glEnd := dglGetProcAddress('glEnd');
  glEndList := dglGetProcAddress('glEndList');
  glEvalCoord1d := dglGetProcAddress('glEvalCoord1d');
  glEvalCoord1dv := dglGetProcAddress('glEvalCoord1dv');
  glEvalCoord1f := dglGetProcAddress('glEvalCoord1f');
  glEvalCoord1fv := dglGetProcAddress('glEvalCoord1fv');
  glEvalCoord2d := dglGetProcAddress('glEvalCoord2d');
  glEvalCoord2dv := dglGetProcAddress('glEvalCoord2dv');
  glEvalCoord2f := dglGetProcAddress('glEvalCoord2f');
  glEvalCoord2fv := dglGetProcAddress('glEvalCoord2fv');
  glEvalMesh1 := dglGetProcAddress('glEvalMesh1');
  glEvalMesh2 := dglGetProcAddress('glEvalMesh2');
  glEvalPoint1 := dglGetProcAddress('glEvalPoint1');
  glEvalPoint2 := dglGetProcAddress('glEvalPoint2');
  glFeedbackBuffer := dglGetProcAddress('glFeedbackBuffer');
  glFogf := dglGetProcAddress('glFogf');
  glFogfv := dglGetProcAddress('glFogfv');
  glFogi := dglGetProcAddress('glFogi');
  glFogiv := dglGetProcAddress('glFogiv');
  glFrustum := dglGetProcAddress('glFrustum');
  glGenLists := dglGetProcAddress('glGenLists');
  glGetClipPlane := dglGetProcAddress('glGetClipPlane');
  glGetLightfv := dglGetProcAddress('glGetLightfv');
  glGetLightiv := dglGetProcAddress('glGetLightiv');
  glGetMapdv := dglGetProcAddress('glGetMapdv');
  glGetMapfv := dglGetProcAddress('glGetMapfv');
  glGetMapiv := dglGetProcAddress('glGetMapiv');
  glGetMaterialfv := dglGetProcAddress('glGetMaterialfv');
  glGetMaterialiv := dglGetProcAddress('glGetMaterialiv');
  glGetPixelMapfv := dglGetProcAddress('glGetPixelMapfv');
  glGetPixelMapuiv := dglGetProcAddress('glGetPixelMapuiv');
  glGetPixelMapusv := dglGetProcAddress('glGetPixelMapusv');
  glGetPolygonStipple := dglGetProcAddress('glGetPolygonStipple');
  glGetTexEnvfv := dglGetProcAddress('glGetTexEnvfv');
  glGetTexEnviv := dglGetProcAddress('glGetTexEnviv');
  glGetTexGendv := dglGetProcAddress('glGetTexGendv');
  glGetTexGenfv := dglGetProcAddress('glGetTexGenfv');
  glGetTexGeniv := dglGetProcAddress('glGetTexGeniv');
  glIndexMask := dglGetProcAddress('glIndexMask');
  glIndexPointer := dglGetProcAddress('glIndexPointer');
  glIndexd := dglGetProcAddress('glIndexd');
  glIndexdv := dglGetProcAddress('glIndexdv');
  glIndexf := dglGetProcAddress('glIndexf');
  glIndexfv := dglGetProcAddress('glIndexfv');
  glIndexi := dglGetProcAddress('glIndexi');
  glIndexiv := dglGetProcAddress('glIndexiv');
  glIndexs := dglGetProcAddress('glIndexs');
  glIndexsv := dglGetProcAddress('glIndexsv');
  glIndexub := dglGetProcAddress('glIndexub');
  glIndexubv := dglGetProcAddress('glIndexubv');
  glInitNames := dglGetProcAddress('glInitNames');
  glInterleavedArrays := dglGetProcAddress('glInterleavedArrays');
  glIsList := dglGetProcAddress('glIsList');
  glIsTexture := dglGetProcAddress('glIsTexture');
  glLightModelf := dglGetProcAddress('glLightModelf');
  glLightModelfv := dglGetProcAddress('glLightModelfv');
  glLightModeli := dglGetProcAddress('glLightModeli');
  glLightModeliv := dglGetProcAddress('glLightModeliv');
  glLightf := dglGetProcAddress('glLightf');
  glLightfv := dglGetProcAddress('glLightfv');
  glLighti := dglGetProcAddress('glLighti');
  glLightiv := dglGetProcAddress('glLightiv');
  glLineStipple := dglGetProcAddress('glLineStipple');
  glListBase := dglGetProcAddress('glListBase');
  glLoadIdentity := dglGetProcAddress('glLoadIdentity');
  glLoadMatrixd := dglGetProcAddress('glLoadMatrixd');
  glLoadMatrixf := dglGetProcAddress('glLoadMatrixf');
  glLoadName := dglGetProcAddress('glLoadName');
  glMap1d := dglGetProcAddress('glMap1d');
  glMap1f := dglGetProcAddress('glMap1f');
  glMap2d := dglGetProcAddress('glMap2d');
  glMap2f := dglGetProcAddress('glMap2f');
  glMapGrid1d := dglGetProcAddress('glMapGrid1d');
  glMapGrid1f := dglGetProcAddress('glMapGrid1f');
  glMapGrid2d := dglGetProcAddress('glMapGrid2d');
  glMapGrid2f := dglGetProcAddress('glMapGrid2f');
  glMaterialf := dglGetProcAddress('glMaterialf');
  glMaterialfv := dglGetProcAddress('glMaterialfv');
  glMateriali := dglGetProcAddress('glMateriali');
  glMaterialiv := dglGetProcAddress('glMaterialiv');
  glMatrixMode := dglGetProcAddress('glMatrixMode');
  glMultMatrixd := dglGetProcAddress('glMultMatrixd');
  glMultMatrixf := dglGetProcAddress('glMultMatrixf');
  glNewList := dglGetProcAddress('glNewList');
  glNormal3b := dglGetProcAddress('glNormal3b');
  glNormal3bv := dglGetProcAddress('glNormal3bv');
  glNormal3d := dglGetProcAddress('glNormal3d');
  glNormal3dv := dglGetProcAddress('glNormal3dv');
  glNormal3f := dglGetProcAddress('glNormal3f');
  glNormal3fv := dglGetProcAddress('glNormal3fv');
  glNormal3i := dglGetProcAddress('glNormal3i');
  glNormal3iv := dglGetProcAddress('glNormal3iv');
  glNormal3s := dglGetProcAddress('glNormal3s');
  glNormal3sv := dglGetProcAddress('glNormal3sv');
  glNormalPointer := dglGetProcAddress('glNormalPointer');
  glOrtho := dglGetProcAddress('glOrtho');
  glPassThrough := dglGetProcAddress('glPassThrough');
  glPixelMapfv := dglGetProcAddress('glPixelMapfv');
  glPixelMapuiv := dglGetProcAddress('glPixelMapuiv');
  glPixelMapusv := dglGetProcAddress('glPixelMapusv');
  glPixelTransferf := dglGetProcAddress('glPixelTransferf');
  glPixelTransferi := dglGetProcAddress('glPixelTransferi');
  glPixelZoom := dglGetProcAddress('glPixelZoom');
  glPolygonStipple := dglGetProcAddress('glPolygonStipple');
  glPopAttrib := dglGetProcAddress('glPopAttrib');
  glPopClientAttrib := dglGetProcAddress('glPopClientAttrib');
  glPopMatrix := dglGetProcAddress('glPopMatrix');
  glPopName := dglGetProcAddress('glPopName');
  glPrioritizeTextures := dglGetProcAddress('glPrioritizeTextures');
  glPushAttrib := dglGetProcAddress('glPushAttrib');
  glPushClientAttrib := dglGetProcAddress('glPushClientAttrib');
  glPushMatrix := dglGetProcAddress('glPushMatrix');
  glPushName := dglGetProcAddress('glPushName');
  glRasterPos2d := dglGetProcAddress('glRasterPos2d');
  glRasterPos2dv := dglGetProcAddress('glRasterPos2dv');
  glRasterPos2f := dglGetProcAddress('glRasterPos2f');
  glRasterPos2fv := dglGetProcAddress('glRasterPos2fv');
  glRasterPos2i := dglGetProcAddress('glRasterPos2i');
  glRasterPos2iv := dglGetProcAddress('glRasterPos2iv');
  glRasterPos2s := dglGetProcAddress('glRasterPos2s');
  glRasterPos2sv := dglGetProcAddress('glRasterPos2sv');
  glRasterPos3d := dglGetProcAddress('glRasterPos3d');
  glRasterPos3dv := dglGetProcAddress('glRasterPos3dv');
  glRasterPos3f := dglGetProcAddress('glRasterPos3f');
  glRasterPos3fv := dglGetProcAddress('glRasterPos3fv');
  glRasterPos3i := dglGetProcAddress('glRasterPos3i');
  glRasterPos3iv := dglGetProcAddress('glRasterPos3iv');
  glRasterPos3s := dglGetProcAddress('glRasterPos3s');
  glRasterPos3sv := dglGetProcAddress('glRasterPos3sv');
  glRasterPos4d := dglGetProcAddress('glRasterPos4d');
  glRasterPos4dv := dglGetProcAddress('glRasterPos4dv');
  glRasterPos4f := dglGetProcAddress('glRasterPos4f');
  glRasterPos4fv := dglGetProcAddress('glRasterPos4fv');
  glRasterPos4i := dglGetProcAddress('glRasterPos4i');
  glRasterPos4iv := dglGetProcAddress('glRasterPos4iv');
  glRasterPos4s := dglGetProcAddress('glRasterPos4s');
  glRasterPos4sv := dglGetProcAddress('glRasterPos4sv');
  glRectd := dglGetProcAddress('glRectd');
  glRectdv := dglGetProcAddress('glRectdv');
  glRectf := dglGetProcAddress('glRectf');
  glRectfv := dglGetProcAddress('glRectfv');
  glRecti := dglGetProcAddress('glRecti');
  glRectiv := dglGetProcAddress('glRectiv');
  glRects := dglGetProcAddress('glRects');
  glRectsv := dglGetProcAddress('glRectsv');
  glRenderMode := dglGetProcAddress('glRenderMode');
  glRotated := dglGetProcAddress('glRotated');
  glRotatef := dglGetProcAddress('glRotatef');
  glScaled := dglGetProcAddress('glScaled');
  glScalef := dglGetProcAddress('glScalef');
  glSelectBuffer := dglGetProcAddress('glSelectBuffer');
  glShadeModel := dglGetProcAddress('glShadeModel');
  glTexCoord1d := dglGetProcAddress('glTexCoord1d');
  glTexCoord1dv := dglGetProcAddress('glTexCoord1dv');
  glTexCoord1f := dglGetProcAddress('glTexCoord1f');
  glTexCoord1fv := dglGetProcAddress('glTexCoord1fv');
  glTexCoord1i := dglGetProcAddress('glTexCoord1i');
  glTexCoord1iv := dglGetProcAddress('glTexCoord1iv');
  glTexCoord1s := dglGetProcAddress('glTexCoord1s');
  glTexCoord1sv := dglGetProcAddress('glTexCoord1sv');
  glTexCoord2d := dglGetProcAddress('glTexCoord2d');
  glTexCoord2dv := dglGetProcAddress('glTexCoord2dv');
  glTexCoord2f := dglGetProcAddress('glTexCoord2f');
  glTexCoord2fv := dglGetProcAddress('glTexCoord2fv');
  glTexCoord2i := dglGetProcAddress('glTexCoord2i');
  glTexCoord2iv := dglGetProcAddress('glTexCoord2iv');
  glTexCoord2s := dglGetProcAddress('glTexCoord2s');
  glTexCoord2sv := dglGetProcAddress('glTexCoord2sv');
  glTexCoord3d := dglGetProcAddress('glTexCoord3d');
  glTexCoord3dv := dglGetProcAddress('glTexCoord3dv');
  glTexCoord3f := dglGetProcAddress('glTexCoord3f');
  glTexCoord3fv := dglGetProcAddress('glTexCoord3fv');
  glTexCoord3i := dglGetProcAddress('glTexCoord3i');
  glTexCoord3iv := dglGetProcAddress('glTexCoord3iv');
  glTexCoord3s := dglGetProcAddress('glTexCoord3s');
  glTexCoord3sv := dglGetProcAddress('glTexCoord3sv');
  glTexCoord4d := dglGetProcAddress('glTexCoord4d');
  glTexCoord4dv := dglGetProcAddress('glTexCoord4dv');
  glTexCoord4f := dglGetProcAddress('glTexCoord4f');
  glTexCoord4fv := dglGetProcAddress('glTexCoord4fv');
  glTexCoord4i := dglGetProcAddress('glTexCoord4i');
  glTexCoord4iv := dglGetProcAddress('glTexCoord4iv');
  glTexCoord4s := dglGetProcAddress('glTexCoord4s');
  glTexCoord4sv := dglGetProcAddress('glTexCoord4sv');
  glTexCoordPointer := dglGetProcAddress('glTexCoordPointer');
  glTexEnvf := dglGetProcAddress('glTexEnvf');
  glTexEnvfv := dglGetProcAddress('glTexEnvfv');
  glTexEnvi := dglGetProcAddress('glTexEnvi');
  glTexEnviv := dglGetProcAddress('glTexEnviv');
  glTexGend := dglGetProcAddress('glTexGend');
  glTexGendv := dglGetProcAddress('glTexGendv');
  glTexGenf := dglGetProcAddress('glTexGenf');
  glTexGenfv := dglGetProcAddress('glTexGenfv');
  glTexGeni := dglGetProcAddress('glTexGeni');
  glTexGeniv := dglGetProcAddress('glTexGeniv');
  glTranslated := dglGetProcAddress('glTranslated');
  glTranslatef := dglGetProcAddress('glTranslatef');
  glVertex2d := dglGetProcAddress('glVertex2d');
  glVertex2dv := dglGetProcAddress('glVertex2dv');
  glVertex2f := dglGetProcAddress('glVertex2f');
  glVertex2fv := dglGetProcAddress('glVertex2fv');
  glVertex2i := dglGetProcAddress('glVertex2i');
  glVertex2iv := dglGetProcAddress('glVertex2iv');
  glVertex2s := dglGetProcAddress('glVertex2s');
  glVertex2sv := dglGetProcAddress('glVertex2sv');
  glVertex3d := dglGetProcAddress('glVertex3d');
  glVertex3dv := dglGetProcAddress('glVertex3dv');
  glVertex3f := dglGetProcAddress('glVertex3f');
  glVertex3fv := dglGetProcAddress('glVertex3fv');
  glVertex3i := dglGetProcAddress('glVertex3i');
  glVertex3iv := dglGetProcAddress('glVertex3iv');
  glVertex3s := dglGetProcAddress('glVertex3s');
  glVertex3sv := dglGetProcAddress('glVertex3sv');
  glVertex4d := dglGetProcAddress('glVertex4d');
  glVertex4dv := dglGetProcAddress('glVertex4dv');
  glVertex4f := dglGetProcAddress('glVertex4f');
  glVertex4fv := dglGetProcAddress('glVertex4fv');
  glVertex4i := dglGetProcAddress('glVertex4i');
  glVertex4iv := dglGetProcAddress('glVertex4iv');
  glVertex4s := dglGetProcAddress('glVertex4s');
  glVertex4sv := dglGetProcAddress('glVertex4sv');
  glVertexPointer := dglGetProcAddress('glVertexPointer');
{$endif}

  // GL_VERSION_1_2
  glBlendColor := dglGetProcAddress('glBlendColor');
  glBlendEquation := dglGetProcAddress('glBlendEquation');
  glDrawRangeElements := dglGetProcAddress('glDrawRangeElements');
  glTexImage3D := dglGetProcAddress('glTexImage3D');
  glTexSubImage3D := dglGetProcAddress('glTexSubImage3D');
  glCopyTexSubImage3D := dglGetProcAddress('glCopyTexSubImage3D');
{$ifdef DGL_DEPRECATED}
  glColorTable := dglGetProcAddress('glColorTable');
  glColorTableParameterfv := dglGetProcAddress('glColorTableParameterfv');
  glColorTableParameteriv := dglGetProcAddress('glColorTableParameteriv');
  glCopyColorTable := dglGetProcAddress('glCopyColorTable');
  glGetColorTable := dglGetProcAddress('glGetColorTable');
  glGetColorTableParameterfv := dglGetProcAddress('glGetColorTableParameterfv');
  glGetColorTableParameteriv := dglGetProcAddress('glGetColorTableParameteriv');
  glColorSubTable := dglGetProcAddress('glColorSubTable');
  glCopyColorSubTable := dglGetProcAddress('glCopyColorSubTable');
  glConvolutionFilter1D := dglGetProcAddress('glConvolutionFilter1D');
  glConvolutionFilter2D := dglGetProcAddress('glConvolutionFilter2D');
  glConvolutionParameterf := dglGetProcAddress('glConvolutionParameterf');
  glConvolutionParameterfv := dglGetProcAddress('glConvolutionParameterfv');
  glConvolutionParameteri := dglGetProcAddress('glConvolutionParameteri');
  glConvolutionParameteriv := dglGetProcAddress('glConvolutionParameteriv');
  glCopyConvolutionFilter1D := dglGetProcAddress('glCopyConvolutionFilter1D');
  glCopyConvolutionFilter2D := dglGetProcAddress('glCopyConvolutionFilter2D');
  glGetConvolutionFilter := dglGetProcAddress('glGetConvolutionFilter');
  glGetConvolutionParameterfv := dglGetProcAddress('glGetConvolutionParameterfv');
  glGetConvolutionParameteriv := dglGetProcAddress('glGetConvolutionParameteriv');
  glGetSeparableFilter := dglGetProcAddress('glGetSeparableFilter');
  glSeparableFilter2D := dglGetProcAddress('glSeparableFilter2D');
  glGetHistogram := dglGetProcAddress('glGetHistogram');
  glGetHistogramParameterfv := dglGetProcAddress('glGetHistogramParameterfv');
  glGetHistogramParameteriv := dglGetProcAddress('glGetHistogramParameteriv');
  glGetMinmax := dglGetProcAddress('glGetMinmax');
  glGetMinmaxParameterfv := dglGetProcAddress('glGetMinmaxParameterfv');
  glGetMinmaxParameteriv := dglGetProcAddress('glGetMinmaxParameteriv');
  glHistogram := dglGetProcAddress('glHistogram');
  glMinmax := dglGetProcAddress('glMinmax');
  glResetHistogram := dglGetProcAddress('glResetHistogram');
  glResetMinmax := dglGetProcAddress('glResetMinmax');
{$endif}

  // GL_VERSION_1_3
  glActiveTexture := dglGetProcAddress('glActiveTexture');
  glSampleCoverage := dglGetProcAddress('glSampleCoverage');
  glCompressedTexImage3D := dglGetProcAddress('glCompressedTexImage3D');
  glCompressedTexImage2D := dglGetProcAddress('glCompressedTexImage2D');
  glCompressedTexImage1D := dglGetProcAddress('glCompressedTexImage1D');
  glCompressedTexSubImage3D := dglGetProcAddress('glCompressedTexSubImage3D');
  glCompressedTexSubImage2D := dglGetProcAddress('glCompressedTexSubImage2D');
  glCompressedTexSubImage1D := dglGetProcAddress('glCompressedTexSubImage1D');
  glGetCompressedTexImage := dglGetProcAddress('glGetCompressedTexImage');
{$ifdef DGL_DEPRECATED}
  glClientActiveTexture := dglGetProcAddress('glClientActiveTexture');
  glMultiTexCoord1d := dglGetProcAddress('glMultiTexCoord1d');
  glMultiTexCoord1dv := dglGetProcAddress('glMultiTexCoord1dv');
  glMultiTexCoord1f := dglGetProcAddress('glMultiTexCoord1f');
  glMultiTexCoord1fv := dglGetProcAddress('glMultiTexCoord1fv');
  glMultiTexCoord1i := dglGetProcAddress('glMultiTexCoord1i');
  glMultiTexCoord1iv := dglGetProcAddress('glMultiTexCoord1iv');
  glMultiTexCoord1s := dglGetProcAddress('glMultiTexCoord1s');
  glMultiTexCoord1sv := dglGetProcAddress('glMultiTexCoord1sv');
  glMultiTexCoord2d := dglGetProcAddress('glMultiTexCoord2d');
  glMultiTexCoord2dv := dglGetProcAddress('glMultiTexCoord2dv');
  glMultiTexCoord2f := dglGetProcAddress('glMultiTexCoord2f');
  glMultiTexCoord2fv := dglGetProcAddress('glMultiTexCoord2fv');
  glMultiTexCoord2i := dglGetProcAddress('glMultiTexCoord2i');
  glMultiTexCoord2iv := dglGetProcAddress('glMultiTexCoord2iv');
  glMultiTexCoord2s := dglGetProcAddress('glMultiTexCoord2s');
  glMultiTexCoord2sv := dglGetProcAddress('glMultiTexCoord2sv');
  glMultiTexCoord3d := dglGetProcAddress('glMultiTexCoord3d');
  glMultiTexCoord3dv := dglGetProcAddress('glMultiTexCoord3dv');
  glMultiTexCoord3f := dglGetProcAddress('glMultiTexCoord3f');
  glMultiTexCoord3fv := dglGetProcAddress('glMultiTexCoord3fv');
  glMultiTexCoord3i := dglGetProcAddress('glMultiTexCoord3i');
  glMultiTexCoord3iv := dglGetProcAddress('glMultiTexCoord3iv');
  glMultiTexCoord3s := dglGetProcAddress('glMultiTexCoord3s');
  glMultiTexCoord3sv := dglGetProcAddress('glMultiTexCoord3sv');
  glMultiTexCoord4d := dglGetProcAddress('glMultiTexCoord4d');
  glMultiTexCoord4dv := dglGetProcAddress('glMultiTexCoord4dv');
  glMultiTexCoord4f := dglGetProcAddress('glMultiTexCoord4f');
  glMultiTexCoord4fv := dglGetProcAddress('glMultiTexCoord4fv');
  glMultiTexCoord4i := dglGetProcAddress('glMultiTexCoord4i');
  glMultiTexCoord4iv := dglGetProcAddress('glMultiTexCoord4iv');
  glMultiTexCoord4s := dglGetProcAddress('glMultiTexCoord4s');
  glMultiTexCoord4sv := dglGetProcAddress('glMultiTexCoord4sv');
  glLoadTransposeMatrixf := dglGetProcAddress('glLoadTransposeMatrixf');
  glLoadTransposeMatrixd := dglGetProcAddress('glLoadTransposeMatrixd');
  glMultTransposeMatrixf := dglGetProcAddress('glMultTransposeMatrixf');
  glMultTransposeMatrixd := dglGetProcAddress('glMultTransposeMatrixd');
{$endif}

  // GL_VERSION_1_4
  glBlendFuncSeparate := dglGetProcAddress('glBlendFuncSeparate');
  glMultiDrawArrays := dglGetProcAddress('glMultiDrawArrays');
  glMultiDrawElements := dglGetProcAddress('glMultiDrawElements');
  glPointParameterf := dglGetProcAddress('glPointParameterf');
  glPointParameterfv := dglGetProcAddress('glPointParameterfv');
  glPointParameteri := dglGetProcAddress('glPointParameteri');
  glPointParameteriv := dglGetProcAddress('glPointParameteriv');
{$ifdef DGL_DEPRECATED}
  glFogCoordf := dglGetProcAddress('glFogCoordf');
  glFogCoordfv := dglGetProcAddress('glFogCoordfv');
  glFogCoordd := dglGetProcAddress('glFogCoordd');
  glFogCoorddv := dglGetProcAddress('glFogCoorddv');
  glFogCoordPointer := dglGetProcAddress('glFogCoordPointer');
  glSecondaryColor3b := dglGetProcAddress('glSecondaryColor3b');
  glSecondaryColor3bv := dglGetProcAddress('glSecondaryColor3bv');
  glSecondaryColor3d := dglGetProcAddress('glSecondaryColor3d');
  glSecondaryColor3dv := dglGetProcAddress('glSecondaryColor3dv');
  glSecondaryColor3f := dglGetProcAddress('glSecondaryColor3f');
  glSecondaryColor3fv := dglGetProcAddress('glSecondaryColor3fv');
  glSecondaryColor3i := dglGetProcAddress('glSecondaryColor3i');
  glSecondaryColor3iv := dglGetProcAddress('glSecondaryColor3iv');
  glSecondaryColor3s := dglGetProcAddress('glSecondaryColor3s');
  glSecondaryColor3sv := dglGetProcAddress('glSecondaryColor3sv');
  glSecondaryColor3ub := dglGetProcAddress('glSecondaryColor3ub');
  glSecondaryColor3ubv := dglGetProcAddress('glSecondaryColor3ubv');
  glSecondaryColor3ui := dglGetProcAddress('glSecondaryColor3ui');
  glSecondaryColor3uiv := dglGetProcAddress('glSecondaryColor3uiv');
  glSecondaryColor3us := dglGetProcAddress('glSecondaryColor3us');
  glSecondaryColor3usv := dglGetProcAddress('glSecondaryColor3usv');
  glSecondaryColorPointer := dglGetProcAddress('glSecondaryColorPointer');
  glWindowPos2d := dglGetProcAddress('glWindowPos2d');
  glWindowPos2dv := dglGetProcAddress('glWindowPos2dv');
  glWindowPos2f := dglGetProcAddress('glWindowPos2f');
  glWindowPos2fv := dglGetProcAddress('glWindowPos2fv');
  glWindowPos2i := dglGetProcAddress('glWindowPos2i');
  glWindowPos2iv := dglGetProcAddress('glWindowPos2iv');
  glWindowPos2s := dglGetProcAddress('glWindowPos2s');
  glWindowPos2sv := dglGetProcAddress('glWindowPos2sv');
  glWindowPos3d := dglGetProcAddress('glWindowPos3d');
  glWindowPos3dv := dglGetProcAddress('glWindowPos3dv');
  glWindowPos3f := dglGetProcAddress('glWindowPos3f');
  glWindowPos3fv := dglGetProcAddress('glWindowPos3fv');
  glWindowPos3i := dglGetProcAddress('glWindowPos3i');
  glWindowPos3iv := dglGetProcAddress('glWindowPos3iv');
  glWindowPos3s := dglGetProcAddress('glWindowPos3s');
  glWindowPos3sv := dglGetProcAddress('glWindowPos3sv');
{$endif}

  // GL_VERSION_1_5
  glGenQueries := dglGetProcAddress('glGenQueries');
  glDeleteQueries := dglGetProcAddress('glDeleteQueries');
  glIsQuery := dglGetProcAddress('glIsQuery');
  glBeginQuery := dglGetProcAddress('glBeginQuery');
  glEndQuery := dglGetProcAddress('glEndQuery');
  glGetQueryiv := dglGetProcAddress('glGetQueryiv');
  glGetQueryObjectiv := dglGetProcAddress('glGetQueryObjectiv');
  glGetQueryObjectuiv := dglGetProcAddress('glGetQueryObjectuiv');
  glBindBuffer := dglGetProcAddress('glBindBuffer');
  glDeleteBuffers := dglGetProcAddress('glDeleteBuffers');
  glGenBuffers := dglGetProcAddress('glGenBuffers');
  glIsBuffer := dglGetProcAddress('glIsBuffer');
  glBufferData := dglGetProcAddress('glBufferData');
  glBufferSubData := dglGetProcAddress('glBufferSubData');
  glGetBufferSubData := dglGetProcAddress('glGetBufferSubData');
  glMapBuffer := dglGetProcAddress('glMapBuffer');
  glUnmapBuffer := dglGetProcAddress('glUnmapBuffer');
  glGetBufferParameteriv := dglGetProcAddress('glGetBufferParameteriv');
  glGetBufferPointerv := dglGetProcAddress('glGetBufferPointerv');

  // GL_VERSION_2_0
  glBlendEquationSeparate := dglGetProcAddress('glBlendEquationSeparate');
  glDrawBuffers := dglGetProcAddress('glDrawBuffers');
  glStencilOpSeparate := dglGetProcAddress('glStencilOpSeparate');
  glStencilFuncSeparate := dglGetProcAddress('glStencilFuncSeparate');
  glStencilMaskSeparate := dglGetProcAddress('glStencilMaskSeparate');
  glAttachShader := dglGetProcAddress('glAttachShader');
  glBindAttribLocation := dglGetProcAddress('glBindAttribLocation');
  glCompileShader := dglGetProcAddress('glCompileShader');
  glCreateProgram := dglGetProcAddress('glCreateProgram');
  glCreateShader := dglGetProcAddress('glCreateShader');
  glDeleteProgram := dglGetProcAddress('glDeleteProgram');
  glDeleteShader := dglGetProcAddress('glDeleteShader');
  glDetachShader := dglGetProcAddress('glDetachShader');
  glDisableVertexAttribArray := dglGetProcAddress('glDisableVertexAttribArray');
  glEnableVertexAttribArray := dglGetProcAddress('glEnableVertexAttribArray');
  glGetActiveAttrib := dglGetProcAddress('glGetActiveAttrib');
  glGetActiveUniform := dglGetProcAddress('glGetActiveUniform');
  glGetAttachedShaders := dglGetProcAddress('glGetAttachedShaders');
  glGetAttribLocation := dglGetProcAddress('glGetAttribLocation');
  glGetProgramiv := dglGetProcAddress('glGetProgramiv');
  glGetProgramInfoLog := dglGetProcAddress('glGetProgramInfoLog');
  glGetShaderiv := dglGetProcAddress('glGetShaderiv');
  glGetShaderInfoLog := dglGetProcAddress('glGetShaderInfoLog');
  glGetShaderSource := dglGetProcAddress('glGetShaderSource');
  glGetUniformLocation := dglGetProcAddress('glGetUniformLocation');
  glGetUniformfv := dglGetProcAddress('glGetUniformfv');
  glGetUniformiv := dglGetProcAddress('glGetUniformiv');
  glGetVertexAttribfv := dglGetProcAddress('glGetVertexAttribfv');
  glGetVertexAttribiv := dglGetProcAddress('glGetVertexAttribiv');
  glGetVertexAttribPointerv := dglGetProcAddress('glGetVertexAttribPointerv');
  glIsProgram := dglGetProcAddress('glIsProgram');
  glIsShader := dglGetProcAddress('glIsShader');
  glLinkProgram := dglGetProcAddress('glLinkProgram');
  glShaderSource := dglGetProcAddress('glShaderSource');
  glUseProgram := dglGetProcAddress('glUseProgram');
  glUniform1f := dglGetProcAddress('glUniform1f');
  glUniform2f := dglGetProcAddress('glUniform2f');
  glUniform3f := dglGetProcAddress('glUniform3f');
  glUniform4f := dglGetProcAddress('glUniform4f');
  glUniform1i := dglGetProcAddress('glUniform1i');
  glUniform2i := dglGetProcAddress('glUniform2i');
  glUniform3i := dglGetProcAddress('glUniform3i');
  glUniform4i := dglGetProcAddress('glUniform4i');
  glUniform1fv := dglGetProcAddress('glUniform1fv');
  glUniform2fv := dglGetProcAddress('glUniform2fv');
  glUniform3fv := dglGetProcAddress('glUniform3fv');
  glUniform4fv := dglGetProcAddress('glUniform4fv');
  glUniform1iv := dglGetProcAddress('glUniform1iv');
  glUniform2iv := dglGetProcAddress('glUniform2iv');
  glUniform3iv := dglGetProcAddress('glUniform3iv');
  glUniform4iv := dglGetProcAddress('glUniform4iv');
  glUniformMatrix2fv := dglGetProcAddress('glUniformMatrix2fv');
  glUniformMatrix3fv := dglGetProcAddress('glUniformMatrix3fv');
  glUniformMatrix4fv := dglGetProcAddress('glUniformMatrix4fv');
  glValidateProgram := dglGetProcAddress('glValidateProgram');
  glVertexAttrib1d := dglGetProcAddress('glVertexAttrib1d');
  glVertexAttrib1dv := dglGetProcAddress('glVertexAttrib1dv');
  glVertexAttrib1f := dglGetProcAddress('glVertexAttrib1f');
  glVertexAttrib1fv := dglGetProcAddress('glVertexAttrib1fv');
  glVertexAttrib1s := dglGetProcAddress('glVertexAttrib1s');
  glVertexAttrib1sv := dglGetProcAddress('glVertexAttrib1sv');
  glVertexAttrib2d := dglGetProcAddress('glVertexAttrib2d');
  glVertexAttrib2dv := dglGetProcAddress('glVertexAttrib2dv');
  glVertexAttrib2f := dglGetProcAddress('glVertexAttrib2f');
  glVertexAttrib2fv := dglGetProcAddress('glVertexAttrib2fv');
  glVertexAttrib2s := dglGetProcAddress('glVertexAttrib2s');
  glVertexAttrib2sv := dglGetProcAddress('glVertexAttrib2sv');
  glVertexAttrib3d := dglGetProcAddress('glVertexAttrib3d');
  glVertexAttrib3dv := dglGetProcAddress('glVertexAttrib3dv');
  glVertexAttrib3f := dglGetProcAddress('glVertexAttrib3f');
  glVertexAttrib3fv := dglGetProcAddress('glVertexAttrib3fv');
  glVertexAttrib3s := dglGetProcAddress('glVertexAttrib3s');
  glVertexAttrib3sv := dglGetProcAddress('glVertexAttrib3sv');
  glVertexAttrib4Nbv := dglGetProcAddress('glVertexAttrib4Nbv');
  glVertexAttrib4Niv := dglGetProcAddress('glVertexAttrib4Niv');
  glVertexAttrib4Nsv := dglGetProcAddress('glVertexAttrib4Nsv');
  glVertexAttrib4Nub := dglGetProcAddress('glVertexAttrib4Nub');
  glVertexAttrib4Nubv := dglGetProcAddress('glVertexAttrib4Nubv');
  glVertexAttrib4Nuiv := dglGetProcAddress('glVertexAttrib4Nuiv');
  glVertexAttrib4Nusv := dglGetProcAddress('glVertexAttrib4Nusv');
  glVertexAttrib4bv := dglGetProcAddress('glVertexAttrib4bv');
  glVertexAttrib4d := dglGetProcAddress('glVertexAttrib4d');
  glVertexAttrib4dv := dglGetProcAddress('glVertexAttrib4dv');
  glVertexAttrib4f := dglGetProcAddress('glVertexAttrib4f');
  glVertexAttrib4fv := dglGetProcAddress('glVertexAttrib4fv');
  glVertexAttrib4iv := dglGetProcAddress('glVertexAttrib4iv');
  glVertexAttrib4s := dglGetProcAddress('glVertexAttrib4s');
  glVertexAttrib4sv := dglGetProcAddress('glVertexAttrib4sv');
  glVertexAttrib4ubv := dglGetProcAddress('glVertexAttrib4ubv');
  glVertexAttrib4uiv := dglGetProcAddress('glVertexAttrib4uiv');
  glVertexAttrib4usv := dglGetProcAddress('glVertexAttrib4usv');
  glVertexAttribPointer := dglGetProcAddress('glVertexAttribPointer');

  // GL_VERSION_2_1
  glUniformMatrix2x3fv := dglGetProcAddress('glUniformMatrix2x3fv');
  glUniformMatrix3x2fv := dglGetProcAddress('glUniformMatrix3x2fv');
  glUniformMatrix2x4fv := dglGetProcAddress('glUniformMatrix2x4fv');
  glUniformMatrix4x2fv := dglGetProcAddress('glUniformMatrix4x2fv');
  glUniformMatrix3x4fv := dglGetProcAddress('glUniformMatrix3x4fv');
  glUniformMatrix4x3fv := dglGetProcAddress('glUniformMatrix4x3fv');
  
  // GL_VERSION_3_0
  { OpenGL 3.0 also reuses entry points from these extensions: }
  Read_GL_ARB_framebuffer_object;
  Read_GL_ARB_map_buffer_range;
  Read_GL_ARB_vertex_array_object;

  glColorMaski := dglGetProcAddress('glColorMaski');
  glGetBooleani_v := dglGetProcAddress('glGetBooleani_v');
  glGetIntegeri_v := dglGetProcAddress('glGetIntegeri_v');
  glEnablei := dglGetProcAddress('glEnablei');
  glDisablei := dglGetProcAddress('glDisablei');
  glIsEnabledi := dglGetProcAddress('glIsEnabledi');
  glBeginTransformFeedback := dglGetProcAddress('glBeginTransformFeedback');
  glEndTransformFeedback := dglGetProcAddress('glEndTransformFeedback');
  glBindBufferRange := dglGetProcAddress('glBindBufferRange');
  glBindBufferBase := dglGetProcAddress('glBindBufferBase');
  glTransformFeedbackVaryings := dglGetProcAddress('glTransformFeedbackVaryings');
  glGetTransformFeedbackVarying := dglGetProcAddress('glGetTransformFeedbackVarying');
  glClampColor := dglGetProcAddress('glClampColor');
  glBeginConditionalRender := dglGetProcAddress('glBeginConditionalRender');
  glEndConditionalRender := dglGetProcAddress('glEndConditionalRender');
  glVertexAttribI1i := dglGetProcAddress('glVertexAttribI1i');
  glVertexAttribI2i := dglGetProcAddress('glVertexAttribI2i');
  glVertexAttribI3i := dglGetProcAddress('glVertexAttribI3i');
  glVertexAttribI4i := dglGetProcAddress('glVertexAttribI4i');
  glVertexAttribI1ui := dglGetProcAddress('glVertexAttribI1ui');
  glVertexAttribI2ui := dglGetProcAddress('glVertexAttribI2ui');
  glVertexAttribI3ui := dglGetProcAddress('glVertexAttribI3ui');
  glVertexAttribI4ui := dglGetProcAddress('glVertexAttribI4ui');
  glVertexAttribI1iv := dglGetProcAddress('glVertexAttribI1iv');
  glVertexAttribI2iv := dglGetProcAddress('glVertexAttribI2iv');
  glVertexAttribI3iv := dglGetProcAddress('glVertexAttribI3iv');
  glVertexAttribI4iv := dglGetProcAddress('glVertexAttribI4iv');
  glVertexAttribI1uiv := dglGetProcAddress('glVertexAttribI1uiv');
  glVertexAttribI2uiv := dglGetProcAddress('glVertexAttribI2uiv');
  glVertexAttribI3uiv := dglGetProcAddress('glVertexAttribI3uiv');
  glVertexAttribI4uiv := dglGetProcAddress('glVertexAttribI4uiv');
  glVertexAttribI4bv := dglGetProcAddress('glVertexAttribI4bv');
  glVertexAttribI4sv := dglGetProcAddress('glVertexAttribI4sv');
  glVertexAttribI4ubv := dglGetProcAddress('glVertexAttribI4ubv');
  glVertexAttribI4usv := dglGetProcAddress('glVertexAttribI4usv');
  glVertexAttribIPointer := dglGetProcAddress('glVertexAttribIPointer');
  glGetVertexAttribIiv := dglGetProcAddress('glGetVertexAttribIiv');
  glGetVertexAttribIuiv := dglGetProcAddress('glGetVertexAttribIuiv');
  glGetUniformuiv := dglGetProcAddress('glGetUniformuiv');
  glBindFragDataLocation := dglGetProcAddress('glBindFragDataLocation');
  glGetFragDataLocation := dglGetProcAddress('glGetFragDataLocation');
  glUniform1ui := dglGetProcAddress('glUniform1ui');
  glUniform2ui := dglGetProcAddress('glUniform2ui');
  glUniform3ui := dglGetProcAddress('glUniform3ui');
  glUniform4ui := dglGetProcAddress('glUniform4ui');
  glUniform1uiv := dglGetProcAddress('glUniform1uiv');
  glUniform2uiv := dglGetProcAddress('glUniform2uiv');
  glUniform3uiv := dglGetProcAddress('glUniform3uiv');
  glUniform4uiv := dglGetProcAddress('glUniform4uiv');
  glTexParameterIiv := dglGetProcAddress('glTexParameterIiv');
  glTexParameterIuiv := dglGetProcAddress('glTexParameterIuiv');
  glGetTexParameterIiv := dglGetProcAddress('glGetTexParameterIiv');
  glGetTexParameterIuiv := dglGetProcAddress('glGetTexParameterIuiv');
  glClearBufferiv := dglGetProcAddress('glClearBufferiv');
  glClearBufferuiv := dglGetProcAddress('glClearBufferuiv');
  glClearBufferfv := dglGetProcAddress('glClearBufferfv');
  glClearBufferfi := dglGetProcAddress('glClearBufferfi');
  glGetStringi := dglGetProcAddress('glGetStringi');

  // GL_VERSION_3_1
  { OpenGL 3.1 also reuses entry points from these extensions: }
  Read_GL_ARB_copy_buffer;
  Read_GL_ARB_uniform_buffer_object;

  glDrawArraysInstanced := dglGetProcAddress('glDrawArraysInstanced');
  glDrawElementsInstanced := dglGetProcAddress('glDrawElementsInstanced');
  glTexBuffer := dglGetProcAddress('glTexBuffer');
  glPrimitiveRestartIndex := dglGetProcAddress('glPrimitiveRestartIndex');

  // GL_VERSION_3_2
  { OpenGL 3.2 also reuses entry points from these extensions: }
  Read_GL_ARB_draw_elements_base_vertex;
  Read_GL_ARB_provoking_vertex;
  Read_GL_ARB_sync;
  Read_GL_ARB_texture_multisample;

  glGetInteger64i_v := dglGetProcAddress('glGetInteger64i_v');
  glGetBufferParameteri64v := dglGetProcAddress('glGetBufferParameteri64v');
  glFramebufferTexture := dglGetProcAddress('glFramebufferTexture');
//  glFramebufferTextureFace := dglGetProcAddress('glFramebufferTextureFace');

  // GL_VERSION_3_3
  { OpenGL 3.3 also reuses entry points from these extensions: }
  Read_GL_ARB_blend_func_extended;
  Read_GL_ARB_sampler_objects;
  { ARB_explicit_attrib_location, but it has none }
  { ARB_occlusion_query2 (no entry points) }
  { ARB_shader_bit_encoding (no entry points) }
  { ARB_texture_rgb10_a2ui (no entry points) }
  { ARB_texture_swizzle (no entry points) }
  Read_GL_ARB_timer_query;
  Read_GL_ARB_vertex_type_2_10_10_10_rev;

  glVertexAttribDivisor := dglGetProcAddress('glVertexAttribDivisor');
  
  // GL_VERSION_4_0
  { OpenGL 4.0 also reuses entry points from these extensions: }
  { ARB_texture_query_lod (no entry points) }
  Read_GL_ARB_draw_indirect;
  { ARB_gpu_shader5 (no entry points) }
  Read_GL_ARB_gpu_shader_fp64;
  Read_GL_ARB_shader_subroutine;
  Read_GL_ARB_tessellation_shader;
  { ARB_texture_buffer_object_rgb32 (no entry points) }
  { ARB_texture_cube_map_array (no entry points) }
  { ARB_texture_gather (no entry points) }
  Read_GL_ARB_transform_feedback2;
  Read_GL_ARB_transform_feedback3;

  glMinSampleShading := dglGetProcAddress('glMinSampleShading');
  glBlendEquationi := dglGetProcAddress('glBlendEquationi');
  glBlendEquationSeparatei := dglGetProcAddress('glBlendEquationSeparatei');
  glBlendFunci := dglGetProcAddress('glBlendFunci');
  glBlendFuncSeparatei := dglGetProcAddress('glBlendFuncSeparatei');

  // GL_VERSION_4_1
  { OpenGL 4.1 also reuses entry points from these extensions: }
  Read_GL_ARB_ES2_compatibility;
  Read_GL_ARB_get_program_binary;
  Read_GL_ARB_separate_shader_objects;
  { ARB_shader_precision (no entry points) }
  Read_GL_ARB_vertex_attrib_64bit;
  Read_GL_ARB_viewport_array;
end;

procedure Read_GL_3DFX_tbuffer;
begin
  glTbufferMask3DFX := dglGetProcAddress('glTbufferMask3DFX');
end;

procedure Read_GL_APPLE_element_array;
begin
  glElementPointerAPPLE := dglGetProcAddress('glElementPointerAPPLE');
  glDrawElementArrayAPPLE := dglGetProcAddress('glDrawElementArrayAPPLE');
  glDrawRangeElementArrayAPPLE := dglGetProcAddress('glDrawRangeElementArrayAPPLE');
  glMultiDrawElementArrayAPPLE := dglGetProcAddress('glMultiDrawElementArrayAPPLE');
  glMultiDrawRangeElementArrayAPPLE := dglGetProcAddress('glMultiDrawRangeElementArrayAPPLE');
end;

procedure Read_GL_APPLE_fence;
begin
  glGenFencesAPPLE := dglGetProcAddress('glGenFencesAPPLE');
  glDeleteFencesAPPLE := dglGetProcAddress('glDeleteFencesAPPLE');
  glSetFenceAPPLE := dglGetProcAddress('glSetFenceAPPLE');
  glIsFenceAPPLE := dglGetProcAddress('glIsFenceAPPLE');
  glTestFenceAPPLE := dglGetProcAddress('glTestFenceAPPLE');
  glFinishFenceAPPLE := dglGetProcAddress('glFinishFenceAPPLE');
  glTestObjectAPPLE := dglGetProcAddress('glTestObjectAPPLE');
  glFinishObjectAPPLE := dglGetProcAddress('glFinishObjectAPPLE');
end;

procedure Read_GL_APPLE_vertex_array_object;
begin
  glBindVertexArrayAPPLE := dglGetProcAddress('glBindVertexArrayAPPLE');
  glDeleteVertexArraysAPPLE := dglGetProcAddress('glDeleteVertexArraysAPPLE');
  glGenVertexArraysAPPLE := dglGetProcAddress('glGenVertexArraysAPPLE');
  glIsVertexArrayAPPLE := dglGetProcAddress('glIsVertexArrayAPPLE');
end;

procedure Read_GL_APPLE_vertex_array_range;
begin
  glVertexArrayRangeAPPLE := dglGetProcAddress('glVertexArrayRangeAPPLE');
  glFlushVertexArrayRangeAPPLE := dglGetProcAddress('glFlushVertexArrayRangeAPPLE');
  glVertexArrayParameteriAPPLE := dglGetProcAddress('glVertexArrayParameteriAPPLE');
end;

procedure Read_GL_APPLE_texture_range;
begin
  glTextureRangeAPPLE := dglGetProcAddress('glTextureRangeAPPLE');
  glGetTexParameterPointervAPPLE := dglGetProcAddress('glGetTexParameterPointervAPPLE');
end;

procedure Read_GL_APPLE_vertex_program_evaluators;
begin
  glEnableVertexAttribAPPLE := dglGetProcAddress('glEnableVertexAttribAPPLE');
  glDisableVertexAttribAPPLE := dglGetProcAddress('glDisableVertexAttribAPPLE');
  glIsVertexAttribEnabledAPPLE := dglGetProcAddress('glIsVertexAttribEnabledAPPLE');
  glMapVertexAttrib1dAPPLE := dglGetProcAddress('glMapVertexAttrib1dAPPLE');
  glMapVertexAttrib1fAPPLE := dglGetProcAddress('glMapVertexAttrib1fAPPLE');
  glMapVertexAttrib2dAPPLE := dglGetProcAddress('glMapVertexAttrib2dAPPLE');
  glMapVertexAttrib2fAPPLE := dglGetProcAddress('glMapVertexAttrib2fAPPLE');
end;

procedure Read_GL_APPLE_object_purgeable;
begin
  glObjectPurgeableAPPLE := dglGetProcAddress('glObjectPurgeableAPPLE');
  glObjectUnpurgeableAPPLE := dglGetProcAddress('glObjectUnpurgeableAPPLE');
  glGetObjectParameterivAPPLE := dglGetProcAddress('glGetObjectParameterivAPPLE');
end;

procedure Read_GL_ARB_matrix_palette;
begin
  glCurrentPaletteMatrixARB := dglGetProcAddress('glCurrentPaletteMatrixARB');
  glMatrixIndexubvARB := dglGetProcAddress('glMatrixIndexubvARB');
  glMatrixIndexusvARB := dglGetProcAddress('glMatrixIndexusvARB');
  glMatrixIndexuivARB := dglGetProcAddress('glMatrixIndexuivARB');
  glMatrixIndexPointerARB := dglGetProcAddress('glMatrixIndexPointerARB');
end;

procedure Read_GL_ARB_multisample;
begin
  glSampleCoverageARB := dglGetProcAddress('glSampleCoverageARB');
end;

procedure Read_GL_ARB_multitexture;
begin
  glActiveTextureARB := dglGetProcAddress('glActiveTextureARB');
  glClientActiveTextureARB := dglGetProcAddress('glClientActiveTextureARB');
  glMultiTexCoord1dARB := dglGetProcAddress('glMultiTexCoord1dARB');
  glMultiTexCoord1dvARB := dglGetProcAddress('glMultiTexCoord1dvARB');
  glMultiTexCoord1fARB := dglGetProcAddress('glMultiTexCoord1fARB');
  glMultiTexCoord1fvARB := dglGetProcAddress('glMultiTexCoord1fvARB');
  glMultiTexCoord1iARB := dglGetProcAddress('glMultiTexCoord1iARB');
  glMultiTexCoord1ivARB := dglGetProcAddress('glMultiTexCoord1ivARB');
  glMultiTexCoord1sARB := dglGetProcAddress('glMultiTexCoord1sARB');
  glMultiTexCoord1svARB := dglGetProcAddress('glMultiTexCoord1svARB');
  glMultiTexCoord2dARB := dglGetProcAddress('glMultiTexCoord2dARB');
  glMultiTexCoord2dvARB := dglGetProcAddress('glMultiTexCoord2dvARB');
  glMultiTexCoord2fARB := dglGetProcAddress('glMultiTexCoord2fARB');
  glMultiTexCoord2fvARB := dglGetProcAddress('glMultiTexCoord2fvARB');
  glMultiTexCoord2iARB := dglGetProcAddress('glMultiTexCoord2iARB');
  glMultiTexCoord2ivARB := dglGetProcAddress('glMultiTexCoord2ivARB');
  glMultiTexCoord2sARB := dglGetProcAddress('glMultiTexCoord2sARB');
  glMultiTexCoord2svARB := dglGetProcAddress('glMultiTexCoord2svARB');
  glMultiTexCoord3dARB := dglGetProcAddress('glMultiTexCoord3dARB');
  glMultiTexCoord3dvARB := dglGetProcAddress('glMultiTexCoord3dvARB');
  glMultiTexCoord3fARB := dglGetProcAddress('glMultiTexCoord3fARB');
  glMultiTexCoord3fvARB := dglGetProcAddress('glMultiTexCoord3fvARB');
  glMultiTexCoord3iARB := dglGetProcAddress('glMultiTexCoord3iARB');
  glMultiTexCoord3ivARB := dglGetProcAddress('glMultiTexCoord3ivARB');
  glMultiTexCoord3sARB := dglGetProcAddress('glMultiTexCoord3sARB');
  glMultiTexCoord3svARB := dglGetProcAddress('glMultiTexCoord3svARB');
  glMultiTexCoord4dARB := dglGetProcAddress('glMultiTexCoord4dARB');
  glMultiTexCoord4dvARB := dglGetProcAddress('glMultiTexCoord4dvARB');
  glMultiTexCoord4fARB := dglGetProcAddress('glMultiTexCoord4fARB');
  glMultiTexCoord4fvARB := dglGetProcAddress('glMultiTexCoord4fvARB');
  glMultiTexCoord4iARB := dglGetProcAddress('glMultiTexCoord4iARB');
  glMultiTexCoord4ivARB := dglGetProcAddress('glMultiTexCoord4ivARB');
  glMultiTexCoord4sARB := dglGetProcAddress('glMultiTexCoord4sARB');
  glMultiTexCoord4svARB := dglGetProcAddress('glMultiTexCoord4svARB');
end;

procedure Read_GL_ARB_point_parameters;
begin
  glPointParameterfARB := dglGetProcAddress('glPointParameterfARB');
  glPointParameterfvARB := dglGetProcAddress('glPointParameterfvARB');
end;

procedure Read_GL_ARB_texture_compression;
begin
  glCompressedTexImage3DARB := dglGetProcAddress('glCompressedTexImage3DARB');
  glCompressedTexImage2DARB := dglGetProcAddress('glCompressedTexImage2DARB');
  glCompressedTexImage1DARB := dglGetProcAddress('glCompressedTexImage1DARB');
  glCompressedTexSubImage3DARB := dglGetProcAddress('glCompressedTexSubImage3DARB');
  glCompressedTexSubImage2DARB := dglGetProcAddress('glCompressedTexSubImage2DARB');
  glCompressedTexSubImage1DARB := dglGetProcAddress('glCompressedTexSubImage1DARB');
  glGetCompressedTexImageARB := dglGetProcAddress('glGetCompressedTexImageARB');
end;

procedure Read_GL_ARB_transpose_matrix;
begin
  glLoadTransposeMatrixfARB := dglGetProcAddress('glLoadTransposeMatrixfARB');
  glLoadTransposeMatrixdARB := dglGetProcAddress('glLoadTransposeMatrixdARB');
  glMultTransposeMatrixfARB := dglGetProcAddress('glMultTransposeMatrixfARB');
  glMultTransposeMatrixdARB := dglGetProcAddress('glMultTransposeMatrixdARB');
end;

procedure Read_GL_ARB_vertex_blend;
begin
  glWeightbvARB := dglGetProcAddress('glWeightbvARB');
  glWeightsvARB := dglGetProcAddress('glWeightsvARB');
  glWeightivARB := dglGetProcAddress('glWeightivARB');
  glWeightfvARB := dglGetProcAddress('glWeightfvARB');
  glWeightdvARB := dglGetProcAddress('glWeightdvARB');
  glWeightubvARB := dglGetProcAddress('glWeightubvARB');
  glWeightusvARB := dglGetProcAddress('glWeightusvARB');
  glWeightuivARB := dglGetProcAddress('glWeightuivARB');
  glWeightPointerARB := dglGetProcAddress('glWeightPointerARB');
  glVertexBlendARB := dglGetProcAddress('glVertexBlendARB');
end;

procedure Read_GL_ARB_vertex_buffer_object;
begin
  glBindBufferARB := dglGetProcAddress('glBindBufferARB');
  glDeleteBuffersARB := dglGetProcAddress('glDeleteBuffersARB');
  glGenBuffersARB := dglGetProcAddress('glGenBuffersARB');
  glIsBufferARB := dglGetProcAddress('glIsBufferARB');
  glBufferDataARB := dglGetProcAddress('glBufferDataARB');
  glBufferSubDataARB := dglGetProcAddress('glBufferSubDataARB');
  glGetBufferSubDataARB := dglGetProcAddress('glGetBufferSubDataARB');
  glMapBufferARB := dglGetProcAddress('glMapBufferARB');
  glUnmapBufferARB := dglGetProcAddress('glUnmapBufferARB');
  glGetBufferParameterivARB := dglGetProcAddress('glGetBufferParameterivARB');
  glGetBufferPointervARB := dglGetProcAddress('glGetBufferPointervARB');
end;

procedure Read_GL_ARB_vertex_program;
begin
  glVertexAttrib1dARB := dglGetProcAddress('glVertexAttrib1dARB');
  glVertexAttrib1dvARB := dglGetProcAddress('glVertexAttrib1dvARB');
  glVertexAttrib1fARB := dglGetProcAddress('glVertexAttrib1fARB');
  glVertexAttrib1fvARB := dglGetProcAddress('glVertexAttrib1fvARB');
  glVertexAttrib1sARB := dglGetProcAddress('glVertexAttrib1sARB');
  glVertexAttrib1svARB := dglGetProcAddress('glVertexAttrib1svARB');
  glVertexAttrib2dARB := dglGetProcAddress('glVertexAttrib2dARB');
  glVertexAttrib2dvARB := dglGetProcAddress('glVertexAttrib2dvARB');
  glVertexAttrib2fARB := dglGetProcAddress('glVertexAttrib2fARB');
  glVertexAttrib2fvARB := dglGetProcAddress('glVertexAttrib2fvARB');
  glVertexAttrib2sARB := dglGetProcAddress('glVertexAttrib2sARB');
  glVertexAttrib2svARB := dglGetProcAddress('glVertexAttrib2svARB');
  glVertexAttrib3dARB := dglGetProcAddress('glVertexAttrib3dARB');
  glVertexAttrib3dvARB := dglGetProcAddress('glVertexAttrib3dvARB');
  glVertexAttrib3fARB := dglGetProcAddress('glVertexAttrib3fARB');
  glVertexAttrib3fvARB := dglGetProcAddress('glVertexAttrib3fvARB');
  glVertexAttrib3sARB := dglGetProcAddress('glVertexAttrib3sARB');
  glVertexAttrib3svARB := dglGetProcAddress('glVertexAttrib3svARB');
  glVertexAttrib4NbvARB := dglGetProcAddress('glVertexAttrib4NbvARB');
  glVertexAttrib4NivARB := dglGetProcAddress('glVertexAttrib4NivARB');
  glVertexAttrib4NsvARB := dglGetProcAddress('glVertexAttrib4NsvARB');
  glVertexAttrib4NubARB := dglGetProcAddress('glVertexAttrib4NubARB');
  glVertexAttrib4NubvARB := dglGetProcAddress('glVertexAttrib4NubvARB');
  glVertexAttrib4NuivARB := dglGetProcAddress('glVertexAttrib4NuivARB');
  glVertexAttrib4NusvARB := dglGetProcAddress('glVertexAttrib4NusvARB');
  glVertexAttrib4bvARB := dglGetProcAddress('glVertexAttrib4bvARB');
  glVertexAttrib4dARB := dglGetProcAddress('glVertexAttrib4dARB');
  glVertexAttrib4dvARB := dglGetProcAddress('glVertexAttrib4dvARB');
  glVertexAttrib4fARB := dglGetProcAddress('glVertexAttrib4fARB');
  glVertexAttrib4fvARB := dglGetProcAddress('glVertexAttrib4fvARB');
  glVertexAttrib4ivARB := dglGetProcAddress('glVertexAttrib4ivARB');
  glVertexAttrib4sARB := dglGetProcAddress('glVertexAttrib4sARB');
  glVertexAttrib4svARB := dglGetProcAddress('glVertexAttrib4svARB');
  glVertexAttrib4ubvARB := dglGetProcAddress('glVertexAttrib4ubvARB');
  glVertexAttrib4uivARB := dglGetProcAddress('glVertexAttrib4uivARB');
  glVertexAttrib4usvARB := dglGetProcAddress('glVertexAttrib4usvARB');
  glVertexAttribPointerARB := dglGetProcAddress('glVertexAttribPointerARB');
  glEnableVertexAttribArrayARB := dglGetProcAddress('glEnableVertexAttribArrayARB');
  glDisableVertexAttribArrayARB := dglGetProcAddress('glDisableVertexAttribArrayARB');
  glProgramStringARB := dglGetProcAddress('glProgramStringARB');
  glBindProgramARB := dglGetProcAddress('glBindProgramARB');
  glDeleteProgramsARB := dglGetProcAddress('glDeleteProgramsARB');
  glGenProgramsARB := dglGetProcAddress('glGenProgramsARB');
  glProgramEnvParameter4dARB := dglGetProcAddress('glProgramEnvParameter4dARB');
  glProgramEnvParameter4dvARB := dglGetProcAddress('glProgramEnvParameter4dvARB');
  glProgramEnvParameter4fARB := dglGetProcAddress('glProgramEnvParameter4fARB');
  glProgramEnvParameter4fvARB := dglGetProcAddress('glProgramEnvParameter4fvARB');
  glProgramLocalParameter4dARB := dglGetProcAddress('glProgramLocalParameter4dARB');
  glProgramLocalParameter4dvARB := dglGetProcAddress('glProgramLocalParameter4dvARB');
  glProgramLocalParameter4fARB := dglGetProcAddress('glProgramLocalParameter4fARB');
  glProgramLocalParameter4fvARB := dglGetProcAddress('glProgramLocalParameter4fvARB');
  glGetProgramEnvParameterdvARB := dglGetProcAddress('glGetProgramEnvParameterdvARB');
  glGetProgramEnvParameterfvARB := dglGetProcAddress('glGetProgramEnvParameterfvARB');
  glGetProgramLocalParameterdvARB := dglGetProcAddress('glGetProgramLocalParameterdvARB');
  glGetProgramLocalParameterfvARB := dglGetProcAddress('glGetProgramLocalParameterfvARB');
  glGetProgramivARB := dglGetProcAddress('glGetProgramivARB');
  glGetProgramStringARB := dglGetProcAddress('glGetProgramStringARB');
  glGetVertexAttribdvARB := dglGetProcAddress('glGetVertexAttribdvARB');
  glGetVertexAttribfvARB := dglGetProcAddress('glGetVertexAttribfvARB');
  glGetVertexAttribivARB := dglGetProcAddress('glGetVertexAttribivARB');
  glGetVertexAttribPointervARB := dglGetProcAddress('glGetVertexAttribPointervARB');
  glIsProgramARB := dglGetProcAddress('glIsProgramARB');
end;

procedure Read_GL_ARB_window_pos;
begin
  glWindowPos2dARB := dglGetProcAddress('glWindowPos2dARB');
  glWindowPos2dvARB := dglGetProcAddress('glWindowPos2dvARB');
  glWindowPos2fARB := dglGetProcAddress('glWindowPos2fARB');
  glWindowPos2fvARB := dglGetProcAddress('glWindowPos2fvARB');
  glWindowPos2iARB := dglGetProcAddress('glWindowPos2iARB');
  glWindowPos2ivARB := dglGetProcAddress('glWindowPos2ivARB');
  glWindowPos2sARB := dglGetProcAddress('glWindowPos2sARB');
  glWindowPos2svARB := dglGetProcAddress('glWindowPos2svARB');
  glWindowPos3dARB := dglGetProcAddress('glWindowPos3dARB');
  glWindowPos3dvARB := dglGetProcAddress('glWindowPos3dvARB');
  glWindowPos3fARB := dglGetProcAddress('glWindowPos3fARB');
  glWindowPos3fvARB := dglGetProcAddress('glWindowPos3fvARB');
  glWindowPos3iARB := dglGetProcAddress('glWindowPos3iARB');
  glWindowPos3ivARB := dglGetProcAddress('glWindowPos3ivARB');
  glWindowPos3sARB := dglGetProcAddress('glWindowPos3sARB');
  glWindowPos3svARB := dglGetProcAddress('glWindowPos3svARB');
end;

procedure Read_GL_ARB_draw_buffers;
begin
  glDrawBuffersARB := dglGetProcAddress('glDrawBuffersARB');
end;

procedure Read_GL_ARB_color_buffer_float;
begin
  glClampColorARB := dglGetProcAddress('glClampColorARB');
end;

procedure Read_GL_ARB_Shader_Objects;
begin
  // GL_ARB_Shader_Objects
  glCreateShaderObjectARB := dglGetProcAddress('glCreateShaderObjectARB');
  glShaderSourceARB := dglGetProcAddress('glShaderSourceARB');
  glCompileShaderARB := dglGetProcAddress('glCompileShaderARB');
  glDeleteObjectARB := dglGetProcAddress('glDeleteObjectARB');
  glGetHandleARB := dglGetProcAddress('glGetHandleARB');
  glDetachObjectARB := dglGetProcAddress('glDetachObjectARB');
  glCreateProgramObjectARB := dglGetProcAddress('glCreateProgramObjectARB');
  glAttachObjectARB := dglGetProcAddress('glAttachObjectARB');
  glLinkProgramARB := dglGetProcAddress('glLinkProgramARB');
  glUseProgramObjectARB := dglGetProcAddress('glUseProgramObjectARB');
  glValidateProgramARB := dglGetProcAddress('glValidateProgramARB');
  glGetObjectParameterfvARB := dglGetProcAddress('glGetObjectParameterfvARB');
  glGetObjectParameterivARB := dglGetProcAddress('glGetObjectParameterivARB');
  glGetActiveUniformARB := dglGetProcAddress('glGetActiveUniformARB');
  glGetAttachedObjectsARB := dglGetProcAddress('glGetAttachedObjectsARB');
  glGetShaderSourceARB := dglGetProcAddress('glGetShaderSourceARB');
  glGetUniformfvARB := dglGetProcAddress('glGetUniformfvARB');
  glGetUniformivARB := dglGetProcAddress('glGetUniformivARB');
  glGetUniformLocationARB := dglGetProcAddress('glGetUniformLocationARB');
  glGetInfoLogARB := dglGetProcAddress('glGetInfoLogARB');
  glUniform1fARB := dglGetProcAddress('glUniform1fARB');
  glUniform2fARB := dglGetProcAddress('glUniform2fARB');
  glUniform3fARB := dglGetProcAddress('glUniform3fARB');
  glUniform4fARB := dglGetProcAddress('glUniform4fARB');
  glUniform1iARB := dglGetProcAddress('glUniform1iARB');
  glUniform2iARB := dglGetProcAddress('glUniform2iARB');
  glUniform3iARB := dglGetProcAddress('glUniform3iARB');
  glUniform4iARB := dglGetProcAddress('glUniform4iARB');
  glUniform1fvARB := dglGetProcAddress('glUniform1fvARB');
  glUniform2fvARB := dglGetProcAddress('glUniform2fvARB');
  glUniform3fvARB := dglGetProcAddress('glUniform3fvARB');
  glUniform4fvARB := dglGetProcAddress('glUniform4fvARB');
  glUniform1ivARB := dglGetProcAddress('glUniform1ivARB');
  glUniform2ivARB := dglGetProcAddress('glUniform2ivARB');
  glUniform3ivARB := dglGetProcAddress('glUniform3ivARB');
  glUniform4ivARB := dglGetProcAddress('glUniform4ivARB');
  glUniformMatrix2fvARB := dglGetProcAddress('glUniformMatrix2fvARB');
  glUniformMatrix3fvARB := dglGetProcAddress('glUniformMatrix3fvARB');
  glUniformMatrix4fvARB := dglGetProcAddress('glUniformMatrix4fvARB');

  // GL_ARB_vertex_shader
  glGetActiveAttribARB := dglGetProcAddress('glGetActiveAttribARB');
  glGetAttribLocationARB := dglGetProcAddress('glGetAttribLocationARB');
  glBindAttribLocationARB := dglGetProcAddress('glBindAttribLocationARB');
  glGetVertexAttribPointervARB := dglGetProcAddress('glGetVertexAttribPointervARB');
end;

procedure Read_GL_ARB_occlusion_query;
begin
  glGenQueriesARB := dglGetProcAddress('glGenQueriesARB');
  glDeleteQueriesARB := dglGetProcAddress('glDeleteQueriesARB');
  glIsQueryARB := dglGetProcAddress('glIsQueryARB');
  glBeginQueryARB := dglGetProcAddress('glBeginQueryARB');
  glEndQueryARB := dglGetProcAddress('glEndQueryARB');
  glGetQueryivARB := dglGetProcAddress('glGetQueryivARB');
  glGetQueryObjectivARB := dglGetProcAddress('glGetQueryObjectivARB');
  glGetQueryObjectuivARB := dglGetProcAddress('glGetQueryObjectuivARB');
end;

procedure Read_GL_ARB_draw_instanced;
begin
  glDrawArraysInstancedARB := dglGetProcAddress('glDrawArraysInstancedARB');
  glDrawElementsInstancedARB := dglGetProcAddress('glDrawElementsInstancedARB');
end;

procedure Read_GL_ARB_framebuffer_object;
begin
  glIsRenderbuffer := dglGetProcAddress('glIsRenderbuffer');
  glBindRenderbuffer := dglGetProcAddress('glBindRenderbuffer');
  glDeleteRenderbuffers := dglGetProcAddress('glDeleteRenderbuffers');
  glGenRenderbuffers := dglGetProcAddress('glGenRenderbuffers');
  glRenderbufferStorage := dglGetProcAddress('glRenderbufferStorage');
  glGetRenderbufferParameteriv := dglGetProcAddress('glGetRenderbufferParameteriv');
  glIsFramebuffer := dglGetProcAddress('glIsFramebuffer');
  glBindFramebuffer := dglGetProcAddress('glBindFramebuffer');
  glDeleteFramebuffers := dglGetProcAddress('glDeleteFramebuffers');
  glGenFramebuffers := dglGetProcAddress('glGenFramebuffers');
  glCheckFramebufferStatus := dglGetProcAddress('glCheckFramebufferStatus');
  glFramebufferTexture1D := dglGetProcAddress('glFramebufferTexture1D');
  glFramebufferTexture2D := dglGetProcAddress('glFramebufferTexture2D');
  glFramebufferTexture3D := dglGetProcAddress('glFramebufferTexture3D');
  glFramebufferRenderbuffer := dglGetProcAddress('glFramebufferRenderbuffer');
  glGetFramebufferAttachmentParameteriv := dglGetProcAddress('glGetFramebufferAttachmentParameteriv');
  glGenerateMipmap := dglGetProcAddress('glGenerateMipmap');
  glBlitFramebuffer := dglGetProcAddress('glBlitFramebuffer');
  glRenderbufferStorageMultisample := dglGetProcAddress('glRenderbufferStorageMultisample');
  glFramebufferTextureLayer := dglGetProcAddress('glFramebufferTextureLayer');
end;

procedure Read_GL_ARB_geometry_shader4;
begin
  glProgramParameteriARB := dglGetProcAddress('glProgramParameteriARB');
  glFramebufferTextureARB := dglGetProcAddress('glFramebufferTextureARB');
  glFramebufferTextureLayerARB := dglGetProcAddress('glFramebufferTextureLayerARB');
  glFramebufferTextureFaceARB := dglGetProcAddress('glFramebufferTextureFaceARB');
end;

procedure Read_GL_ARB_instanced_arrays;
begin
  glVertexAttribDivisorARB := dglGetProcAddress('glVertexAttribDivisorARB');
end;

procedure Read_GL_ARB_map_buffer_range;
begin
  glMapBufferRange := dglGetProcAddress('glMapBufferRange');
  glFlushMappedBufferRange := dglGetProcAddress('glFlushMappedBufferRange');
end;

procedure Read_GL_ARB_texture_buffer_object;
begin
  glTexBufferARB := dglGetProcAddress('glTexBufferARB');
end;

procedure Read_GL_ARB_vertex_array_object;
begin
  glBindVertexArray := dglGetProcAddress('glBindVertexArray');
  glDeleteVertexArrays := dglGetProcAddress('glDeleteVertexArrays');
  glGenVertexArrays := dglGetProcAddress('glGenVertexArrays');
  glIsVertexArray := dglGetProcAddress('glIsVertexArray');
end;

procedure Read_GL_ARB_uniform_buffer_object;
begin
  glGetUniformIndices := dglGetProcAddress('glGetUniformIndices');
  glGetActiveUniformsiv := dglGetProcAddress('glGetActiveUniformsiv');
  glGetActiveUniformName := dglGetProcAddress('glGetActiveUniformName');
  glGetUniformBlockIndex := dglGetProcAddress('glGetUniformBlockIndex');
  glGetActiveUniformBlockiv := dglGetProcAddress('glGetActiveUniformBlockiv');
  glGetActiveUniformBlockName := dglGetProcAddress('glGetActiveUniformBlockName');
  glUniformBlockBinding := dglGetProcAddress('glUniformBlockBinding');
end;

procedure Read_GL_ARB_copy_buffer;
begin
  glCopyBufferSubData := dglGetProcAddress('glCopyBufferSubData');
end;

procedure Read_GL_ARB_draw_elements_base_vertex;
begin
  glDrawElementsBaseVertex := dglGetProcAddress('glDrawElementsBaseVertex');
  glDrawRangeElementsBaseVertex := dglGetProcAddress('glDrawRangeElementsBaseVertex');
  glDrawElementsInstancedBaseVertex := dglGetProcAddress('glDrawElementsInstancedBaseVertex');
  glMultiDrawElementsBaseVertex := dglGetProcAddress('glMultiDrawElementsBaseVertex');
end;

procedure Read_GL_ARB_provoking_vertex;
begin
  glProvokingVertex := dglGetProcAddress('glProvokingVertex');
end;

procedure Read_GL_ARB_sync;
begin
  glFenceSync := dglGetProcAddress('glFenceSync');
  glIsSync := dglGetProcAddress('glIsSync');
  glDeleteSync := dglGetProcAddress('glDeleteSync');
  glClientWaitSync := dglGetProcAddress('glClientWaitSync');
  glWaitSync := dglGetProcAddress('glWaitSync');
  glGetInteger64v := dglGetProcAddress('glGetInteger64v');
  glGetSynciv := dglGetProcAddress('glGetSynciv');
end;

procedure Read_GL_ARB_texture_multisample;
begin
  glTexImage2DMultisample := dglGetProcAddress('glTexImage2DMultisample');
  glTexImage3DMultisample := dglGetProcAddress('glTexImage3DMultisample');
  glGetMultisamplefv := dglGetProcAddress('glGetMultisamplefv');
  glSampleMaski := dglGetProcAddress('glSampleMaski');
end;

procedure Read_GL_ARB_draw_buffers_blend;
begin
  glBlendEquationiARB := dglGetProcAddress('glBlendEquationiARB');
  glBlendEquationSeparateiARB := dglGetProcAddress('glBlendEquationSeparateiARB');
  glBlendFunciARB := dglGetProcAddress('glBlendFunciARB');
  glBlendFuncSeparateiARB := dglGetProcAddress('glBlendFuncSeparateiARB');
end;

procedure Read_GL_ARB_sample_shading;
begin
  glMinSampleShadingARB := dglGetProcAddress('glMinSampleShadingARB');
end;

procedure Read_GL_ARB_shading_language_include;
begin
  glNamedStringARB := dglGetProcAddress('glNamedStringARB');
  glDeleteNamedStringARB := dglGetProcAddress('glDeleteNamedStringARB');
  glCompileShaderIncludeARB := dglGetProcAddress('glCompileShaderIncludeARB');
  glIsNamedStringARB := dglGetProcAddress('glIsNamedStringARB');
  glGetNamedStringARB := dglGetProcAddress('glGetNamedStringARB');
  glGetNamedStringivARB := dglGetProcAddress('glGetNamedStringivARB');
end;

procedure Read_GL_ARB_blend_func_extended;
begin
  glBindFragDataLocationIndexed := dglGetProcAddress('glBindFragDataLocationIndexed');
  glGetFragDataIndex := dglGetProcAddress('glGetFragDataIndex');
end;

procedure Read_GL_ARB_sampler_objects;
begin
  glGenSamplers := dglGetProcAddress('glGenSamplers');
  glDeleteSamplers := dglGetProcAddress('glDeleteSamplers');
  glIsSampler := dglGetProcAddress('glIsSampler');
  glBindSampler := dglGetProcAddress('glBindSampler');
  glSamplerParameteri := dglGetProcAddress('glSamplerParameteri');
  glSamplerParameteriv := dglGetProcAddress('glSamplerParameteriv');
  glSamplerParameterf := dglGetProcAddress('glSamplerParameterf');
  glSamplerParameterfv := dglGetProcAddress('glSamplerParameterfv');
  glSamplerParameterIiv := dglGetProcAddress('glSamplerParameterIiv');
  glSamplerParameterIuiv := dglGetProcAddress('glSamplerParameterIuiv');
  glGetSamplerParameteriv := dglGetProcAddress('glGetSamplerParameteriv');
  glGetSamplerParameterIiv := dglGetProcAddress('glGetSamplerParameterIiv');
  glGetSamplerParameterfv := dglGetProcAddress('glGetSamplerParameterfv');
  glGetSamplerParameterIuiv := dglGetProcAddress('glGetSamplerParameterIuiv');
end;

procedure Read_GL_ARB_timer_query;
begin
  glQueryCounter := dglGetProcAddress('glQueryCounter');
  glGetQueryObjecti64v := dglGetProcAddress('glGetQueryObjecti64v');
  glGetQueryObjectui64v := dglGetProcAddress('glGetQueryObjectui64v');
end;

procedure Read_GL_ARB_vertex_type_2_10_10_10_rev;
begin
  glVertexP2ui := dglGetProcAddress('glVertexP2ui');
  glVertexP2uiv := dglGetProcAddress('glVertexP2uiv');
  glVertexP3ui := dglGetProcAddress('glVertexP3ui');
  glVertexP3uiv := dglGetProcAddress('glVertexP3uiv');
  glVertexP4ui := dglGetProcAddress('glVertexP4ui');
  glVertexP4uiv := dglGetProcAddress('glVertexP4uiv');
  glTexCoordP1ui := dglGetProcAddress('glTexCoordP1ui');
  glTexCoordP1uiv := dglGetProcAddress('glTexCoordP1uiv');
  glTexCoordP2ui := dglGetProcAddress('glTexCoordP2ui');
  glTexCoordP2uiv := dglGetProcAddress('glTexCoordP2uiv');
  glTexCoordP3ui := dglGetProcAddress('glTexCoordP3ui');
  glTexCoordP3uiv := dglGetProcAddress('glTexCoordP3uiv');
  glTexCoordP4ui := dglGetProcAddress('glTexCoordP4ui');
  glTexCoordP4uiv := dglGetProcAddress('glTexCoordP4uiv');
  glMultiTexCoordP1ui := dglGetProcAddress('glMultiTexCoordP1ui');
  glMultiTexCoordP1uiv := dglGetProcAddress('glMultiTexCoordP1uiv');
  glMultiTexCoordP2ui := dglGetProcAddress('glMultiTexCoordP2ui');
  glMultiTexCoordP2uiv := dglGetProcAddress('glMultiTexCoordP2uiv');
  glMultiTexCoordP3ui := dglGetProcAddress('glMultiTexCoordP3ui');
  glMultiTexCoordP3uiv := dglGetProcAddress('glMultiTexCoordP3uiv');
  glMultiTexCoordP4ui := dglGetProcAddress('glMultiTexCoordP4ui');
  glMultiTexCoordP4uiv := dglGetProcAddress('glMultiTexCoordP4uiv');
  glNormalP3ui := dglGetProcAddress('glNormalP3ui');
  glNormalP3uiv := dglGetProcAddress('glNormalP3uiv');
  glColorP3ui := dglGetProcAddress('glColorP3ui');
  glColorP3uiv := dglGetProcAddress('glColorP3uiv');
  glColorP4ui := dglGetProcAddress('glColorP4ui');
  glColorP4uiv := dglGetProcAddress('glColorP4uiv');
  glSecondaryColorP3ui := dglGetProcAddress('glSecondaryColorP3ui');
  glSecondaryColorP3uiv := dglGetProcAddress('glSecondaryColorP3uiv');
  glVertexAttribP1ui := dglGetProcAddress('glVertexAttribP1ui');
  glVertexAttribP1uiv := dglGetProcAddress('glVertexAttribP1uiv');
  glVertexAttribP2ui := dglGetProcAddress('glVertexAttribP2ui');
  glVertexAttribP2uiv := dglGetProcAddress('glVertexAttribP2uiv');
  glVertexAttribP3ui := dglGetProcAddress('glVertexAttribP3ui');
  glVertexAttribP3uiv := dglGetProcAddress('glVertexAttribP3uiv');
  glVertexAttribP4ui := dglGetProcAddress('glVertexAttribP4ui');
  glVertexAttribP4uiv := dglGetProcAddress('glVertexAttribP4uiv');
end;

procedure Read_GL_ARB_draw_indirect;
begin
  glDrawArraysIndirect := dglGetProcAddress('glDrawArraysIndirect');
  glDrawElementsIndirect := dglGetProcAddress('glDrawElementsIndirect');
end;

procedure Read_GL_ARB_gpu_shader_fp64;
begin
  glUniform1d := dglGetProcAddress('glUniform1d');
  glUniform2d := dglGetProcAddress('glUniform2d');
  glUniform3d := dglGetProcAddress('glUniform3d');
  glUniform4d := dglGetProcAddress('glUniform4d');
  glUniform1dv := dglGetProcAddress('glUniform1dv');
  glUniform2dv := dglGetProcAddress('glUniform2dv');
  glUniform3dv := dglGetProcAddress('glUniform3dv');
  glUniform4dv := dglGetProcAddress('glUniform4dv');
  glUniformMatrix2dv := dglGetProcAddress('glUniformMatrix2dv');
  glUniformMatrix3dv := dglGetProcAddress('glUniformMatrix3dv');
  glUniformMatrix4dv := dglGetProcAddress('glUniformMatrix4dv');
  glUniformMatrix2x3dv := dglGetProcAddress('glUniformMatrix2x3dv');
  glUniformMatrix2x4dv := dglGetProcAddress('glUniformMatrix2x4dv');
  glUniformMatrix3x2dv := dglGetProcAddress('glUniformMatrix3x2dv');
  glUniformMatrix3x4dv := dglGetProcAddress('glUniformMatrix3x4dv');
  glUniformMatrix4x2dv := dglGetProcAddress('glUniformMatrix4x2dv');
  glUniformMatrix4x3dv := dglGetProcAddress('glUniformMatrix4x3dv');
  glGetUniformdv := dglGetProcAddress('glGetUniformdv');
end;

procedure Read_GL_ARB_shader_subroutine;
begin
  glGetSubroutineUniformLocation := dglGetProcAddress('glGetSubroutineUniformLocation');
  glGetSubroutineIndex := dglGetProcAddress('glGetSubroutineIndex');
  glGetActiveSubroutineUniformiv := dglGetProcAddress('glGetActiveSubroutineUniformiv');
  glGetActiveSubroutineUniformName := dglGetProcAddress('glGetActiveSubroutineUniformName');
  glGetActiveSubroutineName := dglGetProcAddress('glGetActiveSubroutineName');
  glUniformSubroutinesuiv := dglGetProcAddress('glUniformSubroutinesuiv');
  glGetUniformSubroutineuiv := dglGetProcAddress('glGetUniformSubroutineuiv');
  glGetProgramStageiv := dglGetProcAddress('glGetProgramStageiv');
end;

procedure Read_GL_ARB_tessellation_shader;
begin
  glPatchParameteri := dglGetProcAddress('glPatchParameteri');
  glPatchParameterfv := dglGetProcAddress('glPatchParameterfv');
end;

procedure Read_GL_ARB_transform_feedback2;
begin
  glBindTransformFeedback := dglGetProcAddress('glBindTransformFeedback');
  glDeleteTransformFeedbacks := dglGetProcAddress('glDeleteTransformFeedbacks');
  glGenTransformFeedbacks := dglGetProcAddress('glGenTransformFeedbacks');
  glIsTransformFeedback := dglGetProcAddress('glIsTransformFeedback');
  glPauseTransformFeedback := dglGetProcAddress('glPauseTransformFeedback');
  glResumeTransformFeedback := dglGetProcAddress('glResumeTransformFeedback');
  glDrawTransformFeedback := dglGetProcAddress('glDrawTransformFeedback');
end;

procedure Read_GL_ARB_transform_feedback3;
begin
  glDrawTransformFeedbackStream := dglGetProcAddress('glDrawTransformFeedbackStream');
  glBeginQueryIndexed := dglGetProcAddress('glBeginQueryIndexed');
  glEndQueryIndexed := dglGetProcAddress('glEndQueryIndexed');
  glGetQueryIndexediv := dglGetProcAddress('glGetQueryIndexediv');
end;

procedure Read_GL_ARB_ES2_compatibility;
begin
  glReleaseShaderCompiler := dglGetProcAddress('glReleaseShaderCompiler');
  glShaderBinary := dglGetProcAddress('glShaderBinary');
  glGetShaderPrecisionFormat := dglGetProcAddress('glGetShaderPrecisionFormat');
  glDepthRangef := dglGetProcAddress('glDepthRangef');
  glClearDepthf := dglGetProcAddress('glClearDepthf');
end;

procedure Read_GL_ARB_get_program_binary;
begin
  glGetProgramBinary := dglGetProcAddress('glGetProgramBinary');
  glProgramBinary := dglGetProcAddress('glProgramBinary');
  glProgramParameteri := dglGetProcAddress('glProgramParameteri');
end;

procedure Read_GL_ARB_separate_shader_objects;
begin
  glUseProgramStages := dglGetProcAddress('glUseProgramStages');
  glActiveShaderProgram := dglGetProcAddress('glActiveShaderProgram');
  glCreateShaderProgramv := dglGetProcAddress('glCreateShaderProgramv');
  glBindProgramPipeline := dglGetProcAddress('glBindProgramPipeline');
  glDeleteProgramPipelines := dglGetProcAddress('glDeleteProgramPipelines');
  glGenProgramPipelines := dglGetProcAddress('glGenProgramPipelines');
  glIsProgramPipeline := dglGetProcAddress('glIsProgramPipeline');
  glGetProgramPipelineiv := dglGetProcAddress('glGetProgramPipelineiv');
  glProgramUniform1i := dglGetProcAddress('glProgramUniform1i');
  glProgramUniform1iv := dglGetProcAddress('glProgramUniform1iv');
  glProgramUniform1f := dglGetProcAddress('glProgramUniform1f');
  glProgramUniform1fv := dglGetProcAddress('glProgramUniform1fv');
  glProgramUniform1d := dglGetProcAddress('glProgramUniform1d');
  glProgramUniform1dv := dglGetProcAddress('glProgramUniform1dv');
  glProgramUniform1ui := dglGetProcAddress('glProgramUniform1ui');
  glProgramUniform1uiv := dglGetProcAddress('glProgramUniform1uiv');
  glProgramUniform2i := dglGetProcAddress('glProgramUniform2i');
  glProgramUniform2iv := dglGetProcAddress('glProgramUniform2iv');
  glProgramUniform2f := dglGetProcAddress('glProgramUniform2f');
  glProgramUniform2fv := dglGetProcAddress('glProgramUniform2fv');
  glProgramUniform2d := dglGetProcAddress('glProgramUniform2d');
  glProgramUniform2dv := dglGetProcAddress('glProgramUniform2dv');
  glProgramUniform2ui := dglGetProcAddress('glProgramUniform2ui');
  glProgramUniform2uiv := dglGetProcAddress('glProgramUniform2uiv');
  glProgramUniform3i := dglGetProcAddress('glProgramUniform3i');
  glProgramUniform3iv := dglGetProcAddress('glProgramUniform3iv');
  glProgramUniform3f := dglGetProcAddress('glProgramUniform3f');
  glProgramUniform3fv := dglGetProcAddress('glProgramUniform3fv');
  glProgramUniform3d := dglGetProcAddress('glProgramUniform3d');
  glProgramUniform3dv := dglGetProcAddress('glProgramUniform3dv');
  glProgramUniform3ui := dglGetProcAddress('glProgramUniform3ui');
  glProgramUniform3uiv := dglGetProcAddress('glProgramUniform3uiv');
  glProgramUniform4i := dglGetProcAddress('glProgramUniform4i');
  glProgramUniform4iv := dglGetProcAddress('glProgramUniform4iv');
  glProgramUniform4f := dglGetProcAddress('glProgramUniform4f');
  glProgramUniform4fv := dglGetProcAddress('glProgramUniform4fv');
  glProgramUniform4d := dglGetProcAddress('glProgramUniform4d');
  glProgramUniform4dv := dglGetProcAddress('glProgramUniform4dv');
  glProgramUniform4ui := dglGetProcAddress('glProgramUniform4ui');
  glProgramUniform4uiv := dglGetProcAddress('glProgramUniform4uiv');
  glProgramUniformMatrix2fv := dglGetProcAddress('glProgramUniformMatrix2fv');
  glProgramUniformMatrix3fv := dglGetProcAddress('glProgramUniformMatrix3fv');
  glProgramUniformMatrix4fv := dglGetProcAddress('glProgramUniformMatrix4fv');
  glProgramUniformMatrix2dv := dglGetProcAddress('glProgramUniformMatrix2dv');
  glProgramUniformMatrix3dv := dglGetProcAddress('glProgramUniformMatrix3dv');
  glProgramUniformMatrix4dv := dglGetProcAddress('glProgramUniformMatrix4dv');
  glProgramUniformMatrix2x3fv := dglGetProcAddress('glProgramUniformMatrix2x3fv');
  glProgramUniformMatrix3x2fv := dglGetProcAddress('glProgramUniformMatrix3x2fv');
  glProgramUniformMatrix2x4fv := dglGetProcAddress('glProgramUniformMatrix2x4fv');
  glProgramUniformMatrix4x2fv := dglGetProcAddress('glProgramUniformMatrix4x2fv');
  glProgramUniformMatrix3x4fv := dglGetProcAddress('glProgramUniformMatrix3x4fv');
  glProgramUniformMatrix4x3fv := dglGetProcAddress('glProgramUniformMatrix4x3fv');
  glProgramUniformMatrix2x3dv := dglGetProcAddress('glProgramUniformMatrix2x3dv');
  glProgramUniformMatrix3x2dv := dglGetProcAddress('glProgramUniformMatrix3x2dv');
  glProgramUniformMatrix2x4dv := dglGetProcAddress('glProgramUniformMatrix2x4dv');
  glProgramUniformMatrix4x2dv := dglGetProcAddress('glProgramUniformMatrix4x2dv');
  glProgramUniformMatrix3x4dv := dglGetProcAddress('glProgramUniformMatrix3x4dv');
  glProgramUniformMatrix4x3dv := dglGetProcAddress('glProgramUniformMatrix4x3dv');
  glValidateProgramPipeline := dglGetProcAddress('glValidateProgramPipeline');
  glGetProgramPipelineInfoLog := dglGetProcAddress('glGetProgramPipelineInfoLog');
end;

procedure Read_GL_ARB_vertex_attrib_64bit;
begin
  glVertexAttribL1d := dglGetProcAddress('glVertexAttribL1d');
  glVertexAttribL2d := dglGetProcAddress('glVertexAttribL2d');
  glVertexAttribL3d := dglGetProcAddress('glVertexAttribL3d');
  glVertexAttribL4d := dglGetProcAddress('glVertexAttribL4d');
  glVertexAttribL1dv := dglGetProcAddress('glVertexAttribL1dv');
  glVertexAttribL2dv := dglGetProcAddress('glVertexAttribL2dv');
  glVertexAttribL3dv := dglGetProcAddress('glVertexAttribL3dv');
  glVertexAttribL4dv := dglGetProcAddress('glVertexAttribL4dv');
  glVertexAttribLPointer := dglGetProcAddress('glVertexAttribLPointer');
  glGetVertexAttribLdv := dglGetProcAddress('glGetVertexAttribLdv');
end;

procedure Read_GL_ARB_viewport_array;
begin
  glViewportArrayv := dglGetProcAddress('glViewportArrayv');
  glViewportIndexedf := dglGetProcAddress('glViewportIndexedf');
  glViewportIndexedfv := dglGetProcAddress('glViewportIndexedfv');
  glScissorArrayv := dglGetProcAddress('glScissorArrayv');
  glScissorIndexed := dglGetProcAddress('glScissorIndexed');
  glScissorIndexedv := dglGetProcAddress('glScissorIndexedv');
  glDepthRangeArrayv := dglGetProcAddress('glDepthRangeArrayv');
  glDepthRangeIndexed := dglGetProcAddress('glDepthRangeIndexed');
  glGetFloati_v := dglGetProcAddress('glGetFloati_v');
  glGetDoublei_v := dglGetProcAddress('glGetDoublei_v');
end;

procedure Read_GL_ARB_cl_event;
begin
  glCreateSyncFromCLeventARB := dglGetProcAddress('glCreateSyncFromCLeventARB');
end;

procedure Read_GL_ARB_debug_output;
begin
  glDebugMessageControlARB := dglGetProcAddress('glDebugMessageControlARB');
  glDebugMessageInsertARB := dglGetProcAddress('glDebugMessageInsertARB');
  glDebugMessageCallbackARB := dglGetProcAddress('glDebugMessageCallbackARB');
  glGetDebugMessageLogARB := dglGetProcAddress('glGetDebugMessageLogARB');
end;

procedure Read_GL_ARB_robustness;
begin
  glGetGraphicsResetStatusARB := dglGetProcAddress('glGetGraphicsResetStatusARB');
  glGetnMapdvARB := dglGetProcAddress('glGetnMapdvARB');
  glGetnMapfvARB := dglGetProcAddress('glGetnMapfvARB');
  glGetnMapivARB := dglGetProcAddress('glGetnMapivARB');
  glGetnPixelMapfvARB := dglGetProcAddress('glGetnPixelMapfvARB');
  glGetnPixelMapuivARB := dglGetProcAddress('glGetnPixelMapuivARB');
  glGetnPixelMapusvARB := dglGetProcAddress('glGetnPixelMapusvARB');
  glGetnPolygonStippleARB := dglGetProcAddress('glGetnPolygonStippleARB');
  glGetnColorTableARB := dglGetProcAddress('glGetnColorTableARB');
  glGetnConvolutionFilterARB := dglGetProcAddress('glGetnConvolutionFilterARB');
  glGetnSeparableFilterARB := dglGetProcAddress('glGetnSeparableFilterARB');
  glGetnHistogramARB := dglGetProcAddress('glGetnHistogramARB');
  glGetnMinmaxARB := dglGetProcAddress('glGetnMinmaxARB');
  glGetnTexImageARB := dglGetProcAddress('glGetnTexImageARB');
  glReadnPixelsARB := dglGetProcAddress('glReadnPixelsARB');
  glGetnCompressedTexImageARB := dglGetProcAddress('glGetnCompressedTexImageARB');
  glGetnUniformfvARB := dglGetProcAddress('glGetnUniformfvARB');
  glGetnUniformivARB := dglGetProcAddress('glGetnUniformivARB');
  glGetnUniformuivARB := dglGetProcAddress('glGetnUniformuivARB');
  glGetnUniformdvARB := dglGetProcAddress('glGetnUniformdvARB');
end;
  
procedure Read_GL_ATI_draw_buffers;
begin
  glDrawBuffersATI := dglGetProcAddress('glDrawBuffersATI');
end;

procedure Read_GL_ATI_element_array;
begin
  glElementPointerATI := dglGetProcAddress('glElementPointerATI');
  glDrawElementArrayATI := dglGetProcAddress('glDrawElementArrayATI');
  glDrawRangeElementArrayATI := dglGetProcAddress('glDrawRangeElementArrayATI');
end;

procedure Read_GL_ATI_envmap_bumpmap;
begin
  glTexBumpParameterivATI := dglGetProcAddress('glTexBumpParameterivATI');
  glTexBumpParameterfvATI := dglGetProcAddress('glTexBumpParameterfvATI');
  glGetTexBumpParameterivATI := dglGetProcAddress('glGetTexBumpParameterivATI');
  glGetTexBumpParameterfvATI := dglGetProcAddress('glGetTexBumpParameterfvATI');
end;

procedure Read_GL_ATI_fragment_shader;
begin
  glGenFragmentShadersATI := dglGetProcAddress('glGenFragmentShadersATI');
  glBindFragmentShaderATI := dglGetProcAddress('glBindFragmentShaderATI');
  glDeleteFragmentShaderATI := dglGetProcAddress('glDeleteFragmentShaderATI');
  glBeginFragmentShaderATI := dglGetProcAddress('glBeginFragmentShaderATI');
  glEndFragmentShaderATI := dglGetProcAddress('glEndFragmentShaderATI');
  glPassTexCoordATI := dglGetProcAddress('glPassTexCoordATI');
  glSampleMapATI := dglGetProcAddress('glSampleMapATI');
  glColorFragmentOp1ATI := dglGetProcAddress('glColorFragmentOp1ATI');
  glColorFragmentOp2ATI := dglGetProcAddress('glColorFragmentOp2ATI');
  glColorFragmentOp3ATI := dglGetProcAddress('glColorFragmentOp3ATI');
  glAlphaFragmentOp1ATI := dglGetProcAddress('glAlphaFragmentOp1ATI');
  glAlphaFragmentOp2ATI := dglGetProcAddress('glAlphaFragmentOp2ATI');
  glAlphaFragmentOp3ATI := dglGetProcAddress('glAlphaFragmentOp3ATI');
  glSetFragmentShaderConstantATI := dglGetProcAddress('glSetFragmentShaderConstantATI');
end;

procedure Read_GL_ATI_map_object_buffer;
begin
  glMapObjectBufferATI := dglGetProcAddress('glMapObjectBufferATI');
  glUnmapObjectBufferATI := dglGetProcAddress('glUnmapObjectBufferATI');
end;

procedure Read_GL_ATI_pn_triangles;
begin
  glPNTrianglesiATI := dglGetProcAddress('glPNTrianglesiATI');
  glPNTrianglesfATI := dglGetProcAddress('glPNTrianglesfATI');
end;

procedure Read_GL_ATI_separate_stencil;
begin
  glStencilOpSeparateATI := dglGetProcAddress('glStencilOpSeparateATI');
  glStencilFuncSeparateATI := dglGetProcAddress('glStencilFuncSeparateATI');
end;

procedure Read_GL_ATI_vertex_array_object;
begin
  glNewObjectBufferATI := dglGetProcAddress('glNewObjectBufferATI');
  glIsObjectBufferATI := dglGetProcAddress('glIsObjectBufferATI');
  glUpdateObjectBufferATI := dglGetProcAddress('glUpdateObjectBufferATI');
  glGetObjectBufferfvATI := dglGetProcAddress('glGetObjectBufferfvATI');
  glGetObjectBufferivATI := dglGetProcAddress('glGetObjectBufferivATI');
  glFreeObjectBufferATI := dglGetProcAddress('glFreeObjectBufferATI');
  glArrayObjectATI := dglGetProcAddress('glArrayObjectATI');
  glGetArrayObjectfvATI := dglGetProcAddress('glGetArrayObjectfvATI');
  glGetArrayObjectivATI := dglGetProcAddress('glGetArrayObjectivATI');
  glVariantArrayObjectATI := dglGetProcAddress('glVariantArrayObjectATI');
  glGetVariantArrayObjectfvATI := dglGetProcAddress('glGetVariantArrayObjectfvATI');
  glGetVariantArrayObjectivATI := dglGetProcAddress('glGetVariantArrayObjectivATI');

end;

procedure Read_GL_ATI_vertex_attrib_array_object;
begin
  glVertexAttribArrayObjectATI := dglGetProcAddress('glVertexAttribArrayObjectATI');
  glGetVertexAttribArrayObjectfvATI := dglGetProcAddress('glGetVertexAttribArrayObjectfvATI');
  glGetVertexAttribArrayObjectivATI := dglGetProcAddress('glGetVertexAttribArrayObjectivATI');
end;

procedure Read_GL_ATI_vertex_streams;
begin
  glVertexStream1sATI := dglGetProcAddress('glVertexStream1sATI');
  glVertexStream1svATI := dglGetProcAddress('glVertexStream1svATI');
  glVertexStream1iATI := dglGetProcAddress('glVertexStream1iATI');
  glVertexStream1ivATI := dglGetProcAddress('glVertexStream1ivATI');
  glVertexStream1fATI := dglGetProcAddress('glVertexStream1fATI');
  glVertexStream1fvATI := dglGetProcAddress('glVertexStream1fvATI');
  glVertexStream1dATI := dglGetProcAddress('glVertexStream1dATI');
  glVertexStream1dvATI := dglGetProcAddress('glVertexStream1dvATI');
  glVertexStream2sATI := dglGetProcAddress('glVertexStream2sATI');
  glVertexStream2svATI := dglGetProcAddress('glVertexStream2svATI');
  glVertexStream2iATI := dglGetProcAddress('glVertexStream2iATI');
  glVertexStream2ivATI := dglGetProcAddress('glVertexStream2ivATI');
  glVertexStream2fATI := dglGetProcAddress('glVertexStream2fATI');
  glVertexStream2fvATI := dglGetProcAddress('glVertexStream2fvATI');
  glVertexStream2dATI := dglGetProcAddress('glVertexStream2dATI');
  glVertexStream2dvATI := dglGetProcAddress('glVertexStream2dvATI');
  glVertexStream3sATI := dglGetProcAddress('glVertexStream3sATI');
  glVertexStream3svATI := dglGetProcAddress('glVertexStream3svATI');
  glVertexStream3iATI := dglGetProcAddress('glVertexStream3iATI');
  glVertexStream3ivATI := dglGetProcAddress('glVertexStream3ivATI');
  glVertexStream3fATI := dglGetProcAddress('glVertexStream3fATI');
  glVertexStream3fvATI := dglGetProcAddress('glVertexStream3fvATI');
  glVertexStream3dATI := dglGetProcAddress('glVertexStream3dATI');
  glVertexStream3dvATI := dglGetProcAddress('glVertexStream3dvATI');
  glVertexStream4sATI := dglGetProcAddress('glVertexStream4sATI');
  glVertexStream4svATI := dglGetProcAddress('glVertexStream4svATI');
  glVertexStream4iATI := dglGetProcAddress('glVertexStream4iATI');
  glVertexStream4ivATI := dglGetProcAddress('glVertexStream4ivATI');
  glVertexStream4fATI := dglGetProcAddress('glVertexStream4fATI');
  glVertexStream4fvATI := dglGetProcAddress('glVertexStream4fvATI');
  glVertexStream4dATI := dglGetProcAddress('glVertexStream4dATI');
  glVertexStream4dvATI := dglGetProcAddress('glVertexStream4dvATI');
  glNormalStream3bATI := dglGetProcAddress('glNormalStream3bATI');
  glNormalStream3bvATI := dglGetProcAddress('glNormalStream3bvATI');
  glNormalStream3sATI := dglGetProcAddress('glNormalStream3sATI');
  glNormalStream3svATI := dglGetProcAddress('glNormalStream3svATI');
  glNormalStream3iATI := dglGetProcAddress('glNormalStream3iATI');
  glNormalStream3ivATI := dglGetProcAddress('glNormalStream3ivATI');
  glNormalStream3fATI := dglGetProcAddress('glNormalStream3fATI');
  glNormalStream3fvATI := dglGetProcAddress('glNormalStream3fvATI');
  glNormalStream3dATI := dglGetProcAddress('glNormalStream3dATI');
  glNormalStream3dvATI := dglGetProcAddress('glNormalStream3dvATI');
  glClientActiveVertexStreamATI := dglGetProcAddress('glClientActiveVertexStreamATI');
  glVertexBlendEnviATI := dglGetProcAddress('glVertexBlendEnviATI');
  glVertexBlendEnvfATI := dglGetProcAddress('glVertexBlendEnvfATI');
end;

procedure Read_GL_AMD_performance_monitor;
begin
  glGetPerfMonitorGroupsAMD := dglGetProcAddress('glGetPerfMonitorGroupsAMD');
  glGetPerfMonitorCountersAMD := dglGetProcAddress('glGetPerfMonitorCountersAMD');
  glGetPerfMonitorGroupStringAMD := dglGetProcAddress('glGetPerfMonitorGroupStringAMD');
  glGetPerfMonitorCounterStringAMD := dglGetProcAddress('glGetPerfMonitorCounterStringAMD');
  glGetPerfMonitorCounterInfoAMD := dglGetProcAddress('glGetPerfMonitorCounterInfoAMD');
  glGenPerfMonitorsAMD := dglGetProcAddress('glGenPerfMonitorsAMD');
  glDeletePerfMonitorsAMD := dglGetProcAddress('glDeletePerfMonitorsAMD');
  glSelectPerfMonitorCountersAMD := dglGetProcAddress('glSelectPerfMonitorCountersAMD');
  glBeginPerfMonitorAMD := dglGetProcAddress('glBeginPerfMonitorAMD');
  glEndPerfMonitorAMD := dglGetProcAddress('glEndPerfMonitorAMD');
  glGetPerfMonitorCounterDataAMD := dglGetProcAddress('glGetPerfMonitorCounterDataAMD');
end;

procedure Read_GL_AMD_vertex_shader_tesselator;
begin
  glTessellationFactorAMD := dglGetProcAddress('glTessellationFactorAMD');
  glTessellationModeAMD := dglGetProcAddress('glTessellationModeAMD');
end;

procedure Read_GL_AMD_draw_buffers_blend;
begin
  glBlendFuncIndexedAMD := dglGetProcAddress('glBlendFuncIndexedAMD');
  glBlendFuncSeparateIndexedAMD := dglGetProcAddress('glBlendFuncSeparateIndexedAMD');
  glBlendEquationIndexedAMD := dglGetProcAddress('glBlendEquationIndexedAMD');
  glBlendEquationSeparateIndexedAMD := dglGetProcAddress('glBlendEquationSeparateIndexedAMD');
end;

procedure Read_GL_AMD_name_gen_delete;
begin
  glGenNamesAMD := dglGetProcAddress('glGenNamesAMD');
  glDeleteNamesAMD := dglGetProcAddress('glDeleteNamesAMD');
  glIsNameAMD := dglGetProcAddress('glIsNameAMD');
end;

procedure Read_GL_AMD_debug_output;
begin
  glDebugMessageEnableAMD := dglGetProcAddress('glDebugMessageEnableAMD');
  glDebugMessageInsertAMD := dglGetProcAddress('glDebugMessageInsertAMD');
  glDebugMessageCallbackAMD := dglGetProcAddress('glDebugMessageCallbackAMD');
  glGetDebugMessageLogAMD := dglGetProcAddress('glGetDebugMessageLogAMD');
end;
 
procedure Read_GL_EXT_blend_color;
begin
  glBlendColorEXT := dglGetProcAddress('glBlendColorEXT');
end;

procedure Read_GL_EXT_blend_func_separate;
begin
  glBlendFuncSeparateEXT := dglGetProcAddress('glBlendFuncSeparateEXT');
end;

procedure Read_GL_EXT_blend_minmax;
begin
  glBlendEquationEXT := dglGetProcAddress('glBlendEquationEXT');
end;

procedure Read_GL_EXT_color_subtable;
begin
  glColorSubTableEXT := dglGetProcAddress('glColorSubTableEXT');
  glCopyColorSubTableEXT := dglGetProcAddress('glCopyColorSubTableEXT');
end;

procedure Read_GL_EXT_compiled_vertex_array;
begin
  glLockArraysEXT := dglGetProcAddress('glLockArraysEXT');
  glUnlockArraysEXT := dglGetProcAddress('glUnlockArraysEXT');
end;

procedure Read_GL_EXT_convolution;
begin
  glConvolutionFilter1DEXT := dglGetProcAddress('glConvolutionFilter1DEXT');
  glConvolutionFilter2DEXT := dglGetProcAddress('glConvolutionFilter2DEXT');
  glConvolutionParameterfEXT := dglGetProcAddress('glConvolutionParameterfEXT');
  glConvolutionParameterfvEXT := dglGetProcAddress('glConvolutionParameterfvEXT');
  glConvolutionParameteriEXT := dglGetProcAddress('glConvolutionParameteriEXT');
  glConvolutionParameterivEXT := dglGetProcAddress('glConvolutionParameterivEXT');
  glCopyConvolutionFilter1DEXT := dglGetProcAddress('glCopyConvolutionFilter1DEXT');
  glCopyConvolutionFilter2DEXT := dglGetProcAddress('glCopyConvolutionFilter2DEXT');
  glGetConvolutionFilterEXT := dglGetProcAddress('glGetConvolutionFilterEXT');
  glGetConvolutionParameterfvEXT := dglGetProcAddress('glGetConvolutionParameterfvEXT');
  glGetConvolutionParameterivEXT := dglGetProcAddress('glGetConvolutionParameterivEXT');
  glGetSeparableFilterEXT := dglGetProcAddress('glGetSeparableFilterEXT');
  glSeparableFilter2DEXT := dglGetProcAddress('glSeparableFilter2DEXT');
end;

procedure Read_GL_EXT_coordinate_frame;
begin
  glTangent3bEXT := dglGetProcAddress('glTangent3bEXT');
  glTangent3bvEXT := dglGetProcAddress('glTangent3bvEXT');
  glTangent3dEXT := dglGetProcAddress('glTangent3dEXT');
  glTangent3dvEXT := dglGetProcAddress('glTangent3dvEXT');
  glTangent3fEXT := dglGetProcAddress('glTangent3fEXT');
  glTangent3fvEXT := dglGetProcAddress('glTangent3fvEXT');
  glTangent3iEXT := dglGetProcAddress('glTangent3iEXT');
  glTangent3ivEXT := dglGetProcAddress('glTangent3ivEXT');
  glTangent3sEXT := dglGetProcAddress('glTangent3sEXT');
  glTangent3svEXT := dglGetProcAddress('glTangent3svEXT');
  glBinormal3bEXT := dglGetProcAddress('glBinormal3bEXT');
  glBinormal3bvEXT := dglGetProcAddress('glBinormal3bvEXT');
  glBinormal3dEXT := dglGetProcAddress('glBinormal3dEXT');
  glBinormal3dvEXT := dglGetProcAddress('glBinormal3dvEXT');
  glBinormal3fEXT := dglGetProcAddress('glBinormal3fEXT');
  glBinormal3fvEXT := dglGetProcAddress('glBinormal3fvEXT');
  glBinormal3iEXT := dglGetProcAddress('glBinormal3iEXT');
  glBinormal3ivEXT := dglGetProcAddress('glBinormal3ivEXT');
  glBinormal3sEXT := dglGetProcAddress('glBinormal3sEXT');
  glBinormal3svEXT := dglGetProcAddress('glBinormal3svEXT');
  glTangentPointerEXT := dglGetProcAddress('glTangentPointerEXT');
  glBinormalPointerEXT := dglGetProcAddress('glBinormalPointerEXT');
end;

procedure Read_GL_EXT_copy_texture;
begin
  glCopyTexImage1DEXT := dglGetProcAddress('glCopyTexImage1DEXT');
  glCopyTexImage2DEXT := dglGetProcAddress('glCopyTexImage2DEXT');
  glCopyTexSubImage1DEXT := dglGetProcAddress('glCopyTexSubImage1DEXT');
  glCopyTexSubImage2DEXT := dglGetProcAddress('glCopyTexSubImage2DEXT');
  glCopyTexSubImage3DEXT := dglGetProcAddress('glCopyTexSubImage3DEXT');
end;

procedure Read_GL_EXT_cull_vertex;
begin
  glCullParameterdvEXT := dglGetProcAddress('glCullParameterdvEXT');
  glCullParameterfvEXT := dglGetProcAddress('glCullParameterfvEXT');
end;

procedure Read_GL_EXT_draw_range_elements;
begin
  glDrawRangeElementsEXT := dglGetProcAddress('glDrawRangeElementsEXT');
end;

procedure Read_GL_EXT_fog_coord;
begin
  glFogCoordfEXT := dglGetProcAddress('glFogCoordfEXT');
  glFogCoordfvEXT := dglGetProcAddress('glFogCoordfvEXT');
  glFogCoorddEXT := dglGetProcAddress('glFogCoorddEXT');
  glFogCoorddvEXT := dglGetProcAddress('glFogCoorddvEXT');
  glFogCoordPointerEXT := dglGetProcAddress('glFogCoordPointerEXT');
end;

procedure Read_GL_EXT_framebuffer_object;
begin
  glIsRenderbufferEXT := dglGetProcAddress('glIsRenderbufferEXT');
  glBindRenderbufferEXT := dglGetProcAddress('glBindRenderbufferEXT');
  glDeleteRenderbuffersEXT := dglGetProcAddress('glDeleteRenderbuffersEXT');
  glGenRenderbuffersEXT := dglGetProcAddress('glGenRenderbuffersEXT');
  glRenderbufferStorageEXT := dglGetProcAddress('glRenderbufferStorageEXT');
  glGetRenderbufferParameterivEXT := dglGetProcAddress('glGetRenderbufferParameterivEXT');
  glIsFramebufferEXT := dglGetProcAddress('glIsFramebufferEXT');
  glBindFramebufferEXT := dglGetProcAddress('glBindFramebufferEXT');
  glDeleteFramebuffersEXT := dglGetProcAddress('glDeleteFramebuffersEXT');
  glGenFramebuffersEXT := dglGetProcAddress('glGenFramebuffersEXT');
  glCheckFramebufferStatusEXT := dglGetProcAddress('glCheckFramebufferStatusEXT');
  glFramebufferTexture1DEXT := dglGetProcAddress('glFramebufferTexture1DEXT');
  glFramebufferTexture2DEXT := dglGetProcAddress('glFramebufferTexture2DEXT');
  glFramebufferTexture3DEXT := dglGetProcAddress('glFramebufferTexture3DEXT');
  glFramebufferRenderbufferEXT := dglGetProcAddress('glFramebufferRenderbufferEXT');
  glGetFramebufferAttachmentParameterivEXT := dglGetProcAddress('glGetFramebufferAttachmentParameterivEXT');
  glGenerateMipmapEXT := dglGetProcAddress('glGenerateMipmapEXT');
end;

procedure Read_GL_EXT_histogram;
begin
  glGetHistogramEXT := dglGetProcAddress('glGetHistogramEXT');
  glGetHistogramParameterfvEXT := dglGetProcAddress('glGetHistogramParameterfvEXT');
  glGetHistogramParameterivEXT := dglGetProcAddress('glGetHistogramParameterivEXT');
  glGetMinmaxEXT := dglGetProcAddress('glGetMinmaxEXT');
  glGetMinmaxParameterfvEXT := dglGetProcAddress('glGetMinmaxParameterfvEXT');
  glGetMinmaxParameterivEXT := dglGetProcAddress('glGetMinmaxParameterivEXT');
  glHistogramEXT := dglGetProcAddress('glHistogramEXT');
  glMinmaxEXT := dglGetProcAddress('glMinmaxEXT');
  glResetHistogramEXT := dglGetProcAddress('glResetHistogramEXT');
  glResetMinmaxEXT := dglGetProcAddress('glResetMinmaxEXT');
end;

procedure Read_GL_EXT_index_func;
begin
  glIndexFuncEXT := dglGetProcAddress('glIndexFuncEXT');
end;

procedure Read_GL_EXT_index_material;
begin
  glIndexMaterialEXT := dglGetProcAddress('glIndexMaterialEXT');
end;

procedure Read_GL_EXT_light_texture;
begin
  glApplyTextureEXT := dglGetProcAddress('glApplyTextureEXT');
  glTextureLightEXT := dglGetProcAddress('glTextureLightEXT');
  glTextureMaterialEXT := dglGetProcAddress('glTextureMaterialEXT');
end;

procedure Read_GL_EXT_multi_draw_arrays;
begin
  glMultiDrawArraysEXT := dglGetProcAddress('glMultiDrawArraysEXT');
  glMultiDrawElementsEXT := dglGetProcAddress('glMultiDrawElementsEXT');
end;

procedure Read_GL_EXT_multisample;
begin
  glSampleMaskEXT := dglGetProcAddress('glSampleMaskEXT');
  glSamplePatternEXT := dglGetProcAddress('glSamplePatternEXT');
end;

procedure Read_GL_EXT_paletted_texture;
begin
  glColorTableEXT := dglGetProcAddress('glColorTableEXT');
  glGetColorTableEXT := dglGetProcAddress('glGetColorTableEXT');
  glGetColorTableParameterivEXT := dglGetProcAddress('glGetColorTableParameterivEXT');
  glGetColorTableParameterfvEXT := dglGetProcAddress('glGetColorTableParameterfvEXT');
end;

procedure Read_GL_EXT_pixel_transform;
begin
  glPixelTransformParameteriEXT := dglGetProcAddress('glPixelTransformParameteriEXT');
  glPixelTransformParameterfEXT := dglGetProcAddress('glPixelTransformParameterfEXT');
  glPixelTransformParameterivEXT := dglGetProcAddress('glPixelTransformParameterivEXT');
  glPixelTransformParameterfvEXT := dglGetProcAddress('glPixelTransformParameterfvEXT');
end;

procedure Read_GL_EXT_point_parameters;
begin
  glPointParameterfEXT := dglGetProcAddress('glPointParameterfEXT');
  glPointParameterfvEXT := dglGetProcAddress('glPointParameterfvEXT');
end;

procedure Read_GL_EXT_polygon_offset;
begin
  glPolygonOffsetEXT := dglGetProcAddress('glPolygonOffsetEXT');
end;

procedure Read_GL_EXT_secondary_color;
begin
  glSecondaryColor3bEXT := dglGetProcAddress('glSecondaryColor3bEXT');
  glSecondaryColor3bvEXT := dglGetProcAddress('glSecondaryColor3bvEXT');
  glSecondaryColor3dEXT := dglGetProcAddress('glSecondaryColor3dEXT');
  glSecondaryColor3dvEXT := dglGetProcAddress('glSecondaryColor3dvEXT');
  glSecondaryColor3fEXT := dglGetProcAddress('glSecondaryColor3fEXT');
  glSecondaryColor3fvEXT := dglGetProcAddress('glSecondaryColor3fvEXT');
  glSecondaryColor3iEXT := dglGetProcAddress('glSecondaryColor3iEXT');
  glSecondaryColor3ivEXT := dglGetProcAddress('glSecondaryColor3ivEXT');
  glSecondaryColor3sEXT := dglGetProcAddress('glSecondaryColor3sEXT');
  glSecondaryColor3svEXT := dglGetProcAddress('glSecondaryColor3svEXT');
  glSecondaryColor3ubEXT := dglGetProcAddress('glSecondaryColor3ubEXT');
  glSecondaryColor3ubvEXT := dglGetProcAddress('glSecondaryColor3ubvEXT');
  glSecondaryColor3uiEXT := dglGetProcAddress('glSecondaryColor3uiEXT');
  glSecondaryColor3uivEXT := dglGetProcAddress('glSecondaryColor3uivEXT');
  glSecondaryColor3usEXT := dglGetProcAddress('glSecondaryColor3usEXT');
  glSecondaryColor3usvEXT := dglGetProcAddress('glSecondaryColor3usvEXT');
  glSecondaryColorPointerEXT := dglGetProcAddress('glSecondaryColorPointerEXT');
end;

procedure Read_GL_EXT_stencil_two_side;
begin
  glActiveStencilFaceEXT := dglGetProcAddress('glActiveStencilFaceEXT');
end;

procedure Read_GL_EXT_subtexture;
begin
  glTexSubImage1DEXT := dglGetProcAddress('glTexSubImage1DEXT');
  glTexSubImage2DEXT := dglGetProcAddress('glTexSubImage2DEXT');
end;

procedure Read_GL_EXT_texture3D;
begin
  glTexImage3DEXT := dglGetProcAddress('glTexImage3DEXT');
  glTexSubImage3DEXT := dglGetProcAddress('glTexSubImage3DEXT');
end;

procedure Read_GL_EXT_texture_object;
begin
  glAreTexturesResidentEXT := dglGetProcAddress('glAreTexturesResidentEXT');
  glBindTextureEXT := dglGetProcAddress('glBindTextureEXT');
  glDeleteTexturesEXT := dglGetProcAddress('glDeleteTexturesEXT');
  glGenTexturesEXT := dglGetProcAddress('glGenTexturesEXT');
  glIsTextureEXT := dglGetProcAddress('glIsTextureEXT');
  glPrioritizeTexturesEXT := dglGetProcAddress('glPrioritizeTexturesEXT');
end;

procedure Read_GL_EXT_texture_perturb_normal;
begin
  glTextureNormalEXT := dglGetProcAddress('glTextureNormalEXT');
end;

procedure Read_GL_EXT_vertex_array;
begin
  glArrayElementEXT := dglGetProcAddress('glArrayElementEXT');
  glColorPointerEXT := dglGetProcAddress('glColorPointerEXT');
  glDrawArraysEXT := dglGetProcAddress('glDrawArraysEXT');
  glEdgeFlagPointerEXT := dglGetProcAddress('glEdgeFlagPointerEXT');
  glGetPointervEXT := dglGetProcAddress('glGetPointervEXT');
  glIndexPointerEXT := dglGetProcAddress('glIndexPointerEXT');
  glNormalPointerEXT := dglGetProcAddress('glNormalPointerEXT');
  glTexCoordPointerEXT := dglGetProcAddress('glTexCoordPointerEXT');
  glVertexPointerEXT := dglGetProcAddress('glVertexPointerEXT');
end;

procedure Read_GL_EXT_vertex_shader;
begin
  glBeginVertexShaderEXT := dglGetProcAddress('glBeginVertexShaderEXT');
  glEndVertexShaderEXT := dglGetProcAddress('glEndVertexShaderEXT');
  glBindVertexShaderEXT := dglGetProcAddress('glBindVertexShaderEXT');
  glGenVertexShadersEXT := dglGetProcAddress('glGenVertexShadersEXT');
  glDeleteVertexShaderEXT := dglGetProcAddress('glDeleteVertexShaderEXT');
  glShaderOp1EXT := dglGetProcAddress('glShaderOp1EXT');
  glShaderOp2EXT := dglGetProcAddress('glShaderOp2EXT');
  glShaderOp3EXT := dglGetProcAddress('glShaderOp3EXT');
  glSwizzleEXT := dglGetProcAddress('glSwizzleEXT');
  glWriteMaskEXT := dglGetProcAddress('glWriteMaskEXT');
  glInsertComponentEXT := dglGetProcAddress('glInsertComponentEXT');
  glExtractComponentEXT := dglGetProcAddress('glExtractComponentEXT');
  glGenSymbolsEXT := dglGetProcAddress('glGenSymbolsEXT');
  glSetInvariantEXT := dglGetProcAddress('glSetInvariantEXT');
  glSetLocalConstantEXT := dglGetProcAddress('glSetLocalConstantEXT');
  glVariantbvEXT := dglGetProcAddress('glVariantbvEXT');
  glVariantsvEXT := dglGetProcAddress('glVariantsvEXT');
  glVariantivEXT := dglGetProcAddress('glVariantivEXT');
  glVariantfvEXT := dglGetProcAddress('glVariantfvEXT');
  glVariantdvEXT := dglGetProcAddress('glVariantdvEXT');
  glVariantubvEXT := dglGetProcAddress('glVariantubvEXT');
  glVariantusvEXT := dglGetProcAddress('glVariantusvEXT');
  glVariantuivEXT := dglGetProcAddress('glVariantuivEXT');
  glVariantPointerEXT := dglGetProcAddress('glVariantPointerEXT');
  glEnableVariantClientStateEXT := dglGetProcAddress('glEnableVariantClientStateEXT');
  glDisableVariantClientStateEXT := dglGetProcAddress('glDisableVariantClientStateEXT');
  glBindLightParameterEXT := dglGetProcAddress('glBindLightParameterEXT');
  glBindMaterialParameterEXT := dglGetProcAddress('glBindMaterialParameterEXT');
  glBindTexGenParameterEXT := dglGetProcAddress('glBindTexGenParameterEXT');
  glBindTextureUnitParameterEXT := dglGetProcAddress('glBindTextureUnitParameterEXT');
  glBindParameterEXT := dglGetProcAddress('glBindParameterEXT');
  glIsVariantEnabledEXT := dglGetProcAddress('glIsVariantEnabledEXT');
  glGetVariantBooleanvEXT := dglGetProcAddress('glGetVariantBooleanvEXT');
  glGetVariantIntegervEXT := dglGetProcAddress('glGetVariantIntegervEXT');
  glGetVariantFloatvEXT := dglGetProcAddress('glGetVariantFloatvEXT');
  glGetVariantPointervEXT := dglGetProcAddress('glGetVariantPointervEXT');
  glGetInvariantBooleanvEXT := dglGetProcAddress('glGetInvariantBooleanvEXT');
  glGetInvariantIntegervEXT := dglGetProcAddress('glGetInvariantIntegervEXT');
  glGetInvariantFloatvEXT := dglGetProcAddress('glGetInvariantFloatvEXT');
  glGetLocalConstantBooleanvEXT := dglGetProcAddress('glGetLocalConstantBooleanvEXT');
  glGetLocalConstantIntegervEXT := dglGetProcAddress('glGetLocalConstantIntegervEXT');
  glGetLocalConstantFloatvEXT := dglGetProcAddress('glGetLocalConstantFloatvEXT');
end;

procedure Read_GL_EXT_vertex_weighting;
begin
  glVertexWeightfEXT := dglGetProcAddress('glVertexWeightfEXT');
  glVertexWeightfvEXT := dglGetProcAddress('glVertexWeightfvEXT');
  glVertexWeightPointerEXT := dglGetProcAddress('glVertexWeightPointerEXT');
end;

procedure Read_GL_EXT_depth_bounds_test;
begin
  glImageTransformParameteriHP := dglGetProcAddress('glImageTransformParameteriHP');
  glDepthBoundsEXT := dglGetProcAddress('glDepthBoundsEXT');
end;

procedure Read_GL_EXT_blend_equation_separate;
begin
  glBlendEquationSeparateEXT := dglGetProcAddress('glBlendEquationSeparateEXT');
end;

procedure Read_GL_EXT_stencil_clear_tag;
begin
  glStencilClearTagEXT := dglGetProcAddress('glStencilClearTagEXT');
end;

procedure Read_GL_EXT_framebuffer_blit;
begin
  glBlitFramebufferEXT := dglGetProcAddress('glBlitFramebufferEXT');
end;

procedure Read_GL_EXT_framebuffer_multisample;
begin
  glRenderbufferStorageMultisampleEXT := dglGetProcAddress('glRenderbufferStorageMultisampleEXT');
end;

procedure Read_GL_EXT_timer_query;
begin
  glGetQueryObjecti64vEXT := dglGetProcAddress('glGetQueryObjecti64vEXT');
  glGetQueryObjectui64vEXT := dglGetProcAddress('glGetQueryObjectui64vEXT');
end;

procedure Read_GL_EXT_gpu_program_parameters;
begin
  glProgramEnvParameters4fvEXT := dglGetProcAddress('glProgramEnvParameters4fvEXT');
  glProgramLocalParameters4fvEXT := dglGetProcAddress('glProgramLocalParameters4fvEXT');
end;

procedure Read_GL_EXT_bindable_uniform;
begin
  glUniformBufferEXT := dglGetProcAddress('glUniformBufferEXT');
  glGetUniformBufferSizeEXT := dglGetProcAddress('glGetUniformBufferSizeEXT');
  glGetUniformOffsetEXT := dglGetProcAddress('glGetUniformOffsetEXT');
end;

procedure Read_GL_EXT_draw_buffers2;
begin
  glColorMaskIndexedEXT := dglGetProcAddress('glColorMaskIndexedEXT');
  glGetBooleanIndexedvEXT := dglGetProcAddress('glGetBooleanIndexedvEXT');
  glGetIntegerIndexedvEXT := dglGetProcAddress('glGetIntegerIndexedvEXT');
  glEnableIndexedEXT := dglGetProcAddress('glEnableIndexedEXT');
  glDisableIndexedEXT := dglGetProcAddress('glDisableIndexedEXT');
  glIsEnabledIndexedEXT := dglGetProcAddress('glIsEnabledIndexedEXT');
end;

procedure Read_GL_EXT_draw_instanced;
begin
  glDrawArraysInstancedEXT := dglGetProcAddress('glDrawArraysInstancedEXT');
  glDrawElementsInstancedEXT := dglGetProcAddress('glDrawElementsInstancedEXT');
end;

procedure Read_GL_EXT_geometry_shader4;
begin
  glProgramParameteriEXT := dglGetProcAddress('glProgramParameteriEXT');
  glFramebufferTextureEXT := dglGetProcAddress('glFramebufferTextureEXT');
//  glFramebufferTextureLayerEXT := dglGetProcAddress('glFramebufferTextureLayerEXT');
  glFramebufferTextureFaceEXT := dglGetProcAddress('glFramebufferTextureFaceEXT');
end;

procedure Read_GL_EXT_gpu_shader4;
begin
  glVertexAttribI1iEXT := dglGetProcAddress('glVertexAttribI1iEXT');
  glVertexAttribI2iEXT := dglGetProcAddress('glVertexAttribI2iEXT');
  glVertexAttribI3iEXT := dglGetProcAddress('glVertexAttribI3iEXT');
  glVertexAttribI4iEXT := dglGetProcAddress('glVertexAttribI4iEXT');
  glVertexAttribI1uiEXT := dglGetProcAddress('glVertexAttribI1uiEXT');
  glVertexAttribI2uiEXT := dglGetProcAddress('glVertexAttribI2uiEXT');
  glVertexAttribI3uiEXT := dglGetProcAddress('glVertexAttribI3uiEXT');
  glVertexAttribI4uiEXT := dglGetProcAddress('glVertexAttribI4uiEXT');
  glVertexAttribI1ivEXT := dglGetProcAddress('glVertexAttribI1ivEXT');
  glVertexAttribI2ivEXT := dglGetProcAddress('glVertexAttribI2ivEXT');
  glVertexAttribI3ivEXT := dglGetProcAddress('glVertexAttribI3ivEXT');
  glVertexAttribI4ivEXT := dglGetProcAddress('glVertexAttribI4ivEXT');
  glVertexAttribI1uivEXT := dglGetProcAddress('glVertexAttribI1uivEXT');
  glVertexAttribI2uivEXT := dglGetProcAddress('glVertexAttribI2uivEXT');
  glVertexAttribI3uivEXT := dglGetProcAddress('glVertexAttribI3uivEXT');
  glVertexAttribI4uivEXT := dglGetProcAddress('glVertexAttribI4uivEXT');
  glVertexAttribI4bvEXT := dglGetProcAddress('glVertexAttribI4bvEXT');
  glVertexAttribI4svEXT := dglGetProcAddress('glVertexAttribI4svEXT');
  glVertexAttribI4ubvEXT := dglGetProcAddress('glVertexAttribI4ubvEXT');
  glVertexAttribI4usvEXT := dglGetProcAddress('glVertexAttribI4usvEXT');
  glVertexAttribIPointerEXT := dglGetProcAddress('glVertexAttribIPointerEXT');
  glGetVertexAttribIivEXT := dglGetProcAddress('glGetVertexAttribIivEXT');
  glGetVertexAttribIuivEXT := dglGetProcAddress('glGetVertexAttribIuivEXT');
  glUniform1uiEXT := dglGetProcAddress('glUniform1uiEXT');
  glUniform2uiEXT := dglGetProcAddress('glUniform2uiEXT');
  glUniform3uiEXT := dglGetProcAddress('glUniform3uiEXT');
  glUniform4uiEXT := dglGetProcAddress('glUniform4uiEXT');
  glUniform1uivEXT := dglGetProcAddress('glUniform1uivEXT');
  glUniform2uivEXT := dglGetProcAddress('glUniform2uivEXT');
  glUniform3uivEXT := dglGetProcAddress('glUniform3uivEXT');
  glUniform4uivEXT := dglGetProcAddress('glUniform4uivEXT');
  glGetUniformuivEXT := dglGetProcAddress('glGetUniformuivEXT');
  glBindFragDataLocationEXT := dglGetProcAddress('glBindFragDataLocationEXT');
  glGetFragDataLocationEXT := dglGetProcAddress('glGetFragDataLocationEXT');
end;

procedure Read_GL_EXT_texture_array;
begin
  glFramebufferTextureLayerEXT := dglGetProcAddress('glFramebufferTextureLayerEXT');
end;

procedure Read_GL_EXT_texture_buffer_object;
begin
  glTexBufferEXT := dglGetProcAddress('glTexBufferEXT');
end;

procedure Read_GL_EXT_texture_integer;
begin
  glClearColorIiEXT := dglGetProcAddress('glClearColorIiEXT');
  glClearColorIuiEXT := dglGetProcAddress('glClearColorIuiEXT');
  glTexParameterIivEXT := dglGetProcAddress('glTexParameterIivEXT');
  glTexParameterIuivEXT := dglGetProcAddress('glTexParameterIuivEXT');
  glGetTexParameterIivEXT := dglGetProcAddress('glGetTexParameterIivEXT');
  glGetTexParameterIiuvEXT := dglGetProcAddress('glGetTexParameterIiuvEXT');
end;

procedure Read_GL_EXT_transform_feedback;
begin
  glBeginTransformFeedbackEXT := dglGetProcAddress('lBeginTransformFeedbackEXT');
  glEndTransformFeedbackEXT := dglGetProcAddress('glEndTransformFeedbackEXT');
  glBindBufferRangeEXT := dglGetProcAddress('glBindBufferRangeEXT');
  glBindBufferOffsetEXT := dglGetProcAddress('glBindBufferOffsetEXT');
  glBindBufferBaseEXT := dglGetProcAddress('glBindBufferBaseEXT');
  glTransformFeedbackVaryingsEXT := dglGetProcAddress('glTransformFeedbackVaryingsEXT');
  glGetTransformFeedbackVaryingEXT := dglGetProcAddress('glGetTransformFeedbackVaryingEXT');
end;

procedure Read_GL_EXT_direct_state_access;
begin
  glClientAttribDefaultEXT := dglGetProcAddress('glClientAttribDefaultEXT');
  glPushClientAttribDefaultEXT := dglGetProcAddress('glPushClientAttribDefaultEXT');
  glMatrixLoadfEXT := dglGetProcAddress('glMatrixLoadfEXT');
  glMatrixLoaddEXT := dglGetProcAddress('glMatrixLoaddEXT');
  glMatrixMultfEXT := dglGetProcAddress('glMatrixMultfEXT');
  glMatrixMultdEXT := dglGetProcAddress('glMatrixMultdEXT');
  glMatrixLoadIdentityEXT := dglGetProcAddress('glMatrixLoadIdentityEXT');
  glMatrixRotatefEXT := dglGetProcAddress('glMatrixRotatefEXT');
  glMatrixRotatedEXT := dglGetProcAddress('glMatrixRotatedEXT');
  glMatrixScalefEXT := dglGetProcAddress('glMatrixScalefEXT');
  glMatrixScaledEXT := dglGetProcAddress('glMatrixScaledEXT');
  glMatrixTranslatefEXT := dglGetProcAddress('glMatrixTranslatefEXT');
  glMatrixTranslatedEXT := dglGetProcAddress('glMatrixTranslatedEXT');
  glMatrixFrustumEXT := dglGetProcAddress('glMatrixFrustumEXT');
  glMatrixOrthoEXT := dglGetProcAddress('glMatrixOrthoEXT');
  glMatrixPopEXT := dglGetProcAddress('glMatrixPopEXT');
  glMatrixPushEXT := dglGetProcAddress('glMatrixPushEXT');
  glMatrixLoadTransposefEXT := dglGetProcAddress('glMatrixLoadTransposefEXT');
  glMatrixLoadTransposedEXT := dglGetProcAddress('glMatrixLoadTransposedEXT');
  glMatrixMultTransposefEXT := dglGetProcAddress('glMatrixMultTransposefEXT');
  glMatrixMultTransposedEXT := dglGetProcAddress('glMatrixMultTransposedEXT');
  glTextureParameterfEXT := dglGetProcAddress('glTextureParameterfEXT');
  glTextureParameterfvEXT := dglGetProcAddress('glTextureParameterfvEXT');
  glTextureParameteriEXT := dglGetProcAddress('glTextureParameteriEXT');
  glTextureParameterivEXT := dglGetProcAddress('glTextureParameterivEXT');
  glTextureImage1DEXT := dglGetProcAddress('glTextureImage1DEXT');
  glTextureImage2DEXT := dglGetProcAddress('glTextureImage2DEXT');
  glTextureSubImage1DEXT := dglGetProcAddress('glTextureSubImage1DEXT');
  glTextureSubImage2DEXT := dglGetProcAddress('glTextureSubImage2DEXT');
  glCopyTextureImage1DEXT := dglGetProcAddress('glCopyTextureImage1DEXT');
  glCopyTextureImage2DEXT := dglGetProcAddress('glCopyTextureImage2DEXT');
  glCopyTextureSubImage1DEXT := dglGetProcAddress('glCopyTextureSubImage1DEXT');
  glCopyTextureSubImage2DEXT := dglGetProcAddress('glCopyTextureSubImage2DEXT');
  glGetTextureImageEXT := dglGetProcAddress('glGetTextureImageEXT');
  glGetTextureParameterfvEXT := dglGetProcAddress('glGetTextureParameterfvEXT');
  glGetTextureParameterivEXT := dglGetProcAddress('glGetTextureParameterivEXT');
  glGetTextureLevelParameterfvEXT := dglGetProcAddress('glGetTextureLevelParameterfvEXT');
  glGetTextureLevelParameterivEXT := dglGetProcAddress('glGetTextureLevelParameterivEXT');
  glTextureImage3DEXT := dglGetProcAddress('glTextureImage3DEXT');
  glTextureSubImage3DEXT := dglGetProcAddress('glTextureSubImage3DEXT');
  glCopyTextureSubImage3DEXT := dglGetProcAddress('glCopyTextureSubImage3DEXT');
  glMultiTexParameterfEXT := dglGetProcAddress('glMultiTexParameterfEXT');
  glMultiTexParameterfvEXT := dglGetProcAddress('glMultiTexParameterfvEXT');
  glMultiTexParameteriEXT := dglGetProcAddress('glMultiTexParameteriEXT');
  glMultiTexParameterivEXT := dglGetProcAddress('glMultiTexParameterivEXT');
  glMultiTexImage1DEXT := dglGetProcAddress('glMultiTexImage1DEXT');
  glMultiTexImage2DEXT := dglGetProcAddress('glMultiTexImage2DEXT');
  glMultiTexSubImage1DEXT := dglGetProcAddress('glMultiTexSubImage1DEXT');
  glMultiTexSubImage2DEXT := dglGetProcAddress('glMultiTexSubImage2DEXT');
  glCopyMultiTexImage1DEXT := dglGetProcAddress('glCopyMultiTexImage1DEXT');
  glCopyMultiTexImage2DEXT := dglGetProcAddress('glCopyMultiTexImage2DEXT');
  glCopyMultiTexSubImage1DEXT := dglGetProcAddress('glCopyMultiTexSubImage1DEXT');
  glCopyMultiTexSubImage2DEXT := dglGetProcAddress('glCopyMultiTexSubImage2DEXT');
  glGetMultiTexImageEXT := dglGetProcAddress('glGetMultiTexImageEXT');
  glGetMultiTexParameterfvEXT := dglGetProcAddress('glGetMultiTexParameterfvEXT');
  glGetMultiTexParameterivEXT := dglGetProcAddress('glGetMultiTexParameterivEXT');
  glGetMultiTexLevelParameterfvEXT := dglGetProcAddress('glGetMultiTexLevelParameterfvEXT');
  glGetMultiTexLevelParameterivEXT := dglGetProcAddress('glGetMultiTexLevelParameterivEXT');
  glMultiTexImage3DEXT := dglGetProcAddress('glMultiTexImage3DEXT');
  glMultiTexSubImage3DEXT := dglGetProcAddress('glMultiTexSubImage3DEXT');
  glCopyMultiTexSubImage3DEXT := dglGetProcAddress('glCopyMultiTexSubImage3DEXT');
  glBindMultiTextureEXT := dglGetProcAddress('glBindMultiTextureEXT');
  glEnableClientStateIndexedEXT := dglGetProcAddress('glEnableClientStateIndexedEXT');
  glDisableClientStateIndexedEXT := dglGetProcAddress('glDisableClientStateIndexedEXT');
  glMultiTexCoordPointerEXT := dglGetProcAddress('glMultiTexCoordPointerEXT');
  glMultiTexEnvfEXT := dglGetProcAddress('glMultiTexEnvfEXT');
  glMultiTexEnvfvEXT := dglGetProcAddress('glMultiTexEnvfvEXT');
  glMultiTexEnviEXT := dglGetProcAddress('glMultiTexEnviEXT');
  glMultiTexEnvivEXT := dglGetProcAddress('glMultiTexEnvivEXT');
  glMultiTexGendEXT := dglGetProcAddress('glMultiTexGendEXT');
  glMultiTexGendvEXT := dglGetProcAddress('glMultiTexGendvEXT');
  glMultiTexGenfEXT := dglGetProcAddress('glMultiTexGenfEXT');
  glMultiTexGenfvEXT := dglGetProcAddress('glMultiTexGenfvEXT');
  glMultiTexGeniEXT := dglGetProcAddress('glMultiTexGeniEXT');
  glMultiTexGenivEXT := dglGetProcAddress('glMultiTexGenivEXT');
  glGetMultiTexEnvfvEXT := dglGetProcAddress('glGetMultiTexEnvfvEXT');
  glGetMultiTexEnvivEXT := dglGetProcAddress('glGetMultiTexEnvivEXT');
  glGetMultiTexGendvEXT := dglGetProcAddress('glGetMultiTexGendvEXT');
  glGetMultiTexGenfvEXT := dglGetProcAddress('glGetMultiTexGenfvEXT');
  glGetMultiTexGenivEXT := dglGetProcAddress('glGetMultiTexGenivEXT');
  glGetFloatIndexedvEXT := dglGetProcAddress('glGetFloatIndexedvEXT');
  glGetDoubleIndexedvEXT := dglGetProcAddress('glGetDoubleIndexedvEXT');
  glGetPointerIndexedvEXT := dglGetProcAddress('glGetPointerIndexedvEXT');
  glCompressedTextureImage3DEXT := dglGetProcAddress('glCompressedTextureImage3DEXT');
  glCompressedTextureImage2DEXT := dglGetProcAddress('glCompressedTextureImage2DEXT');
  glCompressedTextureImage1DEXT := dglGetProcAddress('glCompressedTextureImage1DEXT');
  glCompressedTextureSubImage3DEXT := dglGetProcAddress('glCompressedTextureSubImage3DEXT');
  glCompressedTextureSubImage2DEXT := dglGetProcAddress('glCompressedTextureSubImage2DEXT');
  glCompressedTextureSubImage1DEXT := dglGetProcAddress('glCompressedTextureSubImage1DEXT');
  glGetCompressedTextureImageEXT := dglGetProcAddress('glGetCompressedTextureImageEXT');
  glCompressedMultiTexImage3DEXT := dglGetProcAddress('glCompressedMultiTexImage3DEXT');
  glCompressedMultiTexImage2DEXT := dglGetProcAddress('glCompressedMultiTexImage2DEXT');
  glCompressedMultiTexImage1DEXT := dglGetProcAddress('glCompressedMultiTexImage1DEXT');
  glCompressedMultiTexSubImage3DEXT := dglGetProcAddress('glCompressedMultiTexSubImage3DEXT');
  glCompressedMultiTexSubImage2DEXT := dglGetProcAddress('glCompressedMultiTexSubImage2DEXT');
  glCompressedMultiTexSubImage1DEXT := dglGetProcAddress('glCompressedMultiTexSubImage1DEXT');
  glGetCompressedMultiTexImageEXT := dglGetProcAddress('glGetCompressedMultiTexImageEXT');
  glNamedProgramStringEXT := dglGetProcAddress('glNamedProgramStringEXT');
  glNamedProgramLocalParameter4dEXT := dglGetProcAddress('glNamedProgramLocalParameter4dEXT');
  glNamedProgramLocalParameter4dvEXT := dglGetProcAddress('glNamedProgramLocalParameter4dvEXT');
  glNamedProgramLocalParameter4fEXT := dglGetProcAddress('glNamedProgramLocalParameter4fEXT');
  glNamedProgramLocalParameter4fvEXT := dglGetProcAddress('glNamedProgramLocalParameter4fvEXT');
  glGetNamedProgramLocalParameterdvEXT := dglGetProcAddress('glGetNamedProgramLocalParameterdvEXT');
  glGetNamedProgramLocalParameterfvEXT := dglGetProcAddress('glGetNamedProgramLocalParameterfvEXT');
  glGetNamedProgramivEXT := dglGetProcAddress('glGetNamedProgramivEXT');
  glGetNamedProgramStringEXT := dglGetProcAddress('glGetNamedProgramStringEXT');
  glNamedProgramLocalParameters4fvEXT := dglGetProcAddress('glNamedProgramLocalParameters4fvEXT');
  glNamedProgramLocalParameterI4iEXT := dglGetProcAddress('glNamedProgramLocalParameterI4iEXT');
  glNamedProgramLocalParameterI4ivEXT := dglGetProcAddress('glNamedProgramLocalParameterI4ivEXT');
  glNamedProgramLocalParametersI4ivEXT := dglGetProcAddress('glNamedProgramLocalParametersI4ivEXT');
  glNamedProgramLocalParameterI4uiEXT := dglGetProcAddress('glNamedProgramLocalParameterI4uiEXT');
  glNamedProgramLocalParameterI4uivEXT := dglGetProcAddress('glNamedProgramLocalParameterI4uivEXT');
  glNamedProgramLocalParametersI4uivEXT := dglGetProcAddress('glNamedProgramLocalParametersI4uivEXT');
  glGetNamedProgramLocalParameterIivEXT := dglGetProcAddress('glGetNamedProgramLocalParameterIivEXT');
  glGetNamedProgramLocalParameterIuivEXT := dglGetProcAddress('glGetNamedProgramLocalParameterIuivEXT');
  glTextureParameterIivEXT := dglGetProcAddress('glTextureParameterIivEXT');
  glTextureParameterIuivEXT := dglGetProcAddress('glTextureParameterIuivEXT');
  glGetTextureParameterIivEXT := dglGetProcAddress('glGetTextureParameterIivEXT');
  glGetTextureParameterIuivEXT := dglGetProcAddress('glGetTextureParameterIuivEXT');
  glMultiTexParameterIivEXT := dglGetProcAddress('glMultiTexParameterIivEXT');
  glMultiTexParameterIuivEXT := dglGetProcAddress('glMultiTexParameterIuivEXT');
  glGetMultiTexParameterIivEXT := dglGetProcAddress('glGetMultiTexParameterIivEXT');
  glGetMultiTexParameterIuivEXT := dglGetProcAddress('glGetMultiTexParameterIuivEXT');
  glProgramUniform1fEXT := dglGetProcAddress('glProgramUniform1fEXT');
  glProgramUniform2fEXT := dglGetProcAddress('glProgramUniform2fEXT');
  glProgramUniform3fEXT := dglGetProcAddress('glProgramUniform3fEXT');
  glProgramUniform4fEXT := dglGetProcAddress('glProgramUniform4fEXT');
  glProgramUniform1iEXT := dglGetProcAddress('glProgramUniform1iEXT');
  glProgramUniform2iEXT := dglGetProcAddress('glProgramUniform2iEXT');
  glProgramUniform3iEXT := dglGetProcAddress('glProgramUniform3iEXT');
  glProgramUniform4iEXT := dglGetProcAddress('glProgramUniform4iEXT');
  glProgramUniform1fvEXT := dglGetProcAddress('glProgramUniform1fvEXT');
  glProgramUniform2fvEXT := dglGetProcAddress('glProgramUniform2fvEXT');
  glProgramUniform3fvEXT := dglGetProcAddress('glProgramUniform3fvEXT');
  glProgramUniform4fvEXT := dglGetProcAddress('glProgramUniform4fvEXT');
  glProgramUniform1ivEXT := dglGetProcAddress('glProgramUniform1ivEXT');
  glProgramUniform2ivEXT := dglGetProcAddress('glProgramUniform2ivEXT');
  glProgramUniform3ivEXT := dglGetProcAddress('glProgramUniform3ivEXT');
  glProgramUniform4ivEXT := dglGetProcAddress('glProgramUniform4ivEXT');
  glProgramUniformMatrix2fvEXT := dglGetProcAddress('glProgramUniformMatrix2fvEXT');
  glProgramUniformMatrix3fvEXT := dglGetProcAddress('glProgramUniformMatrix3fvEXT');
  glProgramUniformMatrix4fvEXT := dglGetProcAddress('glProgramUniformMatrix4fvEXT');
  glProgramUniformMatrix2x3fvEXT := dglGetProcAddress('glProgramUniformMatrix2x3fvEXT');
  glProgramUniformMatrix3x2fvEXT := dglGetProcAddress('glProgramUniformMatrix3x2fvEXT');
  glProgramUniformMatrix2x4fvEXT := dglGetProcAddress('glProgramUniformMatrix2x4fvEXT');
  glProgramUniformMatrix4x2fvEXT := dglGetProcAddress('glProgramUniformMatrix4x2fvEXT');
  glProgramUniformMatrix3x4fvEXT := dglGetProcAddress('glProgramUniformMatrix3x4fvEXT');
  glProgramUniformMatrix4x3fvEXT := dglGetProcAddress('glProgramUniformMatrix4x3fvEXT');
  glProgramUniform1uiEXT := dglGetProcAddress('glProgramUniform1uiEXT');
  glProgramUniform2uiEXT := dglGetProcAddress('glProgramUniform2uiEXT');
  glProgramUniform3uiEXT := dglGetProcAddress('glProgramUniform3uiEXT');
  glProgramUniform4uiEXT := dglGetProcAddress('glProgramUniform4uiEXT');
  glProgramUniform1uivEXT := dglGetProcAddress('glProgramUniform1uivEXT');
  glProgramUniform2uivEXT := dglGetProcAddress('glProgramUniform2uivEXT');
  glProgramUniform3uivEXT := dglGetProcAddress('glProgramUniform3uivEXT');
  glProgramUniform4uivEXT := dglGetProcAddress('glProgramUniform4uivEXT');
  glNamedBufferDataEXT := dglGetProcAddress('glNamedBufferDataEXT');
  glNamedBufferSubDataEXT := dglGetProcAddress('glNamedBufferSubDataEXT');
  glMapNamedBufferEXT := dglGetProcAddress('glMapNamedBufferEXT');
  glUnmapNamedBufferEXT := dglGetProcAddress('glUnmapNamedBufferEXT');
  glMapNamedBufferRangeEXT := dglGetProcAddress('glMapNamedBufferRangeEXT');
  glFlushMappedNamedBufferRangeEXT := dglGetProcAddress('glFlushMappedNamedBufferRangeEXT');
  glNamedCopyBufferSubDataEXT := dglGetProcAddress('glNamedCopyBufferSubDataEXT');
  glGetNamedBufferParameterivEXT := dglGetProcAddress('glGetNamedBufferParameterivEXT');
  glGetNamedBufferPointervEXT := dglGetProcAddress('glGetNamedBufferPointervEXT');
  glGetNamedBufferSubDataEXT := dglGetProcAddress('glGetNamedBufferSubDataEXT');
  glTextureBufferEXT := dglGetProcAddress('glTextureBufferEXT');
  glMultiTexBufferEXT := dglGetProcAddress('glMultiTexBufferEXT');
  glNamedRenderbufferStorageEXT := dglGetProcAddress('glNamedRenderbufferStorageEXT');
  glGetNamedRenderbufferParameterivEXT := dglGetProcAddress('glGetNamedRenderbufferParameterivEXT');
  glCheckNamedFramebufferStatusEXT := dglGetProcAddress('glCheckNamedFramebufferStatusEXT');
  glNamedFramebufferTexture1DEXT := dglGetProcAddress('glNamedFramebufferTexture1DEXT');
  glNamedFramebufferTexture2DEXT := dglGetProcAddress('glNamedFramebufferTexture2DEXT');
  glNamedFramebufferTexture3DEXT := dglGetProcAddress('glNamedFramebufferTexture3DEXT');
  glNamedFramebufferRenderbufferEXT := dglGetProcAddress('glNamedFramebufferRenderbufferEXT');
  glGetNamedFramebufferAttachmentParameterivEXT := dglGetProcAddress('glGetNamedFramebufferAttachmentParameterivEXT');
  glGenerateTextureMipmapEXT := dglGetProcAddress('glGenerateTextureMipmapEXT');
  glGenerateMultiTexMipmapEXT := dglGetProcAddress('glGenerateMultiTexMipmapEXT');
  glFramebufferDrawBufferEXT := dglGetProcAddress('glFramebufferDrawBufferEXT');
  glFramebufferDrawBuffersEXT := dglGetProcAddress('glFramebufferDrawBuffersEXT');
  glFramebufferReadBufferEXT := dglGetProcAddress('glFramebufferReadBufferEXT');
  glGetFramebufferParameterivEXT := dglGetProcAddress('glGetFramebufferParameterivEXT');
  glNamedRenderbufferStorageMultisampleEXT := dglGetProcAddress('glNamedRenderbufferStorageMultisampleEXT');
  glNamedRenderbufferStorageMultisampleCoverageEXT := dglGetProcAddress('glNamedRenderbufferStorageMultisampleCoverageEXT');
  glNamedFramebufferTextureEXT := dglGetProcAddress('glNamedFramebufferTextureEXT');
  glNamedFramebufferTextureLayerEXT := dglGetProcAddress('glNamedFramebufferTextureLayerEXT');
  glNamedFramebufferTextureFaceEXT := dglGetProcAddress('glNamedFramebufferTextureFaceEXT');
  glTextureRenderbufferEXT := dglGetProcAddress('glTextureRenderbufferEXT');
  glMultiTexRenderbufferEXT := dglGetProcAddress('glMultiTexRenderbufferEXT');
  glProgramUniform1dEXT := dglGetProcAddress('glProgramUniform1dEXT');
  glProgramUniform2dEXT := dglGetProcAddress('glProgramUniform2dEXT');
  glProgramUniform3dEXT := dglGetProcAddress('glProgramUniform3dEXT');
  glProgramUniform4dEXT := dglGetProcAddress('glProgramUniform4dEXT');
  glProgramUniform1dvEXT := dglGetProcAddress('glProgramUniform1dvEXT');
  glProgramUniform2dvEXT := dglGetProcAddress('glProgramUniform2dvEXT');
  glProgramUniform3dvEXT := dglGetProcAddress('glProgramUniform3dvEXT');
  glProgramUniform4dvEXT := dglGetProcAddress('glProgramUniform4dvEXT');
  glProgramUniformMatrix2dvEXT := dglGetProcAddress('glProgramUniformMatrix2dvEXT');
  glProgramUniformMatrix3dvEXT := dglGetProcAddress('glProgramUniformMatrix3dvEXT');
  glProgramUniformMatrix4dvEXT := dglGetProcAddress('glProgramUniformMatrix4dvEXT');
  glProgramUniformMatrix2x3dvEXT := dglGetProcAddress('glProgramUniformMatrix2x3dvEXT');
  glProgramUniformMatrix2x4dvEXT := dglGetProcAddress('glProgramUniformMatrix2x4dvEXT');
  glProgramUniformMatrix3x2dvEXT := dglGetProcAddress('glProgramUniformMatrix3x2dvEXT');
  glProgramUniformMatrix3x4dvEXT := dglGetProcAddress('glProgramUniformMatrix3x4dvEXT');
  glProgramUniformMatrix4x2dvEXT := dglGetProcAddress('glProgramUniformMatrix4x2dvEXT');
  glProgramUniformMatrix4x3dvEXT := dglGetProcAddress('glProgramUniformMatrix4x3dvEXT');
end;

procedure Read_GL_EXT_separate_shader_objects;
begin
  glUseShaderProgramEXT := dglGetProcAddress('glUseShaderProgramEXT');
  glActiveProgramEXT := dglGetProcAddress('glActiveProgramEXT');
  glCreateShaderProgramEXT := dglGetProcAddress('glCreateShaderProgramEXT');
end;

procedure Read_GL_EXT_shader_image_load_store;
begin
  glBindImageTextureEXT := dglGetProcAddress('glBindImageTextureEXT');
  glMemoryBarrierEXT := dglGetProcAddress('glMemoryBarrierEXT');
end;

procedure Read_GL_EXT_vertex_attrib_64bit;
begin
  glVertexAttribL1dEXT := dglGetProcAddress('glVertexAttribL1dEXT');
  glVertexAttribL2dEXT := dglGetProcAddress('glVertexAttribL2dEXT');
  glVertexAttribL3dEXT := dglGetProcAddress('glVertexAttribL3dEXT');
  glVertexAttribL4dEXT := dglGetProcAddress('glVertexAttribL4dEXT');
  glVertexAttribL1dvEXT := dglGetProcAddress('glVertexAttribL1dvEXT');
  glVertexAttribL2dvEXT := dglGetProcAddress('glVertexAttribL2dvEXT');
  glVertexAttribL3dvEXT := dglGetProcAddress('glVertexAttribL3dvEXT');
  glVertexAttribL4dvEXT := dglGetProcAddress('glVertexAttribL4dvEXT');
  glVertexAttribLPointerEXT := dglGetProcAddress('glVertexAttribLPointerEXT');
  glGetVertexAttribLdvEXT := dglGetProcAddress('glGetVertexAttribLdvEXT');
  glVertexArrayVertexAttribLOffsetEXT := dglGetProcAddress('glVertexArrayVertexAttribLOffsetEXT');
end;

procedure Read_GL_HP_image_transform;
begin
  glImageTransformParameteriHP := dglGetProcAddress('glImageTransformParameteriHP');
  glImageTransformParameterfHP := dglGetProcAddress('glImageTransformParameterfHP');
  glImageTransformParameterivHP := dglGetProcAddress('glImageTransformParameterivHP');
  glImageTransformParameterfvHP := dglGetProcAddress('glImageTransformParameterfvHP');
  glGetImageTransformParameterivHP := dglGetProcAddress('glGetImageTransformParameterivHP');
  glGetImageTransformParameterfvHP := dglGetProcAddress('glGetImageTransformParameterfvHP');
end;

procedure Read_GL_IBM_multimode_draw_arrays;
begin
  glMultiModeDrawArraysIBM := dglGetProcAddress('glMultiModeDrawArraysIBM');
  glMultiModeDrawElementsIBM := dglGetProcAddress('glMultiModeDrawElementsIBM');
end;

procedure Read_GL_IBM_vertex_array_lists;
begin
  glColorPointerListIBM := dglGetProcAddress('glColorPointerListIBM');
  glSecondaryColorPointerListIBM := dglGetProcAddress('glSecondaryColorPointerListIBM');
  glEdgeFlagPointerListIBM := dglGetProcAddress('glEdgeFlagPointerListIBM');
  glFogCoordPointerListIBM := dglGetProcAddress('glFogCoordPointerListIBM');
  glIndexPointerListIBM := dglGetProcAddress('glIndexPointerListIBM');
  glNormalPointerListIBM := dglGetProcAddress('glNormalPointerListIBM');
  glTexCoordPointerListIBM := dglGetProcAddress('glTexCoordPointerListIBM');
  glVertexPointerListIBM := dglGetProcAddress('glVertexPointerListIBM');
end;

procedure Read_GL_INGR_blend_func_separate;
begin
  glBlendFuncSeparateINGR := dglGetProcAddress('glBlendFuncSeparateINGR');
end;

procedure Read_GL_INTEL_parallel_arrays;
begin
  glVertexPointervINTEL := dglGetProcAddress('glVertexPointervINTEL');
  glNormalPointervINTEL := dglGetProcAddress('glNormalPointervINTEL');
  glColorPointervINTEL := dglGetProcAddress('glColorPointervINTEL');
  glTexCoordPointervINTEL := dglGetProcAddress('glTexCoordPointervINTEL');
end;

procedure Read_GL_MESA_resize_buffers;
begin
  glResizeBuffersMESA := dglGetProcAddress('glResizeBuffersMESA');
end;

procedure Read_GL_MESA_window_pos;
begin
  glWindowPos2dMESA := dglGetProcAddress('glWindowPos2dMESA');
  glWindowPos2dvMESA := dglGetProcAddress('glWindowPos2dvMESA');
  glWindowPos2fMESA := dglGetProcAddress('glWindowPos2fMESA');
  glWindowPos2fvMESA := dglGetProcAddress('glWindowPos2fvMESA');
  glWindowPos2iMESA := dglGetProcAddress('glWindowPos2iMESA');
  glWindowPos2ivMESA := dglGetProcAddress('glWindowPos2ivMESA');
  glWindowPos2sMESA := dglGetProcAddress('glWindowPos2sMESA');
  glWindowPos2svMESA := dglGetProcAddress('glWindowPos2svMESA');
  glWindowPos3dMESA := dglGetProcAddress('glWindowPos3dMESA');
  glWindowPos3dvMESA := dglGetProcAddress('glWindowPos3dvMESA');
  glWindowPos3fMESA := dglGetProcAddress('glWindowPos3fMESA');
  glWindowPos3fvMESA := dglGetProcAddress('glWindowPos3fvMESA');
  glWindowPos3iMESA := dglGetProcAddress('glWindowPos3iMESA');
  glWindowPos3ivMESA := dglGetProcAddress('glWindowPos3ivMESA');
  glWindowPos3sMESA := dglGetProcAddress('glWindowPos3sMESA');
  glWindowPos3svMESA := dglGetProcAddress('glWindowPos3svMESA');
  glWindowPos4dMESA := dglGetProcAddress('glWindowPos4dMESA');
  glWindowPos4dvMESA := dglGetProcAddress('glWindowPos4dvMESA');
  glWindowPos4fMESA := dglGetProcAddress('glWindowPos4fMESA');
  glWindowPos4fvMESA := dglGetProcAddress('glWindowPos4fvMESA');
  glWindowPos4iMESA := dglGetProcAddress('glWindowPos4iMESA');
  glWindowPos4ivMESA := dglGetProcAddress('glWindowPos4ivMESA');
  glWindowPos4sMESA := dglGetProcAddress('glWindowPos4sMESA');
  glWindowPos4svMESA := dglGetProcAddress('glWindowPos4svMESA');
end;

procedure Read_GL_NV_evaluators;
begin
  glMapControlPointsNV := dglGetProcAddress('glMapControlPointsNV');
  glMapParameterivNV := dglGetProcAddress('glMapParameterivNV');
  glMapParameterfvNV := dglGetProcAddress('glMapParameterfvNV');
  glGetMapControlPointsNV := dglGetProcAddress('glGetMapControlPointsNV');
  glGetMapParameterivNV := dglGetProcAddress('glGetMapParameterivNV');
  glGetMapParameterfvNV := dglGetProcAddress('glGetMapParameterfvNV');
  glGetMapAttribParameterivNV := dglGetProcAddress('glGetMapAttribParameterivNV');
  glGetMapAttribParameterfvNV := dglGetProcAddress('glGetMapAttribParameterfvNV');
  glEvalMapsNV := dglGetProcAddress('glEvalMapsNV');
end;

procedure Read_GL_NV_fence;
begin
  glDeleteFencesNV := dglGetProcAddress('glDeleteFencesNV');
  glGenFencesNV := dglGetProcAddress('glGenFencesNV');
  glIsFenceNV := dglGetProcAddress('glIsFenceNV');
  glTestFenceNV := dglGetProcAddress('glTestFenceNV');
  glGetFenceivNV := dglGetProcAddress('glGetFenceivNV');
  glFinishFenceNV := dglGetProcAddress('glFinishFenceNV');
  glSetFenceNV := dglGetProcAddress('glSetFenceNV');
end;

procedure Read_GL_NV_fragment_program;
begin
  glProgramNamedParameter4fNV := dglGetProcAddress('glProgramNamedParameter4fNV');
  glProgramNamedParameter4dNV := dglGetProcAddress('glProgramNamedParameter4dNV');
  glProgramNamedParameter4fvNV := dglGetProcAddress('glProgramNamedParameter4fvNV');
  glProgramNamedParameter4dvNV := dglGetProcAddress('glProgramNamedParameter4dvNV');
  glGetProgramNamedParameterfvNV := dglGetProcAddress('glGetProgramNamedParameterfvNV');
  glGetProgramNamedParameterdvNV := dglGetProcAddress('glGetProgramNamedParameterdvNV');
end;

procedure Read_GL_NV_half_float;
begin
  glVertex2hNV := dglGetProcAddress('glVertex2hNV');
  glVertex2hvNV := dglGetProcAddress('glVertex2hvNV');
  glVertex3hNV := dglGetProcAddress('glVertex3hNV');
  glVertex3hvNV := dglGetProcAddress('glVertex3hvNV');
  glVertex4hNV := dglGetProcAddress('glVertex4hNV');
  glVertex4hvNV := dglGetProcAddress('glVertex4hvNV');
  glNormal3hNV := dglGetProcAddress('glNormal3hNV');
  glNormal3hvNV := dglGetProcAddress('glNormal3hvNV');
  glColor3hNV := dglGetProcAddress('glColor3hNV');
  glColor3hvNV := dglGetProcAddress('glColor3hvNV');
  glColor4hNV := dglGetProcAddress('glColor4hNV');
  glColor4hvNV := dglGetProcAddress('glColor4hvNV');
  glTexCoord1hNV := dglGetProcAddress('glTexCoord1hNV');
  glTexCoord1hvNV := dglGetProcAddress('glTexCoord1hvNV');
  glTexCoord2hNV := dglGetProcAddress('glTexCoord2hNV');
  glTexCoord2hvNV := dglGetProcAddress('glTexCoord2hvNV');
  glTexCoord3hNV := dglGetProcAddress('glTexCoord3hNV');
  glTexCoord3hvNV := dglGetProcAddress('glTexCoord3hvNV');
  glTexCoord4hNV := dglGetProcAddress('glTexCoord4hNV');
  glTexCoord4hvNV := dglGetProcAddress('glTexCoord4hvNV');
  glMultiTexCoord1hNV := dglGetProcAddress('glMultiTexCoord1hNV');
  glMultiTexCoord1hvNV := dglGetProcAddress('glMultiTexCoord1hvNV');
  glMultiTexCoord2hNV := dglGetProcAddress('glMultiTexCoord2hNV');
  glMultiTexCoord2hvNV := dglGetProcAddress('glMultiTexCoord2hvNV');
  glMultiTexCoord3hNV := dglGetProcAddress('glMultiTexCoord3hNV');
  glMultiTexCoord3hvNV := dglGetProcAddress('glMultiTexCoord3hvNV');
  glMultiTexCoord4hNV := dglGetProcAddress('glMultiTexCoord4hNV');
  glMultiTexCoord4hvNV := dglGetProcAddress('glMultiTexCoord4hvNV');
  glFogCoordhNV := dglGetProcAddress('glFogCoordhNV');
  glFogCoordhvNV := dglGetProcAddress('glFogCoordhvNV');
  glSecondaryColor3hNV := dglGetProcAddress('glSecondaryColor3hNV');
  glSecondaryColor3hvNV := dglGetProcAddress('glSecondaryColor3hvNV');
  glVertexWeighthNV := dglGetProcAddress('glVertexWeighthNV');
  glVertexWeighthvNV := dglGetProcAddress('glVertexWeighthvNV');
  glVertexAttrib1hNV := dglGetProcAddress('glVertexAttrib1hNV');
  glVertexAttrib1hvNV := dglGetProcAddress('glVertexAttrib1hvNV');
  glVertexAttrib2hNV := dglGetProcAddress('glVertexAttrib2hNV');
  glVertexAttrib2hvNV := dglGetProcAddress('glVertexAttrib2hvNV');
  glVertexAttrib3hNV := dglGetProcAddress('glVertexAttrib3hNV');
  glVertexAttrib3hvNV := dglGetProcAddress('glVertexAttrib3hvNV');
  glVertexAttrib4hNV := dglGetProcAddress('glVertexAttrib4hNV');
  glVertexAttrib4hvNV := dglGetProcAddress('glVertexAttrib4hvNV');
  glVertexAttribs1hvNV := dglGetProcAddress('glVertexAttribs1hvNV');
  glVertexAttribs2hvNV := dglGetProcAddress('glVertexAttribs2hvNV');
  glVertexAttribs3hvNV := dglGetProcAddress('glVertexAttribs3hvNV');
  glVertexAttribs4hvNV := dglGetProcAddress('glVertexAttribs4hvNV');
end;

procedure Read_GL_NV_occlusion_query;
begin
  glGenOcclusionQueriesNV := dglGetProcAddress('glGenOcclusionQueriesNV');
  glDeleteOcclusionQueriesNV := dglGetProcAddress('glDeleteOcclusionQueriesNV');
  glIsOcclusionQueryNV := dglGetProcAddress('glIsOcclusionQueryNV');
  glBeginOcclusionQueryNV := dglGetProcAddress('glBeginOcclusionQueryNV');
  glEndOcclusionQueryNV := dglGetProcAddress('glEndOcclusionQueryNV');
  glGetOcclusionQueryivNV := dglGetProcAddress('glGetOcclusionQueryivNV');
  glGetOcclusionQueryuivNV := dglGetProcAddress('glGetOcclusionQueryuivNV');
end;

procedure Read_GL_NV_pixel_data_range;
begin
  glPixelDataRangeNV := dglGetProcAddress('glPixelDataRangeNV');
  glFlushPixelDataRangeNV := dglGetProcAddress('glFlushPixelDataRangeNV');
end;

procedure Read_GL_NV_point_sprite;
begin
  glPointParameteriNV := dglGetProcAddress('glPointParameteriNV');
  glPointParameterivNV := dglGetProcAddress('glPointParameterivNV');
end;

procedure Read_GL_NV_primitive_restart;
begin
  glPrimitiveRestartNV := dglGetProcAddress('glPrimitiveRestartNV');
  glPrimitiveRestartIndexNV := dglGetProcAddress('glPrimitiveRestartIndexNV');
end;

procedure Read_GL_NV_register_combiners;
begin
  glCombinerParameterfvNV := dglGetProcAddress('glCombinerParameterfvNV');
  glCombinerParameterfNV := dglGetProcAddress('glCombinerParameterfNV');
  glCombinerParameterivNV := dglGetProcAddress('glCombinerParameterivNV');
  glCombinerParameteriNV := dglGetProcAddress('glCombinerParameteriNV');
  glCombinerInputNV := dglGetProcAddress('glCombinerInputNV');
  glCombinerOutputNV := dglGetProcAddress('glCombinerOutputNV');
  glFinalCombinerInputNV := dglGetProcAddress('glFinalCombinerInputNV');
  glGetCombinerInputParameterfvNV := dglGetProcAddress('glGetCombinerInputParameterfvNV');
  glGetCombinerInputParameterivNV := dglGetProcAddress('glGetCombinerInputParameterivNV');
  glGetCombinerOutputParameterfvNV := dglGetProcAddress('glGetCombinerOutputParameterfvNV');
  glGetCombinerOutputParameterivNV := dglGetProcAddress('glGetCombinerOutputParameterivNV');
  glGetFinalCombinerInputParameterfvNV := dglGetProcAddress('glGetFinalCombinerInputParameterfvNV');
  glGetFinalCombinerInputParameterivNV := dglGetProcAddress('glGetFinalCombinerInputParameterivNV');
end;

procedure Read_GL_NV_register_combiners2;
begin
  glCombinerStageParameterfvNV := dglGetProcAddress('glCombinerStageParameterfvNV');
  glGetCombinerStageParameterfvNV := dglGetProcAddress('glGetCombinerStageParameterfvNV');
end;

procedure Read_GL_NV_vertex_array_range;
begin
  glFlushVertexArrayRangeNV := dglGetProcAddress('glFlushVertexArrayRangeNV');
  glVertexArrayRangeNV := dglGetProcAddress('glVertexArrayRangeNV');
end;

procedure Read_GL_NV_vertex_program;
begin
  glAreProgramsResidentNV := dglGetProcAddress('glAreProgramsResidentNV');
  glBindProgramNV := dglGetProcAddress('glBindProgramNV');
  glDeleteProgramsNV := dglGetProcAddress('glDeleteProgramsNV');
  glExecuteProgramNV := dglGetProcAddress('glExecuteProgramNV');
  glGenProgramsNV := dglGetProcAddress('glGenProgramsNV');
  glGetProgramParameterdvNV := dglGetProcAddress('glGetProgramParameterdvNV');
  glGetProgramParameterfvNV := dglGetProcAddress('glGetProgramParameterfvNV');
  glGetProgramivNV := dglGetProcAddress('glGetProgramivNV');
  glGetProgramStringNV := dglGetProcAddress('glGetProgramStringNV');
  glGetTrackMatrixivNV := dglGetProcAddress('glGetTrackMatrixivNV');
  glGetVertexAttribdvNV := dglGetProcAddress('glGetVertexAttribdvNV');
  glGetVertexAttribfvNV := dglGetProcAddress('glGetVertexAttribfvNV');
  glGetVertexAttribivNV := dglGetProcAddress('glGetVertexAttribivNV');
  glGetVertexAttribPointervNV := dglGetProcAddress('glGetVertexAttribPointervNV');
  glIsProgramNV := dglGetProcAddress('glIsProgramNV');
  glLoadProgramNV := dglGetProcAddress('glLoadProgramNV');
  glProgramParameter4dNV := dglGetProcAddress('glProgramParameter4dNV');
  glProgramParameter4dvNV := dglGetProcAddress('glProgramParameter4dvNV');
  glProgramParameter4fNV := dglGetProcAddress('glProgramParameter4fNV');
  glProgramParameter4fvNV := dglGetProcAddress('glProgramParameter4fvNV');
  glProgramParameters4dvNV := dglGetProcAddress('glProgramParameters4dvNV');
  glProgramParameters4fvNV := dglGetProcAddress('glProgramParameters4fvNV');
  glRequestResidentProgramsNV := dglGetProcAddress('glRequestResidentProgramsNV');
  glTrackMatrixNV := dglGetProcAddress('glTrackMatrixNV');
  glVertexAttribPointerNV := dglGetProcAddress('glVertexAttribPointerNV');
  glVertexAttrib1dNV := dglGetProcAddress('glVertexAttrib1dNV');
  glVertexAttrib1dvNV := dglGetProcAddress('glVertexAttrib1dvNV');
  glVertexAttrib1fNV := dglGetProcAddress('glVertexAttrib1fNV');
  glVertexAttrib1fvNV := dglGetProcAddress('glVertexAttrib1fvNV');
  glVertexAttrib1sNV := dglGetProcAddress('glVertexAttrib1sNV');
  glVertexAttrib1svNV := dglGetProcAddress('glVertexAttrib1svNV');
  glVertexAttrib2dNV := dglGetProcAddress('glVertexAttrib2dNV');
  glVertexAttrib2dvNV := dglGetProcAddress('glVertexAttrib2dvNV');
  glVertexAttrib2fNV := dglGetProcAddress('glVertexAttrib2fNV');
  glVertexAttrib2fvNV := dglGetProcAddress('glVertexAttrib2fvNV');
  glVertexAttrib2sNV := dglGetProcAddress('glVertexAttrib2sNV');
  glVertexAttrib2svNV := dglGetProcAddress('glVertexAttrib2svNV');
  glVertexAttrib3dNV := dglGetProcAddress('glVertexAttrib3dNV');
  glVertexAttrib3dvNV := dglGetProcAddress('glVertexAttrib3dvNV');
  glVertexAttrib3fNV := dglGetProcAddress('glVertexAttrib3fNV');
  glVertexAttrib3fvNV := dglGetProcAddress('glVertexAttrib3fvNV');
  glVertexAttrib3sNV := dglGetProcAddress('glVertexAttrib3sNV');
  glVertexAttrib3svNV := dglGetProcAddress('glVertexAttrib3svNV');
  glVertexAttrib4dNV := dglGetProcAddress('glVertexAttrib4dNV');
  glVertexAttrib4dvNV := dglGetProcAddress('glVertexAttrib4dvNV');
  glVertexAttrib4fNV := dglGetProcAddress('glVertexAttrib4fNV');
  glVertexAttrib4fvNV := dglGetProcAddress('glVertexAttrib4fvNV');
  glVertexAttrib4sNV := dglGetProcAddress('glVertexAttrib4sNV');
  glVertexAttrib4svNV := dglGetProcAddress('glVertexAttrib4svNV');
  glVertexAttrib4ubNV := dglGetProcAddress('glVertexAttrib4ubNV');
  glVertexAttrib4ubvNV := dglGetProcAddress('glVertexAttrib4ubvNV');
  glVertexAttribs1dvNV := dglGetProcAddress('glVertexAttribs1dvNV');
  glVertexAttribs1fvNV := dglGetProcAddress('glVertexAttribs1fvNV');
  glVertexAttribs1svNV := dglGetProcAddress('glVertexAttribs1svNV');
  glVertexAttribs2dvNV := dglGetProcAddress('glVertexAttribs2dvNV');
  glVertexAttribs2fvNV := dglGetProcAddress('glVertexAttribs2fvNV');
  glVertexAttribs2svNV := dglGetProcAddress('glVertexAttribs2svNV');
  glVertexAttribs3dvNV := dglGetProcAddress('glVertexAttribs3dvNV');
  glVertexAttribs3fvNV := dglGetProcAddress('glVertexAttribs3fvNV');
  glVertexAttribs3svNV := dglGetProcAddress('glVertexAttribs3svNV');
  glVertexAttribs4dvNV := dglGetProcAddress('glVertexAttribs4dvNV');
  glVertexAttribs4fvNV := dglGetProcAddress('glVertexAttribs4fvNV');
  glVertexAttribs4svNV := dglGetProcAddress('glVertexAttribs4svNV');
  glVertexAttribs4ubvNV := dglGetProcAddress('glVertexAttribs4ubvNV');
end;

procedure Read_GL_NV_depth_buffer_float;
begin
  glDepthRangedNV := dglGetProcAddress('glDepthRangedNV');
  glClearDepthdNV := dglGetProcAddress('glClearDepthdNV');
  glDepthBoundsdNV := dglGetProcAddress('glDepthBoundsdNV');
end;

procedure Read_GL_NV_framebuffer_multisample_coverage;
begin
  glRenderbufferStorageMultsampleCoverageNV := dglGetProcAddress('glRenderbufferStorageMultsampleCoverageNV');
end;

procedure Read_GL_NV_geometry_program4;
begin
  glProgramVertexLimitNV := dglGetProcAddress('glProgramVertexLimitNV');
end;

procedure Read_GL_NV_gpu_program4;
begin
  glProgramLocalParameterI4iNV := dglGetProcAddress('glProgramLocalParameterI4iNV');
  glProgramLocalParameterI4ivNV := dglGetProcAddress('glProgramLocalParameterI4ivNV');
  glProgramLocalParametersI4ivNV := dglGetProcAddress('glProgramLocalParametersI4ivNV');
  glProgramLocalParameterI4uiNV := dglGetProcAddress('glProgramLocalParameterI4uiNV');
  glProgramLocalParameterI4uivNV := dglGetProcAddress('glProgramLocalParameterI4uivNV');
  glProgramLocalParametersI4uivNV := dglGetProcAddress('glProgramLocalParametersI4uivNV');
  glProgramEnvParameterI4iNV := dglGetProcAddress('glProgramEnvParameterI4iNV');
  glProgramEnvParameterI4ivNV := dglGetProcAddress('glProgramEnvParameterI4ivNV');
  glProgramEnvParametersI4ivNV := dglGetProcAddress('glProgramEnvParametersI4ivNV');
  glProgramEnvParameterI4uiNV := dglGetProcAddress('glProgramEnvParameterI4uiNV');
  glProgramEnvParameterI4uivNV := dglGetProcAddress('glProgramEnvParameterI4uivNV');
  glProgramEnvParametersI4uivNV := dglGetProcAddress('glProgramEnvParametersI4uivNV');
  glGetProgramLocalParameterIivNV := dglGetProcAddress('glGetProgramLocalParameterIivNV');
  glGetProgramLocalParameterIuivNV := dglGetProcAddress('glGetProgramLocalParameterIuivNV');
  glGetProgramEnvParameterIivNV := dglGetProcAddress('glGetProgramEnvParameterIivNV');
  glGetProgramEnvParameterIuivNV := dglGetProcAddress('glGetProgramEnvParameterIuivNV');
end;

procedure Read_GL_NV_parameter_buffer_object;
begin
  glProgramBufferParametersfvNV := dglGetProcAddress('glProgramBufferParametersfvNV');
  glProgramBufferParametersIivNV := dglGetProcAddress('glProgramBufferParametersIivNV');
  glProgramBufferParametersIuivNV := dglGetProcAddress('glProgramBufferParametersIuivNV');
end;

procedure Read_GL_NV_transform_feedback;
begin
  glBeginTransformFeedbackNV := dglGetProcAddress('glBeginTransformFeedbackNV');
  glEndTransformFeedbackNV := dglGetProcAddress('glEndTransformFeedbackNV');
  glTransformFeedbackAttribsNV := dglGetProcAddress('glTransformFeedbackAttribsNV');
  glBindBufferRangeNV := dglGetProcAddress('glBindBufferRangeNV');
  glBindBufferOffsetNV := dglGetProcAddress('glBindBufferOffsetNV');
  glBindBufferBaseNV := dglGetProcAddress('glBindBufferBaseNV');
  glTransformFeedbackVaryingsNV := dglGetProcAddress('glTransformFeedbackVaryingsNV');
  glActiveVaryingNV := dglGetProcAddress('glActiveVaryingNV');
  glGetVaryingLocationNV := dglGetProcAddress('glGetVaryingLocationNV');
  glGetActiveVaryingNV := dglGetProcAddress('glGetActiveVaryingNV');
  glGetTransformFeedbackVaryingNV := dglGetProcAddress('glGetTransformFeedbackVaryingNV');
  glTransformFeedbackStreamAttribsNV := dglGetProcAddress('glTransformFeedbackStreamAttribsNV');
end;

procedure Read_GL_NV_conditional_render;
begin
  glBeginConditionalRenderNV := dglGetProcAddress('glBeginConditionalRenderNV');
  glEndConditionalRenderNV := dglGetProcAddress('glEndConditionalRenderNV');
end;

procedure Read_GL_NV_present_video;
begin
  glPresentFrameKeyedNV := dglGetProcAddress('glPresentFrameKeyedNV');
  glPresentFrameDualFillNV := dglGetProcAddress('glPresentFrameDualFillNV');
  glGetVideoivNV := dglGetProcAddress('glGetVideoivNV');
  glGetVideouivNV := dglGetProcAddress('glGetVideouivNV');
  glGetVideoi64vNV := dglGetProcAddress('glGetVideoi64vNV');
  glGetVideoui64vNV := dglGetProcAddress('glGetVideoui64vNV');
//  glVideoParameterivNV := dglGetProcAddress('glVideoParameterivNV');
end;

procedure Read_GL_NV_explicit_multisample;
begin
  glGetMultisamplefvNV := dglGetProcAddress('glGetMultisamplefvNV');
  glSampleMaskIndexedNV := dglGetProcAddress('glSampleMaskIndexedNV');
  glTexRenderbufferNV := dglGetProcAddress('glTexRenderbufferNV');
end;

procedure Read_GL_NV_transform_feedback2;
begin
  glBindTransformFeedbackNV := dglGetProcAddress('glBindTransformFeedbackNV');
  glDeleteTransformFeedbacksNV := dglGetProcAddress('glDeleteTransformFeedbacksNV');
  glGenTransformFeedbacksNV := dglGetProcAddress('glGenTransformFeedbacksNV');
  glIsTransformFeedbackNV := dglGetProcAddress('glIsTransformFeedbackNV');
  glPauseTransformFeedbackNV := dglGetProcAddress('glPauseTransformFeedbackNV');
  glResumeTransformFeedbackNV := dglGetProcAddress('glResumeTransformFeedbackNV');
  glDrawTransformFeedbackNV := dglGetProcAddress('glDrawTransformFeedbackNV');
end;

procedure Read_GL_NV_video_capture;
begin
  glBeginVideoCaptureNV := dglGetProcAddress('glBeginVideoCaptureNV');
  glBindVideoCaptureStreamBufferNV := dglGetProcAddress('glBindVideoCaptureStreamBufferNV');
  glBindVideoCaptureStreamTextureNV := dglGetProcAddress('glBindVideoCaptureStreamTextureNV');
  glEndVideoCaptureNV := dglGetProcAddress('glEndVideoCaptureNV');
  glGetVideoCaptureivNV := dglGetProcAddress('glGetVideoCaptureivNV');
  glGetVideoCaptureStreamivNV := dglGetProcAddress('glGetVideoCaptureStreamivNV');
  glGetVideoCaptureStreamfvNV := dglGetProcAddress('glGetVideoCaptureStreamfvNV');
  glGetVideoCaptureStreamdvNV := dglGetProcAddress('glGetVideoCaptureStreamdvNV');
  glVideoCaptureNV := dglGetProcAddress('glVideoCaptureNV');
  glVideoCaptureStreamParameterivNV := dglGetProcAddress('glVideoCaptureStreamParameterivNV');
  glVideoCaptureStreamParameterfvNV := dglGetProcAddress('glVideoCaptureStreamParameterfvNV');
  glVideoCaptureStreamParameterdvNV := dglGetProcAddress('glVideoCaptureStreamParameterdvNV');
end;

procedure Read_GL_NV_copy_image;
begin
  glCopyImageSubDataNV := dglGetProcAddress('glCopyImageSubDataNV');
end;

procedure Read_GL_NV_shader_buffer_load;
begin
  glMakeBufferResidentNV := dglGetProcAddress('glMakeBufferResidentNV');
  glMakeBufferNonResidentNV := dglGetProcAddress('glMakeBufferNonResidentNV');
  glIsBufferResidentNV := dglGetProcAddress('glIsBufferResidentNV');
  glMakeNamedBufferResidentNV := dglGetProcAddress('glMakeNamedBufferResidentNV');
  glMakeNamedBufferNonResidentNV := dglGetProcAddress('glMakeNamedBufferNonResidentNV');
  glIsNamedBufferResidentNV := dglGetProcAddress('glIsNamedBufferResidentNV');
  glGetBufferParameterui64vNV := dglGetProcAddress('glGetBufferParameterui64vNV');
  glGetNamedBufferParameterui64vNV := dglGetProcAddress('glGetNamedBufferParameterui64vNV');
  glGetIntegerui64vNV := dglGetProcAddress('glGetIntegerui64vNV');
  glUniformui64NV := dglGetProcAddress('glUniformui64NV');
  glUniformui64vNV := dglGetProcAddress('glUniformui64vNV');
  glGetUniformui64vNV := dglGetProcAddress('glGetUniformui64vNV');
  glProgramUniformui64NV := dglGetProcAddress('glProgramUniformui64NV');
  glProgramUniformui64vNV := dglGetProcAddress('glProgramUniformui64vNV');
end;

procedure Read_GL_NV_vertex_buffer_unified_memory;
begin
  glBufferAddressRangeNV := dglGetProcAddress('glBufferAddressRangeNV');
  glVertexFormatNV := dglGetProcAddress('glVertexFormatNV');
  glNormalFormatNV := dglGetProcAddress('glNormalFormatNV');
  glColorFormatNV := dglGetProcAddress('glColorFormatNV');
  glIndexFormatNV := dglGetProcAddress('glIndexFormatNV');
  glTexCoordFormatNV := dglGetProcAddress('glTexCoordFormatNV');
  glEdgeFlagFormatNV := dglGetProcAddress('glEdgeFlagFormatNV');
  glSecondaryColorFormatNV := dglGetProcAddress('glSecondaryColorFormatNV');
  glFogCoordFormatNV := dglGetProcAddress('glFogCoordFormatNV');
  glVertexAttribFormatNV := dglGetProcAddress('glVertexAttribFormatNV');
  glVertexAttribIFormatNV := dglGetProcAddress('glVertexAttribIFormatNV');
  glGetIntegerui64i_vNV := dglGetProcAddress('glGetIntegerui64i_vNV');
end;

procedure Read_GL_NV_gpu_program5;
begin
  glProgramSubroutineParametersuivNV := dglGetProcAddress('glProgramSubroutineParametersuivNV');
  glGetProgramSubroutineParameteruivNV := dglGetProcAddress('glGetProgramSubroutineParameteruivNV');
end;

procedure Read_GL_NV_gpu_shader5;
begin
  glUniform1i64NV := dglGetProcAddress('glUniform1i64NV');
  glUniform2i64NV := dglGetProcAddress('glUniform2i64NV');
  glUniform3i64NV := dglGetProcAddress('glUniform3i64NV');
  glUniform4i64NV := dglGetProcAddress('glUniform4i64NV');
  glUniform1i64vNV := dglGetProcAddress('glUniform1i64vNV');
  glUniform2i64vNV := dglGetProcAddress('glUniform2i64vNV');
  glUniform3i64vNV := dglGetProcAddress('glUniform3i64vNV');
  glUniform4i64vNV := dglGetProcAddress('glUniform4i64vNV');
  glUniform1ui64NV := dglGetProcAddress('glUniform1ui64NV');
  glUniform2ui64NV := dglGetProcAddress('glUniform2ui64NV');
  glUniform3ui64NV := dglGetProcAddress('glUniform3ui64NV');
  glUniform4ui64NV := dglGetProcAddress('glUniform4ui64NV');
  glUniform1ui64vNV := dglGetProcAddress('glUniform1ui64vNV');
  glUniform2ui64vNV := dglGetProcAddress('glUniform2ui64vNV');
  glUniform3ui64vNV := dglGetProcAddress('glUniform3ui64vNV');
  glUniform4ui64vNV := dglGetProcAddress('glUniform4ui64vNV');
  glGetUniformi64vNV := dglGetProcAddress('glGetUniformi64vNV');
  glProgramUniform1i64NV := dglGetProcAddress('glProgramUniform1i64NV');
  glProgramUniform2i64NV := dglGetProcAddress('glProgramUniform2i64NV');
  glProgramUniform3i64NV := dglGetProcAddress('glProgramUniform3i64NV');
  glProgramUniform4i64NV := dglGetProcAddress('glProgramUniform4i64NV');
  glProgramUniform1i64vNV := dglGetProcAddress('glProgramUniform1i64vNV');
  glProgramUniform2i64vNV := dglGetProcAddress('glProgramUniform2i64vNV');
  glProgramUniform3i64vNV := dglGetProcAddress('glProgramUniform3i64vNV');
  glProgramUniform4i64vNV := dglGetProcAddress('glProgramUniform4i64vNV');
  glProgramUniform1ui64NV := dglGetProcAddress('glProgramUniform1ui64NV');
  glProgramUniform2ui64NV := dglGetProcAddress('glProgramUniform2ui64NV');
  glProgramUniform3ui64NV := dglGetProcAddress('glProgramUniform3ui64NV');
  glProgramUniform4ui64NV := dglGetProcAddress('glProgramUniform4ui64NV');
  glProgramUniform1ui64vNV := dglGetProcAddress('glProgramUniform1ui64vNV');
  glProgramUniform2ui64vNV := dglGetProcAddress('glProgramUniform2ui64vNV');
  glProgramUniform3ui64vNV := dglGetProcAddress('glProgramUniform3ui64vNV');
  glProgramUniform4ui64vNV := dglGetProcAddress('glProgramUniform4ui64vNV');
end;

procedure Read_GL_NV_vertex_attrib_integer_64bit;
begin
  glVertexAttribL1i64NV := dglGetProcAddress('glVertexAttribL1i64NV');
  glVertexAttribL2i64NV := dglGetProcAddress('glVertexAttribL2i64NV');
  glVertexAttribL3i64NV := dglGetProcAddress('glVertexAttribL3i64NV');
  glVertexAttribL4i64NV := dglGetProcAddress('glVertexAttribL4i64NV');
  glVertexAttribL1i64vNV := dglGetProcAddress('glVertexAttribL1i64vNV');
  glVertexAttribL2i64vNV := dglGetProcAddress('glVertexAttribL2i64vNV');
  glVertexAttribL3i64vNV := dglGetProcAddress('glVertexAttribL3i64vNV');
  glVertexAttribL4i64vNV := dglGetProcAddress('glVertexAttribL4i64vNV');
  glVertexAttribL1ui64NV := dglGetProcAddress('glVertexAttribL1ui64NV');
  glVertexAttribL2ui64NV := dglGetProcAddress('glVertexAttribL2ui64NV');
  glVertexAttribL3ui64NV := dglGetProcAddress('glVertexAttribL3ui64NV');
  glVertexAttribL4ui64NV := dglGetProcAddress('glVertexAttribL4ui64NV');
  glVertexAttribL1ui64vNV := dglGetProcAddress('glVertexAttribL1ui64vNV');
  glVertexAttribL2ui64vNV := dglGetProcAddress('glVertexAttribL2ui64vNV');
  glVertexAttribL3ui64vNV := dglGetProcAddress('glVertexAttribL3ui64vNV');
  glVertexAttribL4ui64vNV := dglGetProcAddress('glVertexAttribL4ui64vNV');
  glGetVertexAttribLi64vNV := dglGetProcAddress('glGetVertexAttribLi64vNV');
  glGetVertexAttribLui64vNV := dglGetProcAddress('glGetVertexAttribLui64vNV');
  glVertexAttribLFormatNV := dglGetProcAddress('glVertexAttribLFormatNV');
end;  

procedure Read_GL_NV_vdpau_interop;
begin
  glVDPAUInitNV := dglGetProcAddress('glVDPAUInitNV');
  glVDPAUFiniNV := dglGetProcAddress('glVDPAUFiniNV');
  glVDPAURegisterVideoSurfaceNV := dglGetProcAddress('glVDPAURegisterVideoSurfaceNV');
  glVDPAURegisterOutputSurfaceNV := dglGetProcAddress('glVDPAURegisterOutputSurfaceNV');
  glVDPAUIsSurfaceNV := dglGetProcAddress('glVDPAUIsSurfaceNV');
  glVDPAUUnregisterSurfaceNV := dglGetProcAddress('glVDPAUUnregisterSurfaceNV');
  glVDPAUGetSurfaceivNV := dglGetProcAddress('glVDPAUGetSurfaceivNV');
  glVDPAUSurfaceAccessNV := dglGetProcAddress('glVDPAUSurfaceAccessNV');
  glVDPAUMapSurfacesNV := dglGetProcAddress('glVDPAUMapSurfacesNV');
  glVDPAUUnmapSurfacesNV := dglGetProcAddress('glVDPAUUnmapSurfacesNV');
end;
  
procedure Read_GL_NV_texture_barrier;
begin
  glTextureBarrierNV := dglGetProcAddress('glTextureBarrierNV');
end;

procedure Read_GL_PGI_misc_hints;
begin
  glHintPGI := dglGetProcAddress('glHintPGI');
end;

procedure Read_GL_SGIS_detail_texture;
begin
  glDetailTexFuncSGIS := dglGetProcAddress('glDetailTexFuncSGIS');
  glGetDetailTexFuncSGIS := dglGetProcAddress('glGetDetailTexFuncSGIS');
end;

procedure Read_GL_SGIS_fog_function;
begin
  glFogFuncSGIS := dglGetProcAddress('glFogFuncSGIS');
  glGetFogFuncSGIS := dglGetProcAddress('glGetFogFuncSGIS');
end;

procedure Read_GL_SGIS_multisample;
begin
  glSampleMaskSGIS := dglGetProcAddress('glSampleMaskSGIS');
  glSamplePatternSGIS := dglGetProcAddress('glSamplePatternSGIS');
end;

procedure Read_GL_SGIS_pixel_texture;
begin
  glPixelTexGenParameteriSGIS := dglGetProcAddress('glPixelTexGenParameteriSGIS');
  glPixelTexGenParameterivSGIS := dglGetProcAddress('glPixelTexGenParameterivSGIS');
  glPixelTexGenParameterfSGIS := dglGetProcAddress('glPixelTexGenParameterfSGIS');
  glPixelTexGenParameterfvSGIS := dglGetProcAddress('glPixelTexGenParameterfvSGIS');
  glGetPixelTexGenParameterivSGIS := dglGetProcAddress('glGetPixelTexGenParameterivSGIS');
  glGetPixelTexGenParameterfvSGIS := dglGetProcAddress('glGetPixelTexGenParameterfvSGIS');
end;

procedure Read_GL_SGIS_point_parameters;
begin
  glPointParameterfSGIS := dglGetProcAddress('glPointParameterfSGIS');
  glPointParameterfvSGIS := dglGetProcAddress('glPointParameterfvSGIS');
end;

procedure Read_GL_SGIS_sharpen_texture;
begin
  glSharpenTexFuncSGIS := dglGetProcAddress('glSharpenTexFuncSGIS');
  glGetSharpenTexFuncSGIS := dglGetProcAddress('glGetSharpenTexFuncSGIS');
end;

procedure Read_GL_SGIS_texture4D;
begin
  glTexImage4DSGIS := dglGetProcAddress('glTexImage4DSGIS');
  glTexSubImage4DSGIS := dglGetProcAddress('glTexSubImage4DSGIS');
end;

procedure Read_GL_SGIS_texture_color_mask;
begin
  glTextureColorMaskSGIS := dglGetProcAddress('glTextureColorMaskSGIS');
end;

procedure Read_GL_SGIS_texture_filter4;
begin
  glGetTexFilterFuncSGIS := dglGetProcAddress('glGetTexFilterFuncSGIS');
  glTexFilterFuncSGIS := dglGetProcAddress('glTexFilterFuncSGIS');
end;

procedure Read_GL_SGIX_async;
begin
  glAsyncMarkerSGIX := dglGetProcAddress('glAsyncMarkerSGIX');
  glFinishAsyncSGIX := dglGetProcAddress('glFinishAsyncSGIX');
  glPollAsyncSGIX := dglGetProcAddress('glPollAsyncSGIX');
  glGenAsyncMarkersSGIX := dglGetProcAddress('glGenAsyncMarkersSGIX');
  glDeleteAsyncMarkersSGIX := dglGetProcAddress('glDeleteAsyncMarkersSGIX');
  glIsAsyncMarkerSGIX := dglGetProcAddress('glIsAsyncMarkerSGIX');
end;

procedure Read_GL_SGIX_flush_raster;
begin
  glFlushRasterSGIX := dglGetProcAddress('glFlushRasterSGIX');
end;

procedure Read_GL_SGIX_fragment_lighting;
begin
  glFragmentColorMaterialSGIX := dglGetProcAddress('glFragmentColorMaterialSGIX');
  glFragmentLightfSGIX := dglGetProcAddress('glFragmentLightfSGIX');
  glFragmentLightfvSGIX := dglGetProcAddress('glFragmentLightfvSGIX');
  glFragmentLightiSGIX := dglGetProcAddress('glFragmentLightiSGIX');
  glFragmentLightivSGIX := dglGetProcAddress('glFragmentLightivSGIX');
  glFragmentLightModelfSGIX := dglGetProcAddress('glFragmentLightModelfSGIX');
  glFragmentLightModelfvSGIX := dglGetProcAddress('glFragmentLightModelfvSGIX');
  glFragmentLightModeliSGIX := dglGetProcAddress('glFragmentLightModeliSGIX');
  glFragmentLightModelivSGIX := dglGetProcAddress('glFragmentLightModelivSGIX');
  glFragmentMaterialfSGIX := dglGetProcAddress('glFragmentMaterialfSGIX');
  glFragmentMaterialfvSGIX := dglGetProcAddress('glFragmentMaterialfvSGIX');
  glFragmentMaterialiSGIX := dglGetProcAddress('glFragmentMaterialiSGIX');
  glFragmentMaterialivSGIX := dglGetProcAddress('glFragmentMaterialivSGIX');
  glGetFragmentLightfvSGIX := dglGetProcAddress('glGetFragmentLightfvSGIX');
  glGetFragmentLightivSGIX := dglGetProcAddress('glGetFragmentLightivSGIX');
  glGetFragmentMaterialfvSGIX := dglGetProcAddress('glGetFragmentMaterialfvSGIX');
  glGetFragmentMaterialivSGIX := dglGetProcAddress('glGetFragmentMaterialivSGIX');
  glLightEnviSGIX := dglGetProcAddress('glLightEnviSGIX');
end;

procedure Read_GL_SGIX_framezoom;
begin
  glFrameZoomSGIX := dglGetProcAddress('glFrameZoomSGIX');
end;

procedure Read_GL_SGIX_igloo_interface;
begin
  glIglooInterfaceSGIX := dglGetProcAddress('glIglooInterfaceSGIX');
end;

procedure Read_GL_SGIX_instruments;
begin
  glGetInstrumentsSGIX := dglGetProcAddress('glGetInstrumentsSGIX');
  glInstrumentsBufferSGIX := dglGetProcAddress('glInstrumentsBufferSGIX');
  glPollInstrumentsSGIX := dglGetProcAddress('glPollInstrumentsSGIX');
  glReadInstrumentsSGIX := dglGetProcAddress('glReadInstrumentsSGIX');
  glStartInstrumentsSGIX := dglGetProcAddress('glStartInstrumentsSGIX');
  glStopInstrumentsSGIX := dglGetProcAddress('glStopInstrumentsSGIX');
end;

procedure Read_GL_SGIX_list_priority;
begin
  glGetListParameterfvSGIX := dglGetProcAddress('glGetListParameterfvSGIX');
  glGetListParameterivSGIX := dglGetProcAddress('glGetListParameterivSGIX');
  glListParameterfSGIX := dglGetProcAddress('glListParameterfSGIX');
  glListParameterfvSGIX := dglGetProcAddress('glListParameterfvSGIX');
  glListParameteriSGIX := dglGetProcAddress('glListParameteriSGIX');
  glListParameterivSGIX := dglGetProcAddress('glListParameterivSGIX');
end;

procedure Read_GL_SGIX_pixel_texture;
begin
  glPixelTexGenSGIX := dglGetProcAddress('glPixelTexGenSGIX');
end;

procedure Read_GL_SGIX_polynomial_ffd;
begin
  glDeformationMap3dSGIX := dglGetProcAddress('glDeformationMap3dSGIX');
  glDeformationMap3fSGIX := dglGetProcAddress('glDeformationMap3fSGIX');
  glDeformSGIX := dglGetProcAddress('glDeformSGIX');
  glLoadIdentityDeformationMapSGIX := dglGetProcAddress('glLoadIdentityDeformationMapSGIX');
end;

procedure Read_GL_SGIX_reference_plane;
begin
  glReferencePlaneSGIX := dglGetProcAddress('glReferencePlaneSGIX');
end;

procedure Read_GL_SGIX_sprite;
begin
  glSpriteParameterfSGIX := dglGetProcAddress('glSpriteParameterfSGIX');
  glSpriteParameterfvSGIX := dglGetProcAddress('glSpriteParameterfvSGIX');
  glSpriteParameteriSGIX := dglGetProcAddress('glSpriteParameteriSGIX');
  glSpriteParameterivSGIX := dglGetProcAddress('glSpriteParameterivSGIX');
end;

procedure Read_GL_SGIX_tag_sample_buffer;
begin
  glTagSampleBufferSGIX := dglGetProcAddress('glTagSampleBufferSGIX');
end;

procedure Read_GL_SGI_color_table;
begin
  glColorTableSGI := dglGetProcAddress('glColorTableSGI');
  glColorTableParameterfvSGI := dglGetProcAddress('glColorTableParameterfvSGI');
  glColorTableParameterivSGI := dglGetProcAddress('glColorTableParameterivSGI');
  glCopyColorTableSGI := dglGetProcAddress('glCopyColorTableSGI');
  glGetColorTableSGI := dglGetProcAddress('glGetColorTableSGI');
  glGetColorTableParameterfvSGI := dglGetProcAddress('glGetColorTableParameterfvSGI');
  glGetColorTableParameterivSGI := dglGetProcAddress('glGetColorTableParameterivSGI');
end;

procedure Read_GL_SUNX_constant_data;
begin
  glFinishTextureSUNX := dglGetProcAddress('glFinishTextureSUNX');
end;

procedure Read_GL_SUN_global_alpha;
begin
  glGlobalAlphaFactorbSUN := dglGetProcAddress('glGlobalAlphaFactorbSUN');
  glGlobalAlphaFactorsSUN := dglGetProcAddress('glGlobalAlphaFactorsSUN');
  glGlobalAlphaFactoriSUN := dglGetProcAddress('glGlobalAlphaFactoriSUN');
  glGlobalAlphaFactorfSUN := dglGetProcAddress('glGlobalAlphaFactorfSUN');
  glGlobalAlphaFactordSUN := dglGetProcAddress('glGlobalAlphaFactordSUN');
  glGlobalAlphaFactorubSUN := dglGetProcAddress('glGlobalAlphaFactorubSUN');
  glGlobalAlphaFactorusSUN := dglGetProcAddress('glGlobalAlphaFactorusSUN');
  glGlobalAlphaFactoruiSUN := dglGetProcAddress('glGlobalAlphaFactoruiSUN');
end;

procedure Read_GL_SUN_mesh_array;
begin
  glDrawMeshArraysSUN := dglGetProcAddress('glDrawMeshArraysSUN');
end;

procedure Read_GL_SUN_triangle_list;
begin
  glReplacementCodeuiSUN := dglGetProcAddress('glReplacementCodeuiSUN');
  glReplacementCodeusSUN := dglGetProcAddress('glReplacementCodeusSUN');
  glReplacementCodeubSUN := dglGetProcAddress('glReplacementCodeubSUN');
  glReplacementCodeuivSUN := dglGetProcAddress('glReplacementCodeuivSUN');
  glReplacementCodeusvSUN := dglGetProcAddress('glReplacementCodeusvSUN');
  glReplacementCodeubvSUN := dglGetProcAddress('glReplacementCodeubvSUN');
  glReplacementCodePointerSUN := dglGetProcAddress('glReplacementCodePointerSUN');
end;

procedure Read_GL_SUN_vertex;
begin
  glColor4ubVertex2fSUN := dglGetProcAddress('glColor4ubVertex2fSUN');
  glColor4ubVertex2fvSUN := dglGetProcAddress('glColor4ubVertex2fvSUN');
  glColor4ubVertex3fSUN := dglGetProcAddress('glColor4ubVertex3fSUN');
  glColor4ubVertex3fvSUN := dglGetProcAddress('glColor4ubVertex3fvSUN');
  glColor3fVertex3fSUN := dglGetProcAddress('glColor3fVertex3fSUN');
  glColor3fVertex3fvSUN := dglGetProcAddress('glColor3fVertex3fvSUN');
  glNormal3fVertex3fSUN := dglGetProcAddress('glNormal3fVertex3fSUN');
  glNormal3fVertex3fvSUN := dglGetProcAddress('glNormal3fVertex3fvSUN');
  glColor4fNormal3fVertex3fSUN := dglGetProcAddress('glColor4fNormal3fVertex3fSUN');
  glColor4fNormal3fVertex3fvSUN := dglGetProcAddress('glColor4fNormal3fVertex3fvSUN');
  glTexCoord2fVertex3fSUN := dglGetProcAddress('glTexCoord2fVertex3fSUN');
  glTexCoord2fVertex3fvSUN := dglGetProcAddress('glTexCoord2fVertex3fvSUN');
  glTexCoord4fVertex4fSUN := dglGetProcAddress('glTexCoord4fVertex4fSUN');
  glTexCoord4fVertex4fvSUN := dglGetProcAddress('glTexCoord4fVertex4fvSUN');
  glTexCoord2fColor4ubVertex3fSUN := dglGetProcAddress('glTexCoord2fColor4ubVertex3fSUN');
  glTexCoord2fColor4ubVertex3fvSUN := dglGetProcAddress('glTexCoord2fColor4ubVertex3fvSUN');
  glTexCoord2fColor3fVertex3fSUN := dglGetProcAddress('glTexCoord2fColor3fVertex3fSUN');
  glTexCoord2fColor3fVertex3fvSUN := dglGetProcAddress('glTexCoord2fColor3fVertex3fvSUN');
  glTexCoord2fNormal3fVertex3fSUN := dglGetProcAddress('glTexCoord2fNormal3fVertex3fSUN');
  glTexCoord2fNormal3fVertex3fvSUN := dglGetProcAddress('glTexCoord2fNormal3fVertex3fvSUN');
  glTexCoord2fColor4fNormal3fVertex3fSUN := dglGetProcAddress('glTexCoord2fColor4fNormal3fVertex3fSUN');
  glTexCoord2fColor4fNormal3fVertex3fvSUN := dglGetProcAddress('glTexCoord2fColor4fNormal3fVertex3fvSUN');
  glTexCoord4fColor4fNormal3fVertex4fSUN := dglGetProcAddress('glTexCoord4fColor4fNormal3fVertex4fSUN');
  glTexCoord4fColor4fNormal3fVertex4fvSUN := dglGetProcAddress('glTexCoord4fColor4fNormal3fVertex4fvSUN');
  glReplacementCodeuiVertex3fSUN := dglGetProcAddress('glReplacementCodeuiVertex3fSUN');
  glReplacementCodeuiVertex3fvSUN := dglGetProcAddress('glReplacementCodeuiVertex3fvSUN');
  glReplacementCodeuiColor4ubVertex3fSUN := dglGetProcAddress('glReplacementCodeuiColor4ubVertex3fSUN');
  glReplacementCodeuiColor4ubVertex3fvSUN := dglGetProcAddress('glReplacementCodeuiColor4ubVertex3fvSUN');
  glReplacementCodeuiColor3fVertex3fSUN := dglGetProcAddress('glReplacementCodeuiColor3fVertex3fSUN');
  glReplacementCodeuiColor3fVertex3fvSUN := dglGetProcAddress('glReplacementCodeuiColor3fVertex3fvSUN');
  glReplacementCodeuiNormal3fVertex3fSUN := dglGetProcAddress('glReplacementCodeuiNormal3fVertex3fSUN');
  glReplacementCodeuiNormal3fVertex3fvSUN := dglGetProcAddress('glReplacementCodeuiNormal3fVertex3fvSUN');
  glReplacementCodeuiColor4fNormal3fVertex3fSUN := dglGetProcAddress('glReplacementCodeuiColor4fNormal3fVertex3fSUN');
  glReplacementCodeuiColor4fNormal3fVertex3fvSUN := dglGetProcAddress('glReplacementCodeuiColor4fNormal3fVertex3fvSUN');
  glReplacementCodeuiTexCoord2fVertex3fSUN := dglGetProcAddress('glReplacementCodeuiTexCoord2fVertex3fSUN');
  glReplacementCodeuiTexCoord2fVertex3fvSUN := dglGetProcAddress('glReplacementCodeuiTexCoord2fVertex3fvSUN');
  glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN := dglGetProcAddress('glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN');
  glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN := dglGetProcAddress('glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN');
  glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN := dglGetProcAddress('glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN');
  glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN := dglGetProcAddress('glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN');
end;

{$IFDEF DGL_WIN}
procedure Read_WGL_ARB_buffer_region;
begin
  wglCreateBufferRegionARB := dglGetProcAddress('wglCreateBufferRegionARB');
  wglDeleteBufferRegionARB := dglGetProcAddress('wglDeleteBufferRegionARB');
  wglSaveBufferRegionARB := dglGetProcAddress('wglSaveBufferRegionARB');
  wglRestoreBufferRegionARB := dglGetProcAddress('wglRestoreBufferRegionARB');
end;

procedure Read_WGL_ARB_extensions_string;
begin
  wglGetExtensionsStringARB := dglGetProcAddress('wglGetExtensionsStringARB');
end;

procedure Read_WGL_ARB_make_current_read;
begin
  wglMakeContextCurrentARB := dglGetProcAddress('wglMakeContextCurrentARB');
  wglGetCurrentReadDCARB := dglGetProcAddress('wglGetCurrentReadDCARB');
end;

procedure Read_WGL_ARB_pbuffer;
begin
  wglCreatePbufferARB := dglGetProcAddress('wglCreatePbufferARB');
  wglGetPbufferDCARB := dglGetProcAddress('wglGetPbufferDCARB');
  wglReleasePbufferDCARB := dglGetProcAddress('wglReleasePbufferDCARB');
  wglDestroyPbufferARB := dglGetProcAddress('wglDestroyPbufferARB');
  wglQueryPbufferARB := dglGetProcAddress('wglQueryPbufferARB');
end;

procedure Read_WGL_ARB_pixel_format;
begin
  wglGetPixelFormatAttribivARB := dglGetProcAddress('wglGetPixelFormatAttribivARB');
  wglGetPixelFormatAttribfvARB := dglGetProcAddress('wglGetPixelFormatAttribfvARB');
  wglChoosePixelFormatARB := dglGetProcAddress('wglChoosePixelFormatARB');
end;

procedure Read_WGL_ARB_pixel_format_float;
begin
  wglClampColorARB := dglGetProcAddress('wglClampColorARB');
end;

procedure Read_WGL_ARB_render_texture;
begin
  wglBindTexImageARB := dglGetProcAddress('wglBindTexImageARB');
  wglReleaseTexImageARB := dglGetProcAddress('wglReleaseTexImageARB');
  wglSetPbufferAttribARB := dglGetProcAddress('wglSetPbufferAttribARB');
end;

procedure Read_WGL_ARB_create_context;
begin
  wglCreateContextAttribsARB := dglGetProcAddress('wglCreateContextAttribsARB');
end;

procedure Read_WGL_AMD_gpu_association;
begin
  wglGetGPUIDsAMD := dglGetProcAddress('wglGetGPUIDsAMD');
  wglGetGPUInfoAMD := dglGetProcAddress('wglGetGPUInfoAMD');
  wglGetContextGPUIDAMD := dglGetProcAddress('wglGetContextGPUIDAMD');
  wglCreateAssociatedContextAMD := dglGetProcAddress('wglCreateAssociatedContextAMD');
  wglCreateAssociatedContextAttribsAMD := dglGetProcAddress('wglCreateAssociatedContextAttribsAMD');
  wglDeleteAssociatedContextAMD := dglGetProcAddress('wglDeleteAssociatedContextAMD');
  wglMakeAssociatedContextCurrentAMD := dglGetProcAddress('wglMakeAssociatedContextCurrentAMD');
  wglGetCurrentAssociatedContextAMD := dglGetProcAddress('wglGetCurrentAssociatedContextAMD');
  wglBlitContextFramebufferAMD := dglGetProcAddress('wglBlitContextFramebufferAMD');
end;

procedure Read_WGL_EXT_display_color_table;
begin
  wglCreateDisplayColorTableEXT := dglGetProcAddress('wglCreateDisplayColorTableEXT');
  wglLoadDisplayColorTableEXT := dglGetProcAddress('wglLoadDisplayColorTableEXT');
  wglBindDisplayColorTableEXT := dglGetProcAddress('wglBindDisplayColorTableEXT');
  wglDestroyDisplayColorTableEXT := dglGetProcAddress('wglDestroyDisplayColorTableEXT');
end;

procedure Read_WGL_EXT_extensions_string;
begin
  wglGetExtensionsStringEXT := dglGetProcAddress('wglGetExtensionsStringEXT');
end;

procedure Read_WGL_EXT_make_current_read;
begin
  wglMakeContextCurrentEXT := dglGetProcAddress('wglMakeContextCurrentEXT');
  wglGetCurrentReadDCEXT := dglGetProcAddress('wglGetCurrentReadDCEXT');
end;

procedure Read_WGL_EXT_pbuffer;
begin
  wglCreatePbufferEXT := dglGetProcAddress('wglCreatePbufferEXT');
  wglGetPbufferDCEXT := dglGetProcAddress('wglGetPbufferDCEXT');
  wglReleasePbufferDCEXT := dglGetProcAddress('wglReleasePbufferDCEXT');
  wglDestroyPbufferEXT := dglGetProcAddress('wglDestroyPbufferEXT');
  wglQueryPbufferEXT := dglGetProcAddress('wglQueryPbufferEXT');
end;

procedure Read_WGL_EXT_pixel_format;
begin
  wglGetPixelFormatAttribivEXT := dglGetProcAddress('wglGetPixelFormatAttribivEXT');
  wglGetPixelFormatAttribfvEXT := dglGetProcAddress('wglGetPixelFormatAttribfvEXT');
  wglChoosePixelFormatEXT := dglGetProcAddress('wglChoosePixelFormatEXT');
end;

procedure Read_WGL_EXT_swap_control;
begin
  wglSwapIntervalEXT := dglGetProcAddress('wglSwapIntervalEXT');
  wglGetSwapIntervalEXT := dglGetProcAddress('wglGetSwapIntervalEXT');
end;

procedure Read_WGL_I3D_digital_video_control;
begin
  wglGetDigitalVideoParametersI3D := dglGetProcAddress('wglGetDigitalVideoParametersI3D');
  wglSetDigitalVideoParametersI3D := dglGetProcAddress('wglSetDigitalVideoParametersI3D');
end;

procedure Read_WGL_I3D_gamma;
begin
  wglGetGammaTableParametersI3D := dglGetProcAddress('wglGetGammaTableParametersI3D');
  wglSetGammaTableParametersI3D := dglGetProcAddress('wglSetGammaTableParametersI3D');
  wglGetGammaTableI3D := dglGetProcAddress('wglGetGammaTableI3D');
  wglSetGammaTableI3D := dglGetProcAddress('wglSetGammaTableI3D');
end;

procedure Read_WGL_I3D_genlock;
begin
  wglEnableGenlockI3D := dglGetProcAddress('wglEnableGenlockI3D');
  wglDisableGenlockI3D := dglGetProcAddress('wglDisableGenlockI3D');
  wglIsEnabledGenlockI3D := dglGetProcAddress('wglIsEnabledGenlockI3D');
  wglGenlockSourceI3D := dglGetProcAddress('wglGenlockSourceI3D');
  wglGetGenlockSourceI3D := dglGetProcAddress('wglGetGenlockSourceI3D');
  wglGenlockSourceEdgeI3D := dglGetProcAddress('wglGenlockSourceEdgeI3D');
  wglGetGenlockSourceEdgeI3D := dglGetProcAddress('wglGetGenlockSourceEdgeI3D');
  wglGenlockSampleRateI3D := dglGetProcAddress('wglGenlockSampleRateI3D');
  wglGetGenlockSampleRateI3D := dglGetProcAddress('wglGetGenlockSampleRateI3D');
  wglGenlockSourceDelayI3D := dglGetProcAddress('wglGenlockSourceDelayI3D');
  wglGetGenlockSourceDelayI3D := dglGetProcAddress('wglGetGenlockSourceDelayI3D');
  wglQueryGenlockMaxSourceDelayI3D := dglGetProcAddress('wglQueryGenlockMaxSourceDelayI3D');
end;

procedure Read_WGL_I3D_image_buffer;
begin
  wglCreateImageBufferI3D := dglGetProcAddress('wglCreateImageBufferI3D');
  wglDestroyImageBufferI3D := dglGetProcAddress('wglDestroyImageBufferI3D');
  wglAssociateImageBufferEventsI3D := dglGetProcAddress('wglAssociateImageBufferEventsI3D');
  wglReleaseImageBufferEventsI3D := dglGetProcAddress('wglReleaseImageBufferEventsI3D');
end;

procedure Read_WGL_I3D_swap_frame_lock;
begin
  wglEnableFrameLockI3D := dglGetProcAddress('wglEnableFrameLockI3D');
  wglDisableFrameLockI3D := dglGetProcAddress('wglDisableFrameLockI3D');
  wglIsEnabledFrameLockI3D := dglGetProcAddress('wglIsEnabledFrameLockI3D');
  wglQueryFrameLockMasterI3D := dglGetProcAddress('wglQueryFrameLockMasterI3D');
end;

procedure Read_WGL_I3D_swap_frame_usage;
begin
  wglGetFrameUsageI3D := dglGetProcAddress('wglGetFrameUsageI3D');
  wglBeginFrameTrackingI3D := dglGetProcAddress('wglBeginFrameTrackingI3D');
  wglEndFrameTrackingI3D := dglGetProcAddress('wglEndFrameTrackingI3D');
  wglQueryFrameTrackingI3D := dglGetProcAddress('wglQueryFrameTrackingI3D');
end;

procedure Read_WGL_NV_vertex_array_range;
begin
  wglAllocateMemoryNV := dglGetProcAddress('wglAllocateMemoryNV');
  wglFreeMemoryNV := dglGetProcAddress('wglFreeMemoryNV');
end;

procedure Read_WGL_NV_present_video;
begin
  wglEnumerateVideoDevicesNV := dglGetProcAddress('wglEnumerateVideoDevicesNV');
  wglBindVideoDeviceNV := dglGetProcAddress('wglBindVideoDeviceNV');
  wglQueryCurrentContextNV := dglGetProcAddress('wglQueryCurrentContextNV');
end;

procedure Read_WGL_NV_video_output;
begin
  wglGetVideoDeviceNV := dglGetProcAddress('wglGetVideoDeviceNV');
  wglReleaseVideoDeviceNV := dglGetProcAddress('wglReleaseVideoDeviceNV');
  wglBindVideoImageNV := dglGetProcAddress('wglBindVideoImageNV');
  wglReleaseVideoImageNV := dglGetProcAddress('wglReleaseVideoImageNV');
  wglSendPbufferToVideoNV := dglGetProcAddress('wglSendPbufferToVideoNV');
  wglGetVideoInfoNV := dglGetProcAddress('wglGetVideoInfoNV');
end;

procedure Read_WGL_NV_swap_group;
begin
  wglJoinSwapGroupNV := dglGetProcAddress('wglJoinSwapGroupNV');
  wglBindSwapBarrierNV := dglGetProcAddress('wglBindSwapBarrierNV');
  wglQuerySwapGroupNV := dglGetProcAddress('wglQuerySwapGroupNV');
  wglQueryMaxSwapGroupsNV := dglGetProcAddress('wglQueryMaxSwapGroupsNV');
  wglQueryFrameCountNV := dglGetProcAddress('wglQueryFrameCountNV');
  wglResetFrameCountNV := dglGetProcAddress('wglResetFrameCountNV');
end;

procedure Read_WGL_NV_gpu_affinity;
begin
  wglEnumGpusNV := dglGetProcAddress('wglEnumGpusNV');
  wglEnumGpuDevicesNV := dglGetProcAddress('wglEnumGpuDevicesNV');
  wglCreateAffinityDCNV := dglGetProcAddress('wglCreateAffinityDCNV');
  wglEnumGpusFromAffinityDCNV := dglGetProcAddress('wglEnumGpusFromAffinityDCNV');
  wglDeleteDCNV := dglGetProcAddress('wglDeleteDCNV');
end;

procedure Read_WGL_NV_video_capture;
begin
  wglBindVideoCaptureDeviceNV := dglGetProcAddress('wglBindVideoCaptureDeviceNV');
  wglEnumerateVideoCaptureDevicesNV := dglGetProcAddress('wglEnumerateVideoCaptureDevicesNV');
  wglLockVideoCaptureDeviceNV := dglGetProcAddress('wglLockVideoCaptureDeviceNV');
  wglQueryVideoCaptureDeviceNV := dglGetProcAddress('wglQueryVideoCaptureDeviceNV');
  wglReleaseVideoCaptureDeviceNV := dglGetProcAddress('wglReleaseVideoCaptureDeviceNV');
end;

procedure Read_WGL_NV_copy_image;
begin
  wglCopyImageSubDataNV := dglGetProcAddress('wglCopyImageSubDataNV');
end;

procedure Read_WGL_OML_sync_control;
begin
  wglGetSyncValuesOML := dglGetProcAddress('wglGetSyncValuesOML');
  wglGetMscRateOML := dglGetProcAddress('wglGetMscRateOML');
  wglSwapBuffersMscOML := dglGetProcAddress('wglSwapBuffersMscOML');
  wglSwapLayerBuffersMscOML := dglGetProcAddress('wglSwapLayerBuffersMscOML');
  wglWaitForMscOML := dglGetProcAddress('wglWaitForMscOML');
  wglWaitForSbcOML := dglGetProcAddress('wglWaitForSbcOML');
end;

procedure Read_WGL_3DL_stereo_control;
begin
  wglSetStereoEmitterState3DL := dglGetProcAddress('wglSetStereoEmitterState3DL');
end;

procedure Read_WIN_draw_range_elements;
begin
  glDrawRangeElementsWIN := dglGetProcAddress('glDrawRangeElementsWIN');
end;

procedure Read_WIN_swap_hint;
begin
  glAddSwapHintRectWIN := dglGetProcAddress('glAddSwapHintRectWIN');
end;
{$ENDIF}


procedure ReadExtensions;
begin
  ReadOpenGLCore;
  
  Read_GL_3DFX_tbuffer;
  Read_GL_APPLE_element_array;
  Read_GL_APPLE_fence;
  Read_GL_APPLE_vertex_array_object;
  Read_GL_APPLE_vertex_array_range;
  Read_GL_APPLE_texture_range;
  Read_GL_APPLE_vertex_program_evaluators;
  Read_GL_APPLE_object_purgeable;
  Read_GL_ARB_matrix_palette;
  Read_GL_ARB_multitexture;
  Read_GL_ARB_point_parameters;
  Read_GL_ARB_texture_compression;
  Read_GL_ARB_transpose_matrix;
  Read_GL_ARB_vertex_blend;
  Read_GL_ARB_vertex_buffer_object;
  Read_GL_ARB_vertex_program;
  Read_GL_ARB_window_pos;
  Read_GL_ARB_color_buffer_float;
  Read_GL_ARB_Shader_Objects;
  Read_GL_ARB_occlusion_query;
  Read_GL_ARB_draw_instanced;
  Read_GL_ARB_framebuffer_object;
  Read_GL_ARB_geometry_shader4;
  Read_GL_ARB_instanced_arrays;
  Read_GL_ARB_map_buffer_range;
  Read_GL_ARB_texture_buffer_object;
  Read_GL_ARB_vertex_array_object;
  Read_GL_ARB_uniform_buffer_object;
  Read_GL_ARB_copy_buffer;
  Read_GL_ARB_draw_elements_base_vertex;
  Read_GL_ARB_provoking_vertex;
  Read_GL_ARB_sync;
  Read_GL_ARB_texture_multisample;
  Read_GL_ARB_draw_buffers_blend;
  Read_GL_ARB_sample_shading;
  Read_GL_ARB_shading_language_include;
  Read_GL_ARB_blend_func_extended;
  Read_GL_ARB_sampler_objects;
  Read_GL_ARB_timer_query;
  Read_GL_ARB_vertex_type_2_10_10_10_rev;
  Read_GL_ARB_draw_indirect;
  Read_GL_ARB_gpu_shader_fp64;
  Read_GL_ARB_shader_subroutine;
  Read_GL_ARB_tessellation_shader;
  Read_GL_ARB_transform_feedback2;
  Read_GL_ARB_transform_feedback3;
  Read_GL_ARB_ES2_compatibility;
  Read_GL_ARB_get_program_binary;
  Read_GL_ARB_separate_shader_objects;
  Read_GL_ARB_vertex_attrib_64bit;
  Read_GL_ARB_viewport_array;
  Read_GL_ARB_cl_event;
  Read_GL_ARB_debug_output;
  Read_GL_ARB_robustness;
  Read_GL_ATI_draw_buffers;
  Read_GL_ATI_element_array;
  Read_GL_ATI_envmap_bumpmap;
  Read_GL_ATI_fragment_shader;
  Read_GL_ATI_map_object_buffer;
  Read_GL_ATI_pn_triangles;
  Read_GL_ATI_separate_stencil;
  Read_GL_ATI_vertex_array_object;
  Read_GL_ATI_vertex_attrib_array_object;
  Read_GL_ATI_vertex_streams;
  Read_GL_AMD_performance_monitor;
  Read_GL_AMD_vertex_shader_tesselator;
  Read_GL_AMD_draw_buffers_blend;
  Read_GL_AMD_name_gen_delete;
  Read_GL_AMD_debug_output;
  Read_GL_EXT_blend_color;
  Read_GL_EXT_blend_func_separate;
  Read_GL_EXT_blend_minmax;
  Read_GL_EXT_color_subtable;
  Read_GL_EXT_compiled_vertex_array;
  Read_GL_EXT_convolution;
  Read_GL_EXT_coordinate_frame;
  Read_GL_EXT_copy_texture;
  Read_GL_EXT_cull_vertex;
  Read_GL_EXT_draw_range_elements;
  Read_GL_EXT_fog_coord;
  Read_GL_EXT_framebuffer_object;
  Read_GL_EXT_histogram;
  Read_GL_EXT_index_func;
  Read_GL_EXT_index_material;
  Read_GL_EXT_multi_draw_arrays;
  Read_GL_EXT_multisample;
  Read_GL_EXT_paletted_texture;
  Read_GL_EXT_pixel_transform;
  Read_GL_EXT_point_parameters;
  Read_GL_EXT_polygon_offset;
  Read_GL_EXT_secondary_color;
  Read_GL_EXT_stencil_two_side;
  Read_GL_EXT_subtexture;
  Read_GL_EXT_texture3D;
  Read_GL_EXT_texture_object;
  Read_GL_EXT_texture_perturb_normal;
  Read_GL_EXT_vertex_array;
  Read_GL_EXT_vertex_shader;
  Read_GL_EXT_vertex_weighting;
  Read_GL_EXT_depth_bounds_test;
  Read_GL_EXT_blend_equation_separate;
  Read_GL_EXT_stencil_clear_tag;
  Read_GL_EXT_framebuffer_blit;
  Read_GL_EXT_framebuffer_multisample;
  Read_GL_EXT_timer_query;
  Read_GL_EXT_gpu_program_parameters;
  Read_GL_EXT_bindable_uniform;
  Read_GL_EXT_draw_buffers2;
  Read_GL_EXT_draw_instanced;
  Read_GL_EXT_geometry_shader4;
  Read_GL_EXT_gpu_shader4;
  Read_GL_EXT_texture_array;
  Read_GL_EXT_texture_buffer_object;
  Read_GL_EXT_texture_integer;
  Read_GL_EXT_transform_feedback;
  Read_GL_EXT_direct_state_access;
  Read_GL_EXT_separate_shader_objects;
  Read_GL_EXT_shader_image_load_store;
  Read_GL_EXT_vertex_attrib_64bit;
  Read_GL_HP_image_transform;
  Read_GL_IBM_multimode_draw_arrays;
  Read_GL_IBM_vertex_array_lists;
  Read_GL_INGR_blend_func_separate;
  Read_GL_INTEL_parallel_arrays;
  Read_GL_MESA_resize_buffers;
  Read_GL_MESA_window_pos;
  Read_GL_NV_evaluators;
  Read_GL_NV_fence;
  Read_GL_NV_fragment_program;
  Read_GL_NV_half_float;
  Read_GL_NV_occlusion_query;
  Read_GL_NV_pixel_data_range;
  Read_GL_NV_point_sprite;
  Read_GL_NV_primitive_restart;
  Read_GL_NV_register_combiners;
  Read_GL_NV_register_combiners2;
  Read_GL_NV_vertex_array_range;
  Read_GL_NV_vertex_program;
  Read_GL_NV_depth_buffer_float;
  Read_GL_NV_framebuffer_multisample_coverage;
  Read_GL_NV_geometry_program4;
  Read_GL_NV_gpu_program4;
  Read_GL_NV_parameter_buffer_object;
  Read_GL_NV_transform_feedback;
  Read_GL_NV_conditional_render;
  Read_GL_NV_present_video;
  Read_GL_NV_explicit_multisample;
  Read_GL_NV_transform_feedback2;
  Read_GL_NV_video_capture;
  Read_GL_NV_copy_image;
  Read_GL_NV_shader_buffer_load;
  Read_GL_NV_vertex_buffer_unified_memory;
  Read_GL_NV_gpu_program5;
  Read_GL_NV_gpu_shader5;
  Read_GL_NV_vertex_attrib_integer_64bit;
  Read_GL_NV_vdpau_interop;
  Read_GL_NV_texture_barrier;
  Read_GL_PGI_misc_hints;
  Read_GL_SGIS_detail_texture;
  Read_GL_SGIS_fog_function;
  Read_GL_SGIS_multisample;
  Read_GL_SGIS_pixel_texture;
  Read_GL_SGIS_point_parameters;
  Read_GL_SGIS_sharpen_texture;
  Read_GL_SGIS_texture4D;
  Read_GL_SGIS_texture_color_mask;
  Read_GL_SGIS_texture_filter4;
  Read_GL_SGIX_async;
  Read_GL_SGIX_flush_raster;
  Read_GL_SGIX_fragment_lighting;
  Read_GL_SGIX_framezoom;
  Read_GL_SGIX_igloo_interface;
  Read_GL_SGIX_instruments;
  Read_GL_SGIX_list_priority;
  Read_GL_SGIX_pixel_texture;
  Read_GL_SGIX_polynomial_ffd;
  Read_GL_SGIX_reference_plane;
  Read_GL_SGIX_sprite;
  Read_GL_SGIX_tag_sample_buffer;
  Read_GL_SGI_color_table;
  Read_GL_SUNX_constant_data;
  Read_GL_SUN_global_alpha;
  Read_GL_SUN_mesh_array;
  Read_GL_SUN_triangle_list;
  Read_GL_SUN_vertex;

{$IFDEF DGL_WIN}
  Read_WGL_ARB_buffer_region;
  Read_WGL_ARB_extensions_string;
  Read_WGL_ARB_make_current_read;
  Read_WGL_ARB_pbuffer;
  Read_WGL_ARB_pixel_format;
  Read_WGL_ARB_pixel_format_float;
  Read_WGL_ARB_render_texture;
  Read_WGL_ARB_create_context;
  Read_WGL_AMD_gpu_association;
  Read_WGL_EXT_display_color_table;
  Read_WGL_EXT_extensions_string;
  Read_WGL_EXT_make_current_read;
  Read_WGL_EXT_pbuffer;
  Read_WGL_EXT_pixel_format;
  Read_WGL_EXT_swap_control;
  Read_WGL_I3D_digital_video_control;
  Read_WGL_I3D_gamma;
  Read_WGL_I3D_genlock;
  Read_WGL_I3D_image_buffer;
  Read_WGL_I3D_swap_frame_lock;
  Read_WGL_I3D_swap_frame_usage;
  Read_WGL_NV_vertex_array_range;
  Read_WGL_NV_present_video;
  Read_WGL_NV_video_output;
  Read_WGL_NV_swap_group;
  Read_WGL_NV_gpu_affinity;
  Read_WGL_NV_video_capture;
  Read_WGL_NV_copy_image;
  Read_WGL_OML_sync_control;
  Read_WGL_3DL_stereo_control;

  Read_WIN_draw_range_elements;
  Read_WIN_swap_hint;
{$ENDIF}

  ExtensionsRead := True;
end;

// =============================================================================
//  ReadCoreVersion
// =============================================================================

procedure ReadCoreVersion;
var
  AnsiBuffer: AnsiString;
  Buffer: String;
  MajorVersion, MinorVersion: Integer;

  procedure TrimAndSplitVersionString(Buffer: String; var Max, Min: Integer);
    // Peels out the X.Y form from the given Buffer which must contain a version string like "text Minor.Major.Build text"
    // at least however "Major.Minor".
  var
    Separator: Integer;
  begin
    try
      // There must be at least one dot to separate major and minor version number.
      Separator := Pos('.', Buffer);
      // At least one number must be before and one after the dot.
      if (Separator > 1) and (Separator < Length(Buffer)) and (AnsiChar(Buffer[Separator - 1]) in ['0'..'9']) and
      (AnsiChar(Buffer[Separator + 1]) in ['0'..'9']) then
      begin
        // OK, it's a valid version string. Now remove unnecessary parts.
        Dec(Separator);
        // Find last non-numeric character before version number.
        while (Separator > 0) and (AnsiChar(Buffer[Separator]) in ['0'..'9']) do
          Dec(Separator);
        // Delete leading characters which do not belong to the version string.
        Delete(Buffer, 1, Separator);
        Separator := Pos('.', Buffer) + 1;
        // Find first non-numeric character after version number
        while (Separator <= Length(Buffer)) and (AnsiChar(Buffer[Separator]) in ['0'..'9']) do
          Inc(Separator);
        // delete trailing characters not belonging to the version string
        Delete(Buffer, Separator, 255);
        // Now translate the numbers.
        Separator := Pos('.', Buffer); // This is necessary because the buffer length might have changed.
        Max := StrToInt(Copy(Buffer, 1, Separator - 1));
        Min := StrToInt(Copy(Buffer, Separator + 1, 1));
      end
      else
        Abort;
    except
      Min := 0;
      Max := 0;
    end;
  end;


begin
  // determine version of implementation
  // GL
  if not Assigned(@glGetString) then
    glGetString := dglGetProcAddress('glGetString');

  AnsiBuffer := glGetString(GL_VERSION);
  Buffer := String(AnsiBuffer);

  TrimAndSplitVersionString(Buffer, MajorVersion, MinorVersion);

  GL_VERSION_1_0 := True;
  GL_VERSION_1_1 := False;
  GL_VERSION_1_2 := False;
  GL_VERSION_1_3 := False;
  GL_VERSION_1_4 := False;
  GL_VERSION_1_5 := False;
  GL_VERSION_2_0 := False;
  GL_VERSION_2_1 := False;
  GL_VERSION_3_0 := False;
  GL_VERSION_3_1 := False;
  GL_VERSION_3_2 := False;
  GL_VERSION_3_3 := False;
  GL_VERSION_4_0 := False;
  GL_VERSION_4_1 := False;

  if MajorVersion = 1 then
  begin
    if MinorVersion >= 1 then
      GL_VERSION_1_1 := True;
    if MinorVersion >= 2 then
      GL_VERSION_1_2 := True;
    if MinorVersion >= 3 then
      GL_VERSION_1_3 := True;
    if MinorVersion >= 4 then
      GL_VERSION_1_4 := True;
    if MinorVersion >= 5 then
      GL_VERSION_1_5 := True;
  end;

  if MajorVersion >= 2 then
  begin
    GL_VERSION_1_1 := True;
    GL_VERSION_1_2 := True;
    GL_VERSION_1_3 := True;
    GL_VERSION_1_4 := True;
    GL_VERSION_1_5 := True;
    GL_VERSION_2_0 := True;

    if MinorVersion >= 1 then
      GL_VERSION_2_1 := True;
  end;

  if MajorVersion >= 3 then
  begin
    GL_VERSION_2_1 := True;
    GL_VERSION_3_0 := True;
    
    if MinorVersion >= 1 then
      GL_VERSION_3_1 := True;
    if MinorVersion >= 2 then
      GL_VERSION_3_2 := True;
    if MinorVersion >= 3 then
      GL_VERSION_3_3 := True;
  end;

  if MajorVersion >= 4 then
  begin
    GL_VERSION_3_1 := True;
    GL_VERSION_3_2 := True;
    GL_VERSION_3_3 := True;
    GL_VERSION_4_0 := True;

    if MinorVersion >= 1 then
      GL_VERSION_4_1 := True;
  end;

  // GLU
  GLU_VERSION_1_1 := False;
  GLU_VERSION_1_2 := False;
  GLU_VERSION_1_3 := False;

  if Assigned(gluGetString) then begin
    AnsiBuffer := gluGetString(GLU_VERSION);
    Buffer := String(AnsiBuffer);

    TrimAndSplitVersionString(Buffer, Majorversion, MinorVersion);

    GLU_VERSION_1_1 := True;

    if MinorVersion >= 2 then
      GLU_VERSION_1_2 := True;

    if MinorVersion >= 3 then
      GLU_VERSION_1_3 := True;
  end;
end;


// =============================================================================
//  ReadImplementationProperties
// =============================================================================

procedure ReadImplementationProperties;
var
  Buffer: Ansistring;
begin
  ReadCoreVersion;

  // Check all extensions
  Buffer := Int_GetExtensionString;

  // === 3DFX ====================================================================
  GL_3DFX_multisample := Int_CheckExtension(Buffer, 'GL_3DFX_multisample');
  GL_3DFX_tbuffer := Int_CheckExtension(Buffer, 'GL_3DFX_tbuffer');
  GL_3DFX_texture_compression_FXT1 := Int_CheckExtension(Buffer, 'GL_3DFX_texture_compression_FXT1');

  // === APPLE ===================================================================
  GL_APPLE_client_storage := Int_CheckExtension(Buffer, 'GL_APPLE_client_storage');
  GL_APPLE_element_array := Int_CheckExtension(Buffer, 'GL_APPLE_element_array');
  GL_APPLE_fence := Int_CheckExtension(Buffer, 'GL_APPLE_fence');
  GL_APPLE_specular_vector := Int_CheckExtension(Buffer, 'GL_APPLE_specular_vector');
  GL_APPLE_transform_hint := Int_CheckExtension(Buffer, 'GL_APPLE_transform_hint');
  GL_APPLE_vertex_array_object := Int_CheckExtension(Buffer, 'GL_APPLE_vertex_array_object');
  GL_APPLE_vertex_array_range := Int_CheckExtension(Buffer, 'GL_APPLE_vertex_array_range');
  GL_APPLE_ycbcr_422 := Int_CheckExtension(Buffer, 'GL_APPLE_ycbcr_422');
  GL_APPLE_texture_range := Int_CheckExtension(Buffer, 'GL_APPLE_texture_range');
  GL_APPLE_float_pixels := Int_CheckExtension(Buffer, 'GL_APPLE_float_pixels');
  GL_APPLE_vertex_program_evaluators := Int_CheckExtension(Buffer, 'GL_APPLE_vertex_program_evaluators');
  GL_APPLE_aux_depth_stencil := Int_CheckExtension(Buffer, 'GL_APPLE_aux_depth_stencil');
  GL_APPLE_object_purgeable := Int_CheckExtension(Buffer, 'GL_APPLE_object_purgeable');
  GL_APPLE_row_bytes := Int_CheckExtension(Buffer, 'GL_APPLE_row_bytes');
  GL_APPLE_rgb_422 := Int_CheckExtension(Buffer, 'GL_APPLE_rgb_422');

  // === ARB =====================================================================
  GL_ARB_depth_texture := Int_CheckExtension(Buffer, 'GL_ARB_depth_texture');
  GL_ARB_fragment_program := Int_CheckExtension(Buffer, 'GL_ARB_fragment_program');
  GL_ARB_imaging := Int_CheckExtension(Buffer, 'GL_ARB_imaging');
  GL_ARB_matrix_palette := Int_CheckExtension(Buffer, 'GL_ARB_matrix_palette');
  GL_ARB_multisample := Int_CheckExtension(Buffer, 'GL_ARB_multisample');
  GL_ARB_multitexture := Int_CheckExtension(Buffer, 'GL_ARB_multitexture');
  GL_ARB_point_parameters := Int_CheckExtension(Buffer, 'GL_ARB_point_parameters');
  GL_ARB_shadow := Int_CheckExtension(Buffer, 'GL_ARB_shadow');
  GL_ARB_shadow_ambient := Int_CheckExtension(Buffer, 'GL_ARB_shadow_ambient');
  GL_ARB_texture_border_clamp := Int_CheckExtension(Buffer, 'GL_ARB_texture_border_clamp');
  GL_ARB_texture_compression := Int_CheckExtension(Buffer, 'GL_ARB_texture_compression');
  GL_ARB_texture_cube_map := Int_CheckExtension(Buffer, 'GL_ARB_texture_cube_map');
  GL_ARB_texture_env_add := Int_CheckExtension(Buffer, 'GL_ARB_texture_env_add');
  GL_ARB_texture_env_combine := Int_CheckExtension(Buffer, 'GL_ARB_texture_env_combine');
  GL_ARB_texture_env_crossbar := Int_CheckExtension(Buffer, 'GL_ARB_texture_env_crossbar');
  GL_ARB_texture_env_dot3 := Int_CheckExtension(Buffer, 'GL_ARB_texture_env_dot3');
  GL_ARB_texture_mirrored_repeat := Int_CheckExtension(Buffer, 'GL_ARB_texture_mirrored_repeat');
  GL_ARB_transpose_matrix := Int_CheckExtension(Buffer, 'GL_ARB_transpose_matrix');
  GL_ARB_vertex_blend := Int_CheckExtension(Buffer, 'GL_ARB_vertex_blend');
  GL_ARB_vertex_buffer_object := Int_CheckExtension(Buffer, 'GL_ARB_vertex_buffer_object');
  GL_ARB_vertex_program := Int_CheckExtension(Buffer, 'GL_ARB_vertex_program');
  GL_ARB_window_pos := Int_CheckExtension(Buffer, 'GL_ARB_window_pos');
  GL_ARB_shader_objects := Int_CheckExtension(Buffer, 'GL_ARB_shader_objects');
  GL_ARB_vertex_shader := Int_CheckExtension(Buffer, 'GL_ARB_vertex_shader');
  GL_ARB_fragment_shader := Int_CheckExtension(Buffer, 'GL_ARB_fragment_shader');
  GL_ARB_occlusion_query := Int_CheckExtension(Buffer, 'GL_ARB_occlusion_query');
  GL_ARB_shading_language_100 := Int_CheckExtension(Buffer, 'GL_ARB_shading_language_100');
  GL_ARB_point_sprite := Int_CheckExtension(Buffer, 'GL_ARB_point_sprite');
  GL_ARB_texture_non_power_of_two := Int_CheckExtension(Buffer, 'GL_ARB_texture_non_power_of_two');
  GL_ARB_fragment_program_shadow := Int_CheckExtension(Buffer, 'GL_ARB_fragment_program_shadow');
  GL_ARB_draw_buffers := Int_CheckExtension(Buffer, 'GL_ARB_draw_buffers');
  GL_ARB_texture_rectangle := Int_CheckExtension(Buffer, 'GL_ARB_texture_rectangle');
  GL_ARB_color_buffer_float := Int_CheckExtension(Buffer, 'GL_ARB_color_buffer_float');
  GL_ARB_half_float_pixel := Int_CheckExtension(Buffer, 'GL_ARB_half_float_pixel');
  GL_ARB_texture_float := Int_CheckExtension(Buffer, 'GL_ARB_texture_float');
  GL_ARB_pixel_buffer_object := Int_CheckExtension(Buffer, 'GL_ARB_pixel_buffer_object');
  GL_ARB_depth_buffer_float := Int_CheckExtension(Buffer, 'GL_ARB_depth_buffer_float');
  GL_ARB_draw_instanced := Int_CheckExtension(Buffer, 'GL_ARB_draw_instanced');
  GL_ARB_framebuffer_object := Int_CheckExtension(Buffer, 'GL_ARB_framebuffer_object');
  GL_ARB_framebuffer_sRGB := Int_CheckExtension(Buffer, 'GL_ARB_framebuffer_sRGB');
  GL_ARB_geometry_shader4 := Int_CheckExtension(Buffer, 'GL_ARB_geometry_shader4');
  GL_ARB_half_float_vertex := Int_CheckExtension(Buffer, 'GL_ARB_half_float_vertex');
  GL_ARB_instanced_arrays := Int_CheckExtension(Buffer, 'GL_ARB_instanced_arrays');
  GL_ARB_map_buffer_range := Int_CheckExtension(Buffer, 'GL_ARB_map_buffer_range');
  GL_ARB_texture_buffer_object := Int_CheckExtension(Buffer, 'GL_ARB_texture_buffer_object');
  GL_ARB_texture_compression_rgtc := Int_CheckExtension(Buffer, 'GL_ARB_texture_compression_rgtc');
  GL_ARB_texture_rg := Int_CheckExtension(Buffer, 'GL_ARB_texture_rg');
  GL_ARB_vertex_array_object := Int_CheckExtension(Buffer, 'GL_ARB_vertex_array_object');
  GL_ARB_uniform_buffer_object := Int_CheckExtension(Buffer, 'GL_ARB_uniform_buffer_object');
  GL_ARB_compatibility := Int_CheckExtension(Buffer, 'GL_ARB_compatibility');
  GL_ARB_copy_buffer := Int_CheckExtension(Buffer, 'GL_ARB_copy_buffer');
  GL_ARB_shader_texture_lod := Int_CheckExtension(Buffer, 'GL_ARB_shader_texture_lod');
  GL_ARB_depth_clamp := Int_CheckExtension(Buffer, 'GL_ARB_depth_clamp');
  GL_ARB_draw_elements_base_vertex := Int_CheckExtension(Buffer, 'GL_ARB_draw_elements_base_vertex');
  GL_ARB_fragment_coord_conventions := Int_CheckExtension(Buffer, 'GL_ARB_fragment_coord_conventions');
  GL_ARB_provoking_vertex := Int_CheckExtension(Buffer, 'GL_ARB_provoking_vertex');
  GL_ARB_seamless_cube_map := Int_CheckExtension(Buffer, 'GL_ARB_seamless_cube_map');
  GL_ARB_sync := Int_CheckExtension(Buffer, 'GL_ARB_sync');
  GL_ARB_texture_multisample := Int_CheckExtension(Buffer, 'GL_ARB_texture_multisample');
  GL_ARB_vertex_array_bgra := Int_CheckExtension(Buffer, 'GL_ARB_vertex_array_bgra');
  GL_ARB_draw_buffers_blend := Int_CheckExtension(Buffer, 'GL_ARB_draw_buffers_blend');
  GL_ARB_sample_shading := Int_CheckExtension(Buffer, 'GL_ARB_sample_shading');
  GL_ARB_texture_cube_map_array := Int_CheckExtension(Buffer, 'GL_ARB_texture_cube_map_array');
  GL_ARB_texture_gather := Int_CheckExtension(Buffer, 'GL_ARB_texture_gather');
  GL_ARB_texture_query_lod := Int_CheckExtension(Buffer, 'GL_ARB_texture_query_lod');
  GL_ARB_shading_language_include := Int_CheckExtension(Buffer, 'GL_ARB_shading_language_include');
  GL_ARB_texture_compression_bptc := Int_CheckExtension(Buffer, 'GL_ARB_texture_compression_bptc');
  GL_ARB_blend_func_extended := Int_CheckExtension(Buffer, 'GL_ARB_blend_func_extended');
  GL_ARB_explicit_attrib_location := Int_CheckExtension(Buffer, 'GL_ARB_explicit_attrib_location');
  GL_ARB_occlusion_query2 := Int_CheckExtension(Buffer, 'GL_ARB_occlusion_query2');
  GL_ARB_sampler_objects := Int_CheckExtension(Buffer, 'GL_ARB_sampler_objects');
  GL_ARB_shader_bit_encoding := Int_CheckExtension(Buffer, 'GL_ARB_shader_bit_encoding');
  GL_ARB_texture_rgb10_a2ui := Int_CheckExtension(Buffer, 'GL_ARB_texture_rgb10_a2ui');
  GL_ARB_texture_swizzle := Int_CheckExtension(Buffer, 'GL_ARB_texture_swizzle');
  GL_ARB_timer_query := Int_CheckExtension(Buffer, 'GL_ARB_timer_query');
  GL_ARB_vertex_type_2_10_10_10_rev := Int_CheckExtension(Buffer, 'GL_ARB_vertex_type_2_10_10_10_rev');
  GL_ARB_draw_indirect := Int_CheckExtension(Buffer, 'GL_ARB_draw_indirect');
  GL_ARB_gpu_shader5 := Int_CheckExtension(Buffer, 'GL_ARB_gpu_shader5');
  GL_ARB_gpu_shader_fp64 := Int_CheckExtension(Buffer, 'GL_ARB_gpu_shader_fp64');
  GL_ARB_shader_subroutine := Int_CheckExtension(Buffer, 'GL_ARB_shader_subroutine');
  GL_ARB_tessellation_shader := Int_CheckExtension(Buffer, 'GL_ARB_tessellation_shader');
  GL_ARB_texture_buffer_object_rgb32 := Int_CheckExtension(Buffer, 'GL_ARB_texture_buffer_object_rgb32');
  GL_ARB_transform_feedback2 := Int_CheckExtension(Buffer, 'GL_ARB_transform_feedback2');
  GL_ARB_transform_feedback3 := Int_CheckExtension(Buffer, 'GL_ARB_transform_feedback3');
  GL_ARB_ES2_compatibility := Int_CheckExtension(Buffer, 'GL_ARB_ES2_compatibility');
  GL_ARB_get_program_binary := Int_CheckExtension(Buffer, 'GL_ARB_get_program_binary');
  GL_ARB_separate_shader_objects := Int_CheckExtension(Buffer, 'GL_ARB_separate_shader_objects');
  GL_ARB_shader_precision := Int_CheckExtension(Buffer, 'GL_ARB_shader_precision');
  GL_ARB_vertex_attrib_64bit := Int_CheckExtension(Buffer, 'GL_ARB_vertex_attrib_64bit');
  GL_ARB_viewport_array := Int_CheckExtension(Buffer, 'GL_ARB_viewport_array');
  GL_ARB_cl_event := Int_CheckExtension(Buffer, 'GL_ARB_cl_event');
  GL_ARB_debug_output := Int_CheckExtension(Buffer, 'GL_ARB_debug_output');
  GL_ARB_robustness := Int_CheckExtension(Buffer, 'GL_ARB_robustness');
  GL_ARB_shader_stencil_export := Int_CheckExtension(Buffer, 'GL_ARB_shader_stencil_export');
  
  // === ATI/AMD =================================================================
  GL_ATI_draw_buffers := Int_CheckExtension(Buffer, 'GL_ATI_draw_buffers');
  GL_ATI_element_array := Int_CheckExtension(Buffer, 'GL_ATI_element_array');
  GL_ATI_envmap_bumpmap := Int_CheckExtension(Buffer, 'GL_ATI_envmap_bumpmap');
  GL_ATI_fragment_shader := Int_CheckExtension(Buffer, 'GL_ATI_fragment_shader');
  GL_ATI_map_object_buffer := Int_CheckExtension(Buffer, 'GL_ATI_map_object_buffer');
  GL_ATI_pn_triangles := Int_CheckExtension(Buffer, 'GL_ATI_pn_triangles');
  GL_ATI_separate_stencil := Int_CheckExtension(Buffer, 'GL_ATI_separate_stencil');
  GL_ATI_text_fragment_shader := Int_CheckExtension(Buffer, 'GL_ATI_text_fragment_shader');
  GL_ATI_texture_env_combine3 := Int_CheckExtension(Buffer, 'GL_ATI_texture_env_combine3');
  GL_ATI_texture_float := Int_CheckExtension(Buffer, 'GL_ATI_texture_float');
  GL_ATI_texture_mirror_once := Int_CheckExtension(Buffer, 'GL_ATI_texture_mirror_once');
  GL_ATI_vertex_array_object := Int_CheckExtension(Buffer, 'GL_ATI_vertex_array_object');
  GL_ATI_vertex_attrib_array_object := Int_CheckExtension(Buffer, 'GL_ATI_vertex_attrib_array_object');
  GL_ATI_vertex_streams := Int_CheckExtension(Buffer, 'GL_ATI_vertex_streams');
  GL_ATI_meminfo := Int_CheckExtension(Buffer, 'GL_ATI_meminfo');
  GL_AMD_performance_monitor := Int_CheckExtension(Buffer, 'GL_AMD_performance_monitor');
  GL_AMD_texture_texture4 := Int_CheckExtension(Buffer, 'GL_AMD_texture_texture4');
  GL_AMD_vertex_shader_tesselator := Int_CheckExtension(Buffer, 'GL_AMD_vertex_shader_tesselator');
  GL_AMD_draw_buffers_blend := Int_CheckExtension(Buffer, 'GL_AMD_draw_buffers_blend');
  GL_AMD_shader_stencil_export := Int_CheckExtension(Buffer, 'GL_AMD_shader_stencil_export');
  GL_AMD_seamless_cubemap_per_texture := Int_CheckExtension(Buffer, 'GL_AMD_seamless_cubemap_per_texture');
  GL_AMD_conservative_depth := Int_CheckExtension(Buffer, 'GL_AMD_conservative_depth');
  GL_AMD_name_gen_delete := Int_CheckExtension(Buffer, 'GL_AMD_name_gen_delete');
  GL_AMD_debug_output := Int_CheckExtension(Buffer, 'GL_AMD_debug_output');
  GL_AMD_transform_feedback3_lines_triangles := Int_CheckExtension(Buffer, 'GL_AMD_transform_feedback3_lines_triangles');
  GL_AMD_depth_clamp_separate := Int_CheckExtension(Buffer, 'GL_AMD_depth_clamp_separate');

  // === EXT =====================================================================
  GL_EXT_422_pixels := Int_CheckExtension(Buffer, 'GL_EXT_422_pixels');
  GL_EXT_abgr := Int_CheckExtension(Buffer, 'GL_EXT_abgr');
  GL_EXT_bgra := Int_CheckExtension(Buffer, 'GL_EXT_bgra');
  GL_EXT_blend_color := Int_CheckExtension(Buffer, 'GL_EXT_blend_color');
  GL_EXT_blend_func_separate := Int_CheckExtension(Buffer, 'GL_EXT_blend_func_separate');
  GL_EXT_blend_logic_op := Int_CheckExtension(Buffer, 'GL_EXT_blend_logic_op');
  GL_EXT_blend_minmax := Int_CheckExtension(Buffer, 'GL_EXT_blend_minmax');
  GL_EXT_blend_subtract := Int_CheckExtension(Buffer, 'GL_EXT_blend_subtract');
  GL_EXT_clip_volume_hint := Int_CheckExtension(Buffer, 'GL_EXT_clip_volume_hint');
  GL_EXT_cmyka := Int_CheckExtension(Buffer, 'GL_EXT_cmyka');
  GL_EXT_color_matrix := Int_CheckExtension(Buffer, 'GL_EXT_color_matrix');
  GL_EXT_color_subtable := Int_CheckExtension(Buffer, 'GL_EXT_color_subtable');
  GL_EXT_compiled_vertex_array := Int_CheckExtension(Buffer, 'GL_EXT_compiled_vertex_array');
  GL_EXT_convolution := Int_CheckExtension(Buffer, 'GL_EXT_convolution');
  GL_EXT_coordinate_frame := Int_CheckExtension(Buffer, 'GL_EXT_coordinate_frame');
  GL_EXT_copy_texture := Int_CheckExtension(Buffer, 'GL_EXT_copy_texture');
  GL_EXT_cull_vertex := Int_CheckExtension(Buffer, 'GL_EXT_cull_vertex');
  GL_EXT_draw_range_elements := Int_CheckExtension(Buffer, 'GL_EXT_draw_range_elements');
  GL_EXT_fog_coord := Int_CheckExtension(Buffer, 'GL_EXT_fog_coord');
  GL_EXT_framebuffer_object := Int_CheckExtension(Buffer, 'GL_EXT_framebuffer_object');
  GL_EXT_histogram := Int_CheckExtension(Buffer, 'GL_EXT_histogram');
  GL_EXT_index_array_formats := Int_CheckExtension(Buffer, 'GL_EXT_index_array_formats');
  GL_EXT_index_func := Int_CheckExtension(Buffer, 'GL_EXT_index_func');
  GL_EXT_index_material := Int_CheckExtension(Buffer, 'GL_EXT_index_material');
  GL_EXT_index_texture := Int_CheckExtension(Buffer, 'GL_EXT_index_texture');
  GL_EXT_light_texture := Int_CheckExtension(Buffer, 'GL_EXT_light_texture');
  GL_EXT_misc_attribute := Int_CheckExtension(Buffer, 'GL_EXT_misc_attribute');
  GL_EXT_multi_draw_arrays := Int_CheckExtension(Buffer, 'GL_EXT_multi_draw_arrays');
  GL_EXT_multisample := Int_CheckExtension(Buffer, 'GL_EXT_multisample');
  GL_EXT_packed_pixels := Int_CheckExtension(Buffer, 'GL_EXT_packed_pixels');
  GL_EXT_paletted_texture := Int_CheckExtension(Buffer, 'GL_EXT_paletted_texture');
  GL_EXT_pixel_transform := Int_CheckExtension(Buffer, 'GL_EXT_pixel_transform');
  GL_EXT_pixel_transform_color_table := Int_CheckExtension(Buffer, 'GL_EXT_pixel_transform_color_table');
  GL_EXT_point_parameters := Int_CheckExtension(Buffer, 'GL_EXT_point_parameters');
  GL_EXT_polygon_offset := Int_CheckExtension(Buffer, 'GL_EXT_polygon_offset');
  GL_EXT_rescale_normal := Int_CheckExtension(Buffer, 'GL_EXT_rescale_normal');
  GL_EXT_secondary_color := Int_CheckExtension(Buffer, 'GL_EXT_secondary_color');
  GL_EXT_separate_specular_color := Int_CheckExtension(Buffer, 'GL_EXT_separate_specular_color');
  GL_EXT_shadow_funcs := Int_CheckExtension(Buffer, 'GL_EXT_shadow_funcs');
  GL_EXT_shared_texture_palette := Int_CheckExtension(Buffer, 'GL_EXT_shared_texture_palette');
  GL_EXT_stencil_two_side := Int_CheckExtension(Buffer, 'GL_EXT_stencil_two_side');
  GL_EXT_stencil_wrap := Int_CheckExtension(Buffer, 'GL_EXT_stencil_wrap');
  GL_EXT_subtexture := Int_CheckExtension(Buffer, 'GL_EXT_subtexture');
  GL_EXT_texture := Int_CheckExtension(Buffer, 'GL_EXT_texture');
  GL_EXT_texture3D := Int_CheckExtension(Buffer, 'GL_EXT_texture3D');
  GL_EXT_texture_compression_s3tc := Int_CheckExtension(Buffer, 'GL_EXT_texture_compression_s3tc');
  GL_EXT_texture_cube_map := Int_CheckExtension(Buffer, 'GL_EXT_texture_cube_map');
  GL_EXT_texture_edge_clamp := Int_CheckExtension(Buffer, 'GL_EXT_texture_edge_clamp');
  GL_EXT_texture_env_add := Int_CheckExtension(Buffer, 'GL_EXT_texture_env_add');
  GL_EXT_texture_env_combine := Int_CheckExtension(Buffer, 'GL_EXT_texture_env_combine');
  GL_EXT_texture_env_dot3 := Int_CheckExtension(Buffer, 'GL_EXT_texture_env_dot3');
  GL_EXT_texture_filter_anisotropic := Int_CheckExtension(Buffer, 'GL_EXT_texture_filter_anisotropic');
  GL_EXT_texture_lod_bias := Int_CheckExtension(Buffer, 'GL_EXT_texture_lod_bias');
  GL_EXT_texture_object := Int_CheckExtension(Buffer, 'GL_EXT_texture_object');
  GL_EXT_texture_perturb_normal := Int_CheckExtension(Buffer, 'GL_EXT_texture_perturb_normal');
  GL_EXT_texture_rectangle := Int_CheckExtension(Buffer, 'GL_EXT_texture_rectangle');
  GL_EXT_vertex_array := Int_CheckExtension(Buffer, 'GL_EXT_vertex_array');
  GL_EXT_vertex_shader := Int_CheckExtension(Buffer, 'GL_EXT_vertex_shader');
  GL_EXT_vertex_weighting := Int_CheckExtension(Buffer, 'GL_EXT_vertex_weighting');
  GL_EXT_depth_bounds_test := Int_CheckExtension(Buffer, 'GL_EXT_depth_bounds_test');
  GL_EXT_texture_mirror_clamp := Int_CheckExtension(Buffer, 'GL_EXT_texture_mirror_clamp');
  GL_EXT_blend_equation_separate := Int_CheckExtension(Buffer, 'GL_EXT_blend_equation_separate');
  GL_EXT_pixel_buffer_object := Int_CheckExtension(Buffer, 'GL_EXT_pixel_buffer_object');
  GL_EXT_texture_compression_dxt1 := Int_CheckExtension(Buffer, 'GL_EXT_texture_compression_dxt1');
  GL_EXT_stencil_clear_tag := Int_CheckExtension(Buffer, 'GL_EXT_stencil_clear_tag');
  GL_EXT_packed_depth_stencil := Int_CheckExtension(Buffer, 'GL_EXT_packed_depth_stencil');
  GL_EXT_texture_sRGB := Int_CheckExtension(Buffer, 'GL_EXT_texture_sRGB');
  GL_EXT_framebuffer_blit := Int_CheckExtension(Buffer, 'GL_EXT_framebuffer_blit');
  GL_EXT_framebuffer_multisample := Int_CheckExtension(Buffer, 'GL_EXT_framebuffer_multisample');
  GL_EXT_timer_query := Int_CheckExtension(Buffer, 'GL_EXT_timer_query');
  GL_EXT_gpu_program_parameters := Int_CheckExtension(Buffer, 'GL_EXT_gpu_program_parameters');
  GL_EXT_bindable_uniform := Int_CheckExtension(Buffer, 'GL_EXT_bindable_uniform');
  GL_EXT_draw_buffers2 := Int_CheckExtension(Buffer, 'GL_EXT_draw_buffers2');
  GL_EXT_draw_instanced := Int_CheckExtension(Buffer, 'GL_EXT_draw_instanced');
  GL_EXT_framebuffer_sRGB := Int_CheckExtension(Buffer, 'GL_EXT_framebuffer_sRGB');
  GL_EXT_geometry_shader4 := Int_CheckExtension(Buffer, 'GL_EXT_geometry_shader4');
  GL_EXT_gpu_shader4 := Int_CheckExtension(Buffer, 'GL_EXT_gpu_shader4');
  GL_EXT_packed_float := Int_CheckExtension(Buffer, 'GL_EXT_packed_float');
  GL_EXT_texture_array := Int_CheckExtension(Buffer, 'GL_EXT_texture_array');
  GL_EXT_texture_buffer_object := Int_CheckExtension(Buffer, 'GL_EXT_texture_buffer_object');
  GL_EXT_texture_compression_latc := Int_CheckExtension(Buffer, 'GL_EXT_texture_compression_latc');
  GL_EXT_texture_compression_rgtc := Int_CheckExtension(Buffer, 'GL_EXT_texture_compression_rgtc');
  GL_EXT_texture_integer := Int_CheckExtension(Buffer, 'GL_EXT_texture_integer');
  GL_EXT_texture_shared_exponent := Int_CheckExtension(Buffer, 'GL_EXT_texture_shared_exponent');
  GL_EXT_transform_feedback := Int_CheckExtension(Buffer, 'GL_EXT_transform_feedback');
  GL_EXT_direct_state_access := Int_CheckExtension(Buffer, 'GL_EXT_direct_state_access');
  GL_EXT_vertex_array_bgra := Int_CheckExtension(Buffer, 'GL_EXT_vertex_array_bgra');
  GL_EXT_texture_swizzle := Int_CheckExtension(Buffer, 'GL_EXT_texture_swizzle');
  GL_EXT_provoking_vertex := Int_CheckExtension(Buffer, 'GL_EXT_provoking_vertex');
  GL_EXT_texture_snorm := Int_CheckExtension(Buffer, 'GL_EXT_texture_snorm');
  GL_EXT_separate_shader_objects := Int_CheckExtension(Buffer, 'GL_EXT_separate_shader_objects');
  GL_EXT_shader_image_load_store := Int_CheckExtension(Buffer, 'GL_EXT_shader_image_load_store');
  GL_EXT_vertex_attrib_64bit := Int_CheckExtension(Buffer, 'GL_EXT_vertex_attrib_64bit');
  GL_EXT_texture_sRGB_decode := Int_CheckExtension(Buffer, 'GL_EXT_texture_sRGB_decode');
  
  // === HP ======================================================================
  GL_HP_convolution_border_modes := Int_CheckExtension(Buffer, 'GL_HP_convolution_border_modes');
  GL_HP_image_transform := Int_CheckExtension(Buffer, 'GL_HP_image_transform');
  GL_HP_occlusion_test := Int_CheckExtension(Buffer, 'GL_HP_occlusion_test');
  GL_HP_texture_lighting := Int_CheckExtension(Buffer, 'GL_HP_texture_lighting');

  // === IBM =====================================================================
  GL_IBM_cull_vertex := Int_CheckExtension(Buffer, 'GL_IBM_cull_vertex');
  GL_IBM_multimode_draw_arrays := Int_CheckExtension(Buffer, 'GL_IBM_multimode_draw_arrays');
  GL_IBM_rasterpos_clip := Int_CheckExtension(Buffer, 'GL_IBM_rasterpos_clip');
  GL_IBM_texture_mirrored_repeat := Int_CheckExtension(Buffer, 'GL_IBM_texture_mirrored_repeat');
  GL_IBM_vertex_array_lists := Int_CheckExtension(Buffer, 'GL_IBM_vertex_array_lists');

  // === INGR ====================================================================
  GL_INGR_blend_func_separate := Int_CheckExtension(Buffer, 'GL_INGR_blend_func_separate');
  GL_INGR_color_clamp := Int_CheckExtension(Buffer, 'GL_INGR_color_clamp');
  GL_INGR_interlace_read := Int_CheckExtension(Buffer, 'GL_INGR_interlace_read');
  GL_INGR_palette_buffer := Int_CheckExtension(Buffer, 'GL_INGR_palette_buffer');

  // === INTEL ===================================================================
  GL_INTEL_parallel_arrays := Int_CheckExtension(Buffer, 'GL_INTEL_parallel_arrays');
  GL_INTEL_texture_scissor := Int_CheckExtension(Buffer, 'GL_INTEL_texture_scissor');

  // === MESA ====================================================================
  GL_MESA_resize_buffers := Int_CheckExtension(Buffer, 'GL_MESA_resize_buffers');
  GL_MESA_window_pos := Int_CheckExtension(Buffer, 'GL_MESA_window_pos');

  // === NVIDIA ==================================================================
  GL_NV_blend_square := Int_CheckExtension(Buffer, 'GL_NV_blend_square');
  GL_NV_copy_depth_to_color := Int_CheckExtension(Buffer, 'GL_NV_copy_depth_to_color');
  GL_NV_depth_clamp := Int_CheckExtension(Buffer, 'GL_NV_depth_clamp');
  GL_NV_evaluators := Int_CheckExtension(Buffer, 'GL_NV_evaluators');
  GL_NV_fence := Int_CheckExtension(Buffer, 'GL_NV_fence');
  GL_NV_float_buffer := Int_CheckExtension(Buffer, 'GL_NV_float_buffer');
  GL_NV_fog_distance := Int_CheckExtension(Buffer, 'GL_NV_fog_distance');
  GL_NV_fragment_program := Int_CheckExtension(Buffer, 'GL_NV_fragment_program');
  GL_NV_half_float := Int_CheckExtension(Buffer, 'GL_NV_half_float');
  GL_NV_light_max_exponent := Int_CheckExtension(Buffer, 'GL_NV_light_max_exponent');
  GL_NV_multisample_filter_hint := Int_CheckExtension(Buffer, 'GL_NV_multisample_filter_hint');
  GL_NV_occlusion_query := Int_CheckExtension(Buffer, 'GL_NV_occlusion_query');
  GL_NV_packed_depth_stencil := Int_CheckExtension(Buffer, 'GL_NV_packed_depth_stencil');
  GL_NV_pixel_data_range := Int_CheckExtension(Buffer, 'GL_NV_pixel_data_range');
  GL_NV_point_sprite := Int_CheckExtension(Buffer, 'GL_NV_point_sprite');
  GL_NV_primitive_restart := Int_CheckExtension(Buffer, 'GL_NV_primitive_restart');
  GL_NV_register_combiners := Int_CheckExtension(Buffer, 'GL_NV_register_combiners');
  GL_NV_register_combiners2 := Int_CheckExtension(Buffer, 'GL_NV_register_combiners2');
  GL_NV_texgen_emboss := Int_CheckExtension(Buffer, 'GL_NV_texgen_emboss');
  GL_NV_texgen_reflection := Int_CheckExtension(Buffer, 'GL_NV_texgen_reflection');
  GL_NV_texture_compression_vtc := Int_CheckExtension(Buffer, 'GL_NV_texture_compression_vtc');
  GL_NV_texture_env_combine4 := Int_CheckExtension(Buffer, 'GL_NV_texture_env_combine4');
  GL_NV_texture_expand_normal := Int_CheckExtension(Buffer, 'GL_NV_texture_expand_normal');
  GL_NV_texture_rectangle := Int_CheckExtension(Buffer, 'GL_NV_texture_rectangle');
  GL_NV_texture_shader := Int_CheckExtension(Buffer, 'GL_NV_texture_shader');
  GL_NV_texture_shader2 := Int_CheckExtension(Buffer, 'GL_NV_texture_shader2');
  GL_NV_texture_shader3 := Int_CheckExtension(Buffer, 'GL_NV_texture_shader3');
  GL_NV_vertex_array_range := Int_CheckExtension(Buffer, 'GL_NV_vertex_array_range');
  GL_NV_vertex_array_range2 := Int_CheckExtension(Buffer, 'GL_NV_vertex_array_range2');
  GL_NV_vertex_program := Int_CheckExtension(Buffer, 'GL_NV_vertex_program');
  GL_NV_vertex_program1_1 := Int_CheckExtension(Buffer, 'GL_NV_vertex_program1_1');
  GL_NV_vertex_program2 := Int_CheckExtension(Buffer, 'GL_NV_vertex_program2');
  GL_NV_fragment_program_option := Int_CheckExtension(Buffer, 'GL_NV_fragment_program_option');
  GL_NV_fragment_program2 := Int_CheckExtension(Buffer, 'GL_NV_fragment_program2');
  GL_NV_vertex_program2_option := Int_CheckExtension(Buffer, 'GL_NV_vertex_program2_option');
  GL_NV_vertex_program3 := Int_CheckExtension(Buffer, 'GL_NV_vertex_program3');
  GL_NV_depth_buffer_float := Int_CheckExtension(Buffer, 'GL_NV_depth_buffer_float');
  GL_NV_fragment_program4 := Int_CheckExtension(Buffer, 'GL_NV_fragment_program4');
  GL_NV_framebuffer_multisample_coverage := Int_CheckExtension(Buffer, 'GL_NV_framebuffer_multisample_coverage');
  GL_NV_geometry_program4 := Int_CheckExtension(Buffer, 'GL_NV_geometry_program4');
  GL_NV_gpu_program4 := Int_CheckExtension(Buffer, 'GL_NV_gpu_program4');
  GL_NV_parameter_buffer_object := Int_CheckExtension(Buffer, 'GL_NV_parameter_buffer_object');
  GL_NV_transform_feedback := Int_CheckExtension(Buffer, 'GL_NV_transform_feedback');
  GL_NV_vertex_program4 := Int_CheckExtension(Buffer, 'GL_NV_vertex_program4');
  GL_NV_conditional_render := Int_CheckExtension(Buffer, 'GL_NV_conditional_render');
  GL_NV_present_video := Int_CheckExtension(Buffer, 'GL_NV_present_video');
  GL_NV_explicit_multisample := Int_CheckExtension(Buffer, 'GL_NV_explicit_multisample');
  GL_NV_transform_feedback2 := Int_CheckExtension(Buffer, 'GL_NV_transform_feedback2');
  GL_NV_video_capture := Int_CheckExtension(Buffer, 'GL_NV_video_capture');
  GL_NV_copy_image := Int_CheckExtension(Buffer, 'GL_NV_copy_image');
  GL_NV_parameter_buffer_object2 := Int_CheckExtension(Buffer, 'GL_NV_parameter_buffer_object2');
  GL_NV_shader_buffer_load := Int_CheckExtension(Buffer, 'GL_NV_shader_buffer_load');
  GL_NV_vertex_buffer_unified_memory := Int_CheckExtension(Buffer, 'GL_NV_vertex_buffer_unified_memory');
  GL_NV_gpu_program5 := Int_CheckExtension(Buffer, 'GL_NV_gpu_program5');
  GL_NV_gpu_shader5 := Int_CheckExtension(Buffer, 'GL_NV_gpu_shader5');
  GL_NV_shader_buffer_store := Int_CheckExtension(Buffer, 'GL_NV_shader_buffer_store');
  GL_NV_tessellation_program5 := Int_CheckExtension(Buffer, 'GL_NV_tessellation_program5');
  GL_NV_vertex_attrib_integer_64bit := Int_CheckExtension(Buffer, 'GL_NV_vertex_attrib_integer_64bit');
  GL_NV_multisample_coverage := Int_CheckExtension(Buffer, 'GL_NV_multisample_coverage');
  GL_NV_vdpau_interop := Int_CheckExtension(Buffer, 'GL_NV_vdpau_interop');
  GL_NV_texture_barrier := Int_CheckExtension(Buffer, 'GL_NV_texture_barrier');

  // === OML =====================================================================
  GL_OML_interlace := Int_CheckExtension(Buffer, 'GL_OML_interlace');
  GL_OML_resample := Int_CheckExtension(Buffer, 'GL_OML_resample');
  GL_OML_subsample := Int_CheckExtension(Buffer, 'GL_OML_subsample');

  // === PGI =====================================================================
  GL_PGI_misc_hints := Int_CheckExtension(Buffer, 'GL_PGI_misc_hints');
  GL_PGI_vertex_hints := Int_CheckExtension(Buffer, 'GL_PGI_vertex_hints');

  // === REND ====================================================================
  GL_REND_screen_coordinates := Int_CheckExtension(Buffer, 'GL_REND_screen_coordinates');

  // === S3 ======================================================================
  GL_S3_s3tc := Int_CheckExtension(Buffer, 'GL_S3_s3tc');

  // === SGIS ====================================================================
  GL_SGIS_detail_texture := Int_CheckExtension(Buffer, 'GL_SGIS_detail_texture');
  GL_SGIS_fog_function := Int_CheckExtension(Buffer, 'GL_SGIS_fog_function');
  GL_SGIS_generate_mipmap := Int_CheckExtension(Buffer, 'GL_SGIS_generate_mipmap');
  GL_SGIS_multisample := Int_CheckExtension(Buffer, 'GL_SGIS_multisample');
  GL_SGIS_pixel_texture := Int_CheckExtension(Buffer, 'GL_SGIS_pixel_texture');
  GL_SGIS_point_line_texgen := Int_CheckExtension(Buffer, 'GL_SGIS_point_line_texgen');
  GL_SGIS_point_parameters := Int_CheckExtension(Buffer, 'GL_SGIS_point_parameters');
  GL_SGIS_sharpen_texture := Int_CheckExtension(Buffer, 'GL_SGIS_sharpen_texture');
  GL_SGIS_texture4D := Int_CheckExtension(Buffer, 'GL_SGIS_texture4D');
  GL_SGIS_texture_border_clamp := Int_CheckExtension(Buffer, 'GL_SGIS_texture_border_clamp');
  GL_SGIS_texture_color_mask := Int_CheckExtension(Buffer, 'GL_SGIS_texture_color_mask');
  GL_SGIS_texture_edge_clamp := Int_CheckExtension(Buffer, 'GL_SGIS_texture_edge_clamp');
  GL_SGIS_texture_filter4 := Int_CheckExtension(Buffer, 'GL_SGIS_texture_filter4');
  GL_SGIS_texture_lod := Int_CheckExtension(Buffer, 'GL_SGIS_texture_lod');
  GL_SGIS_texture_select := Int_CheckExtension(Buffer, 'GL_SGIS_texture_select');

  // === SGIX ====================================================================
  GL_FfdMaskSGIX := Int_CheckExtension(Buffer, 'GL_FfdMaskSGIX');
  GL_SGIX_async := Int_CheckExtension(Buffer, 'GL_SGIX_async');
  GL_SGIX_async_histogram := Int_CheckExtension(Buffer, 'GL_SGIX_async_histogram');
  GL_SGIX_async_pixel := Int_CheckExtension(Buffer, 'GL_SGIX_async_pixel');
  GL_SGIX_blend_alpha_minmax := Int_CheckExtension(Buffer, 'GL_SGIX_blend_alpha_minmax');
  GL_SGIX_calligraphic_fragment := Int_CheckExtension(Buffer, 'GL_SGIX_calligraphic_fragment');
  GL_SGIX_clipmap := Int_CheckExtension(Buffer, 'GL_SGIX_clipmap');
  GL_SGIX_convolution_accuracy := Int_CheckExtension(Buffer, 'GL_SGIX_convolution_accuracy');
  GL_SGIX_depth_pass_instrument := Int_CheckExtension(Buffer, 'GL_SGIX_depth_pass_instrument');
  GL_SGIX_depth_texture := Int_CheckExtension(Buffer, 'GL_SGIX_depth_texture');
  GL_SGIX_flush_raster := Int_CheckExtension(Buffer, 'GL_SGIX_flush_raster');
  GL_SGIX_fog_offset := Int_CheckExtension(Buffer, 'GL_SGIX_fog_offset');
  GL_SGIX_fog_scale := Int_CheckExtension(Buffer, 'GL_SGIX_fog_scale');
  GL_SGIX_fragment_lighting := Int_CheckExtension(Buffer, 'GL_SGIX_fragment_lighting');
  GL_SGIX_framezoom := Int_CheckExtension(Buffer, 'GL_SGIX_framezoom');
  GL_SGIX_igloo_interface := Int_CheckExtension(Buffer, 'GL_SGIX_igloo_interface');
  GL_SGIX_impact_pixel_texture := Int_CheckExtension(Buffer, 'GL_SGIX_impact_pixel_texture');
  GL_SGIX_instruments := Int_CheckExtension(Buffer, 'GL_SGIX_instruments');
  GL_SGIX_interlace := Int_CheckExtension(Buffer, 'GL_SGIX_interlace');
  GL_SGIX_ir_instrument1 := Int_CheckExtension(Buffer, 'GL_SGIX_ir_instrument1');
  GL_SGIX_list_priority := Int_CheckExtension(Buffer, 'GL_SGIX_list_priority');
  GL_SGIX_pixel_texture := Int_CheckExtension(Buffer, 'GL_SGIX_pixel_texture');
  GL_SGIX_pixel_tiles := Int_CheckExtension(Buffer, 'GL_SGIX_pixel_tiles');
  GL_SGIX_polynomial_ffd := Int_CheckExtension(Buffer, 'GL_SGIX_polynomial_ffd');
  GL_SGIX_reference_plane := Int_CheckExtension(Buffer, 'GL_SGIX_reference_plane');
  GL_SGIX_resample := Int_CheckExtension(Buffer, 'GL_SGIX_resample');
  GL_SGIX_scalebias_hint := Int_CheckExtension(Buffer, 'GL_SGIX_scalebias_hint');
  GL_SGIX_shadow := Int_CheckExtension(Buffer, 'GL_SGIX_shadow');
  GL_SGIX_shadow_ambient := Int_CheckExtension(Buffer, 'GL_SGIX_shadow_ambient');
  GL_SGIX_sprite := Int_CheckExtension(Buffer, 'GL_SGIX_sprite');
  GL_SGIX_subsample := Int_CheckExtension(Buffer, 'GL_SGIX_subsample');
  GL_SGIX_tag_sample_buffer := Int_CheckExtension(Buffer, 'GL_SGIX_tag_sample_buffer');
  GL_SGIX_texture_add_env := Int_CheckExtension(Buffer, 'GL_SGIX_texture_add_env');
  GL_SGIX_texture_coordinate_clamp := Int_CheckExtension(Buffer, 'GL_SGIX_texture_coordinate_clamp');
  GL_SGIX_texture_lod_bias := Int_CheckExtension(Buffer, 'GL_SGIX_texture_lod_bias');
  GL_SGIX_texture_multi_buffer := Int_CheckExtension(Buffer, 'GL_SGIX_texture_multi_buffer');
  GL_SGIX_texture_scale_bias := Int_CheckExtension(Buffer, 'GL_SGIX_texture_scale_bias');
  GL_SGIX_texture_select := Int_CheckExtension(Buffer, 'GL_SGIX_texture_select');
  GL_SGIX_vertex_preclip := Int_CheckExtension(Buffer, 'GL_SGIX_vertex_preclip');
  GL_SGIX_ycrcb := Int_CheckExtension(Buffer, 'GL_SGIX_ycrcb');
  GL_SGIX_ycrcb_subsample := Int_CheckExtension(Buffer, 'GL_SGIX_ycrcb_subsample');
  GL_SGIX_ycrcba := Int_CheckExtension(Buffer, 'GL_SGIX_ycrcba');

  // === SGI =====================================================================
  GL_SGI_color_matrix := Int_CheckExtension(Buffer, 'GL_SGI_color_matrix');
  GL_SGI_color_table := Int_CheckExtension(Buffer, 'GL_SGI_color_table');
  GL_SGI_depth_pass_instrument := Int_CheckExtension(Buffer, 'GL_SGI_depth_pass_instrument');
  GL_SGI_texture_color_table := Int_CheckExtension(Buffer, 'GL_SGI_texture_color_table');

  // === SUN =====================================================================
  GL_SUNX_constant_data := Int_CheckExtension(Buffer, 'GL_SUNX_constant_data');
  GL_SUN_convolution_border_modes := Int_CheckExtension(Buffer, 'GL_SUN_convolution_border_modes');
  GL_SUN_global_alpha := Int_CheckExtension(Buffer, 'GL_SUN_global_alpha');
  GL_SUN_mesh_array := Int_CheckExtension(Buffer, 'GL_SUN_mesh_array');
  GL_SUN_slice_accum := Int_CheckExtension(Buffer, 'GL_SUN_slice_accum');
  GL_SUN_triangle_list := Int_CheckExtension(Buffer, 'GL_SUN_triangle_list');
  GL_SUN_vertex := Int_CheckExtension(Buffer, 'GL_SUN_vertex');

  // === WIN =====================================================================
  GL_WIN_phong_shading := Int_CheckExtension(Buffer, 'GL_WIN_phong_shading');
  GL_WIN_specular_fog := Int_CheckExtension(Buffer, 'GL_WIN_specular_fog');

  {$IFDEF DGL_WIN}
  // === WGL =====================================================================
  WGL_3DFX_multisample := Int_CheckExtension(Buffer, 'WGL_3DFX_multisample');
  WGL_ARB_buffer_region := Int_CheckExtension(Buffer, 'WGL_ARB_buffer_region');
  WGL_ARB_extensions_string := Int_CheckExtension(Buffer, 'WGL_ARB_extensions_string');
  WGL_ARB_make_current_read := Int_CheckExtension(Buffer, 'WGL_ARB_make_current_read');
  WGL_ARB_multisample := Int_CheckExtension(Buffer, 'WGL_ARB_multisample');
  WGL_ARB_pbuffer := Int_CheckExtension(Buffer, 'WGL_ARB_pbuffer');
  WGL_ARB_pixel_format := Int_CheckExtension(Buffer, 'WGL_ARB_pixel_format');
  WGL_ARB_pixel_format_float := Int_CheckExtension(Buffer, 'WGL_ARB_pixel_format_float');
  WGL_ARB_render_texture := Int_CheckExtension(Buffer, 'WGL_ARB_render_texture');
  WGL_ARB_create_context := Int_CheckExtension(Buffer, 'WGL_ARB_create_context');
  WGL_ARB_create_context_profile := Int_CheckExtension(Buffer, 'WGL_ARB_create_context_profile');
  WGL_ARB_framebuffer_sRGB := Int_CheckExtension(Buffer, 'WGL_ARB_framebuffer_sRGB');
  WGL_ARB_create_context_robustness := Int_CheckExtension(Buffer, 'WGL_ARB_create_context_robustness');
  WGL_ATI_pixel_format_float := Int_CheckExtension(Buffer, 'WGL_ATI_pixel_format_float');
  WGL_AMD_gpu_association := Int_CheckExtension(Buffer, 'WGL_AMD_gpu_association');
  WGL_EXT_depth_float := Int_CheckExtension(Buffer, 'WGL_EXT_depth_float');
  WGL_EXT_display_color_table := Int_CheckExtension(Buffer, 'WGL_EXT_display_color_table');
  WGL_EXT_extensions_string := Int_CheckExtension(Buffer, 'WGL_EXT_extensions_string');
  WGL_EXT_make_current_read := Int_CheckExtension(Buffer, 'WGL_EXT_make_current_read');
  WGL_EXT_multisample := Int_CheckExtension(Buffer, 'WGL_EXT_multisample');
  WGL_EXT_pbuffer := Int_CheckExtension(Buffer, 'WGL_EXT_pbuffer');
  WGL_EXT_pixel_format := Int_CheckExtension(Buffer, 'WGL_EXT_pixel_format');
  WGL_EXT_swap_control := Int_CheckExtension(Buffer, 'WGL_EXT_swap_control');
  WGL_EXT_create_context_es2_profile := Int_CheckExtension(Buffer, 'WGL_EXT_create_context_es2_profile');
  WGL_I3D_digital_video_control := Int_CheckExtension(Buffer, 'WGL_I3D_digital_video_control');
  WGL_I3D_gamma := Int_CheckExtension(Buffer, 'WGL_I3D_gamma');
  WGL_I3D_genlock := Int_CheckExtension(Buffer, 'WGL_I3D_genlock');
  WGL_I3D_image_buffer := Int_CheckExtension(Buffer, 'WGL_I3D_image_buffer');
  WGL_I3D_swap_frame_lock := Int_CheckExtension(Buffer, 'WGL_I3D_swap_frame_lock');
  WGL_I3D_swap_frame_usage := Int_CheckExtension(Buffer, 'WGL_I3D_swap_frame_usage');
  WGL_NV_float_buffer := Int_CheckExtension(Buffer, 'WGL_NV_float_buffer');
  WGL_NV_render_depth_texture := Int_CheckExtension(Buffer, 'WGL_NV_render_depth_texture');
  WGL_NV_render_texture_rectangle := Int_CheckExtension(Buffer, 'WGL_NV_render_texture_rectangle');
  WGL_NV_vertex_array_range := Int_CheckExtension(Buffer, 'WGL_NV_vertex_array_range');
  WGL_NV_present_video := Int_CheckExtension(Buffer, 'WGL_NV_present_video');
  WGL_NV_video_output := Int_CheckExtension(Buffer, 'WGL_NV_video_output');
  WGL_NV_swap_group := Int_CheckExtension(Buffer, 'WGL_NV_swap_group');
  WGL_NV_gpu_affinity := Int_CheckExtension(Buffer, 'WGL_NV_gpu_affinity');
  WGL_NV_video_capture := Int_CheckExtension(Buffer, 'WGL_NV_video_capture');
  WGL_NV_copy_image := Int_CheckExtension(Buffer, 'WGL_NV_copy_image');
  WGL_NV_multisample_coverage := Int_CheckExtension(Buffer, 'WGL_NV_multisample_coverage');
  WGL_OML_sync_control := Int_CheckExtension(Buffer, 'WGL_OML_sync_control');
  WGL_3DL_stereo_control := Int_CheckExtension(Buffer, 'WGL_3DL_stereo_control');

  WIN_draw_range_elements := Int_CheckExtension(Buffer, 'WIN_draw_range_elements');
  WIN_swap_hint := Int_CheckExtension(Buffer, 'WIN_swap_hint');
  {$ENDIF}

  {$IFDEF DGL_LINUX}
  // === GLX =====================================================================
  GLX_ARB_multisample := Int_CheckExtension(Buffer, 'GLX_ARB_multisample');
  GLX_ARB_fbconfig_float := Int_CheckExtension(Buffer, 'GLX_ARB_fbconfig_float');
  GLX_ARB_get_proc_address := Int_CheckExtension(Buffer, 'GLX_ARB_get_proc_address');
  GLX_ARB_create_context := Int_CheckExtension(Buffer, 'GLX_ARB_create_context');
  GLX_ARB_create_context_profile := Int_CheckExtension(Buffer, 'GLX_ARB_create_context_profile');
  GLX_ARB_vertex_buffer_object := Int_CheckExtension(Buffer, 'GLX_ARB_vertex_buffer_object');
  GLX_ARB_framebuffer_sRGB := Int_CheckExtension(Buffer, 'GLX_ARB_framebuffer_sRGB');
  GLX_ARB_create_context_robustness := Int_CheckExtension(Buffer, 'GLX_ARB_create_context_robustness');
  GLX_EXT_visual_info := Int_CheckExtension(Buffer, 'GLX_EXT_visual_info');
  GLX_EXT_visual_rating := Int_CheckExtension(Buffer, 'GLX_EXT_visual_rating');
  GLX_EXT_import_context := Int_CheckExtension(Buffer, 'GLX_EXT_import_context');
  GLX_EXT_fbconfig_packed_float := Int_CheckExtension(Buffer, 'GLX_EXT_fbconfig_packed_float');
  GLX_EXT_framebuffer_sRGB := Int_CheckExtension(Buffer, 'GLX_EXT_framebuffer_sRGB');
  GLX_EXT_texture_from_pixmap := Int_CheckExtension(Buffer, 'GLX_EXT_texture_from_pixmap');
  GLX_EXT_swap_control := Int_CheckExtension(Buffer, 'GLX_EXT_swap_control');
  GLX_EXT_create_context_es2_profile := Int_CheckExtension(Buffer, 'GLX_EXT_create_context_es2_profile');
  {$ENDIF}
  ImplementationRead := True;
end;

{$IFDEF DGL_WIN}
// =============================================================================
// RaiseLastOSError
// =============================================================================
// Needed for compatibility with older Delphiversions
// =============================================================================

procedure RaiseLastOSError;
begin
{$IFDEF FPC}
  raise Exception.Create('RaiseLastOSError!'); // To-Do: find a better solution
{$ELSE}
  {$IFDEF DELPHI6_AND_DOWN} // If Delphi 6 or later
    SysUtils.RaiseLastWin32Error;
  {$ELSE}
    SysUtils.RaiseLastOSError;
  {$ENDIF}
{$ENDIF}
end;

// =============================================================================
// CreateRenderingContext
// =============================================================================

function CreateRenderingContext(DC: HDC; Options: TRCOptions; ColorBits, ZBits, StencilBits, AccumBits, AuxBuffers: Integer; Layer: Integer): HGLRC;
const
  OBJ_MEMDC = 10;
  OBJ_ENHMETADC = 12;
  OBJ_METADC = 4;
  PFD_DOUBLEBUFFER = $00000001;
  PFD_STEREO = $00000002;
  PFD_DRAW_TO_WINDOW = $00000004;
  PFD_DRAW_TO_BITMAP = $00000008;
  PFD_SUPPORT_GDI = $00000010;
  PFD_SUPPORT_OPENGL = $00000020;
  PFD_TYPE_RGBA = 0;
  PFD_MAIN_PLANE = 0;
  PFD_OVERLAY_PLANE = 1;
  PFD_UNDERLAY_PLANE = LongWord(-1);
  MemoryDCs = [OBJ_MEMDC, OBJ_METADC, OBJ_ENHMETADC];
var
  PFDescriptor: TPixelFormatDescriptor;
  PixelFormat: Integer;
  AType: DWORD;
begin
  if GL_LibHandle = nil then
    InitOpenGL;

  FillChar(PFDescriptor, SizeOf(PFDescriptor), 0);

  with PFDescriptor do
  begin
    nSize := SizeOf(PFDescriptor);
    nVersion := 1;
    dwFlags := PFD_SUPPORT_OPENGL;

    AType := GetObjectType(DC);

    if AType = 0 then
      RaiseLastOSError;

    if AType in MemoryDCs then
      dwFlags := dwFlags or PFD_DRAW_TO_BITMAP
    else
      dwFlags := dwFlags or PFD_DRAW_TO_WINDOW;

    if opDoubleBuffered in Options then
      dwFlags := dwFlags or PFD_DOUBLEBUFFER;

    if opGDI in Options then
      dwFlags := dwFlags or PFD_SUPPORT_GDI;

    if opStereo in Options then
      dwFlags := dwFlags or PFD_STEREO;

    iPixelType := PFD_TYPE_RGBA;
    cColorBits := ColorBits;
    cDepthBits := zBits;
    cStencilBits := StencilBits;
    cAccumBits := AccumBits;
    cAuxBuffers := AuxBuffers;

    if Layer = 0 then
      iLayerType := PFD_MAIN_PLANE
    else
    if Layer > 0 then
      iLayerType := PFD_OVERLAY_PLANE
    else
      iLayerType := Byte(PFD_UNDERLAY_PLANE);
  end;

  PixelFormat := ChoosePixelFormat(DC, @PFDescriptor);

  if PixelFormat = 0 then
    RaiseLastOSError;

  if GetPixelFormat(DC) <> PixelFormat then
    if not SetPixelFormat(DC, PixelFormat, @PFDescriptor) then
      RaiseLastOSError;

  DescribePixelFormat(DC, PixelFormat, SizeOf(PFDescriptor), PFDescriptor);

  Result := wglCreateContext(DC);

  if Result = 0 then
    RaiseLastOSError
  else
    LastPixelFormat := 0;
end;

// =============================================================================
// DestroyRenderingContext
// =============================================================================

procedure DestroyRenderingContext(RC: HGLRC);
begin
  wglDeleteContext(RC);
end;


// =============================================================================
// ActivateRenderingContext
// =============================================================================

procedure ActivateRenderingContext(DC: HDC; RC: HGLRC; loadext: boolean = true);
begin
  Assert((DC <> 0), 'DC must not be 0');
  Assert((RC <> 0), 'RC must not be 0');

  wglMakeCurrent(DC, RC);

  {$ifdef DGL_TINY_HEADER}
  ReadCoreVersion;
  {$else}
  ReadImplementationProperties;

  if (loadext) then
    ReadExtensions;
  {$endif}
end;

// =============================================================================
// DeactivateRenderingContext
// =============================================================================

procedure DeactivateRenderingContext;
begin
  wglMakeCurrent(0, 0);
end;
{$ENDIF}


initialization

{$IFDEF CPU386}
  Set8087CW($133F);
{$ENDIF}

finalization

end.

