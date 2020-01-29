unit ConsSintegra;

interface

uses
  System.Classes, Dialogs, System.SysUtils, System.StrUtils, System.Variants,
  WinApi.Windows, Vcl.Forms, Vcl.Controls, Vcl.ExtCtrls, Vcl.StdCtrls,System.UITypes,
  Vcl.ComCtrls, Vcl.DBGrids, Vcl.CheckLst, FireDAC.Phys.FB, Data.DB, WebSelfPopup, mshtml,
  Data.FmtBcd, Datasnap.DBClient, Datasnap.Provider, DataListView, ACBrSocket,
  EmbeddedWB, IEAddress, SHDocVw_EWB, EwbCore, OleCtrls,ACBrIBGE, SHDocVw,
  Generics.Collections, RTTI, ActiveX, ClassUF, ClassUF_SP, ClassUF_GO, ClassUF_RJ,
  ClassUF_MT, ClassUF_MS, ClassUF_CE, ClassUF_PI, ClassUF_MA, ClassUF_SC,
  ClassUF_PR, ClassUF_TO, ClassUF_RN, ClassUF_DF, ClassUF_BA, ClassUF_RS,
  ClassUF_ES, ClassUF_RO, ClassUF_AC, ClassUF_RR, ClassUF_SE, ClassUF_PB,
  ClassUF_AL, ClassUF_AM, ClassUF_PE, ClassUF_AP, ClassUF_MG, ClassUF_PA;

type
  EConsultaSintegraJException = class(Exception);

  TData = class
  private
    FName:String;
    FNamePesq:String;
    FCount:Integer;
    FProx:String;
    FUsarCount:Boolean;
  public
    property Name: String      read FName      write FName;
    property NamePesq: String  read FNamePesq  write FNamePesq;
    property Count: Integer    read FCount     write FCount;
    property Prox: String      read FProx      write FProx;
    property UsarCount:Boolean read FUsarCount write FUsarCount;
  end;

  TPessoa = class
  private
    FCNPJ: String;
    FInscEstadual: String;
    FRazaoSocial: String;
    FFantasia: String;
    FUF: String;
    FCNAE1: String;
    FCNAE2: TStringList;
    FSituacao: String;
    FDataSituacao: TDateTime;
    FDataAbertura: TDateTime;
    FRegime: String;
    FEndereco: String;
    FNumero: String;
    FComplemento: String;
    FCEP: String;
    FBairro: String;
    FCidade: String;
    FTelefone: String;
    FURL:String;
    procedure SetUF(Value:string);
  public
    Constructor Create;
    property CNPJ: String            Read FCNPJ         Write FCNPJ;
    property InscEstadual: String    Read FInscEstadual Write FInscEstadual;
    property RazaoSocial: String     Read FRazaoSocial  Write FRazaoSocial;
    property Fantasia: String        Read FFantasia     Write FFantasia;
    property UF: String              Read FUF           Write SetUF;
    property CNAE1: String           Read FCNAE1        Write FCNAE1;
    property CNAE2: TStringList      Read FCNAE2        Write FCNAE2;
    property Situacao: String        Read FSituacao     Write FSituacao;
    property DataSituacao: TDateTime Read FDataSituacao Write FDataSituacao;
    property DataAbertura: TDateTime Read FDataAbertura Write FDataAbertura;
    property Regime: String          Read FRegime       Write FRegime;
    property Endereco: String        Read FEndereco     Write FEndereco;
    property Numero: String          Read FNumero       Write FNumero;
    property Complemento: String     Read FComplemento  Write FComplemento;
    property CEP: String             Read FCEP          Write FCEP;
    property Bairro: String          Read FBairro       Write FBairro;
    property Cidade: String          Read FCidade       Write FCidade;
    property Telefone: String        Read FTelefone     Write FTelefone;
    property URL:String              Read FURL          Write FURL;
  end;

  TFormConsSintegra = class
  private
    FFrm:TForm;
    FEdtCNPJ:TLabeledEdit;
    FEdtInscEst:TLabeledEdit;
    FEdtRazaoSocial:TLabeledEdit;
    FEdtEmpresaUF:TLabeledEdit;
    FEdtCNAE_1:TLabeledEdit;
    FEdtCNAE_2:TLabeledEdit;
    FEdtSituacao:TLabeledEdit;
    FEdtDtaSituacao:TLabeledEdit;
    FEdtDtaInicAtiv:TLabeledEdit;
    FEdtAuxCNAE:TLabeledEdit;
    FEdtRegime:TLabeledEdit;
    FEdtObservacao:TLabeledEdit;
    FEdtCidade:TLabeledEdit;
    FEdtDistrito:TLabeledEdit;
    FEdtEndereco:TLabeledEdit;
    FEdtNumero:TLabeledEdit;
    FEdtComplemento:TLabeledEdit;
    FEdtBairro:TLabeledEdit;
    FEdtCEP:TLabeledEdit;
    FEdtUF:TLabeledEdit;
    FEdtTelefone:TLabeledEdit;
    FPnlBrowser:TPanel;
    FPnlDados:TPanel;
    FPnlFooter:TPanel;
    FBtnOk:TButton;
    FBtnCancel:TButton;
    FBtnImportar:TButton;
    FBrowser: TEmbeddedWB;
    FModalResult:Integer;
    FURL:String;
    FUF:String;
    FResponse:String;
    FValuePesq: TDictionary<String,TData>;
    function GerarHTML: String;
    function GerarText: String;
    procedure BtnImportarOnClick(Sender: TObject);
    procedure WebBrowserNewWindow2(ASender: TObject; var ppDisp: IDispatch;
      var Cancel: WordBool);
    procedure EmbeddedWB1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
  public
    constructor Create(var ValuesPesq:TDictionary<String,TData>);
    procedure Show;
    property ModalResult:Integer                Read FModalResult Write FModalResult;
    property URL:String                         Read FURL         Write FURL;
    property UF:String                          Read FUF          write FUF;
    Property Response:String                    Read FResponse    Write FResponse;
  end;

  TConsultaSintegra = class
  private
    FPessoa: TPessoa;
    FHTML: String;
    FValuePesq: TDictionary<String,TData>;
    FValues: TDictionary<String,String>;
    FClassUF: TClassUF;
    procedure LoadClassUF(UF: String);
    procedure CreateValues(Response:String);
    procedure ListPropAtrib;
  public
    Function ConsultaSintegra:TPessoa;
    constructor Create(UF:String);
    property Pessoa:TPessoa  Read FPessoa Write FPessoa;
    property Values:TDictionary<String,String>  Read FValues      Write FValues;
  end;

  function RetirarEspacos(Value:String):String;
  function RetirarCabecalho(Value, UF:String;var Data:TDictionary<String,TData>):String;
  function StrEntreStr(Str, StrInicial, StrFinal: String; ComecarDe: Integer = 1): String;
  function ReturnValue(const Source,Value:String;Data:TData):String;Overload;
  function ReturnValue(const Source,Value:String;Count:Integer):String;Overload;
  function ReturnValue(const Source,Value,ValueProx:String):String;Overload;
  function GetData(var Dict:TDictionary<String,TData> ;const Value:String):TData;
  function GetFrameByName(ABrowser:TWebBrowser;aFrameName: string): IHTMLDocument2;
