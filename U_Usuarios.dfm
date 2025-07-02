inherited frmUsuarios: TfrmUsuarios
  Caption = 'Cadastro de Usu'#225'rio'
  ClientHeight = 486
  ClientWidth = 699
  Position = poDesktopCenter
  ExplicitWidth = 715
  ExplicitHeight = 525
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel [0]
    Left = -3
    Top = 0
    Width = 706
    Height = 457
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
    object Label1: TLabel
      Left = 15
      Top = 106
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 84
      Top = 106
      Width = 81
      Height = 13
      Caption = 'Nome de Usu'#225'rio'
      FocusControl = DB_NOME
    end
    object Label3: TLabel
      Left = 17
      Top = 149
      Width = 25
      Height = 13
      Caption = 'Login'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 157
      Top = 149
      Width = 30
      Height = 13
      Caption = 'Senha'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 297
      Top = 149
      Width = 105
      Height = 13
      Caption = 'Tipo de Administra'#231#227'o'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 489
      Top = 149
      Width = 85
      Height = 13
      Caption = 'Data de Cadastro'
      FocusControl = db_Data
    end
    object GroupBox1: TGroupBox
      Left = 20
      Top = 195
      Width = 606
      Height = 230
      Caption = 'Lista de Usu'#225'rios'
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 3
        Top = 16
        Width = 603
        Height = 201
        BorderStyle = bsNone
        DataSource = ds_grid
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_USUARIO'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome do Usu'#225'rios'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LOGIN'
            Title.Caption = 'Login de Usu'#225'rio'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SENHA'
            Title.Caption = 'Senha de Usu'#225'rio'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Title.Caption = 'Tipo de Usu'#225'rio'
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
  end
  object DB_NOME: TDBEdit [1]
    Left = 84
    Top = 122
    Width = 539
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NOME'
    DataSource = ds_padao
    TabOrder = 1
  end
  object DBEdit1: TDBEdit [2]
    Left = 15
    Top = 122
    Width = 63
    Height = 21
    DataField = 'ID_USUARIO'
    DataSource = ds_padao
    TabOrder = 0
  end
  object DBEdit3: TDBEdit [3]
    Left = 17
    Top = 168
    Width = 134
    Height = 21
    DataField = 'LOGIN'
    DataSource = ds_padao
    TabOrder = 2
  end
  object DBEdit4: TDBEdit [4]
    Left = 157
    Top = 168
    Width = 134
    Height = 21
    DataField = 'SENHA'
    DataSource = ds_padao
    TabOrder = 3
  end
  object DBEdit5: TDBEdit [5]
    Left = 297
    Top = 168
    Width = 186
    Height = 21
    DataField = 'TIPO'
    DataSource = ds_padao
    TabOrder = 4
  end
  object db_Data: TDBEdit [6]
    Left = 489
    Top = 168
    Width = 134
    Height = 21
    DataField = 'CADASTRO'
    DataSource = ds_padao
    TabOrder = 6
  end
  inherited Panel1: TPanel
    Width = 699
    BevelOuter = bvNone
    TabOrder = 7
    ExplicitWidth = 703
  end
  inherited Panel2: TPanel
    Top = 445
    Width = 699
    Color = clWhite
    ParentBackground = False
    TabOrder = 8
    ExplicitTop = 415
    ExplicitWidth = 703
    inherited DBNavigator1: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ds_padao: TDataSource
    Left = 648
    Top = 152
  end
  inherited q_Padrao: TFDQuery
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'Gen_Id_Usuario'
    UpdateOptions.AutoIncFields = 'Id_Usuario'
    SQL.Strings = (
      'select  * from Usuarios'
      'Order by Id_usuario')
    Left = 648
    object q_PadraoID_USUARIO: TFDAutoIncField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object q_PadraoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
    object q_PadraoLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Required = True
      Size = 10
    end
    object q_PadraoSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Size = 10
    end
    object q_PadraoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
      Size = 14
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
      'select * from Usuarios'
      'order by Id_usuario')
  end
end
