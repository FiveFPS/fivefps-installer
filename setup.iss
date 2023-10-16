; Predefinições e constantes
#define AppName "FiveFPS"
#define AppPublisher "FIVEFPS LTDA"
#define AppPublisherURL "https://fivefps.com"
#define AppVersion "2.2.5" ; Versão atualizada para 2.2.4
#define DefaultDirName "C:\FiveFPS" ; Diretório padrão alterado para C:\FiveFPS
#define IconPath DefaultDirName + "\fivefps.exe"

[Setup]
AppId={{00F2835C-E60F-4B05-93CD-930B6AA37288}}
AppName={#AppName}
AppVersion={#AppVersion}
AppVerName={#AppName} {#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppPublisherURL}
VersionInfoVersion={#AppVersion}
DefaultDirName={#DefaultDirName}
DisableDirPage=yes
DisableProgramGroupPage=yes
OutputDir=build
OutputBaseFilename=FiveFPS Setup
SetupIconFile=icon32.ico
UninstallDisplayIcon={#IconPath}
Compression=lzma
SolidCompression=yes
PrivilegesRequired=admin
LanguageDetectionMethod=uilanguage

[Languages]
Name: "brazilian_portuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"
Name: "portuguese"; MessagesFile: "compiler:Languages\Portuguese.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "italian"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"

[Registry]
Root: HKCU; Subkey: "Software\{#AppName}"; ValueType: string; ValueName: "InstallationLanguage"; ValueData: "{language}"; Flags: uninsdeletevalue

[Messages]
SetupWindowTitle=FiveFPS Setup

[CustomMessages]
english.dotnetcoremsg=Installing .NET Core Runtime...
english.dotnetframeworkmsg=Installing .NET Framework...

brazilian_portuguese.dotnetcoremsg=Instalando .NET Core Runtime...
brazilian_portuguese.dotnetframeworkmsg=Instalando .NET Framework...

portuguese.dotnetcoremsg=Instalando .NET Core Runtime...
portuguese.dotnetframeworkmsg=Instalando .NET Framework...

spanish.dotnetcoremsg=Instalando .NET Core Runtime...
spanish.dotnetframeworkmsg=Instalando .NET Framework...

russian.dotnetcoremsg=Установка .NET Core Runtime...
russian.dotnetframeworkmsg=Установка .NET Framework...

german.dotnetcoremsg=Installiere .NET Core Runtime...
german.dotnetframeworkmsg=Installiere .NET Framework...

french.dotnetcoremsg=Installation de .NET Core Runtime...
french.dotnetframeworkmsg=Installation du .NET Framework...

italian.dotnetcoremsg=Installando .NET Core Runtime...
italian.dotnetframeworkmsg=Installando .NET Framework...

japanese.dotnetcoremsg=.NET Core 3.1.5をインストール中...
japanese.dotnetframeworkmsg=.NET Frameworkをインストール中...

; Adicione tarefas se precisar de mais personalização durante a instalação
[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: checkedonce

[Files]
; Copie os arquivos necessários
Source: "bin\*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs
Source: "packages\dotnet-runtime-6.0.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall
Source: "packages\dotnet-framework.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall

[Run]
Filename: "{tmp}\dotnet-runtime-6.0.exe"; Parameters: "/q /norestart"; StatusMsg: "{cm:dotnetcoremsg}"; Flags: waituntilterminated
Filename: "{tmp}\dotnet-framework.exe"; Parameters: "/q /norestart"; StatusMsg: "{cm:dotnetframeworkmsg}"; Flags: waituntilterminated

[Icons]
; Criar ícones no desktop e no menu Iniciar
Name: "{commondesktop}\\{#AppName}"; Filename: "{app}\\fivefps.exe";
Name: "{group}\\{#AppName}"; Filename: "{app}\\fivefps.exe";

[Code]
const
  AppNameConst = '{#AppName}';  // Declare uma constante para o nome do aplicativo

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    // Grava o nome da linguagem selecionada no registro
    RegWriteStringValue(HKCU, 'Software\' + AppNameConst, 'InstallationLanguage', ActiveLanguage);
  end;
end;