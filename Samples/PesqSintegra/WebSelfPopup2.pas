unit WebSelfPopup2;

interface

// Uncomment for Delphi6 and up
// {$DEFINE DELPHI6_UP}
//

{$IFDEF DELPHI6_UP}
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, OleCtrls, SHDocVw, EmbeddedWB;
{$ELSE}
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, OleCtrls, SHDocVw, EmbeddedWB;
{$ENDIF}

////////////////////////////////////////////////////////////////////////////////
//   Popup handler for web browser control. Will redirect the popup back into
//   the original browser.
////////////////////////////////////////////////////////////////////////////////
const
  WM_REDIRECT       =  WM_USER + 100;

type
  TWebSelfPopup     =  class(TWinControl)
  private
     // Private declarations
     FBrowser:      TEmbeddedWB;
     FPopup:        TWebBrowser;
     FURL:          OleVariant;
     FFlags:        OleVariant;
     FTarget:       OleVariant;
     FPostData:     OleVariant;
     FHeaders:      OleVariant;
  protected
     // Protected declarations
     procedure      OnRedirect(var Message: TMessage); message WM_REDIRECT;
     procedure      OnBeforeNavigate2(Sender: TObject; const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData, Headers: OleVariant; var Cancel: WordBool);
     procedure      OnNewWindow2(Sender: TObject; var ppDisp: IDispatch; var Cancel: WordBool);
  public
     // Public declarations
     constructor    CreateHook(WebBrowser: TEmbeddedWB);
     destructor     Destroy; override;
  end;

const
  WM_NAVIGATE       =  WM_USER + 101;

type
  TForm1            =  class(TForm)
     EmbeddedWB1:   TEmbeddedWB;
     procedure      FormCreate(Sender: TObject);
     procedure      FormClose(Sender: TObject; var Action: TCloseAction);
  private
     // Private declarations
     FWebSelfPopup: TWebSelfPopup;
  protected
     // Protected declarations
     procedure      WMNavigate(var Msg: TMessage); message WM_NAVIGATE;
  public
     // Public declarations
  end;

var
  Form1:            TForm1;

implementation
{$R *.DFM}

procedure TWebSelfPopup.OnRedirect(var Message: TMessage);
begin

  // Perform the navigation
  FBrowser.Navigate2(FURL, FFlags, FTarget, FPostData, FHeaders);

end;

procedure TWebSelfPopup.OnBeforeNavigate2(Sender: TObject; const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData, Headers: OleVariant; var Cancel: WordBool);
begin

  // Capture the values
  FURL:=URL;
  FFlags:=FLags;
  FTarget:=NULL;
  FPostData:=PostData;
  FHeaders:=Headers;

  // Cancel
  Cancel:=True;

  // Post a message to ourselves
  PostMessage(Handle, WM_REDIRECT, 0, 0);

end;

procedure TWebSelfPopup.OnNewWindow2(Sender: TObject; var ppDisp: IDispatch; var Cancel: WordBool);
begin

  // Direct the new window to our proxy
  ppDisp:=FPopup.ControlInterface;

end;

constructor TWebSelfPopup.CreateHook(WebBrowser: TEmbeddedWB);
begin

  // Perform inherited
  inherited CreateParented(WebBrowser.Handle);

  // Set defaults
  FBrowser:=WebBrowser;
  FBrowser.OnNewWindow2:=OnNewWindow2;
  FPopup:=TWebBrowser.Create(FBrowser);
  FPopup.OnBeforeNavigate2:=OnBeforeNavigate2;

end;

destructor TWebSelfPopup.Destroy;
begin

  // Clear the web browser interfaces
  FBrowser:=nil;
  FreeAndNil(FPopup);

  // Perform inherited
  inherited Destroy;

end;
