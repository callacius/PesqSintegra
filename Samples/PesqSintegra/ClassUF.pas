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
    FUsarCount:Boolean;
  public
    constructor Create(Name: String; Lenght:Integer = 0);overload;
    constructor Create(Name: String; Prox:String);overload;
    Property Name:String       read FName      write FName;
    property Length:Integer    read FLength    write FLength;
    property Prox:String       read FProx      write FProx;
    property UsarCount:Boolean read FUsarCount write FUsarCount;
  end;

  IClassUF = Interface
    //
  End;

  TClassUF = class(TInterfacedObject, IClassUF)
  end;
implementation

{ TName }

constructor TName.Create(Name:String; Lenght:Integer);
begin
  Self.Name      := Name;
  Self.Length    := Lenght;
  Self.UsarCount := True;
end;

{ TClassUF }

constructor TName.Create(Name, Prox: String);
begin
  Self.Name      := Name;
  Self.Prox      := Prox;
  Self.UsarCount := False;
end;

end.
