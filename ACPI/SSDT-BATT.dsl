// battery
// In config ACPI, _BIF renamed XBIF
// Find:     5F 42 49 46
// Replace:  58 42 49 46
//
// In config ACPI, _BST renamed XBST
// Find:     5F 42 53 54
// Replace:  58 42 53 54
//
DefinitionBlock ("", "SSDT", 2, "OCLT", "BAT0", 0)
{
    External(_SB.PCI0.I2C2, DeviceObj)
    External(_SB.PCI0.I2C2.BMA0, DeviceObj)
    External(_SB.PCI0.LPCB.H_EC, DeviceObj)
    External(_SB.PCI0.LPCB.H_EC.BAT0, DeviceObj)
    External(_SB.PCI0.LPCB.H_EC.BAT0.XBIF, MethodObj)
    External(_SB.PCI0.LPCB.H_EC.BAT0.XBST, MethodObj)
    External(_SB.PCI0.LPCB.H_EC.ECAV, IntObj)
    External(_SB.PCI0.LPCB.H_EC.B1ST, FieldUnitObj)
    External(_SB.PCI0.LPCB.H_EC.ECWT, MethodObj)
    External(_SB.PCI0.LPCB.H_EC.ECMD, MethodObj)
    
    External(_SB.PCI0.LPCB.H_EC.CHRG, DeviceObj)
    External(_SB.PCI0.LPCB.H_EC.CHRG.PPSS, FieldUnitObj)
    
    
    
    Method (B1B2, 2, NotSerialized)
    {
        ShiftLeft (Arg1, 8, Local0)
        Or (Arg0, Local0, Local0)
        Return (Local0)
    }
    
    Method (B1B4, 4, NotSerialized)
    {
        Store(Arg3, Local0)        Or(Arg2, ShiftLeft(Local0, 8), Local0)        Or(Arg1, ShiftLeft(Local0, 8), Local0)        Or(Arg0, ShiftLeft(Local0, 8), Local0)        Return(Local0)    }
    
    Scope(_SB.PCI0.I2C2.BMA0)
    {
        Method (IANG, 1, NotSerialized)
                {
                    Store (Arg0, B1B4(^^^LPCB.H_EC.OID0,^^^LPCB.H_EC.OID1,^^^LPCB.H_EC.OID2,^^^LPCB.H_EC.OID3))
                }
    }
    
    Scope(_SB.PCI0.LPCB.H_EC)
    {
        Method (RE1B, 1, NotSerialized)
        {
            OperationRegion(ERAM, EmbeddedControl, Arg0, 1)
            Field(ERAM, ByteAcc, NoLock, Preserve) { BYTE, 8 }
            Return(BYTE)
        }
        Method (RECB, 2, Serialized)
        {
            ShiftRight(Arg1, 3, Arg1)
            Name(TEMP, Buffer(Arg1) { })
            Add(Arg0, Arg1, Arg1)
            Store(0, Local0)
            While (LLess(Arg0, Arg1))
            {
                Store(RE1B(Arg0), Index(TEMP, Local0))
                Increment(Arg0)
                Increment(Local0)
            }
            Return(TEMP)
        }
        OperationRegion (XCF2, EmbeddedControl, Zero, 0xFF)
        Field (XCF2, ByteAcc, Lock, Preserve)
        { 
                Offset (0x0C),  
                OID0,8,OID1,8,OID2,8,OID3,8,  //MOID,   32
                Offset (0x68), 
                 
                GRH0,8,GRH1,8,                //CHGR,   16


                Offset (0x82),  
                    ,16,                      //XX11,   16,
                DC10,8,DC11,8,                //B1DC,   16, 
                FV10,8,FV11,8,                //B1FV,   16,                         
                FC10,8,FC11,8,                //B1FC,   16, 
                X150,8,X151,8,                //XX15,   16, 
                Offset (0x8D), 
                CR10,8,CR11,8,                //B1CR,   16
                RC10,8,RC11,8,                //B1RC,   16, 
                VT10,8,VT11,8                 //B1VT,   16,
        }
    }
        
    Scope(_SB.PCI0.LPCB.H_EC.BAT0)
    {
        Method (_BIF, 0, Serialized)
        {
                If (_OSI ("Darwin"))
                {        
                    Name (BPKG, Package (0x0D)
                    {
                        Zero, 
                        Ones, 
                        Ones, 
                        One, 
                        Ones, 
                        Zero, 
                        Zero, 
                        0x64, 
                        Zero, 
                        "SR Real Battery", 
                        "123456789", 
                        "Real", 
                        "Intel SR 1"
                    })
                    Store (B1B2(FV10,FV11), Local0)
                    Store (Divide (Multiply (B1B2(DC10,DC11), Local0), 0x03E8, ), Local1)
                    Store (Divide (Multiply (B1B2(FC10,FC11), Local0), 0x03E8, ), Local2)
                    Store (Local1, Index (BPKG, One))
                    Store (Local2, Index (BPKG, 0x02))
                    If (B1B2(FC10,FC11))
                    {
                        Store (Divide (Local2, 0x0A, ), Index (BPKG, 0x05))
                        Store (Divide (Local2, 0x19, ), Index (BPKG, 0x06))
                        Store (Divide (Local1, 0x64, ), Index (BPKG, 0x07))
                    }

                    Return (BPKG)
                }
                Else
                {
                    Return (\_SB.PCI0.LPCB.H_EC.BAT0.XBIF())
                }
        }
    
        Method (_BST, 0, Serialized)
        {
                If (_OSI ("Darwin"))
                {
                    Name (PKG1, Package (0x04)
                    {
                        Ones, 
                        Ones, 
                        Ones, 
                        Ones
                    })
                    Store (And (B1ST, 0x07), Index (PKG1, Zero))
                    If (And (B1ST, One))
                    {
                        Store (Multiply (B1B2(CR10,CR11), B1B2(FV10,FV11)), Local0)
                        Store (Divide (Local0, 0x03E8, ), Local0)
                        Store (Local0, Index (PKG1, One))
                    }
                    Else
                    {
                        Store (Multiply (B1B2(CR10,CR11), B1B2(FV10,FV11)), Local0)
                        Store (Divide (Local0, 0x03E8, ), Local0)
                        Store (Local0, Index (PKG1, One))
                    }

                    Store (B1B2(FV10,FV11), Local1)
                    Store (Divide (Multiply (B1B2(RC10,RC11), Local1), 0x03E8, ), Index (PKG1, 0x02))
                    Store (B1B2(VT10,VT11), Index (PKG1, 0x03))
                    Return (PKG1)
                }
                Else
                {
                    Return (\_SB.PCI0.LPCB.H_EC.BAT0.XBST())
                }
        }
    }
    
    Scope(_SB.PCI0.LPCB.H_EC.CHRG)
    {
            Method (XPAR)
            {
                Return (B1B2(^^^^LPCB.H_EC.GRH0, ^^^^LPCB.H_EC.GRH1))
            }
            
            Method (SPPC, 1, Serialized)
            {
                If (LLessEqual (ToInteger (Arg0), Subtract (SizeOf (PPSS), One)))
                {
                    
                    Store (DerefOf (Index (DerefOf (Index (PPSS, Arg0)), 0x05)), Local1)
                    \_SB.PCI0.LPCB.H_EC.ECWT (Local1, RefOf (XPAR))
                    \_SB.PCI0.LPCB.H_EC.ECMD (0x37)
                }
            }

        
    }
    
    
}
//EOF
