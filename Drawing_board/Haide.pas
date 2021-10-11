unit haide;

{Tu nous ment aussi c'est Denis qui l'a écrit - tu arrète de mentir gros con}

interface

uses {$ifdef bp7} Owindows, {$endif bp7} windows,sysutils;

const

  k_gradian_grd = 'gradian.grd';

	id_dialog_aide=999;
{menu fichier}
	HelpIdFileNOUVEAU  			 = 100;
  HelpIdFileLAUNCHApp      = 110;
	HelpIdFileOUVRIR   			 = 101;
	HelpidfileINSERER			   = 129;
	HelpIdFileSAVE     			 = 102;
	HelpIdFileSAVEAS   			 = 103;
  HelpIdFileOpenIMG        = 105;
	HelpidFileSAVESI      	 = 128;
	HelpidFileLocaliser    	 = 135;
  HelpIfilegestion_project = 109;
	HelpidFiledictionnaire   = 113;
  HelpidFilepublishontheweb= 104;
	HelpIdFileIMPRIMER			 = 106;
	HelpIdFileCONFIG   			 = 107;
	HelpIdFile_tableau_de_bord = 112;
  HelpIdFile_trace_logique   = 111;
	HelpIdFileQUITTER  			   = 108;

	HelpIdFileReference			= 123;
	HelpIdFileChercher			= 124;
	HelpIdFileTrouver				= 125;

	HelpIdFichier_XfileX			= 121;
	HelpIdFichier_Gabarit		= 122; {Nouveau pour christophe 3.4.95}

	{Import/export}
	HelpIdFile_Imp_TXT  = 105;
	HelpIdFile_Imp_PLT  = 109;
	HelpIdFile_Imp_BMP  = 110;
	HELPIDFILE_IMP_PCX  = 115;
	HELPIDFILE_IMP_WMF  = 116;
	HelpIdFile_Exp_WMF  = 104;
	HelpIdFile_Exp_PLT  = 111;
	HELPIDFILE_Exp_luxart     = 114;
	HELPIDFILE_Exp_postscript = 118;
	HELPIDFILE_IMP_TGA        = 119;
	Helpidfile_Exp_BMP        = 120; {Or other format not describe}
  Helpidfile_Imp_DXF        = 134;
	HELPIDFILE_IMP_EPS        = 122; {Version 2.1}
	HELPIDFILE_IMP_GIF        = 123; {Version 2.1}
	HELPIDFILE_exp_VML        = 126; {Version 3}
	HELPIDFILE_exp_DXF        = 127; {Version 3}
	HELPIDFILE_exp_ATO        = 128; {Version 3.4}

  HELPIDFILE_exp_Processing = 131; {Version 5}
  HELPIDFILE_afficher_le_code_source = 132; {Version 5}
  HELPIDFILE_afficher_la_page_d_aide_de_persistance = 133;
  HELPIDFILEMINIDICO                 = 112;

{menu edition}
	HELPIdEDITANNULER  	= 200;
	HELPIdEDITrefaire		= 206;
	HELPIdEDITrevenir   = 214; {nouveau le 20.8.2006}
	HELPIdEDITsupprimer	= 207;
	HELPIdEDITCOUPER   	= 201;
	HELPIdEDITCOPIER   	= 202;
	HELPIdEDITCOLLER   	= 203;
	HELPIDEDIT_Coller_Special= 211; {nouveau le 20.6.1994}
	HELPIdEDITDUPLIQUER	     = 204;
	HELPIdEDITTOUTSEL  	     = 205;
	HELPIdEDITCopierStyle    = 208;
	HELPIdEDITCollerStyle    = 209;
	HELPIdEditCollerSpecial  = 210;
	HELPIdEdit_Select_sur    = 212;
	HELPIdEdit_Select_Avec   = 213;
	HELPIdSelectionnerInverse= 215;
  HELPIdVisualSelect       = 217; {nouveau le 15.6.2011}
  HELPIdEDIT_With_Relation = 218; {nouveau le 1.8.2012}

{menu modifier}
	HELPIdmodifGROUPER  	= 301;
	HELPIdmodifPavage   	= 302;
	HELPIdmodifSEPARER  	= 303;
	HELPIdmodifediter   	= 304;
	HELPIdmodifARRANGER 	= 305;
	HELPIdmodifALIGNER  	= 306;
	helpidmodifsymetrie	  = 307;

	HelpIdmodifassembler		= 308; {assembler plusieurs dessin fermer}
	HelpIdmodifdesassembler	= 309; {inverse que précedent}
	HELPIDmodifsinusoide		= 310; {pas fait}
	HelpId_HPGL_option		= HelpIdFile_Imp_PLT;
	helpidmodif_degrader_forme=312;
	helpidmodif_Joindre			 = 515;
	helpidmodif_Accoler		  	 = 314; {*}
	helpidmodif_Eclater_texte 	= 315; {*}
	helpidmodif_masquer_2_forme = 316; {*}
	helpidmodif_Separer_metafile= 317; {*}
	helpidmodif_Agrandir			 = 318; {*}
	helpidmodif_Deplacer			 = 319; {*}
  helpidmodif_VISIBLE  = 321;

{menu option}
	HELPIdoptionGrille    		= 401;
	HELPIdoptionTAILLEDOCU		= 402;
  HELPIdoptionPrefesimple   = 406;
	HELPIdoptionPreference		= 403;
	HelpIdoptionafipalcouleur	= 404;
	HelpIdoptionafiregle			= 405;
	HelpIdoption_bel_icone		= 409;
	HELPIDoptionPref_ligne		= HELPIdoptionPreference;
	HELPIDoptionPref_unite		= HELPIdoptionPreference;
	HELPIDoption_Af_Bitmap		= 412;
	HELPIDoption_Af_Rapide		= 413;
	HELPIDoption_info				= 414;
	HELPIDoption_contexte		= 417;
	HELPID_option_THEME			= 416;
	{les guides}
	HelpIdoption_prg_extern	= 406;
  Helpidoption_guide			= 407;
  HelpIdoption_panel      = 408;
  Helpidoption_satellite  = 410;
  HelpIdoption_panel_denomination = 411;
  HelpIdoption_panel_Cotation = 415;
  HelpIdoption_panel_layer = 418;
  HelpIdoption_panel_attributes = 419;
  HelpIdoption_panel_texture = 420;
  HelpIdoption_panel_actions = 421;
  HelpIdoption_panel_True_type = 422;
  HelpIdoption_panel_couleurs = 423;
  HelpIdoption_panel_typographie = 424;
  HelpIdoption_panel_gradians = 425;
  HelpIdoption_panel_color_denominated = 426;
  HelpIdoption_panel_annuler = 427;
  HelpIdoption_panel_degrader = 428;


