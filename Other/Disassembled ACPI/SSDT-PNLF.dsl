DefinitionBlock ("", "SSDT", 2, "X230", "PNLF", 0)
{
    External (_SB.PCI0.VID, DeviceObj)
    
    Scope (_SB.PCI0.VID)
    {
        OperationRegion (RMP3, PCI_Config, Zero, 0x14)
    }

    Scope (_SB)
    {
        Device (PNLF)
        {
            Name (_HID, EisaId ("APP0002"))
            Name (_CID, "backlight")
            Name (_UID, 14)
            
            Method (_STA, 0, NotSerialized)
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (Zero)
                }
            }
        
            Field (\_SB.PCI0.VID.RMP3, AnyAcc, NoLock, Preserve)
            {
                Offset(0x02), GDID, 16,
                Offset(0x10), BAR1, 32,
            }

            OperationRegion (RMB1, SystemMemory, And (BAR1, 0xFFFFFFF0), 0x000E1184)
            Field (RMB1, AnyAcc, Lock, Preserve)
            {
                Offset (0x48250), 
                Offset (0x48254), 
                LEVL,   32, 
                Offset (0xC8250), 
                LEVW,   32, 
                LEVX,   32,
            }

            Method (_INI, 0, NotSerialized)
            {
                Local2 = 0x0710
                Local1 = (^LEVX >> 0x10)
                If (!Local1)
                {
                    Local1 = Local2
                }

                If ((Local2 != Local1))
                {
                    Local0 = ((^LEVL * Local2) / Local1)
                    Local3 = (Local2 << 0x10)
                    If ((Local2 > Local1))
                    {
                        ^LEVX = Local3
                        ^LEVL = Local0
                    }
                    Else
                    {
                        ^LEVL = Local0
                        ^LEVX = Local3
                    }
                }
            }
        }
    }
}