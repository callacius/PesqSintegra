unit ClassUF_RECEITA;

interface

uses
  System.Classes,
  System.SysUtils,
  System.StrUtils,
  Dialogs,
  ClassUF;

type

  TClassUF_RECEITA = class(TClassUF)
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
    [TName('NÚMERO DE INSCRIÇÃO',20)]
    property CNPJ: String            Read FCNPJ         write FCNPJ;
    property InscEstadual: String    Read FInscEstadual write FInscEstadual;
    [TName('NOME EMPRESARIAL','TÍTULO DO ESTABELECIMENTO (NOME DE FANTASIA)')]
    property RazaoSocial: String     Read FRazaoSocial  write FRazaoSocial;
    [TName('TÍTULO DO ESTABELECIMENTO (NOME DE FANTASIA)','CÓDIGO E DESCRIÇÃO DA ATIVIDADE ECONÔMICA PRINCIPAL')]
    property Fantasia: String        Read FFantasia     write FFantasia;
    [TName('UF',4)]
    property UF: String              Read FUF           write FUF;
    [TName('CÓDIGO E DESCRIÇÃO DA ATIVIDADE ECONÔMICA PRINCIPAL','CÓDIGO E DESCRIÇÃO DAS ATIVIDADES ECONÔMICAS SECUNDÁRIAS')]
    property CNAE1: String           Read FCNAE1        write FCNAE1;
    property CNAE2: TStringList      Read FCNAE2        write FCNAE2;
    property Situacao: String        Read FSituacao     Write FSituacao;
    [TName('DATA DA SITUAÇÃO CADASTRAL ','MOTIVO DE SITUAÇÃO CADASTRAL')]
    property DataSituacao: TDateTime Read FDataSituacao write FDataSituacao;
    [TName('DATA DE ABERTURA  ','NOME EMPRESARIAL  ')]
    property DataAbertura: TDateTime Read FDataAbertura write FDataAbertura;
    property Regime: String          Read FRegime       write FRegime;
    [TName('LOGRADOURO','NÚMERO  ')]
    property Endereco: String        Read FEndereco     write FEndereco;
    [TName('NÚMERO  ','COMPLEMENTO')]
    property Numero: String          Read FNumero       write FNumero;
    [TName('COMPLEMENTO','CEP')]
    property Complemento: String     Read FComplemento  write FComplemento;
    [TName('CEP','BAIRRO/DISTRITO')]
    property CEP: String             Read FCEP          write FCEP;
    [TName('BAIRRO/DISTRITO','MUNICÍPIO')]
    property Bairro: String          Read FBairro       write FBairro;
    [TName('MUNICÍPIO','UF')]
    property Cidade: String          Read FCidade       Write FCidade;
    [TName('TELEFONE','ENTE FEDERATIVO RESPONSÁVEL (EFR)')]
    property Telefone: String        Read FTelefone     Write FTelefone;
    [TName('ENDEREÇO ELETRÔNICO','TELEFONE')]
    property EMail: String           Read FEMail        Write FEMail;
    property Observacao: String      Read FObservacao   Write FObservacao;
  end;

implementation

end.
