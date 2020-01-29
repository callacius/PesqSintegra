unit Win.WebBrowser;

interface

uses
  System.Win.Registry;

type
{$SCOPEDENUMS ON}
  TInternetExplorerVersion = (IE11,IE10,IE9,IE8,IE7);
{$SCOPEDENUMS OFF}

  TInternetExplorerVersionHelper = record helper for TInternetExplorerVersion
  public
    function Value: Integer;
  end;

  TWinWebBrowserEmulation = class
  strict private
    function OpenWebBrowserEmulationRegistry(out ARegistry: TRegistry): Boolean;
  strict protected
    function GetFeatureBrowserEmulationRegistryKey: string; virtual;
    function GetExeName: string; virtual;
  public
    procedure EnableBrowserEmulation(const Version: TInternetExplorerVersion);
    procedure RestoreBrowserEmulation;
  end;

implementation

uses
  Winapi.Windows,
  System.SysUtils;

function TWinWebBrowserEmulation.GetExeName: string;
begin
  Result := ExtractFileName(ParamStr(0));
end;

function TWinWebBrowserEmulation.GetFeatureBrowserEmulationRegistryKey: string;
begin
  Result := 'Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION';
end;

function TWinWebBrowserEmulation.OpenWebBrowserEmulationRegistry(out ARegistry: TRegistry): Boolean;
begin
  Result := False;
  ARegistry := TRegistry.Create;
  try
    ARegistry.RootKey := HKEY_CURRENT_USER;
    Result := ARegistry.OpenKey(GetFeatureBrowserEmulationRegistryKey, True);
  finally
    if not Result then
      ARegistry.Free;
  end;
end;

procedure TWinWebBrowserEmulation.RestoreBrowserEmulation;
var
  Registry: TRegistry;
begin
  if not OpenWebBrowserEmulationRegistry(Registry) then
    Exit;

  try
    if Registry.ValueExists(GetExeName) then
      Registry.DeleteKey(GetExeName);
    Registry.CloseKey
  finally
    Registry.Free;
  end;
end;

procedure TWinWebBrowserEmulation.EnableBrowserEmulation(const Version: TInternetExplorerVersion);
var
  Registry: TRegistry;
begin
  if not OpenWebBrowserEmulationRegistry(Registry) then
    Exit;

  try
    if not Registry.ValueExists(GetExeName) then
      Registry.WriteInteger(GetExeName, Version.Value);
    Registry.CloseKey
  finally
    Registry.Free;
  end;
end;

function TInternetExplorerVersionHelper.Value: Integer;
begin
  // Values from http://msdn.microsoft.com/en-us/library/ee330730(VS.85).aspx#browser_emulation
  case Self of
    TInternetExplorerVersion.IE11: Result := 11000;
    TInternetExplorerVersion.IE10: Result := 10000;
    TInternetExplorerVersion.IE9: Result := 9000;
    TInternetExplorerVersion.IE8: Result := 8000;
    TInternetExplorerVersion.IE7: Result := 7000;
  else
    raise Exception.Create('TInternetExplorerVersionHelper.Value: Unknown value');
  end;
end;

end.
