DefinitionBlock ("", "SSDT", 2, "X230", "AC", 0)
{
    External (_SB.PCI0.LPC.EC.AC, DeviceObj)

    Scope (_SB.PCI0.LPC.EC.AC)
    {
        Method (_PRW, 0)
        {
            If (_OSI ("Darwin"))
            {
                Return (Package ()
                {
                    0x18, 
                    0x04
                })
            }

            Return (Package ()
            {
                0x18, 
                0x03
            })
        }
    }
}