DefinitionBlock ("", "SSDT", 2, "X230", "PTSWAK", 0)
{
    External (ZPTS, MethodObj)
    External (ZWAK, MethodObj)
    External (ZTTS, MethodObj)
    External (EXT1, MethodObj)
    External (EXT2, MethodObj)
    External (EXT3, MethodObj)
    External (EXT4, MethodObj)
    External (EXT5, MethodObj)
    External (EXT6, MethodObj)

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
            If (CondRefOf(EXT1))
            {
                EXT1(Arg0)
            }
            If (CondRefOf(EXT2))
            {
                EXT2(Arg0)
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
            If (CondRefOf(EXT3))
            {
                EXT3(Arg0)
            }
            If (CondRefOf(EXT4))
            {
                EXT4(Arg0)
            }
        }

        Local0 = ZWAK(Arg0)
        Return (Local0)
    }

    Method (_TTS, 1, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            If (CondRefOf(EXT5))
            {
                EXT5(Arg0)
            }
            If (CondRefOf(EXT6))
            {
                EXT6(Arg0)
            }
        }

        If (CondRefOf(ZTTS))
        {
            ZTTS(Arg0)
        }
    }
}