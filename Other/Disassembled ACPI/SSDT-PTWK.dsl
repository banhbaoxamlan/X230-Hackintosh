DefinitionBlock("", "SSDT", 2, "X230", "PTWK", 0)
{   
    External (ZPTS, MethodObj)
    External (ZWAK, MethodObj)
    
    External (_SB.LID, DeviceObj)
    External (_SB.PCI0, DeviceObj)
    External (_SB.PCI0.LPC, DeviceObj)
    External (_SB.PCI0.LPC.EC, DeviceObj)
    External (_SB.PCI0.XHCI.PMEE, FieldUnitObj)
    External (_SB.PCI0.LPC.EC.HKEY.MMTS, MethodObj)
    External (_SB.PCI0.LPC.EC.LED, IntObj)

    Scope (_SB)
    {
        Device (PCI9)
        {
            Name (_ADR, Zero)
            Name (FNOK, Zero)
            Name (MODE, Zero)
            
            Name (TPTS, Zero)
            Name (TWAK, Zero)
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
    
    Method (_PTS, 1, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            \_SB.PCI9.TPTS = Arg0
            
            If (\_SB.PCI9.FNOK == 1)
            {
                Arg0 = 3
            }
            
            If ((5 == Arg0) && CondRefOf (\_SB.PCI0.XHCI.PMEE))
            {
                \_SB.PCI0.XHCI.PMEE = 0
            }
        }

        ZPTS(Arg0)

    }

    Method (_WAK, 1, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            \_SB.PCI9.TWAK = Arg0
            
            If (\_SB.PCI9.FNOK == 1)
            {
                \_SB.PCI9.FNOK = 0
                Arg0 = 3
            }

            If (Arg0 < 1 || Arg0 > 5)
            {
                Arg0 = 3
            }

            If (3 == Arg0)
            {
                Notify (\_SB.LID, 0x80)
            }
        }

        Local0 = ZWAK(Arg0)

        Return (Local0)
    }

    Method (_TTS, 1, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            If (CondRefOf (_SB.PCI0.LPC.EC.LED))
            {
                If (Arg0 == Zero & \_SB.PCI0.LPC.EC.LED == One)
                {
                    \_SB.PCI0.LPC.EC.HKEY.MMTS (0x02)
                }
            }
        }

    }
}