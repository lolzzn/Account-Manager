#Persistent
#SingleInstance, Force


Process, Exist, RobloxPlayerBeta.exe
if (ErrorLevel) {
    MsgBox, 0x40004, rMultiThreader : Roblox Detected, A Roblox instance is already running.`nDo you want to close all instances?
    IfMsgBox, Yes
    {
        Loop {
            Process, Close, RobloxPlayerBeta.exe
            Process, Exist, RobloxPlayerBeta.exe
        } Until (!ErrorLevel)
    } else {
	exitapp
	}
}

mutexHandle := CheckMutexExist("ROBLOX_singletonMutex")
if (mutexHandle) {
    result := DllCall("WaitForSingleObject", "Ptr", mutexHandle, "UInt", 0)
}
else {
    global hMutex := DllCall("CreateMutex", "Int", 0, "Int", 1, "Str", "ROBLOX_singletonMutex")
}
Return

CheckMutexExist(mutexName) {
    mutexHandle := DllCall("OpenMutex", "UInt", 0x1F0001, "Int", 0, "Str", mutexName, "Ptr")
    return mutexHandle
}

return