{attributs}
	HELPIdATTRTEXTE    	= 500;
	HELPIdATTRDESSIN   	= 501;
	HELPIDATTRCOTATION	= 517;
	HELPIdATTRDEGRAD   	= 502;
	HELPIDATTROMBRE		  = 521;
	HELPIDATTRHACHURE		= 523;
	HELPIDATTRRELIEF		= 522;
	HELPIDATTRLUMIERE   = 525;
	HELPIdATTRCLAVIER  	= 503;
	HELPIdATTRPLANS    	= 504;
	HELPIdFUSIONPLANS  	= 505;
	HELPIdattrcouleur  	= 506;
	HelpIdAttr			 	  = 507;
	HelpIdAttr2			 	  = 515;
	HELPIdpalcouleur   	= 508;
  HELPIDATTRCONTOUR   = 509;
  HELPIDATTRGRADIAN   = 532;
  HELPIDATTROBJECT    = 526;
	HELPIDATTRTEXTURE   = 507;
  HELPIDATTRRAYON     = 505;
  HELPIDATTRProjection= 510;
  HELPIDATTRrules     = 511;
  HELPIDATTRVARIABLE  = 535;
  HELPIDATTRTABLEAU   = 536;
  HELPIDATTRMIRROR    = 537;

  HELPIDATTRPLANSPOPUP = 4001;
	HELPIDATTRCOTATSYMBOL= 4002;

	HelpIdlignestyle		= 509;
	HelpIdfillstyle		= 510; {pas fait}
	Helpidligneepaisseur = HELPIdoptionPreference;

	helpIdsupprsymetrie		    = HelpIdAttr2;
	HELPIDATTR_fermer			    = 512;
	HELPIDATTR_ouvrir			    = 513;
	HELPIDATTR_fontes_vincent = 514;
	HELPIDAttr_supprimer_deformation	= HelpIdAttr2;
	HELPIDAttr_bz_surface   = HelpIdAttr2; {pas fait}
	HELPIDAttr_editer_bitmap= 515;
	HELPIDATTRcomete 			  = 518;
	HELPIDATTRCOTA_ECHELLE	= 519;
	HELPIDATTRCOTA_Fonte	 	= HELPIDATTR_fontes_vincent;
	HELPIDATTR_popup			  = 533; {Pour le menu popup}
  HELPID_Recadrage        = 534; {Pour le recadrage}

  {élements supplémentaires}
	helpidCONTEXT_NEW			      = 524;
	HELPIdATTROBJET			        = 526;
	HELPID_POPUP_DIVISER_CERCLE = 527;
  HELPIdColor_Lumiere 				= 528;
	HELPIdSymbol                = 529;
	helpidEngrenage					    = 531;
	helpidstatus                = 538;

	HelpId_menu_zoom			= 520;


	HELPIdmenu_document		= 600;

	HELPIdAID    		 		= 700;
	HELPIDInfo_Bulle	 		= 701;
	HELPID_raccourcie  		= 702;

{deformation}
	HELPIDdefor_generique 		  		= 1400;
	Helpid_projection_circulaire 		= 1401;
	Helpid_projection_cylindrique		= 1402;
	Helpid_projection_cadran     		= 1403;
	Helpid_projection_disque     		= 1404;
	Helpid_projection_interpolation 	= 1405;
	Helpid_projection_spherique		= 1406;
  Helpid_projection_trou_noir		= 1407;

{menu paramètrage}
	HELPID_PARAM_CERCLE	 	= 1305;
	HELPID_PARAM_RECTANGLE	= 1304;
	HELPID_PARAM_RECT_AROND	= 1303;
	HELPID_PARAM_LIGNES		= 1302;
	HELPID_PARAM_POLYGONE	= 1301;
	HELPID_PARAM_ROTATION	= 1306;
	HELPID_PARAM_PROJECTION	= 1307;
	HELPID_PARAM_COMETE		= 1308;

{outils}
  HelpIdOutil			   = 800;
  HelpIdtext			   = 801;
  HelpIdzoom			   = 802;
  HelpIdfleche	  	 = 803;
  HelpIdovale			   = 804;
	HelpIdrectangle    = 805;
  HelpIdrectarond    = 806;
  HelpIdarc 			   = 807;
  HelpIdligne			   = 808;
  HelpIdspline			 = 809;
  HelpIdrotation     = 810;
  HelpIdSphere			 = 811;
  HelpIdcirculaire   = 812;
  HelpIdBezier		 	 = 813;
  HelpIditalique		 = 814;
  HelpIdComete			 = 815;
  HelpIdMulti			   = 816;
  HelpIdCiseau			 = 817;
  HelpId_Star			   = 818;
  HelpId_Bezier      = 820;
  HelpId_QSpline   	 = 819;
  HelpId_reglette	   = 821;

  HelpId_editor		  =  900;
  helpId_Maths      =  901;
  helpId_couleur		=  910;
  Helpid_origine		=  920;
  helpId_license		= 1000;
  helpId_why_register= 1010;
  helpId_Personnalisation=1020;
  helpId_nouveaute  = 1030;

{spécial dialog}

HELPId_DLG_Pavage	  		    = 1100;
Helpid_Dlg_bz_surface	      = 1101;
Helpid_Dlg_dictionnaire	    = 1102;
HelpidPlein_et_delier       = 1103;
Helpid_dialog_logometre	    = 1105;
HELPID_DLG_CYLINDRE     	  = 1112;
HELPId_Dlg_Trame				    = 1113;
HELPId_Dlg_Revolution		    = 1114;
HELPId_Dlg_Colimacon			  = 1115;
HELPId_Dlg_liste_guide      = 1148;
HELPId_extension            = 1125;
{-}
helpId_effet_ligne			    = 1500;
helpId_effet_spline			    = 1501;
helpId_poly_effect          = 1502; {hid zorglub pourrait être détaillé}
HELPIdEffect_chanfrein      = 1502;
helpId_effet_cercle         = 1503;

HELPID_Ajouter_un_nuage   	   = helpidCONTEXT_NEW;
HELPID_Ajouter_une_fleur       = helpidCONTEXT_NEW;
HELPID_Ajouter_un_atome        = helpidCONTEXT_NEW;
HELPID_Ajouter_un_parachute    = helpidCONTEXT_NEW;
HELPID_Ajouter_un_soleil       = helpidCONTEXT_NEW;
HELPID_Ajouter_une_corde       = helpidCONTEXT_NEW;
HELPID_Ajouter_des_axes  	 	   = helpidCONTEXT_NEW;
HELPID_Ajouter_perpendiculaire = helpidCONTEXT_NEW;
HELPID_Inverser_sens_d_un_segment = helpidCONTEXT_NEW;
HELPID_Afficher_millieu        = helpidCONTEXT_NEW; {hid a faire}

