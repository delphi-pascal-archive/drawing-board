unit NGTypes;

{****************************************************************************}
{*                                                                          *}
{*  for copyright and version information see header in NGImages.pas        *}
{*                                                                          *}
{****************************************************************************}
{*                                                                          *}
{*  Changelog:                            * reverse chronological order *   *}
{*                                                                          *}
{*  * 0.9.8 *                                                               *}
{*  2001/07/16 - SPR - Added late binding for ZLIB                          *}
{*  2001/06/26 - GJU - Changed most CheckLIBMNGLoaded to assigned/exception *}
{*  2001/06/23 - SPR - Added stuff for late binding                         *}
{*  2001/05/08 - SPR - Restructured for Maintainability                     *}
{*             - SPR - Seperated original NGImage.pas into multiple units   *}
{*                                                                          *}
{****************************************************************************}


{$INCLUDE NGDefs.inc}



interface



{****************************************************************************}
{* LIBMNG interface definitions                                             *}
{* (translated from libmng.h)                                               *}
{****************************************************************************}


uses { Borland Standard Units }
     Graphics;


type
  { Exception Types }
  ENGImageException = class (EInvalidGraphicOperation);
  ENGDLLNotLoaded   = class (EInvalidGraphicOperation);

  { Library Defined Data Types }
  { Note:  Items ending with the following are pointer types
      - The character "p"
      - The characters "ptr" or "pchar" }
  mng_uint32     = cardinal;
  mng_uint32p    = ^mng_uint32;

  mng_uint16     = word;
  mng_uint16p    = ^mng_uint16;

  mng_int32      = integer;
  mng_int16      = smallint;

  mng_uint8      = byte;
  mng_uint8p     = ^mng_uint8;

  mng_int8       = shortint;
  mng_bool       = boolean;
  mng_ptr        = pointer;
  mng_pchar      = pchar;

  mng_handle     = pointer;
  mng_retcode    = mng_int32;
  mng_chunkid    = mng_uint32;
  mng_chunkidp   = ^mng_chunkid;

  mng_size_t     = cardinal;

  mng_imgtype    = (mng_it_unknown, mng_it_png, mng_it_mng, mng_it_jng);
  mng_speedtype  = (mng_st_normal, mng_st_fast, mng_st_slow, mng_st_slowest);


  mng_palette8e  = packed record             // 8-bit palette element
                     iRed   : mng_uint8;
                     iGreen : mng_uint8;
                     iBlue  : mng_uint8;
                   end;

  mng_palette8   = packed array [0 .. 255] of mng_palette8e;

  mng_uint8arr   = packed array [0 .. 255] of mng_uint8;
  mng_uint8arr4  = packed array [0 ..   3] of mng_uint8;
  mng_uint16arr  = packed array [0 .. 255] of mng_uint16;
  mng_uint32arr  = packed array [0 .. 255] of mng_uint32;
  mng_uint32arr2 = packed array [0 ..   1] of mng_uint32;

{****************************************************************************}
{ Call-Back Function Definitions }
type
  { Function Types Referenced by Other Function Definitions }
  Tmng_memalloc            = function  (    iLen         : mng_size_t) : mng_ptr;    stdcall;
  Tmng_memfree             = procedure (    iPtr         : mng_ptr;
                                            iLen         : mng_size_t);              stdcall;

  Tmng_openstream          = function  (    hHandle      : mng_handle) : mng_bool;   stdcall;
  Tmng_closestream         = function  (    hHandle      : mng_handle) : mng_bool;   stdcall;

  Tmng_readdata            = function  (    hHandle      : mng_handle;
                                            pBuf         : mng_ptr;
                                            iBuflen      : mng_uint32;
                                        var pRead        : mng_uint32) : mng_bool;   stdcall;

  Tmng_writedata           = function  (    hHandle      : mng_handle;
                                            pBuf         : mng_ptr;
                                            iBuflen      : mng_uint32;
                                        var pWritten     : mng_uint32) : mng_bool;   stdcall;

  Tmng_errorproc           = function  (    hHandle      : mng_handle;
                                            iErrorcode   : mng_retcode;
                                            iSeverity    : mng_uint8;
                                            iChunkname   : mng_chunkid;
                                            iChunkseq    : mng_uint32;
                                            iExtra1      : mng_int32;
                                            iExtra2      : mng_int32;
                                            zErrortext   : mng_pchar ) : mng_bool;   stdcall;
  Tmng_traceproc           = function  (    hHandle      : mng_handle;
                                            iFuncnr      : mng_int32;
                                            iFuncseq     : mng_uint32;
                                            zFuncname    : mng_pchar ) : mng_bool;   stdcall;

  Tmng_processheader       = function  (    hHandle      : mng_handle;
                                            iWidth       : mng_uint32;
                                            iHeight      : mng_uint32) : mng_bool;   stdcall;
  Tmng_processtext         = function  (    hHandle      : mng_handle;
                                            iType        : mng_uint8;
                                            zKeyword     : mng_pchar;
                                            zText        : mng_pchar;
                                            zLanguage    : mng_pchar;
                                            zTranslation : mng_pchar ) : mng_bool;   stdcall;

  Tmng_processunknown      = function  (    hHandle      : mng_handle;
                                            iChunkid     : mng_chunkid;
                                            iRawlen      : mng_uint32;
                                            pRawdata     : mng_ptr   ) : mng_bool;   stdcall;

  Tmng_getcanvasline       = function  (    hHandle      : mng_handle;
                                            iLinenr      : mng_uint32) : mng_ptr;    stdcall;
  Tmng_getalphaline        = function  (    hHandle      : mng_handle;
                                            iLinenr      : mng_uint32) : mng_ptr;    stdcall;
  Tmng_getbkgdline         = function  (    hHandle      : mng_handle;
                                            iLinenr      : mng_uint32) : mng_ptr;    stdcall;
  Tmng_refresh             = function  (    hHandle      : mng_handle;
                                            iX           : mng_uint32;
                                            iY           : mng_uint32;
                                            iWidth       : mng_uint32;
                                            iHeight      : mng_uint32) : mng_bool;   stdcall;

  Tmng_gettickcount        = function  (    hHandle      : mng_handle) : mng_uint32; stdcall;
  Tmng_settimer            = function  (    hHandle      : mng_handle;
                                            iMsecs       : mng_uint32) : mng_bool;   stdcall;

{****************************************************************************}

  { Working Function Definitions for implementation of both Early and Late Binding to the DLL }
  Tmng_version_text        = function: mng_pchar; stdcall;
  Tmng_version_so          = function: mng_uint8; stdcall;
  Tmng_version_dll         = function: mng_uint8; stdcall;
  Tmng_version_major       = function: mng_uint8; stdcall;
  Tmng_version_minor       = function: mng_uint8; stdcall;
  Tmng_version_release     = function: mng_uint8; stdcall;

{****************************************************************************}

  Tmng_initialize          = function (pUserdata          : mng_ptr;
                                       fMemalloc          : Tmng_memalloc;
                                       fMemfree           : Tmng_memfree;
                                       fTraceproc         : Tmng_traceproc   ) : mng_handle;         stdcall;

  Tmng_reset               = function (hHandle            : mng_handle       ) : mng_retcode;        stdcall;

  Tmng_cleanup             = function (var hHandle        : mng_handle       ) : mng_retcode;        stdcall;

  Tmng_read                = function (hHandle            : mng_handle       ) : mng_retcode;        stdcall;
  Tmng_write               = function (hHandle            : mng_handle       ) : mng_retcode;        stdcall;
  Tmng_create              = function (hHandle            : mng_handle       ) : mng_retcode;        stdcall;

  Tmng_readdisplay         = function (hHandle            : mng_handle       ) : mng_retcode;        stdcall;
  Tmng_display             = function (hHandle            : mng_handle       ) : mng_retcode;        stdcall;
  Tmng_display_resume      = function (hHandle            : mng_handle       ) : mng_retcode;        stdcall;
  Tmng_display_freeze      = function (hHandle            : mng_handle       ) : mng_retcode;        stdcall;
  Tmng_display_reset       = function (hHandle            : mng_handle       ) : mng_retcode;        stdcall;

  Tmng_getlasterror        = function (hHandle            : mng_handle;
                                       var iSeverity      : mng_uint8;
                                       var iChunkname     : mng_chunkid;
                                       var iChunkseq      : mng_uint32;
                                       var iExtra1        : mng_int32;
                                       var iExtra2        : mng_int32;
                                       var zErrortext     : mng_pchar        ) : mng_retcode;        stdcall;

{****************************************************************************}

  Tmng_setcb_memalloc      = function (hHandle            : mng_handle;
                                       fProc              : Tmng_memalloc     ) : mng_retcode;       stdcall;
  Tmng_setcb_memfree       = function (hHandle            : mng_handle;
                                       fProc              : Tmng_memfree      ) : mng_retcode;       stdcall;

  Tmng_setcb_openstream    = function (hHandle            : mng_handle;
                                       fProc              : Tmng_openstream   ) : mng_retcode;       stdcall;
  Tmng_setcb_closestream   = function (hHandle            : mng_handle;
                                       fProc              : Tmng_closestream  ) : mng_retcode;       stdcall;

  Tmng_setcb_readdata      = function (hHandle            : mng_handle;
                                       fProc              : Tmng_readdata     ) : mng_retcode;       stdcall;

  Tmng_setcb_writedata     = function (hHandle            : mng_handle;
                                       fProc              : Tmng_writedata    ) : mng_retcode;       stdcall;

  Tmng_setcb_errorproc     = function (hHandle            : mng_handle;
                                       fProc              : Tmng_errorproc    ) : mng_retcode;       stdcall;

  Tmng_setcb_processheader = function (hHandle            : mng_handle;
                                       fProc              : Tmng_processheader) : mng_retcode;       stdcall;
  Tmng_setcb_processtext   = function (hHandle            : mng_handle;
                                       fProc              : Tmng_processtext  ) : mng_retcode;       stdcall;

  Tmng_setcb_getcanvasline = function (hHandle            : mng_handle;
                                       fProc              : Tmng_getcanvasline) : mng_retcode;       stdcall;
  Tmng_setcb_getalphaline  = function (hHandle            : mng_handle;
                                       fProc              : Tmng_getalphaline ) : mng_retcode;       stdcall;
  Tmng_setcb_getbkgdline   = function (hHandle            : mng_handle;
                                       fProc              : Tmng_getbkgdline  ) : mng_retcode;       stdcall;
  Tmng_setcb_refresh       = function (hHandle            : mng_handle;
                                       fProc              : Tmng_refresh      ) : mng_retcode;       stdcall;

  Tmng_setcb_gettickcount  = function (hHandle            : mng_handle;
                                       fProc              : Tmng_gettickcount ) : mng_retcode;       stdcall;
  Tmng_setcb_settimer      = function (hHandle            : mng_handle;
                                       fProc              : Tmng_settimer     ) : mng_retcode;       stdcall;

{****************************************************************************}

  Tmng_getcb_memalloc      = function (hHandle            : mng_handle       ) : Tmng_memalloc;      stdcall;
  Tmng_getcb_memfree       = function (hHandle            : mng_handle       ) : Tmng_memfree;       stdcall;

  Tmng_getcb_openstream    = function (hHandle            : mng_handle       ) : Tmng_openstream;    stdcall;
  Tmng_getcb_closestream   = function (hHandle            : mng_handle       ) : Tmng_closestream;   stdcall;

  Tmng_getcb_readdata      = function (hHandle            : mng_handle       ) : Tmng_readdata;      stdcall;

  Tmng_getcb_writedata     = function (hHandle            : mng_handle       ) : Tmng_writedata;     stdcall;

  Tmng_getcb_errorproc     = function (hHandle            : mng_handle       ) : Tmng_errorproc;     stdcall;

  Tmng_getcb_processheader = function (hHandle            : mng_handle       ) : Tmng_processheader; stdcall;
  Tmng_getcb_processtext   = function (hHandle            : mng_handle       ) : Tmng_processtext;   stdcall;

  Tmng_getcb_getcanvasline = function (hHandle            : mng_handle       ) : Tmng_getcanvasline; stdcall;
  Tmng_getcb_getalphaline  = function (hHandle            : mng_handle       ) : Tmng_getalphaline;  stdcall;
  Tmng_getcb_getbkgdline   = function (hHandle            : mng_handle       ) : Tmng_getbkgdline;   stdcall;
  Tmng_getcb_refresh       = function (hHandle            : mng_handle       ) : Tmng_refresh;       stdcall;

  Tmng_getcb_gettickcount  = function (hHandle            : mng_handle       ) : Tmng_gettickcount;  stdcall;
  Tmng_getcb_settimer      = function (hHandle            : mng_handle       ) : Tmng_settimer;      stdcall;

{****************************************************************************}

  Tmng_set_userdata        = function (hHandle            : mng_handle;
                                       pUserdata          : mng_ptr          ) : mng_retcode;        stdcall;

  Tmng_set_canvasstyle     = function (hHandle            : mng_handle;
                                       iStyle             : mng_uint32       ) : mng_retcode;        stdcall;
  Tmng_set_bkgdstyle       = function (hHandle            : mng_handle;
                                       iStyle             : mng_uint32       ) : mng_retcode;        stdcall;

  Tmng_set_bgcolor         = function (hHandle            : mng_handle;
                                       iRed               : mng_uint16;
                                       iGreen             : mng_uint16;
                                       iBlue              : mng_uint16       ) : mng_retcode;        stdcall;

  Tmng_set_usebkgd         = function (hHandle            : mng_handle;
                                       bUseBKGD           : mng_bool         ) : mng_retcode;        stdcall;

  Tmng_set_storechunks     = function (hHandle            : mng_handle;
                                       bStorechunks       : mng_bool         ) : mng_retcode;        stdcall;

  Tmng_set_cacheplayback   = function (hHandle            : mng_handle;
                                       bCacheplayback     : mng_bool         ) : mng_retcode;        stdcall;

  Tmng_set_viewgammaint    = function (hHandle            : mng_handle;
                                       iGamma             : mng_uint32       ) : mng_retcode;        stdcall;
  Tmng_set_displaygammaint = function (hHandle            : mng_handle;
                                       iGamma             : mng_uint32       ) : mng_retcode;        stdcall;
  Tmng_set_dfltimggammaint = function (hHandle            : mng_handle;
                                       iGamma             : mng_uint32       ) : mng_retcode;        stdcall;

  Tmng_set_srgb            = function (hHandle            : mng_handle;
                                       bIssRGB            : mng_bool         ) : mng_retcode;        stdcall;
  Tmng_set_outputprofile   = function (hHandle            : mng_handle;
                                       zFilename          : mng_pchar        ) : mng_retcode;        stdcall;
  Tmng_set_outputprofile2  = function (hHandle            : mng_handle;
                                       iProfilesize       : mng_uint32;
                                       pProfile           : mng_ptr          ) : mng_retcode;        stdcall;
  Tmng_set_outputsrgb      = function (hHandle            : mng_handle       ) : mng_retcode;        stdcall;
  Tmng_set_srgbprofile     = function (hHandle            : mng_handle;
                                       zFilename          : mng_pchar        ) : mng_retcode;        stdcall;
  Tmng_set_srgbprofile2    = function (hHandle            : mng_handle;
                                       iProfilesize       : mng_uint32;
                                       pProfile           : mng_ptr          ) : mng_retcode;        stdcall;
  Tmng_set_srgbimplicit    = function (hHandle            : mng_handle       ) : mng_retcode;        stdcall;

  Tmng_set_maxcanvassize   = function (hHandle            : mng_handle;
                                       iMaxwidth          : mng_uint32;
                                       iMaxheight         : mng_uint32       ) : mng_retcode;        stdcall;

