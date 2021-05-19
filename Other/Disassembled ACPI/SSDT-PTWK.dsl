DefinitionBlock("", "SSDT", 2, "X230", "PTWK", 0)
{
    External (OSDW, MethodObj)
    
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
                If (OSDW ())
                {
                    Return (0x0F)
                }
                
                Return (Zero)
            }
        }
    }
    
    Scope (\_SB.PCI0.LPC.EC)
    {
        OperationRegion (WRAM, EmbeddedControl, Zero, 0x0100)
        Field (WRAM, ByteAcc, NoLock, Preserve)
        {
            Offset (0x36),
            WAC0,   8,
            WAC1,   8
        }

        Method (WACH, 0, NotSerialized)
        {
        	Return ((WAC0 | (WAC1 << 0x08)))
        }
    }
    
    Method (_PTS, 1, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            \_SB.PCI9.TPTS = Arg0
            
            if(\_SB.PCI9.FNOK ==1)
            {
                Arg0 = 3
            }
            
            If ((5 == Arg0) && CondRefOf (\_SB.PCI0.XHCI.PMEE)) {
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
            
            if(\_SB.PCI9.FNOK ==1)
            {
                \_SB.PCI9.FNOK =0
                Arg0 = 3
            }
            If (Arg0 < 1 || Arg0 > 5)
            { Arg0 = 3 }

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