HELPID_Cercle_repartition 	= 1106; {hid a faire}
HELPID_dessin_spirale       = 1107; {hid a faire}
HELPID_cordelette           = 1108; {hid a faire}
HELPID_Cercle_en_cible      = 1109; {hid a faire}
HELPID_dessin_d_une_feuille = 1110; {hid a faire}
HELPID_dessin_des_tangentes = 1111; {hid a faire}
HELPId_Dlg_Tramage          = 1113;
HELPId_Dialog_tramage       = 1119;
HelpId_Show_3d              = 1220;
HELPId_Interpoline 			    = 1117;
HELPId_placement            = 1121;
HELPId_pousse_numerotation  = 1127;
HELPId_paint                = 1128;
HELPId_perpendiculaire          = 1129; {13129}
HELPId_parrallele               = 1130; {13130}
HELPId_Dual_screen              = 1131; {13131}
HELPId_Projection               = 1132; {13132}
HELPId_Quadrilatere             = 1133; {13133}
HELPId_Information              = 1134; {13134}
HELPId_Current_page_for_explain = 1135; {13135}
HELPId_affiche_dialogue_bitmap  = 1116; {13116}
HELPID_Determination            = 1162; {16162}
HELPId_affiche_dialogue_organigramme = 1136; {13136}
HELPId_affiche_dialogue_indic_angle = 1137; {13137}
HELPId_affiche_bouton_action_resolut = 1138; {13138}
HELPId_affiche_l_aide_de_la_fonction_detourer_html = 1139; {13139}
HELPId_affiche_bouton_action_boite_magique_creer_une_area_map = 1140; {13140}
HELPId_affiche_la_page_aide_relier_deux_lignes = 1141; {13141}
HELPId_proportion = 1142;  {13142}
HELPId_change_a_color_by_another = 1143; {13143}
HELPID_Cursor_SurVolle =  1144; {13144}
HELPID_Video_animer = 1145; {13145}
HELPId_Repartir = 1146; {13146}
HELPId_Style_des_plumes = 1147; {13147}
HELPId_Armoire_a_plan = 1149; {13149}
HELPId_console = 1150; {13150}
HELPId_Planche_contact = 1151; {13151}
HELPId_histogramme = 1152; {13152}
HELPId_matricielle = 1153; {13153}
HELPId_Tableau = 1154; {13154}
HELPId_regle_de_deplacement = 1155; {13155}
HELPId_page_des_raccourcis_clavier = 1156; {13156}
HELPId_decouper_en_plusieurs_tranches = 1157; {13157}
HELPID_effect_on_bitmap_ajouter_des_bordures = 1158; {13158}
HELPIDFILE_exp_Scalable_vector_graphics = 1159; {13159}
HELPIDFILE_exp_Data_eXchange_Format = 1160; {13160}
HELPIDATTRSCROLLING = 1161; {13161}
HELPIDFILE_exp_Portable_network_graphics = 1162;
HELPIDFILE_if_you_choose_a_nebuloide_to_with_his_help = 1164; {13164}
HELPId_dlg_Tramage_vectorielle = 1165; {13165}
HELPId_effectuer_une_rotation = 1166; {13166}
HELPId_page_des_pictogrammes = 1167; {13167}
HELPID_Cotion_placer = 1168; {13168}
HELPID_uses_rules_for_moving_selection = 1169; {13169}
HELPID_Afficher_la_documentation_de_lancre = 1170; {13170}
HELPID_Afficher_l_ecran_d_acceuil = 1171; {13171}
HELPID_Afficher_la_rose_des_deplacements = 1172; {13172}
HELPID_Afficher_epaisseur_de_l_une_a_l_autre = 1173; {13173}
HELPID_Afficher_afficher_l_appercus = 1174; {13174}
HELPID_Afficher_l_aide_contextuelle_du_ruban = 1175; {13175}
HELPID_Afficher_l_aide_du_slider_du_zoom = 1176; {13176}
HELPID_Afficher_l_aide_du_panneau_de_controle = 1177; {13177}
HELPID_Afficher_l_aide_des_pictogrammes_utile_et_necessaire = 1178; {13178}
HELPID_Afficher_l_aide_de_l_effet_blob = 1179; {13179}
HELPID_Afficher_l_aide_du_panneau_du_dictionnaire = 1180; {13180}
HELPID_AFFICHER_CAPTURE_D_ECRAN = 1181; {13181}
HELPID_Convertir_en_image_pixeliser = 1182; {13182}
HELPID_Create_des_points = 1183; {13183}
HELPID_help_couleur = 1184; {13184}
HELPID_help_tablleau_dynamique = 1185; {13185} {le 23.1.2015 écrit par denis Bertin}
HELPID_help_incorporer = 1186; {13186} {le 03.2.2015 écrit par denis Bertin}

{les identifiants d'aide d'information}
id_info_Grouper 					  = 800;
id_info_annuler 					  = 801;
id_info_refaire 					  = 802;
id_info_supprimer   				= 803;
id_info_tout_select 				= 804;
id_info_select_sur  				= 805;
id_info_select_avec         = 843;
id_info_inverse_select			= 844;
id_info_couper      				= 806;
id_info_copier						  = 807;
id_info_coller  					  = 808;
id_info_coller_special 			= 809;
id_info_dupliquer					  = 810;
id_info_copier_style 			  = 811;
id_info_coller_style 			  = 812;
id_info_editer						  = 813;
id_info_pavage						  = 814;
id_info_separer      			  = 815;
id_info_agrandir					  = 816;
id_info_assembler		 			  = 817;
id_info_desassembler				= 818;
id_info_sinusoide					  = 819;
id_info_degrader_forme 			= 820;
id_info_separer_metafile 		= 821;
id_info_eclater_texte	 		  = 822;
id_info_masquer_deux_formes = 823;
id_info_accoler_chemin 			= 824;
id_info_disque_haut       	= 825;
id_info_disque_infe       	= 826;
id_info_disque_rondoide   	= 827;
id_info_disque_reglable			= 828;
id_info_sphere						  = 829;
id_info_trou_noir					  = 830;
id_info_cylindrique_horizontal = 831;
id_info_cylindrique_vertical   = 832;
id_info_trapeze					    = 833;
id_info_interpolation_forme = 834;
id_info_circulaire_sup			= 835;
id_info_circulaire_inf			= 836;
id_info_cadran_sup				  = 837;
id_info_cadran_inf				  = 838;
id_info_cadran_entier			  = 839;
id_info_escalier            = 845;

{derniere info dans tmenuWindow.cmactiver_menu_griser }
id_info_ = 0;


{__________fin const _________ debut var_________}

var HelpfileName:pc255;

