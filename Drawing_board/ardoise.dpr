program Ardoise;

// Le programme Ardoise le squelette écrit le 20.4.2015 par Denis Bertin. 1554 lignes en deux jours.
// Pour dessiner le quadrillage d'ardoise un rectangle de 36 pixels. écrit par denis bertin le 22.4.2015
// Ajout par denis bertin d'une barre d'affichage de la position de le souris en coordonnées pixel, le 24.4.2015
// Nouvelle fonction intégration du décodage du nom des couleurs survollées, le 24.4.2015
// Intégration des fenêtres "Popup" dans une nouvelle fenêtre principale, le 26.4.2015
// Un logiciel inventé à vierzon en 1982 par denis Bertin le soir sur mon Oric-1 - réécrit avec le compilateur Borland Delphi 7.
// Ajout par Denis Bertin d'une fenêtre destinée à representer les outils de tracé le 27.4.2015
// 1698 lignes de codification informatique en avril 2015 à Bourges 18000 France.
// Ajout par Denis Bertin de la posibilité d'annuler la dernière retouche posée le 28.4.2015.
// Ajout par Denis Bertin d'une ligne représentant les niveaux de gris avec le bouton droit, le 29.4.2015 .
// 1999 lignes de codification informatique dans ce module en avril 2015 à Bourges 18000 France, le 29.4.2015.
// 2207 lignes de codification le 1 Mai 2015 - Intégration et écriture des trois outils de tracés ligne - rectangle.
// 2370 lignes de codification le 27 Juillet 2015 - Ajout d'une fenêtre à propos - écrit par denis Bertin.
// Adresse de Création du logiciel ardoise 3 rue édouard Branly à 18000 Bourges.
// D'après la formulation du Langage de Programmation utilisé le Borland Delphi-7 pour Windows issue du livre :
// Delphi-7 Studio d'olivier dahan & Paul Toth éditeur EYROLLES.
// Programmer Windows et son Interface de programmation de Charles Petzold. édition P.S.I Microsoft Press.
// 2601 lignes de codification le 29 Juillet 2015 pour constituer le logiciel ardoise, avec un export des segment cercle ou rectangle au format ato - une passerelle vers denis-draw-7.
// 2621 lignes de codification le 30 Juillet 2015 pour enregistrer la caractèristique couleur et épaisseur de tracé.
// 2732 lignes de codification le 30 Juillet 2015 pour afficher l'écran d'information concernant l'utilisation du format Atomique.
// 2799 lignes de codification le 30 Juillet 2015 pour ouvrir mon logiciel denis draw avec ces vecteurs ligne cercle ou rectangle.
// 2814 lignes de codification le 31 Juillet 2015 pour ajouter des libellés aux boutons à l'écran d'information.
// 2837 lignes de codification le 31 Juillet 2015 pour distinguer la position de la souris sur les boutons survollées.
// 2952 lignes de codification le 1 Août 2015 pour indiquer les mesures des distances de élément primaire de dessin.
// 2979 lignes de codification le 4 août 2015, déclaration d'un objet de type spline.
// 3054 lignes, ajout de la méthode de calcul des splines cubiques d'interpolation avec deux composants de plus.
// 3073 lignes, ajout du positionnement dans la palette ardoise du cinquième élément de dessin les courbes de Bézier appliquée au Béta-Spline.
// 3123 lignes, implémentation du tracé des courbes béta-spline-cubique en temps réel dans la fenêtre d'ardoise jonction des courbes exactement le 5 Août 2015.
// 3212 incrustation de l'effet de dessin du spray que j'ai écrit avec les courbes Béta-splines variation de cette ensemble de point sur la fenêtre d'ardoise le 7.8.2015
// 3218 lignes, modification et évaluation de la variable suite_de_spline pour prendre un seul cliché de la capture de l'écran pendant la méthode wmlbuttondown avec la fonction le 7.8.2015.
// self.bitmap_annuler.Assign(self.mon_bitmap); // (Informaticien) Auteur denis Bertin stéphane.
// 3231 lignes, les finitions, La touche contrôle interceptée pour envoyer le message wm_mousemove, la touche contrôle dans l'écran à propos.
// 34xx Ajout par denis bertin de la figure de tracé en forme de sphére avec la touche F2 hiers soir le 8.8.2015
// 3436 Réglage par denis bertin de la position de la ligne d'affichage et du menu de positionnement de la largeur de tracé le 9.8.2015 (attribué par les menteur à leurs Michel de façn mensongére).
// 3494 Ajout des raccourcis clavier, d'une touche qui permet appliquer une fonction qui est écrit par denis Bertin le 9.8.2015.
// 3506 lignes de codifications le 10 août 2015, ajustement de la position du centre de ce dessin de la planête sur le centre aussi du quadrillage qui est écrit par denis Bertin.
// 3509 lignes de codifications Table des caractères : les raccourcis - claviers qui sont affichés dans l'écran d'aide accessible avec la touche F1 dbs/n}
// Nombre indétermminé, la fonction sur le dessin des rectangles qui permet de créer des carrés avec la touche contrôle ou majuscule pour les centrer.
// Ajout de K10 cette ajout de la ligne de documentation des touches contrôle ou majuscule qui sont associées avec l'outil rectangle dans l'écran d'aide F1.
// 3630 lignes de codifications, Indication de la résolution de l'image de travail qui est la même que celle de l'écran de Window.
// 3660 lignes de codifications, insertion de la fonction de l'outil spray en bleu dans la fenêtre des outils, le 16.8.2015
// 3810 lignes de codifications, Création d'une fenêtre qui affiche les pictogrammes venant du logiciel MineCraft, le 21.8.2015 .
// 3916 lignes de codifications, Implémentation de l'algorithme de remplissage d'une forme constituée de 16x16 pixels venant de minecraft, le 22.8.2015.
// 3964 lignes de codifications, Affectation à la fenêtre principale aux coordonnées du mode Pleine écran avec la touche 'F ou P' retour avec la touche Echap code 27. Le 24.8.2015.
// 3996 lignes de codifications, Lecture dans une procedure à part du fichier qui affiche les pictogrammes de la fenêtre titre, fonctionnment idéal en mode pleine écran.
// 4048 lignes de codifications, Affichage avec la touche de fonction F3, d'un certain nombre de cercles concentriques centré sur l'écran, déterminé par une fonction de sa résolution.
// 4206 lignes de codifications, Affichage avec les touches de fonction F4 et F5 de la spirale et des polygones.
// 4263 lignes de codifications, Transparence des PNG avec le mini-logiciel Ardoise & Gimp pour visualiser cette transparence, ainsi Export Jpeg. Le 14.11.2015 qui est écrit par denis B.
// Auteur Denis Bertin.

uses
  Classes,
  Windows,
  Contnrs,
  Messages,
  Graphics,
  sysutils,
  CommDlg,
  math,
  jpeg,
  SyncObjs,
  u_file_select,
  Clipbrd,
  lec_color,
  GDIPAPI,
  GDIPOBJ,
  Registry,
  NGImages;

{$RESOURCE sans.res}

type

  pc100 = array[0..100] of char;
  pc1024 = array[0..1024] of char;
  TdT = (TdT_rond,TdT_carre);
  TTool_de_tracer = (Tool_line,Tool_rectangle,Tool_cercle,Tool_spray,Tool_Flood_fill,Tool_spline,Tool_selected);

const

  point_bmp:pchar='.bmp';
  k_pc_bmp  = 'bmp';

  rgb_blanc = $FFFFFF;
  kpc_font_arial = 'arial';
  kpc_pourcent : pchar = '%';
  k_Ardoise = 'Ardoise';
  k_maximum_tool = 5;
  WM_USER_SETUPWINDOW = Wm_User+100;
  WM_USER_Show_coordinate = Wm_User+101;
  WM_USER_Show_nom_des_couleurs = Wm_User+102;

  chaine_filtre_jpg_bmp_png : pchar =
    'Tous les fichiers (*.*)'+chr(0)+'*.*'+chr(0)+
    'Fichiers JPEG (*.Jpg)'+chr(0)+'*.jpg'+chr(0)+
    'Fichiers PNG (*.Png)'+chr(0)+'*.png'+chr(0)+
    'Fichier image Bmp   (*.Bmp)'+chr(0)+'*.bmp'+chr(0)+chr(0)+chr(0);

  chaine_filtre_bmp_ato_jpg_png : pchar =
    'Fichier image Bmp   (*.bmp)'+chr(0)+'*.bmp'+chr(0)+
    'Fichier image Jpeg  (*.jpg)'+chr(0)+'*.jpg'+chr(0)+
    'Fichier image Png  (*.png)'+chr(0)+'*.png'+chr(0)+
    'Fichiers dessin ATO (*.ato)'+chr(0)+'*.ato'+chr(0)+chr(0)+chr(0);

  chaine_filtre_jpg_bmp_gif_png : pchar =
    'Tous les fichiers (*.*)'+chr(0)+'*.*'+chr(0)+
    'Fichiers JPEG (*.jpg)'+chr(0)+'*.jpg'+chr(0)+
    'Fichier image Bmp   (*.bmp)'+chr(0)+'*.bmp'+chr(0)+
    'Fichier image Gif   (*.gif)'+chr(0)+'*.gif'+chr(0)+
    'Fichier image Png   (*.png)'+chr(0)+'*.png'+chr(0)+chr(0);

var Global_Listwindow:Contnrs.TObjectList;

var la_couleur_du_pinceau : tcolorref = $ff0000;

var rayon : integer = 25 ;

var type_de_tracer : TdT = TdT_rond; //TdT_carre; // TdT = TdT_rond;

var Tool_de_tracer : TTool_de_tracer = Tool_line;

var k_feutrer : boolean = false;
var k_moucheter : boolean = false;
var k_pastel : boolean = false;
var k_controle : boolean = false;
var k_transparence : boolean = false;


var rectangle_feutrer,
      rectangle_moucheter,
      rect_pastel,
      rect_controle:trect;
      rect_transparence:trect;

