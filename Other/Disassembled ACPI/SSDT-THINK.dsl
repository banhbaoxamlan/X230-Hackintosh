DefinitionBlock ("", "SSDT", 2, "X230", "Think", 0)
{    
    External (_SB.PCI0.LPC.EC, DeviceObj)
    External (_SB.PCI0.LPC.EC.HKEY, DeviceObj)
    External (_SB.PCI0.LPC.EC.HFSP, FieldUnitObj)
    External (_SB.PCI0.LPC.EC.HFNI, FieldUnitObj)
    External (_SB.PCI0.LPC.EC.VRST, FieldUnitObj)
    External (_SI._SST, MethodObj)

    Scope (_SB.PCI0.LPC.EC)
    {
        OperationRegion (ESEN, EmbeddedControl, Zero, 0x0100)
        Field (ESEN, ByteAcc, Lock, Preserve)
        {
            Offset (0x78), 
            EST0,   8,
        }
    }

    Scope (\_SB.PCI0.LPC.EC.HKEY)
    {
        Method (CSSI, 1, NotSerialized)
        {
            \_SI._SST (Arg0)
        }
        Method (CFSP, 1, NotSerialized)
        {
            \_SB.PCI0.LPC.EC.HFSP = Arg0
        }

        Method (CFNI, 1, NotSerialized)
        {
            \_SB.PCI0.LPC.EC.HFNI = Arg0
        }
    }
}