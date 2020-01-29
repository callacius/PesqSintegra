unit ConsSintegra;

interface

uses
  System.Classes,
  System.SysUtils,
  System.StrUtils,
  System.Variants,
  WinApi.Windows,
  Winapi.Messages,
  Vcl.Forms,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Dialogs,
  Vcl.ComCtrls,
  Vcl.DBGrids,
  Vcl.CheckLst,
  System.UITypes,
  mshtml,
  ACBrSocket,
  OleCtrls,
  ACBrIBGE,
  SHDocVw,
  Generics.Collections,
  RTTI,
  ActiveX,
  Registry,
  ClassUF,
  ClassUF_SP,
  ClassUF_GO,
  ClassUF_RJ,
  ClassUF_MT,
  ClassUF_MS,
  ClassUF_CE,
  ClassUF_PI,
  ClassUF_MA,
  ClassUF_SC,
  ClassUF_PR,
  ClassUF_TO,
  ClassUF_RN,
  ClassUF_DF,
  ClassUF_BA,
  ClassUF_RS,
  ClassUF_ES,
  ClassUF_RO,
  ClassUF_AC,
  ClassUF_RR,
  ClassUF_SE,
  ClassUF_PB,
  ClassUF_AL,
  ClassUF_AM,
  ClassUF_PE,
  ClassUF_AP,
  ClassUF_MG,
  ClassUF_PA,
  ClassUF_CCC,
  ClassUF_RECEITA,
  Win.WebBrowser,
  Web.HTTPApp,
  Web.HTTPProd,
  Web.DSProd;

const
  WM_REDIRECT       =  WM_USER + 100;

type

  TWebSelfPopup     =  class(TWinControl)
  private
     FBrowser:      TWebBrowser;
     FPopup:        TWebBrowser;
     FURL:          OleVariant;
     FFlags:        OleVariant;
     FTarget:       OleVariant;
     FPostData:     OleVariant;
     FHeaders:      OleVariant;
  protected
     procedure      OnRedirect(var Message: TMessage); message WM_REDIRECT;
     procedure      OnBeforeNavigate2(Sender: TObject; const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData, Headers: OleVariant; var Cancel: WordBool);
     procedure      OnNewWindow2(Sender: TObject; var ppDisp: IDispatch; var Cancel: WordBool);
  public
     constructor    CreateHook(const WebBrowser: TWebBrowser);
     destructor     Destroy; override;
  end;

  EConsultaSintegraJException = class(Exception);

  TData = class
  private
    FName:String;
    FNamePesq:String;
    FCount:Integer;
    FProx:String;
    FStart:Integer;
    FUsarCount:Boolean;
  public
    property Name: String      read FName      write FName;
    property NamePesq: String  read FNamePesq  write FNamePesq;
    property Count: Integer    read FCount     write FCount;
    property Prox: String      read FProx      write FProx;
    property Start:Integer     read FStart     write FStart;
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
    FDataSituacao: TDate;
    FDataAbertura: TDate;
    FEmail:String;
    FRegime: String;
    FEndereco: String;
    FNumero: String;
    FComplemento: String;
    FCEP: String;
    FBairro: String;
    FCidade: String;
    FTelefone: String;
    FURL:String;
    FObservacao:String;
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
    property DataSituacao: TDate     Read FDataSituacao Write FDataSituacao;
    property DataAbertura: TDate     Read FDataAbertura Write FDataAbertura;
    property EMail:String            Read FEmail        write FEmail;
    property Regime: String          Read FRegime       Write FRegime;
    property Endereco: String        Read FEndereco     Write FEndereco;
    property Numero: String          Read FNumero       Write FNumero;
    property Complemento: String     Read FComplemento  Write FComplemento;
    property CEP: String             Read FCEP          Write FCEP;
    property Bairro: String          Read FBairro       Write FBairro;
    property Cidade: String          Read FCidade       Write FCidade;
    property Telefone: String        Read FTelefone     Write FTelefone;
    property URL:String              Read FURL          Write FURL;
    property Observacao:String       Read FObservacao   Write FObservacao;
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
    FEdtEMail:TLabeledEdit;
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
    FBrowser: TWebBrowser;
    FWebSelfPopup: TWebSelfPopup;
    FModalResult:Integer;
    FURL:String;
    FUF:String;
    FResponse:String;
    FValuePesq: TDictionary<String,TData>;
    function GerarText: String;
    procedure BtnImportarOnClick(Sender: TObject);
    procedure BtnConfirmarOnClick(Sender: TObject);
    procedure BtnCancelarOnClick(Sender: TObject);
  public
    constructor Create(var ValuesPesq:TDictionary<String,TData>);
    procedure Show;
    property ModalResult:Integer                Read FModalResult  Write FModalResult;
    property URL:String                         Read FURL          Write FURL;
    property UF:String                          Read FUF           write FUF;
    Property Response:String                    Read FResponse     Write FResponse;
    property WebSelfPopup: TWebSelfPopup        Read FWebSelfPopup Write FWebSelfPopup;
  end;

  TConsultaSintegra = class
  private
    FPessoa: TPessoa;
    FValuePesq: TDictionary<String,TData>;
    FClassUF: TClassUF;
    procedure LoadClassUF(UF: String);
    procedure ListPropAtrib;
  public
    Function ConsultaSintegra:TPessoa;
    procedure ConsultarSintegra;
    constructor Create(UF:String);
    property Pessoa:TPessoa  Read FPessoa Write FPessoa;
  end;

  function RetirarEspacos(Value:String):String;
  function IEVersao: String;
  function WriteDWORD(vKey, vName: String; iValue: DWORD): Boolean;
  function ReadDWORD(vKey, vName: String): DWORD;
  function RetirarAcentos(Value:String):String;
  function RetirarCabecalho(Value, UF:String;var Data:TDictionary<String,TData>):String;
  function ConverterStrDate(Value:String):TDate;
  function StrEntreStr(Str, StrInicial, StrFinal: String; ComecarDe: Integer = 1): String;
  function ReturnValue(const Source,Value:String;Data:TData):String;Overload;
  function ReturnValue(const Source,Value:String;Count:Integer):String;Overload;
  function ReturnValue(const Source,Value,ValueProx:String):String;Overload;
  function ReturnValue(const Source,Value,ValueProx:String;Start:Integer):String;Overload;
  function GetData(var Dict:TDictionary<String,TData> ;const Value:String):TData;

