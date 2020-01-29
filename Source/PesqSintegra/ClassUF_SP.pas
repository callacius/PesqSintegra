unit ClassUF_SP;

interface

uses
  System.Classes,
  System.SysUtils,
  System.StrUtils,
  Dialogs,
  ClassUF;

type

  TClassUF_SP = class(TClassUF)
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
    [TName('IE',16)]
    property InscEstadual: String    Read FInscEstadual write FInscEstadual;
    [TName('Nome Empresarial','Nome Fantasia')]
    property RazaoSocial: String     Read FRazaoSocial  write FRazaoSocial;
    [TName('Nome Fantasia','Natureza Jur�dica:')]
    property Fantasia: String        Read FFantasia     write FFantasia;
    [TName('UF',3)]
    property UF: String              Read FUF           write FUF;
    [TName('Atividade Econ�mica','Data de Credenciamento como emissor de NF-e:')]
    property CNAE1: String           Read FCNAE1        write FCNAE1;
    property CNAE2: TStringList      Read FCNAE2        write FCNAE2;
    [TName('Situa��o Cadastral','Data da Situa��o Cadastral')]
    property Situacao: String        Read FSituacao     Write FSituacao;
    [TName('Data da Situa��o Cadastral','Ocorr�ncia Fiscal')]
    property DataSituacao: TDateTime Read FDataSituacao write FDataSituacao;
    property DataAbertura: TDateTime Read FDataAbertura write FDataAbertura;
    [TName('Regime de Apura��o','Atividade Econ�mica:')]
    property Regime: String          Read FRegime       write FRegime;
    [TName('Logradouro','N�:')]
    property Endereco: String        Read FEndereco     write FEndereco;
    [TName('N�','Complemento:')]
    property Numero: String          Read FNumero       write FNumero;
    [TName('Complemento','CEP')]
    property Complemento: String     Read FComplemento  write FComplemento;
    [TName('CEP',12)]
    property CEP: String             Read FCEP          write FCEP;
    [TName('Bairro','Munic�pio')]
    property Bairro: String          Read FBairro       write FBairro;
    [TName('Munic�pio','UF: ')]
    property Cidade: String          Read FCidade       Write FCidade;
    property Telefone: String        Read FTelefone     Write FTelefone;
    property EMail: String           Read FEMail        Write FEMail;
    property Observacao: String      Read FObservacao   Write FObservacao;
  end;

implementation

end.
