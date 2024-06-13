unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TfMain }

  TfMain = class(TForm)
    lClock: TLabel;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  fMain: TfMain;

implementation

{$R *.lfm}

{ TfMain }

procedure TfMain.Timer1Timer(Sender: TObject);
  var
    i: byte; //для получения случайного числа
  begin
    //первым делом меняем надпись метки:
    lClock.Caption:= TimeToStr(Now);
    //получаем случайное направление:
    i:= Random(4);
    //теперь в зависимости от направления двигаем метку:
    case i of
      0: lClock.Left:= lClock.Left + 50; //вправо
      1: lClock.Left:= lClock.Left - 50; //влево
      2: lClock.Top:= lClock.Top + 50; //вверх
      3: lClock.Top:= lClock.Top - 50; //вниз
    end;
    //теперь проверяем: не вышла ли метка за пределы формы?
    //если вышла - возвращаем её обратно
    //если ушла влево:
    if lClock.Left < 0 then lClock.Left:= 0;
    //если ушла вверх:
    if lClock.Top < 0 then lClock.Top:= 0;
    //если ушла вправо:
    if (lClock.Left + lClock.Width) > fMain.Width then
      lClock.Left:= fMain.Width - lClock.Width;
    //если ушла вниз:
    if (lClock.Top + lClock.Height) > fMain.Height then
      lClock.Top:= fMain.Height - lClock.Height;
  end;


end.

