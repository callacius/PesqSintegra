unit ClassUF_AM;

interface

uses
  System.Classes,
  System.SysUtils,
  System.StrUtils,
  Dialogs,
  ClassUF;

type

  TClassUF_AM = class(TClassUF)
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
    [TName('C.N.P.J',20)]
    property CNPJ: String            Read FCNPJ         write FCNPJ;
    [TName('Inscri��o Estadual','Raz�o Social')]
    property InscEstadual: String    Read FInscEstadual write FInscEstadual;
    [TName('Raz�o Social','Tipo de Unidade Auxiliar')]
    property RazaoSocial: String     Read FRazaoSocial  write FRazaoSocial;
    property Fantasia: String        Read FFantasia     write FFantasia;
    [TName('UF',3)]
    property UF: String              Read FUF           write FUF;
    [TName('CNAE Principal','CNAE Secund�rio')]
    property CNAE1: String           Read FCNAE1        write FCNAE1;
    property CNAE2: TStringList      Read FCNAE2        write FCNAE2;
    [TName('Situa��o Cadastral Vigente','DATA DA CONSULTA')]
    property Situacao: String        Read FSituacao     Write FSituacao;
    [TName('DATA DA CONSULTA',12)]
    property DataSituacao: TDateTime Read FDataSituacao write FDataSituacao;
    [TName('In�cio de Atividades','Situa��o Cadastral Vigente')]
    property DataAbertura: TDateTime Read FDataAbertura write FDataAbertura;
    [TName('Regime de Apura��o','Atividade Econ�mica:')]
    property Regime: String          Read FRegime       write FRegime;
    [TName('Logradouro','N�mero')]
    property Endereco: String        Read FEndereco     write FEndereco;
    [TName('N�mero','Complemento:')]
    property Numero: String          Read FNumero       write FNumero;
    [TName('Complemento','Bairro')]
    property Complemento: String     Read FComplemento  write FComplemento;
    [TName('CEP',10)]
    property CEP: String             Read FCEP          write FCEP;
    [TName('Bairro','Munic�pio')]
    property Bairro: String          Read FBairro       write FBairro;
    [TName('Munic�pio','UF: ')]
    property Cidade: String          Read FCidade       Write FCidade;
    [TName('Telefone','INFORMA��ES COMPLEMENTARES')]
    property Telefone: String        Read FTelefone     Write FTelefone;
    property EMail: String           Read FEMail        Write FEMail;
    property Observacao: String      Read FObservacao   Write FObservacao;
  end;

implementation

end.
