; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "O2O桌球联盟客户端"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "TeYou, Inc."
#define MyAppURL "http://o2o.teshehui.com/"
#define MyAppExeName "TeYou.Billards.PC.exe"
;SQL Server Campact Edition4.0是否安装标志
#define IncludeSQLCE true
;FrameWork4.0是否安装标志
#define IncludeFramework true  
#define IsExternal ""
#define MyDataBasePath "C:\ProgramData\TeYou\database"
#define VersionValue 100
#define MyRegSubkey "SOFTWARE\TeYou\O2OClub\"
#define MyAppWndName "特奢汇桌球联盟客户端"#define RuntimeDir "E:\4_AboutWork\BillardO2O\SetupProjects\O2OClub_20160805\RunTime"
#define SourceFilesDir "E:\4_AboutWork\BillardO2O\SetupProjects\O2OClub_20160805\O2OClubSourseFiles"
[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{21A2F12D-4E0D-4302-A0D6-507D3AF66BA4}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputDir=E:\4_AboutWork\BillardO2O\SetupProjects\O2OClub_20160805\SetupProject
OutputBaseFilename=O2OClub
SetupIconFile=E:\4_AboutWork\BillardO2O\SetupProjects\O2OClub_20160805\Sample Pictures\logo.ico
Compression=lzma
SolidCompression=yes
DirExistsWarning=no

[Languages]
Name: "chinese"; MessagesFile: "compiler:Languages\Chinese.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; 
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: "{#SourceFilesDir}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

#if IncludeFramework
Source: "{#RuntimeDir}\Microsoft.NET.exe"; DestDir: "{tmp}"; Flags: ignoreversion {#IsExternal}; Check: NeedsFramework
#endif

;Copy SSCERuntime_x86-CHS.exe For 32bit OS
#if IncludeSQLCE
Source: "{#RuntimeDir}\SSCERuntime_x86-CHS.exe";DestDir: "{tmp}"; Flags:ignoreversion {#IsExternal}; Check: NeedsSQLCE and not IsWin64
#endif

;Copy SSCERuntime_x64-CHS.exe For 64bit OS
#if IncludeSQLCE
Source: "{#RuntimeDir}\SSCERuntime_x64-CHS.exe";DestDir: "{tmp}"; Flags:ignoreversion {#IsExternal}; Check: NeedsSQLCE and IsWin64
#endif


[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Registry]
Root: "HKCU"; Subkey: "SOFTWARE\TeYou\O2OClub"; ValueType: string; ValueName: "DatabasePath"; ValueData: "{#MyDataBasePath}"; Flags: uninsdeletekeyifempty createvalueifdoesntexist
Root: "HKCU"; Subkey: "SOFTWARE\TeYou\O2OClub"; ValueType: dword ; ValueName: "Version"; ValueData: "{#VersionValue}"; Flags: uninsdeletevalue createvalueifdoesntexist
[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

;Install Microsoft.NET.exe 
#if IncludeFramework
;Filename: {tmp}\Microsoft.NET.exe; Parameters: "/q:a /c:""install /l /q"""; WorkingDir: {tmp}; Flags: skipifdoesntexist runhidden; StatusMsg: "正在安装 .NET Framework 4.5，请稍候..."
;Filename: {tmp}\Microsoft.NET.exe; Parameters: "/Q /NORESTART /lcid 1033"; WorkingDir: {tmp}; Flags: skipifdoesntexist runhidden; StatusMsg: "正在安装 .NET Framework 4.5，请稍候..."
Filename: {tmp}\Microsoft.NET.exe; Parameters: "/i /passive"; WorkingDir: {tmp}; Flags: skipifdoesntexist runhidden; StatusMsg: "正在安装 .NET Framework 4.5，请稍候..."
#endif

;Install SSCERuntime_x86-CHS.exe
#if IncludeSQLCE
;Filename: {tmp}\SSCERuntime_x86-CHS.exe; WorkingDir: {tmp}; Flags: skipifdoesntexist runhidden; StatusMsg: "正在安装软件运行所需插件 SQL CE 4.0，请稍候..."; Check: not IsWin64
Filename: {tmp}\SSCERuntime_x86-CHS.exe; Parameters: "/i /q"; WorkingDir: {tmp}; Flags: skipifdoesntexist runhidden; StatusMsg: "正在安装软件运行所需插件 SQL CE 4.0，请稍候..."; Check: not IsWin64
#endif

;Install SSCERuntime_x64-CHS.exe
#if IncludeSQLCE
Filename: {tmp}\SSCERuntime_x64-CHS.exe; Parameters: "/i /q"; WorkingDir: {tmp}; Flags: skipifdoesntexist runhidden; StatusMsg: "正在安装软件运行所需插件 SQL CE 4.0，请稍候..."; Check: IsWin64
#endif

[Messages]
chinese.CloseApplications=&自动关闭该程序
chinese.DontCloseApplications=&不关闭该程序
chinese.ApplicationsFound2=安装程序将要更新的某些文件被以下程序所占用，是否允许安装程序自动关闭以下运行中的程序，安装完成之后将会再次启动该程序。

[UninstallDelete]
Type: filesandordirs; Name: "{app}"

[code]
// Indicates whether .NET Framework 4.0 is installed.
function IsDotNET40Detected(): boolean;
var
    success: boolean;
    install: cardinal;
begin
    success := RegQueryDWordValue(HKLM, 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full', 'Install', install);
    Result :=  success and (install = 1);
end;


//Indicates whether SQL Server Compact Edition 4.0 is installed.
function IsSQLCEDetected(): boolean;
var 
    success : boolean;
begin
    success := RegKeyExists(HKLM, 'SOFTWARE\Microsoft\Microsoft SQL Server Compact Edition\v4.0\CHS');
    Result := success;
    //Result := false;
end;

//RETURNS OPPOSITE OF IsDotNet20Detected FUNCTION
//Remember this method from the Files section above
function NeedsFramework(): Boolean;
begin
  Result := (IsDotNET40Detected = false);
end;

//Remember this method from the Files section above
function NeedsSQLCE(): Boolean;
begin
  Result := (IsSQLCEDetected=false);
end;

//Indicates Whether The Database Is Exist
function IsDatabaseExsit():Boolean;
begin
  if RegValueExists(HKEY_CURRENT_USER, '{#MyRegSubkey}','DatabasePath') then
  begin
    Result:=true;
  end
  else
    Result:=true;
end;

//Get The Exit Code
function GetCustomSetupExitCode(): Integer;
begin
  if (IsDotNET40Detected = false) then
    begin
      MsgBox('.NET Framework 4.5 未能正确安装!',mbError, MB_OK);
      result := -1
    end
  if(IsSQLCEDetected = false) then
    begin
        MsgBox('Microsoft SQL Server Compact Edition 4.0 未能正确安装!',mbError, MB_OK);
        result := -1
    end
end;

//Indicates Whether The Machine Has Installed The Latest Version Of The Application
function IsNotLatestVersion():Boolean;
Var
  Version : dword;
begin
      if(RegQueryDWordValue(HKEY_CURRENT_USER, '{#MyRegSubkey}',
         'Version', Version)) then
             begin
                if(Version>={#VersionValue}) then
                  begin
                    if(MsgBox('您电脑上已经安装了本应用程序的新版本，您是否仍要覆盖安装？', mbConfirmation, MB_YESNO or MB_DEFBUTTON2) = idNo) then
                        begin
                           Result :=false;
                        end
                        else
                            begin
                               RegDeleteValue(HKEY_CURRENT_USER,'{#MyRegSubkey}','Version'); 
                               Result :=true;
                            end 
                  end
                else
                  begin
                    RegDeleteValue(HKEY_CURRENT_USER,'{#MyRegSubkey}','Version'); 
                    Result :=true;
                  end     
             end
     else
        begin
          RegDeleteValue(HKEY_CURRENT_USER,'{#MyRegSubkey}','Version'); 
          Result :=true;
        end 
end;

//Initial Install Function
function InitializeSetup(): Boolean;
begin
    Result:= IsNotLatestVersion;
end;


function InitializeUninstall(): Boolean;
var appWnd: HWND; 
var IsRunning:Integer; 
begin  
    Result :=true;
    appWnd:= FindWindowByWindowName('{#MyAppWndName}');  
    IsRunning:=FindWindowByWindowName('{#MyAppWndName}');  
     if( IsRunning<>0 ) then  
       begin  
       if Msgbox('卸载程序检测到客户端正在运行。' #13#13 '单击“是”,卸载向导将自动关闭它,并继续卸载，单击“否”,则终止此次卸载！', mbConfirmation, MB_YESNO or MB_DEFBUTTON2) = idYES then  
         begin
           PostMessage(appWnd, 18, 0, 0);  
           Result :=true;  
           IsRunning :=0;  
         end 
       else 
         begin  
           Result :=false;   
         end;  
     end;  
end;
  

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
  ErrorCode: Integer;
begin
  case CurUninstallStep of
    usUninstall:
        begin
        //MsgBox('卸载程序:' #13#13 '正在卸载...', mbInformation, MB_OK)
        // ...insert code to perform pre-uninstall tasks here...
        end;
    usPostUninstall:
      begin
        //MsgBox('卸载程序:' #13#13 '卸载完成.', mbInformation, MB_OK);
        // ...insert code to perform post-uninstall tasks here...
        //ShellExec('open', 'http://www.asiafinance.cn', '', '', SW_SHOW, ewNoWait, ErrorCode)
      end;
  end;
end;
