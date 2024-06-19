unit edit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TfEdit }

  TfEdit = class(TForm)
    bSave: TBitBtn;
    bCancel: TBitBtn;
    CBNote: TComboBox;
    eName: TEdit;
    eTel: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    StaticText1: TStaticText;
    procedure FormShow(Sender: TObject);
  private

  public

  end;


var
  fEdit: TfEdit;


implementation

{$R *.lfm}

{ TfEdit }

procedure TfEdit.FormShow(Sender: TObject);
begin
  eName.SetFocus;
end;

end.

