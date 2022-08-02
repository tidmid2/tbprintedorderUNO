unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Vcl.StdCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util,
  FireDAC.Comp.Script;

type
  TForm3 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    Button1: TButton;
    FDScript1: TFDScript;
    FDQuery2: TFDQuery;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  FDScript1.SQLScripts.Clear;
  FDScript1.SQLScripts.Add;
  with FDScript1.SQLScripts[0].SQL do
   begin
       Add('alter table tbprinted_order drop constraint fk_tbprinted_order_1;');
//       Add('COMMIT WORK;');
//       Add('ALTER TABLE TBPRINTED_ORDER ADD CONSTRAINT FK_TBPRINTED_ORDER_1 FOREIGN KEY (IDPRODUCT) REFERENCES TBMENU(ID) ON DELETE SET NULL USING INDEX FK_TBPRINTED_ORDER_1;');
//       Add('COMMIT WORK;');
   end;
  try
   FDScript1.ValidateAll;
   FDScript1.ExecuteAll;
  except
    on e:exception do TThread.Synchronize(nil,procedure begin ShowMessage(e.Message);end);
  end;
  FreeAndNil(fdconnection1);
//     FdQuery1.Execute(1);
//     FdQuery1.Execute(2);
end;

end.
