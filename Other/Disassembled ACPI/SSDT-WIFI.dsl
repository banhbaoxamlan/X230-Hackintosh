DefinitionBlock ("", "SSDT", 2, "X230", "WIFI", 0)
{
    External (_SB.PCI0.EXP2, DeviceObj)
    
    Scope (_SB.PCI0.EXP2)
    {
        Device (PXSX)
        {
            Name (_ADR, Zero)
            Method (_STA, 0, NotSerialized)
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
}