type

  T3DPOINT = record x,y,z:integer; end;

  Tmy_Bitmap = class(Classes.Tcollectionitem)
    constructor Create(nom_du_fichier:string); reintroduce;
    public
      mon_bitmap:tbitmap;
  end; {écrit par denis B}

  Tnode = class(Classes.Tcollectionitem)
    constructor Create; reintroduce;
    procedure enregistrement(var un_fichier_ato:TextFile); virtual;
    public
      couleur:tcolorref;
      epaisseur:integer;
    end;

  TUn_point = class(Tnode)
    constructor Create; reintroduce;
    public
      x,y:real;
    end;

  TUne_ligne = class(Tnode)
    constructor Create; reintroduce;
    procedure enregistrement(var un_fichier_ato:TextFile); override;
    public
      a,b:TUn_point
    end;

  Tun_rectangle = class(TUne_ligne)
    procedure enregistrement(var un_fichier_ato:TextFile); override;
    end;

  TUn_cercle = class(Tnode)
    constructor Create; reintroduce;
    procedure enregistrement(var un_fichier_ato:TextFile); override;
    public
      centre:ardoise.TUn_point;
      rayon:real;
    end;

  TUne_Spline = class(Tnode)
    constructor Create; reintroduce;
    procedure Calcul(graphics:gdipobj.TGPGraphics; avec_controle:boolean);
    procedure enregistrement(var un_fichier_ato:TextFile); override;
    public
      a,b,c:TUn_point;
    end;

  TWinbase = class(Classes.Tcollectionitem)
    public
      hwindow:hwnd;
      parent:TWinbase; {denis}
      childlist:contnrs.TObjectList;
    constructor Create(un_parent:TWinbase); reintroduce;
    procedure  Setupwindow; virtual;
    procedure  Show_coordinate(var Msg: TMessage); virtual;
    procedure  Show_nom_des_couleurs(var Msg: TMessage); virtual; {en Francais}
    function   GetItemHandle(DlgItemID: Integer): HWnd; virtual;
    destructor destroy; override;
    function   Getstyle:DWORD; virtual;
    function   Getexstyle:DWORD; virtual;
    function   GetClassName:PChar; virtual;
    procedure  WMSize(var Msg: TMessage); virtual;
    procedure  WMChar(var Msg: TMessage); virtual;
    procedure  WMKEYDOWN(var Msg: TMessage); virtual;
    procedure  WMKEYUP(var Msg: TMessage); virtual;
    procedure  WMPaint(var Msg: TMessage); virtual;
    procedure  WMMousemove(var Msg: TMessage); virtual;
    procedure  WMLBUTTONDOWN(var Msg: TMessage); virtual;
    procedure  WMMBUTTONDOWN(var Msg: TMessage); virtual;
    procedure  WMRButtonDown(var Msg: TMessage); virtual;
    procedure  WMLBUTTONUP(var Msg: TMessage); virtual;
    procedure  WMRBUTTONUP(var Msg: TMessage); virtual;
    procedure  WMMBUTTONUP(var Msg: TMessage); virtual;
    procedure  WMERASEBKGND(var Msg: TMessage); virtual;
    procedure  Paint(PaintDC: HDC; var PaintInfo: TPaintStruct); virtual;
    procedure  WMUSER_SETUPWINDOW(var Msg: TMessage); virtual;
    procedure  WMStatus_point(var Msg: TMessage); virtual;
    procedure  WMSet_couleur(var Msg: TMessage); virtual;
    procedure  WmCLose(var Msg: TMessage); virtual;
    procedure  WMCOMMAND(var msg:TMessage); virtual;
    procedure  Souris_bouge_de_rien;
    end;

  Twindow = class(TWinbase)
  	constructor create(un_parent:TWinbase; un_name:pchar;
			X,Y,W,H:integer;exstyle:boolean); reintroduce;
    procedure Paint(PaintDC: HDC; var PaintInfo: TPaintStruct); override;
    procedure WMMousemove(var msg:TMessage); override;
    procedure WMLButtonDown(var Msg: TMessage); override;
    procedure WMRButtonDown(var Msg: TMessage); override;
    procedure WMSize(var msg:TMessage); override;
    procedure WMStatus_point(var Msg: TMessage); override;
    procedure WMSet_couleur(var Msg: TMessage); override;
    function  Canclose:boolean; virtual;
  end;

  TFastBitmap2 = object
		public
		Bmp : Graphics.TBitMap;
		W,H,Scan0,MLS,BPP : integer;
		procedure Creer(x,y:integer);
		procedure Copy(iBmp : Graphics.tBitMap);
		procedure Init(iBmp : Graphics.tBitMap);
		procedure Determine;
		procedure Free;
    function  GetPixel_in_limite(X,Y : Integer) : tColor;
    procedure SetPixel_in_limite(x,y :integer; color : TColor);
		function  GetPixel(X,Y : Integer) : tColor;
		procedure SetPixel(x,y :integer; color : TColor);
    procedure RectangleFilling(color : TColor);
    end;

  TWindow_pictogramme = class(Twindow)
    constructor Create(un_parent:ardoise.TWinbase);
    procedure Paint(PaintDC: HDC; var PaintInfo: TPaintStruct); override;
    procedure WMLButtonDown(var Msg: TMessage); override;
    procedure WMCLose(var Msg: TMessage); override;
    function  Getstyle:DWORD; override;
    public
      pictogramme_selectionner:integer;
    end;

  Twindow_Main = class(Twindow)
    constructor Create(un_parent:ardoise.TWinbase);
    destructor Destroy; override;
    procedure Setupwindow; override;
    procedure Lecture_des_fichiers_minecraft;
    procedure Creer_les_fenetre_filles;
    function  Getstyle:DWORD; override;
    function  GetClassName:PChar;
    procedure WMSize(var Msg: TMessage); override;
    procedure WMChar(var Msg: TMessage); override;
    private
      fenetre_fille:boolean;
    public
      collection_minecraft:contnrs.TObjectList;
    end;

  Twindow_Ardoise = class(Twindow)
    constructor Create(un_parent:ardoise.TWinbase);
    procedure reinitialiser_le_masque;
    procedure Reinitialisation;
    destructor Destroy; override;
    procedure Setupwindow; override;
    procedure Paint(PaintDC: HDC; var PaintInfo: TPaintStruct); override;
    function  Getstyle:DWORD; override;
    function  GetClassName:PChar;
    procedure Dessin_des_formes(calculted_point:tpoint);
    procedure Dessine_le_spray(calculted_point:tpoint; with_controle_key:boolean);
    procedure Dessine_la_spline(calculted_point:tpoint);
    procedure Remplissage_de_forme_uniforme(calculted_point:tpoint);
    procedure Remplissage_de_forme_16x16(calculted_point:tpoint);
    procedure WMMousemove(var msg:TMessage); override;
    procedure WMLButtonDown(var Msg: TMessage); override;
    procedure WMRButtonDown(var Msg: TMessage); override;
    procedure WMLButtonUp(var Msg: TMessage); override;
    procedure WMChar(var Msg: TMessage); override;
    procedure Dessine_une_planete;
    procedure Dessine_des_cercles_concentrique;
    procedure Dessine_une_spirale;
    procedure Dessine_un_polygone;
    procedure Pleine_ecran;
    procedure Revenir_a_l_etat_fenetre;
    private
      souris_down:boolean;
      suite_de_spline:boolean;
      mon_bitmap:tbitmap; {Initialiser avec la résolution de l'écran}
      mon_masque:tbitmap; {Initialiser avec la résolution de mon_bitmap}
      une_image_tres_rapide:TFastBitmap2;
      bitmap_annuler:tbitmap;
      flipflop:tbitmap;
      point_de_depart:tpoint;
      terminaison:tpoint;
      Placement:TWindowPlacement;
      bool_condition_echapement:boolean;
    end;

  Twindow_palette = class(Twindow)
    constructor Create(un_parent:ardoise.TWinbase);
    function  GetClassName:PChar; override;
    procedure WMMousemove(var msg:TMessage); override;
    procedure WMLBUTTONDOWN(var Msg: TMessage); override;
    procedure WMRButtonDown(var Msg: TMessage); override;
    procedure WMMButtonDown(var Msg: TMessage); override;
    procedure Paint(PaintDC: HDC; var PaintInfo: TPaintStruct); override;
    function  Getstyle:DWORD; override;
    public
      bool_mosaic:boolean;
      bool_gray_level:boolean;
    end; {dB-20-Avril 2015}

  Twindow_titre = class(Twindow)
    constructor Create(un_parent:ardoise.TWinbase);
    procedure Lecture_du_bitmap;
    Destructor Destroy; override;
    function  Getstyle:DWORD; override;
    function  GetClassName:PChar; override;
    procedure Paint(PaintDC: HDC; var PaintInfo: TPaintStruct); override;
    procedure WMLBUTTONDOWN(var Msg: TMessage); override;
    procedure Lecture_du_fichier_bmp(un_nom_de_fichier:string);
    procedure Enregistrement_type_ato(un_nom_de_fichier:string);
    procedure Nouveau_document;
    procedure Ouvrir_un_document;
    procedure Enregistrer_un_document;
    procedure Enregistrer_sous_un_document;
    procedure Copier_l_image;
    procedure Creer_une_ardoise;
    procedure Quadrillage;
    private
      abitmap_titre:graphics.tbitmap;
      rect_carre,rect_cercle,rect_diese:trect;
    end;

  Twindow_Graduation = class(Twindow)
    constructor Create(un_parent:ardoise.TWinbase);
    function  Getstyle:DWORD; override;
    function  GetClassName:PChar; override;
    procedure Paint(PaintDC: HDC; var PaintInfo: TPaintStruct); override;
    procedure WMLBUTTONDOWN(var Msg: TMessage); override;
    procedure WMLBUTTONUP(var Msg: TMessage); override;
    procedure WMMousemove(var msg:TMessage); override;
    procedure WMCOMMAND(var msg:TMessage); override;
    private
      down:boolean;
      rect_plus_d_epaisseur
      :trect;
    end;

  Twindow_State = class(Twindow)
    constructor Create(un_parent:ardoise.TWinbase);
    function  Getstyle:DWORD; override;
    function  GetClassName:PChar; override;
    Destructor Destroy; override;
    procedure Paint(PaintDC: HDC; var PaintInfo: TPaintStruct); override;
    procedure Show_coordinate(var Msg: TMessage); override;
    procedure Show_nom_des_couleurs(var Msg: TMessage); override;
    private
      souris:tpoint;
      couleur:tcolorref;
      col_color:lec_color.T_Col_Named;
      longueur:integer;
      rayon:integer;
      largeur,hauteur:integer;
      grand_rayon,petit_rayon:integer;
    end;

  Twindow_Tools = class(Twindow)
    constructor Create(un_parent:ardoise.TWinbase);
    function  Getstyle:DWORD; override;
    function  GetClassName:PChar; override;
    procedure Paint(PaintDC: HDC; var PaintInfo: TPaintStruct); override;
    procedure WMLButtonDown(var Msg: TMessage); override;
    procedure Annuler_la_fonction;
    public
      annuler_bitmap:tbitmap;
      goute_bitmap:tbitmap;
      fonction_annuler_valide:boolean;
      rectangle_annuler:trect;
      rectangle_about:trect;
    end;

  Twindow_About = class(Twindow)
    constructor Create(un_parent:ardoise.TWinbase);
    function  Getstyle:DWORD; override;
    function  GetClassName:PChar; override;
    procedure Paint(PaintDC: HDC; var PaintInfo: TPaintStruct); override;
    procedure WMMousemove(var Msg: TMessage); override;
    procedure WMLButtonDown(var Msg: TMessage); override;
    procedure WMChar(var Msg: TMessage); override;
    end;

  Twindow_export_ato = class(Twindow)
    constructor Create(un_parent:ardoise.TWinbase; un_nom_du_fichier:string);
    function  Getstyle:DWORD; override;
    function  GetClassName:PChar; override;
    procedure Paint(PaintDC: HDC; var PaintInfo: TPaintStruct); override;
    procedure WMLButtonDown(var Msg: TMessage); override;
    procedure WMMousemove(var Msg: TMessage); override;
    procedure WMChar(var Msg: TMessage); override;
    private
      rect_decouvrir,
        rect_revoir_ce_message,
        rect_open_denis_draw:trect;
    private
      nom_du_fichier:pc1024;
    end;

Var Window_Main : TWindow_Main = nil;
Var Window_ardoise : Twindow_Ardoise = nil;
var Window_palette : Twindow_palette = nil;
var Window_titre : Twindow_titre = nil;
var Window_Graduation : Twindow_Graduation = nil;
var Window_State : Twindow_State = nil;
var Window_Tools : Twindow_Tools = nil;
var Window_About : Twindow_About = nil;
var Window_export_ato : Twindow_export_ato = nil;
var Window_pictogramme : TWindow_pictogramme = nil;

var Cache_window : TWinbase=nil;
var Collection : contnrs.TObjectList = nil;

function IN_Between(a,b,index,max:real):integer;
	begin
	if max=0.0 then
		IN_Between:=round(a)
	else
		IN_Between:=round(a+index*(b-a)/max);
	end;

procedure MoveTo(DC: HDC; X, Y: Integer);
  var apt:tpoint;
      pt:PPoint;
  begin
  pt:=@apt;
  Windows.MoveToEx(DC,X,Y,pt);
  end;

function IN_Between_longint_RGB(a,b:longint; index,max:real):longint;
	begin
	IN_Between_longint_RGB:=RGB(
		IN_Between(getrvalue(a),getrvalue(b),index,max),
		IN_Between(getgvalue(a),getgvalue(b),index,max),
		IN_Between(getbvalue(a),getbvalue(b),index,max));
	end;

procedure cross_a_rect(adc:hdc;arect:trect);
	begin
	with arect do
		begin
		moveto(adc,left,top);lineto(adc,right,bottom);
		moveto(adc,right,top);lineto(adc,left,bottom);
		end;
	end;

procedure cross_a_window(hwindow:hwnd;adc:hdc);
	var arect:trect;
	begin
	getclientrect(hwindow,arect);
	cross_a_rect(adc,arect);
	end; {cross_a_window}


(* code C a partir d'une méthode découverte à la bibliothèque de la vilette by denis Bertin en toute honnêté*)
procedure HLS_to_RGB(h,l,s:real; var r,g,b:real);
	var v,m,sv,fract,vsf,mid1,mid2:real;
		 sextant:integer;
	begin
	if h=360 then h:=0 else	h:=h/360;
	if l<=0.5 then
		v:=l*(1.0+s)
	else
		v:=l+s-l*s;
	if v<=0.0 then
		begin
		r:=0.0; g:=0.0; b:=0.0;
		end
	else
		begin
		m:=l+l-v; sv:=(v-m)/v;
		h:=h*6.0;
		sextant:=trunc(h);
		fract:=h-sextant;
		vsf:=v*sv*fract;
		mid1:=m+vsf;
		mid2:=v-vsf;
		case sextant of
			0:begin r:=v;		  g:=mid1;	b:=m		end;
			1:begin r:=mid2;	g:=v;		  b:=m		end;
			2:begin r:=m;		  g:=v;		  b:=mid1	end;
			3:begin r:=m;		  g:=mid2;	b:=v		end;
			4:begin r:=mid1;	g:=m;		  b:=v		end;
			5:begin r:=v;		  g:=m;		  b:=mid2	end;
			end; {case sextant}
      end;
	end; {HLS_to_RGB}

{********************************** TRectangle COLOR PICKER *******************}

procedure box(hwindow:hwnd;un_message:pchar);
	begin
	if not IsWindow(hwindow) then
		hwindow:=getfocus;
  messagebox(hwindow,un_message,k_Ardoise,mb_ok);
	end;

procedure inttopchar(i:longint;apchar:pchar);
  var s:string;
  begin
  s:=inttostr(i);
	StrPCopy(apchar,S);
	end;

function rmax(a,b:real):real;
	begin
	if a>b then rmax:=a else rmax:=b;
	end;

function rmin(a,b:real):real;
	begin
	if a<b then rmin:=a else rmin:=b;
	end;

{r:0..1, g:0..1, b:0..1   ->  h:0..360, l:0..1, s:0..1}
procedure RGB_to_HLS(r,g,b:real; var h,l,s:real);
	var v,m,vm,r2,g2,b2:real;
	begin
	v:=rmax(rmax(r,g),b);
	m:=rmin(rmin(r,g),b);

	l:=(m+v) / 2.0; h:=0; s:=0;
	if l<=0 then
		begin
		l:=0;
      exit;
		end;

   vm:=v-m;	s:=vm;
	if s>0.0 then
		begin
		if l<0.5 then
			s:=s/(v+m)
		else
			s:=s/(2.0-v-m);
		end
	else
		exit;
	r2:=(v-r)/vm;	g2:=(v-g)/vm;	b2:=(v-b)/vm;
	if r=v then
		begin
		if g=m then
			h:=5.0+b2
		else
      	h:=1.0-g2
		end
	else if g=v then
		begin
		if b=m then
			h:=1.0+r2
		else
      	h:=3.0-b2
		end
	else
		begin
		if r=m then
			h:=3.0+g2
		else
      	h:=5.0-r2
		end;

	h:=round(h*60) mod 360;
	{h:=h/6;
	h:=h*360;}
	end; {RGB_to_HLS}

procedure hls_to_tcolorref(h,l,s:real; var acolor:tcolorref);
	var r,g,b:real;
	begin
	if h>360 then h:=h-360;
	HLS_to_RGB(h,l,s,r,g,b);
	acolor:=RGB(round(R*255),round(G*255),round(B*255));
	end; {ihls_to_tcolorref}

procedure tcolorref_to_hls(acolor:tcolorref; var h,l,s:real);
	begin
	RGB_to_HLS(
		1.0*getrvalue(acolor)/255,
		1.0*getgvalue(acolor)/255,
		1.0*getbvalue(acolor)/255, h,l,s);
   end;

{Fonctionne sur une variation de 20 pixels - copyright Denis Bertin}
procedure Soft_rectangle(paintdc:hdc; x,y,xx,yy:integer; couleur:tcolorref);
	var i,max:integer;
      apencil:hpen;
      h,l,s:real;
      une_autre_couleur:tcolorref;

  procedure MoveTo(DC: HDC; X, Y: Integer);
    var apt:tpoint;
        pt:PPoint;
    begin
    pt:=@apt;
    Windows.MoveToEx(DC,X,Y,pt);
    end;

  var k_sous:integer;

  begin
  {pour conserver sa teinte et changer sa luminosité}
  tcolorref_to_hls(couleur,h,l,s);
  max:=(yy+y) div 2;
  k_sous:=yy-y; {denis Bertin}
  for i:=y to max do
    begin
    hls_to_tcolorref(h,1.0-math.max(0,(i-y)/k_sous),s,une_autre_couleur);
    apencil:=Selectobject(Paintdc,CreatePen(PS_SOLID,1,une_autre_couleur));
    moveto(paintdc,x,i);
    lineto(paintdc,xx,i);
    DeleteObject(Selectobject(Paintdc,apencil));
    end;
  for i:=max to yy do
    begin
    apencil:=Selectobject(Paintdc,CreatePen(PS_SOLID,1,couleur));
    moveto(paintdc,x,i);
    lineto(paintdc,xx,i);
    DeleteObject(Selectobject(Paintdc,apencil));
    end;
  end; {Soft_rectangle}

function distance(a,b,x,y:integer): real;
	var da,db: real;
	begin
	da:=longint(a)-longint(x);
	db:=longint(b)-longint(y);
	distance:=sqrt(da*da+db*db);
	end;

function angle_radian(x,y,px,py:longint):Real; {radian}
  const lk_pisur2 = pi/2;
        lk_deuxpi = 2* pi;
  var a:Real;
	begin
	if x=px then
    a:=lk_pisur2
	else
    a:=arctan(abs(y-py)/abs(x-px));
	if (px<x) and (py<y) then
    angle_radian:=pi-a
  else if (px<x) and (py>=y) then
    angle_radian:=a+pi
  else if (px>=x) and (py>y) then
    angle_radian:=lk_deuxpi-a
	else
    angle_radian:=a;
  end;

function angle_degree(a,b, x,y:integer):real;
  const lk_180_sur_pi =  180/Pi;
  begin
  angle_degree:=angle_radian(a,b,x,y)*lk_180_sur_pi;
  end;

procedure MakeDefaultFont(var alogfont:tlogFont; asize:integer);
	begin
	FillChar(ALogFont, SizeOf(TLogFont), #0);
	with ALogFont do
		begin
		lfHeight        := asize; 	{40 dans isaplan } { Taille en unite logique ou metre dans ver2}
		lfWeight        := 400;    {Indicate a Normal attribute Bold=700}
		lfItalic        := 0;      {Non-zero value indicates italic   }
		lfUnderline     := 0;      {Non-zero value indicates underline}
		lfOutPrecision  := Out_Stroke_Precis;
		lfClipPrecision := Clip_Stroke_Precis;
		lfQuality       := Default_Quality;
		lfPitchAndFamily:= Variable_Pitch;
		StrCopy(lfFaceName, 'Arial');
		end; {with}
	end; {MakeDefaultFont}

Function Get_MakeDefaultFont(asize:integer):Hfont;
	var alogfont:tlogFont;
	begin
	MakeDefaultFont(alogfont,asize);
	Get_MakeDefaultFont:=CreateFontIndirect(alogfont);
	end; {Get_MakeDefaultFont}

Function Get_Calibri_font(const height:integer=24):hfont;
  var alogfont:tlogFont;
  begin
  FillChar(ALogFont, SizeOf(TLogFont), #0);
	with ALogFont do
		begin
		lfHeight        := height; 	{40 dans isaplan } { Taille en unite logique ou metre dans ver2}
		lfWeight        := 400;    {Indicate a Normal attribute Bold=700}
		lfItalic        := 0;      {Non-zero value indicates italic   }
		lfUnderline     := 0;      {Non-zero value indicates underline}
		lfOutPrecision  := Out_Stroke_Precis;
		lfClipPrecision := Clip_Stroke_Precis;
		lfQuality       := Default_Quality;
		lfPitchAndFamily:= Variable_Pitch;
		StrCopy(lfFaceName, 'Calibri');
		end; {with}
  Get_Calibri_font:=CreateFontIndirect(alogfont);
  end;

function FindWindow(Wnd:hwnd):TWinbase;
  var i,n:integer;
      awindow:TWinbase;
      apc:pchar;
  begin
  result:=nil;
  {ajouter la recherche dans le cache ici}
  apc:=pchar(Global_ListWindow);
  if apc<>nil then
    begin
    if (cache_window<>nil) and (cache_window.hwindow=wnd) then
      result:=cache_window
    else
      begin
      n:=pred(Global_ListWindow.Count);
      for i:=0 to n do
        begin
        awindow:=TWinbase(Global_ListWindow.items[i]);
        if awindow.hwindow=Wnd then
          begin
          result:=awindow;
          {ajouter au cache ici}
          cache_window:=awindow;
          exit;
          end;
        end;
      end; {for}
    end;
  end; {FindWindow}


function WndProc_Redib(Wnd : HWND; cmd : UINT; wParam : Integer; lParam: Integer) : Integer; stdcall;
  var awindow:TWinbase;
      ok:boolean;
      msg:Messages.TMessage;
 begin
  result := 0;
  awindow:=FindWindow(Wnd);
  if awindow<>nil then
    begin
    ok:=true;
    msg.msg:=cmd;
    msg.wParam:=wParam;
    msg.lParam:=lParam;
    case cmd of
      WM_CLOSE:
        begin
        awindow.WmCLose(msg);
        if Wnd=Window_Main.hwindow then
          begin
          Window_Main.Free;
          PostQuitMessage(-1)
          end
        else
          destroywindow(Wnd);
        end;
      WM_SIZE:
        awindow.wmsize(msg);
      WM_Char:
        awindow.wmchar(msg);
      WM_KEYDOWN:
        awindow.WMKEYDOWN(Msg);
      WM_KEYUP:
        awindow.WMKEYUP(Msg);
      WM_PAINT:
        awindow.wmpaint(msg);
      WM_COMMAND:
        awindow.WMCOMMAND(msg);
      WM_DESTROY:
        begin
        if awindow<>nil then
          awindow.Free;
        end;
      WM_MOUSEMOVE:
        awindow.wmmousemove(msg);
			WM_LBUTTONDOWN:
        awindow.WMLBUTTONDOWN(msg);
			WM_MBUTTONDOWN:
        awindow.WMMBUTTONDOWN(msg);
      WM_RBUTTONDOWN:
        awindow.WMRBUTTONDOWN(msg);
			WM_LBUTTONUP:
        awindow.WMLBUTTONUP(msg);
			WM_RBUTTONUP:
        awindow.WMRBUTTONUP(msg);
      WM_ERASEBKGND:
        awindow.WMERASEBKGND(msg);
      WM_USER_SETUPWINDOW:
        awindow.Setupwindow;
      WM_USER_Show_coordinate:
        awindow.Show_coordinate(msg);
      WM_USER_Show_nom_des_couleurs:
        awindow.Show_nom_des_couleurs(msg);
      WM_setfocus:
        begin
        result := DefWindowProc(Wnd, cmd, wParam, lParam);
        end
    else
        begin
        ok:=false;
        result := DefWindowProc(Wnd, cmd, wParam, lParam);
        end;
      end; {case}
    if ok then
      begin
      result:=msg.result;
      end;
    end
  else
    begin
    result := DefWindowProc(Wnd, cmd, wParam, lParam);
		end;
  	end; {WndProc_Redib}


constructor TUn_point.Create;
  begin
  end;

constructor Tnode.Create;
  begin
  end;

procedure Tnode.Enregistrement(var un_fichier_ato:TextFile);
  begin
  end;

constructor TUne_ligne.Create;
  begin
  inherited Create;
  a:=ardoise.TUn_point.Create;
  b:=ardoise.TUn_point.Create;
  end;

procedure TUne_ligne.Enregistrement(var un_fichier_ato:TextFile);
  begin
  writeln(un_fichier_ato,'line{');
  writeln(un_fichier_ato,'name="La ligne"');
  writeln(un_fichier_ato,'xpos='+inttostr(round(self.a.x)));
  writeln(un_fichier_ato,'ypos='+inttostr(round(self.a.y)));
  writeln(un_fichier_ato,'zpos=0');
  writeln(un_fichier_ato,'xxpos='+inttostr(round(self.b.x-self.a.x)));
  writeln(un_fichier_ato,'yypos='+inttostr(round(self.b.y-self.a.y)));
  writeln(un_fichier_ato,'zzpos=0');
  writeln(un_fichier_ato,'line width=',inttostr(self.epaisseur div 5));
  writeln(un_fichier_ato,'line color RGB=',
    inttostr(getrvalue(self.couleur)),',',
    inttostr(getgvalue(self.couleur)),',',
    inttostr(getbvalue(self.couleur)));
  writeln(un_fichier_ato,'style line=0');
  writeln(un_fichier_ato,'line cap=1');
  writeln(un_fichier_ato,'transparency=255');
  writeln(un_fichier_ato,'}');
  end;

procedure Tun_rectangle.enregistrement(var un_fichier_ato:TextFile);
  begin
  writeln(un_fichier_ato,'draw{');
  writeln(un_fichier_ato,'name="Rectangle"');
  writeln(un_fichier_ato,'xpos=',inttostr(round(self.a.x)));
  writeln(un_fichier_ato,'ypos=',inttostr(round(self.a.y)));
  writeln(un_fichier_ato,'zpos=0');
  writeln(un_fichier_ato,'line width=',inttostr(self.epaisseur div 5));
  writeln(un_fichier_ato,'line color RGB=',
    inttostr(getrvalue(self.couleur)),',',
    inttostr(getgvalue(self.couleur)),',',
    inttostr(getbvalue(self.couleur)));
  writeln(un_fichier_ato,'fill color RGB=0,0,0');
  writeln(un_fichier_ato,'style line=0');
  writeln(un_fichier_ato,'line cap=1');
  writeln(un_fichier_ato,'transparency=255');
  writeln(un_fichier_ato,'Elements:');
  writeln(un_fichier_ato,'point:0,0,0');
  writeln(un_fichier_ato,'line:',inttostr(round(self.b.x-self.a.x))+',0,0');
  writeln(un_fichier_ato,'line:',inttostr(round(self.b.x-self.a.x))+','+inttostr(round(self.b.y-self.a.y))+',0');
  writeln(un_fichier_ato,'line:0,'+inttostr(round(self.b.y-self.a.y))+',0');
  writeln(un_fichier_ato,'line:0,0,0');
  writeln(un_fichier_ato,':end');
  writeln(un_fichier_ato,'}');
  end;

constructor TUn_cercle.Create;
  begin
  inherited Create;
  self.centre:=ardoise.TUn_point.create;
  end;

constructor TUne_Spline.Create;
  begin
  inherited Create;
  a:=TUn_point.Create;
  b:=TUn_point.Create;
  c:=TUn_point.Create;
  end;

{Méthode de calcul des splines cubiques d'interpolation et de représentation-dbs}
procedure TUne_Spline.Calcul(graphics:gdipobj.TGPGraphics; avec_controle:boolean);
  const k_step = 0.1;
  type
    PPointFArray = ^TPointFArray;
    TPointFArray = ARRAY[1..16380] of TGPPointF;
  var i:integer;
      u:real;
      index,nb_point,tab_size:integer;
      un_point:tpoint;
      deux_point:tpoint;
      pencil_vanille:TGPpen;
      tab_calculer:PPointFArray;
      calculted_point,point_suivant,point_actuel:tpoint;

    {Quadratique}
		function E0(u:real):real; begin E0:=sqr(u) / 2; end;
		function E1(u:real):real; begin E1:=3/4-sqr(u-0.5) end;
		function E2(u:real):real; begin E2:=sqr(u-1) / 2 end;

    function Bspline_2_x(u:real):integer;
			begin
			Bspline_2_x:=round(E0(u)*c.x+E1(u)*b.x+E2(u)*a.x);
			end;

		function Bspline_2_y(u:real):integer;
			begin
			Bspline_2_y:=round(E0(u)*c.y+E1(u)*b.y+E2(u)*a.y);
			end;

  begin
  {Initialisation}
  u:=0;
  if avec_controle and (Ardoise.Window_ardoise<>nil) then
    begin
    calculted_point.x:=round(self.a.x);
    calculted_point.y:=round(self.a.y);
    Ardoise.Window_ardoise.Dessine_le_spray(calculted_point,false);
    point_suivant.x:=round(Bspline_2_x(u));
    point_suivant.y:=round(Bspline_2_y(u));
    for i:=0 to 7 do
      begin
      point_actuel.x:=IN_Between(calculted_point.x,point_suivant.x,i,8);
      point_actuel.y:=IN_Between(calculted_point.y,point_suivant.y,i,8);
      Ardoise.Window_ardoise.Dessine_le_spray(point_actuel,false);
      end;
    while u<=1 do {Fin de la boucle dans l'espace de variation de zéro à un}
      begin
      calculted_point.x:=round(Bspline_2_x(u));
      calculted_point.y:=round(Bspline_2_y(u));
      Ardoise.Window_ardoise.Dessine_le_spray(calculted_point,false);
      u:=u+k_step; {Le pas, un intervale de progression pouurraît être plus fin encore.}
      end;
    for i:=0 to 7 do
      begin
      point_actuel.x:=IN_Between(calculted_point.x,round(self.c.x),i,8);
      point_actuel.y:=IN_Between(calculted_point.y,round(self.c.y),i,8);
      Ardoise.Window_ardoise.Dessine_le_spray(point_actuel,false);
      end;
    end
  else
    begin
    nb_point:=0;
    while u<=1 do {Fin de la boucle dans l'espace de variation de zéro à un}
   	  begin
      inc(nb_point);
  	  u:=u+k_step; {Le pas, un intervale de progression pouurraît être plus fin encore.}
      end;
    inc(nb_point);
    tab_size:=succ(nb_point)*sizeof(TGPPointF);
    {Symétrie des allocations}
    getmem(tab_calculer,tab_size);
    pencil_vanille:=TGPpen.Create(MakeColor(255,
      GetRValue(self.couleur),
      GetGValue(self.couleur),
      GetBValue(self.couleur)),self.epaisseur div 5);
    if ardoise.type_de_tracer = TdT_rond then
      begin
      pencil_vanille.SetStartCap(LineCapRound);
      pencil_vanille.SetEndCap(LineCapRound);
      pencil_vanille.SetLineJoin(LineJoinRound);
      end
    else
      begin
      pencil_vanille.SetStartCap(LineCapSquare);
      pencil_vanille.SetEndCap(LineCapSquare);
      pencil_vanille.SetLineJoin(LineJoinMiter);
      end;
    u:=0; {Initialisation}
    index:=1;
    tab_calculer[index].x:=a.x;
    tab_calculer[index].y:=a.y;
    inc(index);
    while u<=1 do {Fin de la boucle dans l'espace de variation de zéro à un}
   	  begin
      tab_calculer[index].x:=round(Bspline_2_x(u));
      tab_calculer[index].y:=round(Bspline_2_y(u));
      inc(index);
      u:=u+k_step; {Le pas, un intervale de progression pouurraît être plus fin encore.}
      end;
    tab_calculer[index].x:=c.x;
    tab_calculer[index].y:=c.y;
    graphics.DrawLines(pencil_vanille,PGPPointF(tab_calculer),succ(nb_point));
    pencil_vanille.Free;
    {liberté pour l'allocation de la mémoire écrit par denis bertin le 6.8.2015}
    freemem(tab_calculer,tab_size);
    end;
  end; {TUne_Spline.Calcul-DomDiscouter}

procedure TUne_Spline.enregistrement(var un_fichier_ato:TextFile);
  begin
  writeln(un_fichier_ato,'draw{');
  writeln(un_fichier_ato,'name="Spline"');
  writeln(un_fichier_ato,'xpos=',inttostr(round(self.a.x)));
  writeln(un_fichier_ato,'ypos=',inttostr(round(self.a.y)));
  writeln(un_fichier_ato,'zpos=0');
  writeln(un_fichier_ato,'line width=',inttostr(self.epaisseur div 5));
  writeln(un_fichier_ato,'line color RGB=',
    inttostr(getrvalue(self.couleur)),',',
    inttostr(getgvalue(self.couleur)),',',
    inttostr(getbvalue(self.couleur)));
  writeln(un_fichier_ato,'fill color RGB=0,0,0');
  writeln(un_fichier_ato,'style line=0');
  writeln(un_fichier_ato,'line cap=1');
  writeln(un_fichier_ato,'transparency=255');
  writeln(un_fichier_ato,'Elements:');
  writeln(un_fichier_ato,'point:0,0,0');
  writeln(un_fichier_ato,'quadra:'+inttostr(round(self.b.x-self.a.x))+','+inttostr(round(self.b.y-self.a.y))+',0');
  writeln(un_fichier_ato,'quadra:'+inttostr(round(self.c.x-self.a.x))+','+inttostr(round(self.c.y-self.a.y))+',0');
  writeln(un_fichier_ato,':end');
  writeln(un_fichier_ato,'}');
  end;

procedure TUn_cercle.enregistrement(var un_fichier_ato:TextFile);
  begin
  writeln(un_fichier_ato,'draw{');
  writeln(un_fichier_ato,'name="Cercle"');
  writeln(un_fichier_ato,'xpos=',inttostr(round(self.centre.x)));
  writeln(un_fichier_ato,'ypos=',inttostr(round(self.centre.y)));
  writeln(un_fichier_ato,'zpos=0');
  writeln(un_fichier_ato,'line width=',inttostr(self.epaisseur div 5));
  writeln(un_fichier_ato,'line color RGB=',
    inttostr(getrvalue(self.couleur)),',',
    inttostr(getgvalue(self.couleur)),',',
    inttostr(getbvalue(self.couleur)));
  writeln(un_fichier_ato,'fill color RGB=0,0,0');
  writeln(un_fichier_ato,'style line=0');
  writeln(un_fichier_ato,'line cap=1');
  writeln(un_fichier_ato,'transparency=255');
  writeln(un_fichier_ato,'Elements:');
  writeln(un_fichier_ato,'point:0,0,0');
  writeln(un_fichier_ato,'circle:'+inttostr(round(self.rayon))+',0,0');
  writeln(un_fichier_ato,':end');
  writeln(un_fichier_ato,'}');
  end;

constructor TWinbase.create(un_parent:TWinbase);
  begin
  try
    if un_parent<>nil then
      self.parent:=un_parent;
    self.hwindow:=0;
    self.childlist:=contnrs.TObjectList.Create;
  except
    end;
  end;

destructor TWinbase.Destroy;
  var position:integer;
  begin
  try
    {vider le cache}
    cache_window:=nil;
    if false then Self.childlist.OwnsObjects:=false;
    Self.childlist.Free;
    if self.parent<>nil then
      begin
      position:=self.parent.childlist.IndexOf(self);
      if position<>-1 then
        begin
        self.parent.childlist.OwnsObjects:=false;
        self.parent.childlist.remove(self);
        self.parent.childlist.OwnsObjects:=true;
        end;
      end;
    position:=Global_Listwindow.IndexOf(self);
    if position<>-1 then
      begin
			//if false then
			Global_Listwindow.OwnsObjects:=false;
			Global_Listwindow.remove(self);
			//if false then
			Global_Listwindow.OwnsObjects:=true;
      end;
    inherited destroy;
  except
    end;
  end; {TWinbase.Destroy}

function TWinbase.Getstyle:DWORD;
  begin
  result:=WS_OVERLAPPED;
  end;

function TWinbase.getexstyle:DWORD;
  begin
  getexstyle:=WS_EX_PALETTEWINDOW;
  end; {TWinbase.getexstyle}

function TWinbase.GetClassName:PChar;
  const class_name_unknow:pchar='Ardoise';
	begin
	GetClassName:=class_name_unknow;
	end;

procedure TWinbase.wmsize(var msg:TMessage);
  begin
  end;

procedure TWinbase.WMKEYDOWN(var Msg: TMessage);
  begin
  if msg.wparam=VK_F1 then
    Window_About:=Twindow_About.Create(self)
  else if msg.wparam=VK_F2 then
    ardoise.Window_ardoise.dessine_une_planete
  else if msg.wparam=VK_F3 then
    ardoise.Window_ardoise.dessine_des_cercles_concentrique
  else if msg.wparam=VK_F4 then
    ardoise.Window_ardoise.dessine_une_spirale
  else if msg.wparam=VK_F5 then
    ardoise.Window_ardoise.dessine_un_polygone
  else if msg.wparam=VK_CONTROL then
    self.Souris_bouge_de_rien;
  end;

procedure TWinbase.WMKEYUP(var Msg: TMessage);
  begin
  if msg.wparam=VK_CONTROL then
    self.Souris_bouge_de_rien;
  end; {TWinbase.WMKEYUP}

procedure TWinbase.WMChar(var Msg: TMessage);
  begin
  end;

procedure TWinbase.wmpaint(var msg:TMessage);
  var PaintDC:HDC;
      PaintInfo: TPaintStruct;
  begin
  PaintDC:=BeginPaint(self.hwindow,PaintInfo);
  self.paint(PaintDC,PaintInfo);
  Windows.EndPaint(self.hwindow,PaintInfo);
  end;

procedure TWinbase.WMMousemove(var Msg: TMessage); begin end;
procedure TWinbase.WMLBUTTONDOWN(var Msg: TMessage); begin end;
procedure TWinbase.WMMBUTTONDOWN(var Msg: TMessage); begin end;
procedure TWinbase.WMRButtonDown(var Msg: TMessage); begin end;
procedure TWinbase.WMLBUTTONUP(var Msg: TMessage); begin end;
procedure TWinbase.WMRBUTTONUP(var Msg: TMessage); begin end;
procedure TWinbase.WMMBUTTONUP(var Msg: TMessage); begin end;
procedure TWinbase.WMERASEBKGND(var Msg: TMessage); begin msg.Result:=-1; end;

procedure TWinbase.Paint(PaintDC: HDC; var PaintInfo: TPaintStruct);
  begin
  end;

procedure TWinbase.WMUSER_SETUPWINDOW(var Msg: TMessage);
  begin
  self.Setupwindow;
  end;

procedure TWinbase.Show_coordinate(var Msg: TMessage);
  begin
  end;

procedure TWinbase.Show_nom_des_couleurs(var Msg: TMessage);
  begin
  end;

procedure TWinbase.WMStatus_point(var Msg: TMessage);
  begin
  end;

procedure TWinbase.WMSet_couleur(var Msg: TMessage);
  begin
  end;

procedure TWinbase.WmCLose(var Msg: TMessage);
  begin
  end;

procedure TWinbase.WMCOMMAND(var msg:TMessage);
  begin
  end;

procedure TWinbase.Setupwindow;
  begin
  end;

function TWinbase.GetItemHandle(DlgItemID: Integer): HWnd;
  begin
  GetItemHandle:=GetDlgItem(HWindow, DlgItemID);
  end;

procedure TWinbase.Souris_bouge_de_rien;
  var apoint:tpoint;
  begin
  getcursorpos(apoint);
  setcursorpos(apoint.x,apoint.y);
  end;

procedure Twindow.Paint(PaintDC: HDC; var PaintInfo: TPaintStruct); begin end;
procedure Twindow.WMMousemove(var msg:TMessage); begin end;
procedure Twindow.WMLButtonDown(var Msg: TMessage); begin end;
procedure Twindow.WMRButtonDown(var Msg: TMessage); begin end;
procedure Twindow.WMSize(var msg:TMessage); begin end;
procedure Twindow.WMStatus_point(var Msg: TMessage); begin end;
procedure Twindow.WMSet_couleur(var Msg: TMessage); begin end;
function  Twindow.Canclose:boolean; begin Canclose:=true; end;

(*****************************************************************************)

function Get_HLS_RGB(h,l,s:real):TColorref;
	var r,g,b:real;
	begin
	while h>360 do h:=h-360;
	HLS_to_RGB(h,l,s,r,g,b);
	Get_HLS_RGB:=RGB(round(R*255),round(G*255),round(B*255));
	end;

{******************************************************************************}

constructor Twindow.Create(
    un_parent:TWinbase; un_name:pchar; X,Y,W,H:integer; exstyle:boolean);
	var local_wndClass : TWndClass;
			parent_hwindow:hwnd;
	begin
	inherited Create(un_parent);

	local_wndClass.style          := CS_HREDRAW or CS_VREDRAW or CS_DBLCLKS;
	local_wndClass.lpfnWndProc    := @WndProc_Redib;
	local_wndClass.cbClsExtra     := 0;
	local_wndClass.cbWndExtra     := 0;
	local_wndClass.hInstance      := hInstance;
	local_wndClass.hIcon          := LoadIcon(hinstance,'MAINICON');
	local_wndClass.hCursor        := LoadCursor(0, IDC_ARROW); {CURSEUR_POINT}
	local_wndClass.hbrBackground  := HBRUSH(GetStockObject(WHITE_BRUSH));
	local_wndClass.lpszMenuName   := nil;
	local_wndClass.lpszClassName  := GetClassName;

	windows.RegisterClass(local_wndClass);

	if un_parent=nil then
		parent_hwindow:=0
	else
		parent_hwindow:=parent.hwindow;

	if not exstyle then
		begin
		self.hwindow := windows.CreateWindow(
			GetClassName,       // window class name
			un_name,            // window caption
			self.getstyle,    // window style
			X, //Integer(CW_USEDEFAULT), // initial x position
			Y, //Integer(CW_USEDEFAULT), // initial y position
			W, //Integer(CW_USEDEFAULT), // initial x size
			H, //Integer(CW_USEDEFAULT), // initial y size
			parent_hwindow,              // parent window handle
			0,                      // window menu handle
			hInstance,              // program instance handle
			self);                   // creation parameters
		end
	else
		begin
		self.hwindow := CreateWindowex(
		self.getexstyle,   // extended window style WS_EX_PALETTEWINDOW
		GetClassName,      // window class name
		un_name,           // window caption
		self.getstyle,     // window style
		X,                 // horizontal position of window
		Y,	               // vertical position of window
		W,	               // window width
		H,                 // window height
		parent_hwindow,    // handle to parent or owner window
		0,	               // handle to menu, or child-window identifier
		hInstance,  	     // handle to application instance
		self);             // pointer to window-creation data
		end;
	{ajouter la fenêtre à la liste pour la gestion des messages}
	Global_Listwindow.Add(self);
  SendMessage(hwindow,WM_USER_SETUPWINDOW,hwindow,0);
  ShowWindow(hwindow, SW_SHOW);
  UpDateWindow(hwindow);
	end;

constructor TWindow_pictogramme.Create(un_parent:ardoise.TWinbase);
  begin
  inherited create(un_parent,'Pictogrammes',getsystemmetrics(SM_CXSCREEN)-650,200,
    320,320+getsystemmetrics(SM_CYCAPTION),False);
  self.pictogramme_selectionner:=-1;
  end;

procedure TWindow_pictogramme.WMLButtonDown(var Msg: TMessage);
  var i,j:integer;
      position:integer;
      arect:trect;
      un_point:tpoint;
  begin
  un_point.x:=Smallint(loword(msg.lparam));
  un_point.y:=Smallint(hiword(msg.lparam));
  for i:=1 to 10 do for j:=1 to 10 do
    begin
    position:=pred(i)*10+j-1;
    if (position<Ardoise.window_Main.collection_minecraft.Count) then
      begin
      setrect(arect,pred(i)*32,pred(j)*32,pred(i)*32+32,pred(j)*32+32);
      if ptinrect(arect,un_point) then
        self.pictogramme_selectionner:=position;
      end;
    end;
  end; {TWindow_pictogramme.WMLButtonDown}


procedure TWindow_pictogramme.Paint(PaintDC: HDC; var PaintInfo: TPaintStruct);
  var i,j:integer;
      position:integer;
      memdc:hdc;
      old:hbitmap;
      mon_pictogramme:Ardoise.Tmy_Bitmap;
  begin
  memdc:=createcompatibledc(PaintDC);
  for i:=1 to 10 do for j:=1 to 10 do
    begin
    position:=pred(i)*10+j-1;
    if (position<Ardoise.window_Main.collection_minecraft.Count) then
      begin
      mon_pictogramme:=Ardoise.Tmy_Bitmap(Ardoise.window_Main.collection_minecraft.Items[position]); {écrit par denis bertin le 21.8.2015}
      if mon_pictogramme<>nil then
        begin
        old:=selectobject(memdc,mon_pictogramme.mon_bitmap.Handle);
        StretchBlt(paintdc,pred(i)*32,pred(j)*32,32,32,memdc,0,0,16,16,SRCCOPY);
        selectobject(memdc,old);
        end;
      end;
    end; {for i,j}
  deleteDC(memdc);
  end; {TWindow_pictogramme.Paint}

procedure TWindow_pictogramme.WMCLose(var Msg: TMessage);
  begin
  ardoise.Window_pictogramme:=nil;
  inherited WMCLose(Msg);
  end; {TWindow_pictogramme.WMCLose}

function TWindow_pictogramme.Getstyle:DWORD;
  begin
  result:=ws_popup or ws_caption or ws_sysmenu;
  end;

constructor Twindow_Main.Create(un_parent:ardoise.TWinbase);
  begin
  self.Lecture_des_fichiers_minecraft;
  inherited create(un_parent,'Ardoise',100,100,
    getsystemmetrics(SM_CXSCREEN)-300,getsystemmetrics(SM_CYSCREEN)-200,False);
  Ardoise.Window_ardoise:=Twindow_Ardoise.create(self);
  fenetre_fille:=false;
  self.Creer_les_fenetre_filles;
  Ardoise.Window_ardoise.Reinitialisation;
  end;

constructor Tmy_Bitmap.Create(nom_du_fichier:string);
  begin
  self.mon_bitmap:=tbitmap.create;
  self.mon_bitmap.LoadFromFile(nom_du_fichier);
  end; {écrit par denis B}

procedure Twindow_Main.Lecture_des_fichiers_minecraft;
  var apc_repertoire:pc1024;
      apc_nom_du_fichier:pc1024;
      FileAttrs:integer;
      sr: SysUtils.TSearchRec;
      apc:pc1024;
      pc_nom_du_fichier_installation : pc1024;
      un_fichier_installation:TextFile;

    {Incorporer les pictogrammes dans le programme d'installation}

    procedure Sous_Lecture_des_fichiers_minecraft(name:pchar);
      begin
      strcat(strcat(get_exe_path(apc_repertoire),name),'*.bmp');
      if SysUtils.findfirst(apc_repertoire,FileAttrs, sr) = 0 then
        repeat
        if false then box(0,pchar(sr.Name));
        get_exe_path(apc_nom_du_fichier);
        strcat(strcat(apc_nom_du_fichier,name),pchar(sr.Name));
        if false then box(0,apc_nom_du_fichier);
        if FileExists(apc_nom_du_fichier) then
          begin
          self.collection_minecraft.Add(Ardoise.Tmy_Bitmap.Create(strpas(apc_nom_du_fichier)));
          writeln(un_fichier_installation,'Source: "'+strpas(name)+sr.Name+'"; DestDir: "{app}\'+strpas(name)+'";');
          end;
        until (SysUtils.FindNext(sr) <> 0);
      SysUtils.FindClose(sr);
      end;

  begin
  self.collection_minecraft:=contnrs.TObjectList.create;
  strcat(get_exe_path(pc_nom_du_fichier_installation),'Minecraft.txt'); {denis bertin le 21.8.2015}
  AssignFile(un_fichier_installation,strpas(pc_nom_du_fichier_installation));
  ReWrite(un_fichier_installation);
  Sous_Lecture_des_fichiers_minecraft('Pictogramme\Fabriqués\');
  Sous_Lecture_des_fichiers_minecraft('Pictogramme\Mécanique\');
  Sous_Lecture_des_fichiers_minecraft('Pictogramme\Minerais\');
  Sous_Lecture_des_fichiers_minecraft('Pictogramme\Naturels\');
  Sous_Lecture_des_fichiers_minecraft('Pictogramme\Plantes\');
  if false then
    begin
    inttopchar(self.collection_minecraft.Count,apc);
    box(self.hwindow,pchar('Nombre de fichier = '+strpas(apc)));
    end;
  CloseFile(un_fichier_installation);
  end; {Twindow_Main.Lecture_des_fichier_minecraft}

destructor Twindow_Main.Destroy;
  begin
  if ardoise.Window_palette<>nil then
    ardoise.Window_palette.Free;
  if ardoise.Window_titre<>nil then
    ardoise.Window_titre.Free;
  if ardoise.Window_Graduation<>nil then
    ardoise.Window_Graduation.Free;
  if ardoise.window_State<>nil then
    ardoise.Window_State.Free;
  if ardoise.window_Tools<>nil then
    ardoise.window_Tools.Free;
  inherited Destroy;
  end;

procedure Twindow_Main.Creer_les_fenetre_filles;
  begin
  fenetre_fille:=True;
  if ardoise.Window_palette=nil then
    ardoise.Window_palette:=ardoise.TWindow_palette.create(self);
  if ardoise.Window_titre=nil then
    ardoise.Window_titre:=ardoise.Twindow_titre.create(self);
  if ardoise.Window_Graduation=nil then
    ardoise.Window_Graduation:=Twindow_Graduation.create(self);
  if ardoise.window_State=nil then
    ardoise.Window_State:=Twindow_State.create(self);
  if ardoise.window_Tools=nil then
    ardoise.window_Tools:=Twindow_Tools.create(self);
  postmessage(self.hwindow,wm_size,0,0);
  end;

procedure Twindow_Main.Setupwindow;
  begin
  inherited Setupwindow;
  end;

function  Twindow_Main.Getstyle:DWORD;
  begin
  Getstyle:=WS_OVERLAPPEDWINDOW;
  end;

function  Twindow_Main.GetClassName:PChar;
  begin
  GetClassName:='Logiciel ardoise';
  end;

procedure Twindow_Ardoise.WMChar(var Msg: TMessage); {Table des caractères : dbs/n-Les raccourcis - clavier}
  const kpc_echap = chr(27);
  begin
  if (chr(loword(msg.wparam))='?') or  (chr(loword(msg.wparam))=',') then
    Window_About:=Twindow_About.Create(self)
  else if (chr(loword(msg.wparam))='N') or (chr(loword(msg.wparam))='n') then
    ardoise.Window_titre.Nouveau_document
  else if (chr(loword(msg.wparam))='O') or (chr(loword(msg.wparam))='o') then
    ardoise.Window_titre.Ouvrir_un_document
  else if (chr(loword(msg.wparam))='E') or (chr(loword(msg.wparam))='e') then
    ardoise.Window_titre.Enregistrer_un_document
  else if (chr(loword(msg.wparam))='S') or (chr(loword(msg.wparam))='s') then
    ardoise.Window_titre.Enregistrer_sous_un_document
  else if (chr(loword(msg.wparam))='A') or (chr(loword(msg.wparam))='a') then
    ardoise.Window_titre.Creer_une_ardoise
  else if (chr(loword(msg.wparam))='Q') or (chr(loword(msg.wparam))='q') then
    ardoise.Window_titre.Quadrillage
  else if (chr(loword(msg.wparam))='C') or (chr(loword(msg.wparam))='c') then
    ardoise.Window_titre.Copier_l_image
  else if (chr(loword(msg.wparam))='Z') or (chr(loword(msg.wparam))='z') then
    ardoise.Window_Tools.Annuler_la_fonction
  else if (chr(loword(msg.wparam))='F') or (chr(loword(msg.wparam))='P')
  or (chr(loword(msg.wparam))='f') or (chr(loword(msg.wparam))='p') then
    ardoise.Window_ardoise.Pleine_ecran
  else if (chr(loword(msg.wparam))=kpc_echap) then
    ardoise.Window_ardoise.revenir_a_l_etat_fenetre;
  end; {Twindow_Ardoise.WMChar}

procedure Twindow_Ardoise.Revenir_a_l_etat_fenetre;
  var MyPlacement:TWindowPlacement;
  begin
  if self.bool_condition_echapement then
    begin
    if False then
      box(ardoise.Window_Main.hwindow,'ici');
    windows.SetWindowPos(ardoise.Window_Main.hwindow,0,
        Placement.rcNormalPosition.left,
        Placement.rcNormalPosition.top,
        Placement.rcNormalPosition.Right-Placement.rcNormalPosition.left,
        Placement.rcNormalPosition.Bottom-Placement.rcNormalPosition.top,0);
    if True then
      Sendmessage(ardoise.Window_Main.hwindow,wm_size,0,0);
    windows.GetWindowPlacement(ardoise.Window_titre.hwindow,@MyPlacement);
    if false then
      bool_condition_echapement:=true;
    end;
  end; {Twindow_Ardoise.Revenir_a_l_etat_fenetre}

procedure Twindow_Ardoise.Pleine_ecran;
  begin
  self.bool_condition_echapement:=true;
  {l'accès à la variable Placement de fait si cette fonction est renseigné}
  windows.GetWindowPlacement(ardoise.Window_Main.hwindow,@Placement);
  windows.SetWindowPos(ardoise.Window_Main.hwindow,0,
    -7,-7-getsystemmetrics(SM_CYCAPTION),getsystemmetrics(SM_CXSCREEN)+7*2,getsystemmetrics(SM_CYSCREEN),0);
  if false then
    sendmessage(ardoise.Window_Main.hwindow,wm_size,0,0);
  end; {Twindow_Ardoise.Pleine_ecran}

procedure Twindow_Ardoise.Dessine_un_polygone; {écrit aujourd'hui par denis bertin le 7 septembre 2015}
  const nb_sommet = 5;
        k_bool_les_rayons = true;
  var   i,j:integer;
        adc,memdc:hdc;
        old_bitmap:hbitmap;
        graphics:gdipobj.TGPGraphics;
        pen:TGPpen;
        arect:trect;
        hauteur:integer;
        position_du_centre:integer;
        centre:tpoint;
        la_couleur:tcolorref;
  begin
  self.bitmap_annuler.Assign(self.mon_bitmap);
  adc:=getdc(self.hwindow);
  memdc:=createcompatibledc(adc);
  old_bitmap:=selectobject(memdc,self.mon_bitmap.Handle);
  graphics:=gdipobj.TGPGraphics.Create(memdc);
  graphics.SetSmoothingMode(SmoothingModeAntiAlias);
  graphics.SetSmoothingMode(SmoothingModeHighQuality);
  graphics.SetTextRenderingHint(TextRenderingHintAntiAlias);
  {Détermination de la position du centre}
  getclientrect(self.hwindow,arect);
  hauteur:=arect.bottom div 12;
  position_du_centre:=(arect.right div hauteur) div 2;
  centre.x:=position_du_centre*hauteur;
  hauteur:=arect.bottom div 12;
  position_du_centre:=(arect.bottom div hauteur) div 2;
  centre.y:=position_du_centre*hauteur;
  {Parcours des polygones}
  for j:=16 downto 3 do
    begin
    la_couleur:=Get_HLS_RGB((j-5)/16*360,0.5,1);
    pen:=TGPpen.Create(MakeColor(255,
      GetRValue(la_couleur),
      GetGValue(la_couleur),
      GetBValue(la_couleur)),rayon div 5);
    for i:=0 to pred(j) do
      begin
      graphics.DrawLine(pen,
        centre.x+cos(i/j*pi*2)*arect.bottom/3,
        centre.y+sin(i/j*pi*2)*arect.bottom/3,
        centre.x+cos(succ(i)/j*pi*2)*arect.bottom/3,
        centre.y+sin(succ(i)/j*pi*2)*arect.bottom/3);
      if k_bool_les_rayons then
        begin
        graphics.DrawLine(pen,
          centre.x,centre.y,
          centre.x+cos(i/j*pi*2)*arect.bottom/3,
          centre.y+sin(i/j*pi*2)*arect.bottom/3);
        end;
      end;
    pen.Free;
    end;
  {Libération des bitmaps}
  selectobject(memdc,old_bitmap);
  deleteDC(memdc);
  releasedc(self.hwindow,adc);
  ardoise.Window_Tools.fonction_annuler_valide:=True;
  invalidaterect(ardoise.Window_Tools.hwindow,nil,false);
  invalidaterect(self.hwindow,nil,false);
  updatewindow(self.hwindow);
  end; {Twindow_Ardoise.Dessine_un_polygone}

procedure Twindow_Ardoise.dessine_une_spirale; {écrit par denis bertin le 5.9.2015}
type
    PPointFArray = ^TPointFArray;
    TPointFArray = ARRAY[0..16380] of TGPPointF;
  var i,j:integer;
      adc,memdc:hdc;
      centre:tpoint;
      old_bitmap:hbitmap;
      graphics:gdipobj.TGPGraphics;
      arect:trect;
      hauteur:integer;
      position_du_centre:integer;
      point_de_depart:tpoint;
      point_suivant:tpoint;
      pen:TGPpen;
      nb_point:integer;
      tab_size:integer;
      tab_calculer:PPointFArray;
      angle,raison:real;
   const k_max=360; {°}
  begin
  self.bitmap_annuler.Assign(self.mon_bitmap);
  adc:=getdc(self.hwindow);
  memdc:=createcompatibledc(adc);
  old_bitmap:=selectobject(memdc,self.mon_bitmap.Handle);
  graphics:=gdipobj.TGPGraphics.Create(memdc);
  graphics.SetSmoothingMode(SmoothingModeAntiAlias);
  graphics.SetSmoothingMode(SmoothingModeHighQuality);
  graphics.SetTextRenderingHint(TextRenderingHintAntiAlias);
  {Détermination de la position du centre}
  getclientrect(self.hwindow,arect);
  hauteur:=arect.bottom div 12;
  position_du_centre:=(arect.right div hauteur) div 2;
  centre.x:=position_du_centre*hauteur;
  hauteur:=arect.bottom div 12;
  position_du_centre:=(arect.bottom div hauteur) div 2;
  centre.y:=position_du_centre*hauteur;
  {Parcours de la spirale}
  pen:=TGPpen.Create(MakeColor(255,
    GetRValue(la_couleur_du_pinceau),
    GetGValue(la_couleur_du_pinceau),
    GetBValue(la_couleur_du_pinceau)),rayon div 5);
  point_de_depart:=centre;
  {Pour obtenir un tracé signal - continue}
  nb_point:=0;
  for j:=1 to 8 do
    for i:=0 to k_max do
      begin
      inc(nb_point);
      end;
  tab_size:=succ(nb_point)*sizeof(TGPPointF);
  {Symétrie des allocations}
  getmem(tab_calculer,tab_size);
  raison:=1;
  nb_point:=0;
  for j:=1 to 8 do
    for i:=0 to k_max do
      begin
      angle:=i/k_max*pi*2;
      tab_calculer[nb_point].x:=centre.x+round(cos(angle)*raison);
      tab_calculer[nb_point].y:=centre.y+round(sin(angle)*raison);
      if nb_point<>0 then
        begin
        if distance(round(tab_calculer[pred(nb_point)].x),
          round(tab_calculer[pred(nb_point)].y),
          round(tab_calculer[nb_point].x),
          round(tab_calculer[nb_point].y))>3 then
            inc(nb_point);
        end
      else
        inc(nb_point);
      raison:=raison+0.1; {0.333}
      end;
  graphics.DrawLines(pen,PGPPointF(tab_calculer),nb_point);
  freemem(tab_calculer,tab_size); {symétriquement}
  pen.Free;
  {Libération des bitmaps}
  selectobject(memdc,old_bitmap);
  deleteDC(memdc);
  releasedc(self.hwindow,adc);
  ardoise.Window_Tools.fonction_annuler_valide:=True;
  invalidaterect(ardoise.Window_Tools.hwindow,nil,false);
  invalidaterect(self.hwindow,nil,false);
  updatewindow(self.hwindow);
  end; {Twindow_Ardoise.dessine_une_spirale}

procedure Twindow_Ardoise.Dessine_des_cercles_concentrique;
  var i:integer;
      adc,memdc:hdc;
      old_bitmap:hbitmap;
      centre:tpoint;
      graphics:gdipobj.TGPGraphics;
      pen:TGPpen;
      arect:trect;
      position_du_centre,
        hauteur,
        maximum:integer;
  begin
  self.bitmap_annuler.Assign(self.mon_bitmap);
  adc:=getdc(self.hwindow);
  memdc:=createcompatibledc(adc);
  old_bitmap:=selectobject(memdc,self.mon_bitmap.Handle);
  graphics:=gdipobj.TGPGraphics.Create(memdc);
  graphics.SetSmoothingMode(SmoothingModeAntiAlias);
  graphics.SetSmoothingMode(SmoothingModeHighQuality);
  graphics.SetTextRenderingHint(TextRenderingHintAntiAlias);
  {Détermination de la position du centre}
  getclientrect(self.hwindow,arect);
  hauteur:=arect.bottom div 12;
  position_du_centre:=(arect.right div hauteur) div 2;
  centre.x:=position_du_centre*hauteur;
  hauteur:=arect.bottom div 12;
  position_du_centre:=(arect.bottom div hauteur) div 2;
  centre.y:=position_du_centre*hauteur;
  {Parcours des cercles}
  pen:=TGPpen.Create(MakeColor(255,
    GetRValue(la_couleur_du_pinceau),
    GetGValue(la_couleur_du_pinceau),
    GetBValue(la_couleur_du_pinceau)),rayon div 5);
  maximum:=(math.min(arect.Right,arect.bottom) div hauteur) div 2;
  for i:=1 to pred(maximum) do
    graphics.DrawEllipse(pen,centre.x-i*hauteur,centre.y-i*hauteur,2*i*hauteur,2*i*hauteur);
  pen.Free;
  {Libération des bitmaps}
  selectobject(memdc,old_bitmap);
  deleteDC(memdc);
  releasedc(self.hwindow,adc);
  ardoise.Window_Tools.fonction_annuler_valide:=True;
  invalidaterect(ardoise.Window_Tools.hwindow,nil,false);
  invalidaterect(self.hwindow,nil,false);
  updatewindow(self.hwindow);
  end; {Twindow_Ardoise.Dessine_des_cercles_concentrique}

procedure Twindow_Ardoise.dessine_une_planete; {écrit par denis Bertin le 8.8.2015}
  type
    PPointFArray = ^TPointFArray;
    TPointFArray = ARRAY[0..16380] of TGPPointF;
  var i,j,nb_point,tab_size:integer;
      adc,memdc:hdc;
      old_bitmap:hbitmap;
      graphics:gdipobj.TGPGraphics;
      pen:TGPpen;
      tab_calculer:PPointFArray;
      arect:trect;
      un_angle,rayon_deux:real;
      millieu:tpoint;
      hauteur:integer;
      position_du_centre:integer;
  begin
  adc:=getdc(self.hwindow);
  memdc:=createcompatibledc(adc);
  self.bitmap_annuler.Assign(self.mon_bitmap);
  old_bitmap:=selectobject(memdc,self.mon_bitmap.Handle);
  graphics:=gdipobj.TGPGraphics.Create(memdc);
  graphics.SetSmoothingMode(SmoothingModeAntiAlias);
  graphics.SetSmoothingMode(SmoothingModeHighQuality);
  graphics.SetTextRenderingHint(TextRenderingHintAntiAlias);
  getclientrect(self.hwindow,arect);
  hauteur:=arect.bottom div 12;
  position_du_centre:=(arect.right div hauteur) div 2;
  millieu.x:=position_du_centre*hauteur;
  hauteur:=arect.bottom div 12;
  position_du_centre:=(arect.bottom div hauteur) div 2;
  millieu.y:=position_du_centre*hauteur;
  pen:=TGPpen.Create(MakeColor(255,
    GetRValue(la_couleur_du_pinceau),
    GetGValue(la_couleur_du_pinceau),
    GetBValue(la_couleur_du_pinceau)),rayon div 5);
  nb_point:=0;
  for i:=1 to 361 do inc(nb_point);
  tab_size:=succ(nb_point)*sizeof(TGPPointF);
  {Symétrie des allocations}
  getmem(tab_calculer,tab_size);
  rayon_deux:=math.min(self.mon_bitmap.Width,self.mon_bitmap.Height)*0.4;
  if true then
    begin
    for j:=0 to 3 do
      begin
      nb_point:=0;
      for i:=0 to 360 do
        begin
        un_angle:=i/180*pi; {Transformation en radian}
        tab_calculer[i].x:=millieu.x+cos(un_angle)*rayon_deux*(j/3);
        tab_calculer[i].y:=millieu.y+sin(un_angle)*rayon_deux;
        inc(nb_point);
        end;
      graphics.DrawLines(pen,PGPPointF(tab_calculer),nb_point);
      end;
    end;
  if true then
    begin
    for j:=0 to 3 do
      begin
      nb_point:=0;
      for i:=0 to 360 do
        begin
        un_angle:=i/180*pi; {Transformation en radian}
        tab_calculer[i].x:=millieu.x+cos(un_angle)*rayon_deux;
        tab_calculer[i].y:=millieu.y+sin(un_angle)*rayon_deux*(j/3);
        inc(nb_point);
        end;
      graphics.DrawLines(pen,PGPPointF(tab_calculer),nb_point);
      end;
    end;
  for j:=0 to 3 do
    begin
    nb_point:=0;
    for i:=0 to 360 do
      begin
      un_angle:=i/180*pi; {Transformation en radian}
      tab_calculer[i].x:=millieu.x+cos(un_angle)*rayon_deux*(j/3);
      tab_calculer[i].y:=millieu.y+sin(un_angle)*rayon_deux*(j/3);
      inc(nb_point);
      end;
    graphics.DrawLines(pen,PGPPointF(tab_calculer),nb_point);
    end;
  freemem(tab_calculer,tab_size);
  pen.free;
  selectobject(memdc,old_bitmap);
  deleteDC(memdc);
  releasedc(self.hwindow,adc);
  ardoise.Window_Tools.fonction_annuler_valide:=True;
  invalidaterect(ardoise.Window_Tools.hwindow,nil,false);
  invalidaterect(self.hwindow,nil,false);
  updatewindow(self.hwindow);
  end; {Twindow_Ardoise.dessine_une_planete}

procedure Twindow_Main.WMChar(var Msg: TMessage);
  begin
  postmessage(ardoise.Window_ardoise.hwindow,wm_char,msg.WParam,msg.LParam);
  if false then
    box(self.hwindow,'?');
  end; {Twindow_Main.WMChar-écrit par denis bertin}

procedure Twindow_Main.WMSize(var Msg: TMessage);
  var arect:trect;
  begin
  getclientrect(self.hwindow,arect);
  if ardoise.Window_Ardoise<>nil then
    begin
    Movewindow(ardoise.Window_Ardoise.hwindow,pred(80),37,arect.Right-92-pred(80)+1,arect.bottom-68,True);
    end;
  if ardoise.Window_Tools<>nil then
    begin
    Movewindow(ardoise.Window_Tools.hwindow,0,37,80,arect.bottom-68,True);
    end;
  if ardoise.Window_State<>nil then
    begin
    Movewindow(ardoise.Window_State.hwindow,0,arect.bottom-32,arect.Right,32,True);
    end;
  if ardoise.Window_palette<>nil then
    begin
    Movewindow(ardoise.Window_palette.hwindow,arect.Right-92,37,92,arect.bottom-32-38+2,True);
    end;
  if ardoise.Window_titre<>nil then
    begin
    Movewindow(ardoise.Window_titre.hwindow,0,0,580,38,True);
    end;
  if ardoise.Window_Graduation<>nil then
    begin
    Movewindow(ardoise.Window_Graduation.hwindow,579,0,arect.right-579,38,True);
    end;
  end;

constructor Twindow_Ardoise.create(un_parent:ardoise.TWinbase);
  const k_palette = 'Palette';
  begin
  self.bool_condition_echapement:=False;
  self.souris_down:=false;
  self.suite_de_spline:=false;
  self.mon_bitmap:=tbitmap.Create;
  self.flipflop:=tbitmap.Create;
  {Déterminer par la résolution de l'écran}
  self.mon_bitmap.Width:=getsystemmetrics(SM_CXSCREEN);
  self.mon_bitmap.height:=getsystemmetrics(SM_CYSCREEN);
  self.une_image_tres_rapide.Copy(self.mon_bitmap);
  self.bitmap_annuler:=tbitmap.Create;
  self.mon_masque:=tbitmap.Create;
  self.mon_masque.Width:=self.mon_bitmap.Width;
  self.mon_masque.Height:=self.mon_bitmap.Height;
  //mon_masque.PixelFormat:=Graphics.pf8bit;
  mon_masque.monochrome:=true;
  self.reinitialiser_le_masque;
  inherited create(un_parent,'Ardoise',-1,-1,0,0,False);
  end; {Twindow_Ardoise.create}

procedure Twindow_Ardoise.reinitialiser_le_masque;
  var i,j:integer;
  begin
  {Initialisation à vide du masque transparent des Png le 14.11.2015}
  for i:=0 to pred(self.mon_masque.Width) do
    for j:=0 to pred(self.mon_masque.Height) do
     mon_masque.canvas.pixels[i,j]:=clblack; //clwhite
  end;

destructor Twindow_Ardoise.Destroy;
  begin
  self.bitmap_annuler.Free;
  self.flipflop.Free;
  self.mon_bitmap.Free;
  inherited Destroy;
  end;

function Twindow_Ardoise.Getstyle:DWORD;
  begin
  result:=WS_child or WS_VISIBLE or WS_CLIPCHILDREN or ws_border;
  end;

function Twindow_Ardoise.GetClassName:PChar;
  begin
  GetClassName:=ardoise.k_Ardoise;
  end;

procedure Twindow_Ardoise.setupwindow;
  var un_icon:hicon;
  const k_ardoise = 'ARDOISE';
  begin
  inherited setupwindow;
  un_icon:=LoadIcon(hinstance,k_ardoise);
  SetClassLong(self.hwindow,GCL_HICON,un_icon);
  end;

procedure Twindow_Ardoise.Paint(PaintDC: HDC; var PaintInfo: TPaintStruct);
  var memdc:hdc;
      old_bitmap:hbitmap;
      arect:trect;
  begin
  getclientrect(hwindow,arect);
  memdc:=createcompatibledc(paintdc);
  old_bitmap:=selectobject(memdc,self.mon_bitmap.Handle);
	with arect do bitblt(paintdc,0,0,right,bottom,memdc,0,0,SRCCOPY);
	selectobject(memdc,old_bitmap);
	deleteDC(memdc);
  end;

procedure Twindow_Ardoise.WMMousemove(var msg:TMessage);
  var un_point:tpoint;
  begin
  if self.souris_down then
    begin
    un_point.x:=Smallint(loword(msg.lparam));
	  un_point.y:=Smallint(hiword(msg.lparam));
    case ardoise.Tool_de_tracer of
      Tool_line,
        Tool_rectangle,
        Tool_cercle:
          self.Dessin_des_formes(un_point);
      Tool_spray:
        self.Dessine_le_spray(un_point,true);
      Tool_spline:
        if not self.suite_de_spline then
          self.Dessin_des_formes(un_point)
        else
          self.Dessine_la_spline(un_point);
      Tool_Flood_fill:;
      Tool_selected:;
      end; {case}
    end; {souris down}
  if Window_State<>nil then
    sendmessage(Window_State.hwindow,WM_USER_Show_coordinate,msg.WParam,msg.LParam);
  end;

procedure Twindow_Ardoise.Remplissage_de_forme_16x16(calculted_point:tpoint);  
  var une_image_finale:tbitmap;
      une_image_actuel,la_trame,une_image_finale_rapide:Ardoise.TFastBitmap2;
      une_couleur:tcolorref;
      mon_pictogramme:Ardoise.Tmy_Bitmap;
      une_couleur_16x16:tcolorref;
      acursor:hcursor;
      xx,ileft,iright:integer;
      encore:boolean;

  {Une méthode récursive qui s'appel-elle même avec sizeof(x)=32bits + sizeof(y)=32bits soit 8 octets}
  {Stockés dans la Pile symbole ESP pour Extended Stack Pointer}
  {Un kilo-octet 1000}
  {Un Méga-octet 1000.000 égal un million}
  {Un Giga-octet 1000.000.000 égal un milliard}
  procedure FloodFill(x,y:integer);
    var i:integer;
    begin
    if (x>=0) and (y>=0) and (x<une_image_actuel.w) and (y<une_image_actuel.h) then
      begin
      if une_image_actuel.GetPixel_in_limite(x,y)=une_couleur then
        begin
        une_image_actuel.SetPixel(x,y,une_couleur xor $ffffff);
        une_couleur_16x16:=la_trame.GetPixel(x mod 16,y mod 16);
        une_image_finale_rapide.SetPixel(x,y,une_couleur_16x16);
        xx:=x;
        encore:=true;
        while encore do
          begin
          dec(x);
          if (x>=0) then
            begin
            if une_image_actuel.GetPixel_in_limite(x,y)=une_couleur then
              begin
              une_image_actuel.SetPixel(x,y,une_couleur xor $ffffff);
              une_couleur_16x16:=la_trame.GetPixel(x mod 16,y mod 16);
              une_image_finale_rapide.SetPixel(x,y,une_couleur_16x16);
              end
            else
              encore:=false;
            end
          else
            encore:=false;
          end;
        ileft:=x;
        x:=xx;
        encore:=true;
        while encore do
          begin
          inc(x);
          if x<une_image_actuel.w then
            begin
            if une_image_actuel.GetPixel_in_limite(x,y)=une_couleur then
              begin
              une_image_actuel.SetPixel(x,y,une_couleur xor $ffffff);
              une_couleur_16x16:=la_trame.GetPixel(x mod 16,y mod 16);
              une_image_finale_rapide.SetPixel(x,y,une_couleur_16x16);
              end
            else
              encore:=false;
            end
          else
            encore:=false;
          end;
        iright:=x;
        x:=xx;
        for i:=ileft to iright do
          begin
          FloodFill(i,y-1);
          FloodFill(i,y+1);
          end;
        end;
      end;
    end; {FloodFill}

  begin
  try
    acursor:=setcursor(loadcursor(hinstance,idc_wait));
    une_image_finale:=tbitmap.Create;
    une_image_finale.Assign(self.mon_bitmap);
    une_image_finale_rapide.Copy(une_image_finale);
    une_image_actuel.Copy(self.mon_bitmap);
    with calculted_point do une_couleur:=une_image_actuel.GetPixel(x,y);
    {Obtenir la trame de 16x16 pixels}
    mon_pictogramme:=Ardoise.Tmy_Bitmap(
      Ardoise.window_Main.collection_minecraft.Items[ardoise.Window_pictogramme.pictogramme_selectionner]);
    la_trame.Copy(mon_pictogramme.mon_bitmap);
    {Parcours de l'image}
    with calculted_point do FloodFill(x,y);
    self.mon_bitmap.Assign(une_image_finale);
    une_image_finale.Free;
    invalidaterect(self.hwindow,nil,false);
    updatewindow(self.hwindow);
    setcursor(acursor);
  except
    end;
  end; {Twindow_Ardoise.Remplissage_de_forme_16x16}

procedure Twindow_Ardoise.Remplissage_de_forme_uniforme(calculted_point:tpoint);
  var adc,memdc:hdc;
      une_couleur:tcolorref;
      old_bitmap:hbitmap;
      abrush:hbrush;
  begin
  adc:=getdc(self.hwindow);
  memdc:=createcompatibledc(adc);
  old_bitmap:=selectobject(memdc,self.mon_bitmap.Handle);
  with calculted_point do
    une_couleur:=getpixel(memdc,x,y);
  abrush:=SelectObject(Memdc,CreateSolidBrush(ardoise.la_couleur_du_pinceau));
  with calculted_point do
    Windows.ExtFloodFill(Memdc,x,y,une_couleur,FLOODFILLSURFACE); //Ce_plot_d_une_couleur
  SelectObject(Memdc,abrush);
  selectobject(memdc,old_bitmap);
  deleteDC(memdc);
  releasedc(self.hwindow,adc);
  invalidaterect(self.hwindow,nil,false);
  updatewindow(self.hwindow);
  end; {Twindow_Ardoise.Remplissage_de_forme_uniforme}

procedure Twindow_Ardoise.WMLButtonDown(var Msg: TMessage);
  var un_point:tpoint;
  Begin
  if not self.suite_de_spline then
    self.bitmap_annuler.Assign(self.mon_bitmap);
  self.flipflop.Assign(self.mon_bitmap);
  ardoise.Window_Tools.fonction_annuler_valide:=true;
  invalidaterect(ardoise.Window_Tools.hwindow,nil,false);
  self.souris_down:=true;
  un_point.x:=Smallint(loword(msg.lparam));
  un_point.y:=Smallint(hiword(msg.lparam));
  if not self.suite_de_spline then
    begin
    self.point_de_depart:=un_point;
    end;
  case ardoise.Tool_de_tracer of
    Tool_line,
      Tool_rectangle,
      Tool_cercle:
        self.Dessin_des_formes(un_point);
      Tool_spline:
       if not self.suite_de_spline then
        self.Dessin_des_formes(un_point);
    Tool_spray:
      self.Dessine_le_spray(un_point,true);
    Tool_Flood_fill:
      if (ardoise.Window_pictogramme<>nil)
      and (ardoise.Window_pictogramme.pictogramme_selectionner<>-1) then
        self.Remplissage_de_forme_16x16(un_point)
      else
        self.Remplissage_de_forme_uniforme(un_point);
    Tool_selected:;
    end; {case}
  end; {Twindow_Ardoise.WMLButtonDown}

procedure Twindow_Ardoise.WMRButtonDown(var Msg: TMessage);
  begin
  if false then
    Twindow_Main(parent).Creer_les_fenetre_filles;
  end;

procedure Twindow_Ardoise.WMLButtonUp(var Msg: TMessage);
  var une_ligne:ardoise.TUne_ligne;
      un_rectangle:ardoise.Tun_rectangle;
      un_cercle:ardoise.TUn_cercle;
      un_Spline:ardoise.TUne_Spline;
      un_point:tpoint;
      apc:pc100;
      adc:hdc;
      arect:trect;
      afont:hfont;
  begin
  self.souris_down:=false;
  case ardoise.Tool_de_tracer of
    Tool_line:
      begin
      une_ligne:=ardoise.TUne_ligne.Create;
      une_ligne.a.x:=self.point_de_depart.x;
      une_ligne.a.y:=self.point_de_depart.y;
      un_point.x:=Smallint(loword(msg.lparam));
    	un_point.y:=Smallint(hiword(msg.lparam));
      une_ligne.b.x:=un_point.x;
      une_ligne.b.y:=un_point.y;
      une_ligne.epaisseur:=rayon;
      une_ligne.couleur:=la_couleur_du_pinceau;
      ardoise.Collection.Add(une_ligne);
      ardoise.Window_State.longueur:=-1;
      invalidaterect(ardoise.Window_State.hwindow,nil,false);
      Ardoise.Window_ardoise.mon_masque.canvas.Pen.Color:=clwhite;
      Ardoise.Window_ardoise.mon_masque.canvas.Pen.Width:=rayon div 5;
      with self.point_de_depart do
        Ardoise.Window_ardoise.mon_masque.canvas.MoveTo(x,y);
      with un_point do
        Ardoise.Window_ardoise.mon_masque.canvas.LineTo(x,y);
      end;
    Tool_rectangle:
      begin
      un_rectangle:=ardoise.TUn_rectangle.Create;
      un_rectangle.a.x:=self.point_de_depart.x;
      un_rectangle.a.y:=self.point_de_depart.y;
      un_rectangle.b.x:=Smallint(loword(msg.lparam));
      un_rectangle.b.y:=Smallint(hiword(msg.lparam));
      un_rectangle.epaisseur:=rayon;
      un_rectangle.couleur:=la_couleur_du_pinceau;
      ardoise.Collection.Add(un_rectangle);
      ardoise.Window_State.largeur:=-1;
      ardoise.Window_State.hauteur:=-1;
      invalidaterect(ardoise.Window_State.hwindow,nil,false);
      Ardoise.Window_ardoise.mon_masque.canvas.Brush.Color:=clblack;
      Ardoise.Window_ardoise.mon_masque.canvas.Pen.Color:=clwhite;
      Ardoise.Window_ardoise.mon_masque.canvas.Pen.Width:=rayon div 5;
      Ardoise.Window_ardoise.mon_masque.canvas.Rectangle(
        self.point_de_depart.x,self.point_de_depart.y,
        Smallint(loword(msg.lparam)),Smallint(hiword(msg.lparam)));
      end;
    Tool_cercle:
      begin
      un_cercle:=ardoise.TUn_cercle.Create;
      un_cercle.centre.x:=self.point_de_depart.x;
      un_cercle.centre.y:=self.point_de_depart.y;
      un_cercle.rayon:=ardoise.distance(
        self.point_de_depart.x,
        self.point_de_depart.y,
        Smallint(loword(msg.lparam)),
        Smallint(hiword(msg.lparam)));
      un_cercle.epaisseur:=rayon;
      un_cercle.couleur:=la_couleur_du_pinceau;
      ardoise.Collection.Add(un_cercle);
      ardoise.Window_State.rayon:=-1;
      ardoise.Window_State.grand_rayon:=-1;
      ardoise.Window_State.petit_rayon:=-1;
      invalidaterect(ardoise.Window_State.hwindow,nil,false);
      Ardoise.Window_ardoise.mon_masque.canvas.Brush.Color:=clblack;
      Ardoise.Window_ardoise.mon_masque.canvas.Pen.Color:=clwhite;
      Ardoise.Window_ardoise.mon_masque.canvas.Pen.Width:=rayon div 5;
      Ardoise.Window_ardoise.mon_masque.canvas.Ellipse(
        self.point_de_depart.x-round(un_cercle.rayon),
        self.point_de_depart.y-round(un_cercle.rayon),
        self.point_de_depart.x+round(un_cercle.rayon),
        self.point_de_depart.y+round(un_cercle.rayon));
      end;
    Tool_Spline:
      begin
      if self.suite_de_spline then
        begin
        un_spline:=ardoise.TUne_spline.Create;
        un_spline.a.x:=self.point_de_depart.x;
        un_spline.a.y:=self.point_de_depart.y;
        un_spline.b.x:=Smallint(loword(msg.lparam));
        un_spline.b.y:=Smallint(hiword(msg.lparam));
        un_spline.c.x:=self.terminaison.x;
        un_spline.c.y:=self.terminaison.y;
        un_spline.epaisseur:=rayon;
        un_spline.couleur:=la_couleur_du_pinceau;
        ardoise.Collection.Add(un_spline);
        self.Reinitialisation;
        end;
      self.suite_de_spline:=not self.suite_de_spline;
      if self.suite_de_spline then
        self.souris_down:=True
      else
        self.souris_down:=False;
      Reinitialisation;
      end;
    end; {case de vierzon}
  end; {Twindow_Ardoise.WMLButtonUp}

procedure Twindow_Ardoise.Reinitialisation;
  begin
  Window_State.longueur:=-1;
  Window_State.rayon:=-1;
  Window_State.largeur:=-1;
  Window_State.hauteur:=-1;
  Window_State.grand_rayon:=-1;
  Window_State.petit_rayon:=-1;
  invalidaterect(ardoise.Window_State.hwindow,nil,false);
  end; {Twindow_Ardoise.Reinitialisation}

procedure Twindow_Ardoise.Dessin_des_formes(calculted_point:tpoint);
  var adc,memdc:hdc;
      old_bitmap:hbitmap;
      une_distance,un_angle:real;
      graphics:gdipobj.TGPGraphics;
      pen:TGPpen;
      bool_controle:boolean;
      bool_Majuscule:boolean;
      minimum:integer;
  begin
  bool_controle:=(GetKeyState(vk_Control)<0) or k_pastel;
  bool_Majuscule:=(GetKeyState(vk_Shift)<0) or k_controle;
  adc:=getdc(self.hwindow);
  memdc:=createcompatibledc(adc);
  self.mon_bitmap.Assign(self.flipflop);
  old_bitmap:=selectobject(memdc,self.mon_bitmap.Handle);
  graphics:=gdipobj.TGPGraphics.Create(memdc);
  graphics.SetSmoothingMode(SmoothingModeAntiAlias);
  graphics.SetSmoothingMode(SmoothingModeHighQuality);
  graphics.SetTextRenderingHint(TextRenderingHintAntiAlias);
  pen:=TGPpen.Create(MakeColor(255,
    GetRValue(la_couleur_du_pinceau),
    GetGValue(la_couleur_du_pinceau),
    GetBValue(la_couleur_du_pinceau)),rayon div 5);

  if type_de_tracer = TdT_rond then
    begin
    Pen.SetStartCap(LineCapRound);
    Pen.SetEndCap(LineCapRound);
    Pen.SetLineJoin(LineJoinRound);
    end
  else
    begin
    Pen.SetStartCap(LineCapSquare);
    Pen.SetEndCap(LineCapSquare);
    Pen.SetLineJoin(LineJoinMiter);
    end;

  case ardoise.Tool_de_tracer of
    Tool_line,Tool_spline:
      begin
      self.terminaison.x:=calculted_point.x;
      self.terminaison.y:=calculted_point.y;
      if bool_controle or bool_Majuscule then
        begin
        une_distance:=round(ardoise.distance(
          self.point_de_depart.x,self.point_de_depart.y,
          calculted_point.x,calculted_point.y));
        if bool_Majuscule then
          un_angle:=round(ardoise.angle_degree(
            self.point_de_depart.x,self.point_de_depart.y,
            calculted_point.x,calculted_point.y)/45)*45*pi/180
        else
          un_angle:=round(ardoise.angle_degree(
            self.point_de_depart.x,self.point_de_depart.y,
            calculted_point.x,calculted_point.y)/10)*10*pi/180;
        graphics.DrawLine(pen,
          self.point_de_depart.x,self.point_de_depart.y,
          self.point_de_depart.x+cos(un_angle)*une_distance,
          self.point_de_depart.y-sin(un_angle)*une_distance);
        ardoise.Window_State.longueur:=round(
          distance(self.point_de_depart.x,self.point_de_depart.y,
            round(self.point_de_depart.x+cos(un_angle)*une_distance),
            round(self.point_de_depart.y-sin(un_angle)*une_distance)));
        invalidaterect(ardoise.Window_State.hwindow,nil,false);
        updatewindow(ardoise.Window_State.hwindow);
        end
      else
        begin
        graphics.DrawLine(pen,
          self.point_de_depart.x,self.point_de_depart.y,
          calculted_point.x,calculted_point.y);
        ardoise.Window_State.longueur:=round(
          distance(
            self.point_de_depart.x,self.point_de_depart.y,
            calculted_point.x,calculted_point.y));
        invalidaterect(ardoise.Window_State.hwindow,nil,false);
        updatewindow(ardoise.Window_State.hwindow);
        end;
      end;
    Tool_rectangle:
      begin
      if bool_controle then
        begin
        {écrit par denis bertin pour le grand bal du 15 Août 2015}
        minimum:=math.Min(
          calculted_point.x-self.point_de_depart.x,
          calculted_point.y-self.point_de_depart.y);
        {Pour obtenir un pur carré}
        graphics.DrawRectangle(pen,
          self.point_de_depart.x,self.point_de_depart.y,
          minimum,minimum);
        ardoise.Window_State.largeur:=abs(minimum);
        ardoise.Window_State.hauteur:=abs(minimum);
        end
      else if bool_Majuscule then
        begin
        //To draw from the center of the starting point.
        minimum:=math.Min(
          calculted_point.x-self.point_de_depart.x,
          calculted_point.y-self.point_de_depart.y) div 2;
        graphics.DrawRectangle(pen,
          self.point_de_depart.x - minimum,self.point_de_depart.y - minimum,
            minimum*2, minimum*2);
        ardoise.Window_State.largeur:=abs(minimum)*2;
        ardoise.Window_State.hauteur:=abs(minimum)*2;
        end
      else
        begin
        graphics.DrawRectangle(pen,
          self.point_de_depart.x,self.point_de_depart.y,
          calculted_point.x-self.point_de_depart.x,calculted_point.y-self.point_de_depart.y);
        ardoise.Window_State.largeur:=abs(self.point_de_depart.x-calculted_point.x);
        ardoise.Window_State.hauteur:=abs(self.point_de_depart.y-calculted_point.y);
        end;
      invalidaterect(ardoise.Window_State.hwindow,nil,false);
      updatewindow(ardoise.Window_State.hwindow);
      end;
    Tool_cercle:
      begin
      if bool_controle then
        begin
        graphics.DrawEllipse(pen,self.point_de_depart.x,self.point_de_depart.y,
          calculted_point.x-self.point_de_depart.x,calculted_point.y-self.point_de_depart.y);
        ardoise.Window_State.rayon:=-1;
        ardoise.Window_State.grand_rayon:=max(abs(self.point_de_depart.x-calculted_point.x),abs(self.point_de_depart.y-calculted_point.y));
        ardoise.Window_State.petit_rayon:=min(abs(self.point_de_depart.x-calculted_point.x),abs(self.point_de_depart.y-calculted_point.y));
        invalidaterect(ardoise.Window_State.hwindow,nil,false);
        updatewindow(ardoise.Window_State.hwindow);
        end
      else
        begin
        une_distance:=round(ardoise.distance(
          self.point_de_depart.x,self.point_de_depart.y,
          calculted_point.x,calculted_point.Y));
        graphics.DrawEllipse(pen,
          self.point_de_depart.x-une_distance,
            self.point_de_depart.y-une_distance,une_distance*2,une_distance*2);
        ardoise.Window_State.rayon:=round(une_distance);
        invalidaterect(ardoise.Window_State.hwindow,nil,false);
        updatewindow(ardoise.Window_State.hwindow);
        end;
      end;
    end; {case}
  pen.free;
  selectobject(memdc,old_bitmap);
  deleteDC(memdc);
  releasedc(self.hwindow,adc);
  invalidaterect(self.hwindow,nil,false);
  updatewindow(self.hwindow);
  end; {Twindow_Ardoise.Dessin_de_la_ligne}

procedure Twindow_Ardoise.Dessine_la_spline(calculted_point:tpoint);
  var adc,memdc:hdc;
      old_bitmap:hbitmap;
      graphics:gdipobj.TGPGraphics;
      touche_controle:boolean;
      Une_Spline:TUne_Spline;
  begin
  touche_controle:=GetKeyState(vk_Control)<0;
  Une_Spline:=TUne_Spline.Create;
  Une_Spline.a.x:=self.point_de_depart.x;
  Une_Spline.a.y:=self.point_de_depart.y;
  Une_Spline.b.x:=calculted_point.x;
  Une_Spline.b.y:=calculted_point.y;
  Une_Spline.c.x:=terminaison.x;
  Une_Spline.c.y:=terminaison.y;
  adc:=getdc(self.hwindow);
  memdc:=createcompatibledc(adc);
  self.mon_bitmap.Assign(self.flipflop);
  old_bitmap:=selectobject(memdc,self.mon_bitmap.Handle);
  graphics:=gdipobj.TGPGraphics.Create(memdc);
  graphics.SetSmoothingMode(SmoothingModeAntiAlias);
  graphics.SetSmoothingMode(SmoothingModeHighQuality);
  graphics.SetTextRenderingHint(TextRenderingHintAntiAlias);
  Une_Spline.epaisseur:=rayon;
  Une_Spline.couleur:=la_couleur_du_pinceau;
  Une_Spline.Calcul(graphics,touche_controle);
  Une_Spline.free;
  selectobject(memdc,old_bitmap);
  deleteDC(memdc);
  releasedc(self.hwindow,adc);
  invalidaterect(self.hwindow,nil,false);
  updatewindow(self.hwindow);
  end; {Twindow_Ardoise.Dessine_la_spline}

procedure Twindow_Ardoise.Dessine_le_spray(calculted_point:tpoint; with_controle_key:boolean);
  const kk_transparence = 0.5;
  var i,j,ii,dx,dy:integer;
      an_color,couleur:tcolorref;
      une_distance,transparence:real;
      max_rayon : real;
      bool_controle:boolean;
      bool_Majuscule:boolean;
      v_transparence:real;
  begin
  self.une_image_tres_rapide.Copy(self.mon_bitmap);
  if with_controle_key then
    begin
    bool_Majuscule:=(GetKeyState(vk_Shift)<0) or k_controle;
    bool_controle:=(GetKeyState(vk_Control)<0) or k_pastel;
    end
  else
    begin
    bool_Majuscule:=false;
    bool_controle:=false;
    end;
  case ardoise.type_de_tracer of
    TdT_rond:
      begin
      if bool_controle or bool_Majuscule then
        begin
        couleur:=rgb(random(255),random(255),random(255));
        for i:=-rayon to rayon do
          begin
          ii:=i*i;
          for j:=-rayon to rayon do
            begin
            une_distance:=sqrt(ii+j*j); //une_distance:=distance(0,0,i,j) pythagore: r²=x²+y²;
            if une_distance<=rayon then
              begin
              dx:=calculted_point.x+i;
              dy:=calculted_point.y+j;
              if k_transparence then
                Ardoise.Window_ardoise.mon_masque.canvas.pixels[dx,dy]:=clwhite;
              if bool_Majuscule then
                begin
                an_color:=une_image_tres_rapide.GetPixel(dx,dy);
                couleur:=IN_Between_longint_RGB(rgb(255,255,255),la_couleur_du_pinceau,une_distance,rayon);
                une_image_tres_rapide.SetPixel(dx,dy,
                  rgb(
                    min(255,round(getrvalue(couleur)*kk_transparence+getrvalue(an_color)*(1-kk_transparence))),
                    min(255,round(getgvalue(couleur)*kk_transparence+getgvalue(an_color)*(1-kk_transparence))),
                    min(255,round(getbvalue(couleur)*kk_transparence+getbvalue(an_color)*(1-kk_transparence))) ));
                end
              else
                begin
                an_color:=une_image_tres_rapide.GetPixel(dx,dy);
                une_image_tres_rapide.SetPixel(dx,dy,
                  rgb(
                    min(255,round(getrvalue(couleur)*kk_transparence+getrvalue(an_color)*(1-kk_transparence))),
                    min(255,round(getgvalue(couleur)*kk_transparence+getgvalue(an_color)*(1-kk_transparence))),
                    min(255,round(getbvalue(couleur)*kk_transparence+getbvalue(an_color)*(1-kk_transparence))) ));
                end;
              end;
            end;
          end;
        end
      else
        begin
        for i:=-rayon to rayon do
          begin
          ii:=i*i;
          for j:=-rayon to rayon do
            begin
            {Pour aller plus vite évite le call à la fonction et le passage des paramètres}
            une_distance:=sqrt(ii+j*j); //une_distance:=distance(0,0,i,j) pythagore: r²=x²+y²;
            if une_distance<=rayon then
              begin
              if not (k_feutrer) then
                transparence:=1-une_distance/rayon
              else
                transparence:=random(round((1-une_distance/rayon)*100))/100;
              dx:=calculted_point.x+i;
              dy:=calculted_point.y+j;
              if k_transparence then
                Ardoise.Window_ardoise.mon_masque.canvas.pixels[dx,dy]:=clwhite;
              an_color:=une_image_tres_rapide.GetPixel(dx,dy);
              if not(k_moucheter) or (random(4)=0) then
                une_image_tres_rapide.SetPixel(dx,dy,
                rgb(
                  min(255,round(getrvalue(ardoise.la_couleur_du_pinceau)*transparence+getrvalue(an_color)*(1-transparence))),
                  min(255,round(getgvalue(ardoise.la_couleur_du_pinceau)*transparence+getgvalue(an_color)*(1-transparence))),
                  min(255,round(getbvalue(ardoise.la_couleur_du_pinceau)*transparence+getbvalue(an_color)*(1-transparence))) ));
              end;
            end;
          end;
        end;
      end;
    TdT_carre:
      begin
      max_rayon := sqrt(rayon*rayon+rayon*rayon);
      for i:=-rayon to rayon do
        begin
        ii:=i*i;
        for j:=-rayon to rayon do
          begin
          une_distance:=sqrt(ii+j*j);
          transparence:=1-une_distance/max_rayon;
          dx:=calculted_point.x+i;
          dy:=calculted_point.y+j;
          Ardoise.Window_ardoise.mon_masque.canvas.pixels[dx,dy]:=clwhite;
          an_color:=une_image_tres_rapide.GetPixel(dx,dy);
          une_image_tres_rapide.SetPixel(dx,dy,
            rgb(
              min(255,round(getrvalue(ardoise.la_couleur_du_pinceau)*transparence+getrvalue(an_color)*(1-transparence))),
              min(255,round(getgvalue(ardoise.la_couleur_du_pinceau)*transparence+getgvalue(an_color)*(1-transparence))),
              min(255,round(getbvalue(ardoise.la_couleur_du_pinceau)*transparence+getbvalue(an_color)*(1-transparence))) ));
          end;
        end;
      end;
    end; {case}
  invalidaterect(self.hwindow,nil,false);
  updatewindow(self.hwindow);
  end; {Twindow_Ardoise.Dessine_le_spray}

(******************************************************************************)
(*                        3- écrans palettes                                  *)
(******************************************************************************)

const id_popup_graduation = 100;

constructor Twindow_Graduation.Create(un_parent:ardoise.TWinbase);
  begin
  self.down:=false;
  inherited create(un_parent,'Graduations de l''ardoise',-1,-1,0,0,false);
  end;

function Twindow_Graduation.Getstyle:DWORD;
  begin
  Getstyle:=WS_child or WS_VISIBLE or WS_CLIPCHILDREN or ws_border;
  end;

function Twindow_Graduation.GetClassName:PChar;
  const class_name_unknow:pchar='Ardoise_graduation';
	begin
	GetClassName:=class_name_unknow;
	end;

procedure Twindow_Graduation.WMCOMMAND(var msg:TMessage);
  var un_rayon:integer;
  begin
  inherited WMCOMMAND(msg);
  case loword(msg.wparam) of
    id_popup_graduation..id_popup_graduation+100:
      begin
      un_rayon:=(loword(msg.wparam)-id_popup_graduation)*5;
      ardoise.rayon:=un_rayon;
      invalidaterect(self.hwindow,nil,false);
      end;
    end; {case}
  end; {Twindow_Graduation.WMCOMMAND}

procedure Twindow_Graduation.WMLBUTTONDOWN(var Msg: TMessage);
  var i:integer;
      apoint,un_point_menu_popup:tpoint;
      apc:pc100;
      amenu_popup:hmenu;
      cmd:integer;
  begin
  apoint.x:=loword(msg.lparam);
  apoint.y:=hiword(msg.lparam);
  if ptinrect(self.rect_plus_d_epaisseur,apoint) then
    begin
    amenu_popup:=CreatePopupMenu;
    for i:=1 to 32 do
      begin
      inttopchar(i,apc); strcat(strcat(apc,' '),'Pixel');
      if i<>1 then strcat(apc,'s');
      cmd:=MF_String;
      if i*5=ardoise.rayon then
        cmd:=cmd or MF_CHecked;
      appendmenu(amenu_popup,Cmd,id_popup_graduation+i,apc);
      end;
    GetCursorPos(un_point_menu_popup);
    with un_point_menu_popup do
      TrackPopupMenu(amenu_popup,0,x,y,0,self.hwindow,nil);
    end
  else
    begin
    self.down:=true;
    ardoise.rayon:=loword(msg.lparam);
    invalidaterect(self.hwindow,nil,false);
    end;
  end;

procedure Twindow_Graduation.WMMousemove(var msg:TMessage);
  begin
  if self.down then
    begin
    ardoise.rayon:=loword(msg.lparam);
    invalidaterect(self.hwindow,nil,false);
    updatewindow(self.hwindow);
    end;
  end;

procedure Twindow_Graduation.WMLBUTTONUP(var Msg: TMessage);
  begin
  self.down:=false;
  end;

procedure Twindow_Graduation.Paint(PaintDC: HDC; var PaintInfo: TPaintStruct);
  const k_step_de_promotion = 50;
  var i,position,maximum:integer;
      arect:trect;
      apencil:hpen;
      apc:pc100;
      memdc:hdc;
      old_bitmap:hbitmap;
      afont:hfont;
  var alogfont:tlogFont;
  const RGB_Orange=$099cfb;
  const RGB_Bleu=$0020ff;
  var une_fonction_de_i:integer;
  begin
  getclientrect(self.hwindow,arect);
  memdc:=createcompatibledc(paintdc);
  with arect do old_bitmap:=selectobject(memdc,createcompatiblebitmap(paintdc,right,bottom));
  with arect do rectangle(memdc,-1,-1,right+1,bottom+1);
  with arect do roundrect(memdc,2,5,right-1,bottom-5,5,5);
  MakeDefaultFont(alogfont,18);
  strcopy(alogfont.lfFaceName,'Calibri');
  afont:=selectobject(memdc,CreateFontIndirect(alogfont));
  setbkmode(memdc,TRANSPARENT);
  settextcolor(memdc,rgb(0,0,255));
  {Afin de déterminer la position maximum de la boucle de variation de i}
  maximum:=pred(arect.right div k_step_de_promotion);
  for i:=1 to maximum do
    begin
    une_fonction_de_i:=i*k_step_de_promotion;
    moveto(memdc,une_fonction_de_i,6);
    lineto(memdc,une_fonction_de_i,arect.bottom-6);
    if i<>0 then
      begin
      if i*k_step_de_promotion+2<arect.right-52 then
        begin
        inttopchar(i*10,apc);
        textout(memdc,une_fonction_de_i+2,4,apc,strlen(apc));
        end;
      end;
    end;
  deleteobject(selectobject(memdc,afont));
  apencil:=selectobject(memdc,windows.createpen(PS_SOLID,1,RGB_Orange));
  for i:=0 to 3 do
    begin
    position:=arect.bottom div 2+i;
    moveto(memdc,3,position);
    lineto(memdc,ardoise.rayon,position);
    end;
  deleteobject(selectobject(memdc,apencil));
  apencil:=selectobject(memdc,windows.createpen(PS_SOLID,1,RGB_Bleu));
  setrect(self.rect_plus_d_epaisseur,arect.Right-20,arect.top+10,arect.Right-6,arect.bottom-10);
  with self.rect_plus_d_epaisseur do
    begin
    roundrect(memdc,left,top,right,bottom,3,3);
    moveto(memdc,(left+right) div 2,top+4);
    lineto(memdc,(left+right) div 2,bottom-3);
    moveto(memdc,left+4,(top+bottom) div 2);
    lineto(memdc,right-3,(top+bottom) div 2);
    end;
  deleteobject(selectobject(memdc,apencil));
  with arect do bitblt(paintdc,0,0,right,bottom,memdc,0,0,SRCCOPY);
  deleteobject(selectobject(memdc,old_bitmap));
	selectobject(memdc,old_bitmap);
	deleteDC(memdc);
  end; {Twindow_Graduation.Paint}

constructor Twindow_titre.Create(un_parent:ardoise.TWinbase);
  begin
  inherited create(un_parent,'Titre',-1,-1,0,0,true);
  self.Lecture_du_bitmap;
  end;

procedure Twindow_titre.Lecture_du_bitmap;
  var apc:pc1024;
  begin
  {Obtenir le répertoire d'installation d'ardoise.db}
  get_exe_path(apc);
  strcat(apc,'Ligne_de_titre.bmp');
  if FileExists(strpas(apc)) then
    begin
    self.abitmap_titre:=graphics.tbitmap.Create;
	  self.abitmap_titre.LoadFromFile(apc);
    end
  else
    begin
    self.abitmap_titre:=nil;
    if false then
      box(self.hwindow,pchar('Le fichier suivant est absent :'+strpas(apc)));
    end;
  end; {Twindow_titre.Lecture_du_bitmap}

function Twindow_titre.GetClassName:PChar;
  const class_name_unknow:pchar='Ardoise_titre';
	begin
	GetClassName:=class_name_unknow;
	end;

Destructor Twindow_titre.Destroy;
  begin
  self.abitmap_titre.free;
  inherited Destroy;
  end;

function Twindow_titre.Getstyle:DWORD;
  begin
  Getstyle:=WS_child or WS_VISIBLE or WS_CLIPCHILDREN or ws_border;
  end;

procedure Twindow_titre.lecture_du_fichier_bmp(un_nom_de_fichier:string);
  var abitmap:graphics.tbitmap;
      i,j:integer;
      tres_rapide:TFastBitmap2;
      jpeg_image:jpeg.TJPEGImage;
      une_image_png:NGImages.TNGBitmap;
  begin
  if (strpos(pchar(un_nom_de_fichier),'png')<>nil)
  or (strpos(pchar(un_nom_de_fichier),'PNG')<>nil) then
    begin
    une_image_png:=NGImages.TNGBitmap.Create;
    une_image_png.LoadFromFile(un_nom_de_fichier);
    abitmap:=graphics.tbitmap.Create;
    abitmap.Assign(une_image_png);
    une_image_png.Free;
    tres_rapide.Copy(abitmap);
    for i:=0 to pred(Window_ardoise.une_image_tres_rapide.W) do
      for j:=0 to pred(Window_ardoise.une_image_tres_rapide.H) do
        begin
        Window_ardoise.une_image_tres_rapide.SetPixel_in_limite(i,j,
          tres_rapide.GetPixel(i,j));
        end;
    end
  else if (strpos(pchar(un_nom_de_fichier),'jpg')<>nil) or
     (strpos(pchar(un_nom_de_fichier),'JPG')<>nil) or
     (strpos(pchar(un_nom_de_fichier),'jpeg')<>nil) or
     (strpos(pchar(un_nom_de_fichier),'JPEG')<>nil) then
     begin
     jpeg_image:=jpeg.TJPEGImage.Create;
     jpeg_image.LoadFromFile(un_nom_de_fichier);
     abitmap:=graphics.tbitmap.Create;
     abitmap.Assign(jpeg_image);
     jpeg_image.Free;
     tres_rapide.Copy(abitmap);
     for i:=0 to pred(Window_ardoise.une_image_tres_rapide.W) do
      for j:=0 to pred(Window_ardoise.une_image_tres_rapide.H) do
        begin
        Window_ardoise.une_image_tres_rapide.SetPixel_in_limite(i,j,
          tres_rapide.GetPixel(i,j));
        end;
     end
  else if (strpos(pchar(un_nom_de_fichier),'bmp')<>nil) or
     (strpos(pchar(un_nom_de_fichier),'BMP')<>nil) then
     begin
    abitmap:=graphics.tbitmap.Create;
    abitmap.LoadFromFile(un_nom_de_fichier);
    tres_rapide.Copy(abitmap);
    for i:=0 to pred(Window_ardoise.une_image_tres_rapide.W) do
      for j:=0 to pred(Window_ardoise.une_image_tres_rapide.H) do
        begin
        Window_ardoise.une_image_tres_rapide.SetPixel_in_limite(i,j,
          tres_rapide.GetPixel(i,j));
        end;
    end;
  Invalidaterect(Window_ardoise.hwindow,nil,false);
  end; {Twindow_titre.lecture_du_fichier_bmp}

procedure Twindow_titre.Enregistrement_type_ato(un_nom_de_fichier:string);
  var i:integer;
      un_fichier_ato:TextFile;
      un_type:ardoise.Tnode;
      registre:TRegistry;
      nom_cle:string;
      value:string;
  begin
  try
    AssignFile(un_fichier_ato,un_nom_de_fichier);
    ReWrite(un_fichier_ato);
    writeln(un_fichier_ato,'*Created by ardoise');
    writeln(un_fichier_ato,'Layer name="Calque"');
    writeln(un_fichier_ato,'visible=true');
    writeln(un_fichier_ato,'actif');
    writeln(un_fichier_ato,'zmini=0');
    writeln(un_fichier_ato,'zmaxi=0');
    writeln(un_fichier_ato,'colorlayer=0');
    for i:=0 to pred(ardoise.Collection.Count) do
      begin
      un_type:=ardoise.Tnode(ardoise.Collection.items[i]);
      if un_type<>nil then
        un_type.enregistrement(un_fichier_ato);
      end;
    writeln(un_fichier_ato,'*EOF');
    CloseFile(un_fichier_ato);
  except
    end;
  if true then
    begin
    try
      registre:=TRegistry.create;
      registre.RootKey:=HKEY_CURRENT_USER;
      nom_cle:=strpas('Ardoise');
      if registre.openkey(nom_cle,True) then
        value:=registre.ReadString('revoir');
      if value<>'False' then
        ardoise.Window_export_ato:=Twindow_export_ato.Create(self,un_nom_de_fichier);
		  registre.closekey;
    finally
		  registre.free;
      end;
    end;
  end; {Twindow_titre.Enregistrement_type_ato}

var nom_fichier:string;

procedure Twindow_titre.Nouveau_document;
  var v_white : tcolorref;
      i,j,hauteur:integer;
      old_cursor:hcursor;
  begin
  old_cursor:=setcursor(loadcursor(hinstance,IDC_Wait));
  ardoise.Collection.Clear;
  v_white := rgb(255,255,255);
  Window_ardoise.une_image_tres_rapide.Copy(Window_ardoise.mon_bitmap);
  for i:=0 to pred(Window_ardoise.une_image_tres_rapide.W) do
    for j:=0 to pred(Window_ardoise.une_image_tres_rapide.H) do
      Window_ardoise.une_image_tres_rapide.SetPixel_in_limite(i,j,v_white);
  Window_ardoise.reinitialiser_le_masque;
  ardoise.nom_fichier:='';
  SetWindowText(self.hwindow,pansichar('Ardoise'));
  invalidaterect(Window_ardoise.hwindow,nil,false);
  updatewindow(Window_ardoise.hwindow);
  Window_ardoise.souris_down:=false;
  setcursor(old_cursor);
  end; {Twindow_titre.Nouveau_document}

procedure Twindow_titre.Ouvrir_un_document;
  var un_nom_de_fichier,un_repertoire_initiale:pc1024;
  begin
  un_nom_de_fichier:='';
  strcopy(un_repertoire_initiale,'');
  if u_file_select.Affiche_le_dialogue_de_lecture(self.hwindow,un_nom_de_fichier,un_repertoire_initiale,
    ardoise.chaine_filtre_jpg_bmp_png,'',false,pred(sizeof(un_nom_de_fichier))) then
    begin
      try
        self.Lecture_du_fichier_bmp(un_nom_de_fichier);
        nom_fichier:=un_nom_de_fichier;
        SetWindowText(self.hwindow,pansichar('Ardoise - '+ExtractFileName(un_nom_de_fichier)));
        invalidaterect(Window_ardoise.hwindow,nil,false);
      except
        end;
      end;
  end; {Twindow_titre.Ouvrir_un_document}

procedure Twindow_titre.Enregistrer_un_document;
  var un_nom_de_fichier,un_repertoire_initiale:pc1024;
      jpeg_image:jpeg.TJPEGImage;
      une_image_png:NGImages.TNGBitmap;
  begin
  if ardoise.nom_fichier='' then
    begin
    un_nom_de_fichier:='';
    strcopy(un_repertoire_initiale,'');
    if u_file_select.Affiche_le_dialogue_d_enregistrement(
      self.hwindow,un_nom_de_fichier,un_repertoire_initiale,ardoise.chaine_filtre_bmp_ato_jpg_png,k_pc_bmp) then
        begin
        try
          if strpos(un_nom_de_fichier,'.ato')<>nil then
            begin
            {box(self.hwindow,'Fichier de type ato');}
            Self.enregistrement_type_ato(un_nom_de_fichier);
            end
          else if strpos(strlower(un_nom_de_fichier),'.jpg')<>nil then
            begin
            jpeg_image:=jpeg.TJPEGImage.create;
            jpeg_image.Assign(Window_ardoise.mon_bitmap);
            jpeg_image.SaveToFile(un_nom_de_fichier);
            jpeg_image.free;
            end
          else if strpos(strlower(un_nom_de_fichier),'.png')<>nil then
            begin
            une_image_png:=NGImages.TNGBitmap.Create;
            une_image_png.Assign_Dot_by_dot(self.hwindow,Window_ardoise.mon_bitmap);
            une_image_png.SetTransImage(Ardoise.Window_ardoise.mon_masque);
            une_image_png.SaveToFile(un_nom_de_fichier);
            une_image_png.free;
            end
          else
            begin
            if strpos(un_nom_de_fichier,'.bmp')=nil then
              strcat(un_nom_de_fichier,'.bmp');
            Window_ardoise.mon_bitmap.SaveToFile(un_nom_de_fichier);
            ardoise.nom_fichier:=un_nom_de_fichier;
            SetWindowText(self.hwindow,pansichar('Ardoise - '+ExtractFileName(un_nom_de_fichier)));
            end;
        except
          end;
        end;
      end
    else
      Window_ardoise.mon_bitmap.SaveToFile(nom_fichier);
  end; {Twindow_titre.Enregistrer_un_document}

procedure Twindow_titre.Enregistrer_sous_un_document;
  var un_nom_de_fichier,un_repertoire_initiale:pc1024;
      jpeg_image:jpeg.TJPEGImage;
      une_image_png:NGImages.TNGBitmap;
  begin
  strcopy(un_repertoire_initiale,'');
  un_nom_de_fichier:='';
  if u_file_select.Affiche_le_dialogue_d_enregistrement(
    self.hwindow,un_nom_de_fichier,un_repertoire_initiale,ardoise.chaine_filtre_bmp_ato_jpg_png,k_pc_bmp) then
      begin
      if strpos(strlower(un_nom_de_fichier),'.ato')<>nil then
        begin
        {box(self.hwindow,'Fichier de type ato');}
        Self.enregistrement_type_ato(un_nom_de_fichier);
        end
      else if strpos(strlower(un_nom_de_fichier),'.jpg')<>nil then
        begin
        jpeg_image:=jpeg.TJPEGImage.create;
        jpeg_image.Assign(Window_ardoise.mon_bitmap);
        jpeg_image.SaveToFile(un_nom_de_fichier);
        jpeg_image.free;
        end
      else if strpos(strlower(un_nom_de_fichier),'.png')<>nil then
        begin
        une_image_png:=NGImages.TNGBitmap.Create;
        une_image_png.SetTransImage(Ardoise.Window_ardoise.mon_masque);
        une_image_png.Assign_Dot_by_dot(self.hwindow,Window_ardoise.mon_bitmap);
        une_image_png.SaveToFile(un_nom_de_fichier);
        une_image_png.free;
        end
      else
        begin
        if strpos(un_nom_de_fichier,'.bmp')=nil then
          strcat(un_nom_de_fichier,'.bmp');
        Window_ardoise.mon_bitmap.SaveToFile(un_nom_de_fichier);
        ardoise.nom_fichier:=un_nom_de_fichier;
        SetWindowText(self.hwindow,pansichar('Ardoise - '+ExtractFileName(un_nom_de_fichier)));
        end;
      end; {file select Ok}
  end; {Twindow_titre.Enregistrer_sous_un_document}

procedure Twindow_titre.Copier_l_image;
  var MyFormat:Word;
      AData:THandle;
      APalette:HPALETTE;
  begin
  Window_ardoise.mon_bitmap.SaveToClipBoardFormat(MyFormat,AData,APalette);
  ClipBoard.SetAsHandle(MyFormat,AData);
  end; {Twindow_titre.Copier_l_image}

procedure Twindow_titre.Creer_une_ardoise;
  var i,j:integer;
      old_cursor:hcursor;
  begin
  old_cursor:=setcursor(loadcursor(hinstance,IDC_Wait));
  Window_ardoise.souris_down:=false;
  Window_ardoise.une_image_tres_rapide.Copy(Window_ardoise.mon_bitmap);
  for i:=0 to pred(Window_ardoise.une_image_tres_rapide.W) do
    for j:=0 to pred(Window_ardoise.une_image_tres_rapide.H) do
      Window_ardoise.une_image_tres_rapide.SetPixel_in_limite(i,j,0);
  ardoise.la_couleur_du_pinceau:=rgb(255,255,255);
  ardoise.nom_fichier:='';
  SetWindowText(self.hwindow,pansichar('Ardoise'));
  invalidaterect(Window_ardoise.hwindow,nil,false);
  updatewindow(Window_ardoise.hwindow);
  Window_ardoise.Reinitialiser_le_masque;
  setcursor(old_cursor);
  end;

procedure Twindow_titre.quadrillage;
  var i,hauteur:integer;
      arect:trect;
      adc,amemdc:hdc; {Un display device context}
      old_bitmap:hbitmap;
      apencil:hpen;
  begin
  getclientrect(Window_ardoise.hwindow,arect);
  Window_ardoise.une_image_tres_rapide.Copy(Window_ardoise.mon_bitmap);
  //Pour dessiner le quadrillage.
  hauteur:=arect.bottom div 12;
  adc:=getdc(Window_ardoise.hwindow);
  amemdc:=createcompatibledc(adc);
  old_bitmap:=selectobject(amemdc,Window_ardoise.mon_bitmap.Handle);
  apencil:=selectobject(amemdc,createpen(PS_SOlid,1,la_couleur_du_pinceau));
  for i:=1 to pred(Window_ardoise.une_image_tres_rapide.h) do
    begin
    if i mod hauteur = 0 then
      begin
      moveto(amemdc,0,i);
      lineto(amemdc,Window_ardoise.une_image_tres_rapide.w,i);
      end;
    end;
  for i:=1 to pred(Window_ardoise.une_image_tres_rapide.w) do
    begin
    if i mod hauteur = 0 then
      begin
      moveto(amemdc,i,0);
      lineto(amemdc,i,Window_ardoise.une_image_tres_rapide.h);
      end;
    end;
  deleteobject(selectobject(amemdc,apencil));
  selectobject(amemdc,old_bitmap);
  deleteDC(amemdc);
  releasedc(Window_ardoise.hwindow,adc);
  invalidaterect(Window_ardoise.hwindow,nil,false);
  end;

procedure Twindow_titre.WMLBUTTONDOWN(var Msg: TMessage);
  var position:tpoint;
      apc:pc100;
      arect:trect;
  begin
  position.x:=Smallint(loword(msg.lparam));
  position.y:=Smallint(hiword(msg.lparam));
  if false then
    begin
    inttopchar(position.x,apc);
    box(self.hwindow,apc);
    end;
  if position.x<86 then
    Self.Nouveau_document
  else if position.x<170 then
    Self.Ouvrir_un_document
  else if position.x<273 then
    Self.Enregistrer_un_document
  else if position.x<404 then
    Self.Enregistrer_sous_un_document
  else if position.x<484 then
    Self.Copier_l_image
  else if position.x<530 then
    Self.Creer_une_ardoise
  else
    begin
    if ptinrect(self.rect_carre,position) then
      begin
      type_de_tracer:=TdT_carre;
      invalidaterect(self.hwindow,nil,false);
      end
    else if ptinrect(self.rect_cercle,position) then
      begin
      type_de_tracer:=TdT_rond;
      invalidaterect(self.hwindow,nil,false);
      end
    else if ptinrect(self.rect_diese,position) then
      self.Quadrillage;
    end;
  invalidaterect(Window_ardoise.hwindow,nil,false);
  end; {Twindow_titre.WMLBUTTONDOWN}

procedure Twindow_titre.Paint(PaintDC: HDC; var PaintInfo: TPaintStruct);
  var memdc:hdc;
      old_bitmap:hbitmap;
      arect:trect;
      old_brush:hbrush;
      alogfont:tlogFont;
      afont:hfont;
      size:tsize;
      my_rectangle:trect;
  begin
  if False then
    begin
    Windows.Getclientrect(self.hwindow,arect);
    rectangle(PaintDC,arect.left,arect.top,arect.right,arect.bottom);
    cross_a_window(self.hwindow,PaintDC);
    exit;
    end;
  Windows.GetWindowRect(self.hwindow,my_rectangle);
  Windows.Getclientrect(self.hwindow,arect);
  memdc:=createcompatibledc(paintdc);
  with arect do rectangle(PaintDC,-1,-1,right+1,bottom+1);
  if abitmap_titre<>nil then
    begin
    old_bitmap:=selectobject(memdc,self.abitmap_titre.Handle);
    with arect do bitblt(paintdc,0,0,right,bottom,memdc,0,0,SRCCOPY);
	  selectobject(memdc,old_bitmap);
	  deleteDC(memdc);                               
    with arect do setrect(self.rect_carre,right-20,2,right-6,16);
    if type_de_tracer = TdT_carre then
      old_brush:=selectobject(paintdc,createsolidbrush(rgb(255,0,0)));
    with self.rect_carre do rectangle(paintdc,left,top,right,bottom);
    if type_de_tracer = TdT_carre then
      deleteobject(selectobject(paintdc,old_brush));
    with arect do setrect(self.rect_cercle,right-20,20,right-6,34);
    if type_de_tracer = TdT_rond then
      old_brush:=selectobject(paintdc,createsolidbrush(rgb(0,0,255)));
    with self.rect_cercle do ellipse(paintdc,left,top,right,bottom);
    if type_de_tracer = TdT_rond then
      deleteobject(selectobject(paintdc,old_brush));
    end
  else
    begin
    with arect do rectangle(PaintDC,0,0,right,bottom);
    end;
  SetBkmode(paintdc,TRANSPARENT);
  MakeDefaultFont(alogfont,24);
  strcopy(alogfont.lfFaceName, 'Calibri');
  afont:=selectobject(paintdc,CreateFontIndirect(alogfont));
  GetTextExtentPoint(paintdc,'#',1,size);
  with arect do textout(paintdc,right-42,6,'#',1);
  settextcolor(paintdc,rgb(255,255,255));
  with arect do textout(paintdc,right-43,7,'#',1);
  deleteobject(selectobject(paintdc,afont));
  with arect do setrect(self.rect_diese,right-43,7,right-43+size.cx+1,76+size.cx+1);
  end;

constructor Twindow_palette.Create(un_parent:ardoise.TWinbase);
  begin
  self.bool_mosaic:=false;
  self.bool_gray_level:=False;
  inherited create(un_parent,'Palette',-1,-1,0,0,false);
  end;

procedure Twindow_palette.WMMousemove(var msg:TMessage);
  var local_la_couleur_du_pinceau:tcolorref;
      un_point:tpoint;
      arect:trect;
      level_gray:integer;
  begin
  if Window_State<>nil then
    begin
    getclientrect(hwindow,arect);
    un_point.x:=Smallint(loword(msg.lparam));
    un_point.y:=Smallint(hiword(msg.lparam));
    if self.bool_gray_level then
      begin
      level_gray:=round(255*un_point.y/pred(arect.bottom));
      local_la_couleur_du_pinceau:=rgb(level_gray,level_gray,level_gray);
      end
    else if self.bool_mosaic then
      hls_to_tcolorref(round((un_point.y/arect.bottom)*16)/16*360.0,
        round((un_point.x/arect.right)*4)/4,1,local_la_couleur_du_pinceau)
    else
      with un_point do
        hls_to_tcolorref(y/arect.bottom*360.0,x/arect.right,1,local_la_couleur_du_pinceau);
    sendmessage(Window_State.hwindow,WM_USER_Show_nom_des_couleurs,local_la_couleur_du_pinceau,msg.LParam);
    end;
  end;

procedure Twindow_palette.WMRButtonDown(var Msg: TMessage);
  var une_couleur:tcolorref;
      bool_controle:boolean;
  begin
  bool_controle:=(GetKeyState(vk_Control)<0);
  if bool_controle then
    begin
    une_couleur:=la_couleur_du_pinceau;
    if u_file_select.Affiche_le_dialogue_des_couleur_window(
      self.hwindow,une_couleur) then
        la_couleur_du_pinceau:=une_couleur;
    end
  else
    begin
    self.bool_mosaic:=False;
    self.bool_gray_level:=not self.bool_gray_level;
    invalidaterect(self.hwindow,nil,false);
    end;
  end;

procedure Twindow_palette.WMMButtonDown(var Msg: TMessage);
  begin
  self.bool_gray_level:=False;
  self.bool_mosaic:=not self.bool_mosaic;
  invalidaterect(self.hwindow,nil,false);
  end;

procedure Twindow_palette.WMLBUTTONDOWN(var Msg: TMessage);
  var un_point:tpoint;
      arect:trect;
      gray:integer;
  begin
  getclientrect(hwindow,arect);
  un_point.x:=Smallint(loword(msg.lparam));
  un_point.y:=Smallint(hiword(msg.lparam));
  if self.bool_gray_level then
    begin
    gray:=round(255*un_point.y/arect.Bottom);
    ardoise.la_couleur_du_pinceau:=rgb(gray,gray,gray);
    end
  else if self.bool_mosaic then
    begin
    hls_to_tcolorref(round((un_point.y/arect.bottom)*16)/16*360.0,
      round((un_point.x/arect.right)*4)/4,1,ardoise.la_couleur_du_pinceau);
    end
  else
    with un_point do
      hls_to_tcolorref(y/arect.bottom*360.0,x/arect.right,1,ardoise.la_couleur_du_pinceau);
  invalidaterect(ardoise.Window_State.hwindow,nil,false);
  end; {Twindow_palette.WMLBUTTONDOWN}

procedure Twindow_palette.Paint(PaintDC: HDC; var PaintInfo: TPaintStruct);
  var i,j:integer;
  var memdc:hdc;
      old_bitmap:hbitmap;
      arect:trect;
      acolor:tcolorref;
      old_brosse:hbrush;
      pencil_vanile:hpen;
      level_gray:integer;
      afontary:hfont;
  begin
  memdc:=createcompatibledc(paintdc);
	getclientrect(self.hwindow,arect);
  old_bitmap:=selectobject(memdc,createcompatiblebitmap(paintdc,arect.Right,arect.bottom));
  if self.bool_gray_level then
    begin
    for i:=0 to pred(arect.bottom) do
      begin
      level_gray:=round(255*i/pred(arect.bottom));
      pencil_vanile:=selectobject(memdc,Createpen(PS_SOlid,1,rgb(level_gray,level_gray,level_gray)));
      moveto(memdc,0,i); lineto(memdc,arect.right,i);
      deleteobject(selectobject(memdc,pencil_vanile));
      end;
    end
  else if self.bool_mosaic then
    begin
    for i:=0 to 3 do
      for j:=0 to 15 do
        begin
        hls_to_tcolorref(j/15*360.0,succ(i)/5,1,acolor);
        old_brosse:=selectobject(memdc,createsolidbrush(acolor));
        pencil_vanile:=selectobject(memdc,Createpen(PS_SOlid,1,acolor xor $ffffff));
        rectangle(memdc,
          round(i/4*arect.right),
          round(j/16*arect.bottom),
          round(succ(i)/4*arect.right),
          round(succ(j)/16*arect.bottom));
        deleteobject(selectobject(memdc,pencil_vanile));
        deleteobject(selectobject(memdc,old_brosse));
        end;
    end
  else
    begin
    for i:=0 to pred(arect.right) do for j:=0 to pred(arect.bottom) do
      begin
      hls_to_tcolorref(j/arect.bottom*360.0,i/arect.right,1,acolor);
      setpixel(memdc,i,j,acolor);
      end;
    end;
  (*les plus bas instincts de l'homme américain enfin expliquer.*)
	with arect do bitblt(paintdc,0,0,right,bottom,memdc,0,0,SRCCOPY);
	deleteobject(selectobject(memdc,old_bitmap));
	deleteDC(memdc);
  end; {Twindow_palette.Paint}

function Twindow_palette.Getstyle:DWORD;
  begin
  Getstyle:=WS_child or WS_VISIBLE or WS_CLIPCHILDREN or ws_border;
  end;

function Twindow_palette.GetClassName:PChar;
  const class_name_unknow:pchar='Ardoise_Palette';
	begin
	GetClassName:=class_name_unknow;
	end;

constructor Twindow_State.Create(un_parent:ardoise.TWinbase);
  const k_largeur = 80+440+20+80+80+500+30;
  begin
  Self.col_color:=lec_color.T_Col_Named.Create;
  if not self.col_color.Lecture_fichier_couleur then
    Self.col_color:=nil;
  self.souris.x:=-1;
  self.souris.y:=-1;
  self.couleur:=tcolorref(-1);
  inherited Create(un_parent,'Etat',-1,-1,0,0,false);
  end;

function Twindow_State.Getstyle:DWORD;
  begin
  Getstyle:=WS_child or WS_VISIBLE or WS_CLIPCHILDREN or ws_border;
  end;


function Twindow_State.GetClassName:PChar;
  begin
  GetClassName:='Ardoise_etat';
  end;

Destructor Twindow_State.Destroy;
  begin
  if Self.col_color<>nil then
		begin
		Self.col_color.Free;
		Self.col_color:=nil;
		end;
  inherited Destroy;
  end;

procedure Twindow_State.Paint(PaintDC: HDC; var PaintInfo: TPaintStruct);
  const k_pc_la_couleur_selectionner = 'La couleur sélectionnée :';
        k_pc_la_longeur_de_la_ligne = 'Longeur de la ligne = ';
        k_pc_le_rayon_du_cercle = 'Le rayon du cercle = ';
        k_pc_la_largeur_du_rectangle = 'La largeur du rectangle = ';
        k_pc_sa_hauteur = 'Sa hauteur = ';
        k_pc_le_grand_rayon_de_cette_ellipse = 'Le grand axe de cette ellipse = ';
        k_pc_le_petit_rayon = 'Le petit axe = ';
        k_pixel = 'Pixels'; {On obtient ainsi l'adresse de la position de ce mot en mémoire}
        {On duplique ainsi l'adresse de ce mot plutôt que de répéter ce mot 'Pixels' qui serait répété.'}
  var afont:hfont;
      alogfont:tlogFont;
      apc,bpc:pc100;
      arect:trect;
      abrosse:hbrush;
      une_couleur_avec_son_nom:lec_color.T_color_name;
      displaydc:hdc;
      mon_bitmap:hbitmap;
      size,size_ligne,size_longeur,size_largeur,size_hauteur,
        size_supplementaire,size_autre:tsize;
      slength:string;
  begin
  getclientrect(self.hwindow,arect);
  //Afin d'éviter le flicking de la ligne de status
  displaydc:=createcompatibledc(paintdc);
  with arect do
    mon_bitmap:=selectobject(displaydc,createcompatiblebitmap(paintdc,right,bottom));
  if (self.souris.x<>-1) and (self.souris.y<>-1) then
    begin
    with arect do rectangle(displaydc,-1,-1,succ(right),succ(bottom));
    ardoise.MakeDefaultFont(alogfont,24);
    strcopy(alogfont.lfFaceName, 'Calibri');
    afont:=selectobject(displaydc,CreateFontIndirect(alogfont));
    inttopchar(self.souris.x,bpc);
    strcat(strcopy(apc,'x = '),bpc);
    inttopchar(self.souris.y,bpc);
    strcat(strcat(strcat(apc,' y = '),bpc), ' '+k_pixel);
    Textout(displaydc,5,5,apc,strlen(apc));
    Textout(displaydc,200,5,k_pc_la_couleur_selectionner,strlen(k_pc_la_couleur_selectionner));
    abrosse:=selectobject(displaydc,Createsolidbrush(ardoise.la_couleur_du_pinceau));
    with arect do roundrect(displaydc,420,3,500,bottom-2,3,3);
    deleteobject(selectobject(displaydc,abrosse));
    if (Self.Col_color<>nil) then
      begin
      Self.Col_color.Recheche_couleur_plus_proche(ardoise.la_couleur_du_pinceau,une_couleur_avec_son_nom);
      if une_couleur_avec_son_nom<>nil then
        begin
        textout(displaydc,505,5,une_couleur_avec_son_nom.name,strlen(une_couleur_avec_son_nom.name));
        end;
      end;
    if Self.longueur<>-1 then
      begin
      Textout(displaydc,650,5,k_pc_la_longeur_de_la_ligne,strlen(k_pc_la_longeur_de_la_ligne));
      GetTextExtentPoint(displaydc,k_pc_la_longeur_de_la_ligne,strlen(k_pc_la_longeur_de_la_ligne),size_ligne);
      slength:=inttostr(Self.longueur);
      Textout(displaydc,660+size_ligne.cx,5,pchar(slength),length(slength));
      GetTextExtentPoint(displaydc,pchar(slength),length(slength),size_longeur);
      Textout(displaydc,670+size_ligne.cx+size_longeur.cx,5,k_pixel,6);
      end
    else if Self.rayon<>-1 then
      begin
      Textout(displaydc,650,5,k_pc_le_rayon_du_cercle,strlen(k_pc_le_rayon_du_cercle));
      GetTextExtentPoint(displaydc,k_pc_le_rayon_du_cercle,strlen(k_pc_le_rayon_du_cercle),size_ligne);
      slength:=inttostr(Self.rayon);
      Textout(displaydc,660+size_ligne.cx,5,pchar(slength),length(slength));
      GetTextExtentPoint(displaydc,pchar(slength),length(slength),size_longeur);
      Textout(displaydc,670+size_ligne.cx+size_longeur.cx,5,k_pixel,6);
      end
    else if (Self.largeur<>-1) and (Self.hauteur<>-1) then
      begin
      Textout(displaydc,650,5,k_pc_la_largeur_du_rectangle,strlen(k_pc_la_largeur_du_rectangle));
      GetTextExtentPoint(displaydc,k_pc_la_largeur_du_rectangle,strlen(k_pc_la_largeur_du_rectangle),size_ligne);
      slength:=inttostr(Self.largeur);
      Textout(displaydc,660+size_ligne.cx,5,pchar(slength),length(slength));
      GetTextExtentPoint(displaydc,pchar(slength),length(slength),size_largeur);
      Textout(displaydc,670+size_ligne.cx+size_largeur.cx,5,k_pc_sa_hauteur,length(k_pc_sa_hauteur));
      GetTextExtentPoint(displaydc,k_pc_sa_hauteur,length(k_pc_sa_hauteur),size_hauteur);
      slength:=inttostr(Self.hauteur);
      Textout(displaydc,680+size_ligne.cx+size_largeur.cx+size_hauteur.cx,5,pchar(slength),length(slength));
      GetTextExtentPoint(displaydc,pchar(slength),length(slength),size_autre);
      Textout(displaydc,690+size_ligne.cx+size_largeur.cx+size_hauteur.cx+size_autre.cx,5,k_pixel,6);
      end
    else if (Self.grand_rayon<>-1) and (Self.petit_rayon<>-1) then
      begin
      Textout(displaydc,650,5,k_pc_le_grand_rayon_de_cette_ellipse,strlen(k_pc_le_grand_rayon_de_cette_ellipse));
      GetTextExtentPoint(displaydc,k_pc_le_grand_rayon_de_cette_ellipse,strlen(k_pc_le_grand_rayon_de_cette_ellipse),size_ligne);
      slength:=inttostr(Self.grand_rayon);
      Textout(displaydc,660+size_ligne.cx,5,pchar(slength),length(slength));
      GetTextExtentPoint(displaydc,pchar(slength),length(slength),size_largeur);
      Textout(displaydc,670+size_ligne.cx+size_largeur.cx,5,k_pc_le_petit_rayon,strlen(k_pc_le_petit_rayon));
      GetTextExtentPoint(displaydc,k_pc_le_petit_rayon,strlen(k_pc_le_petit_rayon),size_supplementaire);
      slength:=inttostr(Self.petit_rayon);
      Textout(displaydc,680+size_ligne.cx+size_largeur.cx+size_supplementaire.cx,5,pchar(slength),length(slength));
      GetTextExtentPoint(displaydc,pchar(slength),length(slength),size_autre);
      Textout(displaydc,690+size_ligne.cx+size_largeur.cx+size_supplementaire.cx+size_autre.cx,5,k_pixel,6);
      end;
    deleteobject(selectobject(displaydc,afont));
    end
  else if self.couleur<>tcolorref(-1) then
    begin
    abrosse:=selectobject(displaydc,CreatesolidBrush(self.couleur));
    with arect do rectangle(displaydc,-1,-1,succ(right),succ(bottom));
    deleteobject(selectobject(displaydc,abrosse));
    if (Self.Col_color<>nil) then
      begin
      Self.Col_color.Recheche_couleur_plus_proche(couleur,une_couleur_avec_son_nom);
      if une_couleur_avec_son_nom<>nil then
        begin
        ardoise.MakeDefaultFont(alogfont,24);
        strcopy(alogfont.lfFaceName,'Calibri');
        afont:=selectobject(displaydc,CreateFontIndirect(alogfont));
        settextcolor(displaydc,self.couleur xor $ffffff);
        setbkmode(displaydc,TRANSPARENT);
        textout(displaydc,5,5,une_couleur_avec_son_nom.name,strlen(une_couleur_avec_son_nom.name));
        deleteobject(selectobject(displaydc,afont));
        end;
      end;
    end
  else
    begin
    abrosse:=selectobject(displaydc,CreatesolidBrush(rgb(255,255,255)));
    with arect do rectangle(displaydc,-1,-1,succ(right),succ(bottom));
    deleteobject(selectobject(displaydc,abrosse));
    end;
  if Ardoise.Collection<>nil then
    begin
    ardoise.MakeDefaultFont(alogfont,24);
    strcopy(alogfont.lfFaceName, 'Calibri');
    afont:=selectobject(displaydc,CreateFontIndirect(alogfont));
    inttopchar(Ardoise.Collection.Count,apc);
    sysutils.strcat(sysutils.strcat(sysutils.strcopy(bpc,'#'),' '),apc);
    GetTextExtentPoint(displaydc,bpc,sysutils.strlen(bpc),size);
    textout(displaydc,arect.right-size.cx-6,5,bpc,strlen(bpc));
    deleteobject(selectobject(displaydc,afont));
    end;
  with arect do bitblt(paintdc,0,0,right,bottom,displaydc,0,0,SRCCOPY);
  deleteobject(selectobject(displaydc,mon_bitmap));
  deleteDC(displaydc);
  end; {Twindow_State.Paint}

procedure Twindow_State.Show_coordinate(var Msg: TMessage);
  begin
  self.souris.x:=Smallint(loword(Msg.LParam));
  self.souris.y:=Smallint(hiword(Msg.LParam));
  self.couleur:=tcolorref(-1);
  invalidaterect(self.hwindow,nil,false);
  updatewindow(self.hwindow);
  end;

procedure Twindow_State.Show_nom_des_couleurs(var Msg: TMessage);
  begin
  self.souris.x:=-1;
  self.souris.y:=-1;
  self.couleur:=msg.wparam;
  invalidaterect(self.hwindow,nil,false);
  end;

constructor Twindow_Tools.Create(un_parent:ardoise.TWinbase);
  var apc:pc255;
  begin
  self.fonction_annuler_valide:=false;
  get_exe_path(apc);
  strcat(apc,'annuler.bmp');
  if FileExists(strpas(apc)) then
    begin
    self.annuler_bitmap:=tbitmap.create;
	  self.annuler_bitmap.LoadFromFile(apc);
    end
  else
    self.annuler_bitmap:=nil;
  {lecture de la goute}
  get_exe_path(apc);
  strcat(apc,'goute.bmp');
  if FileExists(strpas(apc)) then
    begin
    self.goute_bitmap:=tbitmap.create;
	  self.goute_bitmap.LoadFromFile(apc);
    end
  else
    self.goute_bitmap:=nil;
  inherited Create(un_parent,'Ardoise outils',-1,-1,0,0,False);
  end;

function Twindow_Tools.Getstyle:DWORD;
  begin
  Getstyle:=WS_child or WS_VISIBLE or WS_CLIPCHILDREN or WS_Border;
  end;

function Twindow_Tools.GetClassName:PChar;
  begin
  GetClassName:='Ardoise_outils';
  end;

procedure Twindow_Tools.Annuler_la_fonction;
  begin
  if self.fonction_annuler_valide then
    begin
    Window_ardoise.mon_bitmap.Assign(Window_ardoise.bitmap_annuler);
    Invalidaterect(Window_ardoise.hwindow,nil,false);
    self.fonction_annuler_valide:=false;
    invalidaterect(self.hwindow,nil,false);
    end;
  end; {Twindow_Tools.Annuler_la_fonction}

procedure Twindow_Tools.WMLButtonDown(var Msg: TMessage);
  var ordre:integer;
      position:tpoint;
  begin
  position.x:=Smallint(loword(msg.lparam));
  position.y:=Smallint(hiword(msg.lparam));
  if ptinrect(self.rectangle_about,position) then
    Window_About:=Twindow_About.Create(self)
  else if ptinrect(self.rectangle_annuler,position) then
    self.Annuler_la_fonction
  else
    begin
    if position.y<(succ(k_maximum_tool)*80) then
      begin
      ordre:=position.y div 80;
      ordre:=min(ordre,k_maximum_tool);
      ardoise.Tool_de_tracer:=TTool_de_tracer(ordre);
      if (ardoise.Tool_de_tracer=Tool_Flood_fill)
      and (Window_pictogramme=nil) then
        Window_pictogramme:=TWindow_pictogramme.Create(Window_Main);
      end;
    if ptinrect(rectangle_feutrer,position) then
      k_feutrer := not k_feutrer;
    if ptinrect(rectangle_moucheter,position) then
      k_moucheter := not k_moucheter;
    if ptinrect(rect_pastel,position) then
      begin
      k_pastel := not k_pastel;
      if k_pastel then
        k_controle := False;
      end;
    if ptinrect(rect_controle,position) then
      begin
      k_controle := not k_controle;
      if k_controle then
        k_pastel := False;
      end;
    if ptinrect(rect_transparence,position) then
      begin
      k_transparence:=not k_transparence;
      end;
    invalidaterect(self.hwindow,nil,false);
    end;
  end;

procedure Twindow_Tools.Paint(PaintDC: HDC; var PaintInfo: TPaintStruct);
  const
    k_dessin_des_lignes = true;
    k_dessin_des_rectangles = true;
    k_dessin_des_cercles = true;
    k_dessin_du_spay = true;
    k_dessin_du_remplissage_flood_fill = true;
    k_dessin_de_la_spline = true;
    k_pc_pastel = 'Pastel';
    k_pc_controle = 'Contrôle';
    k_pc_transparence = 'Transparence';
    k_rayon_du_spray = 24;
  var i,j,ii,position:integer;
      arect:trect;
      pen:TGPpen;
      abrosse:hbrush;
      graphics:gdipobj.TGPGraphics;
      size:tsize;
      afont:hfont;
      alogfont:tlogFont;
      displaydc,memdc:hdc;
      mon_bitmap,old_bitmap,old_bmp:hbitmap;
      une_distance,transparence:real;
      afontary:hfont;
      size_auteur,size_denis:tsize;
      Une_Spline:TUne_Spline;
      apcx,apcy:pc1024; {it's enought - denis}
      couleur,an_color:tcolorref;
      v_transparence : real;
  const ks_Auteur = 'Concept';
  const ks_denis = 'Denis';
  const ks_pixels = ' Pixels';
  const ks_resolution = 'Résolution';
  begin
  getclientrect(self.hwindow,arect);
  displaydc:=createcompatibledc(paintdc);
  with arect do
    mon_bitmap:=selectobject(displaydc,createcompatiblebitmap(paintdc,right,bottom));
  rectangle(displaydc,-1,-1,arect.right+1,arect.bottom+1);
  graphics:=gdipobj.TGPGraphics.Create(displaydc);
  graphics.SetSmoothingMode(SmoothingModeAntiAlias);
  graphics.SetSmoothingMode(SmoothingModeHighQuality);
  graphics.SetTextRenderingHint(TextRenderingHintAntiAlias);
  pen:=TGPpen.Create(MakeColor(255,GetRValue(0),GetGValue(0),GetBValue(0)),1);
  for i:=0 to k_maximum_tool do
    begin
    graphics.DrawRectangle(pen,5,5+i*80,65,65);
    end;
  position:=ord(Tool_de_tracer); //Permet d'obtenir l'ordre de l'outil ainsi sélectionné.
  graphics.DrawRectangle(pen,10,10+position*80,55,55);
  pen.free;

  if true and (k_dessin_des_lignes) then
    begin
    pen:=TGPpen.Create(MakeColor(255,0,0,255),4); //Bleu
    graphics.DrawEllipse(pen,15,15+40,5,5);
    graphics.DrawEllipse(pen,15+40,15,5,5);
    pen.free;
    if ardoise.Tool_de_tracer=Tool_line then
      pen:=TGPpen.Create(MakeColor(255,255,0,0),4) //Rouge
    else
      pen:=TGPpen.Create(MakeColor(255,0,255,0),4); //Vert
    graphics.DrawLine(pen,20,15+40,20+40-5,15+5);
    pen.free;

    end; {k_dessin_des_lignes}

  if true and (k_dessin_des_rectangles) then
    begin
    if ardoise.Tool_de_tracer=Tool_rectangle then
      pen:=TGPpen.Create(MakeColor(255,255,0,0),4) //Rouge
    else
      pen:=TGPpen.Create(MakeColor(255,0,255,0),4); //Vert
    graphics.DrawRectangle(pen,18,18+80,41,41);
    pen.free;
    pen:=TGPpen.Create(MakeColor(255,0,0,255),4); //Bleu
    graphics.DrawEllipse(pen,15,15+80,5,5);
    graphics.DrawEllipse(pen,15+40,15+40+80,5,5);
    pen.free;
    end;

  if true and (k_dessin_des_cercles) then
    begin
    if ardoise.Tool_de_tracer=Tool_cercle then
      pen:=TGPpen.Create(MakeColor(255,255,0,0),4) //Rouge
    else
      pen:=TGPpen.Create(MakeColor(255,0,255,0),4); //Vert
    graphics.DrawEllipse(pen,15,15+160,45,45);
    pen.free;
    pen:=TGPpen.Create(MakeColor(255,0,0,255),4); //Bleu
    graphics.DrawEllipse(pen,15+20,15+20+160,5,5);
    graphics.DrawEllipse(pen,15+20+20-5,15+20+160-20+5,5,5);
    pen.free;
    end;

  if true and (k_dessin_du_spay) then
    begin
    for i:=-k_rayon_du_spray to k_rayon_du_spray do
      begin
      ii:=i*i;
      for j:=-k_rayon_du_spray to k_rayon_du_spray do
        begin
        une_distance:=sqrt(ii+j*j);
        if une_distance<=k_rayon_du_spray then
          begin
          transparence:=une_distance/k_rayon_du_spray;
          if false then
            {L'adresse du pixel i,j en passé en premier x,y, après le display context puis la couleur du point}
            setpixel(displaydc,18*2+2+i,3*80+18*2+2+j,
              rgb(127+round(127*transparence),0,0))
          else
            begin
            v_transparence:=une_distance/k_rayon_du_spray;
            couleur:=IN_Between_longint_RGB(rgb(128,128,255),rgb(255,255,255),une_distance,k_rayon_du_spray);
            an_color:=rgb(0,0,255);
            v_transparence:=une_distance/k_rayon_du_spray;
            {L'adresse du pixel i,j en passé en premier x,y, après le display context puis la couleur du point}
            setpixel(displaydc,18*2+2+i,3*80+18*2+2+j,
              rgb(
                min(255,round(getrvalue(couleur)*v_transparence+getrvalue(an_color)*(1-v_transparence))),
                min(255,round(getgvalue(couleur)*v_transparence+getgvalue(an_color)*(1-v_transparence))),
                min(255,round(getbvalue(couleur)*v_transparence+getbvalue(an_color)*(1-v_transparence))) ));
            end;
          end;
        end;
      end;
    end;

  if true and (k_dessin_du_remplissage_flood_fill) and (self.goute_bitmap<>nil) then
    begin
    memdc:=createcompatibledc(paintdc);
    old_bmp:=selectobject(memdc,self.goute_bitmap.Handle);
    bitblt(displaydc,18,4*80+11,self.goute_bitmap.Width,self.goute_bitmap.Height,memdc,0,0,SRCCOPY);
    selectobject(memdc,old_bmp);
    deleteDC(memdc);
    end;
  if true and (k_dessin_de_la_spline) then
    begin
    Une_Spline:=TUne_Spline.Create;
    Une_Spline.a.x:=15;
    Une_Spline.a.y:=5*80+25;
    Une_Spline.b.x:=(15+80-20) div 2;
    Une_Spline.b.y:=5*80+60-5;
    Une_Spline.c.x:=80-20;
    Une_Spline.c.y:=5*80+25+5;
    Une_Spline.couleur:=rgb(255,0,0);
    Une_Spline.epaisseur:=4*5;
    Une_Spline.Calcul(graphics,false);
    pen:=TGPpen.Create(MakeColor(255,0,0,255),4); //Bleu
    graphics.DrawEllipse(pen,15-3,5*80+25-3,5,5);
    graphics.DrawEllipse(pen,(75/2)-2,5*80+60,5,5);
    graphics.DrawEllipse(pen,65-6,5*80+25-3,5,5);
    pen.free;
    end;
  {libération du gdi+plus}
  graphics.free;
  if ardoise.Tool_de_tracer=Tool_spray then
    begin
    position:=6;
    if ardoise.k_feutrer then
      abrosse:=selectobject(displaydc,createsolidbrush(rgb(255,0,255)));
    rectangle(displaydc,5,10+position*80,35,10+position*80+12);
    if ardoise.k_feutrer then
      deleteobject(selectobject(displaydc,abrosse));
    setrect(rectangle_feutrer,5,10+position*80,35,22+position*80);
    if ardoise.k_moucheter then
      abrosse:=selectobject(displaydc,createsolidbrush(rgb(0,255,255)));
    rectangle(displaydc,40,10+position*80,70,22+position*80);
    if ardoise.k_moucheter then
      deleteobject(selectobject(displaydc,abrosse));
    setrect(rectangle_moucheter,40,10+position*80,70,22+position*80);
    MakeDefaultFont(alogfont,24);
    strcopy(alogfont.lfFaceName, 'Calibri');
    afont:=selectobject(displaydc,CreateFontIndirect(alogfont));
    GetTextExtentPoint(displaydc,k_pc_pastel,strlen(k_pc_pastel),size);
    with arect do
      setrect(rect_pastel,10,30+position*80,size.cx+15,30+position*80+size.cy);
    if k_pastel then
      with rect_pastel do
        Soft_rectangle(displaydc,left,top,right,bottom,rgb(128,255,128));
    SetBkMode(displaydc,TRANSPARENT);
    with rect_pastel do
      textout(displaydc,12,2+top,k_pc_pastel,strlen(k_pc_pastel));
    GetTextExtentPoint(displaydc,k_pc_controle,strlen(k_pc_controle),size);
    with arect do
      setrect(rect_controle,2,60+position*80,size.cx+15,60+position*80+size.cy);
    if k_controle then
      with rect_controle do
        Soft_rectangle(displaydc,left,top,right,bottom,rgb(255,128,128));
    with rect_controle do
      Textout(displaydc,2,2+top,k_pc_controle,strlen(k_pc_controle));
    deleteobject(selectobject(displaydc,afont));

    MakeDefaultFont(alogfont,16);
    strcopy(alogfont.lfFaceName, 'Calibri');
    afont:=selectobject(displaydc,CreateFontIndirect(alogfont));
    GetTextExtentPoint(displaydc,k_pc_transparence,strlen(k_pc_transparence),size);
    with arect do
      setrect(rect_transparence,1,90+position*80,1+size.cx,90+position*80+size.cy);
    if k_transparence then
      with rect_transparence do
        Soft_rectangle(displaydc,left,top,right,bottom,rgb(255,128,128));
    with rect_transparence do
      Textout(displaydc,2,2+top,k_pc_transparence,strlen(k_pc_transparence));
    deleteobject(selectobject(displaydc,afont));
    end;
  if self.fonction_annuler_valide and (self.annuler_bitmap<>nil) then
    begin
    if arect.bottom>=655 then
      begin
      memdc:=createcompatibledc(paintdc);
      old_bitmap:=selectobject(memdc,self.annuler_bitmap.Handle);
      setrect(self.rectangle_annuler,
        4,arect.bottom-self.annuler_bitmap.height-8,
        4+self.annuler_bitmap.Width,
        arect.bottom-self.annuler_bitmap.height-8+self.annuler_bitmap.height);
      bitblt(displaydc,4,arect.bottom-self.annuler_bitmap.height-8,
        self.annuler_bitmap.Width,self.annuler_bitmap.height,memdc,0,0,SRCCOPY);
	    selectobject(memdc,old_bitmap);
	    deleteDC(memdc);
      end
    else
      setrect(self.rectangle_annuler,-1,-1,0,0);
    end
  else
    setrect(self.rectangle_annuler,-1,-1,0,0);
  if ((arect.bottom>=630) and (ardoise.Tool_de_tracer<>Tool_spray))
  or ((arect.bottom>=720) and (ardoise.Tool_de_tracer=Tool_spray)) then
    begin
    settextcolor(displaydc,rgb(0,0,255));
    afontary:=selectobject(displaydc,Get_Calibri_font);
    GetTextExtentPoint(paintdc,ks_Auteur,length(ks_Auteur),size_auteur);
    GetTextExtentPoint(paintdc,ks_denis,length(ks_denis),size_denis); {denis le 27.7.2015}
    setrect(rectangle_about,6,arect.Bottom-142,14+max(10+size_auteur.cx,18+size_denis.cx),arect.Bottom-28+size_denis.cy-80);
    inflaterect(rectangle_about,4,4);
    with rectangle_about do roundrect(displaydc,left,top,right-4,bottom,8,8);
    Setbkmode(displaydc,TRANSPARENT);
    Textout(displaydc,4,arect.Bottom-142,ks_Auteur,length(ks_Auteur));
    Textout(displaydc,14,arect.Bottom-118,ks_denis,length(ks_denis)); {Do in 18}
    deleteobject(selectobject(displaydc,afontary));
    end;
  {Indication de la résolution de l'image de travail qui est la même que celle de l'écran}
  if ((arect.bottom>=695) and  (ardoise.Tool_de_tracer<>Tool_spray))
  or ((arect.bottom>=775) and (ardoise.Tool_de_tracer=Tool_spray)) then
    begin
    afontary:=selectobject(displaydc,Get_Calibri_font(18));
    inttopchar(Ardoise.Window_ardoise.mon_bitmap.Width,apcx);
    strcat(apcx,ks_pixels);
    inttopchar(Ardoise.Window_ardoise.mon_bitmap.Height,apcy);
    strcat(apcy,ks_pixels);
    Textout(displaydc,6,arect.Bottom-208,ks_resolution,strlen(ks_resolution));
    Textout(displaydc,6,arect.Bottom-188,apcx,strlen(apcx));
    Textout(displaydc,6,arect.Bottom-168,apcy,strlen(apcy));
    deleteobject(selectobject(displaydc,afontary));
    end
  else if ((arect.bottom>=630) and (ardoise.Tool_de_tracer<>Tool_spray)) then
    begin
    if Ardoise.Window_ardoise<>nil then
      begin
      afontary:=selectobject(displaydc,Get_Calibri_font(18));
      inttopchar(Ardoise.Window_ardoise.mon_bitmap.Width,apcx);
        strcat(apcx,ks_pixels);
      inttopchar(Ardoise.Window_ardoise.mon_bitmap.Height,apcy);
        strcat(apcy,ks_pixels);
      Textout(displaydc,6,arect.Bottom-72,ks_resolution,strlen(ks_resolution));
      Textout(displaydc,6,arect.Bottom-52,apcx,strlen(apcx));
      Textout(displaydc,6,arect.Bottom-32,apcy,strlen(apcy));
      deleteobject(selectobject(displaydc,afontary));
      end;
    end; {cette place permet d'indiquer la résoltution ses dimentions, sa taille}


  with arect do bitblt(paintdc,0,0,right,bottom,displaydc,0,0,SRCCOPY);
  deleteobject(selectobject(displaydc,mon_bitmap));
  deleteDC(displaydc);
  end; {Twindow_Tools.Paint}

{******************* LA fentre A Propos * le 27.7.2015 *************************}

constructor Twindow_About.Create(un_parent:ardoise.TWinbase);
  begin
  inherited create(un_parent,'A propos',
    (getsystemmetrics(SM_CXSCREEN)-926) div 2, //Optenir la résolution de l'écran en x & y
    (getsystemmetrics(SM_CYSCREEN)-275) div 2,926,420,False); //pour centrer la fenêtre
  end;

function  Twindow_About.Getstyle:DWORD;
  begin
  result:=WS_OVERLAPPED;
  end;

function  Twindow_About.GetClassName:PChar;
  begin
  GetClassName:='About ardoise';
  end;

procedure Twindow_About.Paint(PaintDC: HDC; var PaintInfo: TPaintStruct);
  var arect:trect;
      une_image:Tbitmap;
      apc_path:pc1024;
      another_memdc:hdc;
      old:hbitmap;
      size_contact,size_ok:tsize;
  const k_raccourcis : boolean = true;
  const present = 'Présentation du logiciel ardoise :';
    k1 = 'Ce logiciel permet de transformer votre ordinateur en une ardoise de dessin.';
    k2 = 'Ce logiciel est conçu pour être installé avec Windows XP-Vista Seven ou Height voir 10.';
    k3 = 'Dessiner avec votre souris sur l''espace de l''ardoise qui est située dans une de fenêtre de votre système d''utilisation avec le logiciel ardoise.';
    k4 = 'Pour l''utiliser choisisez un élément de dessin spécifique dans la palette située à gauche de la fenêtre du logiciel ardoise.';
    k5 = 'Choisissez avec les pictogrammes de cette palette les dessins que vous voulez représenter ou figurer.';
    k6 = 'Déplacer le curseur de votre souris sur la fenêtre du logiciel ardoise puis cliquer avec le bouton gauche de votre souris pour dessiner avec cette palette.';
    k7 = 'Déterminer l''apparence du dessin avec la palette des couleurs et le bouton gauche de votre souris si vous cliquez avec votre souris sur la palette chromatique';
    k8 = 'ou bien cliquer avec le droit de la souris sur cette fenêtre pour obtenir une palette monochrome.';
    k9 = 'La touche CTRL permet de transformer le dessin des cercles en ellipse, de contraindre les lignes par pas de 10° ou de tracer des spots sur les courbes de Bézier.';
    k10 = 'La touche CTRL permet aussi de dessiner des carrés avec l''outil rectangle, ou bien avec latouche Majuscule de centrer ce carré sur le point de départ.';
    kContact ='denisbeelog@gmail.com.';
    k_Version = 'Version 2 le 31 Décembre 2015';
  var acursor:tpoint;
  var arectangle_ok:trect;
  var  une_typo:hfont;
  var memdc:hdc;
  var old_bitmap:hbitmap;
  var size_version : tsize;
  const kok = 'Ok';
        k_ecran_f1 = 'la touche d''aide F1 affiche cet écran de même que la touche ?';
        k_Nouveau_document = 'La touche N créer un nouveau document.';
        k_Ouvrir_un_document = 'La touche O ouvre un nouveau document.';
        k_Enregistrer = 'La touche E Enregistre le document.';
        k_Enregistrer_sous_un_document = 'La touche S Enregistre sous un autre nom le document.';
        k_copier = 'La touche C copie dans le presse-papier l''image du document.';
        k_la_touche_ardoise = 'La touche A comme ardoise créer une image pixelisée noire';
        k_la_touche_quadrillage = 'La touche Q créer un quadrillage régulier avec la couleur sélectionnée.';
        k_la_touche_undo = 'La touche Z annule le dessin de la dernière action';
        k_ecran_f2 = 'la touche de fonction F2, créer une sphère ajustée sur le quadrillage.';
        k_ecran_f3 = 'la touche de fonction F3, créer des cercles concentriques.';
        k_ecran_f4 = 'la touche de fonction F4, permet d''afficher une spirale.';
        k_ecran_f5 = 'la touche de fonction F5, permet d''afficher un triangle, des pentagones,hexagone,octohèdres,dodécadres.';
        k_Table_des_caracteres = 'Table des caractères';
        k_la_touche_F = 'La touche F affiche l''écran principale en mode pleine écran.';
  begin
  getcursorpos(acursor);
  screentoclient(self.hwindow,acursor);
  getclientrect(self.hwindow,arect);
  memdc:=createcompatibledc(paintdc);
  with arect do old_bitmap:=selectobject(memdc,createcompatiblebitmap(paintdc,right,bottom));
  rectangle(memdc,-1,-1,succ(arect.right),succ(arect.bottom));
  une_typo:=selectobject(memdc,Get_Calibri_font(18));
  textout(memdc,2,2,present,length(present));
  deleteobject(selectobject(memdc,une_typo));
  une_typo:=selectobject(memdc,Get_Calibri_font(16));
  textout(memdc,12,32,k1,strlen(k1));
  textout(memdc,12,56,k2,strlen(k2));
  textout(memdc,12,80,k3,strlen(k3));
  textout(memdc,12,104,k4,strlen(k4));
  textout(memdc,12,128,k5,strlen(k5));
  textout(memdc,12,152,k6,strlen(k6));
  textout(memdc,12,176,k7,strlen(k7));
  textout(memdc,12,200,k8,strlen(k8));
  textout(memdc,12,224,k9,strlen(k9));
  textout(memdc,12,248,k10,strlen(k10));
  GetTextExtentPoint(memdc,kContact,strlen(kContact),size_contact);
  textout(memdc,arect.Right-12-size_contact.cx,arect.bottom-size_contact.cy-12,kContact,strlen(kContact));
  deleteobject(selectobject(memdc,une_typo));
  une_typo:=selectobject(memdc,Get_Calibri_font(18));
  GetTextExtentPoint(memdc,kok,2,size_ok);
  setrect(arectangle_ok,arect.right-32,6,arect.right-32+size_ok.cx,6+size_ok.cy);
  if ptinrect(arectangle_ok,acursor) then
    settextcolor(memdc,rgb(255,0,0))
  else
    settextcolor(memdc,rgb(0,0,0));
  textout(memdc,arect.right-32,6,kok,2);
  deleteobject(selectobject(memdc,une_typo));

  get_exe_path(apc_path); strcat(apc_path,'denis.bmp');
  if FileExists(strpas(apc_path)) then
    begin
    une_image:=Tbitmap.Create;
    une_image.LoadFromFile(apc_path);
    another_memdc:=createcompatibledc(paintdc);
    old:=selectobject(another_memdc,une_image.Handle);
    bitblt(memdc,arect.right-170,2,120,71,another_memdc,0,0,SRCCOPY);
    deleteobject(selectobject(another_memdc,old));
    une_image.free;
    end;

  if k_raccourcis then
    begin
    setbkmode(memdc,TRANSPARENT);
    une_typo:=selectobject(memdc,Get_Calibri_font(12));
    settextcolor(memdc,rgb(255,0,0));
    textout(memdc,8,268,k_Table_des_caracteres,length(k_Table_des_caracteres));
    deleteobject(selectobject(memdc,une_typo));
    une_typo:=selectobject(memdc,Get_Calibri_font(14));
    settextcolor(memdc,rgb(255,0,255));
    textout(memdc,12,284,k_ecran_f1,length(k_ecran_f1));
    settextcolor(memdc,rgb(0,0,255));
    textout(memdc,12,298,k_Nouveau_document,length(k_Nouveau_document));
    textout(memdc,12,306,k_Ouvrir_un_document,length(k_Ouvrir_un_document));
    textout(memdc,12,314,k_Enregistrer,length(k_Enregistrer));
    textout(memdc,12,322,k_Enregistrer_sous_un_document,length(k_Enregistrer_sous_un_document));
    textout(memdc,12,330,k_la_touche_F,length(k_la_touche_F));
    textout(memdc,400,298,k_copier,length(k_copier));
    textout(memdc,400,306,k_la_touche_ardoise,length(k_la_touche_ardoise));
    textout(memdc,400,314,k_la_touche_quadrillage,length(k_la_touche_quadrillage));
    textout(memdc,400,322,k_la_touche_undo,length(k_la_touche_undo)); {Bertin-paint}
    textout(memdc,400,330,k_ecran_f2,length(k_ecran_f2));
    textout(memdc,400,338,k_ecran_f3,length(k_ecran_f3));
    textout(memdc,400,346,k_ecran_f4,length(k_ecran_f4));
    textout(memdc,400,354,k_ecran_f5,length(k_ecran_f5));
    deleteobject(selectobject(memdc,une_typo));
    une_typo:=selectobject(memdc,Get_Calibri_font(16));
    settextcolor(memdc,rgb($F9,$75,6));
    GetTextExtentPoint(memdc,k_Version,length(k_Version),size_version);
    textout(memdc,arect.right-size_version.cx-12,arect.bottom-size_version.cy+2,k_Version,length(k_Version));
    deleteobject(selectobject(memdc,une_typo));
    end;
  with arect do bitblt(paintdc,0,0,right,bottom,memdc,0,0,SRCCOPY);
  deleteobject(selectobject(memdc,old_bitmap));
	deleteDC(memdc);
  end; {Twindow_About.Paint}

procedure Twindow_About.WMChar(var Msg: TMessage);
  begin
  if msg.wparam=ord(27) then //27 - Le code de la touche échapement en Ascii
    destroywindow(self.hwindow);
  end;

procedure Twindow_About.WMLButtonDown(var Msg: TMessage);
  begin
  destroywindow(self.hwindow);
  end;

procedure Twindow_About.WMMousemove(var Msg: TMessage);
  begin
  invalidaterect(self.hwindow,nil,false);
  end; {Twindow_About.WMMousemove}

{******************************************************************************}

constructor Twindow_export_ato.Create(un_parent:ardoise.TWinbase; un_nom_du_fichier:string);
  begin
  inherited create(un_parent,'Exporter un fichier Ato',
    (getsystemmetrics(SM_CXSCREEN)-600) div 2, //Obtenir la résolution de l'écran en x & y
    (getsystemmetrics(SM_CYSCREEN)-172) div 2,600,172,False); //Pour centrer la fenêtre sur l'écran
  strcopy(self.nom_du_fichier,pchar(un_nom_du_fichier));
  end;

function Twindow_export_ato.Getstyle:DWORD;
  begin
  Getstyle:=WS_OVERLAPPED or WS_SYSMENU;
  end;

function Twindow_export_ato.GetClassName:PChar;
  begin
  GetClassName:='Ardoise exporter un fichier Atomique';
  end;

procedure Twindow_export_ato.Paint(PaintDC: HDC; var PaintInfo: TPaintStruct);
  const ks_a = 'Le type de fichier Ato à été conçus pour le logiciel Denis Draw'; {Par son auteur denis bertin}
  const ks_b = 'Pour découvrir le logiciel de dessin vectoriel Denis Draw cliquez sur cette case :';
  const ks_c = 'Vous ne voulez plus revoir ce message ?';
  const ks_d = 'Le logiciel Denis Draw est déja installé, voulez-vous ouvrir ce fichier avec ?';
  var une_typo,une_font:hfont;
      size:tsize;
      arect:trect;
      bool_key_ato_file_found:boolean;
      registre:TRegistry;
      resultat:string;
      nom_cle:string;
      apoint:tpoint;
      adc:hdc;
      rect:trect;
      old_bitmap:hbitmap;
  begin
  getclientrect(self.hwindow,rect);
  adc:=createcompatibledc(paintdc);
  with rect do
    old_bitmap:=selectobject(adc,createcompatiblebitmap(paintdc,right,bottom));
  getcursorpos(apoint);
  screentoclient(self.hwindow,apoint);
  bool_key_ato_file_found:=false;
  //vérification de la présence de la clé atofile
  try
    registre:=TRegistry.create;
    registre.RootKey:=HKEY_CLASSES_ROOT;
    nom_cle:=strpas('\AtoView\shell\open\command');
    resultat:='';
    if registre.openkey(nom_cle,True) then
      begin
      resultat:=registre.ReadString('');
      bool_key_ato_file_found:=strpos(pchar(resultat),'.exe')<>nil;
      end;
    registre.closekey;
  finally
    registre.free;
    end; //écrit par denis bertin le 30.7.2015
  getclientrect(self.hwindow,arect);
  rectangle(adc,-1,-1,succ(arect.Right),succ(arect.bottom));
  une_typo:=selectobject(adc,Get_Calibri_font(24));
  settextcolor(adc,rgb(0,0,255));
  textout(adc,5,5,ks_a,strlen(ks_a));
  settextcolor(adc,rgb(0,0,255));
  Setbkmode(adc,TRANSPARENT);
  deleteobject(selectobject(adc,une_typo));
  une_typo:=selectobject(adc,Get_Calibri_font(18));
  textout(adc,5,50,ks_b,strlen(ks_b));
  textout(adc,5,80,ks_c,strlen(ks_c));
  if not bool_key_ato_file_found then
    settextcolor(adc,rgb(92,92,92)); //A grey light all composants are equal.
  textout(adc,5,110,ks_d,strlen(ks_d));
  GetTextExtentPoint(adc,ks_b,strlen(ks_b),size);
  setrect(self.rect_decouvrir,5+size.cx+10,50,5+size.cx+10+32,50+size.cy);
  with self.rect_decouvrir do roundrect(adc,left,top,right,bottom,6,6);
  une_font:=selectobject(adc,Get_Calibri_font(16));
  if ptinrect(self.rect_decouvrir,apoint) then
    settextcolor(adc,rgb(255,0,0))
  else
    settextcolor(adc,rgb(0,0,255));
  with self.rect_decouvrir do Textout(adc,left+4,top+1,'Ok',2);
  deleteobject(selectobject(adc,une_font));
  GetTextExtentPoint(adc,ks_c,strlen(ks_c),size);
  setrect(self.rect_revoir_ce_message,5+size.cx+10,80,5+size.cx+10+32,80+size.cy);
  with self.rect_revoir_ce_message do roundrect(adc,left,top,right,bottom,6,6);
  une_font:=selectobject(adc,Get_Calibri_font(16));
  if ptinrect(self.rect_revoir_ce_message,apoint) then
    settextcolor(adc,rgb(255,0,0))
  else
    settextcolor(adc,rgb(0,0,255));
  with self.rect_revoir_ce_message do Textout(adc,left+4,top+1,'Non',3);
  deleteobject(selectobject(adc,une_font));
  GetTextExtentPoint(adc,ks_d,strlen(ks_d),size);
  //Pensaitez a tous les conditions possible
  if bool_key_ato_file_found then
    begin
    setrect(self.rect_open_denis_draw,5+size.cx+10,110,5+size.cx+10+32,110+size.cy);
    with self.rect_open_denis_draw do roundrect(adc,left,top,right,bottom,6,6);
    une_font:=selectobject(adc,Get_Calibri_font(16));
    if ptinrect(self.rect_open_denis_draw,apoint) then
      settextcolor(adc,rgb(255,0,0))
    else
      settextcolor(adc,rgb(0,0,255));
    with self.rect_open_denis_draw do Textout(adc,left+4,top+1,'Oui',3);
    deleteobject(selectobject(adc,une_font));
    end
  else
    setrect(self.rect_open_denis_draw,-1,-1,0,0);
  deleteobject(selectobject(adc,une_typo));
  with rect do bitblt(paintdc,0,0,right,bottom,adc,0,0,SRCCOPY);
	deleteobject(selectobject(adc,old_bitmap));
	deleteDC(adc);
  end;

procedure Twindow_export_ato.WMMousemove(var Msg: TMessage);
  begin
  invalidaterect(self.hwindow,nil,false);
  end;

procedure Twindow_export_ato.WMLButtonDown(var Msg: TMessage);
  const key = 'HKEY_CLASSES_ROOT\AtoView\shell\open\command';
  const k_exe = '.exe';
  var un_point:tpoint;
      nom_cle:string;
      registre:TRegistry;
      resultat:string;
      apc:pc1024;
      pc:pchar;
  begin
  un_point.x:=Smallint(loword(msg.lparam));
  un_point.y:=Smallint(hiword(msg.lparam));
  if ptinrect(self.rect_open_denis_draw,un_point) then
    begin
    try
      registre:=TRegistry.create;
      registre.RootKey:=HKEY_CLASSES_ROOT;
      nom_cle:=strpas('\AtoView\shell\open\command');
      resultat:='';
      if registre.openkey(nom_cle,True) then
        begin
        resultat:=registre.ReadString('');
        strcopy(apc,pchar(resultat));
        pc:=strpos(apc,k_exe);
        if pc<>nil then
          begin
          inc(pc,succ(strlen(k_exe))); //i comprix the white caracter.
          pc^:=#0;
          strcat(strcat(strcat(pc,'"'),self.nom_du_fichier),'"');
          winexec(apc,sw_show);
          end;
        end;
      registre.closekey;
    finally
      registre.free;
      end; //écrit par denis bertin le 30.7.2015
    end
  else if ptinrect(self.rect_decouvrir,un_point) then
    winexec('explorer.exe http://www.denisdraw.fr',sw_show)
  else if ptinrect(self.rect_revoir_ce_message,un_point) then
    begin
    try
      registre:=TRegistry.create;
      registre.RootKey:=HKEY_CURRENT_USER;
		  nom_cle:=strpas('Ardoise');
      if registre.openkey(nom_cle,True) then
        registre.WriteString('revoir','False');
		  registre.closekey;
    finally
		  registre.free;
      end;
    destroywindow(self.hwindow);
		end;
  if false then
    destroywindow(self.hwindow);
  end;

procedure Twindow_export_ato.WMChar(var Msg: TMessage);
  begin
  if msg.wparam=27 then
    destroywindow(self.hwindow);
  end; {Twindow_export_ato.WMChar}

{******************************************************************************}

procedure Full_Screen_Initialisation;
  begin
  Window_Main:=Twindow_Main.create(nil);
  end; {Full_Screen_Initialisation}


{----------------------------------- TFastBitmap2 -------------------------------------}
{Amélioration des fonctions Get/SET BitMap en utilisant un langage d'accès à la mémoire}
{--------------------------- TFastBitmap2 ---------------------------------------------}

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
  Bmp.free;
  end;

procedure tFastBitmap2.SetPixel_in_limite(x,y :integer; color : TColor);
  begin
  with pRGBTriple(Scan0 + Y*MLS + X*BPP)^ do
    begin
    rgbtRed  :=color and $ff;
    rgbtGreen:=(color shr 8) and $ff;
    rgbtBlue :=(color shr 16) and $ff;
		end;
  end;

function tFastBitmap2.GetPixel_in_limite(X,Y : Integer) : tColor;
  begin
  with pRGBTriple(Scan0 + Y*MLS + X*BPP)^ do Result:=RGB(rgbtRed,rgbtGreen,rgbtBlue);
  end;

function tFastBitmap2.GetPixel(X,Y : Integer) : tColor;
	begin
  {vérification du domaine des coordonnées}
	if (x>=0) and (y>=0) and (x<self.W) and (y<self.H) then
		begin
		with pRGBTriple(Scan0 + Y*MLS + X*BPP)^ do Result:=RGB(rgbtRed,rgbtGreen,rgbtBlue);
		end
	else
		GetPixel:=rgb_blanc;
  end;

procedure tFastBitmap2.SetPixel(x,y :integer; color : TColor);
  begin
  {vérification du domaine des coordonnées}
  if (x>=0) and (y>=0) and (x<self.W) and (y<self.H) then
		begin
    with pRGBTriple(Scan0 + Y*MLS + X*BPP)^ do
      begin
      rgbtRed  :=color and $ff;
      rgbtGreen:=(color shr 8) and $ff;
      rgbtBlue :=(color shr 16) and $ff;
			end;
		end
  end; {tFastBitmap2.SetPixel}

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

var message:tmsg;

begin
ardoise.nom_fichier:='';
ardoise.Collection:=contnrs.TObjectList.Create;
ardoise.Global_ListWindow:=Contnrs.TObjectList.Create;
Full_Screen_Initialisation;
while Getmessage(message,0,0,0) do
	begin
  translatemessage(message);
	dispatchmessage(message);
  end;
ardoise.Global_ListWindow.Free;
ardoise.Collection.Free;
end.