var
  WebSelfPopup: TWebSelfPopup;

implementation

//Funcao para ler um valor Dword:

function ReadDWORD(vKey, vName: String): DWORD;
var
  iType: DWORD;
  iSize: DWORD;
  iResult: Array [0..3] of Byte;
  hkResult: HKEY;
begin
  Result:=0;
  iType:=REG_DWORD;
  iSize:=4;
  if RegOpenKeyEx(HKEY_LOCAL_MACHINE,LPTSTR(vKey), 0, KEY_READ, hkResult)<>ERROR_SUCCESS then
    Exit;
  if RegQueryValueEx(hkResult,LPTSTR(vName),Nil,@iType,@iResult,@iSize)=ERROR_SUCCESS then
    begin
      Result:=iResult[0]+(iResult[1] SHL 8)+(iResult[2] SHL 16)+(iResult[3] SHL 24);
    end;
end;


//Funcao para escrever um valor DWord:

function WriteDWORD(vKey, vName: String; iValue: DWORD): Boolean;
var
  iType: DWORD;
  iSize: DWORD;
  hkResult: HKEY;
  ibValue: Array [0..3] of Byte;
begin
  Result:=False;
  if RegOpenKeyEx(HKEY_LOCAL_MACHINE,LPTSTR(vKey), 0, KEY_WRITE, hkResult)<>ERROR_SUCCESS then
    Exit;
  iType:=REG_DWORD;
  iSize:=4;
  ibValue[0]:=(iValue AND $000000FF);
  ibValue[1]:=(iValue AND $0000FF00) SHR 8;
  ibValue[2]:=(iValue AND $00FF0000) SHR 16;
  ibValue[3]:=(iValue AND $FF000000) SHR 24;
  if RegSetValueEx(hkResult,LPTSTR(vName),0,iType,@ibValue[0],iSize)=ERROR_SUCCESS then
    Result:=True;
end;

function IEVersao: String;
var
  Reg:TRegistry;
begin
  Reg := TRegistry.Create;
  with Reg do
  begin
    Access  := KEY_READ;
    RootKey := HKEY_LOCAL_MACHINE;
    Openkey('Software\Microsoft\Internet Explorer',false);
    if ValueExists('Version') then
      Result := Copy(ReadString('Version'),0,1)
    else if ValueExists('IVer') then
      Result := Copy(ReadString('IVer'),0,1)
    else
      Result := '0';
    CloseKey;
  end;
