DefinitionBlock ("", "SSDT", 2, "X230", "EC", 0x00001000)
{
    External (_SB.PCI0.LPC.EC, DeviceObj)

    Scope (\)
    {
        /**
         * Status from two EC fields
         * 
         * e.g. B1B2 (0x3A, 0x03) -> 0x033A
         */
        Method (B1B2, 2, NotSerialized)
        {
            Return ((Arg0 | (Arg1 << 0x08)))
        }

        /**
         * Status from four EC fields
         */
        Method (B1B4, 4, NotSerialized)
        {
            Local0 = (Arg2 | (Arg3 << 0x08))
            Local0 = (Arg1 | (Local0 << 0x08))
            Local0 = (Arg0 | (Local0 << 0x08))

            Return (Local0)
        }


        // Word to Bytes
        // e.g. W16B (ARG0, ARG1, 0x033A) -> ARG0=0x3A, ARG1=0x03
        Method (W16B, 3, NotSerialized)
        {
            Arg0 = Arg2

            Arg1 = (Arg2 >> 0x08)
        }
    }

    /*
    * Methods to EC read / write access in case you don't have battery patch
    * Taken from Rehabmman's guide: https://www.tonymacx86.com/threads/guide-how-to-patch-dsdt-for-working-battery-status.116102/
    * https://xstar-dev.github.io/hackintosh_advanced/Guide_For_Battery_Hotpatch.html#%E6%8B%86%E5%88%86%E5%87%BD%E6%95%B0%E5%8E%9F%E7%90%86
    */
    Scope (_SB.PCI0.LPC.EC)
    {   
        /* 
        * Called from RECB, grabs a single byte from EC
        * Arg0 - offset in bytes from zero-based EC
        */
        Method (RE1B, 1, Serialized)
        {
            OperationRegion (ERAM, EmbeddedControl, Arg0, One)
            Field (ERAM, ByteAcc, NoLock, Preserve)
            {
                BYTE,   8
            }

            Return (BYTE) /* \RE1B.BYTE */
        }

        /** 
        * Read specified number of bytes from EC
        *
        * Arg0 - offset in bytes from zero-based EC
        * Arg1 - size of buffer in bits
        */
        Method (RECB, 2, Serialized)
        {
            Arg1 = ((Arg1 + 0x07) >> 0x03)

            Local7 = Buffer (Arg1) {}

            Arg1 += Arg0
            Local0 = Zero

            While ((Arg0 < Arg1))
            {
                Local7 [Local0] = RE1B (Arg0)
                Arg0++
                Local0++
            }

            Return (Local7) /* \RECB.TEMP */
        }

        /**
        * Write 1 byte to EC
        *
        * Arg0: Offset, Arg1: Byte to be written
        */
        Method (WE1B, 2, Serialized)
        {
            OperationRegion (ERAM, EmbeddedControl, Arg0, One)
            Field (ERAM, ByteAcc, NoLock, Preserve)
            {
                BYTE,   8
            }

            BYTE = Arg1
        }

        /**
        * Write to EC field
        *
        * Arg0: Offset
        * Arg1: Length, Arg2: Data to be written
        */
        Method (WECB, 3, Serialized)
        {
            Arg1 = ((Arg1 + 0x07) >> 0x03)  // Arg1 = ceil(Arg1 / 8), this is loop counter

            Local7 = Buffer (Arg1) {}       // Initial buffer to be written
            Local7 = Arg2

            Arg1 += Arg0                    // Shift write window to target area
            Local0 = Zero                   // Buffer index

            While ((Arg0 < Arg1))
            {
                WE1B (Arg0, DerefOf (Local7 [Local0]))
                Arg0++                      // Offset++
                Local0++                    // Index++
            }
        }
    }
}