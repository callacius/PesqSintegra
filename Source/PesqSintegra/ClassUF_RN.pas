unit ClassUF_RN;

interface

uses
  System.Classes,
  System.SysUtils,
  System.StrUtils,
  Dialogs,
  ClassUF;

type

  TClassUF_RN = class(TClassUF)
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
    [TName('CNPJ/CPF',20)]
    property CNPJ: String            Read FCNPJ         write FCNPJ;
    [TName('Inscrição Estadual','CNPJ/CPF')]
    property InscEstadual: String    Read FInscEstadual write FInscEstadual;
    [TName('Razão Social','Nome Fantasia')]
    property RazaoSocial: String     Read FRazaoSocial  write FRazaoSocial;
    [TName('Nome Fantasia','Natureza Jurídica')]
    property Fantasia: String        Read FFantasia     write FFantasia;
    [TName('UF',3)]
    property UF: String              Read FUF           write FUF;
    [TName('Atividade Econômica (CNAE) Principal','Situação Cadastral')]
    property CNAE1: String           Read FCNAE1        write FCNAE1;
    property CNAE2: TStringList      Read FCNAE2        write FCNAE2;
    [TName('Situação Cadastral','Situação Cadastral Atualizada em')]
    property Situacao: String        Read FSituacao     Write FSituacao;
    [TName('Cadastro Atualizado em',10)]
    property DataSituacao: TDateTime Read FDataSituacao write FDataSituacao;
    [TName('Início de Atividade Comercial',10)]
    property DataAbertura: TDateTime Read FDataAbertura write FDataAbertura;
    [TName('Regime de Pagamento','Início de Atividade Comercial')]
    property Regime: String          Read FRegime       write FRegime;
    [TName('Endereço do Estabelecimento','CEP:')]
    property Endereco: String        Read FEndereco     write FEndereco;
    property Numero: String          Read FNumero       write FNumero;
    property Complemento: String     Read FComplemento  write FComplemento;
    [TName('CEP',10)]
    property CEP: String             Read FCEP          write FCEP;
    property Bairro: String          Read FBairro       write FBairro;
    [TName('CEP:',11,'Endereço para Correspondência')]
    property Cidade: String          Read FCidade       Write FCidade;
    [TName('Telefone','Informações Complementares')]
    property Telefone: String        Read FTelefone     Write FTelefone;
    property EMail: String           Read FEMail        Write FEMail;
    [TName('Observação','Detalhes da Inscrição')]
    property Observacao: String      Read FObservacao   Write FObservacao;
  end;

implementation

end.

