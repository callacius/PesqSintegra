unit ClassUF_MS;

interface

uses
  System.Classes, Dialogs, System.SysUtils, System.StrUtils, ClassUF;

type

  TClassUF_MS = class(TClassUF)
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
    [TName('Inscrição Estadual',13)]
    property InscEstadual: String    Read FInscEstadual write FInscEstadual;
    [TName('Razão Social/Nome','Descrição da Atividade')]
    property RazaoSocial: String     Read FRazaoSocial  write FRazaoSocial;
    property Fantasia: String        Read FFantasia     write FFantasia;
    [TName('UF',3)]
    property UF: String              Read FUF           write FUF;
    [TName('Descrição da Atividade','Logradouro')]
    property CNAE1: String           Read FCNAE1        write FCNAE1;
    property CNAE2: TStringList      Read FCNAE2        write FCNAE2;
    [TName('Motivo da Situação','Consulta Realizada no dia')]
    property Situacao: String        Read FSituacao     Write FSituacao;
    [TName('Consulta Realizada no dia',10)]
    property DataSituacao: TDateTime Read FDataSituacao write FDataSituacao;
    [TName('Data de Início da Atividade',10)]
    property DataAbertura: TDateTime Read FDataAbertura write FDataAbertura;
    [TName('Regime de Apuração','Atividade Econômica:')]
    property Regime: String          Read FRegime       write FRegime;
    [TName('Logradouro','Numero')]
    property Endereco: String        Read FEndereco     write FEndereco;
    [TName('Numero','Complemento')]
    property Numero: String          Read FNumero       write FNumero;
    [TName('Complemento','CEP')]
    property Complemento: String     Read FComplemento  write FComplemento;
    [TName('CEP',10)]
    property CEP: String             Read FCEP          write FCEP;
    [TName('Bairro','Município')]
    property Bairro: String          Read FBairro       write FBairro;
    [TName('Município','UF')]
    property Cidade: String          Read FCidade       Write FCidade;
    [TName('Telefone','Informações Complementares')]
    property Telefone: String        Read FTelefone     Write FTelefone;
    property EMail: String           Read FEMail        Write FEMail;
    property Observacao: String      Read FObservacao   Write FObservacao;
  end;

implementation

end.