type

	T_Record_cursor = record
		{my cursor}
		no_moveCursor,
		zoomcursor,
		HelpCursor,
		HelpCursor2,
		DoigtCURSOR,
		bloc_text_cursor,
		Peinture_cursor,
		pinceau_cursor,
		Imprimante_cursor,
		Time_Clone_cursor,
		Time_redraw_cursor,
		Ciseaux_cursor,
		Rectarond_cursor,
		Move_fine_cursor,
    Move_fine_cursor_bicubic,
    Move_fine_cursor_spline,
    Move_fine_cursor_bezier,
    Move_fine_cursor_ligne,
		depla_fine_cursor,
    depla_clone_cursor,
		selection_cursor,
    cotation_cursor_hori,
		cotation_cursor_verti,
		cotation_cursor_depla_ligne,
		parralelle_cursor_depla_ligne,
    rotation_cursor_depla_ligne,
		perpendiculaire_cursor_depla_ligne,
		angle_guide_cursor,
		clic_suppr_cursor,
    rotation_cursor,
		Ole_cursor,
		{spline cursor}
		Spline_0,
		Spline_1,
		Spline_2,
		Spline_3,
		Spline_4,
		Spline_5,
		Spline_6,
		Spline_7,
		{windows cursor}
		arrow_cursor,
		ibeam_cursor,
		wait_cursor,
		cross_cursor,
		size_cursor,   {quatre flèche}
		sizeNS_cursor, {double fleche nord sud}
		sizeWE_cursor,  {double fleche est ouest}
		sizeNESW_cursor,
		sizeNWSE_cursor,
		UpArrow_cursor,
    horloge_00,
    horloge_01,
    horloge_02,
    horloge_03,
    horloge_04,
    horloge_05,
    horloge_06,
    horloge_07,
    horloge_08,
    horloge_09,
    horloge_10,
    horloge_11,
    horloge_12,
    CURSOR_MOVE_LITTLE_TEXT,
    CURSOR_Pipette,
    CURSOR_DROPDOWN,
    CURSOR_HAND,
    CURSOR_BLOCK,
    CURSOR_UP_LEFT_ZOOM,
    CURSOR_DOWN_RIGHT_ZOOM,
    CURSOR_HAND_MOVE,
    CURSOR_HAND_PLOT,
    CURSOR_HAND_DOWN,
    Internet:windows.HCursor;
    end; {Record_cursor}


  T_degrader_selon = record
	  white_and_black,  {Noir/Blanc}
	  cup_of_java,      {Ciel de java}
	  sky_venus,
	  filet_gris,
	  french_flag,
	  altern_fine,
	  zebra_africa, {ethiopic color}
	  soft_purple,
	  light_ray,
	  futur_ecologiste:hbitmap;
	  end; {T_degrader_selon}

  T_Bitmap_style_ligne = record
    PS_SOLID,
    PS_DASH,
    PS_DOT,
    PS_DASHDOT,
    PS_DASHDOTDOT:hbitmap;
    DS_SOLID,
    DS_DASH,
    DS_DOT,
    DS_DASHDOT,
    DS_DASHDOTDOT:hbitmap;
    MY_SOLID,
    MY_DASH,
    MY_DOT,
    MY_DASHDOT,
    MY_DASHDOTDOT:hbitmap;
    end; {T_Bitmap_style_ligne}

var G_Style_ligne:T_Bitmap_style_ligne;
var G_Cursor:T_Record_cursor;
var Mini_degra:T_degrader_selon;
var Colec_gradian_supplementaire:u_object.metalist=nil; {contient des tindex, pos la valeur du bitmap}

procedure Aide_context(aide_number:word);
procedure Init_cursor;
procedure Done_cursor;
procedure Show_horloge_curseur(pourcent:integer); overload;
procedure Show_horloge_curseur(pourcent:real); overload;
procedure Init_pour_mille;
procedure Show_horloge_curseur_pour_mille(pourmille:real);
procedure Init_bitmap_predefinis;
procedure Init_bitmap_style_ligne;
procedure Done_bitmap_predefinis;
procedure Lecture_section_ini_gradian;
procedure lecture_dun_gradian(i:integer; dans_une_forme:wformes1.Tforme_dessin);
procedure lecture_dun_gradian_enregistrer_fichier_gradian_grd(i:integer; dans_une_forme:wformes1.Tforme_dessin);
function get_forme_dessin_rectangle_128x18:WFormes1.Tforme_dessin;

implementation

uses WinProcs,kv_ini,k_erreur,font_ob1,relation,g_base,wmenuk,uregedit,imporato;

procedure aide_context(aide_number:word);
  const chaine_chm_vincent : pchar='denisdraw.chm';
	var pc_hh_in_win_dir,pc_exe_dir,pc_string_htm:pc1024;
      p:pchar;
	begin
  GetWindowsDirectory(pc_hh_in_win_dir,pred(sizeof(pc_hh_in_win_dir)));
  strcat(pc_hh_in_win_dir,'\hh.exe ');
  wutil.get_exe_path(pc_exe_dir); {ton mensonge sert à quoi}
  strcat(strcat(pc_hh_in_win_dir,pc_exe_dir),chaine_chm_vincent);
  if aide_number<>0 then
    begin
		loadstring(12000+aide_number,pc_string_htm,pred(sizeof(pc_string_htm)));    
		if strpos(pc_string_htm,wmenuk.point_htm)=nil then
			strcat(strcat(strcat(strcat(pc_hh_in_win_dir,kpc_colon),kpc_colon),pc_string_htm),wmenuk.point_htm)
		else
			strcat(strcat(strcat(pc_hh_in_win_dir,kpc_colon),kpc_colon),pc_string_htm);
    end;
  {$ifdef debug} box(0,pc_hh_in_win_dir); {$endif debug}
  winexec(pc_hh_in_win_dir,sw_show);
	end; {aide_context}

function Create_forme_dessin_rectangle_sized(largeur,hauteur:integer; bool_gradian,bool_gamette:boolean):u_object.Tforme_color;
	var aforme:WFormes1.Tforme_dessin;
	begin
	aforme:=WFormes1.Tforme_dessin.Create(0,0);
  {this instructions to make a rectangle, tous le monde devrait savoir le faire}
	aforme.elements.insert(font_ob1.lignenode.create(largeur,0));
	aforme.elements.insert(font_ob1.lignenode.create(largeur,hauteur));
	aforme.elements.insert(font_ob1.lignenode.create(0,hauteur));
	aforme.elements.insert(font_ob1.lignenode.create(0,0));
	if bool_gradian then
		begin
		aforme.elements.insert(font_ob1.polynode.create(0,0)); //the filling object
		aforme.epaisseur:=0;
		if bool_gamette then
			aforme.degrader.pas:=1
		else
			aforme.degrader.pas:=relation._10mm_to_log_pouce(10);
		aforme.degrader.degrader:=u_object.degra_parallele;
		aforme.degrader.angle:=90;
		end;
	aforme.rec_relief.activer:=false;
	aforme.rec_ombre.activer:=false;
	aforme.rec_lumiere.activer:=false;
  aforme.rec_gradian.activer:=false;
	aforme.calcul;
	create_forme_dessin_rectangle_sized:=aforme;
	end; {Create_forme_dessin_rectangle_sized}

function get_forme_dessin_rectangle_128x18:WFormes1.Tforme_dessin;
	const k_size_gamette_width = 128;
        k_size_gammette_height =18;
	begin
	get_forme_dessin_rectangle_128x18:=WFormes1.Tforme_dessin(Create_forme_dessin_rectangle_sized(
		k_size_gamette_width,k_size_gammette_height,True,True)); {true for gradian, a gamette}
	end;

