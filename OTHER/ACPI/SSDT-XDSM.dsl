DefinitionBlock ("", "SSDT", 2, "X230", "XDSM", 0)
{
    External (_SB.PCI0.LPC, DeviceObj)
    External (_SB.PCI0.LPC.XDSM, MethodObj)
    External (_SB.PCI0.IGBE, DeviceObj)
	External (_SB.PCI0.IGBE.XDSM, MethodObj)
    External (_SB.PCI0.SMBU, DeviceObj)
    External (_SB.PCI0.SMBU.XDSM, MethodObj)
    External (_SB.PCI0.SAT0, DeviceObj)
    External (_SB.PCI0.SAT0.XDSM, MethodObj)
    External (_SB.PCI0.XHCI, DeviceObj)
    External (_SB.PCI0.XHCI.XDSM, MethodObj)

    If (!_OSI ("Darwin"))
    {
        Scope (\_SB.PCI0.LPC)
        {
            Method (_DSM, 4, NotSerialized)
            {
                Return (\_SB.PCI0.LPC.XDSM (Arg0, Arg1, Arg2, Arg3))
            }
        }

    	Scope (\_SB.PCI0.IGBE)
    	{
    		Method (_DSM, 4, Serialized)
    		{
    			Return (\_SB.PCI0.IGBE.XDSM (Arg0, Arg1, Arg2, Arg3))
    		}
    	}

        Scope (\_SB.PCI0.SMBU)
        {
            Method (_DSM, 4, Serialized)
            {
                Return (\_SB.PCI0.SMBU.XDSM (Arg0, Arg1, Arg2, Arg3))
            }
        }

        Scope (\_SB.PCI0.SAT0)
        {
            Method (_DSM, 4, Serialized)
            {
                Return (\_SB.PCI0.SAT0.XDSM (Arg0, Arg1, Arg2, Arg3))
            }
        }
        
        Scope (\_SB.PCI0.XHCI)
        {
            Method (_DSM, 4, NotSerialized)
            {
                Return (\_SB.PCI0.XHCI.XDSM (Arg0, Arg1, Arg2, Arg3))
            }
        }
    }
}