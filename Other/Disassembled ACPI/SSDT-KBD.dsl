DefinitionBlock ("", "SSDT", 2, "X230", "KBD", 0x00000000)
{
    External (_SB_.PCI0.LPC.EC, DeviceObj)
    External (_SB_.PCI0.LPC_KBD, DeviceObj)
    
    Scope (_SB.PCI0.LPC.KBD)
    {
        Method (_DSM, 4, NotSerialized)
        {
            If (LNot (Arg2))
            {
                Return (Buffer (One)
                {
                     0x03                                           
                })
            }

            Return (Package ()
            {
                "RM,oem-id", "LENOVO", 
                "RM,oem-table-id", "Thinkpad_TrackPad"
            })
        }

        Name (RMCF, Package (0x04)
        {
            "Keyboard", 
            Package ()
            {
                "Custom PS2 Map", 
                Package ()
                {
                    Package (){}, 
                    "e038=e05b", 
                    "e037=64"
                }
            }
        })
    }
}

