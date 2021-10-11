unit U_fast_bitmap;

  {Une unité écrite par denis bertin pour accéler écrit par denis bertin}
  {L'accès à la lecture ou l'écriture de pixel dans une image. (c) db 15-07-2009}
  {Et améliorer après l'avoir poster sur internet pour obtenir TFastBitmap2}
  {Non c'est pas ton marco tu nous ment aussi, attribué à tord à marc}

interface

uses Windows, Graphics, Classes, SysUtils,math;

var globale_stop : boolean;

const max_size_vertical = 32000;

//Utilisation : Créer l'object avec sa méthode create
//et assigner lui un bitmap de chez Borland
//Faire des opérations sur les pixels Get et Set Pixels
//Puis assigner en retour le bitmap à obtenir à partir de celui dessinné.
//Normalement Pixel:=adresse_base_du_bitmap + largeur de l'image * Y + X;

type

  Parray_maxi = ^Tarray_maxi;
  Tarray_maxi = array[00..max_size_vertical] of pointer;

  pointer_array_matrice = ^type_array_matrice;
  type_array_matrice = array [0..24] of integer;    // coefficients matrice filtre maxi 5x5


type

  TTable=array[0..0] of integer;
  PTable = ^TTable;

  TFastBitmap = class {gagne 2000% en lecture le dbs:15-07-2009}
    abitmap:Graphics.TBitmap;
    awindow:hwnd;
    constructor Create(window:hwnd);
    destructor  Destroy; override;
    procedure   Assign(Source: TPersistent);
    function    Lecture_de_la_scanline:boolean;
    procedure   Liberation_de_la_scanline;
    function    Height:integer;
    function    Width:integer;
    function    Get_pixel(x,y:integer):TColor;
    procedure   Set_pixel(x,y:integer; color:TColor);
    procedure   For_a_rectangle_filling(sa_couleur:TColor);
    //procedure   Resize(byx,byy:integer);
    private
      size : integer;
      scan : Parray_maxi;
		end; {TFastBitmap}

	TFastBitmap2 = object
		public
		Bmp : Graphics.TBitMap;
		W,H,Scan0,MLS,BPP : integer;
		procedure Creer(x,y:integer);
		procedure Copy(iBmp : Graphics.tBitMap);
		procedure Init(iBmp : Graphics.tBitMap);
		procedure Determine;
		procedure Free;
    procedure Set_Pixel_in_limite_variation_Y(xx,y :integer; color : TColor);
    function  GetPixel_in_limite_variation_Y(xx,y : Integer) : tColor;
    function  GetPixel_in_limite(X,Y : Integer) : tColor;
    procedure SetPixel_in_limite(x,y :integer; color : TColor);
		function  GetPixel(X,Y : Integer) : tColor;
		procedure SetPixel(x,y :integer; color : TColor);
    procedure RectangleFilling(color : TColor);
    procedure ligne_horizontale(y:integer; color : TColor);
    end;

  Tdbbitmap = class
    public
      constructor Create(un_bitmap:tbitmap);
      destructor Destroy; override;
      procedure Initialise;
      procedure Setpixel(x,y:integer; une_couleur:tcolorref);
      function  Getpixel(x,y:integer):tcolorref;
      procedure Drawrect(x,y,xx,yy:integer; une_couleur:tcolorref);
      procedure Fillrect(x,y,xx,yy:integer; une_couleur:tcolorref);
      procedure CrossRect(x,y,xx,yy,alpha:integer; une_couleur:tcolorref);
      procedure Applique_bitmap;
    public
      abitmap:tbitmap;
      bitmap_struct:TBitmapInfo;
      taille_bitmap:integer;
      pointer_bitmap:PTable;
    end; {Tdbbitmap-intégré par denis Bertin le 17.3.2014}

implementation

constructor TFastBitmap.Create(window:hwnd);
  begin
  inherited Create;
	self.abitmap:=Graphics.tbitmap.create;
  self.scan:=nil;
  self.size:=0;
  self.awindow:=window;
	end;

destructor TFastBitmap.Destroy;
	begin
	self.Liberation_de_la_scanline;
	self.abitmap.free;
	inherited Destroy;
	end;

procedure TFastBitmap.Assign(Source: TPersistent);
	begin
	self.abitmap.Assign(Source);
	self.Liberation_de_la_scanline;
	end;

function TFastBitmap.lecture_de_la_scanline:boolean;
	var i:integer;
	begin
	try
    begin
		if self.abitmap.PixelFormat<>pf24bit then
			self.abitmap.PixelFormat:=graphics.pf24bit;
    end
	except
		on EOutOfResources do
			begin
			exit;
			end;
		end;
	size:=self.abitmap.Height*sizeof(pointer);
	getmem(self.scan,size);
	for i:=0 to pred(self.abitmap.Height) do self.scan[i]:=Self.abitmap.scanline[i];
	lecture_de_la_scanline:=true;
	end; {TFastBitmap.lecture_de_la_scanline}

procedure TFastBitmap.Liberation_de_la_scanline;
	begin
	if self.scan<>nil then
		freemem(self.scan,self.size);
	self.scan:=nil;
	self.size:=0;
	end;

function TFastBitmap.get_pixel(x,y:integer):TColor;
	var p:^byte;
			color:tcolorref;
	begin
	if self.scan=nil then
		lecture_de_la_scanline;
	if (y>=self.abitmap.height) or (x>=self.abitmap.width) or (x<0) or (y<0) then
		begin
		get_pixel:=rgb(0,0,0);
    end
  else
    begin
    p:=self.scan^[y];
    inc(p,x*3);
    color:=P^ shl 16;
    inc(p);
    inc(color,p^ shl 8);
    inc(p);
    inc(color,p^);
    get_pixel:=color;
    end;
  end; {TFastBitmap.get_pixel}

function TFastBitmap.width:integer;
  begin
  result:=self.abitmap.Width;
  end;

function TFastBitmap.Height:integer;
  begin
  result:=self.abitmap.Height;
  end;

procedure TFastBitmap.set_pixel(x,y:integer; color:TColor);
  var p:pchar; {PByteArray;}
      q:pbytearray;
      d:integer;
  begin
  if self.scan=nil then
    lecture_de_la_scanline;
  if not ((y>=self.abitmap.height) or (x>=self.abitmap.width) or (y<0) or (x<0)) then
    begin
    q:=Self.scan[y];
    d:=x*3;
    q[d]:=(color shr 16) and 255;
    q[d+1]:=(color shr 8) and 255;
    q[d+2]:=color and 255;
    end;
  end; {TFastBitmap.set_pixel}

procedure TFastBitmap.For_a_rectangle_filling(sa_couleur:TColor);
  var i,j,ii,jj:integer;
  begin
  ii:=self.width;
  jj:=self.Height;
  for i:=1 to ii do for j:=1 to jj do self.Set_pixel(i,j,sa_couleur);
  end;

{--------------------------- TFastBitmap2 -------------------------------------}       
{Amélioration des fonctions Get/SET BitMap en utilisant le langage d'assemblage}

procedure TFastBitmap2.creer(x,y:integer);
	begin
	Bmp:=Graphics.tBitMap.create;
	Bmp.width:=x;
	Bmp.height:=y;
	Self.determine;
	end;

procedure TFastBitmap2.Copy(iBmp : Graphics.tBitMap);
	begin
	Bmp:=iBmp;
	Self.determine;  
	end;

procedure TFastBitmap2.Init(iBmp : Graphics.tBitMap);              
	begin
	Bmp:=Graphics.tBitMap.create;
	Bmp.Assign(iBmp);
	Self.determine;
	end;

procedure TFastBitmap2.determine;
	begin
  if Bmp.PixelFormat<>pf24bit then
		Bmp.PixelFormat:=pf24bit;
	Scan0:=Integer(BMP.ScanLine[0]);
  MLS  :=Integer(BMP.ScanLine[1]) - Scan0;
	BPP  := 3; // pour pf24bit
  W:=Bmp.width;
  H:=Bmp.Height;
  end;

procedure TFastBitmap2.free;
  begin
  end;

(*
function tFastBitmap2.GetPixel(X,Y : Integer) : tColor; {Fonctionne}
var      Scan : integer; {$IFOPT O-} pRGB3 : pRGBTriple; {$ENDIF}
begin    Scan:=Scan0 + Y*MLS + X*BPP;
         {$IFOPT O+}
         asm
         mov eax,Scan; //Obtenir l'adresse
         mov ebx,[eax]; //Lire le mot dans EBX
         mov eax,ebx; //Déplacer ce mot dans EAX
         mov ecx,ebx; //Déplacer ce mot dans ECX
         shr eax,$10; //tourner de 16 bits
         and eax,$ff;
         and ebx,$ff00
         or  ebx,eax;
         shl ecx,$10;
         and ecx,$ff0000;
         or  ebx,ecx;
         end; {asm}
         {$ELSE}
         pRGB3 := pRGBTriple(Scan);
         with pRGB3^ do Result:=RGB(rgbtRed,rgbtGreen,rgbtBlue);
         {$ENDIF}
end;
*)

(*
function tFastBitmap2.GetPixel(X,Y : Integer) : tColor; {Fonctionne}
var      Scan : integer; {$IFOPT O-} pRGB3 : pRGBTriple; {$ENDIF}
begin    Scan:=Scan0 + Y*MLS + X*BPP;
         {$IFOPT O+}
         asm
         mov eax,Scan; //Obtenir l'adresse
         mov bx,[eax]; //Lire le mot dans EBX
         mov cl,[eax+2];
         mov al,bl;
         shl eax,$10;
         and ebx,$0000ff00;
         add ebx,eax;
         add ebx,ecx;
         end; {asm}
         {$ELSE}
         pRGB3 := pRGBTriple(Scan);
         with pRGB3^ do Result:=RGB(rgbtRed,rgbtGreen,rgbtBlue);
         {$ENDIF}
end;
*)

(*
function tFastBitmap2.GetPixel(X,Y : Integer) : tColor; {Fonctionne}
var      Scan : integer; {$IFOPT O-} pRGB3 : pRGBTriple; {$ENDIF}
begin    Scan:=Scan0 + Y*MLS + X*BPP;
         {$IFOPT O+}
         asm
            mov eax,Scan;
            mov cl,[eax];
            mov dl,[eax+$01];
            mov al,[eax+$02];
            and eax,$000000ff;
            and edx,$000000ff;
            shl edx,$08;
            or eax,edx;
            xor edx,edx;
            mov dl,cl;
            shl edx,$10;
            or eax,edx;
            mov ebx,eax;
         end; {asm}
         {$ELSE}
         pRGB3 := pRGBTriple(Scan);
         with pRGB3^ do Result:=RGB(rgbtRed,rgbtGreen,rgbtBlue);
         {$ENDIF}
end;
*)

procedure tFastBitmap2.Set_Pixel_in_limite_variation_Y(xx,y :integer; color : TColor);
  begin
  with pRGBTriple(Scan0 + Y*MLS + XX)^ do
    begin
    rgbtRed  :=color and $ff;
    rgbtGreen:=(color shr 8) and $ff;
    rgbtBlue :=(color shr 16) and $ff;
    end;
  end;

function tFastBitmap2.GetPixel_in_limite_variation_Y(xx,y : Integer) : tColor;
  begin
  with pRGBTriple(Scan0 + Y*MLS + xx)^ do Result:=RGB(rgbtRed,rgbtGreen,rgbtBlue);
  end;

procedure tFastBitmap2.SetPixel_in_limite(x,y :integer; color : TColor);
  begin
  with pRGBTriple(Scan0 + Y*MLS + X*BPP)^ do
    begin
    rgbtRed  :=color and $ff;
    rgbtGreen:=(color shr 8) and $ff;
    rgbtBlue :=(color shr 16) and $ff;
    (*
		rgbtRed  :=GetRValue(color);
		rgbtGreen:=GetGValue(color);
		rgbtBlue :=GetBValue(color);
    *)
		end;
  end;

function tFastBitmap2.GetPixel_in_limite(X,Y : Integer) : tColor;
  begin
  with pRGBTriple(Scan0 + Y*MLS + X*BPP)^ do Result:=RGB(rgbtRed,rgbtGreen,rgbtBlue);
  end;

function tFastBitmap2.GetPixel(X,Y : Integer) : tColor;
	begin
  try
	if (x>=0) and (y>=0) and (x<self.W) and (y<self.H) then
		begin
 		with pRGBTriple(Scan0 + Y*MLS + X*BPP)^ do Result:=RGB(rgbtRed,rgbtGreen,rgbtBlue);
		end
	else
		GetPixel:=rgb(255,255,255);
  except
     end;
  end;

procedure tFastBitmap2.SetPixel(x,y :integer; color : TColor);
  {$IFOPT O+}
  var scan:integer;
  {$ENDIF}
  begin
  if (x>=0) and (y>=0) and (x<self.W) and (y<self.H) then
		begin
    if false then
      begin
      {$IFOPT O+}
      Scan:=Scan0 + Y*MLS + X*BPP;
      {$ENDIF}
      if false then
						begin
						{$IFOPT O+}
						asm
						mov ebx,Scan;
						add ebx,2;
						mov eax,color;
						mov [ebx],al;
						dec ebx;
						shr eax,$08;
						mov [ebx],al;
						dec ebx;
						shr eax,$08;
						mov [ebx],al;
						end; {asm}
						{$ELSE}
						{$ENDIF}
					end
      end
		else
			begin
			with pRGBTriple(Scan0 + Y*MLS + X*BPP)^ do
				begin
        rgbtRed  :=color and $ff;
        rgbtGreen:=(color shr 8) and $ff;
        rgbtBlue :=(color shr 16) and $ff;
        (*
				rgbtRed  :=GetRValue(color);
				rgbtGreen:=GetGValue(color);
				rgbtBlue :=GetBValue(color);
        *)
				end;
			end;
		end
  end;

(*
procedure tFastBitmap2.SetPixel(x,y :integer; color : TColor);
var       Scan : integer;
begin
          Scan:=Scan0 + Y*MLS + X*BPP;
            with pRGBTriple(Scan)^ do begin
                 rgbtRed  :=GetRValue(color);
                 rgbtGreen:=GetGValue(color);
                 rgbtBlue :=GetBValue(color);
            end;
end;
*)

procedure tFastBitmap2.ligne_horizontale(y:integer; color : TColor);
  var x:integer;
  begin
  for x:=0 to pred(self.w) do SetPixel(x,y,color);
  end; {ligne_horizontale}

procedure tFastBitmap2.RectangleFilling(color : TColor);
var       y,x, ScanY,ScanYX : integer; R,G,B : byte;
begin     R:=GetRValue(color);
          G:=GetGValue(color);
          B:=GetBValue(color);
          for y:=0 to pred(H) do begin
              ScanY:=Scan0 + Y*MLS;
              for x:=0 to pred(W) do begin
                  ScanYX:=ScanY + X*BPP;
                  with pRGBTriple(ScanYX)^ do begin
                       rgbtRed  :=R;
                       rgbtGreen:=G;
                       rgbtBlue :=B;
                  end;
              end;
          end;
end;

constructor Tdbbitmap.create(un_bitmap:tbitmap);
  begin
  inherited create;
  self.abitmap:=un_bitmap;
  self.initialise;
  end;

procedure Tdbbitmap.initialise;
  begin
  taille_bitmap:=(self.abitmap.Width*self.abitmap.Height) shl 2;
  getmem(pointer_bitmap,taille_bitmap);
  with bitmap_struct.bmiHeader do
    begin
    bisize:=sizeof(bitmap_struct.bmiHeader);
    biWidth:=self.abitmap.Width;
    biHeight:=self.abitmap.Height;
    biPlanes:=1;
    bibitcount:=32;
    bicompression:=BI_RGB;
    biSizeImage:=0;
    biXPelspermeter:=1;
    biYPelspermeter:=1;
    biClrUsed:=0;
    biClrImportant:=0;
    end;
  GetDIBits(self.abitmap.Canvas.Handle,self.abitmap.Handle,
    0,bitmap_struct.bmiHeader.biHeight,pointer_bitmap,bitmap_struct,DIB_RGB_COLORS);
  end;

destructor Tdbbitmap.destroy;
  begin
  freemem(pointer_bitmap,taille_bitmap);
  inherited destroy;
  end;

function Tdbbitmap.Getpixel(x,y:integer):tcolorref;
  var color:tcolorref;
  begin
  if (x>=0) and (y>=0) and (x<self.abitmap.Width) and (y<self.abitmap.Height) then
    begin
    color:=pointer_bitmap[(pred(self.abitmap.Height)-y)*self.abitmap.Width+x];
    result:=rgb((color shr 16) and $ff,(color shr 8) and $ff,color and $ff);
    end;
  end;

procedure Tdbbitmap.setpixel(x,y:integer; une_couleur:tcolorref);
  var color:tcolorref;
  begin
  if (x>=0) and (y>=0) and (x<self.abitmap.Width) and (y<self.abitmap.Height) then
    begin
    color:=rgb((une_couleur shr 16) and $ff,(une_couleur shr 8) and $ff,une_couleur and $ff);
    pointer_bitmap[(pred(self.abitmap.Height)-y)*self.abitmap.Width+x]:=color;
    end;
  end;

procedure Tdbbitmap.Fillrect(x,y,xx,yy:integer; une_couleur:tcolorref);
  var i,j:integer;
  begin
  for i:=math.max(0,x) to math.min(xx,self.bitmap_struct.bmiHeader.biWidth) do
    for j:=math.max(0,y) to math.min(yy,self.bitmap_struct.bmiHeader.biHeight) do
      Self.setpixel(i,j,une_couleur);
  end;

procedure Tdbbitmap.CrossRect(x,y,xx,yy,alpha:integer; une_couleur:tcolorref);
  var i,j:integer;
      apt:tpoint;
      rect_un,rect_deux,rect_trois,rect_quatre:trect;
  begin
  for i:=math.max(0,x) to pred(math.min(xx,self.bitmap_struct.bmiHeader.biWidth)) do
    for j:=math.max(0,y) to pred(math.min(yy,self.bitmap_struct.bmiHeader.biHeight)) do
      begin
      apt.x:=i; apt.y:=j;
      setrect(rect_un,x,y,x+alpha,y+alpha);
      setrect(rect_deux,xx-alpha,y,xx,y+alpha);
      setrect(rect_trois,xx-alpha,yy-alpha,xx,yy);
      setrect(rect_quatre,x,yy-alpha,x+alpha,yy);
      if ptinrect(rect_un,apt) then
        begin
        end
      else if ptinrect(rect_deux,apt) then
        begin
        end
      else if ptinrect(rect_trois,apt) then
        begin
        end
      else if ptinrect(rect_quatre,apt) then
        begin
        end
      else
        Self.setpixel(i,j,une_couleur);
      end;
  end; {Tdbbitmap.Roundrect- écrit par denis B}


procedure Tdbbitmap.Drawrect(x,y,xx,yy:integer; une_couleur:tcolorref);
  var i:integer;
  begin
  for i:=x to xx do
    begin
    Self.setpixel(i,y,une_couleur);
    Self.setpixel(i,yy,une_couleur);
    end;
  for i:=y to yy do
    begin
    Self.setpixel(x,i,une_couleur);
    Self.setpixel(xx,i,une_couleur);
    end;
  end;

procedure Tdbbitmap.applique_bitmap;
  begin
  SetDIBits(self.abitmap.Canvas.Handle,self.abitmap.Handle,0,self.abitmap.height,pointer_bitmap,bitmap_struct,DIB_RGB_COLORS);
  end;




end.