procedure Init_bitmap_style_ligne;
  begin
  with G_Style_ligne do
    begin
    PS_SOLID:=LoadBitmap(hinstance,'BM_SOLID');
    PS_DASH:=LoadBitmap(hinstance,'BM_DASH');
    PS_DOT:=LoadBitmap(hinstance,'BM_DOT');
    PS_DASHDOT:=LoadBitmap(hinstance,'BM_DASH_DOT');
    PS_DASHDOTDOT:=LoadBitmap(hinstance,'BM_DASH_DOT_DOT');
    {I hate chocolate...}
    DS_SOLID:=LoadBitmap(hinstance,'BN_SOLID');
    DS_DASH:=LoadBitmap(hinstance,'BN_DASH');
    DS_DOT:=LoadBitmap(hinstance,'BN_DOT');
    DS_DASHDOT:=LoadBitmap(hinstance,'BN_DASH_DOT');
    DS_DASHDOTDOT:=LoadBitmap(hinstance,'BN_DASH_DOT_DOT');
    {I love energy}
    MY_SOLID:=LoadBitmap(hinstance,'BP_SOLID');
    MY_DASH:=LoadBitmap(hinstance,'BP_DASH');
    MY_DOT:=LoadBitmap(hinstance,'BP_DOT');
    MY_DASHDOT:=LoadBitmap(hinstance,'BP_DASH_DOT');
    MY_DASHDOTDOT:=LoadBitmap(hinstance,'BP_DASH_DOT_DOT');
    end;
  end; {Init_bitmap_style_ligne}

procedure Done_bitmap_style_ligne;
  begin
  with G_Style_ligne do
    begin
    DeleteObject(PS_SOLID);
    DeleteObject(PS_DASH);
    DeleteObject(PS_DOT);
    DeleteObject(PS_DASHDOT);
    DeleteObject(PS_DASHDOTDOT);
    //Now i know you read me, dont say so more i imagine!
    DeleteObject(DS_SOLID);
    DeleteObject(DS_DASH);
    DeleteObject(DS_DOT);
    DeleteObject(DS_DASHDOT);
    DeleteObject(DS_DASHDOTDOT);
    //free this item at this time whey are not useful because my application is closed.
    DeleteObject(MY_SOLID);
    DeleteObject(MY_DASH);
    DeleteObject(MY_DOT);
    DeleteObject(MY_DASHDOT);
    DeleteObject(MY_DASHDOTDOT);
    end;
  end; {Done_bitmap_style_ligne}

{this part of code written in martinics,
  re-inserted to be compiled with delphi the seven, by db}
procedure init_bitmap_predefinis;
  var adc,memdc:hdc;
      old_bitmap:hbitmap;
		  aforme:wformes1.Tforme_dessin;
      un_grand_plan:trect;
      i:integer;
  begin
  un_grand_plan:=g_base.grand_plan;
  with Mini_degra do
		begin
		adc:=getdc(0);
		memdc:=Createcompatibledc(adc);

		aforme:=get_forme_dessin_rectangle_128x18;

		{white_and_black:=LoadBitmap(HInstance,pchar('B1'));}
		white_and_black:=CreateCompatiblebitmap(adc,128,18);
		old_bitmap:=Selectobject(memdc,white_and_black);
		aforme.set_degrader_noir_et_blanc;
		aforme.paint(memdc,un_grand_plan);
		Selectobject(memdc,old_bitmap);

		{cup_of_java:=LoadBitmap(HInstance,pchar('B2'));}
		cup_of_java:=CreateCompatiblebitmap(adc,128,18);
		old_bitmap:=Selectobject(memdc,cup_of_java);
		aforme.set_degrader_cup_of_java;
		aforme.paint(memdc,un_grand_plan);
		Selectobject(memdc,old_bitmap);

		{sky_venus:=LoadBitmap(HInstance,pchar('B3'));}
		sky_venus:=CreateCompatiblebitmap(adc,128,18);
		old_bitmap:=Selectobject(memdc,sky_venus);
		aforme.set_degrader_sky_of_venus;
		aforme.paint(memdc,un_grand_plan);
		Selectobject(memdc,old_bitmap);

		{filet_gris:=LoadBitmap(HInstance,pchar('B4'));}
		filet_gris:=CreateCompatiblebitmap(adc,128,18);
		old_bitmap:=Selectobject(memdc,filet_gris);
		aforme.set_degrader_filet_gris;
		aforme.paint(memdc,un_grand_plan);
		Selectobject(memdc,old_bitmap);

		french_flag:=CreateCompatiblebitmap(adc,128,18);
		old_bitmap:=Selectobject(memdc,french_flag);
		aforme.set_degrader_french_flag;
		aforme.paint(memdc,un_grand_plan);
		Selectobject(memdc,old_bitmap);

		altern_fine:=CreateCompatiblebitmap(adc,128,18);
		old_bitmap:=Selectobject(memdc,altern_fine);
		aforme.set_degrader_altern_fine;
		aforme.paint(memdc,un_grand_plan);
		Selectobject(memdc,old_bitmap);

		zebra_africa:=CreateCompatiblebitmap(adc,128,18);
		old_bitmap:=Selectobject(memdc,zebra_africa);
		aforme.set_degrader_zebra_africa;
		aforme.paint(memdc,un_grand_plan);
		Selectobject(memdc,old_bitmap);

		soft_purple:=CreateCompatiblebitmap(adc,128,18);
		old_bitmap:=Selectobject(memdc,soft_purple);
		aforme.set_degra_soft_purple;
		aforme.paint(memdc,un_grand_plan);
		Selectobject(memdc,old_bitmap);

		light_ray:=CreateCompatiblebitmap(adc,128,18);
		old_bitmap:=Selectobject(memdc,light_ray);
		aforme.set_degra_light_ray;
		aforme.paint(memdc,un_grand_plan);
		Selectobject(memdc,old_bitmap);

		futur_ecologiste:=CreateCompatiblebitmap(adc,128,18);
		old_bitmap:=Selectobject(memdc,futur_ecologiste);
		aforme.set_degra_futur_ecologiste;
		aforme.paint(memdc,un_grand_plan);
		Selectobject(memdc,old_bitmap);

  	aforme.Free;
		Deletedc(memdc);
		Releasedc(0,adc);
		end;
  lecture_section_ini_gradian;
  end; {init_bitmap_predefinis}

