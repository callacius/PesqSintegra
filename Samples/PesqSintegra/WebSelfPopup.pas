unit WebSelfPopup;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.WinInet,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.OleCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  MSHTML,
  SHDocVw,
  IdBaseComponent,
  IdComponent,
  IdTCPConnection,
  IdTCPClient,
  IdHTTP;

const
  WM_REDIRECT = WM_USER+100;

type
  TWebSelfPopup = class(TWinControl)
  private
    FBrowser   : TWebBrowser;
    FPopup     : TWebBrowser;
    FURL       : OleVariant;
    FFlags     : OleVariant;
    FTarget    : OleVariant;
    FPostData  : OleVariant;
    FHeaders   : OleVariant;
  protected
    procedure OnRedirect(var Message: TMessage);message WM_REDIRECT;
    procedure OnBeforeNavigate2(Sender: TObject;
    const pDisp: IDispatch; const URL, Flags, TargetFrameName, PostData,
    Headers: OleVariant; var Cancel: WordBool);
    procedure OnNewWindow2(Sender: TObject; var ppDisp: IDispatch; var Cancel: WordBool);
  public
    constructor CreateHook(WebBrowser: TWebBrowser);
    destructor Destroy;override;
  end;

implementation

{ TWebSelfPopup }

constructor TWebSelfPopup.CreateHook(WebBrowser: TWebBrowser);
begin
  // Perform Inherited
  inherited CreateParented(WebBrowser.Handle);

  // Setando Padrões
  FBrowser                 := WebBrowser;
  FBrowser.OnNewWindow2    := OnNewWindow2;
  FPopup                   := TWebBrowser.Create(FBrowser);
  FPopup.OnBeforeNavigate2 := OnBeforeNavigate2;
end;

destructor TWebSelfPopup.Destroy;
begin
  // Clear The web browser interfaces
  FBrowser  := nil;
  FreeAndNil(FPopup);
  // Perform inherited
  inherited Destroy;

end;

procedure TWebSelfPopup.OnBeforeNavigate2(Sender: TObject;
  const pDisp: IDispatch; const URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
begin
  // Captura os Valores
  FURL      := URL;
  FFlags    := Flags;
  FTarget   := null;
  FPostData := PostData;
  FHeaders  := Headers;
  // Cancel
  Cancel    := True;
  // Exibe uma mensagem
  PostMessage(Handle, WM_REDIRECT,0,0);
end;

procedure TWebSelfPopup.OnNewWindow2(Sender: TObject; var ppDisp: IDispatch;
  var Cancel: WordBool);
begin
  // Direcionar para uma nova Janela
  ppDisp    := FPopup.ControlInterface;
end;

procedure TWebSelfPopup.OnRedirect(var Message: TMessage);
begin
  FBrowser.Navigate2(FURL,FFlags,FTarget,FPostData,FHeaders);
end;

end.
