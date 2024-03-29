unit unit2;

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
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
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
var
  R, N, a, b, diagonal, area: real;

begin
  // Ввод данных из полей Edit
  R := StrToFloat(Edit1.Text); // радиус окружности
  N := StrToFloat(Edit2.Text); // отношение сторон

  // Вычисление сторон прямоугольника
  a := R * sqrt(N / (1 + N));
  b := a * N;

  // Вычисление диагонали
  diagonal := sqrt(a*a + b*b);

  // Вычисление площади
  area := a * b;

  // Вывод результатов в компонент Memo
  Memo1.Lines.Add('Диагональ прямоугольника: ' + FloatToStr(diagonal));
  Memo1.Lines.Add('Площадь прямоугольника: ' + FloatToStr(area));
end;

end.