//  function GetFrameByID(ABrowser:TWebBrowser;aFrameID: integer): IHTMLDocument2;

implementation

function StrEntreStr(Str, StrInicial, StrFinal: String; ComecarDe: Integer = 1): String;
var
  Ini, Fim: Integer;
begin
  Ini:= PosEx(StrInicial, Str, ComecarDe) + Length(StrInicial);
  if Ini > 0 then
  begin
    Fim:= PosEx(StrFinal, Str, Ini);
    if Fim > 0 then
      Result:= Copy(Str, Ini, Fim - Ini)
    else
      Result:= '';
  end
  else
    Result:= '';
end;

function RetirarEspacos(Value:String):String;
begin
  Result := Trim(StringReplace(Value,#$D#$A,'',[rfReplaceAll,rfIgnoreCase]));
end;

function RetirarCabecalho(Value, UF:String;var Data:TDictionary<String,TData>):String;
var
  Str:String;
  i:Integer;
  aData:TData;
begin
  if UF = ('DF') then
  begin
    for i := 0 to Pred(Data.Count) do
    begin
      aData := Data.ToArray[i].Value;
      if aData.FName = 'CNPJ' then
      begin
        Result := trim(Copy(Value,Pos(aData.FNamePesq,Value),Value.Length));
        exit;
      end;
    end;
  end
  else
  begin
    Result := Value;
  end;
end;

function ReturnValue(const Source,Value:String;Data:TData):String;
begin
  if Data.UsarCount then
    Result := ReturnValue(Source,Data.NamePesq,Data.Count)
  else
    Result := ReturnValue(Source,Data.NamePesq,Data.Prox);
end;

function ReturnValue(const Source,Value:String;Count:Integer):String;
var
  strValue,StrSemEsp:String;
begin
  Result       := EmptyStr;
  StrSemEsp    := StringReplace(Source,#$D#$A,'',[rfReplaceAll,rfIgnoreCase]);
  try
    strValue := Trim(copy(StrSemEsp,((Pos(Value,StrSemEsp))+(Length(Value))),Count));
    Result := Trim(StringReplace(strValue,':','',[rfReplaceAll,rfIgnoreCase]));
  except
    //
  end;
end;

function ReturnValue(const Source,Value,ValueProx:String):String;
var
  strValue,StrSource,StrSemEsp:String;
begin
  Result       := EmptyStr;
  StrSemEsp    := StringReplace(Source,#$D#$A,'',[rfReplaceAll,rfIgnoreCase]);
  StrSource    := Trim(copy(StrSemEsp,((Pos(Value,StrSemEsp))+(Length(Value))),Length(StrSemEsp)));
  try
    strValue := Trim(copy(StrSource,0,Pos(ValueProx,StrSource)-1));
    Result := Trim(StringReplace(strValue,':','',[rfReplaceAll,rfIgnoreCase]));
  except
    //
  end;
end;

function GetData(var Dict:TDictionary<String,TData> ;const Value:String):TData;
begin
  Result := nil;
  Dict.TryGetValue(value, Result);
end;

{ TConsultaSintegra }

constructor TConsultaSintegra.Create(UF:String);
begin
  Pessoa          := TPessoa.Create;
  Self.FValues    := TDictionary<String,String>.Create;
  Self.FValuePesq := TDictionary<String,TData>.Create;
  LoadClassUF(UpperCase(UF));
  ListPropAtrib;
end;

procedure TConsultaSintegra.LoadClassUF(UF: String);
begin
  case AnsiIndexStr(UpperCase(UF), ['AP','TO','MA','PI','SP','RN','PB','PE','AL','SE','MG','GO','RO','AC','AM','RR','PA','CE','BA','ES','RJ','PR','SC','RS','MS','MT','DF']) of
    0  : FClassUF := TClassUF_AP.Create;
    1  : FClassUF := TClassUF_TO.Create;
    2  : FClassUF := TClassUF_MA.Create;
    3  : FClassUF := TClassUF_PI.Create;
    4  : FClassUF := TClassUF_SP.Create;
    5  : FClassUF := TClassUF_RN.Create;
    6  : FClassUF := TClassUF_PB.Create;
    7  : FClassUF := TClassUF_PE.Create;
    8  : FClassUF := TClassUF_AL.Create;
    9  : FClassUF := TClassUF_SE.Create;
    10 : FClassUF := TClassUF_MG.Create;
    11 : FClassUF := TClassUF_GO.Create;
    12 : FClassUF := TClassUF_RO.Create;
    13 : FClassUF := TClassUF_AC.Create;
    14 : FClassUF := TClassUF_AM.Create;
    15 : FClassUF := TClassUF_RR.Create;
    16 : FClassUF := TClassUF_PA.Create;
    17 : FClassUF := TClassUF_CE.Create;
    18 : FClassUF := TClassUF_BA.Create;
    19 : FClassUF := TClassUF_ES.Create;
    20 : FClassUF := TClassUF_RJ.Create;
    21 : FClassUF := TClassUF_PR.Create;
    22 : FClassUF := TClassUF_SC.Create;
    23 : FClassUF := TClassUF_RS.Create;
    24 : FClassUF := TClassUF_MS.Create;
    25 : FClassUF := TClassUF_MT.Create;
    26 : FClassUF := TClassUF_DF.Create;
  end;
end;

function TConsultaSintegra.ConsultaSintegra:TPessoa;
var
  frmConsSintegra:TFormConsSintegra;
begin
  if (FPessoa.FUF <> EmptyStr) then
  begin
    frmConsSintegra := TFormConsSintegra.Create(Self.FValuePesq);
    frmConsSintegra.UF := Self.Pessoa.UF;
    frmConsSintegra.URL := Self.Pessoa.URL;
    frmconsSintegra.Show;
  end
  else
  begin
    ShowMessage('UF não Informado');
  end;
  if frmConsSintegra.ModalResult = mrYes then
  begin
    Self.CreateValues(frmConsSintegra.Response);
  end;
end;

procedure TConsultaSintegra.CreateValues(Response:String);
var
  i:Integer;
begin
  ListPropAtrib;
end;

procedure TConsultaSintegra.ListPropAtrib;
var
  Context: TRttiContext;
  TypObj: TRttiType;
  PropertyObj:TRttiProperty;
  AtributeObj: TCustomAttribute;
  Data: TData;
begin
  Data := TData.Create;
  Context := TRttiContext.Create;
  TypObj := Context.GetType(TObject(Self.FClassUF).ClassInfo);
  for PropertyObj in TypObj.GetProperties do
  begin
    Data := TData.Create;
    for AtributeObj in PropertyObj.GetAttributes do
    begin
      if AtributeObj.ClassName = 'TName' then
      begin
        Data.Name     := PropertyObj.Name;
        Data.NamePesq := TName(AtributeObj).Name;
        Data.Count    := TName(AtributeObj).Length;
        Data.Prox     := TName(AtributeObj).Prox;
        Data.UsarCount:= TName(AtributeObj).UsarCount;
      end;
    end;
    Self.FValuePesq.Add(PropertyObj.Name,Data);
  end;
end;

{ TPessoa }

constructor TPessoa.Create;
begin
  FCNAE2  := TStringList.Create;
end;

procedure TPessoa.SetUF(Value: string);
begin
  FUF := UpperCase(Value);
  case AnsiIndexStr(UpperCase(Value), ['AP','TO','MA','PI','SP','RN','PB','PE','AL','SE','MG','GO','RO','AC','AM','RR','PA','CE','BA','ES','RJ','PR','SC','RS','MS','MT','DF']) of
    0  : Self.URL := 'http://sefaz.ap.gov.br/sate/seg/SEGf_AcessarFuncao.jsp?cdFuncao=CAD_011';
    1  : Self.URL := 'http://sintegra.sefaz.to.gov.br/sintegra/servlet/wpsico01';
    2  : Self.URL := 'http://aplicacoes.ma.gov.br/sintegra/jsp/consultaSintegra/consultaSintegraFiltro.jsf';
    3  : Self.URL := 'http://webas.sefaz.pi.gov.br/SintegraConsultaPublica/';
    4  : Self.URL := 'https://www.cadesp.fazenda.sp.gov.br/(S(xgg4ul55jnynrhjz0gk3n1vl))/Pages/Cadastro/Consultas/ConsultaPublica/ConsultaPublica.aspx';
    5  : Self.URL := 'https://uvt2.set.rn.gov.br/#/services/consultaContribuinte';
    6  : Self.URL := 'https://www4.receita.pb.gov.br/sintegra/SINf_ConsultaSintegra.jsp';
    7  : Self.URL := 'http://efisco.sefaz.pe.gov.br/sfi_trb_gcc/PRConsultarExtratoCadastroContribuinteSINTEGRA';
    8  : Self.URL := 'http://sintegra.sefaz.al.gov.br/#/';
    9  : Self.URL := 'https://security.sefaz.se.gov.br/SIC/sintegra';
    10 : Self.URL := 'http://consultasintegra.fazenda.mg.gov.br/';
    11 : Self.URL := 'http://appasp.sefaz.go.gov.br/Sintegra/Consulta/default.asp?';
    12 : Self.URL := 'https://portalcontribuinte.sefin.ro.gov.br/Publico/parametropublica.jsp';
    13 : Self.URL := 'http://sefaznet.ac.gov.br/sefazonline/servlet/hpfsincon';
    14 : Self.URL := 'http://online.sefaz.am.gov.br/sintegra/index.asp';
    15 : Self.URL := 'https://portalapp.sefaz.rr.gov.br/sintegra/servlet/hwsintco';
    16 : Self.URL := 'https://app.sefa.pa.gov.br/Sintegra/';
    17 : Self.URL := 'http://www.sefaz.ce.gov.br/content/aplicacao/internet/servicos_online/sintegra/sintegra.asp?estado=ce';
    18 : Self.URL := 'http://www.sefaz.ba.gov.br/Sintegra/sintegra.asp?estado=BA';
    19 : Self.URL := 'http://www.sintegra.es.gov.br/';
    20 : Self.URL := 'https://www.sefaz.rs.gov.br/NFE/NFE-CCC.aspx';
    21 : Self.URL := 'http://www.sintegra.fazenda.pr.gov.br/sintegra/';
    22 : Self.URL := 'http://sistemas3.sef.sc.gov.br/sintegra/consulta_empresa_pesquisa.aspx';
    23 : Self.URL := 'http://www.sefaz.rs.gov.br/consultas/contribuinte';
    24 : Self.URL := 'https://servicos.efazenda.ms.gov.br/consultacci';
    25 : Self.URL := 'https://www.sefaz.mt.gov.br/sid/consulta/infocadastral/consultar/publica';
    26 : Self.URL := 'http://www.fazenda.df.gov.br/area.cfm?id_area=110';
  end;
end;

{ TFormConsSintegra }

constructor TFormConsSintegra.Create(var ValuesPesq:TDictionary<String,TData>);
begin
  FFrm            := TForm.Create(nil);
  FPnlBrowser     := TPanel.Create(FFrm);
  FPnlDados       := TPanel.Create(FFrm);
  FPnlFooter      := TPanel.Create(FFrm);

  FBrowser                    := TEmbeddedWB.Create(FPnlBrowser);
  FBrowser.OnNewWindow2       := WebBrowserNewWindow2;
//  FBrowser.OnDocumentComplete := EmbeddedWB1DocumentComplete;

  FEdtCNPJ        := TLabeledEdit.Create(FPnlDados);
  FEdtInscEst     := TLabeledEdit.Create(FPnlDados);
  FEdtRazaoSocial := TLabeledEdit.Create(FPnlDados);;
  FEdtEmpresaUF   := TLabeledEdit.Create(FPnlDados);
  FEdtCNAE_1      := TLabeledEdit.Create(FPnlDados);
  FEdtCNAE_2      := TLabeledEdit.Create(FPnlDados);
  FEdtSituacao    := TLabeledEdit.Create(FPnlDados);
  FEdtDtaSituacao := TLabeledEdit.Create(FPnlDados);
  FEdtDtaInicAtiv := TLabeledEdit.Create(FPnlDados);
  FEdtAuxCNAE     := TLabeledEdit.Create(FPnlDados);
  FEdtRegime      := TLabeledEdit.Create(FPnlDados);
  FEdtObservacao  := TLabeledEdit.Create(FPnlDados);
  FEdtCidade      := TLabeledEdit.Create(FPnlDados);
  FEdtDistrito    := TLabeledEdit.Create(FPnlDados);
  FEdtEndereco    := TLabeledEdit.Create(FPnlDados);
  FEdtNumero      := TLabeledEdit.Create(FPnlDados);
  FEdtComplemento := TLabeledEdit.Create(FPnlDados);
  FEdtBairro      := TLabeledEdit.Create(FPnlDados);
  FEdtCEP         := TLabeledEdit.Create(FPnlDados);
  FEdtUF          := TLabeledEdit.Create(FPnlDados);
  FEdtTelefone    := TLabeledEdit.Create(FPnlDados);

  Self.FValuePesq := ValuesPesq;

  FBtnOk          := TButton.Create(FPnlFooter);
  FBtnCancel      := TButton.Create(FPnlFooter);
  FBtnImportar    := TButton.Create(FPnlFooter);

  with FFrm do
  begin
    BorderStyle  := bsSingle;
    Caption      := 'Importar Dados do Sintegra';
    Width        := 693;
    Height       := 400;
    Position     := poScreenCenter;
    ClientHeight := Height;
    ClientWidth  := Width;
  end;

  with FPnlFooter do
  begin
    Parent     := FFrm;
    Height     := 36;
    Align      := alBottom;
    Caption    := EmptyStr;
  end;

  with FPnlBrowser do
  begin
    Parent     := FFrm;
    Align      := alClient;
    Caption    := EmptyStr;
    Visible    := True;
  end;

  with FPnlDados do
  begin
    Parent     := FFrm;
    Align      := alClient;
    Caption    := EmptyStr;
    Visible    := False;
  end;

  TWinControl(FBrowser).Parent := FPnlBrowser;
  with FBrowser do
  begin
    Align         := alClient;
    visible       := True;
    HandleNeeded;
  end;

  with FEdtCNPJ do
  begin
    Parent            := FPnlDados;
    Top               := 25;
    Left              := 15;
    Width             := 122;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'CNPJ';
    LabelPosition     := lpAbove;
  end;

  with FEdtInscEst do
  begin
    Parent            := FPnlDados;
    Top               := 25;
    Left              := 152;
    Width             := 122;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'Insc.Estadual';
    LabelPosition     := lpAbove;
  end;

  with FEdtRazaoSocial do
  begin
    Parent            := FPnlDados;
    Top               := 25;
    Left              := 289;
    Width             := 331;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'Empresa';
    LabelPosition     := lpAbove;
  end;

  with FEdtEmpresaUF do
  begin
    Parent            := FPnlDados;
    Top               := 25;
    Left              := 635;
    Width             := 26;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'UF';
    LabelPosition     := lpAbove;
  end;

  with FEdtCNAE_1 do
  begin
    Parent            := FPnlDados;
    Top               := 70;
    Left              := 15;
    Width             := 318;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'CNAE-F Principal';
    LabelPosition     := lpAbove;
  end;

  with FEdtCNAE_2 do
  begin
    Parent            := FPnlDados;
    Top               := 70;
    Left              := 348;
    Width             := 165;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'CNAE-F Secundário';
    LabelPosition     := lpAbove;
  end;

  with FEdtSituacao do
  begin
    Parent            := FPnlDados;
    Top               := 115;
    Left              := 15;
    Width             := 105;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'Situação';
    LabelPosition     := lpAbove;
  end;

  with FEdtDtaSituacao do
  begin
    Parent            := FPnlDados;
    Top               := 115;
    Left              := 135;
    Width             := 67;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'Data Sit.';
    LabelPosition     := lpAbove;
  end;

  with FEdtDtaInicAtiv do
  begin
    Parent            := FPnlDados;
    Top               := 115;
    Left              := 217;
    Width             := 67;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'Inicio Atividades';
    LabelPosition     := lpAbove;
  end;

  with FEdtAuxCNAE do
  begin
    Parent            := FPnlDados;
    Top               := 115;
    Left              := 299;
    Width             := 171;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'Auxiliar CNAE';
    LabelPosition     := lpAbove;
  end;

  with FEdtRegime do
  begin
    Parent            := FPnlDados;
    Top               := 160;
    Left              := 15;
    Width             := 137;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'Regime de Recolhimento';
    LabelPosition     := lpAbove;
  end;

  with FEdtObservacao do
  begin
    Parent            := FPnlDados;
    Top               := 160;
    Left              := 167;
    Width             := 137;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'Observações';
    LabelPosition     := lpAbove;
  end;

  with FEdtCidade do
  begin
    Parent            := FPnlDados;
    Top               := 205;
    Left              := 15;
    Width             := 386;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'Cidade';
    LabelPosition     := lpAbove;
  end;

  with FEdtDistrito do
  begin
    Parent            := FPnlDados;
    Top               := 205;
    Left              := 416;
    Width             := 159;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'Distrito/Povoado';
    LabelPosition     := lpAbove;
  end;

  with FEdtEndereco do
  begin
    Parent            := FPnlDados;
    Top               := 250;
    Left              := 15;
    Width             := 306;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'Endereço';
    LabelPosition     := lpAbove;
  end;

  with FEdtNumero do
  begin
    Parent            := FPnlDados;
    Top               := 250;
    Left              := 336;
    Width             := 90;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'Nº';
    LabelPosition     := lpAbove;
  end;

  with FEdtComplemento do
  begin
    Parent            := FPnlDados;
    Top               := 250;
    Left              := 441;
    Width             := 120;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'Complemento';
    LabelPosition     := lpAbove;
  end;

  with FEdtBairro do
  begin
    Parent            := FPnlDados;
    Top               := 295;
    Left              := 15;
    Width             := 339;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'Bairro';
    LabelPosition     := lpAbove;
  end;

  with FEdtCEP do
  begin
    Parent            := FPnlDados;
    Top               := 295;
    Left              := 369;
    Width             := 65;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'CEP';
    LabelPosition     := lpAbove;
  end;

  with FEdtUF do
  begin
    Parent            := FPnlDados;
    Top               := 295;
    Left              := 449;
    Width             := 29;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'UF';
    LabelPosition     := lpAbove;
  end;

  with FEdtTelefone do
  begin
    Parent            := FPnlDados;
    Top               := 295;
    Left              := 493;
    Width             := 94;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'Telefone';
    LabelPosition     := lpAbove;
  end;

  with FBtnOk do
  begin
    Parent     := FPnlFooter;
    Default    := True;
    ModalResult:= mrOk;
    Top        := 8;
    left       := 486;
    Width      := 80;
    Caption    := 'Ok';
  end;

  with FBtnCancel do
  begin
    Parent     := FPnlFooter;
    ModalResult:= mrCancel;
    Top        := 8;
    Left       := 584;
    Width      := 80;
    Caption    := 'Cancel';
  end;

  with FBtnImportar do
  begin
    Parent     := FPnlFooter;
    ModalResult:= mrNone;
    Top        := 8;
    Left       := 96;
    Width      := 80;
    Caption    := 'Importar';
    OnClick    := BtnImportarOnclick;
  end;

  FModalResult := FFrm.ModalResult;
end;

procedure TFormConsSintegra.WebBrowserNewWindow2(ASender: TObject; var ppDisp: IDispatch;var Cancel: WordBool);
begin
  ASender := Self.FBrowser;
end;

procedure TFormConsSintegra.EmbeddedWB1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  ovScript: OleVariant;
  Doc: IHTMLDocument2;
  links: IHTMLElementCollection;
  link: IHTMLAnchorElement;
  Scripts: IHTMLElementCollection;
  script: IHTMLScriptElement;
  i: Integer;
  s: String;
begin
  s := 'window.name = "other page";';
  Doc := Self.FBrowser.Document as IHTMLDocument2;
  Scripts := Doc.all.tags('SCRIPT') as IHTMLElementCollection;
  ovScript := Scripts.item(0,0) as IHTMLScriptElement;
  s := s + #13 + ovScript.text;
  ovScript.Text := s;
  links := Doc.all.tags('A') as IHTMLElementCollection;
  for i := 0 to links.length-1 do
  begin
    link := links.item(i,0) as IHTMLAnchorElement;
    if link.target = '_blank' then
      link.target := 'other page';
  end;
end;

procedure TFormConsSintegra.Show;
var
  Flags,Elements: OLEVariant;
begin
  FBrowser.Navigate(Self.URL, Flags, Flags, Flags, Flags);
  FBrowser.Visible := True;
  FFrm.ShowModal;
  FModalResult := FFrm.ModalResult;
end;

function TFormConsSintegra.GerarText:string;
var
  pag: IHTMLElement;
  i: Integer;
  ListStr: TStringList;
begin
  Result := EmptyStr;
  if Assigned(FBrowser.Document) then
  begin
    pag := (FBrowser.Document as IHTMLDocument2).Body;
    while pag.ParentElement <> nil do
      pag := pag.ParentElement;
    Result := pag.OuterText;
  end;
end;

function TFormConsSintegra.GerarHTML:String;
var
  pag: IHTMLElement;
begin
  if Assigned(FBrowser.Document) then
  begin
    pag := (FBrowser.Document as IHTMLDocument2).Body;
    while pag.ParentElement <> nil do
      pag := pag.ParentElement;
  end;
  Result := pag.OuterHTML;
end;

procedure TFormConsSintegra.BtnImportarOnClick(Sender: TObject);
var
  i: Integer;
  Data:TData;
begin
  Self.Response := RetirarCabecalho(GerarText,Self.UF,FValuePesq);
  Self.FPnlBrowser.Visible := False;
  Self.FPnlDados.Visible   := True;
  for i := 0 to Pred(Self.FValuePesq.Count) do
  begin
    Data := TData.Create;
    Data := Self.FValuePesq.ToArray[i].Value;
    case AnsiIndexStr(Data.Name,['CNPJ','InscEstadual','RazaoSocial','Fantasia','UF',
    'CNAE1','CNAE2','Situacao','Regime','Endereco','Numero','Complemento','CEP','Bairro',
    'Cidade','DataSituacao','Telefone','DataAbertura','EMail','Observacao']) of
      0  : Self.FEdtCNPJ.Text        := ReturnValue(Self.Response,Data.NamePesq,Data);
      1  : Self.FEdtInscEst.Text     := ReturnValue(Self.Response,Data.NamePesq,Data);
      2  : Self.FEdtRazaoSocial.Text := ReturnValue(Self.Response,Data.NamePesq,Data);
      3  :;
      4  :
      begin
        Self.FEdtEmpresaUF.Text      := Self.UF;
        Self.FEdtUF.Text             := Self.UF;
      end;
      5  : Self.FEdtCNAE_1.Text      := ReturnValue(Self.Response,Data.NamePesq,Data);
      6  : Self.FEdtCNAE_2.Text      := ReturnValue(Self.Response,Data.NamePesq,Data);
      7  : Self.FEdtSituacao.Text    := ReturnValue(Self.Response,Data.NamePesq,Data);
      8  : Self.FEdtRegime.Text      := ReturnValue(Self.Response,Data.NamePesq,Data);
      9  : Self.FEdtEndereco.Text    := ReturnValue(Self.Response,Data.NamePesq,Data);
      10 : Self.FEdtNumero.Text      := ReturnValue(Self.Response,Data.NamePesq,Data);
      11 : Self.FEdtComplemento.Text := ReturnValue(Self.Response,Data.NamePesq,Data);
      12 : Self.FEdtCEP.Text         := ReturnValue(Self.Response,Data.NamePesq,Data);
      13 : Self.FEdtBairro.Text      := ReturnValue(Self.Response,Data.NamePesq,Data);
      14 : Self.FEdtCidade.Text      := ReturnValue(Self.Response,Data.NamePesq,Data);
      15 : Self.FEdtDtaSituacao.Text := ReturnValue(Self.Response,Data.NamePesq,Data);
      16 : Self.FEdtTelefone.Text    := ReturnValue(Self.Response,Data.NamePesq,Data);
      17 : Self.FEdtDtaInicAtiv.Text := ReturnValue(Self.Response,Data.NamePesq,Data);
      18 :; //Email
      19 : Self.FEdtObservacao.Text  := ReturnValue(Self.Response,Data.NamePesq,Data);
    end;
    FreeAndNil(Data);
  end;
end;

function GetFrameByName(ABrowser:TWebBrowser;aFrameName: string): IHTMLDocument2;
var
  searchdoc : IHTMLDocument2;
  FoundIt : boolean;
  function Enum(AHTMLDocument:IHTMLDocument2;aFrameName:string):boolean;
  var
     OleContainer: IOleContainer;
     EnumUnknown: IEnumUnknown;
     Unknown: IUnknown;
     Fetched: LongInt;
     WebBrowser: IWebBrowser;
     FBase     : IHTMLFrameBase;
  begin
     Result:=True;
     if not Assigned(AHtmlDocument) then Exit;
     if not Supports(AHtmlDocument, IOleContainer, OleContainer) then Exit;
     if Failed(OleContainer.EnumObjects(OLECONTF_EMBEDDINGS, EnumUnknown)) then
     Exit;
     while (EnumUnknown.Next(1, Unknown, @Fetched)=S_OK) do
     begin
       if Supports(Unknown, IHTMLFrameBase,FBase) then
       begin
         if LowerCase(FBase.name) = LowerCase(aFrameName) then
         begin
           if Supports(Unknown, IWebBrowser, WebBrowser) then
           begin
             searchdoc := (WebBrowser.Document as IHTMLDocument2);
             FoundIt:=true;
             exit;
           end;
         end;
       end;
       if not (FoundIt) then
       begin
         if Supports(Unknown, IWebBrowser, WebBrowser) then
         begin
           Result:=Enum((WebBrowser.Document as IHtmlDocument2),aFrameName);
           if not Result then Exit;
         end;
       end else exit;
     end;
  end;
begin
  FoundIt := false;
  result := nil; // just in case
  Enum((ABrowser.Document as IHTMLDocument2),aFrameName);
  if FoundIt then
    result := searchdoc
  else
    result := nil;
end;

//function GetFrameByID(ABrowser:TWebBrowser;aFrameID: integer): IHTMLDocument2;
//var
//  searchdoc: IHTMLDocument2;
//  i: integer;
//  function Enum(AHTMLDocument:IHTMLDocument2;aFrameID:integer):boolean;
//  var
//     OleContainer: IOleContainer;
//     EnumUnknown: IEnumUnknown;
//     Unknown: IUnknown;
//     Fetched: LongInt;
//     WebBrowser: IWebBrowser;
//     i : integer;
//  begin
//     inc(i);
//     Result:=True;
//     if not Assigned(AHtmlDocument) then Exit;
//     if not Supports(AHtmlDocument, IOleContainer, OleContainer) then Exit;
//     if Failed(OleContainer.EnumObjects(OLECONTF_EMBEDDINGS, EnumUnknown)) then
//     Exit;
//
//     while (EnumUnknown.Next(1, Unknown, @Fetched)=S_OK) do
//     begin
//       if Supports(Unknown, IHMTLFrameBase, FBase) then
//       begin
//         // Here we ask if we have the right Frame
//         if i = aFrameID then
//         begin
//           if Supports(Unknown, IWebBrowser, WebBrowser) then
//           begin
//             searchdoc := (WebBrowser.Document as IHTMLDocument2);
//             FoundIt := true;
//             exit;
//           end;
//         end;
//       end;
//       if not (FoundIt) then
//       begin
//         if Supports(Unknown, IWebBrowser, WebBrowser) then
//         begin
//           Result:=Enum((WebBrowser.Document as IHtmlDocument2),aFrameName);
//           if not Result then Exit;
//         end;
//       end else exit;
//     end;
//  end;
//
//begin
//  i := -1;
//  result := nil; // just in case
//  Enum((ABrowser.Document as IHTMLDocument2),aFrameID);
//  if FoundIt then
//    result := searchdoc
//  else
//    result := nil;
//end;


end.

