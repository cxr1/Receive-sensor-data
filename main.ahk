#include <log4ahk>
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%


ARDUINO_Port     = COM3
ARDUINO_Baud     = 115200
ARDUINO_Parity   = N
ARDUINO_Data     = 8
ARDUINO_Stop     = 1
arduino_setup(start_polling_serial:=false)


i := 1
loop{
    data = % arduino_read()
    
    If (data != ""){    
        Str := data
        DllCall("crypt32\CryptStringToBinaryW", "ptr", &str, "uint", StrLen(str), "uint", 0x4, "ptr", 0, "uint*", bytes, "ptr", 0, "ptr", 0)
        VarSetCapacity(buf, bytes) 
        DllCall("crypt32\CryptStringToBinaryW", "ptr", &str, "uint", StrLen(str), "uint", 0x4, "ptr", &buf, "uint*", bytes, "ptr", 0, "ptr", 0)
        log.info(StrGet(&buf, "utf-8"))  
        }
    }


Return


OnExit:
arduino_close()

; ===============================================================================================================================

#include %A_ScriptDir%\Arduino.ahk
