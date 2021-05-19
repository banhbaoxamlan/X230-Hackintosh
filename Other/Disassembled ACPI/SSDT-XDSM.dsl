DefinitionBlock ("", "SSDT", 2, "X230", "XDSM", 0)
{
    External (OSDW, MethodObj)
    
    External (_SB.PCI0.LPC, DeviceObj)
    External (_SB.PCI0.LPC.XDSM, MethodObj)
    External (_SB.PCI0.EXP1, DeviceObj)
    External (_SB.PCI0.EXP1.XDSM, MethodObj)
    External (_SB.PCI0.EXP2, DeviceObj)
    External (_SB.PCI0.EXP2.XDSM, MethodObj) 
    External (_SB.PCI0.EXP3, DeviceObj)
    External (_SB.PCI0.EXP3.XDSM, MethodObj)
    External (_SB.PCI0.SAT1, DeviceObj)
    External (_SB.PCI0.SAT1.XDSM, MethodObj)
    External (_SB.PCI0.XHCI, DeviceObj)
    External (_SB.PCI0.XHCI.XDSM, MethodObj)

    If (!\OSDW ())
    {
        Scope (\_SB.PCI0.LPC)
        {
            Method (_DSM, 4, NotSerialized)
            {
                Return (\_SB.PCI0.LPC.XDSM (Arg0, Arg1, Arg2, Arg3))
            }
        }

        Scope (\_SB.PCI0.EXP1)
        {
            Method (_DSM, 4, Serialized)
            {
                Return (\_SB.PCI0.EXP1.XDSM (Arg0, Arg1, Arg2, Arg3))
            }
        }
        
        Scope (\_SB.PCI0.EXP2)
        {
            Method (_DSM, 4, Serialized)
            {
                Return (\_SB.PCI0.EXP2.XDSM (Arg0, Arg1, Arg2, Arg3))
            }
        }
        
        Scope (\_SB.PCI0.EXP3)
        {
            Method (_DSM, 4, Serialized)
            {
                Return (\_SB.PCI0.EXP3.XDSM (Arg0, Arg1, Arg2, Arg3))
            }
        }

        Scope (\_SB.PCI0.SAT1)
        {
            Method (_DSM, 4, Serialized)
            {
                Return (\_SB.PCI0.SAT1.XDSM (Arg0, Arg1, Arg2, Arg3))
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