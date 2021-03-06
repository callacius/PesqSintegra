unit ClassUF_MA;

interface

uses
  System.Classes,
  System.SysUtils,
  System.StrUtils,
  Dialogs,
  ClassUF;

type

  TClassUF_MA = class(TClassUF)
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
    [TName('CGC',20)]
    property CNPJ: String            Read FCNPJ         write FCNPJ;
    [TName('Inscri��o Estadual','Raz�o Social')]
    property InscEstadual: String    Read FInscEstadual write FInscEstadual;
    [TName('Raz�o Social','Regime Apura��o')]
    property RazaoSocial: String     Read FRazaoSocial  write FRazaoSocial;
    [TName('Nome Fantasia','Data In�cio Atividade')]
    property Fantasia: String        Read FFantasia     write FFantasia;
    [TName('UF',7,'CNPJ')]
    property UF: String              Read FUF           write FUF;
    [TName('CNAE Principal','Situa��o Cadastral Vigente')]
    property CNAE1: String           Read FCNAE1        write FCNAE1;
    property CNAE2: TStringList      Read FCNAE2        write FCNAE2;
    [TName('Situa��o Cadastral Vigente','Data desta Situa��o Cadastral')]
    property Situacao: String        Read FSituacao     Write FSituacao;
    [TName('Data desta Situa��o Cadastral','OBRIGA��ES')]
    property DataSituacao: TDateTime Read FDataSituacao write FDataSituacao;
    property DataAbertura: TDateTime Read FDataAbertura write FDataAbertura;
    [TName('Regime Apura��o','ENDERE�O')]
    property Regime: String          Read FRegime       write FRegime;
    [TName('Logradouro','N�mero')]
    property Endereco: String        Read FEndereco     write FEndereco;
    [TName('N�mero','Complemento')]
    property Numero: String          Read FNumero       write FNumero;
    [TName('Complemento','Bairro')]
    property Complemento: String     Read FComplemento  write FComplemento;
    [TName('CEP','DDD')]
    property CEP: String             Read FCEP          write FCEP;
    [TName('Bairro','Munic�pio')]
    property Bairro: String          Read FBairro       write FBairro;
    [TName('Munic�pio','UF:')]
    property Cidade: String          Read FCidade       Write FCidade;
    [TName('Telefone','INFORMA��ES COMPLEMENTARES')]
    property Telefone: String        Read FTelefone     Write FTelefone;
    property EMail: String           Read FEMail        Write FEMail;
    [TName('Observa��o','Data da Consulta')]
    property Observacao: String      Read FObservacao   Write FObservacao;
  end;

implementation

end.

