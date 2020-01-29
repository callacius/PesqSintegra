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
    [TName('Nome Fantasia','Natureza Jurídica:')]
    property Fantasia: String        Read FFantasia     write FFantasia;
    [TName('UF',3)]
    property UF: String              Read FUF           write FUF;
    [TName('Atividade Econômica','Data de Credenciamento como emissor de NF-e:')]
    property CNAE1: String           Read FCNAE1        write FCNAE1;
    property CNAE2: TStringList      Read FCNAE2        write FCNAE2;
    [TName('Situação Cadastral','Data da Situação Cadastral')]
    property Situacao: String        Read FSituacao     Write FSituacao;
    [TName('Data da Situação Cadastral','Ocorrência Fiscal')]
    property DataSituacao: TDateTime Read FDataSituacao write FDataSituacao;
    property DataAbertura: TDateTime Read FDataAbertura write FDataAbertura;
    [TName('Regime de Apuração','Atividade Econômica:')]
    property Regime: String          Read FRegime       write FRegime;
    [TName('Logradouro','Nº:')]
    property Endereco: String        Read FEndereco     write FEndereco;
    [TName('Nº','Complemento:')]
    property Numero: String          Read FNumero       write FNumero;
    [TName('Complemento','CEP')]
    property Complemento: String     Read FComplemento  write FComplemento;
    [TName('CEP',12)]
    property CEP: String             Read FCEP          write FCEP;
    [TName('Bairro','Município')]
    property Bairro: String          Read FBairro       write FBairro;
    [TName('Município','UF: ')]
    property Cidade: String          Read FCidade       Write FCidade;
    property Telefone: String        Read FTelefone     Write FTelefone;
    property EMail: String           Read FEMail        Write FEMail;
    property Observacao: String      Read FObservacao   Write FObservacao;
  end;

implementation

end.