procedure lecture_dun_gradian_enregistrer_fichier_gradian_grd(i:integer; dans_une_forme:wformes1.Tforme_dessin);
  var path_exe:pc1024;
      count_gradian_found_in_file:integer;
      F: TextFile; {Should be read here and nevers else where c'db}
      nb_gradian,position,une_couleur:integer;
      un_indice_en_couleur:u_object.T_index_color;
  begin
  count_gradian_found_in_file:=1;
  get_exe_path(path_exe);
  Strcat(path_exe,k_gradian_grd);
  if file_existe(path_exe) then
    begin
    dans_une_forme.set_degrader_noir_et_blanc;
    dans_une_forme.col_degra.Freeall;
    AssignFile(F,path_exe);
    Reset(F);
    While not(eof(F)) do
      begin
      Readln(F,imporato.Ligne_in);
      if imporato.line_contain('Nombre de gradians') then
        begin
        nb_gradian:=imporato.extract_integer;
        end
      else if line_contain('Position') then
        begin
        position:=imporato.extract_integer;
        end
      else if line_contain('Color') then
        begin
        une_couleur:=imporato.extract_integer;
        end
      else if line_contain('---') then
        begin
        inc(count_gradian_found_in_file);
        end
      else if line_contain('Transparent') then
        begin
        un_indice_en_couleur:=u_object.T_index_color.Create(position,une_couleur);
        un_indice_en_couleur.transparent:=imporato.extract_integer;
        if i=count_gradian_found_in_file then
          begin
          dans_une_forme.col_degra.add(un_indice_en_couleur);
          end;
        end;
      end;
    CloseFile(F);
    end;
  end; {lecture_dun_gradian_enregistrer_fichier_gradian_grd}


procedure lecture_dun_gradian(i:integer; dans_une_forme:wformes1.Tforme_dessin);
  var j:integer;
      pc_index_j:pc100;
      pc_indice_couleur:pc100;
      une_couleur:tcolorref;
      position:integer;
      pc_position:pc100;
      pcrubriqui:pc100;
      pci:pc100;
      pc_GradianNumber:pc100;
      pc_indice_transparent:pc100;
      un_indice_en_couleur:u_object.T_index_color;
  begin
  inttopchar(i,pci);
  strcat(strcopy(pcrubriqui,wmenuk.kpc_gradian_rubrique),pci);
  strcat(strcopy(pc_GradianNumber,wmenuk.kpc_gradian_rubrique),kpc_number_of_gradian);
  dans_une_forme.set_degrader_noir_et_blanc;
  dans_une_forme.col_degra.Freeall;
  {Le nombre d'éléments intermédiaire}
  for j:=0 to pred(uregedit.RegGetPrivateProfileInt(pcrubriqui,pc_GradianNumber,0)) do
    begin {récupérer la position et la couleur}
    inttopchar(j,pc_index_j);
    {la couleur}
    strcat(strcat(strcopy(pc_indice_couleur,wmenuk.kpc_gradian_rubrique),'_'),pc_index_j);
    une_couleur:=uregedit.RegGetPrivateProfileInt(pcrubriqui,pc_indice_couleur,0);
    {la position}
    strcat(strcat(strcopy(pc_position,wmenuk.kpc_gradian_rubrique),'_pos_'),pc_index_j);
    position:=uregedit.RegGetPrivateProfileInt(pcrubriqui,pc_position,0);
    {création de l'éléments intermédiare}
    un_indice_en_couleur:=u_object.T_index_color.Create(position,une_couleur);
    strcat(strcat(strcopy(pc_indice_transparent,wmenuk.kpc_gradian_rubrique),'_trans_'),pc_index_j);
    un_indice_en_couleur.transparent:=uregedit.RegGetPrivateProfileInt(pcrubriqui,pc_indice_transparent,255);
    dans_une_forme.col_degra.add(un_indice_en_couleur);
    end; {récupérer la position et la couleur}
  end; {lecture_dun_gradian}

procedure lecture_section_ini_gradian;
  var i,j:integer;
      un_bitmap_supplementaire,old_bitmap:hbitmap;
      un_grand_plan:trect;
      adc,memdc:hdc; {a display and a memory contexte}
      aforme:wformes1.Tforme_dessin; {ce paint dans cette forme}
      pc_GradianNumber:pc100;
      nombre_de_gradians:integer;

  procedure lecture_du_fichier_des_gradians;
  var path_exe:pc1024;
      F: TextFile; {Imporato un module écrit par Denis Bertin stéphane}
      nb_gradian,position:integer;
      une_couleur:tcolorref;
      un_indice_en_couleur:u_object.T_index_color;
      compteur_des_gradian_du_fichier:integer;
  begin
  j:=0; nb_gradian:=1;
  compteur_des_gradian_du_fichier:=0;
  get_exe_path(path_exe);
  Strcat(path_exe,k_gradian_grd);
  if file_existe(path_exe) then
    begin
    aforme.set_degrader_noir_et_blanc;
    aforme.col_degra.Freeall;
    AssignFile(F,path_exe);
    Reset(F);
    While not(eof(F)) do
      begin
      Readln(F,imporato.Ligne_in);
      if imporato.line_contain('Nombre de gradians') then
        begin
        nb_gradian:=imporato.extract_integer;
        end
      else if line_contain('Position') then
        begin
        position:=imporato.extract_integer;
        end
      else if line_contain('Color') then
        begin
        une_couleur:=imporato.extract_integer;
        end
      else if line_contain('Transparent') then
        begin
        un_indice_en_couleur:=u_object.T_index_color.Create(position,une_couleur);
        un_indice_en_couleur.transparent:=imporato.extract_integer;
        aforme.col_degra.add(un_indice_en_couleur);
        end
      else if line_contain('---') then
        begin
        un_bitmap_supplementaire:=CreateCompatiblebitmap(adc,128,18);
		    old_bitmap:=Selectobject(memdc,un_bitmap_supplementaire);
        {Afin de fournir un fichier de gradians supplémentaires}
        aforme.paint(memdc,un_grand_plan);
		    Selectobject(memdc,old_bitmap);
        colec_gradian_supplementaire.add(tindex.Create(un_bitmap_supplementaire));
        inc(compteur_des_gradian_du_fichier);
        aforme.col_degra.Freeall;
        end;
      end;
    CloseFile(F);
    end;
  uregedit.RegWritePrivateProfileInt(
    wmenuk.kpc_gradian_rubrique,
    wmenuk.kpc_gradian_store,
    compteur_des_gradian_du_fichier);
  end; {lecture_du_fichier_des_gradians}

  begin
  if colec_gradian_supplementaire<>nil then
    colec_gradian_supplementaire.free;
  {réinitialmisation d'un'e*une collection à vide}
  colec_gradian_supplementaire:=u_object.metalist.create; {contient des tindex}
  adc:=getdc(0);
  memdc:=Createcompatibledc(adc);
	aforme:=get_forme_dessin_rectangle_128x18;
  un_grand_plan:=g_base.grand_plan;
  nombre_de_gradians:=uregedit.RegGetPrivateProfileInt(wmenuk.kpc_gradian_rubrique,
    wmenuk.kpc_number_of_gradian,0);
  //Pour fournir des fichier gradians suppémentaire
  if true then
    begin
    lecture_du_fichier_des_gradians;
    end;
  if true then
    begin
    for i:=1 to nombre_de_gradians do
      begin {Créer autant de bitmap que de dégradé dans la boucle i}
      un_bitmap_supplementaire:=CreateCompatiblebitmap(adc,128,18);
		  old_bitmap:=Selectobject(memdc,un_bitmap_supplementaire);
	    {Remplir cette forme avec les couleurs lues dans l'ini}
      lecture_dun_gradian(i,aforme);
		  aforme.paint(memdc,un_grand_plan);
		  Selectobject(memdc,old_bitmap);
      colec_gradian_supplementaire.add(tindex.Create(un_bitmap_supplementaire));
      end;  {Créer autant de bitmap que de dégrader dans la boucle i}
    end;
  aforme.free;
  DeleteDC(memdc);
  releasedc(0,adc);
  end; {lecture_section_ini_gradian}

procedure Done_bitmap_predefinis;
  begin
  with Mini_degra do
    begin
    DeleteObject(white_and_black); {Noir/Blanc}
	  DeleteObject(cup_of_java); {Ciel de java}
	  DeleteObject(sky_venus);
	  DeleteObject(filet_gris);
	  DeleteObject(french_flag);
	  DeleteObject(altern_fine);
	  DeleteObject(zebra_africa); {ethiopic color}
	  DeleteObject(soft_purple);
	  DeleteObject(light_ray);
	  DeleteObject(futur_ecologiste);
	  end; {T_degrader_selon}
  colec_gradian_supplementaire.free;
  end; {Done_bitmap_predefinis}

procedure Init_cursor;
	begin
	{load cursor even predefinite}
	with haide.G_Cursor do
		begin
		HelpCursor  		  := LoadCursor(HInstance,'HELP_CURSOR');  
		HelpCursor2 		  := LoadCursor(HInstance,'HELP2_CURSOR');
		zoomcursor  		  := LoadCursor(HInstance,'ZOOM_CURSOR');
		no_moveCursor 		:= LoadCursor(HInstance,'NO_MOVE_CURSOR');
		doigtCURSOR			  := LoadCursor(HInstance,'DOIGT_CURSOR'); {ok}
		bloc_text_cursor	:= LoadCursor(HInstance,'BLOC_TEXT_CURSOR');
		peinture_cursor	     := LoadCursor(HInstance,'PEINTURE');
		pinceau_cursor		   := LoadCursor(HInstance,'PINCEAU');
		Imprimante_cursor	   := LoadCursor(HInstance,'IMPRIMANTE');
		Time_Clone_cursor	   := LoadCursor(HInstance,'CURSOR_time_clone');
		Time_redraw_cursor   := LoadCursor(HInstance,'CURSOR_TIME_redraw');
		Ciseaux_cursor		   := LoadCursor(HInstance,'CURSOR_CISEAUX');
		Rectarond_cursor	   := LoadCursor(HInstance,'CURSOR_RECAROND');
		Move_fine_cursor          := LoadCursor(HInstance,'CURSOR_MOVEFINE');
    Move_fine_cursor_bicubic  := LoadCursor(HInstance,'CURSOR_MOVEFINEBICUBIC');
    Move_fine_cursor_spline   := LoadCursor(HInstance,'CURSOR_MOVEFINESPLINE');
    Move_fine_cursor_bezier   := LoadCursor(HInstance,'CURSOR_MOVEFINEBEZIER');
    Move_fine_cursor_ligne    := LoadCursor(HInstance,'CURSOR_MOVEFINELIGNE');
    depla_clone_cursor        := LoadCursor(HInstance,'CURSOR_MOVECLONE');
		depla_fine_cursor         := LoadCursor(HInstance,'CURSOR_MOVESMALL');
		selection_cursor          := LoadCursor(HInstance,'CURSOR_SELECTION');
    cotation_cursor_hori          := LoadCursor(HInstance,'CURSOR_COTA_HORI');
    cotation_cursor_verti         := LoadCursor(HInstance,'CURSOR_COTA_VERTI');
    cotation_cursor_depla_ligne   := LoadCursor(HInstance,'CURSOR_DEPLA_LIGNE');
		parralelle_cursor_depla_ligne := LoadCursor(HInstance,'CURSOR_PARRA_LIGNE');
		rotation_cursor_depla_ligne   := LoadCursor(HInstance,'CURSOR_ROTA_LIGNE');
		perpendiculaire_cursor_depla_ligne:= LoadCursor(HInstance,'CURSOR_PERPEN_LIGNE');
    angle_guide_cursor:= LoadCursor(HInstance,'CURSOR_ANGLE');
    rotation_cursor:= LoadCursor(HInstance,'CURSOR_ROTATION');

    cotation_cursor_depla_ligne       := LoadCursor(HInstance,'CURSOR_DEPLACEMENT_LIGNE');
		parralelle_cursor_depla_ligne     := LoadCursor(HInstance,'CURSOR_PARRALELLE_LIGNE');
    rotation_cursor_depla_ligne       := LoadCursor(HInstance,'CURSOR_ROTATION_LIGNE');
		perpendiculaire_cursor_depla_ligne:= LoadCursor(HInstance,'CURSOR_PERPENDICULAIRE_LIGNE');

		ole_cursor			:=	LoadCursor(HInstance,'CURSOR_CISEAUX');
		{attention à DestroyCursor dans step12.TMDIFileWindow2.done}
		Spline_0				:=	LoadCursor(HInstance,pchar(0+9900));
		Spline_1				:=	LoadCursor(HInstance,pchar(1+9900));
		Spline_2				:=	LoadCursor(HInstance,pchar(2+9900));
		Spline_3				:=	LoadCursor(HInstance,pchar(3+9900));
		Spline_4				:=	LoadCursor(HInstance,pchar(4+9900));
		Spline_5				:=	LoadCursor(HInstance,pchar(5+9900));
		Spline_6				:=	LoadCursor(HInstance,pchar(6+9900));
		Spline_7				:=	LoadCursor(HInstance,pchar(7+9900));

		{window cursor, pas de destroy}
		arrow_cursor	:= loadcursor(0,idc_arrow);
		ibeam_cursor	:= loadcursor(0,idc_ibeam);
		wait_cursor 	:= loadcursor(0,idc_wait);
		cross_cursor 	:= loadcursor(0,idc_cross);
		size_cursor 	:= loadcursor(0,IDC_SIZEALL);
		sizeNS_cursor 	:= loadcursor(0,idc_sizeNS);
		sizeWE_cursor 	:= loadcursor(0,idc_sizeWE);
		sizeNESW_cursor:= loadcursor(0,idc_sizeNESW);
		sizeNWSE_cursor:= loadcursor(0,idc_sizeNWSE);
		UpArrow_cursor	:= loadcursor(0,IDC_UPARROW);

    horloge_00:=loadcursor(HInstance,'CU_HORL_00');
    horloge_01:=loadcursor(HInstance,'CU_HORL_01');
    horloge_02:=loadcursor(HInstance,'CU_HORL_02');
    horloge_03:=loadcursor(HInstance,'CU_HORL_03');
    horloge_04:=loadcursor(HInstance,'CU_HORL_04');
    horloge_05:=loadcursor(HInstance,'CU_HORL_05');
    horloge_06:=loadcursor(HInstance,'CU_HORL_06');
    horloge_07:=loadcursor(HInstance,'CU_HORL_07');
    horloge_08:=loadcursor(HInstance,'CU_HORL_08');
    horloge_09:=loadcursor(HInstance,'CU_HORL_09');
    horloge_10:=loadcursor(HInstance,'CU_HORL_10');
    horloge_11:=loadcursor(HInstance,'CU_HORL_11');
    horloge_12:=loadcursor(HInstance,'CU_HORL_12');
    Internet:=loadcursor(HInstance,'101');
    CURSOR_MOVE_LITTLE_TEXT:=loadcursor(HInstance,'CURSOR_MOVE_LITTLE_TEXT');
    CURSOR_Pipette:=loadcursor(HInstance,'CURSEUR_PIPETTE');
    CURSOR_DROPDOWN:=loadcursor(HInstance,'DROPDOWN');
    CURSOR_HAND:=loadcursor(HInstance,'CURSOR_HAND');
    CURSOR_BLOCK:=loadcursor(HInstance,'CURSOR_BLOC');
    CURSOR_UP_LEFT_ZOOM:=loadcursor(HInstance,'CURSOR_UP_LEFT_ZOOM');
    CURSOR_DOWN_RIGHT_ZOOM:=loadcursor(HInstance,'CURSOR_DOWN_RIGHT_ZOOM');
    CURSOR_HAND_MOVE:=loadcursor(HInstance,'CURSOR_HAND_MOVE');
    CURSOR_HAND_PLOT:=loadcursor(HInstance,'CURSOR_HAND_PLOT');
    CURSOR_HAND_DOWN:=loadcursor(HInstance,'CURSOR_HAND_DOWN');
		end; {haide.G_Cursor^}
  Haide.Init_bitmap_predefinis;
  Haide.Init_bitmap_style_ligne;
	end; {Init_cursor}

procedure Done_cursor;
	begin
	with haide.G_Cursor do
		begin
		DestroyCursor(HelpCursor);
		DestroyCursor(HelpCursor2);
		DestroyCursor(zoomCursor);
		DestroyCursor(no_moveCursor);
		DestroyCursor(DoigtCURSOR);
		DestroyCursor(bloc_text_cursor);
		DestroyCursor(peinture_cursor);
		DestroyCursor(pinceau_cursor);
		DestroyCursor(Imprimante_cursor);
		DestroyCursor(Time_Clone_cursor);
		DestroyCursor(Time_redraw_cursor);
		DestroyCursor(Ciseaux_cursor);
		DestroyCursor(Rectarond_cursor);
		DestroyCursor(Move_fine_cursor);
    DestroyCursor(Move_fine_cursor_bicubic);
    DestroyCursor(Move_fine_cursor_spline);
    DestroyCursor(Move_fine_cursor_bezier);
    DestroyCursor(Move_fine_cursor_ligne);
		DestroyCursor(Depla_fine_cursor);
    DestroyCursor(Angle_guide_cursor);
    DestroyCursor(Rotation_cursor);
    DestroyCursor(Depla_clone_cursor);
		DestroyCursor(Selection_cursor);
		DestroyCursor(Ole_cursor);
		DestroyCursor(Spline_0);
		DestroyCursor(Spline_1);
		DestroyCursor(Spline_2);
		DestroyCursor(Spline_3);
		DestroyCursor(Spline_4);
		DestroyCursor(Spline_5);
		DestroyCursor(Spline_6);
		DestroyCursor(Spline_7);
    DestroyCursor(horloge_00);
    DestroyCursor(horloge_00);
    DestroyCursor(horloge_01);
    DestroyCursor(horloge_02);
    DestroyCursor(horloge_03);
    DestroyCursor(horloge_04);
    DestroyCursor(horloge_05);
    DestroyCursor(horloge_06);
    DestroyCursor(horloge_07);
    DestroyCursor(horloge_08);
    DestroyCursor(horloge_09);
    DestroyCursor(horloge_10);
    DestroyCursor(horloge_11);
    DestroyCursor(horloge_12);
    DestroyCursor(CURSOR_MOVE_LITTLE_TEXT);
    DestroyCursor(CURSOR_Pipette);
    DestroyCursor(CURSOR_DROPDOWN);
    DestroyCursor(CURSOR_HAND);
    DestroyCursor(CURSOR_BLOCK);
    DestroyCursor(CURSOR_UP_LEFT_ZOOM);
    DestroyCursor(CURSOR_DOWN_RIGHT_ZOOM);
    DestroyCursor(CURSOR_HAND_MOVE);
    DestroyCursor(CURSOR_HAND_PLOT);
    DestroyCursor(CURSOR_HAND_DOWN);
    DestroyCursor(Internet);
		end; {haide.G_Cursor^}
  Haide.Done_bitmap_predefinis;
  Haide.Done_bitmap_style_ligne;
	end; {Done_cursor}

procedure Show_horloge_curseur(pourcent:real);
  var poucentage:integer;
  begin
  poucentage:=round(pourcent);
  Show_horloge_curseur(poucentage);
  end;

var old_pour_mille:integer;

procedure init_pour_mille;
  begin
  old_pour_mille:=-1;
  end;

procedure show_horloge_curseur_pour_mille(pourmille:real);
  var time,pourcent:integer;
  begin
  time:=round((12*pourmille)/10);
  time:=time div 100;
  pourcent:=round(pourmille/10);
  time:=12*pourcent;
  time:=time div 100;
  if time<>old_pour_mille then
    begin
    show_horloge_curseur(pourcent);
    old_pour_mille:=time;
    end;
  end;

procedure show_horloge_curseur(pourcent:integer);
  var time:integer;
  begin
  time:=12*pourcent;
  time:=time div 100;
  case time of
    0:setcursor(haide.G_Cursor.horloge_00);
    1:setcursor(haide.G_Cursor.horloge_01);
    2:setcursor(haide.G_Cursor.horloge_02);
    3:setcursor(haide.G_Cursor.horloge_03);
    4:setcursor(haide.G_Cursor.horloge_04);
    5:setcursor(haide.G_Cursor.horloge_05);
    6:setcursor(haide.G_Cursor.horloge_06);
    7:setcursor(haide.G_Cursor.horloge_07);
    8:setcursor(haide.G_Cursor.horloge_08);
    9:setcursor(haide.G_Cursor.horloge_09);
    10:setcursor(haide.G_Cursor.horloge_10);
    11:setcursor(haide.G_Cursor.horloge_11);
    12:setcursor(haide.G_Cursor.horloge_12);
    end; {case}
  end; {show_horloge_curseur}

end.