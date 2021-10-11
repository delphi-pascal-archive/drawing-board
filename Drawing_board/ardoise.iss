; -- Ardoise.iss --
; Tout droit de reproduction autoris�s auteur denis bertin.

[Setup]
AppName=Ardoise
AppVersion=2.1
DefaultDirName={pf}\Ardoise
DefaultGroupName=Ardoise
UninstallDisplayIcon={app}\Ardoise.exe
Compression=lzma2
SolidCompression=yes
OutputDir=c:\installation
LicenseFile=c:\_\ardoise\license.txt
WizardImageFile=c:\_\ardoise\image.bmp
AppPublisherURL=http://www.denisdraw.fr
AppPublisher=BeeLog
AppCopyright=BeeLog
AppContact=Denis Bertin st�phane
VersionInfoCompany=BeeLog
VersionInfoVersion=2
TouchDate=2015-09-17

[LangOptions]
LanguageName=French

[Languages]
Name: fr; MessagesFile: "compiler:Languages\French.isl"

[Files]
Source: "Ardoise.exe"; DestDir: "{app}";
Source: "annuler.bmp"; DestDir: "{app}";
Source: "goute.bmp"; DestDir: "{app}"; 
Source: "denis.bmp"; DestDir: "{app}";
Source: "Ligne_de_titre.bmp"; DestDir: "{app}"; 
Source: "libmng.dll"; DestDir: "{app}"; 
Source: "ansicoul.txt"; DestDir: "{app}"; 

