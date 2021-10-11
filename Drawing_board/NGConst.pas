unit NGConst;

{****************************************************************************}
{*                                                                          *}
{*  for copyright and version information see header in NGImages.pas        *}
{*                                                                          *}
{****************************************************************************}
{*                                                                          *}
{*  Changelog:                            * reverse chronological order *   *}
{*                                                                          *}
{*  * 0.9.8 *                                                               *}
{*  2001/06/26 - GJU - Added stuff for late binding                         *}
{*  2001/06/16 - GJU - Moved all string-constants here                      *}
{*  2001/05/08 - SPR - Restructured for Maintainability                     *}
{*             - SPR - Seperated original NGImage.pas into multiple units   *}
{*                                                                          *}
{****************************************************************************}


{$INCLUDE NGDefs.inc}


interface


{****************************************************************************}

const
  { Library Name for Early Binding }
  mngdll = 'libmng.dll';

  { Build Version Information - MODIFIED ON PUBLIC RELEASES ONLY! }
  TNGVersionStr     = '0.9.8';
  TNGVersionMajor   = 0;
  TNGVersionMinor   = 9;
  TNGVersionRelease = 8;

  { Library Defined Constant Equivalents }
  MNG_TRUE       = TRUE;
  MNG_FALSE      = FALSE;
  MNG_NULL       = nil;

{****************************************************************************}
{* local constants & types                                                  *}
{****************************************************************************}

resourcestring
  SCClipboardNotSupported  = 'PNG/JNG/MNG clipboard not yet supported';
  SCNGImageException       = 'PNG/JNG/MNG error: %s ' +
                             '[Code=%d; Severity=%d; Chunknr=%d; Extra=%d/%d]';
  SCNGSavePNGillegal       = 'PNG save not supported in this state';
  SCNGSaveJNGillegal       = 'JNG save not supported in this state';
  SCNGVideoNotSupported    = 'Function not supported in video playback mode';      

  SCZLIBError              = 'Serious ZLIB error...';

{$IFDEF LATE_BINDING}
  SCDLLNotLoaded           = 'libmng.dll was not loaded correctly';
{$ENDIF}

const
  SCPNGExt                 = 'PNG';
  SCJNGExt                 = 'JNG';
  SCMNGExt                 = 'MNG';
  SCJPEGExt1               = 'JPE';
  SCJPEGExt2               = 'JFIF';
  SCJPEGExt3               = 'JPEG';
  SCJPEGExt4               = 'JPG';

  SCPNGImageFile           = 'Portable Network Graphics';
  SCJNGImageFile           = 'JPEG Network Graphics';
  SCMNGImageFile           = 'Multiple-image Network Graphics';
  SCJPEGImageFile          = 'JPEG image';

{****************************************************************************}

  { function names for errormessages }
const
  SCCreate             = 'Create/';
  SCInitialize         = 'initialize';
  SCSetStoreChunks     = 'set_storechunks';
  SCSetCBxxxx          = 'setcb_xxxx';
  SCSetCanvasStyle     = 'set_canvasstyle';
  SCDestroy            = 'Destroy/';
  SCCleanup            = 'cleanup';
  SCLoadFromStream     = 'LoadFromStream/';
  SCLoadFromFile       = 'LoadFromFile/';
  SCSaveToStream       = 'SaveToStream/';
  SCSaveToFile         = 'SaveToFile/';
  SCRead               = 'read';
  SCWrite              = 'write';
  SCDisplay            = 'display';
  SCProcessTimer       = 'ProcessTimer/';
  SCDisplayResume      = 'display_resume';
  SCRewind             = 'Rewind/';
  SCDisplayReset       = 'display_reset';
  SCPause              = 'Pause/';
  SCDisplayFreeze      = 'display_freeze';
  SCPlay               = 'Play/';
  SCReset              = 'Reset/';
  SCCreatePNG          = 'CreatePNG/';
  SCCreateJNG          = 'CreateJNG/';
  SCReset2             = 'reset';
  SCCreate2            = 'create';
  SCPutChunkIHDR       = 'putchunk_ihdr';
  SCPutChunkJHDR       = 'putchunk_jhdr';
  SCPutChunkSRGB       = 'putchunk_srgb';
  SCPutChunkPLTE       = 'putchunk_plte';
  SCPutChunkTRNS       = 'putchunk_trns';
  SCPutChunkIDAT       = 'putchunk_idat';
  SCPutChunkJDAT       = 'putchunk_jdat';
  SCPutChunkIEND       = 'putchunk_iend';
  SCSetCachePlayback   = 'set_cacheplayback';
  SCReadDisplay        = 'readdisplay';
  SCSetBGImage         = 'setbgimage';

