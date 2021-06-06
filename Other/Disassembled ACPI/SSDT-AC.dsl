DefinitionBlock ("", "SSDT", 2, "X230", "AC", 0)
{
    External (_SB.PCI0.LPC.EC.AC, DeviceObj)

    Scope (_SB.PCI0.LPC.EC.AC)
    {
        Method (_PRW, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (Package ()
                {
                    0x28, 
                    0x04
                })
            }

            Return (Package ()
            {
                0x28, 
                0x03
            })
        }
    }
}