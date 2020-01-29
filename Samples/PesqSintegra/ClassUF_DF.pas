unit ClassUF_DF;

interface

uses
  System.Classes, Dialogs, System.SysUtils, System.StrUtils, ClassUF;

type

  TClassUF_DF = class(TClassUF)
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
    [TName('CNPJ/CPF',13)]
    property CNPJ: String            Read FCNPJ         write FCNPJ;
    [TName('CF/DF',12)]
    property InscEstadual: String    Read FInscEstadual write FInscEstadual;
    [TName('RAZ�O SOCIAL','NOME FANTASIA')]
    property RazaoSocial: String     Read FRazaoSocial  write FRazaoSocial;
    [TName('NOME FANTASIA','ENDERE�O')]
    property Fantasia: String        Read FFantasia     write FFantasia;
    [TName('UF',3)]
    property UF: String              Read FUF           write FUF;
    [TName('ATIVIDADE PRINCIPAL','ATIVIDADE SECUND�RIA')]
    property CNAE1: String           Read FCNAE1        write FCNAE1;
    property CNAE2: TStringList      Read FCNAE2        write FCNAE2;
    [TName('SITUA��O CADASTRAL','DATA DESSA SITUA��O CADASTRAL')]
    property Situacao: String        Read FSituacao     Write FSituacao;
    [TName('DATA DESSA SITUA��O CADASTRAL',10)]
    property DataSituacao: TDateTime Read FDataSituacao write FDataSituacao;
    property DataAbertura: TDateTime Read FDataAbertura write FDataAbertura;
    [TName('REGIME DE APURA��O','SITUA��O CADASTRAL')] //DATA DESSA SITUA��O CADASTRAL
    property Regime: String          Read FRegime       write FRegime;
    [TName('LOGRADOURO','N�MERO')]
    property Endereco: String        Read FEndereco     write FEndereco;
    [TName('N�MERO','Complemento')]
    property Numero: String          Read FNumero       write FNumero;
    [TName('Complemento','BAIRRO')]
    property Complemento: String     Read FComplemento  write FComplemento;
    [TName('CEP','Telefone')]
    property CEP: String             Read FCEP          write FCEP;
    [TName('BAIRRO','MUNIC�PIO')]
    property Bairro: String          Read FBairro       write FBairro;
    [TName('MUNIC�PIO','UF')]
    property Cidade: String          Read FCidade       Write FCidade;
    [TName('Telefone','INFORMA��ES COMPLEMENTARES')]
    property Telefone: String        Read FTelefone     Write FTelefone;
    property EMail: String           Read FEMail        Write FEMail;
    property Observacao: String      Read FObservacao   Write FObservacao;
  end;

implementation

end.