{****************************************************************************}

  { Return Values }
const
  MNG_NOERROR          = 0;

  MNG_OUTOFMEMORY      = 1;
  MNG_INVALIDHANDLE    = 2;
  MNG_NOCALLBACK       = 3;
  MNG_UNEXPECTEDEOF    = 4;
  MNG_ZLIBERROR        = 5;
  MNG_JPEGERROR        = 6;
  MNG_LCMSERROR        = 7;
  MNG_NOOUTPUTPROFILE  = 8;
  MNG_NOSRGBPROFILE    = 9;
  MNG_BUFOVERFLOW      = 10;
  MNG_FUNCTIONINVALID  = 11;
  MNG_OUTPUTERROR      = 12;
  MNG_JPEGBUFTOOSMALL  = 13;
  MNG_NEEDMOREDATA     = 14;
  MNG_NEEDTIMERWAIT    = 15;
  MNG_NEEDSECTIONWAIT  = 16;

{$IFDEF LATE_BINDING}
  MNG_DLLNOTLOADED     = 99;
{$ENDIF}

  MNG_APPIOERROR       = 901;
  MNG_APPTIMERERROR    = 902;
  MNG_APPCMSERROR      = 903;
  MNG_APPMISCERROR     = 904;
  MNG_APPTRACEABORT    = 905;

  MNG_INTERNALERROR    = 999;

  MNG_INVALIDSIG       = 1025;
  MNG_INVALIDCRC       = 1027;
  MNG_INVALIDLENGTH    = 1028;
  MNG_SEQUENCEERROR    = 1029;
  MNG_CHUNKNOTALLOWED  = 1030;
  MNG_MULTIPLEERROR    = 1031;
  MNG_PLTEMISSING      = 1032;
  MNG_IDATMISSING      = 1033;
  MNG_CANNOTBEEMPTY    = 1034;
  MNG_GLOBALLENGTHERR  = 1035;
  MNG_INVALIDBITDEPTH  = 1036;
  MNG_INVALIDCOLORTYPE = 1037;
  MNG_INVALIDCOMPRESS  = 1038;
  MNG_INVALIDFILTER    = 1039;
  MNG_INVALIDINTERLACE = 1040;
  MNG_NOTENOUGHIDAT    = 1041;
  MNG_PLTEINDEXERROR   = 1042;
  MNG_NULLNOTFOUND     = 1043;
  MNG_KEYWORDNULL      = 1044;
  MNG_OBJECTUNKNOWN    = 1045;
  MNG_OBJECTEXISTS     = 1046;
  MNG_TOOMUCHIDAT      = 1047;
  MNG_INVSAMPLEDEPTH   = 1048;
  MNG_INVOFFSETSIZE    = 1049;
  MNG_INVENTRYTYPE     = 1050;
  MNG_ENDWITHNULL      = 1051;
  MNG_INVIMAGETYPE     = 1052;
  MNG_INVDELTATYPE     = 1053;
  MNG_INVALIDINDEX     = 1054;
  MNG_TOOMUCHJDAT      = 1055;
  MNG_JPEGPARMSERR     = 1056;
  MNG_INVFILLMETHOD    = 1057;
  MNG_OBJNOTCONCRETE   = 1058;
  MNG_TARGETNOALPHA    = 1059;

  MNG_INVALIDCNVSTYLE  = 2049;
  MNG_WRONGCHUNK       = 2050;
  MNG_INVALIDENTRYIX   = 2051;
  MNG_NOHEADER         = 2052;
  MNG_NOCORRCHUNK      = 2053;
  MNG_NOMHDR           = 2054;

  MNG_IMAGETOOLARGE    = 4097;
  MNG_NOTANANIMATION   = 4098;
  MNG_FRAMENRTOOHIGH   = 4099;
  MNG_LAYERNRTOOHIGH   = 4100;
  MNG_PLAYTIMETOOHIGH  = 4101;
  MNG_FNNOTIMPLEMENTED = 4102;

  MNG_IMAGEFROZEN      = 8193;

{****************************************************************************}

const
  MNG_CANVAS_RGB8      = $00000000;
  MNG_CANVAS_RGBA8     = $00001000;
  MNG_CANVAS_ARGB8     = $00003000;
  MNG_CANVAS_RGB8_A8   = $00005000;
  MNG_CANVAS_BGR8      = $00000001;
  MNG_CANVAS_BGRA8     = $00001001;
  MNG_CANVAS_ABGR8     = $00003001;

{****************************************************************************}

implementation



end.





