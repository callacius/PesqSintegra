unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Web.HTTPApp, Web.HTTPProd,
  Web.DSProd, Vcl.ExtCtrls, Vcl.OleCtrls, SHDocVw, RzCmboBx;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    cbEscolha: TRzComboBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  ConsSintegra;

procedure TForm1.Button1Click(Sender: TObject);
var
  Pessoa :TPessoa;
  ConsSintegra:TConsultaSintegra;
begin
  Pessoa := TPessoa.Create;
  ConsSintegra := TConsultaSintegra.Create(cbEscolha.Value);
  ConsSintegra.Pessoa.CNPJ := Edit1.Text;
  ConsSintegra.Pessoa.UF   := cbEscolha.Value;
  Pessoa := ConsSintegra.ConsultaSintegra;

end;

end.