end;

function ConverterStrDate(Value:String):TDate;
begin
  try
    Result := StrToDate(Value);
  except
    Result := 0;
  end;

end;

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

function RetirarAcentos(Value:String):String;
var
  strTemp:String;
begin
  strTemp := Trim(StringReplace(Value,#$D#$A,'',[rfReplaceAll,rfIgnoreCase]));
  strTemp := Trim(StringReplace(strTemp,'-',EmptyStr,[rfReplaceAll,rfIgnoreCase]));
  strTemp := Trim(StringReplace(strTemp,'/',EmptyStr,[rfReplaceAll,rfIgnoreCase]));
  strTemp := Trim(StringReplace(strTemp,'.',EmptyStr,[rfReplaceAll,rfIgnoreCase]));
  Result := strTemp;
end;

function RetirarCabecalho(Value, UF:String;var Data:TDictionary<String,TData>):String;
var
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
  else if ((UF=('RJ'))or(UF=('AC'))or(UF=('RR'))or(UF=('TO'))or(UF=('PI'))) then
  begin
    Result := trim(Copy(Value,Pos('Identifica��o do Estabelecimento',Value),Value.Length));
  end
  else if (UF='PR') then
  begin
    Result := trim(Copy(Value,Pos('Data/Hora Host CELEPAR',Value),Value.Length));
  end
  else if (UF='RN') then
  begin
    Result := trim(Copy(Value,Pos('Identifica��o',Value),Value.Length));
  end
  else if (UF='RECEITA') then
  begin
    Result := trim(Copy(Value,Pos('CADASTRO NACIONAL DA PESSOA JUR�DICA',Value),Value.Length));
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
    if Data.Start > 0 then
      Result := ReturnValue(Source,Data.NamePesq,Data.Prox,Data.Start)
    else
      Result := ReturnValue(Source,Data.NamePesq,Data.Prox);;
end;

function ReturnValue(const Source,Value,ValueProx:String;Start:Integer):String;
var
  strValue,StrSource,StrSemEsp:String;
begin
  Result       := EmptyStr;
  StrSemEsp    := StringReplace(Source,#$D#$A,'',[rfReplaceAll,rfIgnoreCase]);
  StrSource    := Trim(copy(StrSemEsp,((Pos(Value,StrSemEsp))+(Length(Value))),Length(StrSemEsp)));
  try
    strValue := Trim(copy(StrSource,Start,Pos(ValueProx,StrSource)-Start));
    Result := Trim(StringReplace(strValue,':','',[rfReplaceAll,rfIgnoreCase]));
  except
    //
  end;
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

procedure TConsultaSintegra.ConsultarSintegra;
begin
  Self.Pessoa := ConsultaSintegra;
end;

constructor TConsultaSintegra.Create(UF:String);
var
  IEEmulation:TWinWebBrowserEmulation;
begin
  Pessoa          := TPessoa.Create;
  Pessoa.UF       := UF;
  Self.FValuePesq := TDictionary<String,TData>.Create;
  LoadClassUF(UpperCase(UF));
  ListPropAtrib;
  IEEmulation := TWinWebBrowserEmulation.Create;
  IEEmulation.EnableBrowserEmulation(TInternetExplorerVersion.IE11);
end;

procedure TConsultaSintegra.LoadClassUF(UF: String);
begin
  case AnsiIndexStr(UpperCase(UF), ['AP','TO','MA','PI','SP','RN','PB','PE','AL',
  'SE','MG','GO','RO','AC','AM','RR','PA','CE','BA','ES','RJ','PR','SC','RS','MS'
  ,'MT','DF','RECEITA']) of
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
    20 : FClassUF := TClassUF_CCC.Create;
//    20 : FClassUF := TClassUF_RJ.Create;
    21 : FClassUF := TClassUF_PR.Create;
    22 : FClassUF := TClassUF_SC.Create;
    23 : FClassUF := TClassUF_RS.Create;
    24 : FClassUF := TClassUF_MS.Create;
    25 : FClassUF := TClassUF_MT.Create;
    26 : FClassUF := TClassUF_DF.Create;
    27 : FClassUF := TClassUF_RECEITA.Create;
    else
    begin
      ShowMessage('Desculpe! N�o foi poss�vel encontrar o UF Informado');
      Abort;
    end;
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
    if frmconsSintegra.ModalResult = mrOk then
    begin
      With Self.Pessoa do
      begin
        CNPJ         := RetirarAcentos(frmconsSintegra.FEdtCNPJ.Text);
        InscEstadual := RetirarAcentos(frmConsSintegra.FEdtInscEst.Text);
        RazaoSocial  := frmConsSintegra.FEdtRazaoSocial.Text;
        Fantasia     := frmConsSintegra.FEdtRazaoSocial.Text;
        Endereco     := frmConsSintegra.FEdtEndereco.Text;
        Numero       := frmConsSintegra.FEdtNumero.Text;
        Complemento  := frmConsSintegra.FEdtComplemento.Text;
        Bairro       := frmConsSintegra.FEdtBairro.Text;
        Cidade       := frmConsSintegra.FEdtCidade.Text;
        UF           := frmConsSintegra.FEdtUF.Text;
        CEP          := RetirarAcentos(frmConsSintegra.FEdtCEP.Text);
        CNAE1        := frmConsSintegra.FEdtCNAE_1.Text;
        EMail        := frmConsSintegra.FEdtEMail.Text;
//        CNAE2        := frmConsSintegra.FEdtCNAE_2.Text;
        Situacao     := frmConsSintegra.FEdtSituacao.Text;
        DataSituacao := ConverterStrDate(frmConsSintegra.FEdtDtaSituacao.Text);
        DataAbertura := ConverterStrDate(frmConsSintegra.FEdtDtaInicAtiv.Text);
        Regime       := frmConsSintegra.FEdtRegime.Text;
        Observacao   := frmConsSintegra.FEdtObservacao.Text;
      end;
    end;
  end
  else
  begin
    ShowMessage('UF n�o Informado');
  end;
  Result := Self.Pessoa;
end;

procedure TConsultaSintegra.ListPropAtrib;
var
  Context: TRttiContext;
  TypObj: TRttiType;
  PropertyObj:TRttiProperty;
  AtributeObj: TCustomAttribute;
  Data: TData;
begin
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
        Data.Start    := TName(AtributeObj).Start;
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
  case AnsiIndexStr(UpperCase(Value), ['AP','TO','MA','PI','SP','RN','PB','PE','AL','SE','MG','GO','RO','AC','AM','RR','PA','CE','BA','ES','RJ','PR','SC','RS','MS','MT','DF','RECEITA']) of
    0  : Self.URL := 'http://sefaz.ap.gov.br/sate/seg/SEGf_AcessarFuncao.jsp?cdFuncao=CAD_011';
    1  : Self.URL := 'https://dfe-portal.svrs.rs.gov.br/NFE/CCC';
    2  : Self.URL := 'http://aplicacoes.ma.gov.br/sintegra/jsp/consultaSintegra/consultaSintegraFiltro.jsf';
    3  : Self.URL := 'https://dfe-portal.svrs.rs.gov.br/NFE/CCC';
    4  : Self.URL := 'https://www.cadesp.fazenda.sp.gov.br/(S(xgg4ul55jnynrhjz0gk3n1vl))/Pages/Cadastro/Consultas/ConsultaPublica/ConsultaPublica.aspx';
    5  : Self.URL := 'https://uvt2.set.rn.gov.br/#/services/consultaContribuinte';
    6  : Self.URL := 'https://www4.sefaz.pb.gov.br/sintegra';
    7  : Self.URL := 'http://efisco.sefaz.pe.gov.br/sfi_trb_gcc/PRConsultarExtratoCadastroContribuinteSINTEGRA';
    8  : Self.URL := 'http://sintegra.sefaz.al.gov.br/#/';
    9  : Self.URL := 'https://security.sefaz.se.gov.br/SIC/sintegra';
    10 : Self.URL := 'http://consultasintegra.fazenda.mg.gov.br/';
    11 : Self.URL := 'https://dfe-portal.svrs.rs.gov.br/NFE/CCC';
    12 : Self.URL := 'https://portalcontribuinte.sefin.ro.gov.br/Publico/parametropublica.jsp';
    13 : Self.URL := 'https://dfe-portal.svrs.rs.gov.br/NFE/CCC';
    14 : Self.URL := 'http://online.sefaz.am.gov.br/sintegra/index.asp';
    15 : Self.URL := 'https://dfe-portal.svrs.rs.gov.br/NFE/CCC';
    16 : Self.URL := 'https://app.sefa.pa.gov.br/Sintegra/';
    17 : Self.URL := 'http://servicos.sefaz.ce.gov.br/internet/Sintegra/Sintegra.Asp?estado=CE';
    18 : Self.URL := 'http://www.sefaz.ba.gov.br/Sintegra/sintegra.asp?estado=BA';
    19 : Self.URL := 'http://www.sintegra.es.gov.br/';
    20 : Self.URL := 'https://dfe-portal.svrs.rs.gov.br/NFE/CCC';
    21 : Self.URL := 'http://www.sintegra.fazenda.pr.gov.br/sintegra/';
    22 : Self.URL := 'http://sistemas3.sef.sc.gov.br/sintegra/consulta_empresa_pesquisa.aspx';
    23 : Self.URL := 'http://www.sefaz.rs.gov.br/consultas/contribuinte';
    24 : Self.URL := 'https://servicos.efazenda.ms.gov.br/consultacci';
    25 : Self.URL := 'https://www.sefaz.mt.gov.br/sid/consulta/infocadastral/consultar/publica';
    26 : Self.URL := 'http://www.fazenda.df.gov.br/area.cfm?id_area=110';
    27 : Self.URL := 'https://www.receita.fazenda.gov.br/pessoajuridica/cnpj/cnpjreva/cnpjreva_solicitacao2.asp';
  end;
end;

{ TFormConsSintegra }

constructor TFormConsSintegra.Create(var ValuesPesq:TDictionary<String,TData>);
begin
  FFrm            := TForm.Create(nil);
  FPnlBrowser     := TPanel.Create(FFrm);
  FPnlDados       := TPanel.Create(FFrm);
  FPnlFooter      := TPanel.Create(FFrm);

  FBrowser        := TWebBrowser.Create(FPnlBrowser);

  FEdtCNPJ        := TLabeledEdit.Create(FPnlDados);
  FEdtInscEst     := TLabeledEdit.Create(FPnlDados);
  FEdtRazaoSocial := TLabeledEdit.Create(FPnlDados);;
  FEdtEmpresaUF   := TLabeledEdit.Create(FPnlDados);
  FEdtCNAE_1      := TLabeledEdit.Create(FPnlDados);
  FEdtCNAE_2      := TLabeledEdit.Create(FPnlDados);
  FEdtSituacao    := TLabeledEdit.Create(FPnlDados);
  FEdtDtaSituacao := TLabeledEdit.Create(FPnlDados);
  FEdtDtaInicAtiv := TLabeledEdit.Create(FPnlDados);
  FEdtEMail       := TLabeledEdit.Create(FPnlDados);
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
    WindowState  := wsMaximized;
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
    Left              := 147;
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
    Left              := 279;
    Width             := 365;
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
    Left              := 654;
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
    Width             := 328;
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
    Left              := 352;
    Width             := 328;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'CNAE-F Secund�rio';
    LabelPosition     := lpAbove;
  end;

  with FEdtSituacao do
  begin
    Parent            := FPnlDados;
    Top               := 115;
    Left              := 15;
    Width             := 160;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'Situa��o';
    LabelPosition     := lpAbove;
  end;

  with FEdtDtaSituacao do
  begin
    Parent            := FPnlDados;
    Top               := 115;
    Left              := 185;
    Width             := 85;
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
    Left              := 280;
    Width             := 80;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'Inicio Atividades';
    LabelPosition     := lpAbove;
  end;

  with FEdtEmail do
  begin
    Parent            := FPnlDados;
    Top               := 115;
    Left              := 370;
    Width             := 310;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'Email';
    LabelPosition     := lpAbove;
  end;

  with FEdtRegime do
  begin
    Parent            := FPnlDados;
    Top               := 160;
    Left              := 15;
    Width             := 160;
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
    Left              := 185;
    Width             := 495;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'Observa��es';
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
    Left              := 411;
    Width             := 268;
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
    EditLabel.Caption := 'Endere�o';
    LabelPosition     := lpAbove;
  end;

  with FEdtNumero do
  begin
    Parent            := FPnlDados;
    Top               := 250;
    Left              := 331;
    Width             := 90;
    Enabled           := True;
    Text              := EmptyStr;
    Font.Size         := 10;
    EditLabel.Caption := 'N�';
    LabelPosition     := lpAbove;
  end;

  with FEdtComplemento do
  begin
    Parent            := FPnlDados;
    Top               := 250;
    Left              := 431;
    Width             := 248;
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
    onClick    := BtnConfirmarOnClick;
    Enabled    := False;
  end;

  with FBtnCancel do
  begin
    Parent     := FPnlFooter;
    ModalResult:= mrCancel;
    Top        := 8;
    Left       := 584;
    Width      := 80;
    Caption    := 'Cancel';
    OnClick    := BtnCancelarOnClick;
    Enabled    := False;
  end;

  with FBtnImportar do
  begin
    Parent     := FPnlFooter;
    ModalResult:= mrNone;
    Top        := 8;
    Left       := 96;
    Width      := 80;
    Caption    := 'Importar';
    OnClick    := BtnImportarOnClick;
    Enabled    := True;
  end;

  FWebSelfPopup   := TWebSelfPopup.CreateHook(FBrowser);
  FModalResult := FFrm.ModalResult;
end;

procedure TFormConsSintegra.Show;
var
  Flags: OLEVariant;
begin
  FBrowser.Navigate(Self.URL, Flags, Flags, Flags, Flags);
  FBrowser.Visible := True;
  FFrm.ShowModal;
  FModalResult := FFrm.ModalResult;
  Self.FFrm.WindowState := wsMaximized;
end;

function TFormConsSintegra.GerarText:string;
var
  pag: IHTMLElement;
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

procedure TFormConsSintegra.BtnCancelarOnClick(Sender: TObject);
begin
  Self.FFrm.Close;
end;

procedure TFormConsSintegra.BtnConfirmarOnClick(Sender: TObject);
begin
  //
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
        if ((Self.UF='RECEITA')or(Self.UF='RJ')or(Self.UF='PI')or(Self.UF='TO')or(Self.UF='RR')or(Self.UF='AC')) then
        begin
          Self.FEdtEmpresaUF.Text    := ReturnValue(Self.Response,Data.NamePesq,Data);
          Self.FEdtUF.Text           := ReturnValue(Self.Response,Data.NamePesq,Data);
        end
        else
        begin
          Self.FEdtEmpresaUF.Text    := Self.UF;
          Self.FEdtUF.Text           := Self.UF;
        end;
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
      18 : Self.FEdtEMail.Text       := ReturnValue(Self.Response,Data.NamePesq,Data);
      19 : Self.FEdtObservacao.Text  := ReturnValue(Self.Response,Data.NamePesq,Data);
    end;
    Self.FFrm.WindowState := wsNormal;
    Self.FBtnOk.Enabled       := True;
    Self.FBtnCancel.Enabled   := True;
    Self.FBtnImportar.Enabled := False;
    FreeAndNil(Data);
  end;
end;

{ TWebSelfPopup }

procedure TWebSelfPopup.OnRedirect(var Message: TMessage);
begin
  FBrowser.Navigate2(FURL, FFlags, FTarget, FPostData, FHeaders);
end;

procedure TWebSelfPopup.OnBeforeNavigate2(Sender: TObject; const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData, Headers: OleVariant; var Cancel: WordBool);
begin
  FURL:=URL;
  FFlags:=FLags;
  FTarget:=NULL;
  FPostData:=PostData;
  FHeaders:=Headers;
  Cancel:=True;
  PostMessage(Handle, WM_REDIRECT, 0, 0);
end;

procedure TWebSelfPopup.OnNewWindow2(Sender: TObject; var ppDisp: IDispatch; var Cancel: WordBool);
begin
  ppDisp:=FPopup.ControlInterface;
end;

constructor TWebSelfPopup.CreateHook(const WebBrowser: TWebBrowser);
begin
  inherited CreateParented(WebBrowser.Handle);
  FBrowser:=WebBrowser;
  FBrowser.OnNewWindow2:=OnNewWindow2;
  FPopup:=TWebBrowser.Create(FBrowser);
//  FPopup.OnBeforeNavigate2 := OnBeforeNavigate2;
end;

destructor TWebSelfPopup.Destroy;
begin
  FBrowser:=nil;
  FreeAndNil(FPopup);
  inherited Destroy;
end;

end.

