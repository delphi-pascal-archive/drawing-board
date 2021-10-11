unit NGImages;

{****************************************************************************}
{*               This is version: 0.9.8b (4th BETA+)                        *}
{****************************************************************************}
{*                                                                          *}
{*  COPYRIGHT NOTICE:                                                       *}
{*                                                                          *}
{*  Copyright (c) 2001 Gerard Juyn, Scott Price                             *}
{*  [You may insert additional notices after this sentence if you modify    *}
{*   this source]                                                           *}
{*                                                                          *}
{*  For the purposes of this copyright and license, "Contributing Authors"  *}
{*  is currently defined as the following set of individuals:               *}
{*                                                                          *}
{*     Gerard Juyn            GJU  (gerard@libmng.com)                      *}
{*     Scott Price            SPR                                           *}
{*     Peter J. Haas          PJH                                           *}
{*     Alexander Tereschenko  ALT  (alex@plastiqueweb.com)                  *}
{*                                                                          *}
{*  This component is supplied "AS IS".  The Contributing Authors           *}
{*  disclaim all warranties, expressed or implied, including, without       *}
{*  limitation, the warranties of merchantability and of fitness for any    *}
{*  purpose.  The Contributing Authors assume no liability for direct,      *}
{*  indirect, incidental, special, exemplary, or consequential damages,     *}
{*  which may result from the use of this component, even if advised of     *}
{*  the possibility of such damage.                                         *}
{*                                                                          *}
{*  Permission is hereby granted to use, copy, modify, and distribute this  *}
{*  source code, or portions hereof, for any purpose, without fee, subject  *}
{*  to the following restrictions:                                          *}
{*                                                                          *}
{*  1. The origin of this source code must not be misrepresented;           *}
{*     you must not claim that you wrote the original software.             *}
{*                                                                          *}
{*  2. Altered versions must be plainly marked as such and must not be      *}
{*     misrepresented as being the original source.                         *}
{*                                                                          *}
{*  3. This Copyright notice may not be removed or altered from any source  *}
{*     or altered source distribution.                                      *}
{*                                                                          *}
{*  The Contributing Authors specifically permit, without fee, and          *}
{*  encourage the use of this source code as a component to supporting      *}
{*  the MNG/JNG and PNG file format in commercial products. If you use this *}
{*  source code in a product, acknowledgment would be highly appreciated.   *}
{*                                                                          *}
{****************************************************************************}
{*                                                                          *}
{*  Copyrights & Trademarks                                                 *}
{*                                                                          *}
{*  Uses "libmng" - an open-source initiative by Gerard Juyn                *}
{*  copyright (C) 2000,2001 G. Juyn                                         *}
{*  http://www.libmng.com                                                   *}
{*                                                                          *}
{*  Based in part on the works of the Independant JPEG Group (IJG)          *}
{*  copyright (C) 1991-1998 Thomas G. Lane                                  *}
{*  http://www.ijg.org                                                      *}
{*                                                                          *}
{*  Uses "lcms" (little CMS) by Marti Maria Saguer                          *}
{*  distributed under LGPL                                                  *}
{*  http://www.littlecms.com                                                *}
{*                                                                          *}
{*  Uses "zlib" - a mighty, patent-free(!) (de)compression-library          *}
{*  copyright (C) 1995-1998 Jean-loup Gailly and Mark Adler                 *}
{*  http://www.info-zip.org/pub/infozip/zlib                                *}
{*                                                                          *}
{*  The implementation of the TJPEGImage is based on sample code in the     *}
{*  JPEG unit provided with Borland Delphi.                                 *}
{*  Copyright (c) 1997 Borland International                                *}
{*  (only adapted to work with ijgsrc6b in libmng.dll)                      *}
{*                                                                          *}
{*  Parts of the source-code are courtesy of Triple-T                       *}
{*  http://www.3-t.com                                                      *}
{*                                                                          *}
{****************************************************************************}
{*                                                                          *}
{*  Changelog:                            * reverse chronological order *   *}
{*                                                                          *}
{*  * 0.9.8c *                                                              *}
{*  2001/08/25 - SPR - Fixed Late Binding ZLIB method reference issue       *}
{*                                                                          *}
{*  * 0.9.8b *                                                              *}
{*  2001/08/25 - GJU - Added BGImage property for assigning background-image*}
{*             - GJU - Added OnProcessHeader event                          *}
{*                                                                          *}
{*  * 0.9.8 *                                                               *}
{*  2001/08/12 - ALT - Added Delphi6 package                                *}
{*             - GJU - Changed the fix for TOpenPictureDialog as Borland    *}
{*                     changed its design in D6                             *}
{*  2001/07/23 - GJU - Added gamma control functions                        *}
{*  2001/07/22 - GJU - Fixed some formatting                                *}
{*  2001/07/21 - GJU - Added code to prevent 256->16 palette reduction bug  *}
{*                     (really wondring if it'll work this way?!?!?)        *}
{*                     (search for 'Phil Scadden')                          *}
{*  2001/06/26 - GJU - Changed most CheckLIBMNGLoaded to assigned/exception *}
{*             - GJU - Fixed 'Invalid Window Handle' in OpenPictureDialog   *}
{*             - GJU - Added limit checking for JPEG quality setting        *}
{*             - GJU - added TMNGVideo component (see mngvideo.txt)         *}
{*                     (optimized for video-stream playback)                *}
{*  2001/06/23 - SPR - Added stuff for late binding (see latebinding.txt)   *}
{*  2001/06/16 - GJU - Moved all string-constants to NGConst.pas            *}
{*  2001/06/12 - SPR - Tidied up CreatePNG                                  *}
{*             - SPR - Bracketed some if statements for easier debugging    *}
{*  2001/06/10 - PJH - Added 1 bit alpha mask for alpha color               *}
{*             - PJH - BugFix 8 bit alpha mask for alpha color              *}
{*             - PJH - Fixed D5 compiler warnings (signed/unsigned compare) *}
{*  2001/05/08 - SPR - Restructured for Maintainability                     *}
{*             - SPR - Seperated original NGImage.pas into multiple units   *}
{*                                                                          *}
{****************************************************************************}
{*                                                                          *}
{*  TODO:                                                                   *}
{*                                                                          *}
{*  - several optimizations                                                 *}
{*  - support for OnProgress                                                *}
{*  - The number of timers available to the system is limited.              *}
{*    Perhaps consider other options.                                       *}
{*                                                                          *}
{****************************************************************************}

{$DEFINE INCLUDE_PNG_SAVE}

{$INCLUDE NGDefs.inc}


interface



uses { Own Units }
		 NGTypes, NGConst, {$IFDEF INCLUDE_JPEG} NGJPEG, {$ENDIF}

		 { Borland Standard Units }
		 Classes, Controls, ExtCtrls, Windows, Graphics;


{****************************************************************************}
{* actual object definitions                                                *}
{****************************************************************************}

type
  TNGImage  = class;

{****************************************************************************}
{* internal object to facilitate reference counting of a LIBMNG handle      *}
{****************************************************************************}

  TNGBitmap = class (TBitmap)
  public
    { Private declarations }
    HFHandle          : mng_handle;         // libmng handle
    OFImages          : TList;              // parent TNGImage objects
		{ TODO:  The number of timers available to the system is limited. Perhaps consider other options. }
    OFTimer           : TTimer;             // timer for MNG animation
    OFStream          : TStream;            // stream for load/save
    BFFreeOnClose     : boolean;            // free the stream on load/save completed
    BFHaveHeader      : boolean;            // processed PNG/JNG/MNG header chunk

    IFAlphaColor      : integer;            // to add transparency after assigning
    OFAlphaBitmap     : TBitmap;            // a TBitmap to TNGImage
    OFBGImage         : TBitmap;            // background-image

{$IFDEF INCLUDE_ZLIB}
    IFZLIBLevel       : integer;            // ZLIB compression parameters
    IFZLIBMethod      : integer;
    IFZLIBWindowbits  : integer;
    IFZLIBMemLevel    : integer;
    IFZLIBStrategy    : integer;
    IFZLIBMaxIDAT     : cardinal;
{$ENDIF}

{$IFDEF INCLUDE_JPEG}
    IFJPEGQuality     : TJPEGQualityRange;  // JPEG compression parameters
    BFJPEGProgressive : boolean;
    IFJPEGMaxJDAT     : cardinal;
{$ENDIF}

    BFStatusCheck     : boolean;            // lock recursive status checks
    BFCreating        : boolean;            // libmng status history
    BFWriting         : boolean;
    BFReading         : boolean;
    BFDisplaying      : boolean;
    BFRunning         : boolean;

    procedure CheckStatus;

    procedure ProcessTimer    (Sender    : TObject);

    procedure Refresh         (IHX, IHY  : integer;
                               IHWidth   : integer;
															 IHHeight  : integer);

    function  CompressRawdata (SHRawdata : string) : string;
{$IFDEF INCLUDE_JNG_SAVE}              // JNG save support ?
    procedure CreateJNG;
{$ENDIF}

    procedure LibMNG_Error    (SHMsg     : string);

  protected
    { Protected declarations }
    procedure Rewind;                  // Restart from first frame
    procedure Pause;                   // Pause at current frame
    procedure Play;                    // Resume from current frame (after pause)
		procedure Stop;                    // Stop animation (cannot resume in this case!)

    procedure AddImage    (OHImage : TNGImage);
    procedure RemoveImage (OHImage : TNGImage);

  public
    { Public declarations }
    constructor Create; override;
    destructor Destroy; override;
    procedure CreatePNG;
    function  Assign_Dot_by_dot(hwin:hwnd; un_bitmap:graphics.tbitmap):boolean; // écrit par denis beelog
    procedure SetTransImage(OHImage   : TBitmap); // Créer by db pour utiliser un bitmap de transparence
    procedure SetBGImage(OHImage   : TBitmap); // déplacer pour devenir public
    procedure LoadFromStream (      Stream   : TStream); override;
    procedure SaveToStream   (      Stream   : TStream); override;
    procedure LoadFromFile   (const FileName : string ); override;
    procedure SaveToFile     (const FileName : string ); override;

    procedure LoadFromClipboardFormat
                             (      AFormat  : Word;
                                    AData    : THandle;
                                    APalette : HPALETTE); override;
    procedure SaveToClipboardFormat
                             (var   AFormat  : Word;
                              var   AData    : THandle;
                              var   APalette : HPALETTE); override;

  end;

{****************************************************************************}
{* The PNG/JNG/MNG base class                                               *}
{*                                                                          *}
{* This will function like any other descendant of TGraphic, except that    *}
{* not all functionality is (as of yet) supported.                          *}
{* But basic operations such as LoadFromFile/LoadFromStream and Draw        *}
{* are supported.                                                           *}
{****************************************************************************}

  TNGImage = class (TGraphic)
  private
    OFCanvas        : TCanvas;         // remembered from "draw" override
    OFRect          : TRect;           // remembered from "draw" override
    HFCanvasParent  : HWND;            // window handle of canvas parent control
    BFRefreshing    : boolean;         // lock recursive refreshes
    OFBitmap        : TNGBitmap;       // actual bitmap data

    OFStatusChange  : TNotifyEvent;    // triggered when libmng status changes
    OFProcessHeader : TNotifyEvent;    // triggered when libmng has read the
                                       // image header chunk 

    procedure Refresh (IHX, IHY : integer;
                       IHWidth  : integer;
                       IHHeight : integer);

    procedure CreateBitmap;
    procedure DestroyBitmap;
    procedure AssignBitmap (OHBitmap : TNGBitmap);
    procedure IsolateBitmap;

    // libmng version control

    function GetLIBMNGVersionText    : string;
    function GetLIBMNGVersionDLL     : integer;
    function GetLIBMNGVersionMajor   : integer;
    function GetLIBMNGVersionMinor   : integer;
    function GetLIBMNGVersionRelease : integer;

    // graphic properties

    function GetSignatureType        : mng_imgtype;
    function GetImageType            : mng_imgtype;
    function GetTicks                : cardinal;           // MNG
    function GetFrameCount           : cardinal;           // MNG
    function GetLayerCount           : cardinal;           // MNG
    function GetPlayTime             : cardinal;           // MNG
    function GetSimplicity           : cardinal;           // MNG
    function GetBitdepth             : byte;               // PNG+JNG
    function GetColorType            : byte;               // PNG+JNG
    function GetCompression          : byte;               // PNG+JNG
    function GetFilter               : byte;               // PNG
    function GetInterlaceMethod      : byte;               // PNG+JNG
    function GetAlphaBitdepth        : byte;               // JNG
    function GetAlphaCompression     : byte;               // JNG
    function GetAlphaFilter          : byte;               // JNG
    function GetAlphaInterlace       : byte;               // JNG

    // libmng background control

    function GetBGColor              : TColor;
    function GetBGImage              : TBitmap;
    function GetUseBKGD              : boolean;
    procedure SetBGColor             (IHValue : TColor );
    procedure SetBGImage             (OHValue : TBitmap);
    procedure SetUseBKGD             (BHValue : boolean);

    // libmng gamma correction control

    function GetViewGamma            : single;             // default 1.0
    function GetDisplayGamma         : single;             // default 2.2
    function GetDfltImgGamma         : single;             // default 0.45455
    procedure SetViewGamma           (IHValue : single);
    procedure SetDisplayGamma        (IHValue : single);
    procedure SetDfltImgGamma        (IHValue : single);

    // libmng compression variables

{$IFDEF INCLUDE_ZLIB}
    function GetZLIBLevel            : integer;
    function GetZLIBMethod           : integer;
    function GetZLIBWindowbits       : integer;
    function GetZLIBMemLevel         : integer;
    function GetZLIBStrategy         : integer;
    function GetZLIBMaxIDAT          : cardinal;
    procedure SetZLIBLevel           (IHValue : integer );
    procedure SetZLIBMethod          (IHValue : integer );
    procedure SetZLIBWindowbits      (IHValue : integer );
    procedure SetZLIBMemLevel        (IHValue : integer );
    procedure SetZLIBStrategy        (IHValue : integer );
    procedure SetZLIBMaxIDAT         (IHValue : cardinal);
{$ENDIF}

{$IFDEF INCLUDE_JPEG}
    function GetJPEGQuality          : TJPEGQualityRange;           // 1..100
    function GetJPEGProgressive      : boolean;
    function GetJPEGMaxJDAT          : cardinal;
    procedure SetJPEGQuality         (IHValue : TJPEGQualityRange); // 1..100
    procedure SetJPEGprogressive     (BHValue : boolean );
    procedure SetJPEGMaxJDAT         (IHValue : cardinal);
{$ENDIF}

    // libmng status control

    function GetMNGStartTime         : cardinal;
    function GetMNGRunTime           : cardinal;
    function GetMNGCurrentFrame      : cardinal;
    function GetMNGCurrentLayer      : cardinal;
    function GetMNGCurrentPlaytime   : cardinal;

    function GetStatusError          : boolean;
    function GetStatusReading        : boolean;
    function GetStatusCreating       : boolean;
    function GetStatusWriting        : boolean;
    function GetStatusDisplaying     : boolean;
    function GetStatusRunning        : boolean;

    // Transparent support
    // 2 methods added by Peter J. Haas
    function GetTransparentColor: TColor;
    procedure SetTransparentColor(Value: TColor);

  protected
    // Transparent support
    // 2 methods added by Peter J. Haas
    function GetTransparent: Boolean; override;
    procedure SetTransparent(Value: Boolean); override;

  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Free;

    procedure LoadFromStream  (      Stream   : TStream); override;
    procedure SaveToStream    (      Stream   : TStream); override;
    procedure LoadFromFile    (const FileName : string ); override;
    procedure SaveToFile      (const FileName : string ); override;

    procedure LoadFromClipboardFormat  // not supported yet !!!
                              (      AFormat  : Word;
                                     AData    : THandle;
                                     APalette : HPALETTE); override;
    procedure SaveToClipboardFormat    // not supported yet !!!
                              (var   AFormat  : Word;
                               var   AData    : THandle;
                               var   APalette : HPALETTE); override;

    function  GetHeight : integer; override;
    function  GetWidth  : integer; override;
    function  GetEmpty  : boolean; override;

    procedure SetHeight       (      Value    : integer); override;
    procedure SetWidth        (      Value    : integer); override;

    procedure Assign          (      Source   : TPersistent); override;
    procedure Draw            (      ACanvas  : TCanvas;
                               const Rect     : TRect  ); override;

    procedure SetAlphaColor   (      Color    : TColor );
    // this actually assigns the bitmap internally so it can be dropped afterwards
    procedure SetAlphaBitmap  (      Bitmap   : TBitmap);

{$IFDEF INCLUDE_PNG_SAVE}              // PNG save support ?
    procedure SaveToPNGstream (      Stream   : TStream);
    procedure SaveToPNGfile   (const FileName : string );
{$ENDIF}
{$IFDEF INCLUDE_JNG_SAVE}              // JNG save support ?
    procedure SaveToJNGstream (      Stream   : TStream);
    procedure SaveToJNGfile   (const FileName : string );
{$ENDIF}

    // libmng animation functions

    procedure MNG_Rewind; virtual;     // Restart from first frame
    procedure MNG_Pause;               // Pause at current frame
    procedure MNG_Play;                // Resume from current frame (after pause)
    procedure MNG_Stop;                // Stop animation (cannot resume in this case!)

    // libmng version control

    property LIBMNGVersionText    : string       read GetLIBMNGVersionText;
    property LIBMNGVersionDLL     : integer      read GetLIBMNGVersionDLL;
    property LIBMNGVersionMajor   : integer      read GetLIBMNGVersionMajor;
    property LIBMNGVersionMinor   : integer      read GetLIBMNGVersionMinor;
    property LIBMNGVersionRelease : integer      read GetLIBMNGVersionRelease;

    // graphic properties

    property SignatureType        : mng_imgtype  read GetSignatureType;
    property ImageType            : mng_imgtype  read GetImageType;
    property TicksPerSecond       : cardinal     read GetTicks;             // MNG
    property FrameCount           : cardinal     read GetFrameCount;        // MNG
    property LayerCount           : cardinal     read GetLayerCount;        // MNG
    property PlayTime             : cardinal     read GetPlayTime;          // MNG
    property Simplicity           : cardinal     read GetSimplicity;        // MNG
    property BitDepth             : byte         read GetBitdepth;          // PNG+JNG
    property ColorType            : byte         read GetColorType;         // PNG+JNG
    property CompressionMethod    : byte         read GetCompression;       // PNG+JNG
    property FilterMethod         : byte         read GetFilter;            // PNG
    property InterlaceMethod      : byte         read GetInterlaceMethod;   // PNG+JNG
    property AlphaBitdepth        : byte         read GetAlphaBitdepth;     // JNG
    property AlphaCompression     : byte         read GetAlphaCompression;  // JNG
    property AlphaFilter          : byte         read GetAlphaFilter;       // JNG
    property AlphaInterlace       : byte         read GetAlphaInterlace;    // JNG

    // libmng background control

    property BGColor              : TColor       read GetBGColor         write SetBGColor;
    property BGImage              : TBitmap      read GetBGImage         write SetBGImage;
    property UseBKGD              : boolean      read GetUseBKGD         write SetUseBKGD;

    // libmng gamma correction control

    property ViewGamma            : single       read GetViewGamma       write SetViewGamma;    // 1.0
    property DisplayGamma         : single       read GetDisplayGamma    write SetDisplayGamma; // 2.2
    property DfltImgGamma         : single       read GetDfltImgGamma    write SetDfltImgGamma; // 0.45455

    // Transparent support
    // 2 properties added by Peter J. Haas
    property Transparent: Boolean read GetTransparent write SetTransparent;
    property TransparentColor: TColor read GetTransparentColor write SetTransparentColor;

    // libmng compression variables

{$IFDEF INCLUDE_ZLIB}
    property ZLIBLevel            : integer      read GetZLIBLevel       write SetZLIBLevel;
    property ZLIBMethod           : integer      read GetZLIBMethod      write SetZLIBMethod;
    property ZLIBWindowbits       : integer      read GetZLIBWindowbits  write SetZLIBWindowbits;
    property ZLIBMemLevel         : integer      read GetZLIBMemLevel    write SetZLIBMemLevel;
    property ZLIBStrategy         : integer      read GetZLIBStrategy    write SetZLIBStrategy;
    property ZLIBMaxIDAT          : cardinal     read GetZLIBMaxIDAT     write SetZLIBMaxIDAT;
{$ENDIF}

{$IFDEF INCLUDE_JPEG}
    property JPEGQuality          : TJPEGQualityRange read GetJPEGQuality  write SetJPEGQuality;
    property JPEGProgressive      : boolean      read GetJPEGProgressive write SetJPEGprogressive;
    property JPEGmaxJDAT          : cardinal     read GetJPEGMaxJDAT     write SetJPEGMaxJDAT;
{$ENDIF}

    // libmng status control

    property MNGStartTime         : cardinal     read GetMNGStartTime;      // MNG
    property MNGRunTime           : cardinal     read GetMNGRunTime;        // MNG
    property MNGCurrentFrame      : cardinal     read GetMNGCurrentFrame;   // MNG
    property MNGCurrentLayer      : cardinal     read GetMNGCurrentLayer;   // MNG
    property MNGCurrentPlaytime   : cardinal     read GetMNGCurrentPlaytime;// MNG

    property StatusError          : boolean      read GetStatusError;
    property StatusReading        : boolean      read GetStatusReading;
    property StatusCreating       : boolean      read GetStatusCreating;
    property StatusWriting        : boolean      read GetStatusWriting;
    property StatusDisplaying     : boolean      read GetStatusDisplaying;
    property StatusRunning        : boolean      read GetStatusRunning;

    property OnStatusChange       : TNotifyEvent read OFStatusChange     write OFStatusChange;
    property OnProcessHeader      : TNotifyEvent read OFProcessHeader    write OFProcessHeader;

  end;

{****************************************************************************}
{* Derived classes to support all network graphics formats                  *}
{****************************************************************************}

type
{$IFDEF REGISTER_PNG}
  TPNGImage = class (TNGImage);
{$ENDIF}
{$IFDEF REGISTER_JNG}
  TJNGImage = class (TNGImage);
{$ENDIF}
{$IFDEF REGISTER_MNG}
  TMNGImage = class (TNGImage);
{$ENDIF}

{****************************************************************************}
{* Special video-playback component                                         *}
{****************************************************************************}
// Use only to save memory on long video MNGs
// MNG must *not* have LOOP constructs; TERM is not processed
// Save & Rewind options are not supported
// Can only assign to TMNGVideo

type
  TMNGVideo = class (TNGImage)
  public
    constructor Create; override;

    procedure LoadFromStream  (      Stream   : TStream); override;
    procedure SaveToStream    (      Stream   : TStream); override;      // not supported!!!
    procedure LoadFromFile    (const FileName : string ); override;
    procedure SaveToFile      (const FileName : string ); override;      // not supported!!!

    procedure Assign          (      Source   : TPersistent); override;  // only supports TMNGVideo!!

    procedure MNG_Rewind; override;                                      // Not supported
  end;

{****************************************************************************}



implementation

uses SysUtils,U_fast_bitmap;

{****************************************************************************}
{* local constants & types                                                  *}
{****************************************************************************}
type
  TRGBpixel = record
    B : byte;
    G : byte;
    R : byte;
  end;
  PRGBpixel = ^TRGBpixel;


{****************************************************************************}
{* local callback funtions to interface with LIBMNG                         *}
{****************************************************************************}

function XNG_alloc (IHSize : mng_size_t) : mng_ptr; stdcall;
begin
  GetMem(Result, IHSize);
  FillChar(Result^, IHSize, 0);
end;

{****************************************************************************}

procedure XNG_free (PHPtr  : mng_ptr;
                    IHSize : mng_size_t); stdcall;
begin
  FreeMem(PHPtr, IHSize);
end;

{****************************************************************************}

function XNG_gettickcount (HHHandle : mng_handle) : mng_uint32; stdcall;
begin
  Result := Windows.GetTickCount;
end;

{****************************************************************************}

function XNG_openstream (HHHandle : mng_handle) : mng_bool; stdcall;
begin
  Result := MNG_TRUE;
end;

{****************************************************************************}

function XNG_closestream (HHHandle : mng_handle) : mng_bool; stdcall;

var OHImage : TNGbitmap;

begin
  OHImage := TNGbitmap(mng_get_userdata(HHHandle));

  if OHImage.BFFreeOnClose then
  begin
    OHImage.OFStream.Free;
    OHImage.OFStream := nil;
  end;

  Result := MNG_TRUE;
end;

{****************************************************************************}

function XNG_readdata (    HHHandle : mng_handle;
                           PHBuf    : mng_ptr;
                           IHBuflen : mng_uint32;
                       var IHRead   : mng_uint32) : mng_bool; stdcall;

var OHImage : TNGbitmap;

begin
  OHImage    := TNGbitmap(mng_get_userdata(HHHandle));

  with OHImage do
  begin
    if OFStream.Position >= OFStream.Size then
      IHRead := 0
    else
      IHRead := OHImage.OFStream.Read(PHBuf^, IHBuflen);

  end;

  Result     := MNG_TRUE;
end;

{****************************************************************************}

function XNG_writedata (    HHHandle  : mng_handle;
                            PHBuf     : mng_ptr;
                            IHBuflen  : mng_uint32;
                        var IHWritten : mng_uint32) : mng_bool; stdcall;

var OHImage : TNGbitmap;

begin
  OHImage     := TNGbitmap(mng_get_userdata(HHHandle));

  with OHImage do
    IHWritten := OHImage.OFStream.Write(PHBuf^, IHBuflen);

  Result      := MNG_TRUE;
end;

{****************************************************************************}

function XNG_errorproc (HHHandle    : mng_handle;
                        IHErrorcode : mng_retcode;
                        IHSeverity  : mng_uint8;
                        IHChunkname : mng_chunkid;
                        IHChunkseq  : mng_uint32;
                        IHExtra1    : mng_int32;
                        IHExtra2    : mng_int32;
                        SHErrortext : mng_pchar ) : mng_bool; stdcall;
begin
  Result := MNG_TRUE;
end;

{****************************************************************************}

function XNG_processheader (HHHandle : mng_handle;
                            IHWidth  : mng_uint32;
                            IHHeight : mng_uint32) : mng_bool; stdcall;

var OHImage  : TNGbitmap;
    OHList   : TList;
    IHX      : integer;
    IHY      : integer;
    OHMaster : TNGImage;

begin
  OHImage := TNGbitmap(mng_get_userdata(HHHandle));

  with OHImage do
  begin
    Width        := IHWidth;
    Height       := IHHeight;
    HandleType   := bmDIB;
    PixelFormat  := pf24bit;
    BFHaveHeader := true;

    OHList       := TList.Create;
    try                                // notify our parents
      for IHX := OFImages.Count-1 downto 0 do
        OHList.Add(OFImages.Items[IHX]);

      IHX := OHList.Count;

      while (IHX > 0) do
      begin
        dec(IHX);
        OHMaster := TNGImage(OHList.Items[IHX]);
        IHY      := OFImages.IndexOf(OHMaster);

        if (IHY >= 0) and (assigned(OHMaster.OFProcessHeader)) then
          OHMaster.OFProcessHeader(OHMaster);
      end;

    finally
      OHList.Free;
    end;
  end;

  Result := MNG_TRUE;
end;

{****************************************************************************}

function XNG_getcanvasline (HHHandle : mng_handle;
                            IHLineNr : mng_uint32) : mng_ptr; stdcall;

var OHImage : TNGbitmap;

begin
  OHImage := TNGbitmap(mng_get_userdata(HHHandle));
  Result  := OHImage.ScanLine[IHLineNr];
end;

{****************************************************************************}

function XNG_getbkgdline (HHHandle : mng_handle;
                          IHLineNr : mng_uint32) : mng_ptr; stdcall;

var OHImage : TNGbitmap;

begin
  OHImage := TNGbitmap(mng_get_userdata(HHHandle));
  if assigned(OHImage.OFBGImage) then
    Result := OHImage.OFBGImage.ScanLine[IHLineNr]
  else
    Result := MNG_NULL;
end;

{****************************************************************************}

function XNG_refresh (HHHandle : mng_handle;
                      IHX, IHY : mng_uint32;
                      IHWidth  : mng_uint32;
                      IHHeight : mng_uint32) : mng_bool; stdcall;

var OHImage : TNGbitmap;

begin
  OHImage := TNGbitmap(mng_get_userdata(HHHandle));
  OHImage.Refresh(IHX, IHY, IHWidth, IHHeight);
  Result  := MNG_TRUE;
end;

{****************************************************************************}

function XNG_settimer (HHHandle : mng_handle;
                       IHMSecs  : mng_uint32) : mng_bool; stdcall;

var OHImage : TNGbitmap;

begin
  OHImage                  := TNGbitmap(mng_get_userdata(HHHandle));
  OHImage.OFTimer.Interval := IHMSecs;
  OHImage.OFTimer.Enabled  := true;
  Result                   := MNG_TRUE;
end;

{****************************************************************************}
{* internal object to facilitate reference counting of a LIBMNG handle      *}
{****************************************************************************}

constructor TNGBitmap.Create;
begin
  inherited;

  HandleType        := bmDIB;                    // we work with 24-bit DIBs only
  PixelFormat       := pf24bit;
  OFImages          := TList.Create;
  OFTimer           := TTimer.Create(nil);
  OFTimer.Enabled   := false;
  OFTimer.OnTimer   := ProcessTimer;
  BFHaveHeader      := false;

  IFAlphaColor      := -1;                       // no transparency supplied yet
  OFAlphaBitmap     := nil;
  OFBGImage         := nil;

{$IFDEF INCLUDE_ZLIB}
  IFZLIBLevel       := Z_BEST_COMPRESSION;       // ZLIB compression parameters
  IFZLIBMethod      := Z_DEFLATED;
  IFZLIBWindowbits  := 15;
  IFZLIBMemLevel    := Z_MAX_MEM_LEVEL;
  IFZLIBStrategy    := Z_DEFAULT_STRATEGY;
  IFZLIBMaxIDAT     := 65536;
{$ENDIF}

{$IFDEF INCLUDE_JPEG}
  IFJPEGQuality     := 90;                       // JPEG compression parameters
  BFJPEGProgressive := false;
  IFJPEGMaxJDAT     := 65536;
{$ENDIF}

  BFStatusCheck     := false;                    // initial libmng status
  BFCreating        := false;
  BFWriting         := false;
  BFReading         := false;
  BFDisplaying      := false;
  BFRunning         := false;

  // initialize the LIBMNG library
  HFHandle := mng_initialize(mng_ptr(self), XNG_alloc, XNG_free, nil);
  if HFHandle = MNG_NULL then
    LibMNG_Error(SCCreate + SCInitialize);

  // make sure we can save the file later
  if (mng_set_storechunks(HFHandle, MNG_TRUE) <> MNG_NOERROR) then
    LibMNG_Error(SCCreate + SCSetStoreChunks);

  // initialize the callback functions
  if (mng_setcb_openstream    (HFHandle, XNG_openstream   ) <> MNG_NOERROR) or
     (mng_setcb_closestream   (HFHandle, XNG_closestream  ) <> MNG_NOERROR) or
     (mng_setcb_readdata      (HFHandle, XNG_readdata     ) <> MNG_NOERROR) or
     (mng_setcb_writedata     (HFHandle, XNG_writedata    ) <> MNG_NOERROR) or
     (mng_setcb_errorproc     (HFHandle, XNG_errorproc    ) <> MNG_NOERROR) or
     (mng_setcb_processheader (HFHandle, XNG_processheader) <> MNG_NOERROR) or
     (mng_setcb_getcanvasline (HFHandle, XNG_getcanvasline) <> MNG_NOERROR) or
     (mng_setcb_refresh       (HFHandle, XNG_refresh      ) <> MNG_NOERROR) or
     (mng_setcb_gettickcount  (HFHandle, XNG_gettickcount ) <> MNG_NOERROR) or
     (mng_setcb_settimer      (HFHandle, XNG_settimer     ) <> MNG_NOERROR) then
    LibMNG_Error(SCCreate + SCSetCBxxxx);

  // initialize the canvas layout
  if (mng_set_canvasstyle     (HFHandle, MNG_CANVAS_BGR8  ) <> MNG_NOERROR) or
     (mng_set_bkgdstyle       (HFHandle, MNG_CANVAS_BGR8  ) <> MNG_NOERROR) then
    LibMNG_Error(SCCreate + SCSetCanvasStyle);

  CheckStatus;
end;

{****************************************************************************}

destructor TNGBitmap.Destroy;
begin
  // clean it up; let's start with the timer
  OFTimer.Enabled := false;
  if mng_cleanup(HFHandle) <> MNG_NOERROR then
    LibMNG_Error(SCDestroy + SCCleanup);

  OFBGImage.Free;  
  OFAlphaBitmap.Free;
  OFTimer.Free;
  OFImages.Free;
  inherited;
end;

{****************************************************************************}

procedure TNGBitmap.AddImage(OHImage: TNGImage);
begin
  // OFImages.Count is our silent reference-counter :-)
  OFImages.Add(OHImage);
end;

{****************************************************************************}

procedure TNGBitmap.RemoveImage(OHImage: TNGImage);
var
  IHX: integer;
begin
  IHX := OFImages.IndexOf(OHImage);
  if IHX >= 0 then
    OFImages.Delete(IHX);
end;

{***************************************************************************}

procedure TNGBitmap.SetTransImage(OHImage   : TBitmap);
  begin
  if OFAlphaBitmap <> OHImage then
    begin
    //si l'imager été alloué
    if assigned(OFAlphaBitmap) then
      OFAlphaBitmap.free;
    OFAlphaBitmap:=tbitmap.Create;
    OFAlphaBitmap.Assign(OHImage);
    end;
  end;

procedure TNGBitmap.SetBGImage(OHImage : TBitmap);
begin
  if (OFBGImage <> OHImage) then
  begin
    if assigned(OFBGImage) then
      OFBGImage.Free;

    if assigned(OHImage) then
    begin
      OFBGImage := TBitmap.Create;
      OFBGImage.Assign(OHImage);

      if (mng_setcb_getbkgdline(HFHandle, XNG_getbkgdline) <> MNG_NOERROR) then
        LibMNG_Error(SCSetBGImage + SCSetCBxxxx);
    end
    else
    begin
      OFBGImage := nil;

      if (mng_setcb_getbkgdline(HFHandle, nil) <> MNG_NOERROR) then
        LibMNG_Error(SCSetBGImage + SCSetCBxxxx);
    end;
  end;
end;

{***************************************************************************}

procedure TNGBitmap.CheckStatus;
var
  BHChanged    : boolean;
  BHReading    : boolean;
  BHCreating   : boolean;
  BHWriting    : boolean;
  BHDisplaying : boolean;
  BHRunning    : boolean;
  IHX, IHY     : integer;
  OHImage      : TNGImage;
  OHList       : TList;
begin
  if not BFStatusCheck then            // prevent recursion !!!
  begin
    BFStatusCheck  := true;

    try                                // get all status variables
      BHReading    := mng_status_reading(HFHandle);
      BHCreating   := mng_status_creating(HFHandle);
      BHWriting    := mng_status_writing(HFHandle);
      BHDisplaying := mng_status_displaying(HFHandle);
      BHRunning    := mng_status_running(HFHandle);
      BHChanged    := (BHReading <> BFReading) or (BHCreating   <> BFCreating  ) or
                      (BHWriting <> BFWriting) or (BHDisplaying <> BFDisplaying) or
                      (BHRunning <> BFRunning);
      BFReading    := BHReading;
      BFCreating   := BHCreating;
      BFWriting    := BHWriting;
      BFDisplaying := BHDisplaying;
      BFRunning    := BHRunning;

      if BHChanged then                // status changed ?
      begin
        OHList := TList.Create;

        try
          for IHX := OFImages.Count-1 downto 0 do
            OHList.Add(OFImages.Items[IHX]);

          IHX := OHList.Count;
                                       // notify our parents
          while (IHX > 0) do
          begin
            dec(IHX);
            OHImage := TNGImage(OHList.Items[IHX]);
            IHY     := OFImages.IndexOf(OHImage);

            if (IHY >= 0) and (assigned(OHImage.OFStatusChange)) then
              OHImage.OFStatusChange(OHImage);
          end;

        finally
          OHList.Free;
        end;
      end;

    finally
      BFStatusCheck := false;
    end;
  end;
end;

{****************************************************************************}

procedure TNGBitmap.LoadFromStream(Stream: TStream);
var
  IHRslt : mng_retcode;
begin
  OFStream      := Stream;
  BFFreeOnClose := false;

  // load it in a single go
  IHRslt        := mng_read(HFHandle);
  if (IHRslt <> MNG_NOERROR) then
    LibMNG_Error(SCLoadFromStream + SCRead);

  // now make sure the first frame is visible
  IHRslt        := mng_display(HFHandle);
  if (IHRslt <> MNG_NOERROR) and (IHRslt <> MNG_NEEDTIMERWAIT) then
    LibMNG_Error(SCLoadFromStream + SCDisplay);

  CheckStatus;
end;

{****************************************************************************}

procedure TNGBitmap.SaveToStream(Stream: TStream);
var
  IHRslt : mng_retcode;
begin
  OFStream      := Stream;
  BFFreeOnClose := false;

  // doesn't get easier than this...
  IHRslt        := mng_write(HFHandle);
  if IHRslt <> MNG_NOERROR then
    LibMNG_Error(SCSaveToStream + SCWrite);

  CheckStatus;
end;

{****************************************************************************}

procedure TNGBitmap.LoadFromFile(const FileName: string);
var
  IHRslt : mng_retcode;
begin
  OFStream      := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  BFFreeOnClose := true;

  // load it in a single go
  IHRslt        := mng_read(HFHandle);
  if (IHRslt <> MNG_NOERROR) then
    LibMNG_Error(SCLoadFromFile + SCRead);

  // now make sure the first frame is visible
  IHRslt        := mng_display(HFHandle);
  if (IHRslt <> MNG_NOERROR) and (IHRslt <> MNG_NEEDTIMERWAIT) then
    LibMNG_Error(SCLoadFromFile + SCDisplay);

  CheckStatus;
end;

{****************************************************************************}

procedure TNGBitmap.SaveToFile(const FileName: string);
var
  IHRslt : mng_retcode;
begin
  OFStream      := TFileStream.Create(FileName, fmCreate or fmShareExclusive);
  BFFreeOnClose := true;

  // doesn't get easier than this...
  IHRslt        := mng_write(HFHandle);
  if (IHRslt <> MNG_NOERROR) then
    LibMNG_Error(SCSaveToFile + SCWrite);

  CheckStatus;
end;

{****************************************************************************}

procedure TNGBitmap.LoadFromClipboardFormat(AFormat: Word; AData: THandle;
  APalette: HPALETTE);
begin
  // sorry; future extension (maybe)
  raise ENGImageException.Create(SCClipboardNotSupported);
end;

{****************************************************************************}

procedure TNGBitmap.SaveToClipboardFormat(var AFormat: Word;
  var AData: THandle; var APalette: HPALETTE);
begin
  // sorry; future extension (maybe)
  raise ENGImageException.Create(SCClipboardNotSupported);
end;

{****************************************************************************}

procedure TNGBitmap.ProcessTimer(Sender: TObject);
var
  IHRslt : mng_retcode;
begin
  // reset the timer; LIBMNG will set it again if necessary
  OFTimer.Enabled := false;
  // tell LIBMNG to fill the next frame
  IHRslt          := mng_display_resume(HFHandle);
  if (IHRslt <> MNG_NOERROR) and (IHRslt <> MNG_NEEDTIMERWAIT) then
    LibMNG_Error(SCProcessTimer + SCDisplayResume);

  CheckStatus;
end;

{****************************************************************************}

procedure TNGBitmap.Refresh(IHX, IHY: integer; IHWidth: integer;
  IHHeight: integer);
var
  IHQ : integer;
begin
  CheckStatus;
  // make sure all our referred images get updated
  for IHQ := OFImages.Count-1 downto 0 do
    { TODO:  Seems to occur here.  Something in the Images Refresh method }
    { Haven't had time to Trace into yet.  Sorry }
    TNGImage(OFImages.Items[IHQ]).Refresh(IHX, IHY, IHWidth, IHHeight);
end;

{****************************************************************************}

procedure TNGBitmap.Rewind;
var
  IHRslt : mng_retcode;
begin
  OFTimer.Enabled := false;
  if (mng_display_reset(HFHandle) <> MNG_NOERROR) then
    LibMNG_Error(SCRewind + SCDisplayReset);

  IHRslt := mng_display(HFHandle);
  if (IHRslt <> MNG_NOERROR) and (IHRslt <> MNG_NEEDTIMERWAIT) then
    LibMNG_Error(SCRewind + SCDisplay);

  CheckStatus;
end;

{****************************************************************************}

procedure TNGBitmap.Pause;
begin
  OFTimer.Enabled := false;
  if (mng_display_freeze(HFHandle) <> MNG_NOERROR) then
    LibMNG_Error(SCPause + SCDisplayFreeze);

  CheckStatus;
end;

{****************************************************************************}

procedure TNGBitmap.Play;
var
  IHRslt : mng_retcode;
begin
  OFTimer.Enabled := false;
  IHRslt          := mng_display_resume(HFHandle);
  if (IHRslt <> MNG_NOERROR) and (IHRslt <> MNG_NEEDTIMERWAIT) then
    LibMNG_Error(SCPlay + SCDisplayResume);

  CheckStatus;
end;

{****************************************************************************}

procedure TNGBitmap.Stop;
begin
  OFTimer.Enabled := false;
  if (mng_display_reset(HFHandle) <> MNG_NOERROR) then
    LibMNG_Error(SCRewind + SCDisplayReset);

  CheckStatus;
end;

{***************************************************************************}

{$IFDEF INCLUDE_PNG_SAVE}              // PNG save support ?
function TNGBitmap.CompressRawData(SHRawdata: string): string;
var
  IHBufLen : integer;
  IHRslt   : integer;
begin
  IHBufLen := length(SHRawData) + 1000;          // let's assume the worst

  repeat
    Result := StringOfChar(#0, IHBufLen);        // try a compress
    IHRslt := DeflateString2(SHRawData, Result, IFZLIBLevel, IFZLIBMethod,
                             IFZLIBWindowBits, IFZLIBMemLevel, IFZLIBStrategy);

    if IHRslt = Z_BUF_ERROR then                 // not enough bufferspace ?
      IHBufLen := IHBufLen + 1000;

  until (IHRslt <> Z_BUF_ERROR);                 // until done or error

  if IHRslt <> 0 then                            // just no result on error
    Result := '';
end;
{$ENDIF}

{****************************************************************************}

procedure TNGBitmap.CreatePNG;
var
  SHRawData   : string;
  SHRawData1  : string;
  SHRawData2  : string;
  SHRawData4  : string;
  SHRawData8  : string;
  IHBitDepth  : byte;
  IHColorType : byte;
  BHHasAlpha  : boolean;
  IHMaxCol    : integer;
  AHPalette   : mng_palette8;
  IHMaxAlpha  : integer;
  AHAlpha     : mng_uint8arr;
  AHCounts    : mng_uint32arr;
  AHDummy     : mng_uint8arr;

  { Start of Local Methods }
  {===========================================================================}

  function GetIndex (IHR, IHG, IHB, IHA : byte) : integer;
  begin
    Result := 0;

    while (Result < IHMaxCol) and ((AHPalette[Result].iRed   <> IHR) or
                                   (AHPalette[Result].iGreen <> IHG) or
                                   (AHPalette[Result].iBlue  <> IHB) or
                                   (AHAlpha[Result]          <> IHA)    ) do
      inc(Result);

    if (Result >= IHMaxCol) then
      Result := -1;
  end;

  {===========================================================================}

  function GetAlphaPixel (IHX, IHY : integer) : byte;
    begin
    if not OFAlphaBitmap.Monochrome then
      OFAlphaBitmap.Monochrome := true;
    Result :=OFAlphaBitmap.Canvas.Pixels[IHX, IHY] and $FF;
    end;

  {===========================================================================}

  function GetAlpha (PHPixel: PRGBpixel; IHX, IHY: integer): byte;
  begin
    if OFAlphaBitmap <> nil then
      {TODO: this is really inefficient; optimize !!! }
      Result := GetAlphaPixel(IHX, IHY)
    else
    if (IFAlphaColor >= 0) and (PHPixel^.R = (IFAlphaColor       ) and $FF) and
                               (PHPixel^.G = (IFAlphaColor shr  8) and $FF) and
                               (PHPixel^.B = (IFAlphaColor shr 16) and $FF) then
      Result := 0
    else
      Result := 255;
  end;

  {===========================================================================}

  procedure CalcNrOfUniques;
  var
    PHPixel  : PRGBpixel;
    IHX, IHY : integer;
    IHQ      : integer;
    IHR, IHG : byte;
    IHB, IHA : byte;
  begin
    BHHasAlpha := false;
    IHMaxCol   := 0;

    for IHY := 0 to pred(Height) do
      begin
      PHPixel := PRGBpixel(Scanline [IHY]);

      for IHX := 0 to pred(Width) do
      begin
        IHR := PHPixel^.R;
        IHG := PHPixel^.G;
        IHB := PHPixel^.B;
        IHA := GetAlpha(PHPixel, IHX, IHY);

        if IHA < 255 then                // indicate if we encountered transparency
          BHHasAlpha := true;

        if IHMaxCol <= 256 then          // no need to count beyond 256 entries
        begin
          IHQ := GetIndex(IHR, IHG, IHB, IHA);

          if (IHQ >= 0) and (IHQ < IHMaxCol) then
          begin
            AHCounts[IHQ] := AHCounts[IHQ] + 1;
          end
          else
          begin
            if IHMaxCol < 256 then
            begin
              AHPalette[IHMaxCol].iRed   := IHR;
              AHPalette[IHMaxCol].iGreen := IHG;
              AHPalette[IHMaxCol].iBlue  := IHB;
              AHAlpha[IHMaxCol]          := IHA;
              AHCounts[IHMaxCol]         := 1;
            end;

            inc(IHMaxCol);
          end;
        end;

        PHPixel := PRGBpixel(integer(PHPixel) + 3);
      end;
    end;
  end;

  {===========================================================================}

  procedure OptimizePalette;
  var
    IHX, IHY : integer;

    {===========================================================================}
    { Start of OptimizePalette Local Method }
    procedure SwapEntry (IHX, IHY : integer);
    var
      IHB : byte;
      IHI : mng_uint32;
    begin
      IHB                   := AHPalette[IHX].iRed;
      AHPalette[IHX].iRed   := AHPalette[IHY].iRed;
      AHPalette[IHY].iRed   := IHB;
      IHB                   := AHPalette[IHX].iGreen;
      AHPalette[IHX].iGreen := AHPalette[IHY].iGreen;
      AHPalette[IHY].iGreen := IHB;
      IHB                   := AHPalette[IHX].iBlue;
      AHPalette[IHX].iBlue  := AHPalette[IHY].iBlue;
      AHPalette[IHY].iBlue  := IHB;
      IHB                   := AHAlpha[IHX];
      AHAlpha[IHX]          := AHAlpha[IHY];
      AHAlpha[IHY]          := IHB;
      IHI                   := AHCounts[IHX];
      AHCounts[IHX]         := AHCounts[IHY];
      AHCounts[IHY]         := IHI;
    end;

    {===========================================================================}
    { END of OptimizePalette Local Method }

  begin
    // optimizing the palette
    // put transparent items first
    // both opaque or both transparent sorts on decreasing hist-count
    for IHX := 0 to pred(IHMaxCol) do
    begin
      for IHY := succ(IHX) to pred(IHMaxCol) do
      begin
        if (AHAlpha[IHX] = 255) and (AHAlpha[IHY] = 255) then
        begin
          if AHCounts[IHX] < AHCounts[IHY] then
            SwapEntry(IHX, IHY);
        end
        else
        if (AHAlpha[IHX] = 255) and (AHAlpha[IHY] < 255) then
        begin
          SwapEntry(IHX, IHY);
        end
        else
        if (AHAlpha[IHX] < 255) and (AHAlpha[IHY] < 255) then
        begin
          if AHCounts[IHX] < AHCounts[IHY+1] then
            SwapEntry(IHX, IHY);
        end;
      end;
    end;

    // since all transparent items are first in the palette
    // we can safely discard the ones at the back which are fully opaque
    IHMaxAlpha := IHMaxCol;
    while (IHMaxAlpha > 0) and (AHAlpha[IHMaxAlpha-1] = 255) do
      dec (IHMaxAlpha);
  end;

  {===========================================================================}

  procedure CreateIndexedData1;
  var
    IHX, IHY : integer;
    IHR      : integer;
    IHQ      : integer;
    PHPixel  : PRGBpixel;
    IHLineW  : integer;
  begin
    IHLineW    := ((Width + 7) shr 3) + 1;
    SHRawData1 := StringOfChar(#0, IHLineW * Height);

    for IHY := 0 to pred(Height) do
    begin
      PHPixel := PRGBpixel(Scanline [IHY]);
      IHR     := (IHY * IHLineW) + 2;

      for IHX := 0 to pred(Width) do
      begin
        IHQ := GetIndex(PHPixel^.R, PHPixel^.G, PHPixel^.B, GetAlpha(PHPixel, IHX, IHY));

        case (IHX mod 8) of
          0 : SHRawData1[IHR] := chr((IHQ and $01) shl 7);
          1 : SHRawData1[IHR] := chr(ord(SHRawData1[IHR]) + (IHQ and $01) shl 6);
          2 : SHRawData1[IHR] := chr(ord(SHRawData1[IHR]) + (IHQ and $01) shl 5);
          3 : SHRawData1[IHR] := chr(ord(SHRawData1[IHR]) + (IHQ and $01) shl 4);
          4 : SHRawData1[IHR] := chr(ord(SHRawData1[IHR]) + (IHQ and $01) shl 3);
          5 : SHRawData1[IHR] := chr(ord(SHRawData1[IHR]) + (IHQ and $01) shl 2);
          6 : SHRawData1[IHR] := chr(ord(SHRawData1[IHR]) + (IHQ and $01) shl 1);
        else  SHRawData1[IHR] := chr(ord(SHRawData1[IHR]) + (IHQ and $01));
        end;

        PHPixel := PRGBpixel(integer(PHPixel) + 3);

        if (IHX mod 8) = 7 then
          inc(IHR);
      end;
    end;

    SHRawData1 := CompressRawData(SHRawData1);
  end;

  {===========================================================================}

  procedure CreateIndexedData2;
  var
    IHX, IHY : integer;
    IHR      : integer;
    IHQ      : integer;
    PHPixel  : PRGBpixel;
    IHLineW  : integer;
  begin
    IHLineW     := ((Width + 3) shr 2) + 1;
    SHRawData2  := StringOfChar(#0, IHLineW * Height);

    for IHY := 0 to pred(Height) do
    begin
      PHPixel := PRGBpixel(Scanline[IHY]);
      IHR     := (IHY * IHLineW) + 2;

      for IHX := 0 to pred(Width) do
      begin
        IHQ := GetIndex(PHPixel^.R, PHPixel^.G, PHPixel^.B, GetAlpha(PHPixel, IHX, IHY));

        case (IHX mod 4) of
          0 : SHRawData2[IHR] := chr((IHQ and $03) shl 6);
          1 : SHRawData2[IHR] := chr(ord(SHRawData2[IHR]) + (IHQ and $03) shl 4);
          2 : SHRawData2[IHR] := chr(ord(SHRawData2[IHR]) + (IHQ and $03) shl 2);
        else  SHRawData2[IHR] := chr(ord(SHRawData2[IHR]) + (IHQ and $03));
        end;

        PHPixel := PRGBpixel(integer(PHPixel) + 3);

        if (IHX mod 4) = 3 then
          inc(IHR);
      end;
    end;

    SHRawData2 := CompressRawData(SHRawData2);
  end;

  {===========================================================================}

  procedure CreateIndexedData4;
  var
    IHX, IHY : integer;
    IHR      : integer;
    IHQ      : integer;
    PHPixel  : PRGBpixel;
    IHLineW  : integer;
  begin
    IHLineW    := ((Width + 1) shr 1) + 1;
    SHRawData4 := StringOfChar (#0, IHLineW * Height);

    for IHY := 0 to pred(Height) do
    begin
      PHPixel := PRGBpixel(Scanline[IHY]);
      IHR     := (IHY * IHLineW) + 2;

      for IHX := 0 to pred(Width) do
      begin
        IHQ := GetIndex(PHPixel^.R, PHPixel^.G, PHPixel^.B, GetAlpha(PHPixel, IHX, IHY));

        if (IHX mod 2) = 0 then
          SHRawData4[IHR] := chr((IHQ and $0F) shl 4)
        else
          SHRawData4[IHR] := chr(ord(SHRawData4[IHR]) + (IHQ and $0F));

        PHPixel := PRGBpixel(integer(PHPixel) + 3);

        if (IHX mod 2) = 1 then
          inc(IHR);
      end;
    end;

    SHRawData4 := CompressRawData(SHRawData4);
  end;

  {===========================================================================}

  procedure CreateIndexedData8;
  var
    IHX, IHY : integer;
    IHR      : integer;
    PHPixel  : PRGBpixel;
  begin
    SHRawData8 := StringOfChar(#0, (Width + 1) * Height);

    for IHY := 0 to pred(Height) do
    begin
      PHPixel := PRGBpixel(Scanline[IHY]);
      IHR     := (IHY * (Width + 1)) + 2;

      for IHX := 0 to pred(Width) do
      begin
        SHRawData8[IHR] := chr(GetIndex(PHPixel^.R, PHPixel^.G, PHPixel^.B,
                                        GetAlpha(PHPixel, IHX, IHY)));
        PHPixel         := PRGBpixel(integer(PHPixel) + 3);
        inc(IHR);
      end;
    end;

    SHRawData8 := CompressRawData(SHRawData8);
  end;

  {===========================================================================}

  procedure CreateRGBAdata8;
  var
    IHX, IHY : integer;
    IHR      : integer;
    PHPixel  : PRGBpixel;
	begin
		SHRawData   := StringOfChar(#0, ((Width shl 2) + 1) * Height);
		IHBitDepth  := 8;                    // 8-bit RGBA
		IHColorType := 6;

		for IHY := 0 to pred(Height) do
		begin
			PHPixel := PRGBpixel(Scanline[IHY]);
			IHR     := (IHY * ((Width shl 2) + 1)) + 2;

			for IHX := 0 to pred(Width) do
      begin
        SHRawData[IHR] := chr(PHPixel^.R); inc(IHR);
        SHRawData[IHR] := chr(PHPixel^.G); inc(IHR);
        SHRawData[IHR] := chr(PHPixel^.B); inc(IHR);
        SHRawData[IHR] := chr(GetAlpha(PHPixel, IHX, IHY)); inc(IHR);
        PHPixel        := PRGBpixel(integer(PHPixel) + 3);
      end;
    end;
  end;

  {===========================================================================}

  procedure CreateRGBdata8;
  var
    IHX, IHY : integer;
    IHR      : integer;
    PHPixel  : PRGBpixel;
  begin
    SHRawData   := StringOfChar(#0, ((Width * 3) + 1) * Height);
    IHBitDepth  := 8;                    // 8-bit RGB
    IHColorType := 2;
    for IHY := 0 to pred(Height) do
    begin

      PHPixel := PRGBpixel(Scanline[IHY]);
      IHR     := (IHY * ((Width * 3) + 1)) + 2;

      for IHX := 0 to pred(Width) do
      begin
        SHRawData[IHR] := chr(PHPixel^.R); inc(IHR);
        SHRawData[IHR] := chr(PHPixel^.G); inc(IHR);
        SHRawData[IHR] := chr(PHPixel^.B); inc(IHR);
        PHPixel        := PRGBpixel(integer(PHPixel) + 3);
      end;
    end;
  end;

  {===========================================================================}
  { END of Local Methods }

{ Start of TNGBitmap.CreatePNG Code }
begin
  PixelFormat := pf24bit;              // we always want it in this format !!
  //PixelFormat := pf32bit;
  //BHHasAlpha:=True;
  CalcNrOfUniques;                     // let's see if we can optimize to indexed-color

  if (IHMaxCol <= 256) then            // can we... can we ???
  begin
    OptimizePalette;                   // make it an optimum palette then
    IHColorType := 3;                  // indexed color!

    if (IHMaxCol <= 2) then
    begin
      CreateIndexedData1;              // determine best possible compression
      CreateIndexedData2;
      CreateIndexedData4;
      CreateIndexedData8;

      if (length(SHRawData1) < length(SHRawData2)) and
         (length(SHRawData1) < length(SHRawData4)) and
         (length(SHRawData1) < length(SHRawData8)) then
      begin
        SHRawData  := SHRawData1;
        IHBitDepth := 1;
      end
      else
      if (length(SHRawData2) < length(SHRawData4)) and
         (length(SHRawData2) < length(SHRawData8)) then
      begin
        SHRawData  := SHRawData2;
        IHBitDepth := 2;
      end
      else
      if length(SHRawData4) < length(SHRawData8) then
      begin
        SHRawData  := SHRawData4;
        IHBitDepth := 4;
      end
      else
      begin
        SHRawData  := SHRawData8;
        IHBitDepth := 8;
      end;
    end
    else
    if IHMaxCol <= 4 then
    begin
      CreateIndexedData2;              // determine best possible compression
      CreateIndexedData4;
      CreateIndexedData8;

      if (length(SHRawData2) < length(SHRawData4)) and
         (length(SHRawData2) < length(SHRawData8)) then
      begin
        SHRawData  := SHRawData2;
        IHBitDepth := 2;
      end
      else
      if length(SHRawData4) < length(SHRawData8) then
      begin
        SHRawData  := SHRawData4;
        IHBitDepth := 4;
      end
      else
      begin
        SHRawData  := SHRawData8;
        IHBitDepth := 8;
      end;
    end
    else
    if IHMaxCol <= 16 then
    begin
      CreateIndexedData4;              // determine best possible compression
      CreateIndexedData8;

      if length(SHRawData4) < length(SHRawData8) then
      begin
        SHRawData  := SHRawData4;
        IHBitDepth := 4;
      end
      else
      begin
        SHRawData  := SHRawData8;
        IHBitDepth := 8;
      end;
    end
    else
    begin
      CreateIndexedData8;              // always 8-bit here
      SHRawData    := SHRawData8;
      IHBitDepth   := 8;
    end;
  end
  else
  begin
    if BHHasAlpha then                 // do we need the alpha channel ?
      CreateRGBAdata8
    else
      CreateRGBdata8;

    SHRawData := CompressRawData(SHRawData);
  end;

  if (SHRawData = '') then             // ZLIB got botched ?
    raise ENGImageException.Create(SCZLIBError);
                                       // now create the PNG chunks
  if (mng_reset(HFHandle) <> MNG_NOERROR) then
    LibMNG_Error(SCCreatePNG + SCReset2);

  if (mng_create(HFHandle) <> MNG_NOERROR) then
    LibMNG_Error(SCCreatePNG + SCCreate2);

  if (mng_putchunk_ihdr(HFHandle, Width, Height, IHBitdepth,
                        IHColortype, 0, 0, 0) <> MNG_NOERROR) then
    LibMNG_Error(SCCreatePNG + SCPutChunkIHDR);

  if (mng_putchunk_srgb(HFHandle, MNG_FALSE, 0) <> MNG_NOERROR) then
    LibMNG_Error(SCCreatePNG + SCPutChunkSRGB);

  if (IHColorType = 3) then
  begin
    if (mng_putchunk_plte(HFHandle, IHMaxCol, AHPalette) <> MNG_NOERROR) then
      LibMNG_Error(SCCreatePNG + SCPutChunkPLTE);

    if (IHMaxAlpha > 0) then
      if (mng_putchunk_trns(HFHandle, MNG_FALSE, MNG_FALSE, 3, IHMaxAlpha,
                            AHAlpha, 0, 0, 0, 0, 0, AHDummy) <> MNG_NOERROR) then
        LibMNG_Error(SCCreatePNG + SCPutChunkTRNS);
  end;
                                       // write approprietely sized data chunks
  while (length(SHRawdata) > LongInt(IFZLIBMaxIDAT)) do
  begin
    if (mng_putchunk_idat(HFHandle, IFZLIBMaxIDAT, @SHRawdata [1]) <> MNG_NOERROR) then
      LibMNG_Error(SCCreatePNG + SCPutChunkIDAT);
    delete(SHRawData, 1, IFZLIBMaxIDAT);
  end;

  if (SHRawdata <> '') then
    if mng_putchunk_idat(HFHandle, length (SHRawdata), @SHRawdata [1]) <> MNG_NOERROR then
      LibMNG_Error(SCCreatePNG + SCPutChunkIDAT);

  if (mng_putchunk_iend(HFHandle) <> MNG_NOERROR) then
    LibMNG_Error(SCCreatePNG + SCPutChunkIEND);

  CheckStatus;
end; {TNGBitmap.CreatePNG}

{****************************************************************************}

{$IFDEF INCLUDE_JNG_SAVE}
procedure TNGBitmap.CreateJNG;
var
  SHJDAT        : string;
  SHIDAT        : string;
  IHColorType   : byte;
  IHAlphaDepth  : byte;
  OHJPEG        : TJPEGimage;
  IHX, IHY      : integer;
  IHZ           : integer;
  OHBitmap      : TBitmap;
  IHR, IHG, IHB : byte;
  // added 4 lines by Peter J. Haas
  SHIDATLineSize: Integer;
  ImageLineSize : Integer;
  ImageLinePtr  : PByte;
  ImagePixelPtr : PRGBTriple;

// function(s) added by Peter J. Haas
{$ifdef AlphaColorTo1BitAlpha}
procedure SetPixelToFullyTransparent(X, Y: Integer);
const
  cBitMask8 : array[0..7] of Byte = ($7F, $BF, $DF, $EF, $F7, $FB, $FD, $FE);
var
  p: PByte;
begin
  p := Pointer(SHIDAT);
  Inc(p, (SHIDATLineSize * Y) + (X shr 3) + 1);
  p^ := p^ and cBitMask8[X and $07];
end;
{$else}
procedure SetPixelToFullyTransparent(X, Y: Integer);
var
  p: PByte;
begin
  p := Pointer(SHIDAT);
  Inc(p, (SHIDATLineSize * Y) + X + 1);
  p^ := $00;
end;
{$endif}
// end of added

begin
  PixelFormat  := pf24bit;             // we always want it in this format!!
  SHIDAT       := '';                  // assume no alpha
  IHColorType  := 10;                  // and RGB format
  // add 1 line by Peter J. Haas
  IHAlphaDepth := 0;

  OHJPEG := TJPEGimage.Create;
  try
    OHJPEG.Assign(self);               // let's get the JPEG data-stream
    OHJPEG.ProgressiveEncoding := BFJPEGProgressive;
    OHJPEG.CompressionQuality  := IFJPEGQuality;
    OHJPEG.Compress;

    SHJDAT := StringOfChar(#0, OHJPEG.PData.PData.Size);
    move(OHJPEG.PData.PData.Memory^, SHJDAT[1], length(SHJDAT));

  finally
    OHJPEG.Free;
  end;

  if OFAlphaBitmap <> nil then         // do we have a transparency bitmap ?
  begin
    {TODO: this bit can really use some optimization !!! }
    OHBitmap := TBitmap.Create;

    try
      OHBitmap.Width      := Width;
      OHBitmap.Height     := Height;
      OHBitmap.Monochrome := true;
      OHBitmap.Canvas.StretchDraw(Rect(0, 0, Width, Height), OFAlphaBitmap);

      IHColorType := IHColorType + 4;
      // added 1 line by Peter J. Haas
      IHAlphaDepth := 8;
      SHIDAT      := StringOfChar(#0, (Width + 1) * Height);
      IHZ         := 1;

      for IHY := 0 to pred(Height) do
      begin
        inc(IHZ);
        for IHX := 0 to pred(Width) do
        begin
          SHIDAT[IHZ] := chr(OHBitmap.Canvas.Pixels[IHX, IHY] and $FF);
          inc(IHZ);
        end;
      end;

    finally
      OHBitmap.Free;
    end;
  end
  else
  if IFAlphaColor >= 0 then            // do we have a transparency color ?
  begin
    // changed by Peter J. Haas
{    IHR         := (IFAlphaColor       ) and $FF;
    IHG         := (IFAlphaColor shr  8) and $FF;
    IHB         := (IFAlphaColor shr 16) and $FF;
    IHColorType := IHColorType + 4;
    SHIDAT      := StringOfChar (#0, (Width + 1) * Height);
    IHZ         := 1;

    for IHY := 0 to pred(Height) do
    begin
      inc (IHZ);
      PHPixel := PRGBpixel (Scanline [IHY]);

      for IHX := 0 to pred(Width) do
      begin
        if (PHPixel^.R = IHR) and (PHPixel^.G = IHG) and (PHPixel^.B = IHB) then
          SHIDAT [IHZ] := #0
        else
          SHIDAT [IHZ] := #255;

        inc (IHZ);
        PHPixel := PRGBpixel (integer (PHPixel) + 3);
      end;
    end; }
    IHColortype    := IHColorType + 4;         // add Alpha to Color type
    {$ifdef AlphaColorTo1BitAlpha}
    IHAlphaDepth   := 1;                       // 1 bit Alpha
    SHIDATLineSize := ((Width + 7) div 8) + 1;
    {$else}
    IHAlphaDepth   := 8;                       // 8 bit Alpha
    SHIDATLineSize := Width + 1;
    {$endif}
    ImageLineSize := ((Width * 24 + 31) div 32) * 4;

    // Init alpha mask
    SHIDAT := StringOfChar(#$FF, SHIDATLineSize * Height);  // fully opaque
    // set PNG filter byte to 0
    ImageLinePtr := Pointer(SHIDAT);
    for IHY := 0 to Height-1 do
    begin
      ImageLinePtr^ := 0;
      Inc(ImageLinePtr, SHIDATLineSize);
    end;

    // check image for TransparentColor
    IHR := (IFAlphaColor       ) and $FF;
    IHG := (IFAlphaColor shr  8) and $FF;
    IHB := (IFAlphaColor shr 16) and $FF;

    ImageLinePtr := Scanline[0];
    for IHY := 0 to Height-1 do
    begin
      ImagePixelPtr := PRGBTriple(ImageLinePtr);
      for IHX := 0 to Width-1 do
      begin
        if (ImagePixelPtr^.rgbtBlue  = IHB) and
           (ImagePixelPtr^.rgbtGreen = IHG) and
           (ImagePixelPtr^.rgbtRed   = IHR) then
          SetPixelToFullyTransparent(IHX, IHY);
        Inc(ImagePixelPtr);
      end;
      Dec(ImageLinePtr, ImageLineSize);
    end;
    // end of change by Peter J. Haas
  end;

  {TODO: optimize alpha-channel to 1-/2-/4-bit if possible}

                                       // now create the JNG chunks
  if (mng_reset(HFHandle) <> MNG_NOERROR) then
    LibMNG_Error(SCCreateJNG + SCReset2);

  if (mng_create(HFHandle) <> MNG_NOERROR) then
    LibMNG_Error(SCCreateJNG + SCCreate2);

  if (mng_putchunk_jhdr(HFHandle, Width, Height, IHColortype,
                        8, 8, 0, IHAlphaDepth, 0, 0, 0) <> MNG_NOERROR) then
    LibMNG_Error(SCCreateJNG + SCPutChunkJHDR);

  if (mng_putchunk_srgb(HFHandle, MNG_FALSE, 0) <> MNG_NOERROR) then
    LibMNG_Error(SCCreateJNG + SCPutChunkSRGB);

  if (SHIDAT <> '') then               // transparency present ?
  begin
    SHIDAT := CompressRawData(SHIDAT); // compress it
    if (SHIDAT = '') then              // ZLIB got botched ?
      raise ENGImageException.Create(SCZLIBerror);
                                       // now write approprietely sized chunks
    while (length(SHIDAT) > LongInt(IFZLIBMaxIDAT)) do
    begin
      if (mng_putchunk_idat(HFHandle, IFZLIBMaxIDAT, @SHIDAT[1]) <> MNG_NOERROR) then
        LibMNG_Error(SCCreateJNG + SCPutChunkIDAT);
      delete(SHIDAT, 1, IFZLIBMaxIDAT);
    end;

    if (SHIDAT <> '') then
      if (mng_putchunk_idat(HFHandle, length (SHIDAT), @SHIDAT[1]) <> MNG_NOERROR) then
        LibMNG_Error(SCCreateJNG + SCPutChunkIDAT);
  end;
                                       // write approprietely sized data chunks
  while (length(SHJDAT) > LongInt(IFJPEGMaxJDAT)) do
  begin
    if (mng_putchunk_jdat(HFHandle, IFJPEGMaxJDAT, @SHJDAT[1]) <> MNG_NOERROR) then
      LibMNG_Error(SCCreateJNG + SCPutChunkJDAT);
    delete(SHJDAT, 1, IFJPEGMaxJDAT);
  end;

  if (SHJDAT <> '') then
    if (mng_putchunk_jdat(HFHandle, length (SHJDAT), @SHJDAT[1]) <> MNG_NOERROR) then
      LibMNG_Error(SCCreateJNG + SCPutChunkJDAT);

  if (mng_putchunk_iend(HFHandle) <> MNG_NOERROR) then
    LibMNG_Error(SCCreateJNG + SCPutChunkIEND);

  CheckStatus;
end;
{$ENDIF} // INCLUDE_JNG_SAVE

{****************************************************************************}

function TNGBitmap.Assign_Dot_by_dot(hwin:hwnd; un_bitmap:graphics.tbitmap):boolean;
  var i,j:integer;
      un_cran_avant:integer;
      oldcursor:hcursor;
      mon_image_rapide:U_fast_bitmap.TFastBitmap2;
      une_image_rapide_deux:U_fast_bitmap.TFastBitmap2;
      percentage:integer;
  begin
  Assign_Dot_by_dot:=false;
  une_image_rapide_deux.Copy(un_bitmap);
  self.Width:=un_bitmap.Width;
  self.Height:=un_bitmap.Height;
  un_cran_avant:=pred(self.Width);
  mon_image_rapide.Copy(self);
  for i:=0 to un_cran_avant do
    begin
    for j:=0 to pred(self.height) do
      begin
      mon_image_rapide.SetPixel_in_limite(i,j,
        une_image_rapide_deux.GetPixel_in_limite(i,j));
      end; {for j}
    end; {for i}
  try
    try
      Self.CreatePNG;
      Assign_Dot_by_dot:=true;
    except on EOutOfMemory do
      end;
  finally
    end;
  end; {TNGBitmap.Assign_Dot_by_dot}
  
{****************************************************************************}

procedure TNGBitmap.LibMNG_Error(SHMsg: string);
var
  iErrorcode : mng_uint32;
  iSeverity  : mng_uint8;
  iChunkname : mng_chunkid;
  iChunkseq  : mng_uint32;
  iExtra1    : mng_int32;
  iExtra2    : mng_int32;
  zErrortext : mng_pchar;
begin
  // extract extended error information
  iErrorcode := mng_getlasterror(HFHandle, iSeverity, iChunkname, iChunkseq,
                                           iExtra1, iExtra2, zErrortext);
  // and dump
  raise ENGImageException.CreateFmt(SCNGImageException,
                                    [strpas (zErrortext), iErrorcode, iSeverity,
                                     iChunkseq, iExtra1, iExtra2]);
end;

{****************************************************************************}
{* The PNG/JNG/MNG base class                                               *}
{****************************************************************************}

constructor TNGImage.Create;
begin
  inherited;
  OFCanvas       := nil;
  OFRect         := rect(0,0,1,1);
  HFCanvasParent := 0;
  BFRefreshing   := false;
  OFBitmap       := nil;
  OFStatusChange := nil;

  CreateBitmap;
end;

{****************************************************************************}

destructor TNGImage.Destroy;
begin
  // prevent animation redraws after we've been sentenced to die
  OFCanvas := nil;
  DestroyBitmap;
  inherited;
end;

{****************************************************************************}

procedure TNGImage.Free;
begin
  // prevent animation redraws after we've been sentenced to die
  OFCanvas := nil;
  OFBitmap.RemoveImage(self);
  inherited;
end;

{****************************************************************************}

procedure TNGImage.CreateBitmap;
begin
  // create a "reference-counter" object and sign myself up
  OFBitmap := TNGBitmap.Create;
  OFBitmap.AddImage(self);
end;

{****************************************************************************}

procedure TNGImage.DestroyBitmap;
begin
  // sign myself off from the "reference-counter" object
  OFBitmap.RemoveImage(self);
  // if the receference count has reached rockbottom clean up the object
  if (OFBitmap.OFImages.Count <= 0) then
    OFBitmap.Free;
end;

{****************************************************************************}

procedure TNGImage.AssignBitmap(OHBitmap: TNGBitmap);
begin
  // detach from the original "reference-counter" object
  DestroyBitmap;
  // attach to the given object
  OFBitmap := OHBitmap;
  OFBitmap.AddImage(self);
end;

{****************************************************************************}

procedure TNGImage.IsolateBitmap;
begin
  // detach and create new "reference-counter" object if we're sharing it
  if (OFBitmap.OFImages.Count > 1) then
  begin
    DestroyBitmap;
    CreateBitmap;
  end;
end;

{****************************************************************************}

procedure TNGImage.LoadFromStream(Stream: TStream);
begin
  //detach and create new "reference-counter" object if we're sharing it
  IsolateBitmap;
  // let the object do it's work
  OFBitmap.LoadFromStream(Stream);
end;

{****************************************************************************}

procedure TNGImage.SaveToStream(Stream: TStream);
begin
  // let the object do it's work
  OFBitmap.SaveToStream(Stream);
end;

{****************************************************************************}

procedure TNGImage.LoadFromFile(const FileName: string);
begin
  // detach and create new "reference-counter" object if we're sharing it
  IsolateBitmap;
  // let the object do it's work
  OFBitmap.LoadFromFile(FileName);
end;

{****************************************************************************}

procedure TNGImage.SaveToFile(const FileName: string);
begin
  // let the object do it's work
  OFBitmap.SaveToFile(FileName);
end;

{****************************************************************************}

procedure TNGImage.LoadFromClipboardFormat(AFormat: Word; AData: THandle;
  APalette: HPALETTE);
begin
  // let the object do it's work
  OFBitmap.LoadFromClipboardFormat(AFormat, AData, APalette);
end;

{****************************************************************************}

procedure TNGImage.SaveToClipboardFormat(var AFormat: Word;
  var AData: THandle; var APalette: HPALETTE);
begin
  // let the object do it's work
  OFBitmap.SaveToClipboardFormat(AFormat, AData, APalette);
end;

{****************************************************************************}

function  TNGImage.GetHeight: integer;
begin
  // let the object do it's work
  Result := OFBitmap.Height;
end;

{****************************************************************************}

function  TNGImage.GetWidth: integer;
begin
  // let the object do it's work
  Result := OFBitmap.Width;
end;

{****************************************************************************}

function TNGImage.GetEmpty: boolean;
begin
  // was LIBMNG initialized?
  Result := (OFBitmap.HFHandle = nil);
end;

{****************************************************************************}

procedure TNGImage.SetHeight(Value: integer);
begin
  // let the object do it's work
  OFBitmap.Height := Value;
end;

{****************************************************************************}

procedure TNGImage.SetWidth(Value: integer);
begin
  // let the object do it's work
  OFBitmap.Width := Value;
end;

{****************************************************************************}

procedure TNGImage.Assign(Source: TPersistent);
begin
  // if it's family, let's do some reference counting and share the LIBMNG handle
  if (Source is TNGImage) then
    AssignBitmap(TNGImage(Source).OFBitmap)
  else
  if (Source is TBitmap) then          // is it a TBitmap (or descendant) ?
  begin
    DestroyBitmap;                     // create virgin libmng handle!
    CreateBitmap;
    OFBitmap.Assign(Source);
  end;
end;

{****************************************************************************}

procedure TNGImage.Draw(ACanvas: TCanvas; const Rect: TRect);
begin
  // remember that sucker for animations
  OFCanvas := ACanvas;
  OFRect   := Rect;

  // this mockup to prevent 'Invalid Window Handle' on OpenPictureDialog (blergh)
{$IFDEF VER140}     // Borland changed the TOpenPictureDialog design in D6 !!!
  if ACanvas is TControlCanvas then
    if TControlCanvas(ACanvas).Control is TImage then
      if TImage(TControlCanvas(ACanvas).Control).Parent <> nil then
        HFCanvasParent := TImage(TControlCanvas(ACanvas).Control).Parent.Handle;
{$ELSE}
  if ACanvas is TControlCanvas then
    if TControlCanvas(ACanvas).Control is TPaintBox then
      if TPaintBox(TControlCanvas(ACanvas).Control).Parent <> nil then
        HFCanvasParent := TPaintBox(TControlCanvas(ACanvas).Control).Parent.Handle;
{$ENDIF}
  // ...can it get any uglier than this?....

  // all that's left is to refresh
  Refresh(0, 0, Width, Height);
end;

{****************************************************************************}

procedure TNGImage.Refresh(IHX, IHY: integer; IHWidth: integer;
  IHHeight: integer);

var HHDC : HDC;

begin
  // be sure we have something to paint to and aren't repeating ourself
  if (OFCanvas <> nil) and (not BFRefreshing) and
     (OFBitmap.BFHaveHeader) and
     ( (HFCanvasParent = 0) or (IsWindow(HFCanvasParent)) ) then
  begin
    BFRefreshing := true;
    try
//      OFCanvas.StretchDraw (OFRect, OFBitmap);

      // code by Phil Scadden to prevent 256->16 palette reduction bug
      // (will this work??? OFBitmap doesn't have a palette IMHO...)
      HHDC := OFBitmap.Handle;
      RealizePalette(HHDC);
      HHDC := OFCanvas.Handle;
      SetStretchBltMode(HHDC, Stretch_deleteScans);
      SelectPalette(HHDC, OFBitmap.Palette, false);
      RealizePalette(HHDC);
      OFCanvas.CopyRect(OFRect, OFBitmap.Canvas, OFBitmap.Canvas.ClipRect);
      // end of code by Phil Scadden

    finally
      BFRefreshing := false;
    end;
  end;
end;

{****************************************************************************}

procedure TNGImage.MNG_Rewind;
begin
  OFBitmap.Rewind;
end;

{****************************************************************************}

procedure TNGImage.MNG_Pause;
begin
  OFBitmap.Pause;
end;

{****************************************************************************}

procedure TNGImage.MNG_Play;
begin
  OFBitmap.Play;
end;

{****************************************************************************}

procedure TNGImage.MNG_Stop;
begin
  OFBitmap.Stop;
end;

{****************************************************************************}

function TNGImage.GetLIBMNGVersionText: String;
begin
  Result := StrPas(mng_version_text);
end;

{****************************************************************************}

function TNGImage.GetLIBMNGVersionDLL: integer;
begin
  Result := mng_version_dll;
end;

{****************************************************************************}

function TNGImage.GetLIBMNGVersionMajor: integer;
begin
  Result := mng_version_major;
end;

{****************************************************************************}

function TNGImage.GetLIBMNGVersionMinor: integer;
begin
  Result := mng_version_minor;
end;

{****************************************************************************}

function TNGImage.GetLIBMNGVersionRelease: integer;
begin
  Result := mng_version_release;
end;

{****************************************************************************}

function TNGImage.GetSignatureType: mng_imgtype;
begin
  Result :=  mng_get_sigtype(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetImageType: mng_imgtype;
begin
  Result := mng_get_imagetype(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetTicks: cardinal;
begin
  Result := mng_get_ticks(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetFrameCount: cardinal;
begin
  Result := mng_get_framecount(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetLayerCount: cardinal;
begin
  Result := mng_get_layercount(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetPlayTime: cardinal;
begin
  Result := mng_get_playtime(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetSimplicity: cardinal;
begin
  Result := mng_get_simplicity(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetBitdepth: byte;
begin
  Result := mng_get_bitdepth(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetColorType: byte;
begin
  Result := mng_get_colortype(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetCompression: byte;
begin
  Result := mng_get_compression(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetFilter: byte;
begin
  Result := mng_get_filter(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetInterlaceMethod: byte;
begin
  Result := mng_get_interlace(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetAlphaBitdepth: byte;
begin
  Result := mng_get_alphabitdepth(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetAlphaCompression: byte;
begin
  Result := mng_get_alphacompression(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetAlphaFilter: byte;
begin
  Result := mng_get_alphafilter(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetAlphaInterlace: byte;
begin
  Result := mng_get_alphainterlace(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetBGColor: TColor;
var
  IHRed, IHGreen, IHBlue : word;
begin
  mng_get_bgcolor(OFBitmap.HFHandle, IHRed, IHGreen, IHBlue);
  IHRed   := IHRed   shr 8;                 // shift down from 16-bit to 8-bit
  IHGreen := IHGreen shr 8;
  IHBlue  := IHBlue  shr 8;
  Result  := (IHBlue shl 16) + (IHGreen shl 8) + IHRed;
end;

{****************************************************************************}

function TNGImage.GetBGImage: TBitmap;
begin
  Result := OFBitmap.OFBGImage;
end;

{****************************************************************************}

function TNGImage.GetUseBKGD: boolean;
begin
  Result := mng_get_usebkgd(OFBitmap.HFHandle);
end;

{****************************************************************************}

procedure TNGImage.SetBGColor(IHValue: TColor);
var
  IHRed, IHGreen, IHBlue : word;
begin
  IHRed   := (IHValue       ) and $FF;      // get individual components
  IHGreen := (IHValue shr  8) and $FF;
  IHBlue  := (IHValue shr 16) and $FF;
  IHRed   := IHRed   shl 8 + IHRed;         // scale up from 8-bit to 16-bit
  IHGreen := IHGreen shl 8 + IHGreen;
  IHBlue  := IHBlue  shl 8 + IHBlue;

  mng_set_bgcolor(OFBitmap.HFHandle, IHRed, IHGreen, IHBlue);
  OFBitmap.CheckStatus;
end;

{****************************************************************************}

procedure TNGImage.SetBGImage(OHValue: TBitmap);
begin
  OFBitmap.SetBGImage(OHValue);
end;

{****************************************************************************}

procedure TNGImage.SetUseBKGD(BHValue: boolean);
begin
  mng_set_usebkgd(OFBitmap.HFHandle, BHValue);
  OFBitmap.CheckStatus;
end;

{****************************************************************************}

function TNGImage.GetViewGamma : single;
begin
  Result := mng_get_viewgammaint(OFBitmap.HFHandle) / 100000;
end;

{****************************************************************************}

function TNGImage.GetDisplayGamma : single;
begin
  Result := mng_get_displaygammaint(OFBitmap.HFHandle) / 100000;
end;

{****************************************************************************}

function TNGImage.GetDfltImgGamma : single;
begin
  Result := mng_get_dfltimggammaint(OFBitmap.HFHandle) / 100000;
end;

{****************************************************************************}

procedure TNGImage.SetViewGamma (IHValue : single);
begin
  mng_set_viewgammaint(OFBitmap.HFHandle, round(IHValue * 100000));
  OFBitmap.CheckStatus;
end;

{****************************************************************************}

procedure TNGImage.SetDisplayGamma (IHValue : single);
begin
  mng_set_displaygammaint(OFBitmap.HFHandle, round(IHValue * 100000));
  OFBitmap.CheckStatus;
end;

{****************************************************************************}

procedure TNGImage.SetDfltImgGamma (IHValue : single);
begin
  mng_set_dfltimggammaint(OFBitmap.HFHandle, round(IHValue * 100000));
  OFBitmap.CheckStatus;
end;

{****************************************************************************}

{$IFDEF INCLUDE_ZLIB}
function TNGImage.GetZLIBLevel: integer;
begin
  Result := OFBitmap.IFZLIBLevel;
end;

{****************************************************************************}

function TNGImage.GetZLIBMethod: integer;
begin
  Result := OFBitmap.IFZLIBMethod;
end;

{****************************************************************************}

function TNGImage.GetZLIBWindowbits: integer;
begin
  Result := OFBitmap.IFZLIBWindowbits;
end;

{****************************************************************************}

function TNGImage.GetZLIBMemLevel: integer;
begin
  Result := OFBitmap.IFZLIBMemLevel;
end;

{****************************************************************************}

function TNGImage.GetZLIBStrategy: integer;
begin
  Result := OFBitmap.IFZLIBStrategy;
end;

{****************************************************************************}

function TNGImage.GetZLIBMaxIDAT: cardinal;
begin
  Result := OFBitmap.IFZLIBMaxIDAT;
end;

{****************************************************************************}

procedure TNGImage.SetZLIBLevel(IHValue: integer);
begin
  OFBitmap.IFZLIBLevel := IHValue;
end;

{****************************************************************************}

procedure TNGImage.SetZLIBMethod(IHValue: integer);
begin
  OFBitmap.IFZLIBMethod := IHValue;
end;

{****************************************************************************}

procedure TNGImage.SetZLIBWindowbits(IHValue: integer);
begin
  OFBitmap.IFZLIBWindowbits := IHValue;
end;

{****************************************************************************}

procedure TNGImage.SetZLIBMemLevel(IHValue: integer);
begin
  OFBitmap.IFZLIBMemLevel := IHValue;
end;

{****************************************************************************}

procedure TNGImage.SetZLIBStrategy(IHValue: integer);
begin
  OFBitmap.IFZLIBStrategy := IHValue;
end;

{****************************************************************************}

procedure TNGImage.SetZLIBMaxIDAT(IHValue: cardinal);
begin
  OFBitmap.IFZLIBMaxIDAT := IHValue;
end;
{$ENDIF} // INCLUDE_ZLIB

{****************************************************************************}

{$IFDEF INCLUDE_JPEG}
function TNGImage.GetJPEGQuality: TJPEGQualityRange;
begin
  Result := OFBitmap.IFJPEGQuality;
end;

{****************************************************************************}

function TNGImage.GetJPEGProgressive: boolean;
begin
  Result := OFBitmap.BFJPEGProgressive;
end;

{****************************************************************************}

function TNGImage.GetJPEGMaxJDAT: cardinal;
begin
  Result := OFBitmap.IFJPEGMaxJDAT;
end;

{****************************************************************************}

procedure TNGImage.SetJPEGQuality(IHValue: TJPEGQualityRange);
begin
  { TODO:  Add limit checking }
  OFBitmap.IFJPEGQuality := IHValue;
end;

{****************************************************************************}

procedure TNGImage.SetJPEGprogressive(BHValue: boolean);
begin
  OFBitmap.BFJPEGProgressive := BHValue;
end;

{****************************************************************************}

procedure TNGImage.SetJPEGMaxJDAT(IHValue: cardinal);
begin
  OFBitmap.IFJPEGMaxJDAT := IHValue;
end;
{$ENDIF} // INCLUDE_JPEG

{****************************************************************************}

function TNGImage.GetMNGStartTime: cardinal;
begin
  Result := mng_get_starttime(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetMNGRunTime: cardinal;
begin
  Result := mng_get_runtime(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetMNGCurrentFrame: cardinal;
begin
  Result := mng_get_currentframe(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetMNGCurrentLayer: cardinal;
begin
  Result := mng_get_currentlayer(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetMNGCurrentPlaytime: cardinal;
begin
  Result := mng_get_currentplaytime(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetStatusError: boolean;
begin
  Result := mng_status_error(OFBitmap.HFHandle);
end;

{****************************************************************************}

function TNGImage.GetStatusReading: boolean;
begin
  OFBitmap.CheckStatus;
  Result := OFBitmap.BFReading;
end;

{****************************************************************************}

function TNGImage.GetStatusCreating: boolean;
begin
  OFBitmap.CheckStatus;
  Result := OFBitmap.BFCreating;
end;

{****************************************************************************}

function TNGImage.GetStatusWriting: boolean;
begin
  OFBitmap.CheckStatus;
  Result := OFBitmap.BFWriting;
end;

{****************************************************************************}

function TNGImage.GetStatusDisplaying: boolean;
begin
  OFBitmap.CheckStatus;
  Result := OFBitmap.BFDisplaying;
end;

{****************************************************************************}

function TNGImage.GetStatusRunning: boolean;
begin
  OFBitmap.CheckStatus;
  Result := OFBitmap.BFRunning;
end;

{****************************************************************************}

procedure TNGImage.SetAlphaColor(Color: TColor);
begin
  OFBitmap.IFAlphaColor := ColorToRGB(Color);
end;

{****************************************************************************}

procedure TNGImage.SetAlphaBitmap(Bitmap: TBitmap);
begin
  // added by Peter J. Haas
  if not Assigned(OFBitmap.OFAlphaBitmap) then
    OFBitmap.OFAlphaBitmap := TBitmap.Create;
  OFBitmap.OFAlphaBitmap.Assign(Bitmap);
end;

{****************************************************************************}

// function added by Peter J. Haas
procedure TNGImage.SetTransparentColor(Value: TColor);
var
  RGBColor: TColor;
begin
  RGBColor := ColorToRGB(Value);
  OFBitmap.IFAlphaColor := RGBColor;
  OFBitmap.Transparent := True;
  OFBitmap.TransparentColor := RGBColor;
  BGColor := RGBColor;
  UseBKGD := True;
end;

{****************************************************************************}

// function added by Peter J. Haas
function TNGImage.GetTransparentColor: TColor;
begin
  Result := OFBitmap.TransparentColor;
end;

{****************************************************************************}

// function added by Peter J. Haas
procedure TNGImage.SetTransparent(Value: Boolean);
var
  RGBColor: TColor;
begin
  if OFBitmap.Transparent <> Value then
  begin
    OFBitmap.Transparent := Value;
    if Value then
    begin
      RGBColor := BGColor;
      OFBitmap.IFAlphaColor := RGBColor;
      OFBitmap.TransparentColor := RGBColor;
    end;
    UseBKGD := Value;
  end;
end;

{****************************************************************************}

// function added by Peter J. Haas
function TNGImage.GetTransparent: Boolean;
begin
  Result := OFBitmap.Transparent;
end;

{****************************************************************************}
{* Compression and save to PNG routines                                     *}
{****************************************************************************}

{$IFDEF INCLUDE_PNG_SAVE}
procedure TNGImage.SaveToPNGstream(Stream: TStream);
begin                                  // must be virgin libmng handle !
  if (GetStatusCreating) or (GetStatusWriting) or (GetStatusDisplaying) then
    raise ENGImageException.Create(SCNGSavePNGillegal);

  OFBitmap.CreatePNG;                  // create chunks and then save it
  SaveToStream(Stream);
end;

{****************************************************************************}

procedure TNGImage.SaveToPNGfile(const FileName: string);
begin                                  // must be virgin libmng handle !
  if (GetStatusCreating) or (GetStatusWriting) or (GetStatusDisplaying) then
    raise ENGImageException.Create(SCNGSavePNGillegal);

  OFBitmap.CreatePNG;                  // create chunks and then save it
  SaveToFile(FileName);
end;
{$ENDIF} // INCLUDE_PNG_SAVE

{****************************************************************************}
{* Compression & save to JNG routines                                       *}
{****************************************************************************}

{$IFDEF INCLUDE_JNG_SAVE}
procedure TNGImage.SaveToJNGstream(Stream: TStream);
begin                                  // must be virgin libmng handle !
  if (GetStatusCreating) or (GetStatusWriting) or (GetStatusDisplaying) then
    raise ENGImageException.Create(SCNGSaveJNGillegal);

  OFBitmap.CreateJNG;                  // create chunks and then save it
  SaveToStream(Stream);
end;

{****************************************************************************}

procedure TNGImage.SaveToJNGfile(const FileName: string);
begin                                  // must be virgin libmng handle !
  if (GetStatusCreating) or (GetStatusWriting) or (GetStatusDisplaying) then
    raise ENGImageException.Create(SCNGSaveJNGillegal);

  OFBitmap.CreateJNG;                  // create chunks and then save it
  SaveToFile(FileName);
end;
{$ENDIF} // INCLUDE_JNG_SAVE



{****************************************************************************}
{* The MNGVideo component                                                   *}
{****************************************************************************}

constructor TMNGVideo.Create;
begin
  inherited;
  // turn off memory-consuming features
  if (mng_set_storechunks(OFBitmap.HFHandle, MNG_FALSE) <> MNG_NOERROR) then
    OFBitmap.LibMNG_Error(SCCreate + SCSetStoreChunks);
  if (mng_set_cacheplayback(OFBitmap.HFHandle, MNG_FALSE) <> MNG_NOERROR) then
    OFBitmap.LibMNG_Error(SCCreate + SCSetCachePlayback);
end;

{****************************************************************************}

procedure TMNGVideo.LoadFromStream(Stream: TStream);
var
  IHRslt : mng_retcode;
begin
  with OFBitmap do
  begin
    OFStream      := Stream;
    BFFreeOnClose := false;

    // read & display at the same time
    IHRslt        := mng_readdisplay(HFHandle);
    if (IHRslt <> MNG_NOERROR) and (IHRslt <> MNG_NEEDTIMERWAIT) then
      LibMNG_Error(SCLoadFromStream + SCReadDisplay);

    CheckStatus;
  end;
end;

{****************************************************************************}

procedure TMNGVideo.SaveToStream(Stream: TStream); // not supported!!!
begin
  raise ENGImageException.Create(SCNGVideoNotSupported);
end;

{****************************************************************************}

procedure TMNGVideo.LoadFromFile(const FileName : string);
var
  IHRslt : mng_retcode;
begin
  with OFBitmap do
  begin
    OFStream      := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
    BFFreeOnClose := true;

    // read & display at the same time
    IHRslt        := mng_readdisplay(HFHandle);
    if (IHRslt <> MNG_NOERROR) and (IHRslt <> MNG_NEEDTIMERWAIT) then
      LibMNG_Error(SCLoadFromFile + SCReadDisplay);

    CheckStatus;
  end;
end;

{****************************************************************************}

procedure TMNGVideo.SaveToFile(const FileName : string); // not supported!!!
begin
  raise ENGImageException.Create(SCNGVideoNotSupported);
end;

{****************************************************************************}

procedure TMNGVideo.Assign(Source: TPersistent); // only supports TMNGVideo!!
begin
  // if it's family, let's do some reference counting and share the LIBMNG handle
  if (Source is TMNGVideo) then
    AssignBitmap(TMNGVideo(Source).OFBitmap)
  else
    raise ENGImageException.Create(SCNGVideoNotSupported);
end;

{****************************************************************************}

procedure TMNGVideo.MNG_Rewind; // Not supported
begin
  raise ENGImageException.Create(SCNGVideoNotSupported);
end;

{****************************************************************************}
{* Register/Unregister our derived classes                                  *}
{****************************************************************************}

initialization
{$IFDEF INCLUDE_JPEG}
  NGJPEG.InitDefaults;
{$IFDEF REGISTER_JPEG}
  TPicture.RegisterFileFormat(SCJPEGExt1, SCJPEGImageFile, TJPEGImage);
  TPicture.RegisterFileFormat(SCJPEGExt2, SCJPEGImageFile, TJPEGImage);
  TPicture.RegisterFileFormat(SCJPEGExt3, SCJPEGImageFile, TJPEGImage);
  TPicture.RegisterFileFormat(SCJPEGExt4, SCJPEGImageFile, TJPEGImage);
{$ENDIF}
{$ENDIF}
{$IFDEF REGISTER_MNG}
  TPicture.RegisterFileFormat(SCMNGExt, SCMNGImageFile, TMNGImage);
{$ENDIF}
{$IFDEF REGISTER_JNG}
  TPicture.RegisterFileFormat(SCJNGExt, SCJNGImageFile, TJNGImage);
{$ENDIF}
{$IFDEF REGISTER_PNG}
  TPicture.RegisterFileFormat(SCPNGExt, SCPNGImageFile, TPNGImage);
{$ENDIF}

{****************************************************************************}


finalization
{$IFDEF REGISTER_PNG}
  TPicture.UnregisterGraphicClass(TPNGImage);
{$ENDIF}
{$IFDEF REGISTER_JNG}
  TPicture.UnregisterGraphicClass(TJNGImage);
{$ENDIF}
{$IFDEF REGISTER_MNG}
  TPicture.UnregisterGraphicClass(TMNGImage);
{$ENDIF}
{$IFDEF REGISTER_JPEG}
  TPicture.UnregisterGraphicClass(TJPEGImage);
{$ENDIF}

{****************************************************************************}



end.
