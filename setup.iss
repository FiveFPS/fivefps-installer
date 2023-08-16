#define AppName "FiveFPS"
#define AppPublisher "FIVEFPS LTDA"
#define AppPublisherURL="https://fivefps.com"
#define AppVersion "2.1.9"
#define DefaultDirName "{pf}\FiveFPS"

[Setup]
AppId={{00F2835C-E60F-4B05-93CD-930B6AA37288}}
AppName={#AppName}
AppVersion={#AppVersion}
AppVerName={#AppName}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppPublisherURL}
VersionInfoVersion={#AppVersion}
DefaultDirName={#DefaultDirName}
DisableDirPage=yes
DisableProgramGroupPage=yes
OutputDir=build
OutputBaseFilename=FiveFPS
SetupIconFile=icon32.ico
UninstallDisplayIcon={app}/fivefps.exe,1
Compression=lzma
SolidCompression=no
PrivilegesRequired=admin

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Messages]
SetupWindowTitle=FiveFPS Setup

;[Tasks]
;Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked

[Files]
Source: "bin\*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs
Source: "packages\dotnet-core-3.1.5.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall
Source: "packages\dotnet-framework.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall

[Run]
Filename: "{tmp}\dotnet-core-3.1.5.exe"; Parameters: "/q /norestart"; StatusMsg: "Instalando .NET Core 3.1.5..."; Flags: waituntilterminated
Filename: "{tmp}\dotnet-framework.exe"; Parameters: "/q /norestart"; StatusMsg: "Instalando .NET Framework..."; Flags: waituntilterminated

[Icons]
Name: "{commondesktop}\\{#AppName}"; Filename: "{app}\\fivefps.exe";
Name: "{group}\\{#AppName}"; Filename: "{app}\\fivefps.exe";

[Code]
procedure InitializeWizard();
begin
  // Voc� pode adicionar c�digo aqui se precisar de alguma inicializa��o ou verifica��o
end;