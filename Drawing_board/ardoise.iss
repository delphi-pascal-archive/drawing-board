; -- Ardoise.iss --
; Tout droit de reproduction autorisés auteur denis bertin.

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
AppContact=Denis Bertin stéphane
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

Source: "Pictogramme\Fabriqués\Argile durcie.bmp"; DestDir: "{app}\Pictogramme\Fabriqués\";
Source: "Pictogramme\Fabriqués\Bloc d'or.bmp"; DestDir: "{app}\Pictogramme\Fabriqués\";
Source: "Pictogramme\Fabriqués\Bloc d'émeraude.bmp"; DestDir: "{app}\Pictogramme\Fabriqués\";
Source: "Pictogramme\Fabriqués\Bloc de diamant.bmp"; DestDir: "{app}\Pictogramme\Fabriqués\";
Source: "Pictogramme\Fabriqués\Bloc de fer.bmp"; DestDir: "{app}\Pictogramme\Fabriqués\";
Source: "Pictogramme\Fabriqués\Bloc de lapis-lazuli.bmp"; DestDir: "{app}\Pictogramme\Fabriqués\";
Source: "Pictogramme\Fabriqués\Bloc de neige.bmp"; DestDir: "{app}\Pictogramme\Fabriqués\";
Source: "Pictogramme\Fabriqués\Bloc de paille.bmp"; DestDir: "{app}\Pictogramme\Fabriqués\";
Source: "Pictogramme\Fabriqués\Block de brique d'argile.bmp"; DestDir: "{app}\Pictogramme\Fabriqués\";
Source: "Pictogramme\Fabriqués\Citrouille-lanterne.bmp"; DestDir: "{app}\Pictogramme\Fabriqués\";
Source: "Pictogramme\Fabriqués\Crane.bmp"; DestDir: "{app}\Pictogramme\Fabriqués\";
Source: "Pictogramme\Fabriqués\Laine.bmp"; DestDir: "{app}\Pictogramme\Fabriqués\";
Source: "Pictogramme\Fabriqués\Muret de pierre.bmp"; DestDir: "{app}\Pictogramme\Fabriqués\";
Source: "Pictogramme\Fabriqués\Muret.bmp"; DestDir: "{app}\Pictogramme\Fabriqués\";
Source: "Pictogramme\Fabriqués\Verre teinté.bmp"; DestDir: "{app}\Pictogramme\Fabriqués\";
Source: "Pictogramme\Fabriqués\Verre.bmp"; DestDir: "{app}\Pictogramme\Fabriqués\";
Source: "Pictogramme\Mécanique\Bloc Musical.bmp"; DestDir: "{app}\Pictogramme\Mécanique\";
Source: "Pictogramme\Mécanique\Bloc.bmp"; DestDir: "{app}\Pictogramme\Mécanique\";
Source: "Pictogramme\Mécanique\Capteur de lumière.bmp"; DestDir: "{app}\Pictogramme\Mécanique\";
Source: "Pictogramme\Mécanique\Coffre piégé.bmp"; DestDir: "{app}\Pictogramme\Mécanique\";
Source: "Pictogramme\Mécanique\Collant.bmp"; DestDir: "{app}\Pictogramme\Mécanique\";
Source: "Pictogramme\Mécanique\Crochet.bmp"; DestDir: "{app}\Pictogramme\Mécanique\";
Source: "Pictogramme\Mécanique\Distributeur.bmp"; DestDir: "{app}\Pictogramme\Mécanique\";
Source: "Pictogramme\Mécanique\Lampe de redstone.bmp"; DestDir: "{app}\Pictogramme\Mécanique\";
Source: "Pictogramme\Mécanique\Piston.bmp"; DestDir: "{app}\Pictogramme\Mécanique\";
Source: "Pictogramme\Mécanique\Plaque de détection.bmp"; DestDir: "{app}\Pictogramme\Mécanique\";
Source: "Pictogramme\Mécanique\Pondérées.bmp"; DestDir: "{app}\Pictogramme\Mécanique\";
Source: "Pictogramme\Mécanique\Portes.bmp"; DestDir: "{app}\Pictogramme\Mécanique\";
Source: "Pictogramme\Mécanique\Portillon.bmp"; DestDir: "{app}\Pictogramme\Mécanique\";
Source: "Pictogramme\Mécanique\Rails de détection.bmp"; DestDir: "{app}\Pictogramme\Mécanique\";
Source: "Pictogramme\Mécanique\Rails de propulsion.bmp"; DestDir: "{app}\Pictogramme\Mécanique\";
Source: "Pictogramme\Mécanique\Rails déclencheurs.bmp"; DestDir: "{app}\Pictogramme\Mécanique\";
Source: "Pictogramme\Mécanique\Rails.bmp"; DestDir: "{app}\Pictogramme\Mécanique\";
Source: "Pictogramme\Mécanique\Redstone.bmp"; DestDir: "{app}\Pictogramme\Mécanique\";
Source: "Pictogramme\Mécanique\Répéteur.bmp"; DestDir: "{app}\Pictogramme\Mécanique\";
Source: "Pictogramme\Mécanique\Trappe.bmp"; DestDir: "{app}\Pictogramme\Mécanique\";
Source: "Pictogramme\Minerais\Minerai d'or.bmp"; DestDir: "{app}\Pictogramme\Minerais\";
Source: "Pictogramme\Minerais\Minerai d'émeraude.bmp"; DestDir: "{app}\Pictogramme\Minerais\";
Source: "Pictogramme\Minerais\Minerai de charbon.bmp"; DestDir: "{app}\Pictogramme\Minerais\";
Source: "Pictogramme\Minerais\Minerai de diamant.bmp"; DestDir: "{app}\Pictogramme\Minerais\";
Source: "Pictogramme\Minerais\Minerai de redstone.bmp"; DestDir: "{app}\Pictogramme\Minerais\";
Source: "Pictogramme\Naturels\Adminum.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\barreau de fer.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\barrière.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\bibliothèque.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\block d'argile.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\cage.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\dalles.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\echelle.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\escaliers.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\glace compactée.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\glace.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\gravier.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\grès.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\neige.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\Obsidienne.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\Pierre craquelée.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\pierre moussue.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\pierre scultée.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\pierre taillée moussue.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\pierre taillée.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\Pierre.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\planches.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\podzol.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\roche.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\sable rouge.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\sable.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\terre anti-herbe.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\terre labourée.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\terre.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\toile d'araignée.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Naturels\vitre.bmp"; DestDir: "{app}\Pictogramme\Naturels\";
Source: "Pictogramme\Plantes\Arbuste mort.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Blé.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Bois.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Cabosse.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Cactus.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Canne à sucre.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Champignons géants.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Champignons.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Citrouille.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Feuillage.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Fleurs.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Fougère.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Grande fougère.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Herbe.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Herbes hautes.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Lierre.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Mycélium.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Nénuphar.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Pastèque.bmp"; DestDir: "{app}\Pictogramme\Plantes\";
Source: "Pictogramme\Plantes\Pousse d'arbes.bmp"; DestDir: "{app}\Pictogramme\Plantes\";


[Icons]
Name: "{group}\Ardoise"; Filename: "{app}\Ardoise.exe"

[Run]
Filename: "{app}\Ardoise.exe";
