DefinitionBlock ("", "SSDT", 2, "X230", "Think", 0)
{    
    External (_SB.PCI0.LPC.EC, DeviceObj)
    External (_SB.PCI0.LPC.EC.HKEY, DeviceObj)
    External (_SB.PCI0.LPC.EC.HFSP, FieldUnitObj)
    External (_SB.PCI0.LPC.EC.HFNI, FieldUnitObj)
    External (_SB.PCI0.LPC.EC.VRST, FieldUnitObj)
    External (_SI._SST, MethodObj)
    External (LNUX, IntObj)
    External (WNTF, IntObj)
    
    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            LNUX = 0x01
            WNTF = 0x01
        }
    }
    
    Scope (_SB.PCI0.LPC.EC)
    {
        OperationRegion (ESEN, EmbeddedControl, Zero, 0x0100)
        Field (ESEN, ByteAcc, Lock, Preserve)
        {
            Offset (0x78), 
            EST0,   8,
            EST1,   8, 
            EST2,   8, 
            EST3,   8,
            EST4,   8,
            EST5,   8,
            EST6,   8,
            EST7,   8,

            Offset (0xC0), 
            EST8,   8, 
            EST9,   8, 
            ESTA,   8, 
            ESTB,   8, 
            ESTC,   8, 
            ESTD,   8, 
            ESTE,   8, 
            ESTF,   8
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