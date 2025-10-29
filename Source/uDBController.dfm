object dbController: TdbController
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object Manager: TFDManager
    ConnectionDefFileAutoLoad = False
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 136
    Top = 120
  end
end
