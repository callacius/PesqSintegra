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
    [TName('N�MERO DE INSCRI��O',20)]
    property CNPJ: String            Read FCNPJ         write FCNPJ;
    property InscEstadual: String    Read FInscEstadual write FInscEstadual;
    [TName('NOME EMPRESARIAL','T�TULO DO ESTABELECIMENTO (NOME DE FANTASIA)')]
    property RazaoSocial: String     Read FRazaoSocial  write FRazaoSocial;
    [TName('T�TULO DO ESTABELECIMENTO (NOME DE FANTASIA)','C�DIGO E DESCRI��O DA ATIVIDADE ECON�MICA PRINCIPAL')]
    property Fantasia: String        Read FFantasia     write FFantasia;
    [TName('UF',4)]
    property UF: String              Read FUF           write FUF;
    [TName('C�DIGO E DESCRI��O DA ATIVIDADE ECON�MICA PRINCIPAL','C�DIGO E DESCRI��O DAS ATIVIDADES ECON�MICAS SECUND�RIAS')]
    property CNAE1: String           Read FCNAE1        write FCNAE1;
    property CNAE2: TStringList      Read FCNAE2        write FCNAE2;
    property Situacao: String        Read FSituacao     Write FSituacao;
    [TName('DATA DA SITUA��O CADASTRAL ','MOTIVO DE SITUA��O CADASTRAL')]
    property DataSituacao: TDateTime Read FDataSituacao write FDataSituacao;
    [TName('DATA DE ABERTURA  ','NOME EMPRESARIAL  ')]
    property DataAbertura: TDateTime Read FDataAbertura write FDataAbertura;
    property Regime: String          Read FRegime       write FRegime;
    [TName('LOGRADOURO','N�MERO  ')]
    property Endereco: String        Read FEndereco     write FEndereco;
    [TName('N�MERO  ','COMPLEMENTO')]
    property Numero: String          Read FNumero       write FNumero;
    [TName('COMPLEMENTO','CEP')]
    property Complemento: String     Read FComplemento  write FComplemento;
    [TName('CEP','BAIRRO/DISTRITO')]
    property CEP: String             Read FCEP          write FCEP;
    [TName('BAIRRO/DISTRITO','MUNIC�PIO')]
    property Bairro: String          Read FBairro       write FBairro;
    [TName('MUNIC�PIO','UF')]
    property Cidade: String          Read FCidade       Write FCidade;
    [TName('TELEFONE','ENTE FEDERATIVO RESPONS�VEL (EFR)')]
    property Telefone: String        Read FTelefone     Write FTelefone;
    [TName('ENDERE�O ELETR�NICO','TELEFONE')]
    property EMail: String           Read FEMail        Write FEMail;
    property Observacao: String      Read FObservacao   Write FObservacao;
  end;

implementation

end.
