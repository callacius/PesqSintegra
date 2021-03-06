unit ClassUF;

interface

uses
  System.Classes;

Type
  TName = class(TCustomAttribute)
  private
    FName: String;
    FLength: Integer;
    FProx: String;
    FStart:Integer;
    FUsarCount:Boolean;
  public
    constructor Create(Name: String; Lenght:Integer = 0);overload;
    constructor Create(Name: String; Prox:String);overload;
    constructor Create(Name: String; Start:Integer; Prox:String);overload;
    Property Name:String       read FName      write FName;
    property Length:Integer    read FLength    write FLength;
    property Prox:String       read FProx      write FProx;
    property Start:Integer     read FStart     write FStart;
    property UsarCount:Boolean read FUsarCount write FUsarCount;
  end;

  IClassUF = Interface
    //
  End;

  TClassUF = class(TInterfacedObject, IClassUF)
    //
  end;
implementation

{ TName }

constructor TName.Create(Name:String; Lenght:Integer);
begin
  Self.Name      := Name;
  Self.Start     := 0;
  Self.Length    := Lenght;
  Self.UsarCount := True;
end;

constructor TName.Create(Name: String; Start: Integer; Prox: String);
begin
  Self.Name      := Name;
  Self.Start     := Start;
  Self.Prox      := Prox;
  Self.UsarCount := False;
end;

constructor TName.Create(Name, Prox: String);
begin
  Self.Name      := Name;
  Self.Start     := 0;
  Self.Prox      := Prox;
  Self.UsarCount := False;
end;

end.
