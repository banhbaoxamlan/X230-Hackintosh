DefinitionBlock ("", "SSDT", 2, "X230", "BATX", 0x00010000)
{
    External (_SB_.PCI0.LPC_.EC__, DeviceObj) 
    External (_SB_.PCI0.LPC_.EC__.BAT0._HID, IntObj)
    External (_SB_.PCI0.LPC_.EC__.BAT0._STA, MethodObj)
    External (_SB_.PCI0.LPC_.EC__.BAT1._HID, IntObj)
    External (_SB_.PCI0.LPC_.EC__.BAT1._STA, MethodObj)
    External (_SB_.PCI0.LPC_.EC__.HIID, FieldUnitObj)
    External (H8DR, FieldUnitObj)

    Scope (\_SB.PCI0.LPC.EC)
    {
        OperationRegion (BRAM, EmbeddedControl, Zero, 0x0100)
        Device (BATX)
        {
            Name (BDBG, Zero)
            Name (BBIS, One)
            Name (BDQP, Zero)
            Mutex (BAXM, 0x00)
            Field (BRAM, ByteAcc, NoLock, Preserve)
            {
                Offset (0x38), 
                HB0S,   7, 
                HB0A,   1, 
                HB1S,   7, 
                HB1A,   1
            }

            Field (BRAM, ByteAcc, NoLock, Preserve)
            {
                Offset (0xA0), 
                RC00,   8, 
                RC01,   8, 
                FC00,   8, 
                FC01,   8, 
                AE00,   8, 
                AE01,   8, 
                RS00,   8, 
                RS01,   8, 
                AC00,   8, 
                AC01,   8, 
                VO00,   8, 
                VO01,   8, 
                AF00,   8, 
                AF01,   8, 
                BS00,   8, 
                BS01,   8
            }

            Field (BRAM, ByteAcc, NoLock, Preserve)
            {
                Offset (0xA0), 
                BM00,   8, 
                BM01,   8, 
                MD00,   8, 
                MD01,   8, 
                CC00,   8, 
                CC01,   8
            }

            Field (BRAM, ByteAcc, NoLock, Preserve)
            {
                Offset (0xA0), 
                DC00,   8, 
                DC01,   8, 
                DV00,   8, 
                DV01,   8, 
                OM00,   8, 
                OM01,   8, 
                SI00,   8, 
                SI01,   8, 
                DT00,   8, 
                DT01,   8, 
                SN00,   8, 
                SN01,   8
            }

            Field (BRAM, ByteAcc, NoLock, Preserve)
            {
                Offset (0xA0), 
                CH00,   8, 
                CH01,   8, 
                CH02,   8, 
                CH03,   8
            }

            Field (BRAM, ByteAcc, NoLock, Preserve)
            {
                Offset (0xA0), 
                MN00,   8, 
                MN01,   8, 
                MN02,   8, 
                MN03,   8, 
                MN04,   8, 
                MN05,   8, 
                MN06,   8, 
                MN07,   8, 
                MN08,   8, 
                MN09,   8, 
                MN0A,   8, 
                MN0B,   8, 
                MN0C,   8, 
                MN0D,   8, 
                MN0E,   8, 
                MN0F,   8
            }

            Field (BRAM, ByteAcc, NoLock, Preserve)
            {
                Offset (0xA0), 
                DN00,   8, 
                DN01,   8, 
                DN02,   8, 
                DN03,   8, 
                DN04,   8, 
                DN05,   8, 
                DN06,   8, 
                DN07,   8, 
                DN08,   8, 
                DN09,   8, 
                DN0A,   8, 
                DN0B,   8, 
                DN0C,   8, 
                DN0D,   8, 
                DN0E,   8, 
                DN0F,   8
            }

            Method (SBRC, 0, NotSerialized)
            {
                Return (B1B2 (RC00, RC01))
            }

            Method (SBFC, 0, NotSerialized)
            {
                Return (B1B2 (FC00, FC01))
            }

            Method (SBAE, 0, NotSerialized)
            {
                Return (B1B2 (AE00, AE01))
            }

            Method (SBRS, 0, NotSerialized)
            {
                Return (B1B2 (RS00, RS01))
            }

            Method (SBAC, 0, NotSerialized)
            {
                Return (B1B2 (AC00, AC01))
            }

            Method (SBVO, 0, NotSerialized)
            {
                Return (B1B2 (VO00, VO01))
            }

            Method (SBAF, 0, NotSerialized)
            {
                Return (B1B2 (AF00, AF01))
            }

            Method (SBBS, 0, NotSerialized)
            {
                Return (B1B2 (BS00, BS01))
            }

            Method (SBBM, 0, NotSerialized)
            {
                Return (B1B2 (BM00, BM01))
            }

            Method (SBMD, 0, NotSerialized)
            {
                Return (B1B2 (MD00, MD01))
            }

            Method (SBCC, 0, NotSerialized)
            {
                Return (B1B2 (CC00, CC01))
            }

            Method (SBDC, 0, NotSerialized)
            {
                Return (B1B2 (DC00, DC01))
            }

            Method (SBDV, 0, NotSerialized)
            {
                Return (B1B2 (DV00, DV01))
            }

            Method (SBOM, 0, NotSerialized)
            {
                Return (B1B2 (OM00, OM01))
            }

            Method (SBSI, 0, NotSerialized)
            {
                Return (B1B2 (SI00, SI01))
            }

            Method (SBDT, 0, NotSerialized)
            {
                Return (B1B2 (DT00, DT01))
            }

            Method (SBSN, 0, NotSerialized)
            {
                Return (ToDecimalString (B1B2 (SN00, SN01)))
            }

            Method (SBCH, 0, NotSerialized)
            {
                Return (ToString (B1B4 (CH00, CH01, CH02, CH03), Ones))
            }

            Method (SBMN, 0, NotSerialized)
            {
                Store (Buffer (0x10){}, Local0)
                Store (MN00, Index (Local0, Zero))
                Store (MN01, Index (Local0, One))
                Store (MN02, Index (Local0, 0x02))
                Store (MN03, Index (Local0, 0x03))
                Store (MN04, Index (Local0, 0x04))
                Store (MN05, Index (Local0, 0x05))
                Store (MN06, Index (Local0, 0x06))
                Store (MN07, Index (Local0, 0x07))
                Store (MN08, Index (Local0, 0x08))
                Store (MN09, Index (Local0, 0x09))
                Store (MN0A, Index (Local0, 0x0A))
                Store (MN0B, Index (Local0, 0x0B))
                Store (MN0C, Index (Local0, 0x0C))
                Store (MN0D, Index (Local0, 0x0D))
                Store (MN0E, Index (Local0, 0x0E))
                Store (MN0F, Index (Local0, 0x0F))
                Return (ToString (Local0, Ones))
            }

            Method (SBDN, 0, NotSerialized)
            {
                Store (Buffer (0x10){}, Local0)
                Store (DN00, Index (Local0, Zero))
                Store (DN01, Index (Local0, One))
                Store (DN02, Index (Local0, 0x02))
                Store (DN03, Index (Local0, 0x03))
                Store (DN04, Index (Local0, 0x04))
                Store (DN05, Index (Local0, 0x05))
                Store (DN06, Index (Local0, 0x06))
                Store (DN07, Index (Local0, 0x07))
                Store (DN08, Index (Local0, 0x08))
                Store (DN09, Index (Local0, 0x09))
                Store (DN0A, Index (Local0, 0x0A))
                Store (DN0B, Index (Local0, 0x0B))
                Store (DN0C, Index (Local0, 0x0C))
                Store (DN0D, Index (Local0, 0x0D))
                Store (DN0E, Index (Local0, 0x0E))
                Store (DN0F, Index (Local0, 0x0F))
                Return (ToString (Local0, Ones))
            }

            Method (B1B2, 2, NotSerialized)
            {
                Return (Or (Arg0, ShiftLeft (Arg1, 0x08)))
            }

            Method (B1B4, 4, NotSerialized)
            {
                Or (Arg2, ShiftLeft (Arg3, 0x08), Local0)
                Or (Arg1, ShiftLeft (Local0, 0x08), Local0)
                Or (Arg0, ShiftLeft (Local0, 0x08), Local0)
                Return (Local0)
            }

            Name (_HID, EisaId ("PNP0C0A"))  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                _SB
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Store (Zero, Local0)
                If (_OSI ("Darwin"))
                {
                    If (CondRefOf (^^BAT1._STA))
                    {
                        If (CondRefOf (^^BAT0._STA))
                        {
                            Or (^^BAT0._STA (), ^^BAT1._STA (), Local0)
                        }
                        Else
                        {
                            Store (^^BAT1._STA (), Local0)
                        }
                    }
                    Else
                    {
                        Store (^^BAT0._STA (), Local0)
                    }

                    If (\H8DR)
                    {
                        Return (Local0)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }

                Return (Zero)
            }

            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If (_OSI ("Darwin"))
                {
                    If (CondRefOf (^^BAT0._HID))
                    {
                        Store (Zero, ^^BAT0._HID)
                    }

                    If (CondRefOf (^^BAT1._HID))
                    {
                        Store (Zero, ^^BAT1._HID)
                    }
                }
            }

            Name (PBIX, Package (0x15)
            {
                One, 
                One, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                One, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0x00017318, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0x03E8, 
                0x01F4, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                "", 
                "", 
                "", 
                "", 
                Zero
            })
            Name (BX0I, Package (0x15){})
            Name (BX1I, Package (0x15){})
            Method (GBIX, 2, NotSerialized)
            {
                If (LEqual (Arg0, 0x10))
                {
                    Store (HB1S, Local4)
                    Store (HB1A, Local5)
                }
                Else
                {
                    Store (HB0S, Local4)
                    Store (HB0A, Local5)
                }

                Store (0x0A, Local6)
                Store (Zero, Local7)
                While (LAnd (LNot (Local7), Local6))
                {
                    If (Local5)
                    {
                        If (LEqual (And (Local4, 0x07), 0x07))
                        {
                            Sleep (0x03E8)
                            Decrement (Local6)
                        }
                        Else
                        {
                            Store (One, Local7)
                        }
                    }
                    Else
                    {
                        Store (Zero, Local6)
                    }
                }

                If (LNotEqual (Local7, One))
                {
                    Store ("BATX:GBIX: !!!WARNING: Could not get battery-data in time. Giving up for now. - WARNING!!!", Debug)
                    Store (0xFFFFFFFF, Index (Arg1, 0x02))
                    Store (0xFFFFFFFF, Index (Arg1, 0x03))
                    Store (Zero, Index (Arg1, 0x06))
                    Store (Zero, Index (Arg1, 0x07))
                    Return (Arg1)
                }

                If (Acquire (BAXM, 0xFFFF))
                {
                    Store ("BATX:AcquireLock failed in GBIX", Debug)
                    Return (Arg1)
                }

                Or (Arg0, One, HIID)
                Store (SBCC (), Index (Arg1, 0x08))
                Store (SBBM (), Local7)
                ShiftRight (Local7, 0x0F, Local7)
                XOr (Local7, One, Index (Arg1, One))
                Store (Arg0, HIID)
                If (Local7)
                {
                    Multiply (SBFC (), 0x0A, Local1)
                }
                Else
                {
                    Store (SBFC (), Local1)
                }

                Store (Local1, Index (Arg1, 0x03))
                Or (Arg0, 0x02, HIID)
                If (Local7)
                {
                    Multiply (SBDC (), 0x0A, Local0)
                }
                Else
                {
                    Store (SBDC (), Local0)
                }

                Store (Local0, Index (Arg1, 0x02))
                Multiply (Divide (Local0, 0x64, ), 0x0A, Index (Arg1, 0x06))
                Multiply (Divide (Local0, 0x64, ), 0x05, Index (Arg1, 0x07))
                Store (SBDV (), Index (Arg1, 0x05))
                Store (SBSN (), Index (Arg1, 0x11))
                Or (Arg0, 0x06, HIID)
                Store (SBDN (), Index (Arg1, 0x10))
                Or (Arg0, 0x04, HIID)
                Store (SBCH (), Index (Arg1, 0x12))
                Or (Arg0, 0x05, HIID)
                Store (SBMN (), Index (Arg1, 0x13))
                Release (BAXM)
                Return (Arg1)
            }

            Method (_BIX, 0, NotSerialized)  // _BIX: Battery Information Extended
            {
                If (LEqual (BDBG, One))
                {
                    Store ("BATX:_BIX", Debug)
                }

                Store (GBIX (Zero, PBIX), BX0I)
                If (LAnd (HB0A, LEqual (BDBG, One)))
                {
                    Concatenate ("BATX:BIXPowerUnit: BAT0 ", Index (BX0I, One), Debug)
                    Concatenate ("BATX:BIXDesignCapacity: BAT0 ", ToDecimalString (DerefOf (Index (BX0I, 0x02))), Debug)
                    Concatenate ("BATX:BIXLastFullChargeCapacity: BAT0 ", ToDecimalString (DerefOf (Index (BX0I, 0x03))), Debug)
                    Concatenate ("BATX:BIXBatteryTechnology: BAT0 ", ToDecimalString (DerefOf (Index (BX0I, 0x04))), Debug)
                    Concatenate ("BATX:BIXDesignVoltage: BAT0 ", ToDecimalString (DerefOf (Index (BX0I, 0x05))), Debug)
                    Concatenate ("BATX:BIXDesignCapacityOfWarning: BAT0 ", ToDecimalString (DerefOf (Index (BX0I, 0x06))), Debug)
                    Concatenate ("BATX:BIXDesignCapacityOfLow: BAT0 ", ToDecimalString (DerefOf (Index (BX0I, 0x07))), Debug)
                    Concatenate ("BATX:BIXCycleCount: BAT0 ", ToDecimalString (DerefOf (Index (BX0I, 0x08))), Debug)
                    Concatenate ("BATX:BIXModelNumber: BAT0 ", DerefOf (Index (BX0I, 0x10)), Debug)
                    Concatenate ("BATX:BIXSerialNumber: BAT0 ", DerefOf (Index (BX0I, 0x11)), Debug)
                    Concatenate ("BATX:BIXBatteryType: BAT0 ", DerefOf (Index (BX0I, 0x12)), Debug)
                    Concatenate ("BATX:BIXOEMInformation: BAT0 ", DerefOf (Index (BX0I, 0x13)), Debug)
                }

                If (LNot (HB1A))
                {
                    Return (BX0I)
                }

                Store (GBIX (0x10, PBIX), BX1I)
                If (LEqual (BDBG, One))
                {
                    Concatenate ("BATX:BIXPowerUnit: BAT1 ", Index (BX1I, One), Debug)
                    Concatenate ("BATX:BIXDesignCapacity: BAT1 ", ToDecimalString (DerefOf (Index (BX1I, 0x02))), Debug)
                    Concatenate ("BATX:BIXLastFullChargeCapacity: BAT1 ", ToDecimalString (DerefOf (Index (BX1I, 0x03))), Debug)
                    Concatenate ("BATX:BIXBatteryTechnology: BAT1 ", ToDecimalString (DerefOf (Index (BX1I, 0x04))), Debug)
                    Concatenate ("BATX:BIXDesignVoltage: BAT1 ", ToDecimalString (DerefOf (Index (BX1I, 0x05))), Debug)
                    Concatenate ("BATX:BIXDesignCapacityOfWarning: BAT1 ", ToDecimalString (DerefOf (Index (BX1I, 0x06))), Debug)
                    Concatenate ("BATX:BIXDesignCapacityOfLow: BAT1 ", ToDecimalString (DerefOf (Index (BX1I, 0x07))), Debug)
                    Concatenate ("BATX:BIXCycleCount: BAT1 ", ToDecimalString (DerefOf (Index (BX1I, 0x08))), Debug)
                    Concatenate ("BATX:BIXModelNumber: BAT1 ", DerefOf (Index (BX1I, 0x10)), Debug)
                    Concatenate ("BATX:BIXSerialNumber: BAT1 ", DerefOf (Index (BX1I, 0x11)), Debug)
                    Concatenate ("BATX:BIXBatteryType: BAT1 ", DerefOf (Index (BX1I, 0x12)), Debug)
                    Concatenate ("BATX:BIXOEMInformation: BAT1 ", DerefOf (Index (BX1I, 0x13)), Debug)
                }

                If (LNot (HB0A))
                {
                    Return (BX1I)
                }

                If (LNotEqual (DerefOf (Index (BX0I, One)), DerefOf (Index (BX1I, One))))
                {
                    Store ("BATX:BIXPowerUnit: !!!WARNING: PowerUnits differ between batteries. This case isn\'t handled in SSDT-BATX atm. Please report a bug - WARNING!!!", Debug)
                }

                Store (BX0I, Local0)
                Add (DerefOf (Index (BX0I, 0x02)), DerefOf (Index (BX1I, 0x02)), Index (Local0, 0x02))
                Add (DerefOf (Index (BX0I, 0x03)), DerefOf (Index (BX1I, 0x03)), Index (Local0, 0x03))
                Divide (Add (DerefOf (Index (BX0I, 0x05)), DerefOf (Index (BX1I, 0x05))), 0x02, , Index (Local0, 0x05))
                Add (DerefOf (Index (BX0I, 0x06)), DerefOf (Index (BX1I, 0x06)), Index (Local0, 0x06))
                Add (DerefOf (Index (BX0I, 0x07)), DerefOf (Index (BX1I, 0x07)), Index (Local0, 0x07))
                Divide (Add (DerefOf (Index (BX0I, 0x08)), DerefOf (Index (BX1I, 0x08))), 0x02, , Index (Local0, 0x08))
                Store (Concatenate (Concatenate (DerefOf (Index (BX0I, 0x10)), " / "), DerefOf (Index (BX1I, 0x10))), Index (Local0, 0x10))
                Store (Concatenate (Concatenate (DerefOf (Index (BX0I, 0x11)), " / "), DerefOf (Index (BX1I, 0x11))), Index (Local0, 0x11))
                Store (Concatenate (Concatenate (DerefOf (Index (BX0I, 0x12)), " / "), DerefOf (Index (BX1I, 0x12))), Index (Local0, 0x12))
                Store (Concatenate (Concatenate (DerefOf (Index (BX0I, 0x13)), " / "), DerefOf (Index (BX1I, 0x13))), Index (Local0, 0x13))
                If (LEqual (BDBG, One))
                {
                    Concatenate ("BATX:BIXPowerUnit: BATX ", Index (Local0, One), Debug)
                    Concatenate ("BATX:BIXDesignCapacity: BATX ", ToDecimalString (DerefOf (Index (Local0, 0x02))), Debug)
                    Concatenate ("BATX:BIXLastFullChargeCapacity: BATX ", ToDecimalString (DerefOf (Index (Local0, 0x03))), Debug)
                    Concatenate ("BATX:BIXBatteryTechnology: BATX ", ToDecimalString (DerefOf (Index (Local0, 0x04))), Debug)
                    Concatenate ("BATX:BIXDesignVoltage: BATX ", ToDecimalString (DerefOf (Index (Local0, 0x05))), Debug)
                    Concatenate ("BATX:BIXDesignCapacityOfWarning: BATX ", ToDecimalString (DerefOf (Index (Local0, 0x06))), Debug)
                    Concatenate ("BATX:BIXDesignCapacityOfLow: BATX ", ToDecimalString (DerefOf (Index (Local0, 0x07))), Debug)
                    Concatenate ("BATX:BIXCycleCount: BATX ", ToDecimalString (DerefOf (Index (Local0, 0x08))), Debug)
                    Concatenate ("BATX:BIXModelNumber: BATX ", DerefOf (Index (Local0, 0x10)), Debug)
                    Concatenate ("BATX:BIXSerialNumber: BATX ", DerefOf (Index (Local0, 0x11)), Debug)
                    Concatenate ("BATX:BIXBatteryType: BATX ", DerefOf (Index (Local0, 0x12)), Debug)
                    Concatenate ("BATX:BIXOEMInformation: BATX ", DerefOf (Index (Local0, 0x13)), Debug)
                }

                Return (Local0)
            }

            Name (PBST, Package (0x04)
            {
                Zero, 
                Zero, 
                Zero, 
                Zero
            })
            Name (BT0P, Package (0x04){})
            Name (BT1P, Package (0x04){})
            Method (GBST, 2, NotSerialized)
            {
                If (Acquire (BAXM, 0xFFFF))
                {
                    Store ("BATX:AcquireLock failed in GBST", Debug)
                    Return (Arg1)
                }

                If (LEqual (Arg0, Zero))
                {
                    Store (HB0S, Local6)
                }
                Else
                {
                    Store (HB1S, Local6)
                }

                If (And (Local6, 0x20))
                {
                    Store (0x02, Local0)
                }
                ElseIf (And (Local6, 0x40))
                {
                    Store (One, Local0)
                }
                Else
                {
                    Store (Zero, Local0)
                }

                Or (Arg0, One, HIID)
                Store (SBBM (), Local7)
                ShiftRight (Local7, 0x0F, Local7)
                Store (Arg0, HIID)
                Store (SBRC (), Local2)
                If (Local7)
                {
                    Multiply (Local2, 0x0A, Local2)
                }

                Store (SBAC (), Local1)
                If (LEqual (Local0, One))
                {
                    If (LGreaterEqual (Local1, 0x8000))
                    {
                        Subtract (0x00010000, Local1, Local1)
                    }
                }
                Else
                {
                    Store (Zero, Local1)
                }

                Store (SBVO (), Local3)
                If (Local7)
                {
                    Divide (Multiply (Local1, Local3), 0x03E8, , Local1)
                }

                Store (Local0, Index (Arg1, Zero))
                Store (Local1, Index (Arg1, One))
                Store (Local2, Index (Arg1, 0x02))
                Store (Local3, Index (Arg1, 0x03))
                Release (BAXM)
                Return (Arg1)
            }

            Name (PBAI, Package (0x02)
            {
                0xFF, 
                0xFF
            })
            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                If (LEqual (BDBG, One))
                {
                    Store ("BATX:_BST()", Debug)
                }

                Store (DerefOf (Index (PBAI, Zero)), Local3)
                Store (DerefOf (Index (PBAI, One)), Local4)
                If (LOr (LNotEqual (Local3, HB0A), LNotEqual (Local4, HB1A)))
                {
                    Store (HB0A, Index (PBAI, Zero))
                    Store (HB1A, Index (PBAI, One))
                    If (LOr (LNotEqual (Local3, 0xFF), LNotEqual (Local4, 0xFF)))
                    {
                        If (LEqual (BDBG, One))
                        {
                            Concatenate ("BATX:_BST() - PBAI:HB0A (old): ", Local3, Debug)
                            Concatenate ("BATX:_BST() - PBAI:HB1A (old): ", Local4, Debug)
                            Concatenate ("BATX:_BST() - PBAI:HB0A (new): ", HB0A, Debug)
                            Concatenate ("BATX:_BST() - PBAI:HB1A (new): ", HB1A, Debug)
                        }

                        Notify (BATX, 0x81)
                    }
                }

                If (HB0A)
                {
                    Store (GBST (Zero, PBST), BT0P)
                    If (LEqual (BDBG, One))
                    {
                        Concatenate ("BATX:BSTState: BAT0 (acpi) - ", HB0S, Debug)
                        Concatenate ("BATX:BSTState: BAT0 ", DerefOf (Index (BT0P, Zero)), Debug)
                        Concatenate ("BATX:BSTPresentRate: BAT0 ", ToDecimalString (DerefOf (Index (BT0P, One))), Debug)
                        Concatenate ("BATX:BSTRemainingCapacity: BAT0 ", ToDecimalString (DerefOf (Index (BT0P, 0x02))), Debug)
                        Concatenate ("BATX:BSTPresentVoltage: BAT0 ", ToDecimalString (DerefOf (Index (BT0P, 0x03))), Debug)
                    }

                    If (LNot (HB1A))
                    {
                        Return (BT0P)
                    }
                }

                Store (GBST (0x10, PBST), BT1P)
                If (LEqual (BDBG, One))
                {
                    Concatenate ("BATX:BSTState: BAT1 (acpi) - ", HB1S, Debug)
                    Concatenate ("BATX:BSTState: BAT1 ", DerefOf (Index (BT1P, Zero)), Debug)
                    Concatenate ("BATX:BSTPresentRate: BAT1 ", ToDecimalString (DerefOf (Index (BT1P, One))), Debug)
                    Concatenate ("BATX:BSTRemainingCapacity: BAT1 ", ToDecimalString (DerefOf (Index (BT1P, 0x02))), Debug)
                    Concatenate ("BATX:BSTPresentVoltage: BAT1 ", ToDecimalString (DerefOf (Index (BT1P, 0x03))), Debug)
                }

                If (LNot (HB0A))
                {
                    Return (BT1P)
                }

                Store (BT0P, Local0)
                Store (DerefOf (Index (BT0P, Zero)), Local4)
                Store (DerefOf (Index (BT1P, Zero)), Local5)
                Store (Zero, Index (Local0, Zero))
                If (LOr (LEqual (Local4, 0x02), LEqual (Local5, 0x02)))
                {
                    Store (0x02, Index (Local0, Zero))
                }
                ElseIf (LOr (LEqual (Local4, One), LEqual (Local5, One)))
                {
                    Store (One, Index (Local0, Zero))
                }

                Add (DerefOf (Index (BT0P, One)), DerefOf (Index (BT1P, One)), Index (Local0, One))
                Add (DerefOf (Index (BT0P, 0x02)), DerefOf (Index (BT1P, 0x02)), Index (Local0, 0x02))
                Divide (Add (DerefOf (Index (BT0P, 0x03)), DerefOf (Index (BT1P, 0x03))), 0x02, , Index (Local0, 0x03))
                If (LEqual (BDBG, One))
                {
                    Concatenate ("BATX:BSTState: BATX ", DerefOf (Index (Local0, Zero)), Debug)
                    Concatenate ("BATX:BSTPresentRate: BATX ", ToDecimalString (DerefOf (Index (Local0, One))), Debug)
                    Concatenate ("BATX:BSTRemainingCapacity: BATX ", ToDecimalString (DerefOf (Index (Local0, 0x02))), Debug)
                    Concatenate ("BATX:BSTPresentVoltage: BATX ", ToDecimalString (DerefOf (Index (Local0, 0x03))), Debug)
                }

                Return (Local0)
            }

            If (BBIS)
            {
                Name (PBSS, Package (0x07)
                {
                    0xFFFFFFFF, 
                    0xFFFFFFFF, 
                    0xFFFFFFFF, 
                    0xFFFFFFFF, 
                    0xFFFFFFFF, 
                    0xFFFFFFFF, 
                    0xFFFFFFFF
                })
                Name (PBS0, Package (0x07){})
                Name (PBS1, Package (0x07){})
                Method (GBSS, 2, NotSerialized)
                {
                    If (Acquire (BAXM, 0xFFFF))
                    {
                        Store ("BATX:AcquireLock failed in GBSS", Debug)
                        Return (PBSS)
                    }

                    Store (Arg0, HIID)
                    Store (SBAF (), Local6)
                    If (LEqual (Local6, 0xFFFF))
                    {
                        Store (Zero, Local6)
                    }

                    Store (Local6, Index (Arg1, One))
                    Store (SBAE (), Local6)
                    If (LEqual (Local6, 0xFFFF))
                    {
                        Store (Zero, Local6)
                    }

                    Store (Local6, Index (Arg1, 0x02))
                    Store (SBRS (), Index (Arg1, 0x03))
                    Store (SBAC (), Index (Arg1, 0x04))
                    Store (0x0BD7, Index (Arg1, Zero))
                    Release (BAXM)
                    Return (Arg1)
                }

                Method (CBSS, 0, NotSerialized)
                {
                    If (LEqual (BDBG, One))
                    {
                        Store ("BATX:CBSS()", Debug)
                    }

                    If (HB0A)
                    {
                        Store (GBSS (Zero, PBSS), PBS0)
                        If (LEqual (BDBG, One))
                        {
                            Concatenate ("BATX:BSSTimeToFull: BAT0 ", ToDecimalString (DerefOf (Index (PBS0, One))), Debug)
                            Concatenate ("BATX:BSSTimeToEmpty: BAT0 ", ToDecimalString (DerefOf (Index (PBS0, 0x02))), Debug)
                            Concatenate ("BATX:BSSChargeLevel: BAT0 ", ToDecimalString (DerefOf (Index (PBS0, 0x03))), Debug)
                            Concatenate ("BATX:BSSAverageRate: BAT0 ", ToDecimalString (DerefOf (Index (PBS0, 0x04))), Debug)
                        }

                        If (LNot (HB1A))
                        {
                            Return (PBS0)
                        }
                    }

                    Store (GBSS (0x10, PBSS), PBS1)
                    If (LEqual (BDBG, One))
                    {
                        Concatenate ("BATX:BSSTimeToFull: BAT1 ", ToDecimalString (DerefOf (Index (PBS1, One))), Debug)
                        Concatenate ("BATX:BSSTimeToEmpty: BAT1 ", ToDecimalString (DerefOf (Index (PBS1, 0x02))), Debug)
                        Concatenate ("BATX:BSSChargeLevel: BAT1 ", ToDecimalString (DerefOf (Index (PBS1, 0x03))), Debug)
                        Concatenate ("BATX:BSSAverageRate: BAT1 ", ToDecimalString (DerefOf (Index (PBS1, 0x04))), Debug)
                    }

                    If (LNot (HB0A))
                    {
                        Return (PBS1)
                    }

                    Store (PBS0, Local0)
                    Add (DerefOf (Index (PBS0, One)), DerefOf (Index (PBS1, One)), Index (Local0, One))
                    Add (DerefOf (Index (PBS0, 0x02)), DerefOf (Index (PBS1, 0x02)), Index (Local0, 0x02))
                    Divide (Add (DerefOf (Index (PBS0, 0x03)), DerefOf (Index (PBS1, 0x03))), 0x02, , Index (Local0, 0x03))
                    Add (DerefOf (Index (PBS0, 0x04)), DerefOf (Index (PBS1, 0x04)), Index (Local0, 0x04))
                    If (LEqual (BDBG, One))
                    {
                        Concatenate ("BATX:BSSTimeToFull: BATX ", ToDecimalString (DerefOf (Index (Local0, One))), Debug)
                        Concatenate ("BATX:BSSTimeToEmpty: BATX ", ToDecimalString (DerefOf (Index (Local0, 0x02))), Debug)
                        Concatenate ("BATX:BSSChargeLevel: BATX ", ToDecimalString (DerefOf (Index (Local0, 0x03))), Debug)
                        Concatenate ("BATX:BSSAverageRate: BATX ", ToDecimalString (DerefOf (Index (Local0, 0x04))), Debug)
                    }

                    Return (Local0)
                }

                Name (PBIS, Package (0x07)
                {
                    0x007F007F, 
                    0xFFFFFFFF, 
                    0x2342, 
                    0x2342, 
                    0x2342, 
                    0x2342, 
                    0x2342
                })
                Method (CBIS, 0, NotSerialized)
                {
                    If (LEqual (BDQP, One))
                    {
                        Store (0x006F007F, Index (PBIS, Zero))
                    }

                    If (LEqual (BDBG, One))
                    {
                        Store ("BATX:CBIS()", Debug)
                    }

                    If (Acquire (BAXM, 0xFFFF))
                    {
                        Store ("BATX:AcquireLock failed in CBIS", Debug)
                        Return (PBIS)
                    }

                    If (LNot (HB0A))
                    {
                        Store ("BATX:CBIS - Error HB0A not ready yet. Returning defaults.", Debug)
                        Return (PBIS)
                    }

                    Store (0x02, HIID)
                    Store (SBDT (), Index (PBIS, One))
                    Store (ToDecimalString (SBSN ()), Local6)
                    Store (Local6, Index (PBIS, 0x02))
                    Store (Local6, Index (PBIS, 0x03))
                    Store (Local6, Index (PBIS, 0x04))
                    Store (Local6, Index (PBIS, 0x05))
                    Store (Local6, Index (PBIS, 0x06))
                    Release (BAXM)
                    If (LEqual (BDBG, One))
                    {
                        Concatenate ("BATX:CBIS:BISConfig BATX ", Index (PBIS, Zero), Debug)
                        Concatenate ("BATX:CBIS:BISManufactureDate BATX ", Index (PBIS, One), Debug)
                        Concatenate ("BATX:CBIS:BISPackLotCode BATX ", Index (PBIS, 0x02), Debug)
                    }

                    Return (PBIS)
                }
            }
        }
    }
}

