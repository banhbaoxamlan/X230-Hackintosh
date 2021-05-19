DefinitionBlock ("", "SSDT", 2, "X230", "AC", 0)
{
    External (OSDW, MethodObj)

    External (_SB.PCI0.LPC.EC.AC, DeviceObj)
    External (LWCP, FieldUnitObj)

    Scope (_SB.PCI0.LPC.EC.AC)
    {
        Method (_PRW, 0, NotSerialized)
        {
            If (\OSDW () || \LWCP)
            {
                Return (Package ()
                {
                    0x17, 
                    0x04
                })
            }

            Return (Package ()
            {
                0x17, 
                0x03
            })
        }
    }
}