{****************************************************************************}

  Tmng_get_userdata        = function (hHandle            : mng_handle       ) : mng_ptr;            stdcall;

  Tmng_get_sigtype         = function (hHandle            : mng_handle       ) : mng_imgtype;        stdcall;
  Tmng_get_imagetype       = function (hHandle            : mng_handle       ) : mng_imgtype;        stdcall;
  Tmng_get_imagewidth      = function (hHandle            : mng_handle       ) : mng_uint32;         stdcall;
  Tmng_get_imageheight     = function (hHandle            : mng_handle       ) : mng_uint32;         stdcall;
  Tmng_get_ticks           = function (hHandle            : mng_handle       ) : mng_uint32;         stdcall;
  Tmng_get_framecount      = function (hHandle            : mng_handle       ) : mng_uint32;         stdcall;
  Tmng_get_layercount      = function (hHandle            : mng_handle       ) : mng_uint32;         stdcall;
  Tmng_get_playtime        = function (hHandle            : mng_handle       ) : mng_uint32;         stdcall;
  Tmng_get_simplicity      = function (hHandle            : mng_handle       ) : mng_uint32;         stdcall;

  Tmng_get_bitdepth        = function (hHandle            : mng_handle       ) : mng_uint8;          stdcall;
  Tmng_get_colortype       = function (hHandle            : mng_handle       ) : mng_uint8;          stdcall;
  Tmng_get_compression     = function (hHandle            : mng_handle       ) : mng_uint8;          stdcall;
  Tmng_get_filter          = function (hHandle            : mng_handle       ) : mng_uint8;          stdcall;
  Tmng_get_interlace       = function (hHandle            : mng_handle       ) : mng_uint8;          stdcall;
  Tmng_get_alphabitdepth   = function (hHandle            : mng_handle       ) : mng_uint8;          stdcall;
  Tmng_get_alphacompression= function (hHandle            : mng_handle       ) : mng_uint8;          stdcall;
  Tmng_get_alphafilter     = function (hHandle            : mng_handle       ) : mng_uint8;          stdcall;
  Tmng_get_alphainterlace  = function (hHandle            : mng_handle       ) : mng_uint8;          stdcall;

  Tmng_get_bgcolor         = procedure (hHandle           : mng_handle;
                                        var iRed          : mng_uint16;
                                        var iGreen        : mng_uint16;
                                        var iBlue         : mng_uint16       );                      stdcall;

  Tmng_get_usebkgd         = function (hHandle            : mng_handle       ) : mng_bool;           stdcall;

  Tmng_get_viewgammaint    = function (hHandle            : mng_handle       ) : mng_uint32;         stdcall;
  Tmng_get_displaygammaint = function (hHandle            : mng_handle       ) : mng_uint32;         stdcall;
  Tmng_get_dfltimggammaint = function (hHandle            : mng_handle       ) : mng_uint32;         stdcall;

  Tmng_get_srgb            = function (hHandle            : mng_handle       ) : mng_bool;           stdcall;

  Tmng_get_maxcanvaswidth  = function (hHandle            : mng_handle       ) : mng_uint32;         stdcall;
  Tmng_get_maxcanvasheight = function (hHandle            : mng_handle       ) : mng_uint32;         stdcall;

  Tmng_get_starttime       = function (hHandle            : mng_handle       ) : mng_uint32;         stdcall;
  Tmng_get_runtime         = function (hHandle            : mng_handle       ) : mng_uint32;         stdcall;
  Tmng_get_currentframe    = function (hHandle            : mng_handle       ) : mng_uint32;         stdcall;
  Tmng_get_currentlayer    = function (hHandle            : mng_handle       ) : mng_uint32;         stdcall;
  Tmng_get_currentplaytime = function (hHandle            : mng_handle       ) : mng_uint32;         stdcall;

  Tmng_status_error        = function (hHandle            : mng_handle       ) : mng_bool;           stdcall;
  Tmng_status_reading      = function (hHandle            : mng_handle       ) : mng_bool;           stdcall;
  Tmng_status_suspendbreak = function (hHandle            : mng_handle       ) : mng_bool;           stdcall;
  Tmng_status_creating     = function (hHandle            : mng_handle       ) : mng_bool;           stdcall;
  Tmng_status_writing      = function (hHandle            : mng_handle       ) : mng_bool;           stdcall;
  Tmng_status_displaying   = function (hHandle            : mng_handle       ) : mng_bool;           stdcall;
  Tmng_status_running      = function (hHandle            : mng_handle       ) : mng_bool;           stdcall;
  Tmng_status_timerbreak   = function (hHandle            : mng_handle       ) : mng_bool;           stdcall;

{****************************************************************************}

  Tmng_putchunk_ihdr       = function (hHandle            : mng_handle;
                                       iWidth             : mng_uint32;
                                       iHeight            : mng_uint32;
                                       iBitdepth          : mng_uint8;
                                       iColortype         : mng_uint8;
                                       iCompression       : mng_uint8;
                                       iFilter            : mng_uint8;
                                       iInterlace         : mng_uint8        ) : mng_retcode;        stdcall;

  Tmng_putchunk_plte       = function (hHandle            : mng_handle;
                                       iCount             : mng_uint32;
                                       aPalette           : mng_palette8     ) : mng_retcode;        stdcall;

  Tmng_putchunk_idat       = function (hHandle            : mng_handle;
                                       iRawlen            : mng_uint32;
                                       pRawdata           : mng_ptr          ) : mng_retcode;        stdcall;

  Tmng_putchunk_iend       = function (hHandle            : mng_handle       ) : mng_retcode;        stdcall;

  Tmng_putchunk_trns       = function (hHandle            : mng_handle;
                                       bEmpty             : mng_bool;
                                       bGlobal            : mng_bool;
                                       iType              : mng_uint8;
                                       iCount             : mng_uint32;
                                       aAlphas            : mng_uint8arr;
                                       iGray              : mng_uint16;
                                       iRed               : mng_uint16;
                                       iGreen             : mng_uint16;
                                       iBlue              : mng_uint16;
                                       iRawlen            : mng_uint32;
                                       aRawdata           : mng_uint8arr     ) : mng_retcode;        stdcall;

  Tmng_putchunk_gama       = function (hHandle            : mng_handle;
                                       bEmpty             : mng_bool;
                                       iGamma             : mng_uint32       ) : mng_retcode;        stdcall;

  Tmng_putchunk_chrm       = function (hHandle            : mng_handle;
                                       bEmpty             : mng_bool;
                                       iWhitepointx       : mng_uint32;
                                       iWhitepointy       : mng_uint32;
                                       iRedx              : mng_uint32;
                                       iRedy              : mng_uint32;
                                       iGreenx            : mng_uint32;
                                       iGreeny            : mng_uint32;
                                       iBluex             : mng_uint32;
                                       iBluey             : mng_uint32       ) : mng_retcode;        stdcall;

  Tmng_putchunk_srgb       = function (hHandle            : mng_handle;
                                       bEmpty             : mng_bool;
                                       iRenderingintent   : mng_uint8        ) : mng_retcode;        stdcall;

  Tmng_putchunk_iccp       = function (hHandle            : mng_handle;
                                       bEmpty             : mng_bool;
                                       iNamesize          : mng_uint32;
                                       zName              : mng_pchar;
                                       iCompression       : mng_uint8;
                                       iProfilesize       : mng_uint32;
                                       pProfile           : mng_ptr          ) : mng_retcode;        stdcall;

  Tmng_putchunk_text       = function (hHandle            : mng_handle;
                                       iKeywordsize       : mng_uint32;
                                       zKeyword           : mng_pchar;
                                       iTextsize          : mng_uint32;
                                       zText              : mng_pchar        ) : mng_retcode;        stdcall;

  Tmng_putchunk_ztxt       = function (hHandle            : mng_handle;
                                       iKeywordsize       : mng_uint32;
                                       zKeyword           : mng_pchar;
                                       iCompression       : mng_uint8;
                                       iTextsize          : mng_uint32;
                                       zText              : mng_pchar        ) : mng_retcode;        stdcall;

  Tmng_putchunk_itxt       = function (hHandle            : mng_handle;
                                       iKeywordsize       : mng_uint32;
                                       zKeyword           : mng_pchar;
                                       iCompressionflag   : mng_uint8;
                                       iCompressionmethod : mng_uint8;
                                       iLanguagesize      : mng_uint32;
                                       zLanguage          : mng_pchar;
                                       iTranslationsize   : mng_uint32;
                                       zTranslation       : mng_pchar;
                                       iTextsize          : mng_uint32;
                                       zText              : mng_pchar        ) : mng_retcode;        stdcall;

  Tmng_putchunk_bkgd       = function (hHandle            : mng_handle;
                                       bEmpty             : mng_bool;
                                       iType              : mng_uint8;
                                       iIndex             : mng_uint8;
                                       iGray              : mng_uint16;
                                       iRed               : mng_uint16;
                                       iGreen             : mng_uint16;
                                       iBlue              : mng_uint16       ) : mng_retcode;        stdcall;

  Tmng_putchunk_phys       = function (hHandle            : mng_handle;
                                       bEmpty             : mng_bool;
                                       iSizex             : mng_uint32;
                                       iSizey             : mng_uint32;
                                       iUnit              : mng_uint8        ) : mng_retcode;        stdcall;

  Tmng_putchunk_sbit       = function (hHandle            : mng_handle;
                                       bEmpty             : mng_bool;
                                       iType              : mng_uint8;
                                       aBits              : mng_uint8arr4    ) : mng_retcode;        stdcall;

  Tmng_putchunk_splt       = function (hHandle            : mng_handle;
                                       bEmpty             : mng_bool;
                                       iNamesize          : mng_uint32;
                                       zName              : mng_pchar;
                                       iSampledepth       : mng_uint8;
                                       iEntrycount        : mng_uint32;
                                       pEntries           : mng_ptr          ) : mng_retcode;        stdcall;

  Tmng_putchunk_hist       = function (hHandle            : mng_handle;
                                       iEntrycount        : mng_uint32;
                                       aEntries           : mng_uint16arr    ) : mng_retcode;        stdcall;

  Tmng_putchunk_time       = function (hHandle            : mng_handle;
                                       iYear              : mng_uint16;
                                       iMonth             : mng_uint8;
                                       iDay               : mng_uint8;
                                       iHour              : mng_uint8;
                                       iMinute            : mng_uint8;
                                       iSecond            : mng_uint8        ) : mng_retcode;        stdcall;

  Tmng_putchunk_jhdr       = function (hHandle            : mng_handle;
                                       iWidth             : mng_uint32;
                                       iHeight            : mng_uint32;
                                       iColortype         : mng_uint8;
                                       iImagesampledepth  : mng_uint8;
                                       iImagecompression  : mng_uint8;
                                       iImageinterlace    : mng_uint8;
                                       iAlphasampledepth  : mng_uint8;
                                       iAlphacompression  : mng_uint8;
                                       iAlphafilter       : mng_uint8;
                                       iAlphainterlace    : mng_uint8        ) : mng_retcode;        stdcall;

  Tmng_putchunk_jdat       = function (hHandle            : mng_handle;
                                       iRawlen            : mng_uint32;
                                       pRawdata           : mng_ptr          ) : mng_retcode;        stdcall;

  Tmng_putchunk_jsep       = function (hHandle            : mng_handle       ) : mng_retcode;        stdcall;


{****************************************************************************}
  { Interface for either the Early or Late Binding to the DLL }
  function mng_version_text    : mng_pchar; stdcall;
  function mng_version_so      : mng_uint8; stdcall;
  function mng_version_dll     : mng_uint8; stdcall;
  function mng_version_major   : mng_uint8; stdcall;
  function mng_version_minor   : mng_uint8; stdcall;
  function mng_version_release : mng_uint8; stdcall;

{****************************************************************************}

  function mng_initialize           (pUserdata          : mng_ptr;
                                     fMemalloc          : Tmng_memalloc;
                                     fMemfree           : Tmng_memfree;
                                     fTraceproc         : Tmng_traceproc    ) : mng_handle;        stdcall;

  function mng_reset                (hHandle            : mng_handle        ) : mng_retcode;       stdcall;

  function mng_cleanup              (var hHandle        : mng_handle        ) : mng_retcode;       stdcall;

  function mng_read(hHandle                             : mng_handle        ) : mng_retcode;       stdcall;
  function mng_write(hHandle                            : mng_handle        ) : mng_retcode;       stdcall;
  function mng_create(hHandle                           : mng_handle        ) : mng_retcode;       stdcall;

  function mng_readdisplay          (hHandle            : mng_handle        ) : mng_retcode;       stdcall;
  function mng_display              (hHandle            : mng_handle        ) : mng_retcode;       stdcall;
  function mng_display_resume       (hHandle            : mng_handle        ) : mng_retcode;       stdcall;
  function mng_display_freeze       (hHandle            : mng_handle        ) : mng_retcode;       stdcall;
  function mng_display_reset        (hHandle            : mng_handle        ) : mng_retcode;       stdcall;

  function mng_getlasterror         (hHandle            : mng_handle;
                                     var iSeverity      : mng_uint8;
                                     var iChunkname     : mng_chunkid;
                                     var iChunkseq      : mng_uint32;
                                     var iExtra1        : mng_int32;
                                     var iExtra2        : mng_int32;
                                     var zErrortext     : mng_pchar         ) : mng_retcode;       stdcall;

{****************************************************************************}

  function mng_setcb_memalloc       (hHandle            : mng_handle;
                                     fProc              : Tmng_memalloc     ) : mng_retcode;       stdcall;
  function mng_setcb_memfree        (hHandle            : mng_handle;
                                     fProc              : Tmng_memfree      ) : mng_retcode;       stdcall;

  function mng_setcb_openstream     (hHandle            : mng_handle;
                                     fProc              : Tmng_openstream   ) : mng_retcode;       stdcall;
  function mng_setcb_closestream    (hHandle            : mng_handle;
                                     fProc              : Tmng_closestream  ) : mng_retcode;       stdcall;

  function mng_setcb_readdata       (hHandle            : mng_handle;
                                     fProc              : Tmng_readdata     ) : mng_retcode;       stdcall;

  function mng_setcb_writedata      (hHandle            : mng_handle;
                                     fProc              : Tmng_writedata    ) : mng_retcode;       stdcall;

  function mng_setcb_errorproc      (hHandle            : mng_handle;
                                     fProc              : Tmng_errorproc    ) : mng_retcode;       stdcall;

  function mng_setcb_processheader  (hHandle            : mng_handle;
                                     fProc              : Tmng_processheader) : mng_retcode;       stdcall;
  function mng_setcb_processtext    (hHandle            : mng_handle;
                                     fProc              : Tmng_processtext  ) : mng_retcode;       stdcall;

  function  mng_setcb_getcanvasline (hHandle            : mng_handle;
                                     fProc              : Tmng_getcanvasline) : mng_retcode;       stdcall;
  function  mng_setcb_getalphaline  (hHandle            : mng_handle;
                                     fProc              : Tmng_getalphaline ) : mng_retcode;       stdcall;
  function  mng_setcb_getbkgdline   (hHandle            : mng_handle;
                                     fProc              : Tmng_getbkgdline  ) : mng_retcode;       stdcall;
  function  mng_setcb_refresh       (hHandle            : mng_handle;
                                     fProc              : Tmng_refresh      ) : mng_retcode;       stdcall;

  function  mng_setcb_gettickcount  (hHandle            : mng_handle;
                                     fProc              : Tmng_gettickcount ) : mng_retcode;       stdcall;
  function  mng_setcb_settimer      (hHandle            : mng_handle;
                                     fProc              : Tmng_settimer     ) : mng_retcode;       stdcall;

