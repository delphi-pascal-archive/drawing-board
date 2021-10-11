// folowing directives can be turned off to exclude specific parts if needed
// (note: TNGImage itself is always defined !)

{$DEFINE INCLUDE_PNG_SAVE}             // include PNG save support in TNGImage
{$DEFINE INCLUDE_JNG_SAVE}             // include JNG save support in TNGImage
{$DEFINE INCLUDE_ZLIB}                 // include ZLIB support functions
                                       // (needed for either PNG or JNG save!!)
{$DEFINE INCLUDE_JPEG}                 // include JPEG support & TJPEGImage
                                       // (needed for JNG save!!)

{$DEFINE REGISTER_PNG}                 // include & register TPNGImage
{$DEFINE REGISTER_JNG}                 // include & register TJNGImage
{$DEFINE REGISTER_MNG}                 // include & register TMNGImage
{$IFDEF INCLUDE_JPEG}
{$DEFINE REGISTER_JPEG}                // register TJPEGImage
{$ENDIF}

// added by Peter J. Haas
// is AlphaColorTo1BitAlpha defined, AlphaColor will be stored as 1 bit mask
// else as 8 bit alpha mask (0 or $FF) in the CreateJNG function.
{$DEFINE AlphaColorTo1BitAlpha}

// added by Scott Price
// turn this on to load libmng.dll at the latest possible moment
// (e.g. not at application load time but when first accessed)
{$DEFINE LATE_BINDING}

// \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
// define internal dependencies (DO NOT MODIFY!!)

{$IFDEF INCLUDE_PNG_SAVE}
{$DEFINE INCLUDE_ZLIB}
{$ENDIF}
{$IFDEF INCLUDE_JNG_SAVE}
{$DEFINE INCLUDE_ZLIB}
{$DEFINE INCLUDE_JPEG}
{$ENDIF}

