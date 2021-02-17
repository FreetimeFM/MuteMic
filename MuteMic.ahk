/*
    Code adapted by FreetimeFM.
    Adapted from https://www.autohotkey.com/boards/viewtopic.php?style=7&t=15509
    Attempts to mute the microphone.
*/
Pause:: ; Hotkey is Pause button.
HideTrayTip() ; Hides previous traytip if shown.

/*
    To get mic_id run getSoundDevices.ahk and get value from 'Mixer' column.
    You may need to set mic volume to a random number to easily find it.
    Note that the id may change if you add/remove devices.
*/
mic_id = 2

SoundSet, +1, MASTER, mute, mic_id ; Attempts to mute the mic.
SoundGet, master_mute, , mute, mic_id ; Gets mute status

; Checks if there was an error.
if ErrorLevel
    TrayTip, MuteMic Error!,Mic ID: %mic_id%. Error: %ErrorLevel%.
else
    TrayTip, MuteMic, Mute %master_mute% ; Displays mute status as notif toast.

/*
    Function which hides the traytip (Windows notification toast).
    Taken from autohotkey traytip docs.
*/
HideTrayTip() {
    TrayTip  ; Attempt to hide it the normal way.
    if SubStr(A_OSVersion,1,3) = "10." {
        Menu Tray, NoIcon
        Sleep 200  ; It may be necessary to adjust this sleep.
        Menu Tray, Icon
    }
}
return