Source: "Pictogramme\Fabriqu�s\Argile durcie.bmp"; DestDir: "{app}\Pictogramme\Fabriqu�s\";
Source: "Pictogramme\Fabriqu�s\Bloc d'or.bmp"; DestDir: "{app}\Pictogramme\Fabriqu�s\";
Source: "Pictogramme\Fabriqu�s\Bloc d'�meraude.bmp"; DestDir: "{app}\Pictogramme\Fabriqu�s\";
Source: "Pictogramme\Fabriqu�s\Bloc de diamant.bmp"; DestDir: "{app}\Pictogramme\Fabriqu�s\";
Source: "Pictogramme\Fabriqu�s\Bloc de fer.bmp"; DestDir: "{app}\Pictogramme\Fabriqu�s\";
Source: "Pictogramme\Fabriqu�s\Bloc de lapis-lazuli.bmp"; DestDir: "{app}\Pictogramme\Fabriqu�s\";
Source: "Pictogramme\Fabriqu�s\Bloc de neige.bmp"; DestDir: "{app}\Pictogramme\Fabriqu�s\";
Source: "Pictogramme\Fabriqu�s\Bloc de paille.bmp"; DestDir: "{app}\Pictogramme\Fabriqu�s\";
Source: "Pictogramme\Fabriqu�s\Block de brique d'argile.bmp"; DestDir: "{app}\Pictogramme\Fabriqu�s\";
Source: "Pictogramme\Fabriqu�s\Citrouille-lanterne.bmp"; DestDir: "{app}\Pictogramme\Fabriqu�s\";
Source: "Pictogramme\Fabriqu�s\Crane.bmp"; DestDir: "{app}\Pictogramme\Fabriqu�s\";
Source: "Pictogramme\Fabriqu�s\Laine.bmp"; DestDir: "{app}\Pictogramme\Fabriqu�s\";
Source: "Pictogramme\Fabriqu�s\Muret de pierre.bmp"; DestDir: "{app}\Pictogramme\Fabriqu�s\";
Source: "Pictogramme\Fabriqu�s\Muret.bmp"; DestDir: "{app}\Pictogramme\Fabriqu�s\";
Source: "Pictogramme\Fabriqu�s\Verre teint�.bmp"; DestDir: "{app}\Pictogramme\Fabriqu�s\";
Source: "Pictogramme\Fabriqu�s\Verre.bmp"; DestDir: "{app}\Pictogramme\Fabriqu�s\";
Source: "Pictogramme\M�canique\Bloc Musical.bmp"; DestDir: "{app}\Pictogramme\M�canique\";
Source: "Pictogramme\M�canique\Bloc.bmp"; DestDir: "{app}\Pictogramme\M�canique\";
Source: "Pictogramme\M�canique\Capteur de lumi�re.bmp"; DestDir: "{app}\Pictogramme\M�canique\";
Source: "Pictogramme\M�canique\Coffre pi�g�.bmp"; DestDir: "{app}\Pictogramme\M�canique\";
Source: "Pictogramme\M�canique\Collant.bmp"; DestDir: "{app}\Pictogramme\M�canique\";
Source: "Pictogramme\M�canique\Crochet.bmp"; DestDir: "{app}\Pictogramme\M�canique\";
Source: "Pictogramme\M�canique\Distributeur.bmp"; DestDir: "{app}\Pictogramme\M�canique\";
Source: "Pictogramme\M�canique\Lampe de redstone.bmp"; DestDir: "{app}\Pictogramme\M�canique\";
Source: "Pictogramme\M�canique\Piston.bmp"; DestDir: "{app}\Pictogramme\M�canique\";
Source: "Pictogramme\M�canique\Plaque de d�tection.bmp"; DestDir: "{app}\Pictogramme\M�canique\";
Source: "Pictogramme\M�canique\Pond�r�es.bmp"; DestDir: "{app}\Pictogramme\M�canique\";
Source: "Pictogramme\M�canique\Portes.bmp"; DestDir: "{app}\Pictogramme\M�canique\";
Source: "Pictogramme\M�canique\Portillon.bmp"; DestDir: "{app}\Pictogramme\M�canique\";
Source: "Pictogramme\M�canique\Rails de d�tection.bmp"; DestDir: "{app}\Pictogramme\M�canique\";
Source: "Pictogramme\M�canique\Rails de propulsion.bmp"; DestDir: "{app}\Pictogramme\M�canique\";
Source: "Pictogramme\M�canique\Rails d�clencheurs.bmp"; DestDir: "{app}\Pictogramme\M�canique\";
Source: "Pictogramme\M�canique\Rails.bmp"; DestDir: "{app}\Pictogramme\M�canique\";
Source: "Pictogramme\M�canique\Redstone.bmp"; DestDir: "{app}\Pictogramme\M�canique\";
Source: "Pictogramme\M�canique\R�p�teur.bmp"; DestDir: "{app}\Pictogramme\M�canique\";
Source: "Pictogramme\M�canique\Trappe.bmp"; DestDir: "{app}\Pictogramme\M�canique\";
Source: "Pictogramme\Minerais\Minerai d'or.bmp"; DestDir: "{app}\Pictogramme\Minerais\";
Source: "Pictogramme\Minerais\Minerai d'�meraude.bmp"; DestDir: "{app}\Pictogramme\Minerais\";
Source: "Pictogramme\Minerais\Minerai de charbon.bmp"; DestDir: "{app}\Pictogramme\Minerais\";
Source: "Pictogramme\Minerais\Minerai de diamant.bmp"; DestDir: "{app}\Pictogramme\Minerais\";
Source: "Pictogramme\Minerais\Minerai de redstone.bmp"; DestDir: "{app}\Pictogramme\Minerais\";
Source: "Pictogramme\Naturels\Adminum.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\barreau de fer.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\barri�re.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\biblioth�que.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\block d'argile.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\cage.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\dalles.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\echelle.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\escaliers.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\glace compact�e.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\glace.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\gravier.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\gr�s.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\neige.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\Obsidienne.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\Pierre craquel�e.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\pierre moussue.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\pierre scult�e.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\pierre taill�e moussue.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\pierre taill�e.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\Pierre.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\planches.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\podzol.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\roche.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\sable rouge.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\sable.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\terre anti-herbe.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\terre labour�e.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\terre.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\toile d'araign�e.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\vitre.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Plantes\Arbuste mort.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Bl�.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Bois.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Cabosse.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Cactus.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Canne � sucre.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Champignons g�ants.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Champignons.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Citrouille.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Feuillage.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Fleurs.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Foug�re.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Grande foug�re.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Herbe.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Herbes hautes.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Lierre.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Myc�lium.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\N�nuphar.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Past�que.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Pousse d'arbes.bmp"; DestDir: "{app}\Pictogramme\Plantes\";


[Icons]
Name: "{group}\Ardoise"; Filename: "{app}\Ardoise.exe"

[Run]
Filename: "{app}\Ardoise.exe";
