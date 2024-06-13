unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Spin;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses MMSystem;

{$R *.lfm}
var
min, sec: integer;

procedure ShowTime;
var
buf: String[10];
begin
  // минуты и секунды выводим двумя цифрами
  if min < 10 then buf := '0' + IntToStr(min) + ':'
  else buf := IntToStr(min) + ':';
  if sec < 10 then buf := buf + '0' + IntToStr(sec)
  else buf := buf + IntToStr(sec);
  Form1.Label3.Caption := buf;
  end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  // если таймер работает, надо остановить
  if Form1.Timer1.Enabled then begin
  Timer1.Enabled := False; // остановить
  Button1.Caption := 'Пуск';
  // скрыть время, сделать видимыми поля ввода интервала
  Label3.Visible:= False;
  Label1.Visible:= True; Edit1.Visible:= True;
  Label2.Visible:= True; Edit2.Visible:= True;
  end
  else begin
  // таймер стоит, надо запустить
  min := StrToInt(Edit1.Text); sec := StrToInt(Edit2.Text);
  if (sec = 0) and (min = 0) then begin
  ShowMessage('Надо задать интервал!');
  exit;
  end;
  Timer1.Enabled := True; Button1.Caption := 'Стоп';
  // скрыть поля ввода интервала
  Label1.Visible := False; Edit1.Visible := False;
  Label2.Visible := False; Edit2.Visible := False;
  Label3.Visible := True;
  ShowTime;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  sec := sec - 1;
  if sec < 0 then sec := 0;
  ShowTime; // показать время

  // заданный интервал истек
  if (min = 0) and (sec = 0) then begin
    Timer1.Enabled := False;
    Button1.Caption := 'Пуск';

    // Воспроизведение звукового файла
    sndPlaySound('treugolnik-kolokolnyiy.wav', snd_Async or snd_NoDefault);

    ShowMessage('Вемя истекло!');
    sndPlaySound(nil, 0);
  end;

  if (sec = 0) and (min > 0) then begin
    sec := 60;
    min := min - 1;
  end;
end;

end.
