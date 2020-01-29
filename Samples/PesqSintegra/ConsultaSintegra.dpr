program ConsultaSintegra;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {Form1},
  ClassUF in '..\..\Source\PesqSintegra\ClassUF.pas',
  ClassUF_AC in '..\..\Source\PesqSintegra\ClassUF_AC.pas',
  ClassUF_AL in '..\..\Source\PesqSintegra\ClassUF_AL.pas',
  ClassUF_AM in '..\..\Source\PesqSintegra\ClassUF_AM.pas',
  ClassUF_AP in '..\..\Source\PesqSintegra\ClassUF_AP.pas',
  ClassUF_BA in '..\..\Source\PesqSintegra\ClassUF_BA.pas',
  ClassUF_CCC in '..\..\Source\PesqSintegra\ClassUF_CCC.pas',
  ClassUF_CE in '..\..\Source\PesqSintegra\ClassUF_CE.pas',
  ClassUF_DF in '..\..\Source\PesqSintegra\ClassUF_DF.pas',
  ClassUF_ES in '..\..\Source\PesqSintegra\ClassUF_ES.pas',
  ClassUF_GO in '..\..\Source\PesqSintegra\ClassUF_GO.pas',
  ClassUF_MA in '..\..\Source\PesqSintegra\ClassUF_MA.pas',
  ClassUF_MG in '..\..\Source\PesqSintegra\ClassUF_MG.pas',
  ClassUF_MS in '..\..\Source\PesqSintegra\ClassUF_MS.pas',
  ClassUF_MT in '..\..\Source\PesqSintegra\ClassUF_MT.pas',
  ClassUF_PA in '..\..\Source\PesqSintegra\ClassUF_PA.pas',
  ClassUF_PB in '..\..\Source\PesqSintegra\ClassUF_PB.pas',
  ClassUF_PE in '..\..\Source\PesqSintegra\ClassUF_PE.pas',
  ClassUF_PI in '..\..\Source\PesqSintegra\ClassUF_PI.pas',
  ClassUF_PR in '..\..\Source\PesqSintegra\ClassUF_PR.pas',
  ClassUF_RECEITA in '..\..\Source\PesqSintegra\ClassUF_RECEITA.pas',
  ClassUF_RJ in '..\..\Source\PesqSintegra\ClassUF_RJ.pas',
  ClassUF_RN in '..\..\Source\PesqSintegra\ClassUF_RN.pas',
  ClassUF_RO in '..\..\Source\PesqSintegra\ClassUF_RO.pas',
  ClassUF_RR in '..\..\Source\PesqSintegra\ClassUF_RR.pas',
  ClassUF_RS in '..\..\Source\PesqSintegra\ClassUF_RS.pas',
  ClassUF_SC in '..\..\Source\PesqSintegra\ClassUF_SC.pas',
  ClassUF_SE in '..\..\Source\PesqSintegra\ClassUF_SE.pas',
  ClassUF_SP in '..\..\Source\PesqSintegra\ClassUF_SP.pas',
  ClassUF_TO in '..\..\Source\PesqSintegra\ClassUF_TO.pas',
  ConsSintegra in '..\..\Source\PesqSintegra\ConsSintegra.pas',
  Win.WebBrowser in '..\..\Source\PesqSintegra\Win.WebBrowser.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
