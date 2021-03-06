unit ClassUF_RJ;

interface

uses
  System.Classes,
  System.SysUtils,
  System.StrUtils,
  Dialogs,
  ClassUF;

type

  TClassUF_RJ = class(TClassUF)
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
    [TName('CNPJ:',20)]
    property CNPJ: String            Read FCNPJ         write FCNPJ;
    [TName('Inscri��o Estadual (IE)','Situa��o IE')]
    property InscEstadual: String    Read FInscEstadual write FInscEstadual;
    [TName('Nome da Empresa','UF')]
    property RazaoSocial: String     Read FRazaoSocial  write FRazaoSocial;
    [TName('Nome Fantasia','Data In�cio Atividade')]
    property Fantasia: String        Read FFantasia     write FFantasia;
    [TName('UF',7,'CNPJ')]
    property UF: String              Read FUF           write FUF;
    [TName('CNAE Principal','Dados de Endere�o')]
    property CNAE1: String           Read FCNAE1        write FCNAE1;
    property CNAE2: TStringList      Read FCNAE2        write FCNAE2;
    [TName('Situa��o IE','Tipo IE')]
    property Situacao: String        Read FSituacao     Write FSituacao;
    [TName('Data Situa��o na UF','Dados do Contribuinte')]
    property DataSituacao: TDateTime Read FDataSituacao write FDataSituacao;
    [TName('Data In�cio Atividade','Data Fim Atividade')]
    property DataAbertura: TDateTime Read FDataAbertura write FDataAbertura;
    [TName('Regime de Apura��o','Informa��o da IE como Destinat�rio')]
    property Regime: String          Read FRegime       write FRegime;
    [TName('Logradouro','Nro')]
    property Endereco: String        Read FEndereco     write FEndereco;
    [TName('Nro','Complemento:')]
    property Numero: String          Read FNumero       write FNumero;
    [TName('Complemento','Bairro')]
    property Complemento: String     Read FComplemento  write FComplemento;
    [TName('CEP','Processando')]
    property CEP: String             Read FCEP          write FCEP;
    [TName('Bairro','CEP')]
    property Bairro: String          Read FBairro       write FBairro;
    [TName('Munic�pio IBGE',14,'UF de Localiza��o')]
    property Cidade: String          Read FCidade       Write FCidade;
    property Telefone: String        Read FTelefone     Write FTelefone;
    property EMail: String           Read FEMail        Write FEMail;
    property Observacao: String      Read FObservacao   Write FObservacao;
  end;

implementation

end.
