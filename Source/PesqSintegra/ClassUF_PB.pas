unit ClassUF_PB;

interface

uses
  System.Classes,
  System.SysUtils,
  System.StrUtils,
  Dialogs,
  ClassUF;
type

  TClassUF_PB = class(TClassUF)
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
    FEMail:String;
    FObservacao:String;
  public
    [TName('CNPJ',20)]
    property CNPJ: String            Read FCNPJ         write FCNPJ;
    [TName('Inscri��o Estadual',12)]
    property InscEstadual: String    Read FInscEstadual write FInscEstadual;
    [TName('Raz�o Social','Logradouro')]
    property RazaoSocial: String     Read FRazaoSocial  write FRazaoSocial;
    property Fantasia: String        Read FFantasia     write FFantasia;
    [TName('UF',3)]
    property UF: String              Read FUF           write FUF;
    [TName('Atividade Econ�mica','Regime de Pagamento')]
    property CNAE1: String           Read FCNAE1        write FCNAE1;
    property CNAE2: TStringList      Read FCNAE2        write FCNAE2;
    [TName('Situa��o Cadastral Vigente','Data da �ltima Atualiza��o Cadastral')]
    property Situacao: String        Read FSituacao     Write FSituacao;
    [TName('Data da �ltima Atualiza��o Cadastral',10)]
    property DataSituacao: TDateTime Read FDataSituacao write FDataSituacao;
    property DataAbertura: TDateTime Read FDataAbertura write FDataAbertura;
    [TName('Regime de Pagamento','Situa��o Cadastral Vigente')]
    property Regime: String          Read FRegime       write FRegime;
    [TName('Logradouro','N�mero')]
    property Endereco: String        Read FEndereco     write FEndereco;
    [TName('N�mero','Complemento:')]
    property Numero: String          Read FNumero       write FNumero;
    [TName('Complemento','Bairro')]
    property Complemento: String     Read FComplemento  write FComplemento;
    [TName('CEP',9)]
    property CEP: String             Read FCEP          write FCEP;
    [TName('Bairro','Munic�pio')]
    property Bairro: String          Read FBairro       write FBairro;
    [TName('Munic�pio','CEP ')]
    property Cidade: String          Read FCidade       Write FCidade;
    [TName('Telefone','Atividade Econ�mica')]
    property Telefone: String        Read FTelefone     Write FTelefone;
    property EMail: String           Read FEMail        Write FEMail;
    property Observacao: String      Read FObservacao   Write FObservacao;
  end;

implementation

end.
