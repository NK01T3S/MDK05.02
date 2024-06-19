unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TfEdit }

  TfEdit = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CBteach: TComboBox;
    eName: TEdit;
    eGuild: TEdit;
    eRes: TEdit;
    eLevel: TEdit;
    lName: TLabel;
    lLevel: TLabel;
    lTeach: TLabel;
    lGuild: TLabel;
    lRes: TLabel;
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  fEdit: TfEdit;

implementation

{$R *.lfm}

procedure TfEdit.FormShow(Sender: TObject);
begin
  eName.SetFocus;
end;

end.

