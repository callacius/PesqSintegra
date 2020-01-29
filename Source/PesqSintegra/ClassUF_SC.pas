unit ClassUF_SC;

interface

uses
  System.Classes,
  System.SysUtils,
  System.StrUtils,
  Dialogs,
  ClassUF;

type

  TClassUF_SC = class(TClassUF)
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
    [TName('CPF/CNPJ',16)]
    property CNPJ: String            Read FCNPJ         write FCNPJ;
    [TName('Inscri��o Estadual',11)]
    property InscEstadual: String    Read FInscEstadual write FInscEstadual;
    [TName('Nome/Raz�o Estadual','ENDERE�O')]
    property RazaoSocial: String     Read FRazaoSocial  write FRazaoSocial;
    property Fantasia: String        Read FFantasia     write FFantasia;
    [TName('UF',3)]
    property UF: String              Read FUF           write FUF;
    [TName('C�digo e Descri��o da Atividade Econ�mica Principal ','Contribuinte credenciado a emitir os seguintes documentos eletr�nicos abaixo')]
    property CNAE1: String           Read FCNAE1        write FCNAE1;
    property CNAE2: TStringList      Read FCNAE2        write FCNAE2;
    [TName('Situa��o Cadastral Atual','Data desta Situa��o Cadastral')]
    property Situacao: String        Read FSituacao     Write FSituacao;
    [TName('Data desta Situa��o Cadastral',13)]
    property DataSituacao: TDateTime Read FDataSituacao write FDataSituacao;
    [TName('Data de In�cio de Atividade',13)]
    property DataAbertura: TDateTime Read FDataAbertura write FDataAbertura;
    [TName('Regime de Apura��o de ICMS','C�digo e Descri��o da Atividade Econ�mica Principal')]
    property Regime: String          Read FRegime       write FRegime;
    [TName('Logradouro','N�mero')]
    property Endereco: String        Read FEndereco     write FEndereco;
    [TName('N�mero','Complemento')]
    property Numero: String          Read FNumero       write FNumero;
    [TName('Complemento','Bairro')]
    property Complemento: String     Read FComplemento  write FComplemento;
    [TName('CEP',10)]
    property CEP: String             Read FCEP          write FCEP;
    [TName('Bairro','UF:')]
    property Bairro: String          Read FBairro       write FBairro;
    [TName('Munic�pio','CEP:')]
    property Cidade: String          Read FCidade       Write FCidade;
    [TName('Telefone','INFORMA��ES COMPLEMENTARES')]
    property Telefone: String        Read FTelefone     Write FTelefone;
    property EMail: String           Read FEMail        Write FEMail;
    property Observacao: String      Read FObservacao   Write FObservacao;
  end;

implementation

end.
