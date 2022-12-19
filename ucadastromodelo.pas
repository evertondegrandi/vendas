unit ucadastromodelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.DBActns;

type
  Tfcadastromodelo = class(TForm)
    ToolBar1: TToolBar;
    botaoNovo: TToolButton;
    ToolButton2: TToolButton;
    botaoPesquisar: TToolButton;
    ToolButton4: TToolButton;
    botaoGravar: TToolButton;
    ToolButton6: TToolButton;
    botaoDeletar: TToolButton;
    ToolButton1: TToolButton;
    botaoCancelar: TToolButton;
    imglistmodelo: TImageList;
    actionlistModelo: TActionList;
    Novo: TDataSetInsert;
    Deletar: TDataSetDelete;
    Gravar: TDataSetPost;
    Cancelar: TDataSetCancel;
    Pesquisar: TAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fcadastromodelo: Tfcadastromodelo;

implementation

{$R *.dfm}

end.