{****************************************************************************}

  function  mng_getcb_memalloc      (hHandle            : mng_handle       ) : Tmng_memalloc;      stdcall;
  function  mng_getcb_memfree       (hHandle            : mng_handle       ) : Tmng_memfree;       stdcall;

  function  mng_getcb_openstream    (hHandle            : mng_handle       ) : Tmng_openstream;    stdcall;
  function  mng_getcb_closestream   (hHandle            : mng_handle       ) : Tmng_closestream;   stdcall;

  function  mng_getcb_readdata      (hHandle            : mng_handle       ) : Tmng_readdata;      stdcall;

  function  mng_getcb_writedata     (hHandle            : mng_handle       ) : Tmng_writedata;     stdcall;

  function  mng_getcb_errorproc     (hHandle            : mng_handle       ) : Tmng_errorproc;     stdcall;

  function  mng_getcb_processheader (hHandle            : mng_handle       ) : Tmng_processheader; stdcall;
  function  mng_getcb_processtext   (hHandle            : mng_handle       ) : Tmng_processtext;   stdcall;

  function  mng_getcb_getcanvasline (hHandle            : mng_handle       ) : Tmng_getcanvasline; stdcall;
  function  mng_getcb_getalphaline  (hHandle            : mng_handle       ) : Tmng_getalphaline;  stdcall;
  function  mng_getcb_getbkgdline   (hHandle            : mng_handle       ) : Tmng_getbkgdline;   stdcall;
  function  mng_getcb_refresh       (hHandle            : mng_handle       ) : Tmng_refresh;       stdcall;

  function  mng_getcb_gettickcount  (hHandle            : mng_handle       ) : Tmng_gettickcount;  stdcall;
  function  mng_getcb_settimer      (hHandle            : mng_handle       ) : Tmng_settimer;      stdcall;

{****************************************************************************}

  function  mng_set_userdata        (hHandle            : mng_handle;
                                     pUserdata          : mng_ptr          ) : mng_retcode;        stdcall;

  function  mng_set_canvasstyle     (hHandle            : mng_handle;
                                     iStyle             : mng_uint32       ) : mng_retcode;        stdcall;
  function  mng_set_bkgdstyle       (hHandle            : mng_handle;
                                     iStyle             : mng_uint32       ) : mng_retcode;        stdcall;

  function  mng_set_bgcolor         (hHandle            : mng_handle;
                                     iRed               : mng_uint16;
                                     iGreen             : mng_uint16;
                                     iBlue              : mng_uint16       ) : mng_retcode;        stdcall;

  function  mng_set_usebkgd         (hHandle            : mng_handle;
                                     bUseBKGD           : mng_bool         ) : mng_retcode;        stdcall;

  function  mng_set_storechunks     (hHandle            : mng_handle;
                                     bStorechunks       : mng_bool         ) : mng_retcode;        stdcall;

  function  mng_set_cacheplayback   (hHandle            : mng_handle;
                                     bCacheplayback     : mng_bool         ) : mng_retcode;        stdcall;

  function  mng_set_viewgammaint    (hHandle            : mng_handle;
                                     iGamma             : mng_uint32       ) : mng_retcode;        stdcall;
  function  mng_set_displaygammaint (hHandle            : mng_handle;
                                     iGamma             : mng_uint32       ) : mng_retcode;        stdcall;
  function  mng_set_dfltimggammaint (hHandle            : mng_handle;
                                     iGamma             : mng_uint32       ) : mng_retcode;        stdcall;

  function  mng_set_srgb            (hHandle            : mng_handle;
                                     bIssRGB            : mng_bool         ) : mng_retcode;        stdcall;
  function  mng_set_outputprofile   (hHandle            : mng_handle;
                                     zFilename          : mng_pchar        ) : mng_retcode;        stdcall;
  function  mng_set_outputprofile2  (hHandle            : mng_handle;
                                     iProfilesize       : mng_uint32;
                                     pProfile           : mng_ptr          ) : mng_retcode;        stdcall;
  function  mng_set_outputsrgb      (hHandle            : mng_handle       ) : mng_retcode;        stdcall;
  function  mng_set_srgbprofile     (hHandle            : mng_handle;
                                     zFilename          : mng_pchar        ) : mng_retcode;        stdcall;
  function  mng_set_srgbprofile2    (hHandle            : mng_handle;
                                     iProfilesize       : mng_uint32;
                                     pProfile           : mng_ptr          ) : mng_retcode;        stdcall;
  function  mng_set_srgbimplicit    (hHandle            : mng_handle       ) : mng_retcode;        stdcall;

  function  mng_set_maxcanvassize   (hHandle            : mng_handle;
                                     iMaxwidth          : mng_uint32;
                                     iMaxheight         : mng_uint32       ) : mng_retcode;        stdcall;

{****************************************************************************}

  function  mng_get_userdata        (hHandle            : mng_handle       ) : mng_ptr;           stdcall;

  function  mng_get_sigtype         (hHandle            : mng_handle       ) : mng_imgtype;       stdcall;
  function  mng_get_imagetype       (hHandle            : mng_handle       ) : mng_imgtype;       stdcall;
  function  mng_get_imagewidth      (hHandle            : mng_handle       ) : mng_uint32;        stdcall;
  function  mng_get_imageheight     (hHandle            : mng_handle       ) : mng_uint32;        stdcall;
  function  mng_get_ticks           (hHandle            : mng_handle       ) : mng_uint32;        stdcall;
  function  mng_get_framecount      (hHandle            : mng_handle       ) : mng_uint32;        stdcall;
  function  mng_get_layercount      (hHandle            : mng_handle       ) : mng_uint32;        stdcall;
  function  mng_get_playtime        (hHandle            : mng_handle       ) : mng_uint32;        stdcall;
  function  mng_get_simplicity      (hHandle            : mng_handle       ) : mng_uint32;        stdcall;

  function  mng_get_bitdepth        (hHandle            : mng_handle       ) : mng_uint8;         stdcall;
  function  mng_get_colortype       (hHandle            : mng_handle       ) : mng_uint8;         stdcall;
  function  mng_get_compression     (hHandle            : mng_handle       ) : mng_uint8;         stdcall;
  function  mng_get_filter          (hHandle            : mng_handle       ) : mng_uint8;         stdcall;
  function  mng_get_interlace       (hHandle            : mng_handle       ) : mng_uint8;         stdcall;
  function  mng_get_alphabitdepth   (hHandle            : mng_handle       ) : mng_uint8;         stdcall;
  function  mng_get_alphacompression(hHandle            : mng_handle       ) : mng_uint8;         stdcall;
  function  mng_get_alphafilter     (hHandle            : mng_handle       ) : mng_uint8;         stdcall;
  function  mng_get_alphainterlace  (hHandle            : mng_handle       ) : mng_uint8;         stdcall;

  procedure mng_get_bgcolor         (hHandle            : mng_handle;
                                     var iRed           : mng_uint16;
                                     var iGreen         : mng_uint16;
                                     var iBlue          : mng_uint16       );                     stdcall;

  function  mng_get_usebkgd         (hHandle            : mng_handle       ) : mng_bool;          stdcall;

  function  mng_get_viewgammaint    (hHandle            : mng_handle       ) : mng_uint32;        stdcall;
  function  mng_get_displaygammaint (hHandle            : mng_handle       ) : mng_uint32;        stdcall;
  function  mng_get_dfltimggammaint (hHandle            : mng_handle       ) : mng_uint32;        stdcall;

  function  mng_get_srgb            (hHandle            : mng_handle       ) : mng_bool;          stdcall;

  function  mng_get_maxcanvaswidth  (hHandle            : mng_handle       ) : mng_uint32;        stdcall;
  function  mng_get_maxcanvasheight (hHandle            : mng_handle       ) : mng_uint32;        stdcall;

  function  mng_get_starttime       (hHandle            : mng_handle       ) : mng_uint32;        stdcall;
  function  mng_get_runtime         (hHandle            : mng_handle       ) : mng_uint32;        stdcall;
  function  mng_get_currentframe    (hHandle            : mng_handle       ) : mng_uint32;        stdcall;
  function  mng_get_currentlayer    (hHandle            : mng_handle       ) : mng_uint32;        stdcall;
  function  mng_get_currentplaytime (hHandle            : mng_handle       ) : mng_uint32;        stdcall;

  function  mng_status_error        (hHandle            : mng_handle       ) : mng_bool;          stdcall;
  function  mng_status_reading      (hHandle            : mng_handle       ) : mng_bool;          stdcall;
  function  mng_status_suspendbreak (hHandle            : mng_handle       ) : mng_bool;          stdcall;
  function  mng_status_creating     (hHandle            : mng_handle       ) : mng_bool;          stdcall;
  function  mng_status_writing      (hHandle            : mng_handle       ) : mng_bool;          stdcall;
  function  mng_status_displaying   (hHandle            : mng_handle       ) : mng_bool;          stdcall;
  function  mng_status_running      (hHandle            : mng_handle       ) : mng_bool;          stdcall;
  function  mng_status_timerbreak   (hHandle            : mng_handle       ) : mng_bool;          stdcall;

{****************************************************************************}
  function  mng_putchunk_ihdr       (hHandle            : mng_handle;
                                     iWidth             : mng_uint32;
                                     iHeight            : mng_uint32;
                                     iBitdepth          : mng_uint8;
                                     iColortype         : mng_uint8;
                                     iCompression       : mng_uint8;
                                     iFilter            : mng_uint8;
                                     iInterlace         : mng_uint8        ) : mng_retcode;       stdcall;
  function  mng_putchunk_plte       (hHandle            : mng_handle;
                                     iCount             : mng_uint32;
                                     aPalette           : mng_palette8     ) : mng_retcode;       stdcall;
  function  mng_putchunk_idat       (hHandle            : mng_handle;
                                     iRawlen            : mng_uint32;
                                     pRawdata           : mng_ptr          ) : mng_retcode;       stdcall;
  function  mng_putchunk_iend       (hHandle            : mng_handle       ) : mng_retcode;       stdcall;
  function  mng_putchunk_trns       (hHandle            : mng_handle;
                                     bEmpty             : mng_bool;
                                     bGlobal            : mng_bool;
                                     iType              : mng_uint8;
                                     iCount             : mng_uint32;
                                     aAlphas            : mng_uint8arr;
                                     iGray              : mng_uint16;
                                     iRed               : mng_uint16;
                                     iGreen             : mng_uint16;
                                     iBlue              : mng_uint16;
                                     iRawlen            : mng_uint32;
                                     aRawdata           : mng_uint8arr     ) : mng_retcode;       stdcall;
  function  mng_putchunk_gama       (hHandle            : mng_handle;
                                     bEmpty             : mng_bool;
                                     iGamma             : mng_uint32       ) : mng_retcode;       stdcall;
  function  mng_putchunk_chrm       (hHandle            : mng_handle;
                                     bEmpty             : mng_bool;
                                     iWhitepointx       : mng_uint32;
                                     iWhitepointy       : mng_uint32;
                                     iRedx              : mng_uint32;
                                     iRedy              : mng_uint32;
                                     iGreenx            : mng_uint32;
                                     iGreeny            : mng_uint32;
                                     iBluex             : mng_uint32;
                                     iBluey             : mng_uint32       ) : mng_retcode;       stdcall;
  function  mng_putchunk_srgb       (hHandle            : mng_handle;
                                     bEmpty             : mng_bool;
                                     iRenderingintent   : mng_uint8        ) : mng_retcode;       stdcall;
  function  mng_putchunk_iccp       (hHandle            : mng_handle;
                                     bEmpty             : mng_bool;
                                     iNamesize          : mng_uint32;
                                     zName              : mng_pchar;
                                     iCompression       : mng_uint8;
                                     iProfilesize       : mng_uint32;
                                     pProfile           : mng_ptr          ) : mng_retcode;       stdcall;
  function  mng_putchunk_text       (hHandle            : mng_handle;
                                     iKeywordsize       : mng_uint32;
                                     zKeyword           : mng_pchar;
                                     iTextsize          : mng_uint32;
                                     zText              : mng_pchar        ) : mng_retcode;       stdcall;
  function  mng_putchunk_ztxt       (hHandle            : mng_handle;
                                     iKeywordsize       : mng_uint32;
                                     zKeyword           : mng_pchar;
                                     iCompression       : mng_uint8;
                                     iTextsize          : mng_uint32;
                                     zText              : mng_pchar        ) : mng_retcode;       stdcall;
  function  mng_putchunk_itxt       (hHandle            : mng_handle;
                                     iKeywordsize       : mng_uint32;
                                     zKeyword           : mng_pchar;
                                     iCompressionflag   : mng_uint8;
                                     iCompressionmethod : mng_uint8;
                                     iLanguagesize      : mng_uint32;
                                     zLanguage          : mng_pchar;
                                     iTranslationsize   : mng_uint32;
                                     zTranslation       : mng_pchar;
                                     iTextsize          : mng_uint32;
                                     zText              : mng_pchar        ) : mng_retcode;       stdcall;
  function  mng_putchunk_bkgd       (hHandle            : mng_handle;
                                     bEmpty             : mng_bool;
                                     iType              : mng_uint8;
                                     iIndex             : mng_uint8;
                                     iGray              : mng_uint16;
                                     iRed               : mng_uint16;
                                     iGreen             : mng_uint16;
                                     iBlue              : mng_uint16       ) : mng_retcode;       stdcall;
  function  mng_putchunk_phys       (hHandle            : mng_handle;
                                     bEmpty             : mng_bool;
                                     iSizex             : mng_uint32;
                                     iSizey             : mng_uint32;
                                     iUnit              : mng_uint8        ) : mng_retcode;       stdcall;
  function  mng_putchunk_sbit       (hHandle            : mng_handle;
                                     bEmpty             : mng_bool;
                                     iType              : mng_uint8;
                                     aBits              : mng_uint8arr4    ) : mng_retcode;       stdcall;
  function  mng_putchunk_splt       (hHandle            : mng_handle;
                                     bEmpty             : mng_bool;
                                     iNamesize          : mng_uint32;
                                     zName              : mng_pchar;
                                     iSampledepth       : mng_uint8;
                                     iEntrycount        : mng_uint32;
                                     pEntries           : mng_ptr          ) : mng_retcode;       stdcall;
  function  mng_putchunk_hist       (hHandle            : mng_handle;
                                     iEntrycount        : mng_uint32;
                                     aEntries           : mng_uint16arr    ) : mng_retcode;       stdcall;
  function  mng_putchunk_time       (hHandle            : mng_handle;
                                     iYear              : mng_uint16;
                                     iMonth             : mng_uint8;
                                     iDay               : mng_uint8;
                                     iHour              : mng_uint8;
                                     iMinute            : mng_uint8;
                                     iSecond            : mng_uint8        ) : mng_retcode;       stdcall;
  function  mng_putchunk_jhdr       (hHandle            : mng_handle;
                                     iWidth             : mng_uint32;
                                     iHeight            : mng_uint32;
                                     iColortype         : mng_uint8;
                                     iImagesampledepth  : mng_uint8;
                                     iImagecompression  : mng_uint8;
                                     iImageinterlace    : mng_uint8;
                                     iAlphasampledepth  : mng_uint8;
                                     iAlphacompression  : mng_uint8;
                                     iAlphafilter       : mng_uint8;
                                     iAlphainterlace    : mng_uint8        ) : mng_retcode;       stdcall;
  function  mng_putchunk_jdat       (hHandle            : mng_handle;
                                     iRawlen            : mng_uint32;
                                     pRawdata           : mng_ptr          ) : mng_retcode;       stdcall;
  function  mng_putchunk_jsep       (hHandle            : mng_handle       ) : mng_retcode;       stdcall;


