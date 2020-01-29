unit ClassUF_PE;

interface

uses
  System.Classes,
  System.SysUtils,
  System.StrUtils,
  Dialogs,
  ClassUF;

type

  TClassUF_PE = class(TClassUF)
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
    [TName('CPF/CNPJ',20)]
    property CNPJ: String            Read FCNPJ         write FCNPJ;
    [TName('Inscrição estadual',12)]
    property InscEstadual: String    Read FInscEstadual write FInscEstadual;
    [TName('Razão social','Endereço')]
    property RazaoSocial: String     Read FRazaoSocial  write FRazaoSocial;
    [TName('Nome Fantasia','Natureza Jurídica:')]
    property Fantasia: String        Read FFantasia     write FFantasia;
    [TName('UF',3)]
    property UF: String              Read FUF           write FUF;
    [TName('CNAE Fiscal','CNAE Secundário')]
    property CNAE1: String           Read FCNAE1        write FCNAE1;
    property CNAE2: TStringList      Read FCNAE2        write FCNAE2;
    [TName('Situação cadastral atual','Data desta situação cadastral')]
    property Situacao: String        Read FSituacao     Write FSituacao;
    [TName('Data',11)]
    property DataSituacao: TDateTime Read FDataSituacao write FDataSituacao;
    [TName('Data desta situação cadastral',10)]
    property DataAbertura: TDateTime Read FDataAbertura write FDataAbertura;
    [TName('Regime de Apuração','Atividade Econômica:')]
    property Regime: String          Read FRegime       write FRegime;
    [TName('Logradouro','Número')]
    property Endereco: String        Read FEndereco     write FEndereco;
    [TName('Número','Complemento')]
    property Numero: String          Read FNumero       write FNumero;
    [TName('Complemento','Bairro')]
    property Complemento: String     Read FComplemento  write FComplemento;
    [TName('CEP',10)]
    property CEP: String             Read FCEP          write FCEP;
    [TName('Bairro','Município/UF')]
    property Bairro: String          Read FBairro       write FBairro;
    [TName('Município/UF','- MT')]
    property Cidade: String          Read FCidade       Write FCidade;
    [TName('Telefone','Informações Complementares')]
    property Telefone: String        Read FTelefone     Write FTelefone;
    property EMail: String           Read FEMail        Write FEMail;
    property Observacao: String      Read FObservacao   Write FObservacao;
  end;

implementation

end.
