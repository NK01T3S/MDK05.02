unit unittel;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  Grids, edit;

type

  { TfMain }

  TfMain = class(TForm)
    Panel1: TPanel;
    bAdd: TSpeedButton;
    bEdit: TSpeedButton;
    bDel: TSpeedButton;
    bSort: TSpeedButton;
    sg: TStringGrid;
    procedure bAddClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure bSortClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;
  type
    Contacts = record
      Name: string[100];
      Tel: string[20];
      Note: string[20];
    end;
var
  fMain: TfMain;
  adres:string;

implementation

{$R *.lfm}

{ TfMain }

procedure TfMain.bAddClick(Sender: TObject);
begin
  fEdit.eName.Text := '';
  fEdit.eTel.Text := '';
  fEdit.ModalResult := mrNone;
  fEdit.ShowModal;
  if (fEdit.eName.Text = '') or (fEdit.eTel.text = '') then exit;
  if fEdit.ModalResult <> mrOk then exit;
  SG.RowCount := SG.RowCount + 1;
  SG.Cells[0, SG.RowCount - 1] := fEdit.eName.text;
  SG.Cells[1, SG.RowCount - 1] := fEdit.eTel.text;
  SG.Cells[2, SG.RowCount - 1] := fEdit.CBNote.text;
end;

procedure TfMain.bDelClick(Sender: TObject);
begin
  if SG.RowCount = 1 then Exit;
  if MessageDlg('Требуется подтверждение',
                'Вы действительно хотите удалить контакт "' +
                SG.Cells[0, SG.Row] + '"?',
      mtConfirmation, [mbYes, mbNo, mbIgnore], 0) = mrYes then
         SG.DeleteRow(SG.Row);
end;

procedure TfMain.bEditClick(Sender: TObject);
begin
  if SG.RowCount = 1 then exit;
  fEdit.eName.Text:= SG.Cells[0, SG.Row];
  fEdit.eTel.Text:= SG.Cells[1, SG.Row];
  fEdit.CBNote.Text:= SG.Cells[2, SG.Row];
  fEdit.ModalResult:= mrNone;
  fEdit.ShowModal;
  if fEdit.ModalResult = mrOk then begin
    SG.Cells[0, SG.Row]:= fEdit.eName.Text;
    SG.Cells[1, SG.Row]:= fEdit.eTel.Text;
    SG.Cells[2, SG.Row]:= fEdit.CBNote.Text;
  end;
end;

procedure TfMain.bSortClick(Sender: TObject);
begin
  if SG.RowCount = 1 then exit;
  SG.SortColRow(true, 0);
end;

procedure TfMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var MyC:Contacts;
f: file of Contacts;
i: integer;
begin
  if SG.RowCount = 1 then exit;
  try
    AssignFile(f, adres + 'telephones.dat');
    Rewrite(f);
    for i := 1 to SG.RowCount-1 do begin
      MyC.Name := SG.Cells[0,i];
      MyC.Tel := SG.Cells[1,i];
      MyC.Note := SG.Cells[2, i];
      Write(f, MyC);
    end;
  finally
    CloseFile(f);
  end;
end;

procedure TfMain.FormCreate(Sender: TObject);
var MyC: Contacts;
f: file of Contacts;
begin
  adres := ExtractFilePath(ParamStr(0));
  SG.Cells[0, 0] := 'Имя';
  SG.Cells[1, 0] := 'Телефон';
  SG.Cells[2, 0] := 'Примечание';
  SG.ColWidths[0] := 365;
  SG.ColWidths[1] := 150;
  SG.ColWidths[2] := 150;
  if not FileExists(adres+'telephones.dat') then exit;
  try
    AssignFile(f, adres+'telephones.dat');
    Reset(f);
    while not eof(f) do begin
      Read(f, MyC);
      SG.RowCount := SG.RowCount+1;
      SG.Cells[0, SG.RowCount-1] := MyC.Name;
      SG.Cells[1, SG.RowCount-1] := MyC.Tel;
      SG.Cells[2, SG.RowCount-1] := MyC.Note;
    end;
  finally
    CloseFile(f);
  end;
end;

end.

