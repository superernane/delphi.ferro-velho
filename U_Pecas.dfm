inherited frmPecas: TfrmPecas
  Caption = 'Cadastro de Pe'#231'as'
  ClientHeight = 505
  ClientWidth = 712
  Color = clWhite
  ExplicitWidth = 728
  ExplicitHeight = 544
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 712
    BevelOuter = bvNone
    ExplicitWidth = 712
  end
  inherited Panel2: TPanel
    Top = 464
    Width = 712
    ExplicitTop = 464
    ExplicitWidth = 712
    inherited DBNavigator1: TDBNavigator
      Hints.Strings = ()
    end
  end
  object GroupBox1: TGroupBox [2]
    Left = 48
    Top = 113
    Width = 553
    Height = 121
    Caption = 'Cadastro de Pe'#231'as'
    TabOrder = 2
    object Label1: TLabel
      Left = 4
      Top = 22
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 76
      Top = 21
      Width = 102
      Height = 13
      Caption = 'Descri'#231#227'o do Produto'
      FocusControl = db_nome
    end
    object Label3: TLabel
      Left = 4
      Top = 64
      Width = 56
      Height = 13
      Caption = 'Quantidade'
      FocusControl = DBEdit3
    end
    object Label5: TLabel
      Left = 115
      Top = 61
      Width = 72
      Height = 13
      Caption = 'Valor de Venda'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 275
      Top = 64
      Width = 85
      Height = 13
      Caption = 'Data de Cadastro'
      FocusControl = db_data
    end
    object DBEdit1: TDBEdit
      Left = 4
      Top = 37
      Width = 66
      Height = 21
      DataField = 'ID_PECAS'
      DataSource = ds_padao
      TabOrder = 0
      OnExit = DBEdit1Exit
    end
    object db_nome: TDBEdit
      Left = 76
      Top = 37
      Width = 461
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCRICAO'
      DataSource = ds_padao
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 4
      Top = 80
      Width = 105
      Height = 21
      DataField = 'QUANTIDADE'
      DataSource = ds_padao
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 115
      Top = 80
      Width = 154
      Height = 21
      DataField = 'V_VENDAS'
      DataSource = ds_padao
      TabOrder = 3
    end
    object db_data: TDBEdit
      Left = 275
      Top = 80
      Width = 94
      Height = 21
      DataField = 'CADASTRO'
      DataSource = ds_padao
      Enabled = False
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox [3]
    Left = 48
    Top = 240
    Width = 553
    Height = 226
    Caption = 'Lista de Pe'#231'as Cadastradas'
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 8
      Top = 16
      Width = 542
      Height = 202
      BorderStyle = bsNone
      DataSource = ds_grid
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_PECAS'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Caption = 'Quantidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'V_VENDAS'
          Title.Caption = 'Valor de Venda'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CADASTRO'
          Title.Caption = 'Data de Cadastro'
          Visible = True
        end>
    end
  end
  inherited q_Padrao: TFDQuery
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'gen_Id_Pecas'
    UpdateOptions.AutoIncFields = 'id_pecas'
    SQL.Strings = (
      'select * from pecas'
      'order by Id_Pecas')
    object q_PadraoID_PECAS: TFDAutoIncField
      FieldName = 'ID_PECAS'
      Origin = 'ID_PECAS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object q_PadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object q_PadraoQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
      Precision = 18
      Size = 2
    end
    object q_PadraoV_VENDAS: TFMTBCDField
      FieldName = 'V_VENDAS'
      Origin = 'V_VENDAS'
      Precision = 18
      Size = 2
    end
    object q_PadraoCADASTRO: TDateField
      FieldName = 'CADASTRO'
      Origin = 'CADASTRO'
      Required = True
    end
  end
  inherited q_grid: TFDQuery
    Active = True
    SQL.Strings = (
      'select * from pecas'
      'order by Id_Pecas')
  end
end
