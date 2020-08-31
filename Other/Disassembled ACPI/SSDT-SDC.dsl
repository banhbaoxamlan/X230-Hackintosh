DefinitionBlock ("", "SSDT", 2, "X230", "noRPxx", 0)
{
    External (_SB.PCI0.EXP1, DeviceObj)

    Scope (_SB.PCI0.EXP1)
    {
        OperationRegion (DE01, PCI_Config, 0x50, 1)
        Field (DE01, AnyAcc, NoLock, Preserve)
        {
                ,   4, 
            DDDD,   1
        }
        Method (_STA, 0, Serialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }
        }
    }
    
    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            \_SB.PCI0.EXP1.DDDD = One
        }
    }
}