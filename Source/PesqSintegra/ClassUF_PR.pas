unit ClassUF_PR;

interface

uses
  System.Classes,
  System.SysUtils,
  System.StrUtils,
  Dialogs,
  ClassUF;

type

  TClassUF_PR = class(TClassUF)
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
    [TName('Inscri��o Estadual','Nome Empresarial')]
    property InscEstadual: String    Read FInscEstadual write FInscEstadual;
    [TName('Nome Empresarial','ENDERE�O')]
    property RazaoSocial: String     Read FRazaoSocial  write FRazaoSocial;
    property Fantasia: String        Read FFantasia     write FFantasia;
    [TName('UF',3)]
    property UF: String              Read FUF           write FUF;
    [TName('Atividade Econ�mica Principal','In�cio das Atividades')]
    property CNAE1: String           Read FCNAE1        write FCNAE1;
    property CNAE2: TStringList      Read FCNAE2        write FCNAE2;
    [TName('Situa��o Cadastral','SPED (EFD, NF-e, CT-e)')]
    property Situacao: String        Read FSituacao     Write FSituacao;
    property DataSituacao: TDateTime Read FDataSituacao write FDataSituacao;
    [TName('In�cio das Atividades','Situa��o Atual')]
    property DataAbertura: TDateTime Read FDataAbertura write FDataAbertura;
    [TName('Regime de Apura��o de ICMS','C�digo e Descri��o da Atividade Econ�mica Principal')]
    property Regime: String          Read FRegime       write FRegime;
    [TName('Logradouro','N�mero:')]
    property Endereco: String        Read FEndereco     write FEndereco;
    [TName('N�mero','Complemento:')]
    property Numero: String          Read FNumero       write FNumero;
    [TName('Complemento','Bairro:')]
    property Complemento: String     Read FComplemento  write FComplemento;
    [TName('CEP',10)]
    property CEP: String             Read FCEP          write FCEP;
    [TName('Bairro','Munic�pio:')]
    property Bairro: String          Read FBairro       write FBairro;
    [TName('Munic�pio','UF:')]
    property Cidade: String          Read FCidade       Write FCidade;
    [TName('Telefone','E-mail')]
    property Telefone: String        Read FTelefone     Write FTelefone;
    [TName('E-mail','INFORMA��ES COMPLEMENTARES')]
    property EMail: String           Read FEMail        Write FEMail;
    [TName('OBSERVA��O','Consultar novo contribuinte do Paran�')]
    property Observacao: String      Read FObservacao   Write FObservacao;
  end;

implementation

end.
