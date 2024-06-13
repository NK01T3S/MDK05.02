unit unit_calc;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, math;

type

  { TCalculaTaar }

  TCalculaTaar = class(TForm)
    bDel: TButton;
    b4: TButton;
    b5: TButton;
    b6: TButton;
    bMult: TButton;
    bRev: TButton;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    bMin: TButton;
    bEq: TButton;
    bCE: TButton;
    b0: TButton;
    bCom: TButton;
    bPlus: TButton;
    bC: TButton;
    bSqrt: TButton;
    b7: TButton;
    b8: TButton;
    b9: TButton;
    bDiv: TButton;
    bPow: TButton;
    eInput: TEdit;
    procedure bCClick(Sender: TObject);
    procedure bCEClick(Sender: TObject);
    procedure bComClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
    procedure bEqClick(Sender: TObject);
    procedure SignClick(Sender: TObject);
    procedure bPowClick(Sender: TObject);
    procedure bRevClick(Sender: TObject);
    procedure bSqrtClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NumButClick(Sender: TObject);
    procedure eInputChange(Sender: TObject);
  private

  public

  end;

var
  CalculaTaar: TCalculaTaar;
  a, b, ans: real;
  count: integer;
  sign: string;

implementation

{$R *.lfm}

{ TCalculaTaar }


procedure TCalculaTaar.bCClick(Sender: TObject);
begin
  eInput.text := '';
  a := 0;
  b := 0;
  ans := 0;
  count := 0;
end;

procedure TCalculaTaar.bCEClick(Sender: TObject);
begin
  eInput.text := '';
  b := 0;
  ans := 0;
end;

procedure TCalculaTaar.bComClick(Sender: TObject);
var str: string;
begin
  str := eInput.text;
  if str <> 'oshibka maaaaan' then
    begin
    if pos(',', str) = 0 then
      begin
      eInput.Text := str + ','
      end;
    end;
end;

procedure TCalculaTaar.bDelClick(Sender: TObject);
var str: string;
begin
  str := eInput.text;
  if str <> 'oshibka maaaaan' then
     begin
      Delete(str, length(str), 1);
      eInput.Text := str;
     end;
end;

procedure TCalculaTaar.bEqClick(Sender: TObject);
begin
  if einput.text <> 'oshibka maaaaan' then
     begin
     if count = 1 then
        b := StrToFloat(eInput.text);
      case sign of
      '/': begin if b <> 0 then
                    ans := a/b
                 else if b = 0 then
                    eInput.text := 'oshibka maaaaan';
            end;
      '*': ans := a*b;
      '-': ans := a-b;
      '+': ans := a+b;
      end;
      if einput.text <> 'oshibka maaaaan' then
         begin
         eInput.Text := FloatToStr(ans);
         a := ans;
         count := 0;
         end;
     end;
end;

procedure TCalculaTaar.SignClick(Sender: TObject);
var str: string;
begin
  if eInput.text <> 'oshibka maaaaan' then
     begin
      str := eInput.text;
      case (Sender as TButton).Caption of
      '/': sign := '/';
      '*': sign := '*';
      '-': begin
           if (str = '0') then
              begin
              str := '-';
              eInput.text := str;
              end
           else
               sign := '-';
           end;
      '+': sign := '+';
      end;
      if eInput.text <> '-' then
         begin
         a := StrToFloat(eInput.text);
         eInput.text := '';
         count := 1;
         end;
     end;
end;

procedure TCalculaTaar.bPowClick(Sender: TObject);
var num: real;
begin
  if eInput.text <> 'oshibka maaaaan' then
     begin
      num := StrToFloat(eInput.text);
      eInput.text := FloatToStr(num*num);
     end;
end;

procedure TCalculaTaar.bRevClick(Sender: TObject);
var num:real;
begin
  if eInput.text <> 'oshibka maaaaan' then
     begin
      num := StrToFloat(eInput.text);
      if num <> 0 then
         eInput.text := FloatToStr(1/num)
      else
         eInput.Text := 'oshibka maaaaan';
     end;
end;

procedure TCalculaTaar.bSqrtClick(Sender: TObject);
var num: real;
begin
  if eInput.text <> 'oshibka maaaaan' then
     begin
      num := StrToFloat(eInput.text);
      if num >= 0 then
         eInput.text := FloatToStr(sqrt(num))
      else
         eInput.Text := 'oshibka maaaaan';
     end;
end;

procedure TCalculaTaar.FormCreate(Sender: TObject);
begin
  a := 0;
  b := 0;
  ans := 0;
  count := 0;
end;

procedure TCalculaTaar.eInputChange(Sender: TObject);
begin
  if eInput.text = '' then
     eInput.text := '0';
end;

procedure TCalculaTaar.NumButClick(Sender: TObject);
var str: string;
begin
  str := eInput.text;
  if eInput.text <> 'oshibka maaaaan' then
     begin
       if str = '0' then
         str := '';
       eInput.text := str + (Sender as TButton).Caption;
     end;
end;

end.

