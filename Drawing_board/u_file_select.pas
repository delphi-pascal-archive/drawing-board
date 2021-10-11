unit u_file_select; {Un soir une rencontre... écrit par denis bertin.. le roi des artistes}
	{Copyright B&L logiciel une création de denis Beelog copyright 1992-2012}
	{Ajout par denis beelog du dialogue de choix de la typo le 20.11.2011}
	{Un module écrit par denis bertin pour lui même et comme l'intégralité de son logiciel}
	{Ecrit et améliorer par denis bertin pour paramètrer les attributs des fontes-typos}
	{Ecrit et améliorer par denis bertin pour ajouter le dialogue d'affichage des couleurs de windows}
	{Et alors si c'est rico qui l'a écrit pourquoi m'a t-il demander d'ouvrir mon code source devant un témoin?}
	{Et hop ils nous mentent encore comme d'habiture}

interface

uses Windows,messages;

function Affiche_le_dialogue_d_enregistrement(awindow:windows.hwnd;
  out_filename,initialdir,in_filter,in_extention:pchar):boolean;

function Affiche_le_dialogue_de_lecture(awindow:windows.hwnd;
  out_filename,initialdir,in_filter,in_extention:pchar;
		de_muliple_fichier:boolean; taille_receptacle:integer):boolean;

function Affiche_le_dialogue_des_jeux_de_caracteres(awindow:windows.hwnd;
  result_font_name:pchar; var result_font_size:integer;
    var result_de_cette_couleur:tcolorref;
    var result_typography_grasse:boolean;
    var result_typographie_italic:boolean;
		var result_typographie_sousligner:boolean;
    var result_typographie_strikeout:boolean):boolean;

function Affiche_le_dialogue_des_couleur_window(awindow:windows.hwnd; var result_color:tcolorref):boolean;

implementation

uses CommDlg,sysutils;

type pc1024 = array[0..1024] of char;

function Affiche_le_dialogue_d_enregistrement(awindow:windows.hwnd;
	out_filename,initialdir,in_filter,in_extention:pchar):boolean;
	var open_a_file_name:CommDlg.OPENFILENAME;
	var pc_chemin_memoriser:pc1024;
	begin
	strcopy(pc_chemin_memoriser,initialdir);
	Affiche_le_dialogue_d_enregistrement:=false;
	fillchar(open_a_file_name,sizeof(open_a_file_name),0);
	open_a_file_name.lStructSize:=sizeof(open_a_file_name);
	open_a_file_name.hWndOwner:=awindow;
	open_a_file_name.hInstance:=hinstance;
	open_a_file_name.lpstrFilter:=in_filter;
	open_a_file_name.lpstrCustomFilter:=nil;
	open_a_file_name.nMaxCustFilter:=0;
	open_a_file_name.nFilterIndex:=0;
	open_a_file_name.lpstrFile:=out_filename;
	open_a_file_name.nMaxFile:=1024;
	open_a_file_name.lpstrFileTitle:=nil;
	open_a_file_name.nMaxFileTitle:=0;
	open_a_file_name.lpstrInitialDir:=@pc_chemin_memoriser;
	open_a_file_name.lpstrTitle:=nil;
	open_a_file_name.Flags:=OFN_EXPLORER;
	open_a_file_name.nFileOffset:=0;
	open_a_file_name.nFileExtension:=0;
	open_a_file_name.lpstrDefExt:=in_extention;
	open_a_file_name.lCustData:=0;
	open_a_file_name.lpfnHook:=nil;
	open_a_file_name.lpTemplateName:=nil;
	open_a_file_name.pvReserved:=nil;
	open_a_file_name.dwReserved:=0;
	open_a_file_name.FlagsEx:=0;
	Affiche_le_dialogue_d_enregistrement:=CommDlg.GetSaveFileName(Open_a_file_name);    
	end; {Affiche_le_dialogue_d_enregistrement}

function Affiche_le_dialogue_de_lecture(awindow:windows.hwnd;
		out_filename,initialdir,in_filter,in_extention:pchar;
		de_muliple_fichier:boolean; taille_receptacle:integer):boolean;
	var open_a_file_name:CommDlg.OPENFILENAME;
	var pc_chemin_memoriser:pc1024;
	begin
	strcopy(pc_chemin_memoriser,initialdir);
	Affiche_le_dialogue_de_lecture:=false;
	fillchar(open_a_file_name,sizeof(open_a_file_name),0);
	open_a_file_name.lStructSize:=sizeof(open_a_file_name);
	open_a_file_name.hWndOwner:=awindow;
	open_a_file_name.hInstance:=hinstance;
	open_a_file_name.lpstrFilter:=in_filter;
	open_a_file_name.lpstrCustomFilter:=nil;
	open_a_file_name.nMaxCustFilter:=0;
	open_a_file_name.nFilterIndex:=0;
	open_a_file_name.lpstrFile:=out_filename;
	open_a_file_name.nMaxFile:=taille_receptacle;
	open_a_file_name.lpstrFileTitle:=nil;
	open_a_file_name.nMaxFileTitle:=1024;
	open_a_file_name.lpstrInitialDir:=@pc_chemin_memoriser;
	open_a_file_name.lpstrTitle:=nil;
	open_a_file_name.Flags:=OFN_EXPLORER;
	if de_muliple_fichier then
		open_a_file_name.Flags:=open_a_file_name.Flags or OFN_ALLOWMULTISELECT;
	open_a_file_name.nFileOffset:=0;
	open_a_file_name.nFileExtension:=0;
	open_a_file_name.lpstrDefExt:=in_extention;
	open_a_file_name.lCustData:=0;
	open_a_file_name.lpfnHook:=nil;
	open_a_file_name.lpTemplateName:=nil;
	open_a_file_name.pvReserved:=nil;
	open_a_file_name.dwReserved:=0;
	open_a_file_name.FlagsEx:=0;
  Affiche_le_dialogue_de_lecture:=CommDlg.GetOpenFileName(open_a_file_name);
  end; {affiche_le_dialogue_de_lecture}

function Affiche_le_dialogue_des_jeux_de_caracteres(awindow:windows.hwnd;
    result_font_name:pchar;
    var result_font_size:integer;
    var result_de_cette_couleur:tcolorref;
    var result_typography_grasse:boolean;
    var result_typographie_italic:boolean;
    var result_typographie_sousligner:boolean;
    var result_typographie_strikeout:boolean):boolean;
  var adc:hdc;
			local_ChooseFont:CommDlg.TCHOOSEFONT;
      local_un_logfont:Tlogfont;
      resultat:boolean;
  begin
  Adc:=GetDc(awindow);
  FillChar(local_ChooseFont, SizeOf(local_ChooseFont),#0);
  FillChar(local_un_logfont, SizeOf(local_ChooseFont),#0);
  local_ChooseFont.lStructSize:= SizeOf(commdlg.TChooseFont);
  local_ChooseFont.rgbColors:=result_de_cette_couleur;
  local_un_logfont.lfHeight:=-MulDiv(result_font_size, GetDeviceCaps(Adc, LOGPIXELSY), 72);
	if result_typography_grasse then local_un_logfont.lfWeight:=fw_bold;
  if result_typographie_italic then local_un_logfont.lfItalic:=1;
  if result_typographie_sousligner then local_un_logfont.lfUnderline:=1;
  if result_typographie_strikeout then local_un_logfont.lfStrikeOut:=1;
  strcopy(local_un_logfont.lfFaceName,result_font_name);
	local_ChooseFont.hwndOwner  := AWindow;
  local_ChooseFont.hdc        := Adc;
  local_ChooseFont.lpLogFont  := @local_un_logfont;
  local_ChooseFont.Flags      := Cf_ScreenFonts
    or Cf_InitToLogFontStruct
    or Cf_ttonly
    or Cf_effects
    or Cf_USESTYLE;
  local_ChooseFont.HINSTANCE  :=HInstance;
  resultat:=CommDlg.ChooseFont(local_ChooseFont);
  if resultat then
		begin
    strcopy(result_font_name,local_un_logfont.lfFaceName);
    result_font_size:=abs(round(local_ChooseFont.iPointSize/10));
    result_de_cette_couleur:=local_ChooseFont.rgbColors;
    result_typography_grasse:=local_ChooseFont.lpLogFont.lfWeight=FW_BOLD;
    result_typographie_italic:=local_un_logfont.lfItalic<>0;
    result_typographie_sousligner:=local_ChooseFont.lpLogFont.lfUnderline<>0;
    result_typographie_strikeout:=local_ChooseFont.lpLogFont.lfStrikeOut<>0;
    end;
  Affiche_le_dialogue_des_jeux_de_caracteres:=Resultat;
	releasedc(awindow,adc);
  end;

function Affiche_le_dialogue_des_couleur_window(awindow:windows.hwnd; var result_color:tcolorref):boolean;
  var ChooseColor:CommDlg.TChooseColor;
  var tab_16_color:array[0..15] of TCOLORREF;
  begin
  Fillchar(ChooseColor,sizeof(ChooseColor),#0);
  ChooseColor.lStructSize:=sizeof(ChooseColor);
  ChooseColor.hwndOwner:=awindow;
  ChooseColor.Flags:=CC_FULLOPEN;
  ChooseColor.lpCustColors:=@tab_16_color;
  result:=CommDlg.ChooseColor(ChooseColor);
  result_color:=ChooseColor.rgbResult;
  end;

end.