unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var x, a, b:integer;
f:real;
begin
x:=strtoint(edit1.text);
a:=strtoint(edit3.text);
b:=strtoint(edit4.text);
f:=(a*a*x + exp(-x)*cos(b*x)) / (b*x - exp(-x)*sin(b*x) + 1);
edit2.text:=floattostr(f);
end;


end.