{****************************************************************************}
{* LIBMNG interface definitions for ZLIB                                    *}
{****************************************************************************}
{*                                                                          *}
{*  Uses "zlib" - a mighty, patent-free(!) (de)compression-library          *}
{*  copyright (C) 1995-1998 Jean-loup Gailly and Mark Adler                 *}
{*  http://www.info-zip.org/pub/infozip/zlib                                *}
{*                                                                          *}
{****************************************************************************}

{$IFDEF INCLUDE_ZLIB}

{****************************************************************************}

function InflateString  (    Input      : string;
                         var Output     : string ) : integer;

function DeflateString  (    Input      : string;
                         var Output     : string ) : integer;

function InflateString2 (    Input      : string;
                         var Output     : string;
                             windowBits : integer) : integer;

function DeflateString2 (    Input      : string;
                         var Output     : string;
                             level      : integer;
                             method     : integer;
                             windowBits : integer;
                             memLevel   : integer;
                             strategy   : integer) : integer;

{****************************************************************************}

const
  ZLIB_VERSION = '1.1.3';

  { Return Values }
  Z_NO_FLUSH            = 0;
  Z_PARTIAL_FLUSH       = 1;
  Z_SYNC_FLUSH          = 2;
  Z_FULL_FLUSH          = 3;
  Z_FINISH              = 4;

  Z_OK                  = 0;
  Z_STREAM_END          = 1;
  Z_NEED_DICT           = 2;
  Z_ERRNO               = -1;
  Z_STREAM_ERROR        = -2;
  Z_DATA_ERROR          = -3;
  Z_MEM_ERROR           = -4;
  Z_BUF_ERROR           = -5;
  Z_VERSION_ERROR       = -6;

  Z_NO_COMPRESSION      = 0;
  Z_BEST_SPEED          = 1;
  Z_BEST_COMPRESSION    = 9;
  Z_DEFAULT_COMPRESSION = -1;

  Z_FILTERED            = 1;
  Z_HUFFMAN_ONLY        = 2;
  Z_DEFAULT_STRATEGY    = 0;

  Z_BINARY              = 0;
  Z_ASCII               = 1;
  Z_UNKNOWN             = 2;

  Z_DEFLATED            = 8;

  Z_NULL                = 0;

  Z_MAX_MEM_LEVEL       = 9;
  Z_DEF_MEM_LEVEL       = 8;

{****************************************************************************}

type
  alloc_func = function  (opaque  : pointer;
                          items   : integer;
                          size    : integer) : pointer; stdcall;
  free_func  = procedure (opaque  : pointer;
                          address : pointer); stdcall;

{****************************************************************************}

type
  z_stream   = packed record
                 next_in   : pointer;
                 avail_in  : integer;
                 total_in  : cardinal;

                 next_out  : pointer;
                 avail_out : integer;
                 total_out : cardinal;

                 msg       : pchar;
                 state     : pointer;    { reserved }

                 zalloc    : alloc_func;
                 zfree     : free_func;
                 opaque    : pointer;

                 data_type : integer;
                 adler     : cardinal;
                 reserved  : cardinal;
               end;

  z_streamp  = ^z_stream;

{****************************************************************************}
type
  TdeflateInit_ = function (strm        : z_streamp;
                            level       : integer;
                            version     : pchar;
                            stream_size : integer) : integer; stdcall;

  TinflateInit_ = function (strm        : z_streamp;
                            version     : pchar;
                            stream_size : integer) : integer; stdcall;

  TdeflateInit2_ = function (strm        : z_streamp;
                             level       : integer;
                             method      : integer;
                             windowBits  : integer;
                             memLevel    : integer;
                             strategy    : integer;
                             version     : pchar;
                             stream_size : integer) : integer; stdcall;

  TinflateInit2_ = function (strm        : z_streamp;
                             windowBits  : integer;
                             version     : pchar;
                             stream_size : integer) : integer; stdcall;

{****************************************************************************}

  TzLibVersion = function: PChar;        stdcall;
  TdeflateInit = function (strm        : z_streamp;
                           level       : integer  ) : integer; stdcall;
  Tdeflate = function (strm        : z_streamp;
                       flush       : integer  ) : integer; stdcall;
  TdeflateEnd = function (strm        : z_streamp) : integer; stdcall;
  TinflateInit = function (strm        : z_streamp) : integer; stdcall;
  Tinflate = function (strm        : z_streamp;
                       flush       : integer  ) : integer; stdcall;
  TinflateEnd = function (strm        : z_streamp) : integer; stdcall;
  TdeflateInit2 = function (strm        : z_streamp;
                            level       : integer;
                            method      : integer;
                            windowBits  : integer;
                            memLevel    : integer;
                            strategy    : integer  ) : integer; stdcall;
  TdeflateSetDictionary = function (strm        : z_streamp;
                                    dictionary  : pointer;
                                    dictLength  : cardinal ) : integer; stdcall;
  TdeflateCopy = function (dest        : z_streamp;
                           source      : z_streamp) : integer; stdcall;
  TdeflateReset = function (strm        : z_streamp) : integer; stdcall;
  TdeflateParams = function (strm        : z_streamp;
                             level       : integer;
                             strategy    : integer  ) : integer; stdcall;
  TinflateInit2 = function (strm        : z_streamp;
                            windowBits  : integer  ) : integer; stdcall;
  TinflateSetDictionary = function (strm        : z_streamp;
                                    dictionary  : pointer;
                                    dictLength  : cardinal ) : integer; stdcall;
  TinflateSync = function (strm        : z_streamp) : integer; stdcall;
  TinflateReset = function (strm        : z_streamp) : integer; stdcall;
  Tcompress = function (dest        : pointer;
                        var destLen : cardinal;
                        source      : pointer;
                        sourceLen   : cardinal ) : integer; stdcall;
  Tcompress2 = function (dest        : pointer;
                         var destLen : cardinal;
                         source      : pointer;
                         sourceLen   : cardinal;
                         level       : integer  ) : integer; stdcall;
  Tuncompress = function (dest        : pointer;
                          var destLen : cardinal;
                          source      : pointer;
                          sourceLen   : cardinal ) : integer; stdcall;
  Tadler32 = function (adler       : cardinal;
                       buf         : pointer;
                       len         : cardinal ) : cardinal; stdcall;
  Tcrc32 = function (crc         : cardinal;
                     buf         : pointer;
                     len         : cardinal ) : cardinal; stdcall;
  TzError = function (err         : integer  ) : pchar;
  TinflateSyncPoint = function (strm        : z_streamp) : integer; stdcall;
  Tget_crc_table = function : pointer; stdcall;

{****************************************************************************}

function zlibVersion : pchar; stdcall;

function deflateInit          (strm        : z_streamp;
                               level       : integer  ) : integer; stdcall;

function deflate              (strm        : z_streamp;
                               flush       : integer  ) : integer; stdcall;

function deflateEnd           (strm        : z_streamp) : integer; stdcall;

function inflateInit          (strm        : z_streamp) : integer; stdcall;

function inflate              (strm        : z_streamp;
                               flush       : integer  ) : integer; stdcall;

function inflateEnd           (strm        : z_streamp) : integer; stdcall;

function deflateInit2         (strm        : z_streamp;
                               level       : integer;
                               method      : integer;
                               windowBits  : integer;
                               memLevel    : integer;
                               strategy    : integer  ) : integer; stdcall;

function deflateSetDictionary (strm        : z_streamp;
                               dictionary  : pointer;
                               dictLength  : cardinal ) : integer; stdcall;

function deflateCopy          (dest        : z_streamp;
                               source      : z_streamp) : integer; stdcall;

function deflateReset         (strm        : z_streamp) : integer; stdcall;

function deflateParams        (strm        : z_streamp;
                               level       : integer;
                               strategy    : integer  ) : integer; stdcall;

function inflateInit2         (strm        : z_streamp;
                               windowBits  : integer  ) : integer; stdcall;

function inflateSetDictionary (strm        : z_streamp;
                               dictionary  : pointer;
                               dictLength  : cardinal ) : integer; stdcall;

function inflateSync          (strm        : z_streamp) : integer; stdcall;

function inflateReset         (strm        : z_streamp) : integer; stdcall;

function compress             (dest        : pointer;
                               var destLen : cardinal;
                               source      : pointer;
                               sourceLen   : cardinal ) : integer; stdcall;

function compress2            (dest        : pointer;
                               var destLen : cardinal;
                               source      : pointer;
                               sourceLen   : cardinal;
                               level       : integer  ) : integer; stdcall;

function uncompress           (dest        : pointer;
                               var destLen : cardinal;
                               source      : pointer;
                               sourceLen   : cardinal ) : integer; stdcall;

function adler32              (adler       : cardinal;
                               buf         : pointer;
                               len         : cardinal ) : cardinal; stdcall;

function crc32                (crc         : cardinal;
                               buf         : pointer;
                               len         : cardinal ) : cardinal; stdcall;

function zError               (err         : integer  ) : pchar;

function inflateSyncPoint     (strm        : z_streamp) : integer; stdcall;

function get_crc_table : pointer; stdcall;

{****************************************************************************}

{$ENDIF} // INCLUDE_ZLIB




implementation



uses { Own Units }
     NGConst,

     { Borland Standard Units }
     Windows;


{$IFDEF LATE_BINDING}
var
  hLibmng                    : THandle;
{****************************************************************************}
  _mng_version_text          : Tmng_version_text;
  _mng_version_so            : Tmng_version_so;
  _mng_version_dll           : Tmng_version_dll;
  _mng_version_major         : Tmng_version_major;
  _mng_version_minor         : Tmng_version_minor;
  _mng_version_release       : Tmng_version_release;
{****************************************************************************}
  _mng_initialize            : Tmng_initialize;
  _mng_reset                 : Tmng_reset;
  _mng_cleanup               : Tmng_cleanup;
  _mng_read                  : Tmng_read;
  _mng_write                 : Tmng_write;
  _mng_create                : Tmng_create;
  _mng_readdisplay           : Tmng_readdisplay;
  _mng_display               : Tmng_display;
  _mng_display_resume        : Tmng_display_resume;
  _mng_display_freeze        : Tmng_display_freeze;
  _mng_display_reset         : Tmng_display_reset;
  _mng_getlasterror          : Tmng_getlasterror;
{****************************************************************************}
  _mng_setcb_memalloc        : Tmng_setcb_memalloc;
  _mng_setcb_memfree         : Tmng_setcb_memfree;
  _mng_setcb_openstream      : Tmng_setcb_openstream;
  _mng_setcb_closestream     : Tmng_setcb_closestream;
  _mng_setcb_readdata        : Tmng_setcb_readdata;
  _mng_setcb_writedata       : Tmng_setcb_writedata;
  _mng_setcb_errorproc       : Tmng_setcb_errorproc;
  _mng_setcb_processheader   : Tmng_setcb_processheader;
  _mng_setcb_processtext     : Tmng_setcb_processtext;
  _mng_setcb_getcanvasline   : Tmng_setcb_getcanvasline;
  _mng_setcb_getalphaline    : Tmng_setcb_getalphaline;
  _mng_setcb_getbkgdline     : Tmng_setcb_getbkgdline;
  _mng_setcb_refresh         : Tmng_setcb_refresh;
  _mng_setcb_gettickcount    : Tmng_setcb_gettickcount;
  _mng_setcb_settimer        : Tmng_setcb_settimer;
{****************************************************************************}
  _mng_getcb_memalloc        : Tmng_getcb_memalloc;
  _mng_getcb_memfree         : Tmng_getcb_memfree;
  _mng_getcb_openstream      : Tmng_getcb_openstream;
  _mng_getcb_closestream     : Tmng_getcb_closestream;
  _mng_getcb_readdata        : Tmng_getcb_readdata;
  _mng_getcb_writedata       : Tmng_getcb_writedata;
  _mng_getcb_errorproc       : Tmng_getcb_errorproc;
  _mng_getcb_processheader   : Tmng_getcb_processheader;
  _mng_getcb_processtext     : Tmng_getcb_processtext;
  _mng_getcb_getcanvasline   : Tmng_getcb_getcanvasline;
  _mng_getcb_getalphaline    : Tmng_getcb_getalphaline;
  _mng_getcb_getbkgdline     : Tmng_getcb_getbkgdline;
  _mng_getcb_refresh         : Tmng_getcb_refresh;
  _mng_getcb_gettickcount    : Tmng_getcb_gettickcount;
  _mng_getcb_settimer        : Tmng_getcb_settimer;
{****************************************************************************}
  _mng_set_userdata          : Tmng_set_userdata;
  _mng_set_canvasstyle       : Tmng_set_canvasstyle;
  _mng_set_bkgdstyle         : Tmng_set_bkgdstyle;
  _mng_set_bgcolor           : Tmng_set_bgcolor;
  _mng_set_usebkgd           : Tmng_set_usebkgd;
  _mng_set_storechunks       : Tmng_set_storechunks;
  _mng_set_cacheplayback     : Tmng_set_cacheplayback;
  _mng_set_viewgammaint      : Tmng_set_viewgammaint;
  _mng_set_displaygammaint   : Tmng_set_displaygammaint;
  _mng_set_dfltimggammaint   : Tmng_set_dfltimggammaint;
  _mng_set_srgb              : Tmng_set_srgb;
  _mng_set_outputprofile     : Tmng_set_outputprofile;
  _mng_set_outputprofile2    : Tmng_set_outputprofile2;
  _mng_set_outputsrgb        : Tmng_set_outputsrgb;
  _mng_set_srgbprofile       : Tmng_set_srgbprofile;
  _mng_set_srgbprofile2      : Tmng_set_srgbprofile2;
  _mng_set_srgbimplicit      : Tmng_set_srgbimplicit;
  _mng_set_maxcanvassize     : Tmng_set_maxcanvassize;
{****************************************************************************}
  _mng_get_userdata          : Tmng_get_userdata;
  _mng_get_sigtype           : Tmng_get_sigtype;
  _mng_get_imagetype         : Tmng_get_imagetype;
  _mng_get_imagewidth        : Tmng_get_imagewidth;
  _mng_get_imageheight       : Tmng_get_imageheight;
  _mng_get_ticks             : Tmng_get_ticks;
  _mng_get_framecount        : Tmng_get_framecount;
  _mng_get_layercount        : Tmng_get_layercount;
  _mng_get_playtime          : Tmng_get_playtime;
  _mng_get_simplicity        : Tmng_get_simplicity;
  _mng_get_bitdepth          : Tmng_get_bitdepth;
  _mng_get_colortype         : Tmng_get_colortype;
  _mng_get_compression       : Tmng_get_compression;
  _mng_get_filter            : Tmng_get_filter;
  _mng_get_interlace         : Tmng_get_interlace;
  _mng_get_alphabitdepth     : Tmng_get_alphabitdepth;
  _mng_get_alphacompression  : Tmng_get_alphacompression;
  _mng_get_alphafilter       : Tmng_get_alphafilter;
  _mng_get_alphainterlace    : Tmng_get_alphainterlace;
  _mng_get_bgcolor           : Tmng_get_bgcolor;
  _mng_get_usebkgd           : Tmng_get_usebkgd;
  _mng_get_viewgammaint      : Tmng_get_viewgammaint;
  _mng_get_displaygammaint   : Tmng_get_displaygammaint;
  _mng_get_dfltimggammaint   : Tmng_get_dfltimggammaint;
  _mng_get_srgb              : Tmng_get_srgb;
  _mng_get_maxcanvaswidth    : Tmng_get_maxcanvaswidth;
  _mng_get_maxcanvasheight   : Tmng_get_maxcanvasheight;
  _mng_get_starttime         : Tmng_get_starttime;
  _mng_get_runtime           : Tmng_get_runtime;
  _mng_get_currentframe      : Tmng_get_currentframe;
  _mng_get_currentlayer      : Tmng_get_currentlayer;
  _mng_get_currentplaytime   : Tmng_get_currentplaytime;
  _mng_status_error          : Tmng_status_error;
  _mng_status_reading        : Tmng_status_reading;
  _mng_status_suspendbreak   : Tmng_status_suspendbreak;
  _mng_status_creating       : Tmng_status_creating;
  _mng_status_writing        : Tmng_status_writing;
  _mng_status_displaying     : Tmng_status_displaying;
  _mng_status_running        : Tmng_status_running;
  _mng_status_timerbreak     : Tmng_status_timerbreak;
{****************************************************************************}
  _mng_putchunk_ihdr          : Tmng_putchunk_ihdr;
  _mng_putchunk_plte          : Tmng_putchunk_plte;
  _mng_putchunk_idat          : Tmng_putchunk_idat;
  _mng_putchunk_iend          : Tmng_putchunk_iend;
  _mng_putchunk_trns          : Tmng_putchunk_trns;
  _mng_putchunk_gama          : Tmng_putchunk_gama;
  _mng_putchunk_chrm          : Tmng_putchunk_chrm;
  _mng_putchunk_srgb          : Tmng_putchunk_srgb;
  _mng_putchunk_iccp          : Tmng_putchunk_iccp;
  _mng_putchunk_text          : Tmng_putchunk_text;
  _mng_putchunk_ztxt          : Tmng_putchunk_ztxt;
  _mng_putchunk_itxt          : Tmng_putchunk_itxt;
  _mng_putchunk_bkgd          : Tmng_putchunk_bkgd;
  _mng_putchunk_phys          : Tmng_putchunk_phys;
  _mng_putchunk_sbit          : Tmng_putchunk_sbit;
  _mng_putchunk_splt          : Tmng_putchunk_splt;
  _mng_putchunk_hist          : Tmng_putchunk_hist;
  _mng_putchunk_time          : Tmng_putchunk_time;
  _mng_putchunk_jhdr          : Tmng_putchunk_jhdr;
  _mng_putchunk_jdat          : Tmng_putchunk_jdat;
  _mng_putchunk_jsep          : Tmng_putchunk_jsep;

{$IFDEF INCLUDE_ZLIB}
  bZLIBLoaded: Boolean = False;
  _deflateInit_: TdeflateInit_;
  _inflateInit_: TinflateInit_;
  _deflateInit2_: TdeflateInit2_;
  _inflateInit2_: TinflateInit2_;

  _zLibVersion: TzLibVersion;
  _deflateInit: TdeflateInit;
  _deflate: Tdeflate;
  _deflateEnd: TdeflateEnd;
  _inflateInit: TinflateInit;
  _inflate: Tinflate;
  _inflateEnd: TinflateEnd;
  _deflateInit2: TdeflateInit2;
  _deflateSetDictionary: TdeflateSetDictionary;
  _deflateCopy: TdeflateCopy;
  _deflateReset: TdeflateReset;
  _deflateParams: TdeflateParams;
  _inflateInit2: TinflateInit2;
  _inflateSetDictionary: TinflateSetDictionary;
  _inflateSync: TinflateSync;
  _inflateReset: TinflateReset;
  _compress: Tcompress;
  _compress2: Tcompress2;
  _uncompress: Tuncompress;
  _adler32: Tadler32;
  _crc32: Tcrc32;
  _zError: TzError;
  _inflateSyncPoint: TinflateSyncPoint;
  _get_crc_table: Tget_crc_table;
{$ENDIF}
{$ENDIF}

{****************************************************************************}
{* LIBMNG implementation definitions                                        *}
{****************************************************************************}

{$IFNDEF LATE_BINDING}
function mng_version_text;         external mngdll;
function mng_version_so;           external mngdll;
function mng_version_dll;          external mngdll;
function mng_version_major;        external mngdll;
function mng_version_minor;        external mngdll;
function mng_version_release;      external mngdll;

{****************************************************************************}

function mng_initialize;           external mngdll;
function mng_reset;                external mngdll;
function mng_cleanup;              external mngdll;

function mng_read;                 external mngdll;
function mng_write;                external mngdll;
function mng_create;               external mngdll;

function mng_readdisplay;          external mngdll;
function mng_display;              external mngdll;
function mng_display_resume;       external mngdll;
function mng_display_freeze;       external mngdll;
function mng_display_reset;        external mngdll;

function mng_getlasterror;         external mngdll;

{****************************************************************************}

function mng_setcb_memalloc;       external mngdll;
function mng_setcb_memfree;        external mngdll;

function mng_setcb_openstream;     external mngdll;
function mng_setcb_closestream;    external mngdll;

function mng_setcb_readdata;       external mngdll;

function mng_setcb_writedata;      external mngdll;

function mng_setcb_errorproc;      external mngdll;

function mng_setcb_processheader;  external mngdll;
function mng_setcb_processtext;    external mngdll;

function mng_setcb_getcanvasline;  external mngdll;
function mng_setcb_getalphaline;   external mngdll;
function mng_setcb_getbkgdline;    external mngdll;
function mng_setcb_refresh;        external mngdll;

function mng_setcb_gettickcount;   external mngdll;
function mng_setcb_settimer;       external mngdll;

{****************************************************************************}

function mng_getcb_memalloc;       external mngdll;
function mng_getcb_memfree;        external mngdll;

function mng_getcb_openstream;     external mngdll;
function mng_getcb_closestream;    external mngdll;

function mng_getcb_readdata;       external mngdll;

function mng_getcb_writedata;      external mngdll;

function mng_getcb_errorproc;      external mngdll;

function mng_getcb_processheader;  external mngdll;
function mng_getcb_processtext;    external mngdll;

function mng_getcb_getcanvasline;  external mngdll;
function mng_getcb_getalphaline;   external mngdll;
function mng_getcb_getbkgdline;    external mngdll;
function mng_getcb_refresh;        external mngdll;

function mng_getcb_gettickcount;   external mngdll;
function mng_getcb_settimer;       external mngdll;

{****************************************************************************}

function mng_set_userdata;         external mngdll;

function mng_set_canvasstyle;      external mngdll;
function mng_set_bkgdstyle;        external mngdll;

function mng_set_bgcolor;          external mngdll;
function mng_set_usebkgd;          external mngdll;

function mng_set_storechunks;      external mngdll;
function mng_set_cacheplayback;    external mngdll;

function mng_set_viewgammaint;     external mngdll;
function mng_set_displaygammaint;  external mngdll;
function mng_set_dfltimggammaint;  external mngdll;

function mng_set_srgb;             external mngdll;
function mng_set_outputprofile;    external mngdll;
function mng_set_outputprofile2;   external mngdll;
function mng_set_outputsrgb;       external mngdll;
function mng_set_srgbprofile;      external mngdll;
function mng_set_srgbprofile2;     external mngdll;
function mng_set_srgbimplicit;     external mngdll;

function mng_set_maxcanvassize;    external mngdll;

{****************************************************************************}

function  mng_get_userdata;        external mngdll;

function  mng_get_sigtype;         external mngdll;
function  mng_get_imagetype;       external mngdll;
function  mng_get_imagewidth;      external mngdll;
function  mng_get_imageheight;     external mngdll;
function  mng_get_ticks;           external mngdll;
function  mng_get_framecount;      external mngdll;
function  mng_get_layercount;      external mngdll;
function  mng_get_playtime;        external mngdll;
function  mng_get_simplicity;      external mngdll;

function  mng_get_bitdepth;        external mngdll;
function  mng_get_colortype;       external mngdll;
function  mng_get_compression;     external mngdll;
function  mng_get_filter;          external mngdll;
function  mng_get_interlace;       external mngdll;
function  mng_get_alphabitdepth;   external mngdll;
function  mng_get_alphacompression;external mngdll;
function  mng_get_alphafilter;     external mngdll;
function  mng_get_alphainterlace;  external mngdll;

procedure mng_get_bgcolor;         external mngdll;
function  mng_get_usebkgd;         external mngdll;

function  mng_get_viewgammaint;    external mngdll;
function  mng_get_displaygammaint; external mngdll;
function  mng_get_dfltimggammaint; external mngdll;

function  mng_get_srgb;            external mngdll;

function  mng_get_maxcanvaswidth;  external mngdll;
function  mng_get_maxcanvasheight; external mngdll;

function  mng_get_starttime;       external mngdll;
function  mng_get_runtime;         external mngdll;
function  mng_get_currentframe;    external mngdll;
function  mng_get_currentlayer;    external mngdll;
function  mng_get_currentplaytime; external mngdll;

function  mng_status_error;        external mngdll;
function  mng_status_reading;      external mngdll;
function  mng_status_suspendbreak; external mngdll;

function  mng_status_creating;     external mngdll;
function  mng_status_writing;      external mngdll;
function  mng_status_displaying;   external mngdll;
function  mng_status_running;      external mngdll;
function  mng_status_timerbreak;   external mngdll;

{****************************************************************************}

function  mng_putchunk_ihdr;       external mngdll;
function  mng_putchunk_plte;       external mngdll;
function  mng_putchunk_idat;       external mngdll;
function  mng_putchunk_iend;       external mngdll;
function  mng_putchunk_trns;       external mngdll;
function  mng_putchunk_gama;       external mngdll;
function  mng_putchunk_chrm;       external mngdll;
function  mng_putchunk_srgb;       external mngdll;
function  mng_putchunk_iccp;       external mngdll;
function  mng_putchunk_text;       external mngdll;
function  mng_putchunk_ztxt;       external mngdll;
function  mng_putchunk_itxt;       external mngdll;
function  mng_putchunk_bkgd;       external mngdll;
function  mng_putchunk_phys;       external mngdll;
function  mng_putchunk_sbit;       external mngdll;
function  mng_putchunk_splt;       external mngdll;
function  mng_putchunk_hist;       external mngdll;
function  mng_putchunk_time;       external mngdll;

function  mng_putchunk_jhdr;       external mngdll;
function  mng_putchunk_jdat;       external mngdll;
function  mng_putchunk_jsep;       external mngdll;


{$ELSE}        // IFNDEF LATE_BINDING


{****************************************************************************}
{ Do the Late Binding Thing instead }
function CheckLIBMNGLoaded: Boolean;
begin
  if (hLibmng = 0) then begin
     hLibmng:= LoadLibrary(mngdll);
     if (hLibmng < HINSTANCE_ERROR) then begin
       hLibmng:= 0;
       Result:= False;
       Exit;
     end;

     (* TODO:  REMOVE
     @_EnumProcesses := GetProcAddress(hPSAPI, 'EnumProcesses');
     @_EnumProcessModules := GetProcAddress(hPSAPI, 'EnumProcessModules');
     {procedure}@_GetModuleBaseNameA := GetProcAddress(hPSAPI, 'GetModuleBaseNameA');*)

     {****************************************************************************}
     {Functions without a preceeding marker.  Procedures prefixed with the following: }
     {procedure}
     {****************************************************************************}
     @_mng_version_text         := GetProcAddress(hLibmng, 'mng_version_text');
     @_mng_version_so           := GetProcAddress(hLibmng, 'mng_version_so');
     @_mng_version_dll          := GetProcAddress(hLibmng, 'mng_version_dll');
     @_mng_version_major        := GetProcAddress(hLibmng, 'mng_version_major');
     @_mng_version_minor        := GetProcAddress(hLibmng, 'mng_version_minor');
     @_mng_version_release      := GetProcAddress(hLibmng, 'mng_version_release');
   {****************************************************************************}
     @_mng_initialize           := GetProcAddress(hLibmng, 'mng_initialize');
     @_mng_reset                := GetProcAddress(hLibmng, 'mng_reset');
     @_mng_cleanup              := GetProcAddress(hLibmng, 'mng_cleanup');
     @_mng_read                 := GetProcAddress(hLibmng, 'mng_read');
     @_mng_write                := GetProcAddress(hLibmng, 'mng_write');
     @_mng_create               := GetProcAddress(hLibmng, 'mng_create');
     @_mng_readdisplay          := GetProcAddress(hLibmng, 'mng_readdisplay');
     @_mng_display              := GetProcAddress(hLibmng, 'mng_display');
     @_mng_display_resume       := GetProcAddress(hLibmng, 'mng_display_resume');
     @_mng_display_freeze       := GetProcAddress(hLibmng, 'mng_display_freeze');
     @_mng_display_reset        := GetProcAddress(hLibmng, 'mng_display_reset');
     @_mng_getlasterror         := GetProcAddress(hLibmng, 'mng_getlasterror');
   {****************************************************************************}
     @_mng_setcb_memalloc       := GetProcAddress(hLibmng, 'mng_setcb_memalloc');
     @_mng_setcb_memfree        := GetProcAddress(hLibmng, 'mng_setcb_memfree');
     @_mng_setcb_openstream     := GetProcAddress(hLibmng, 'mng_setcb_openstream');
     @_mng_setcb_closestream    := GetProcAddress(hLibmng, 'mng_setcb_closestream');
     @_mng_setcb_readdata       := GetProcAddress(hLibmng, 'mng_setcb_readdata');
     @_mng_setcb_writedata      := GetProcAddress(hLibmng, 'mng_setcb_writedata');
     @_mng_setcb_errorproc      := GetProcAddress(hLibmng, 'mng_setcb_errorproc');
     @_mng_setcb_processheader  := GetProcAddress(hLibmng, 'mng_setcb_processheader');
     @_mng_setcb_processtext    := GetProcAddress(hLibmng, 'mng_setcb_processtext');
     @_mng_setcb_getcanvasline  := GetProcAddress(hLibmng, 'mng_setcb_getcanvasline');
     @_mng_setcb_getalphaline   := GetProcAddress(hLibmng, 'mng_setcb_getalphaline');
     @_mng_setcb_getbkgdline    := GetProcAddress(hLibmng, 'mng_setcb_getbkgdline');
     @_mng_setcb_refresh        := GetProcAddress(hLibmng, 'mng_setcb_refresh');
     @_mng_setcb_gettickcount   := GetProcAddress(hLibmng, 'mng_setcb_gettickcount');
     @_mng_setcb_settimer       := GetProcAddress(hLibmng, 'mng_setcb_settimer');
   {****************************************************************************}
     @_mng_getcb_memalloc       := GetProcAddress(hLibmng, 'mng_getcb_memalloc');
     @_mng_getcb_memfree        := GetProcAddress(hLibmng, 'mng_getcb_memfree');
     @_mng_getcb_openstream     := GetProcAddress(hLibmng, 'mng_getcb_openstream');
     @_mng_getcb_closestream    := GetProcAddress(hLibmng, 'mng_getcb_closestream');
     @_mng_getcb_readdata       := GetProcAddress(hLibmng, 'mng_getcb_readdata');
     @_mng_getcb_writedata      := GetProcAddress(hLibmng, 'mng_getcb_writedata');
     @_mng_getcb_errorproc      := GetProcAddress(hLibmng, 'mng_getcb_errorproc');
     @_mng_getcb_processheader  := GetProcAddress(hLibmng, 'mng_getcb_processheader');
     @_mng_getcb_processtext    := GetProcAddress(hLibmng, 'mng_getcb_processtext');
     @_mng_getcb_getcanvasline  := GetProcAddress(hLibmng, 'mng_getcb_getcanvasline');
     @_mng_getcb_getalphaline   := GetProcAddress(hLibmng, 'mng_getcb_getalphaline');
     @_mng_getcb_getbkgdline    := GetProcAddress(hLibmng, 'mng_getcb_getbkgdline');
     @_mng_getcb_refresh        := GetProcAddress(hLibmng, 'mng_getcb_refresh');
     @_mng_getcb_gettickcount   := GetProcAddress(hLibmng, 'mng_getcb_gettickcount');
     @_mng_getcb_settimer       := GetProcAddress(hLibmng, 'mng_getcb_settimer');
   {****************************************************************************}
     @_mng_set_userdata         := GetProcAddress(hLibmng, 'mng_set_userdata');
     @_mng_set_canvasstyle      := GetProcAddress(hLibmng, 'mng_set_canvasstyle');
     @_mng_set_bkgdstyle        := GetProcAddress(hLibmng, 'mng_set_bkgdstyle');
     @_mng_set_bgcolor          := GetProcAddress(hLibmng, 'mng_set_bgcolor');
     @_mng_set_usebkgd          := GetProcAddress(hLibmng, 'mng_set_usebkgd');
     @_mng_set_storechunks      := GetProcAddress(hLibmng, 'mng_set_storechunks');
     @_mng_set_cacheplayback    := GetProcAddress(hLibmng, 'mng_set_cacheplayback');
     @_mng_set_viewgammaint     := GetProcAddress(hLibmng, 'mng_set_viewgammaint');
     @_mng_set_displaygammaint  := GetProcAddress(hLibmng, 'mng_set_displaygammaint');
     @_mng_set_dfltimggammaint  := GetProcAddress(hLibmng, 'mng_set_dfltimggammaint');
     @_mng_set_srgb             := GetProcAddress(hLibmng, 'mng_set_srgb');
     @_mng_set_outputprofile    := GetProcAddress(hLibmng, 'mng_set_outputprofile');
     @_mng_set_outputprofile2   := GetProcAddress(hLibmng, 'mng_set_outputprofile2');
     @_mng_set_outputsrgb       := GetProcAddress(hLibmng, 'mng_set_outputsrgb');
     @_mng_set_srgbprofile      := GetProcAddress(hLibmng, 'mng_set_srgbprofile');
     @_mng_set_srgbprofile2     := GetProcAddress(hLibmng, 'mng_set_srgbprofile2');
     @_mng_set_srgbimplicit     := GetProcAddress(hLibmng, 'mng_set_srgbimplicit');
     @_mng_set_maxcanvassize    := GetProcAddress(hLibmng, 'mng_set_maxcanvassize');
   {****************************************************************************}
     @_mng_get_userdata         := GetProcAddress(hLibmng, 'mng_get_userdata');
     @_mng_get_sigtype          := GetProcAddress(hLibmng, 'mng_get_sigtype');
     @_mng_get_imagetype        := GetProcAddress(hLibmng, 'mng_get_imagetype');
     @_mng_get_imagewidth       := GetProcAddress(hLibmng, 'mng_get_imagewidth');
     @_mng_get_imageheight      := GetProcAddress(hLibmng, 'mng_get_imageheight');
     @_mng_get_ticks            := GetProcAddress(hLibmng, 'mng_get_ticks');
     @_mng_get_framecount       := GetProcAddress(hLibmng, 'mng_get_framecount');
     @_mng_get_layercount       := GetProcAddress(hLibmng, 'mng_get_layercount');
     @_mng_get_playtime         := GetProcAddress(hLibmng, 'mng_get_playtime');
     @_mng_get_simplicity       := GetProcAddress(hLibmng, 'mng_get_simplicity');
     @_mng_get_bitdepth         := GetProcAddress(hLibmng, 'mng_get_bitdepth');
     @_mng_get_colortype        := GetProcAddress(hLibmng, 'mng_get_colortype');
     @_mng_get_compression      := GetProcAddress(hLibmng, 'mng_get_compression');
     @_mng_get_filter           := GetProcAddress(hLibmng, 'mng_get_filter');
     @_mng_get_interlace        := GetProcAddress(hLibmng, 'mng_get_interlace');
     @_mng_get_alphabitdepth    := GetProcAddress(hLibmng, 'mng_get_alphabitdepth');
     @_mng_get_alphacompression := GetProcAddress(hLibmng, 'mng_get_alphacompression');
     @_mng_get_alphafilter      := GetProcAddress(hLibmng, 'mng_get_alphafilter');
     @_mng_get_alphainterlace   := GetProcAddress(hLibmng, 'mng_get_alphainterlace');
     @_mng_get_bgcolor          := GetProcAddress(hLibmng, 'mng_get_bgcolor');
     @_mng_get_usebkgd          := GetProcAddress(hLibmng, 'mng_get_usebkgd');
     @_mng_get_viewgammaint     := GetProcAddress(hLibmng, 'mng_get_viewgammaint');
     @_mng_get_displaygammaint  := GetProcAddress(hLibmng, 'mng_get_displaygammaint');
     @_mng_get_dfltimggammaint  := GetProcAddress(hLibmng, 'mng_get_dfltimggammaint');
     @_mng_get_srgb             := GetProcAddress(hLibmng, 'mng_get_srgb');
     @_mng_get_maxcanvaswidth   := GetProcAddress(hLibmng, 'mng_get_maxcanvaswidth');
     @_mng_get_maxcanvasheight  := GetProcAddress(hLibmng, 'mng_get_maxcanvasheight');
     @_mng_get_starttime        := GetProcAddress(hLibmng, 'mng_get_starttime');
     @_mng_get_runtime          := GetProcAddress(hLibmng, 'mng_get_runtime');
     @_mng_get_currentframe     := GetProcAddress(hLibmng, 'mng_get_currentframe');
     @_mng_get_currentlayer     := GetProcAddress(hLibmng, 'mng_get_currentlayer');
     @_mng_get_currentplaytime  := GetProcAddress(hLibmng, 'mng_get_currentplaytime');
     @_mng_status_error         := GetProcAddress(hLibmng, 'mng_status_error');
     @_mng_status_reading       := GetProcAddress(hLibmng, 'mng_status_reading');
     @_mng_status_suspendbreak  := GetProcAddress(hLibmng, 'mng_status_suspendbreak');
     @_mng_status_creating      := GetProcAddress(hLibmng, 'mng_status_creating');
     @_mng_status_writing       := GetProcAddress(hLibmng, 'mng_status_writing');
     @_mng_status_displaying    := GetProcAddress(hLibmng, 'mng_status_displaying');
     @_mng_status_running       := GetProcAddress(hLibmng, 'mng_status_running');
     @_mng_status_timerbreak    := GetProcAddress(hLibmng, 'mng_status_timerbreak');
   {****************************************************************************}
     @_mng_putchunk_ihdr        := GetProcAddress(hLibmng, 'mng_putchunk_ihdr');
     @_mng_putchunk_plte        := GetProcAddress(hLibmng, 'mng_putchunk_plte');
     @_mng_putchunk_idat        := GetProcAddress(hLibmng, 'mng_putchunk_idat');
     @_mng_putchunk_iend        := GetProcAddress(hLibmng, 'mng_putchunk_iend');
     @_mng_putchunk_trns        := GetProcAddress(hLibmng, 'mng_putchunk_trns');
     @_mng_putchunk_gama        := GetProcAddress(hLibmng, 'mng_putchunk_gama');
     @_mng_putchunk_chrm        := GetProcAddress(hLibmng, 'mng_putchunk_chrm');
     @_mng_putchunk_srgb        := GetProcAddress(hLibmng, 'mng_putchunk_srgb');
     @_mng_putchunk_iccp        := GetProcAddress(hLibmng, 'mng_putchunk_iccp');
     @_mng_putchunk_text        := GetProcAddress(hLibmng, 'mng_putchunk_text');
     @_mng_putchunk_ztxt        := GetProcAddress(hLibmng, 'mng_putchunk_ztxt');
     @_mng_putchunk_itxt        := GetProcAddress(hLibmng, 'mng_putchunk_itxt');
     @_mng_putchunk_bkgd        := GetProcAddress(hLibmng, 'mng_putchunk_bkgd');
     @_mng_putchunk_phys        := GetProcAddress(hLibmng, 'mng_putchunk_phys');
     @_mng_putchunk_sbit        := GetProcAddress(hLibmng, 'mng_putchunk_sbit');
     @_mng_putchunk_splt        := GetProcAddress(hLibmng, 'mng_putchunk_splt');
     @_mng_putchunk_hist        := GetProcAddress(hLibmng, 'mng_putchunk_hist');
     @_mng_putchunk_time        := GetProcAddress(hLibmng, 'mng_putchunk_time');
     @_mng_putchunk_jhdr        := GetProcAddress(hLibmng, 'mng_putchunk_jhdr');
     @_mng_putchunk_jdat        := GetProcAddress(hLibmng, 'mng_putchunk_jdat');
     @_mng_putchunk_jsep        := GetProcAddress(hLibmng, 'mng_putchunk_jsep');
  end;

  Result:= True;
end;

{****************************************************************************}
function mng_version_text: mng_pchar;
begin
  if not assigned(_mng_version_text) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_version_text;
end;

function mng_version_so: mng_uint8;
begin
  if not assigned(_mng_version_so) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_version_so;
end;

function mng_version_dll: mng_uint8;
begin
  if not assigned(_mng_version_dll) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_version_dll;
end;

function mng_version_major: mng_uint8;
begin
  if not assigned(_mng_version_major) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_version_major;
end;

function mng_version_minor: mng_uint8;
begin
  if not assigned(_mng_version_minor) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_version_minor;
end;

function mng_version_release: mng_uint8;
begin
  if not assigned(_mng_version_release) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_version_release;
end;

{****************************************************************************}

function mng_initialize;
begin
  if CheckLIBMNGLoaded then
    Result:= _mng_initialize(pUserdata, fMemalloc, fMemfree, fTraceproc)
  else Result:= MNG_NULL;
end;

function mng_reset;
begin
  if not assigned(_mng_reset) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_reset(hHandle);
end;

function mng_cleanup;
begin
  if not assigned(_mng_cleanup) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_cleanup(hHandle);
end;

function mng_read;
begin
  if not assigned(_mng_read) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_read(hHandle);
end;

function mng_write;
begin
  if not assigned(_mng_write) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_write(hHandle);
end;

function mng_create;
begin
  if not assigned(_mng_create) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_create(hHandle);
end;

function mng_readdisplay;
begin
  if not assigned(_mng_readdisplay) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_readdisplay(hHandle);
end;

function mng_display;
begin
  if not assigned(_mng_display) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_display(hHandle);
end;

function mng_display_resume;
begin
  if not assigned(_mng_display_resume) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_display_resume(hHandle);
end;

function mng_display_freeze;
begin
  if not assigned(_mng_display_freeze) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_display_freeze(hHandle);
end;

function mng_display_reset;
begin
  if not assigned(_mng_display_reset) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_display_reset(hHandle);
end;

function mng_getlasterror;
begin
  if not assigned(_mng_getlasterror) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_getlasterror(hHandle, iSeverity, iChunkname, iChunkseq,
                                      iExtra1, iExtra2, zErrortext);
end;

{****************************************************************************}

function mng_setcb_memalloc;
begin
  if not assigned(_mng_setcb_memalloc) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_setcb_memalloc(hHandle, fProc);
end;

function mng_setcb_memfree;
begin
  if not assigned(_mng_setcb_memfree) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_setcb_memfree(hHandle, fProc);
end;

function mng_setcb_openstream;
begin
  if not assigned(_mng_setcb_openstream) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_setcb_openstream(hHandle, fProc);
end;

function mng_setcb_closestream;
begin
  if not assigned(_mng_setcb_closestream) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_setcb_closestream(hHandle, fProc);
end;

function mng_setcb_readdata;
begin
  if not assigned(_mng_setcb_readdata) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_setcb_readdata(hHandle, fProc);
end;

function mng_setcb_writedata;
begin
  if not assigned(_mng_setcb_writedata) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_setcb_writedata(hHandle, fProc);
end;

function mng_setcb_errorproc;
begin
  if not assigned(_mng_setcb_errorproc) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_setcb_errorproc(hHandle, fProc);
end;

function mng_setcb_processheader;
begin
  if not assigned(_mng_setcb_processheader) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_setcb_processheader(hHandle, fProc);
end;

function mng_setcb_processtext;
begin
  if not assigned(_mng_setcb_processtext) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_setcb_processtext(hHandle, fProc);
end;

function  mng_setcb_getcanvasline;
begin
  if not assigned(_mng_setcb_getcanvasline) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_setcb_getcanvasline(hHandle, fProc);
end;

function  mng_setcb_getalphaline;
begin
  if not assigned(_mng_setcb_getalphaline) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_setcb_getalphaline(hHandle, fProc);
end;

function  mng_setcb_getbkgdline;
begin
  if not assigned(_mng_setcb_getbkgdline) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_setcb_getbkgdline(hHandle, fProc);
end;

function  mng_setcb_refresh;
begin
  if not assigned(_mng_setcb_refresh) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_setcb_refresh(hHandle, fProc);
end;

function  mng_setcb_gettickcount;
begin
  if not assigned(_mng_setcb_gettickcount) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_setcb_gettickcount(hHandle, fProc);
end;

function  mng_setcb_settimer;
begin
  if not assigned(_mng_setcb_settimer) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_setcb_settimer(hHandle, fProc);
end;

{****************************************************************************}

function  mng_getcb_memalloc;
begin
  if not assigned(_mng_getcb_memalloc) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_getcb_memalloc(hHandle);
end;

function  mng_getcb_memfree;
begin
  if not assigned(_mng_getcb_memfree) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_getcb_memfree(hHandle);
end;

function  mng_getcb_openstream;
begin
  if not assigned(_mng_getcb_openstream) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_getcb_openstream(hHandle);
end;

function  mng_getcb_closestream;
begin
  if not assigned(_mng_getcb_closestream) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_getcb_closestream(hHandle);
end;

function  mng_getcb_readdata;
begin
  if not assigned(_mng_getcb_readdata) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_getcb_readdata(hHandle);
end;

function  mng_getcb_writedata;
begin
  if not assigned(_mng_getcb_writedata) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_getcb_writedata(hHandle);
end;

function  mng_getcb_errorproc;
begin
  if not assigned(_mng_getcb_errorproc) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_getcb_errorproc(hHandle);
end;

function  mng_getcb_processheader;
begin
  if not assigned(_mng_getcb_processheader) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_getcb_processheader(hHandle);
end;

function  mng_getcb_processtext;
begin
  if not assigned(_mng_getcb_processtext) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_getcb_processtext(hHandle);
end;

function  mng_getcb_getcanvasline;
begin
  if not assigned(_mng_getcb_getcanvasline) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_getcb_getcanvasline(hHandle);
end;

function  mng_getcb_getalphaline;
begin
  if not assigned(_mng_getcb_getalphaline) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_getcb_getalphaline(hHandle);
end;

function  mng_getcb_getbkgdline;
begin
  if not assigned(_mng_getcb_getbkgdline) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_getcb_getbkgdline(hHandle);
end;

function  mng_getcb_refresh;
begin
  if not assigned(_mng_getcb_refresh) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_getcb_refresh(hHandle);
end;

function  mng_getcb_gettickcount;
begin
  if not assigned(_mng_getcb_gettickcount) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_getcb_gettickcount(hHandle);
end;

function  mng_getcb_settimer;
begin
  if not assigned(_mng_getcb_settimer) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_getcb_settimer(hHandle);
end;

{****************************************************************************}

function  mng_set_userdata;
begin
  if not assigned(_mng_set_userdata) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_set_userdata(hHandle, pUserdata);
end;

function  mng_set_canvasstyle;
begin
  if not assigned(_mng_set_canvasstyle) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_set_canvasstyle(hHandle, iStyle);
end;

function  mng_set_bkgdstyle;
begin
  if not assigned(_mng_set_bkgdstyle) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_set_bkgdstyle(hHandle, iStyle);
end;

function  mng_set_bgcolor;
begin
  if not assigned(_mng_set_bgcolor) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_set_bgcolor(hHandle, iRed, iGreen, iBlue);
end;

function  mng_set_usebkgd;
begin
  if not assigned(_mng_set_usebkgd) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_set_usebkgd(hHandle, bUseBKGD);
end;

function  mng_set_storechunks;
begin
  if not assigned(_mng_set_storechunks) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_set_storechunks(hHandle, bStorechunks);
end;

function  mng_set_cacheplayback;
begin
  if not assigned(_mng_set_cacheplayback) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_set_cacheplayback(hHandle, bCacheplayback);
end;

function  mng_set_viewgammaint;
begin
  if not assigned(_mng_set_viewgammaint) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_set_viewgammaint(hHandle, iGamma);
end;

function  mng_set_displaygammaint;
begin
  if not assigned(_mng_set_displaygammaint) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_set_displaygammaint(hHandle, iGamma);
end;

function  mng_set_dfltimggammaint;
begin
  if not assigned(_mng_set_dfltimggammaint) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_set_dfltimggammaint(hHandle, iGamma);
end;

function  mng_set_srgb;
begin
  if not assigned(_mng_set_srgb) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_set_srgb(hHandle, bIssRGB);
end;

function  mng_set_outputprofile;
begin
  if not assigned(_mng_set_outputprofile) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_set_outputprofile(hHandle, zFilename);
end;

function  mng_set_outputprofile2;
begin
  if not assigned(_mng_set_outputprofile2) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_set_outputprofile2(hHandle, iProfilesize, pProfile);
end;

function  mng_set_outputsrgb;
begin
  if not assigned(_mng_set_outputsrgb) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_set_outputsrgb(hHandle);
end;

function  mng_set_srgbprofile;
begin
  if not assigned(_mng_set_srgbprofile) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_set_srgbprofile(hHandle, zFilename);
end;

function  mng_set_srgbprofile2;
begin
  if not assigned(_mng_set_outputprofile2) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_set_outputprofile2(hHandle, iProfilesize, pProfile);
end;

function  mng_set_srgbimplicit;
begin
  if not assigned(_mng_set_srgbimplicit) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_set_srgbimplicit(hHandle);
end;

function  mng_set_maxcanvassize;
begin
  if not assigned(_mng_set_maxcanvassize) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_set_maxcanvassize(hHandle, iMaxwidth, iMaxheight);
end;

{****************************************************************************}

function  mng_get_userdata;
begin
  if not assigned(_mng_get_userdata) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_userdata(hHandle);
end;

function  mng_get_sigtype;
begin
  if not assigned(_mng_get_sigtype) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_sigtype(hHandle);
end;

function  mng_get_imagetype;
begin
  if not assigned(_mng_get_imagetype) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_imagetype(hHandle);
end;

function  mng_get_imagewidth;
begin
  if not assigned(_mng_get_imagewidth) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_imagewidth(hHandle);
end;

function  mng_get_imageheight;
begin
  if not assigned(_mng_get_imageheight) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_imageheight(hHandle);
end;

function  mng_get_ticks;
begin
  if not assigned(_mng_get_ticks) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_ticks(hHandle);
end;

function  mng_get_framecount;
begin
  if not assigned(_mng_get_framecount) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_framecount(hHandle);
end;

function  mng_get_layercount;
begin
  if not assigned(_mng_get_layercount) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_layercount(hHandle);
end;

function  mng_get_playtime;
begin
  if not assigned(_mng_get_playtime) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_playtime(hHandle);
end;

function  mng_get_simplicity;
begin
  if not assigned(_mng_get_simplicity) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_simplicity(hHandle);
end;

function  mng_get_bitdepth;
begin
  if not assigned(_mng_get_bitdepth) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_bitdepth(hHandle);
end;

function  mng_get_colortype;
begin
  if not assigned(_mng_get_colortype) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_colortype(hHandle);
end;

function  mng_get_compression;
begin
  if not assigned(_mng_get_compression) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_compression(hHandle);
end;

function  mng_get_filter;
begin
  if not assigned(_mng_get_filter) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_filter(hHandle);
end;

function  mng_get_interlace;
begin
  if not assigned(_mng_get_interlace) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_interlace(hHandle);
end;

function  mng_get_alphabitdepth;
begin
  if not assigned(_mng_get_alphabitdepth) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_alphabitdepth(hHandle);
end;

function  mng_get_alphacompression;
begin
  if not assigned(_mng_get_alphacompression) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_alphacompression(hHandle);
end;

function  mng_get_alphafilter;
begin
  if not assigned(_mng_get_alphafilter) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_alphafilter(hHandle);
end;

function  mng_get_alphainterlace;
begin
  if not assigned(_mng_get_alphainterlace) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_alphainterlace(hHandle);
end;

procedure mng_get_bgcolor;
begin
  if not assigned(_mng_get_bgcolor) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  _mng_get_bgcolor(hHandle, iRed, iGreen, iBlue);
end;

function  mng_get_usebkgd;
begin
  if not assigned(_mng_get_usebkgd) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_usebkgd(hHandle);
end;

function  mng_get_viewgammaint;
begin
  if not assigned(_mng_get_viewgammaint) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_viewgammaint(hHandle);
end;

function  mng_get_displaygammaint;
begin
  if not assigned(_mng_get_displaygammaint) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_displaygammaint(hHandle);
end;

function  mng_get_dfltimggammaint;
begin
  if not assigned(_mng_get_dfltimggammaint) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_dfltimggammaint(hHandle);
end;

function  mng_get_srgb;
begin
  if not assigned(_mng_get_srgb) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_srgb(hHandle);
end;

function  mng_get_maxcanvaswidth;
begin
  if not assigned(_mng_get_maxcanvaswidth) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_maxcanvaswidth(hHandle);
end;

function  mng_get_maxcanvasheight;
begin
  if not assigned(_mng_get_maxcanvasheight) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_maxcanvasheight(hHandle);
end;

function  mng_get_starttime;
begin
  if not assigned(_mng_get_starttime) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_starttime(hHandle);
end;

function  mng_get_runtime;
begin
  if not assigned(_mng_get_runtime) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_runtime(hHandle);
end;

function  mng_get_currentframe;
begin
  if not assigned(_mng_get_currentframe) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_currentframe(hHandle);
end;

function  mng_get_currentlayer;
begin
  if not assigned(_mng_get_currentlayer) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_currentlayer(hHandle);
end;

function  mng_get_currentplaytime;
begin
  if not assigned(_mng_get_currentplaytime) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_get_currentplaytime(hHandle);
end;

function  mng_status_error;
begin
  if not assigned(_mng_status_error) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_status_error(hHandle);
end;

function  mng_status_reading;
begin
  if not assigned(_mng_status_reading) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_status_reading(hHandle);
end;

function  mng_status_suspendbreak;
begin
  if not assigned(_mng_status_suspendbreak) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_status_suspendbreak(hHandle);
end;

function  mng_status_creating;
begin
  if not assigned(_mng_status_creating) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_status_creating(hHandle);
end;

function  mng_status_writing;
begin
  if not assigned(_mng_status_writing) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_status_writing(hHandle);
end;

function  mng_status_displaying;
begin
  if not assigned(_mng_status_displaying) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_status_displaying(hHandle);
end;

function  mng_status_running;
begin
  if not assigned(_mng_status_running) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_status_running(hHandle);
end;

function  mng_status_timerbreak;
begin
  if not assigned(_mng_status_timerbreak) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_status_timerbreak(hHandle);
end;

{****************************************************************************}
function  mng_putchunk_ihdr;
begin
  if not assigned(_mng_putchunk_ihdr) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_putchunk_ihdr(hHandle, iWidth, iHeight, iBitdepth, iColortype,
                                       iCompression, iFilter, iInterlace);
end;

function  mng_putchunk_plte;
begin
  if not assigned(_mng_putchunk_plte) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_putchunk_plte(hHandle, iCount, aPalette);
end;

function  mng_putchunk_idat;
begin
  if not assigned(_mng_putchunk_idat) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_putchunk_idat(hHandle, iRawlen, pRawdata);
end;

function  mng_putchunk_iend;
begin
  if not assigned(_mng_putchunk_iend) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_putchunk_iend(hHandle);
end;

function  mng_putchunk_trns;
begin
  if not assigned(_mng_putchunk_trns) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_putchunk_trns(hHandle, bEmpty, bGlobal, iType, iCount, aAlphas,
                                       iGray, iRed, iGreen, iBlue, iRawlen, aRawdata);
end;

function  mng_putchunk_gama;
begin
  if not assigned(_mng_putchunk_gama) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_putchunk_gama(hHandle, bEmpty, iGamma);
end;

function  mng_putchunk_chrm;
begin
  if not assigned(_mng_putchunk_chrm) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_putchunk_chrm(hHandle, bEmpty, iWhitepointx, iWhitepointy,
                                       iRedx, iRedy, iGreenx, iGreeny, iBluex, iBluey);
end;

function  mng_putchunk_srgb;
begin
  if not assigned(_mng_putchunk_srgb) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_putchunk_srgb(hHandle, bEmpty, iRenderingintent);
end;

function  mng_putchunk_iccp;
begin
  if not assigned(_mng_putchunk_iccp) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_putchunk_iccp(hHandle, bEmpty, iNamesize, zName,
                                       iCompression, iProfilesize, pProfile);
end;

function  mng_putchunk_text;
begin
  if not assigned(_mng_putchunk_text) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_putchunk_text(hHandle, iKeywordsize, zKeyword, iTextsize, zText);
end;

function  mng_putchunk_ztxt;
begin
  if not assigned(_mng_putchunk_ztxt) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_putchunk_ztxt(hHandle, iKeywordsize, zKeyword, iCompression, iTextsize, zText);
end;

function  mng_putchunk_itxt;
begin
  if not assigned(_mng_putchunk_itxt) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_putchunk_itxt(hHandle, iKeywordsize, zKeyword, iCompressionflag,
                                       iCompressionmethod, iLanguagesize, zLanguage,
                                       iTranslationsize, zTranslation, iTextsize, zText);
end;

function  mng_putchunk_bkgd;
begin
  if not assigned(_mng_putchunk_bkgd) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_putchunk_bkgd(hHandle, bEmpty, iType, iIndex, iGray, iRed, iGray, iBlue);
end;

function  mng_putchunk_phys;
begin
  if not assigned(_mng_putchunk_phys) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_putchunk_phys(hHandle, bEmpty, iSizex, iSizey, iUnit);
end;

function  mng_putchunk_sbit;
begin
  if not assigned(_mng_putchunk_sbit) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_putchunk_sbit(hHandle, bEmpty, iType, aBits);
end;

function  mng_putchunk_splt;
begin
  if not assigned(_mng_putchunk_splt) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_putchunk_splt(hHandle, bEmpty, iNamesize, zName,
                                       iSampledepth, iEntrycount, pEntries);
end;

function  mng_putchunk_hist;
begin
  if not assigned(_mng_putchunk_hist) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_putchunk_hist(hHandle, iEntrycount, aEntries);
end;

function  mng_putchunk_time;
begin
  if not assigned(_mng_putchunk_time) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_putchunk_time(hHandle, iYear, iMonth, iDay, iHour, iMinute, iSecond);
end;

function  mng_putchunk_jhdr;
begin
  if not assigned(_mng_putchunk_jhdr) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_putchunk_jhdr(hHandle, iWidth, iHeight, iColortype, iImagesampledepth,
                                       iImagecompression, iImageinterlace, iAlphasampledepth,
                                       iAlphacompression, iAlphafilter, iAlphainterlace)
end;

function  mng_putchunk_jdat;
begin
  if not assigned(_mng_putchunk_jdat) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_putchunk_jdat(hHandle, iRawlen, pRawdata);
end;

function  mng_putchunk_jsep;
begin
  if not assigned(_mng_putchunk_jsep) then
    raise ENGDLLNotLoaded.Create(SCDLLNotLoaded);
  Result:= _mng_putchunk_jsep(hHandle);
end;


{$ENDIF} //IFNDEF LATE_BINDING


{****************************************************************************}
{* LIBMNG implementation definitions for ZLIB                               *}
{****************************************************************************}

{$IFDEF INCLUDE_ZLIB}

{$IFNDEF LATE_BINDING}
{****************************************************************************}

function deflateInit_  (strm        : z_streamp;
                        level       : integer;
                        version     : pchar;
                        stream_size : integer) : integer; stdcall; external mngdll;

function inflateInit_  (strm        : z_streamp;
                        version     : pchar;
                        stream_size : integer) : integer; stdcall; external mngdll;

function deflateInit2_ (strm        : z_streamp;
                        level       : integer;
                        method      : integer;
                        windowBits  : integer;
                        memLevel    : integer;
                        strategy    : integer;
                        version     : pchar;
                        stream_size : integer) : integer; stdcall; external mngdll;

function inflateInit2_ (strm        : z_streamp;
                        windowBits  : integer;
                        version     : pchar;
                        stream_size : integer) : integer; stdcall; external mngdll;

{****************************************************************************}

function zlibVersion;          external mngdll;
function deflate;              external mngdll;
function deflateEnd;           external mngdll;
function inflate;              external mngdll;
function inflateEnd;           external mngdll;
function deflateSetDictionary; external mngdll;
function deflateCopy;          external mngdll;
function deflateReset;         external mngdll;
function deflateParams;        external mngdll;
function inflateSetDictionary; external mngdll;
function inflateSync;          external mngdll;
function inflateReset;         external mngdll;
function compress;             external mngdll;
function compress2;            external mngdll;
function uncompress;           external mngdll;
function adler32;              external mngdll;
function crc32;                external mngdll;
function zError;               external mngdll;
function inflateSyncPoint;     external mngdll;
function get_crc_table;        external mngdll;

{****************************************************************************}

{$ELSE}

function CheckZLIBLoaded: Boolean;
begin
  if (hLibmng = 0) OR (bZLIBLoaded = False) then begin
     if (hLibmng = 0) then begin
        hLibmng:= LoadLibrary(mngdll);
        if (hLibmng < HINSTANCE_ERROR) then begin
          hLibmng:= 0;
          Result:= False;
          Exit;
        end;
     end;

     (* TODO:  REMOVE
     @_EnumProcesses := GetProcAddress(hPSAPI, 'EnumProcesses');
     @_EnumProcessModules := GetProcAddress(hPSAPI, 'EnumProcessModules');
     {procedure}@_GetModuleBaseNameA := GetProcAddress(hPSAPI, 'GetModuleBaseNameA');*)

     {****************************************************************************}
     {Functions without a preceeding marker.  Procedures prefixed with the following: }
     {procedure}
     {****************************************************************************}
     @_deflateInit_:= GetProcAddress(hLibmng, 'deflateInit_');
     @_inflateInit_:= GetProcAddress(hLibmng, 'inflateInit_');
     @_deflateInit2_:= GetProcAddress(hLibmng, 'deflateInit2_');
     @_inflateInit2_:= GetProcAddress(hLibmng, 'inflateInit2_');

     @_deflate:= GetProcAddress(hLibmng, 'deflate');
     @_deflateInit:= GetProcAddress(hLibmng, 'deflateInit');
     @_deflateEnd:= GetProcAddress(hLibmng, 'deflateEnd');
     @_inflateInit:= GetProcAddress(hLibmng, 'inflateInit');
     @_inflate:= GetProcAddress(hLibmng, 'inflate');
     @_inflateEnd:= GetProcAddress(hLibmng, 'inflateEnd');
     @_deflateInit2:= GetProcAddress(hLibmng, 'deflateInit2');
     @_deflateSetDictionary:= GetProcAddress(hLibmng, 'deflateSetDictionary');
     @_deflateCopy:= GetProcAddress(hLibmng, 'deflateCopy');
     @_deflateReset:= GetProcAddress(hLibmng, 'deflateReset');
     @_deflateParams:= GetProcAddress(hLibmng, 'deflateParams');
     @_inflateInit2:= GetProcAddress(hLibmng, 'inflateInit2');
     @_inflateSetDictionary:= GetProcAddress(hLibmng, 'inflateSetDictionary');
     @_inflateSync:= GetProcAddress(hLibmng, 'inflateSync');
     @_inflateReset:= GetProcAddress(hLibmng, 'inflateReset');
     @_compress:= GetProcAddress(hLibmng, 'compress');
     @_compress2:= GetProcAddress(hLibmng, 'compress2');
     @_uncompress:= GetProcAddress(hLibmng, 'uncompress');
     @_adler32:= GetProcAddress(hLibmng, 'adler32');
     @_crc32:= GetProcAddress(hLibmng, 'crc32');
     @_zError:= GetProcAddress(hLibmng, 'zError');
     @_inflateSyncPoint:= GetProcAddress(hLibmng, 'inflateSyncPoint');
     @_get_crc_table:= GetProcAddress(hLibmng, 'get_crc_table');

     bZLIBLoaded:= True;
  end;

  Result:= True;
end;

function deflateInit_  (strm        : z_streamp;
                        level       : integer;
                        version     : pchar;
                        stream_size : integer) : integer;
begin
  if CheckZLIBLoaded then
     Result:= _deflateInit_(strm, level, version, stream_size)
  else Result:= MNG_DLLNOTLOADED;
end;

function inflateInit_  (strm        : z_streamp;
                        version     : pchar;
                        stream_size : integer) : integer;
begin
  if CheckZLIBLoaded then
     Result:= _inflateInit_(strm, version, stream_size)
  else Result:= MNG_DLLNOTLOADED;
end;

function deflateInit2_ (strm        : z_streamp;
                        level       : integer;
                        method      : integer;
                        windowBits  : integer;
                        memLevel    : integer;
                        strategy    : integer;
                        version     : pchar;
                        stream_size : integer) : integer;
begin
  if CheckZLIBLoaded then
     Result:= _deflateInit2_(strm, level, method, windowBits, memLevel, strategy, version, stream_size)
  else Result:= MNG_DLLNOTLOADED;
end;

function inflateInit2_ (strm        : z_streamp;
                        windowBits  : integer;
                        version     : pchar;
                        stream_size : integer) : integer;
begin
  if CheckZLIBLoaded then
     Result:= _inflateInit2_(strm, windowBits, version, stream_size)
  else Result:= MNG_DLLNOTLOADED;
end;

{****************************************************************************}

function zlibVersion;
begin
  if CheckZLIBLoaded then
     Result:= _zLibVersion
  else Result:= MNG_NULL;
end;

function deflate;
begin
  if CheckZLIBLoaded then
     Result:= _deflate(strm, flush)
  else Result:= MNG_DLLNOTLOADED;
end;

function deflateEnd;
begin
  if CheckZLIBLoaded then
     Result:= _deflateEnd(strm)
  else Result:= MNG_DLLNOTLOADED;
end;

function inflate;
begin
  if CheckZLIBLoaded then
     Result:= _inflate(strm, flush)
  else Result:= MNG_DLLNOTLOADED;
end;

function inflateEnd;
begin
  if CheckZLIBLoaded then
     Result:= _inflateEnd(strm)
  else Result:= MNG_DLLNOTLOADED;
end;

function deflateSetDictionary;
begin
  if CheckZLIBLoaded then
     Result:= _deflateSetDictionary(strm, dictionary, dictLength)
  else Result:= MNG_DLLNOTLOADED;
end;

function deflateCopy;
begin
  if CheckZLIBLoaded then
     Result:= _deflateCopy(dest, source)
  else Result:= MNG_DLLNOTLOADED;
end;

function deflateReset;
begin
  if CheckZLIBLoaded then
     Result:= _deflateReset(strm)
  else Result:= MNG_DLLNOTLOADED;
end;

function deflateParams;
begin
  if CheckZLIBLoaded then
     Result:= _deflateParams(strm, level, strategy)
  else Result:= MNG_DLLNOTLOADED;
end;

function inflateSetDictionary;
begin
  if CheckZLIBLoaded then
     Result:= _inflateSetDictionary(strm, dictionary, dictLength)
  else Result:= MNG_DLLNOTLOADED;
end;

function inflateSync;
begin
  if CheckZLIBLoaded then
     Result:= _inflateSync(strm)
  else Result:= MNG_DLLNOTLOADED;
end;

function inflateReset;
begin
  if CheckZLIBLoaded then
     Result:= _inflateReset(strm)
  else Result:= MNG_DLLNOTLOADED;
end;

function compress;
begin
  if CheckZLIBLoaded then
     Result:= _compress(dest, destLen, source, sourceLen)
  else Result:= MNG_DLLNOTLOADED;
end;

function compress2;
begin
  if CheckZLIBLoaded then
     Result:= _compress2(dest, destLen, source, sourceLen, level)
  else Result:= MNG_DLLNOTLOADED;
end;

function uncompress;
begin
  if CheckZLIBLoaded then
     Result:= _uncompress(dest, destLen, source, sourceLen)
  else Result:= MNG_DLLNOTLOADED;
end;

function adler32;
begin
  if CheckZLIBLoaded then
     Result:= _adler32(adler, buf, len)
  else Result:= MNG_DLLNOTLOADED;
end;

function crc32;
begin
  if CheckZLIBLoaded then
     Result:= _crc32(crc, buf, len)
  else Result:= MNG_DLLNOTLOADED;
end;

function zError;
begin
  if CheckZLIBLoaded then
     Result:= _zError(err)
  else Result:= MNG_NULL;
end;

function inflateSyncPoint;
begin
  if CheckZLIBLoaded then
     Result:= _inflateSyncPoint(strm)
  else Result:= MNG_DLLNOTLOADED;
end;

function get_crc_table;
begin
  if CheckZLIBLoaded then
     Result:= _get_crc_table
  else Result:= MNG_NULL;
end;

{****************************************************************************}
{$ENDIF}  //ifndef LATE_BINDING

function deflateInit;
begin
  Result := deflateInit_(strm, level, ZLIB_VERSION, sizeof(z_stream));
end;

{****************************************************************************}

function inflateInit;
begin
  Result := inflateInit_(strm, ZLIB_VERSION, sizeof(z_stream));
end;

{****************************************************************************}

function deflateInit2;
begin
  Result := deflateInit2_(strm, level, method, windowBits, memLevel, strategy,
                          ZLIB_VERSION, sizeof(z_stream));
end;

{****************************************************************************}

function inflateInit2;
begin
  Result := inflateInit2_(strm, windowBits, ZLIB_VERSION, sizeof(z_stream));
end;

{****************************************************************************}

function InflateString(Input: string; var Output: string): integer;
var
  stream: z_stream;
begin
  fillchar(stream, sizeof(stream), 0);

  stream.next_in   := @Input[1];
  stream.avail_in  := length(Input);
  stream.next_out  := @Output[1];
  stream.avail_out := length(Output);

  stream.zalloc    := nil;
  stream.zfree     := nil;
  stream.opaque    := nil;

  Result := inflateInit(@stream);

  if (Result <> Z_OK) then
    Exit;

  Result := inflate(@stream, Z_FINISH);

  if (Result <> Z_STREAM_END) then
  begin
    inflateEnd(@stream);

    if Result = Z_OK then
      Result := Z_BUF_ERROR;

    Exit;
  end;

  Output := copy(Output, 1, stream.total_out);
  Result := inflateEnd(@stream);
end;

{***************************************************************************}

function DeflateString(Input: string; var Output: string): integer;
var
  stream: z_stream;
begin
  fillchar(stream, sizeof(stream), 0);

  stream.next_in   := @Input[1];
  stream.avail_in  := length(Input);
  stream.next_out  := @Output[1];
  stream.avail_out := length(Output);

  stream.zalloc    := nil;
  stream.zfree     := nil;
  stream.opaque    := nil;

  Result := deflateInit(@stream, Z_DEFAULT_COMPRESSION);

  if (Result <> Z_OK) then
    Exit;

  Result := deflate(@stream, Z_FINISH);

  if (Result <> Z_STREAM_END) then
  begin
    deflateEnd(@stream);

    if Result = Z_OK then
      Result := Z_BUF_ERROR;

    Exit;
  end;

  Output := copy(Output, 1, stream.total_out);
  Result := deflateEnd(@stream);
end;

{***************************************************************************}

function InflateString2(Input: string; var Output: string;
  windowBits: integer): integer;

var
  stream: z_stream;
begin
  fillchar(stream, sizeof(stream), 0);

  stream.next_in   := @Input[1];
  stream.avail_in  := length(Input);
  stream.next_out  := @Output[1];
  stream.avail_out := length(Output);

  stream.zalloc    := nil;
  stream.zfree     := nil;
  stream.opaque    := nil;

  Result := inflateInit2(@stream, windowBits);

  if (Result <> Z_OK) then
    Exit;

  Result := inflate(@stream, Z_FINISH);

  if (Result <> Z_STREAM_END) then
  begin
    inflateEnd(@stream);

    if Result = Z_OK then
      Result := Z_BUF_ERROR;

    Exit;
  end;

  Output := copy(Output, 1, stream.total_out);
  Result := inflateEnd(@stream);
end;

{***************************************************************************}

function DeflateString2 (Input: string; var Output: string;
  level: integer; method: integer; windowBits: integer;
  memLevel: integer; strategy: integer): integer;

var
  stream : z_stream;
begin
  fillchar(stream, sizeof (stream), 0);

  stream.next_in   := @Input[1];
  stream.avail_in  := length(Input);
  stream.next_out  := @Output[1];
  stream.avail_out := length(Output);

  stream.zalloc    := nil;
  stream.zfree     := nil;
  stream.opaque    := nil;

  Result := deflateInit2(@stream, level, method, windowBits, memLevel, strategy);

  if (Result <> Z_OK) then
    Exit;

  Result := deflate(@stream, Z_FINISH);

  if (Result <> Z_STREAM_END) then
  begin
    deflateEnd(@stream);

    if Result = Z_OK then
      Result := Z_BUF_ERROR;

    Exit;
  end;

  Output := copy(Output, 1, stream.total_out);
  Result := deflateEnd(@stream);
end;

{****************************************************************************}

{$ENDIF} // INCLUDE_ZLIB


{****************************************************************************}


{$IFDEF LATE_BINDING}
Initialization
  hLibmng                     := 0;
{****************************************************************************}
  @_mng_version_text          := nil;
  @_mng_version_so            := nil;
  @_mng_version_dll           := nil;
  @_mng_version_major         := nil;
  @_mng_version_minor         := nil;
  @_mng_version_release       := nil;
{****************************************************************************}
  @_mng_initialize            := nil;
  @_mng_reset                 := nil; 
  @_mng_cleanup               := nil; 
  @_mng_read                  := nil; 
  @_mng_write                 := nil; 
  @_mng_create                := nil; 
  @_mng_readdisplay           := nil; 
  @_mng_display               := nil; 
  @_mng_display_resume        := nil; 
  @_mng_display_freeze        := nil; 
  @_mng_display_reset         := nil; 
  @_mng_getlasterror          := nil;
{****************************************************************************}
  @_mng_setcb_memalloc        := nil;
  @_mng_setcb_memfree         := nil; 
  @_mng_setcb_openstream      := nil; 
  @_mng_setcb_closestream     := nil; 
  @_mng_setcb_readdata        := nil; 
  @_mng_setcb_writedata       := nil; 
  @_mng_setcb_errorproc       := nil; 
  @_mng_setcb_processheader   := nil;
  @_mng_setcb_processtext     := nil; 
  @_mng_setcb_getcanvasline   := nil; 
  @_mng_setcb_getalphaline    := nil; 
  @_mng_setcb_getbkgdline     := nil; 
  @_mng_setcb_refresh         := nil; 
  @_mng_setcb_gettickcount    := nil; 
  @_mng_setcb_settimer        := nil;
{****************************************************************************}
  @_mng_getcb_memalloc        := nil; 
  @_mng_getcb_memfree         := nil; 
  @_mng_getcb_openstream      := nil; 
  @_mng_getcb_closestream     := nil; 
  @_mng_getcb_readdata        := nil; 
  @_mng_getcb_writedata       := nil; 
  @_mng_getcb_errorproc       := nil; 
  @_mng_getcb_processheader   := nil; 
  @_mng_getcb_processtext     := nil; 
  @_mng_getcb_getcanvasline   := nil; 
  @_mng_getcb_getalphaline    := nil; 
  @_mng_getcb_getbkgdline     := nil;
  @_mng_getcb_refresh         := nil;
  @_mng_getcb_gettickcount    := nil;
  @_mng_getcb_settimer        := nil;
{****************************************************************************}
  @_mng_set_userdata          := nil;
  @_mng_set_canvasstyle       := nil;
  @_mng_set_bkgdstyle         := nil;
  @_mng_set_bgcolor           := nil;
  @_mng_set_usebkgd           := nil;
  @_mng_set_storechunks       := nil;
  @_mng_set_cacheplayback     := nil;
  @_mng_set_viewgammaint      := nil;
  @_mng_set_displaygammaint   := nil;
  @_mng_set_dfltimggammaint   := nil;
  @_mng_set_srgb              := nil;
  @_mng_set_outputprofile     := nil; 
  @_mng_set_outputprofile2    := nil; 
  @_mng_set_outputsrgb        := nil; 
  @_mng_set_srgbprofile       := nil; 
  @_mng_set_srgbprofile2      := nil; 
  @_mng_set_srgbimplicit      := nil; 
  @_mng_set_maxcanvassize     := nil;
{****************************************************************************}
  @_mng_get_userdata          := nil; 
  @_mng_get_sigtype           := nil; 
  @_mng_get_imagetype         := nil; 
  @_mng_get_imagewidth        := nil; 
  @_mng_get_imageheight       := nil; 
  @_mng_get_ticks             := nil; 
  @_mng_get_framecount        := nil; 
  @_mng_get_layercount        := nil; 
  @_mng_get_playtime          := nil; 
  @_mng_get_simplicity        := nil; 
  @_mng_get_bitdepth          := nil; 
  @_mng_get_colortype         := nil; 
  @_mng_get_compression       := nil; 
  @_mng_get_filter            := nil; 
  @_mng_get_interlace         := nil; 
  @_mng_get_alphabitdepth     := nil; 
  @_mng_get_alphacompression  := nil; 
  @_mng_get_alphafilter       := nil;
  @_mng_get_alphainterlace    := nil;
  @_mng_get_bgcolor           := nil;
  @_mng_get_usebkgd           := nil;
  @_mng_get_viewgammaint      := nil;
  @_mng_get_displaygammaint   := nil;
  @_mng_get_dfltimggammaint   := nil;
  @_mng_get_srgb              := nil;
  @_mng_get_maxcanvaswidth    := nil;
  @_mng_get_maxcanvasheight   := nil; 
  @_mng_get_starttime         := nil; 
  @_mng_get_runtime           := nil; 
  @_mng_get_currentframe      := nil; 
  @_mng_get_currentlayer      := nil; 
  @_mng_get_currentplaytime   := nil; 
  @_mng_status_error          := nil; 
  @_mng_status_reading        := nil; 
  @_mng_status_suspendbreak   := nil; 
  @_mng_status_creating       := nil; 
  @_mng_status_writing        := nil; 
  @_mng_status_displaying     := nil; 
  @_mng_status_running        := nil; 
  @_mng_status_timerbreak     := nil;
{****************************************************************************}
  @_mng_putchunk_ihdr         := nil;
  @_mng_putchunk_plte         := nil;
  @_mng_putchunk_idat         := nil;
  @_mng_putchunk_iend         := nil;
  @_mng_putchunk_trns         := nil;
  @_mng_putchunk_gama         := nil;
  @_mng_putchunk_chrm         := nil;
  @_mng_putchunk_srgb         := nil;
  @_mng_putchunk_iccp         := nil;
  @_mng_putchunk_text         := nil;
  @_mng_putchunk_ztxt         := nil;
  @_mng_putchunk_itxt         := nil;
  @_mng_putchunk_bkgd         := nil;
  @_mng_putchunk_phys         := nil;
  @_mng_putchunk_sbit         := nil;
  @_mng_putchunk_splt         := nil;
  @_mng_putchunk_hist         := nil;
  @_mng_putchunk_time         := nil;
  @_mng_putchunk_jhdr         := nil;
  @_mng_putchunk_jdat         := nil;
  @_mng_putchunk_jsep         := nil;

{$IFDEF INCLUDE_ZLIB}
  @_deflateInit_              := nil;
  @_inflateInit_              := nil;
  @_deflateInit2_             := nil;
  @_inflateInit2_             := nil;

  @_zLibVersion               := nil;
  @_deflateInit               := nil;
  @_deflate                   := nil;
  @_deflateEnd                := nil;
  @_inflateInit               := nil;
  @_inflate                   := nil;
  @_inflateEnd                := nil;
  @_deflateInit2              := nil;
  @_deflateSetDictionary      := nil;
  @_deflateCopy               := nil;
  @_deflateReset              := nil;
  @_deflateParams             := nil;
  @_inflateInit2              := nil;
  @_inflateSetDictionary      := nil;
  @_inflateSync               := nil;
  @_inflateReset              := nil;
  @_compress                  := nil;
  @_compress2                 := nil;
  @_uncompress                := nil;
  @_adler32                   := nil;
  @_crc32                     := nil;
  @_zError                    := nil;
  @_inflateSyncPoint          := nil;
  @_get_crc_table             := nil;
{$ENDIF}

{$ENDIF}


end.
