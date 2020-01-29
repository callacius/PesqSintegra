unit ClassUF_AL;

interface

uses
  System.Classes,
  System.SysUtils,
  System.StrUtils,
  Dialogs,
  ClassUF;

type

  TClassUF_AL = class(TClassUF)
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
    [TName('Inscrição Estadual','Data da IE')]
    property InscEstadual: String    Read FInscEstadual write FInscEstadual;
    [TName('Razão Social','Logradouro')]
    property RazaoSocial: String     Read FRazaoSocial  write FRazaoSocial;
    property Fantasia: String        Read FFantasia     write FFantasia;
    [TName('UF',3)]
    property UF: String              Read FUF           write FUF;
    [TName('CNAEDescrição','Observaçôes')]
    property CNAE1: String           Read FCNAE1        write FCNAE1;
    property CNAE2: TStringList      Read FCNAE2        write FCNAE2;
    [TName('Situação Cadastral Atual','Endereço Eletrônico')]
    property Situacao: String        Read FSituacao     Write FSituacao;
    property DataSituacao: TDateTime Read FDataSituacao write FDataSituacao;
    [TName('Data da IE',11)]
    property DataAbertura: TDateTime Read FDataAbertura write FDataAbertura;
    property Regime: String          Read FRegime       write FRegime;
    [TName('Logradouro','Número')]
    property Endereco: String        Read FEndereco     write FEndereco;
    [TName('Número','Complemento')]
    property Numero: String          Read FNumero       write FNumero;
    [TName('Complemento','Bairro')]
    property Complemento: String     Read FComplemento  write FComplemento;
    [TName('CEP',8)]
    property CEP: String             Read FCEP          write FCEP;
    [TName('Bairro','UF')]
    property Bairro: String          Read FBairro       write FBairro;
    [TName('Município','CEP')]
    property Cidade: String          Read FCidade       Write FCidade;
    [TName('Telefone','Atividade')]
    property Telefone: String        Read FTelefone     Write FTelefone;
    [TName('Endereço Eletrônico','global.ribbon.')]
    property EMail: String           Read FEMail        Write FEMail;
    [TName('Observaçôes','Situação Cadastral')]
    property Observacao: String     Read FObservacao    Write FObservacao;
  end;

implementation

end.
