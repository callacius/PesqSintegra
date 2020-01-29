unit ClassUF_RN;

interface

uses
  System.Classes, Dialogs, System.SysUtils, System.StrUtils, ClassUF;

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
    [TName('CNPJ',20)]
    property CNPJ: String            Read FCNPJ         write FCNPJ;
    [TName('Inscrição Estadual',11)]
    property InscEstadual: String    Read FInscEstadual write FInscEstadual;
    [TName('Nome Empresarial','ENDEREÇO')]
    property RazaoSocial: String     Read FRazaoSocial  write FRazaoSocial;
    property Fantasia: String        Read FFantasia     write FFantasia;
    [TName('UF',3)]
    property UF: String              Read FUF           write FUF;
    [TName('Atividade Econômica Principal','Atividade(s) Econômica(s) Secundária(s)')]
    property CNAE1: String           Read FCNAE1        write FCNAE1;
    property CNAE2: TStringList      Read FCNAE2        write FCNAE2;
    [TName('Situação Cadastral','SPED (EFD, NF-e, CT-e)')]
    property Situacao: String        Read FSituacao     Write FSituacao;
    property DataSituacao: TDateTime Read FDataSituacao write FDataSituacao;
    property DataAbertura: TDateTime Read FDataAbertura write FDataAbertura;
    [TName('Regime de Apuração de ICMS','Código e Descrição da Atividade Econômica Principal')]
    property Regime: String          Read FRegime       write FRegime;
    [TName('Logradouro','Número:')]
    property Endereco: String        Read FEndereco     write FEndereco;
    [TName('Número','Complemento:')]
    property Numero: String          Read FNumero       write FNumero;
    [TName('Complemento','Bairro:')]
    property Complemento: String     Read FComplemento  write FComplemento;
    [TName('CEP',10)]
    property CEP: String             Read FCEP          write FCEP;
    [TName('Bairro','Município:')]
    property Bairro: String          Read FBairro       write FBairro;
    [TName('Município','UF:')]
    property Cidade: String          Read FCidade       Write FCidade;
    [TName('Telefone',13)]
    property Telefone: String        Read FTelefone     Write FTelefone;
    property EMail: String           Read FEMail        Write FEMail;
    property Observacao: String      Read FObservacao   Write FObservacao;
  end;

implementation

end.

