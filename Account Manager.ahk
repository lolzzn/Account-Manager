; ==============================================================
; OWNED BY LOLZZN
; WARNING: UNAUTHORIZED MODIFICATION IS PROHIBITED  
;  
; THIS SCRIPT IS PROTECTED UNDER A PROPRIETARY LICENSE.  
;  
; ⚠️ EDITING, MODIFYING, OR REMOVING ANY PART OF THIS SCRIPT  
; IS A VIOLATION OF THE LICENSE AGREEMENT.  
;  
; VIOLATORS MAY FACE DMCA TAKEDOWN REQUESTS AND LEGAL ACTION.  
; ==============================================================

#SingleInstance force
setkeydelay, -1
setmousedelay, -1
setbatchlines, -1
SetTitleMatchMode 2
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
Menu, Tray, Icon, Account Manager Icon.ico
OnMessage(0x201, "WM_LBUTTONDOWN")

if (!FileExist("License_Agreed.md")) {
	LicenseText := LicenseText()
	gui, e:new, +hwndHere5 +LabelGui5 -alwaysontop -maximizebox
	gui, e:color, 3b3b3b, 3b3b3b
	gui, e:font, cFFFFFF s15 q2 w800, Tahoma
	gui, e:add, text, x200 y10, License Agreements
	gui, e:add, groupbox, x0 y35 w600 h665 vnoselect,
	gui, e:font, cFFFFFF s9 q2 w400, Tahoma
	gui, e:add, edit, x20 y60 w560 h550 ReadOnly, % LicenseText "`n---------------------------------`nYou must agree to proceed."
	gui, e:font, cFFFFFF s12 q2 w800, Tahoma
	gui, e:add, checkbox, x20 y620 gIReadAndAgreeToIt vCheckToAgree, I have read and agree to the terms
	gui, e:font, cFFFFFF s15 q2 w800, Tahoma
	gui, e:add, button, disabled x25 y650 w150 gAgree vAgreedBTTR, Agree
	gui, e:add, button, x200 y650 w150 gDecline, Decline
	gui, e:show, w600 h700, Account Manager License Agreement
	guicontrol, e:focus, noselect
	return
}


TheStartOfTheCode:
if (!FileExist("settings")) {
	fileappend,
	(
Chrome
0
1
	),settings
}

gosub UpdateThemSettings
IHateScriptingThis := []
settimer, CheckingChromeAndRemovingIt, 1500
gui, a:new, +hwndHere +LabelGui1 -alwaysontop -maximizebox
gui, a:color, 3b3b3b, 3b3b3b

gui, a:font, cFFFFFF s12 q2 w800, Tahoma
gui, a:add, groupbox, x15 y15 w290 h130 , Account Selection
gui, a:add, groupbox, x415 y450 h40 w120
gui, a:add, groupbox, x200 y435 w150 h50, Account Amount
gui, a:add, groupbox, x15 y160 w520 h260
gui, a:add, groupbox, x315 y15 w220 h145, Join Game
gui, a:font, cFFFFFF s10 q1 w400, Tahoma 
gui, a:add, text, x25 y40, Account Name
gui, a:add, edit, x25 y60 w270 vAccountName
gui, a:add, text, x325 y40, Game Id
gui, a:add, edit, vGameSB2 gSearchFilter2 x380 y37 w130,

gui, a:add, edit, x30 y180 w490 vSearchBarACC GSearchFilter

gui, a:add, text, x420 y450, Made by lolzzn`nfrom

gui, a:font, cFFFFFF s12 q2 , Tahoma 
gui, a:add, button, x165 y90 w130 h30 GStartTS, Create Profile
gui, a:add, button, x25 y90 w130 h30 GDelete, Remove Account

gui, a:add, button, x30 y400 w150 GDeleteCache, Clear Cache
gui, a:add, button, x200 y400 w150 GRun2, Run Account
gui, a:add, button, x370 y400 w150 GRenameAcc, Rename Account

gui, a:add, button, x320 y122 w100 h30 GDeleteGame, Delete Game
gui, a:add, button, x430 y122 w100 h30 GJoinGame, Join Game
gui, a:add, button, x40 y450 w130 GSettings, Settings

gui, a:font, cFFFFFF s15 q2 w800, Tahoma
gui, a:add, text, x215 y155, Account List
gui, a:add, ListBox, x30 y210 w490 h180 vAccountList,
gui, a:add, text, x275 y457 w60 vAmountAlt,

gui, a:font, c0x196CD3 s10 q1 Underlined w400, Tahoma
gui, a:add, text, x450 y466 GLinkClicked, White Sands

gui, a:font, cWhite s7 q1 normal, Tahoma
gui, a:add, Listbox, x325 y65 w200 h58 vGameIDList,

gosub UpdateAccountList
gosub UpdateGameIDList
if (StartupSettings == 1) {
type := 0
gosub DeleteCache
}
gui, a:show, w550 h490
WinSet, AlwaysOnTop, On, ahk_id %Here%

gui, d:new, +hwndHere4 +LabelGui4 +alwaysontop
gui, d:color, 3b3b3b, 3b3b3b
gui, d:font, cFFFFFF s12 q1 w800, Tahoma
gui, d:add, groupbox, x2 y2 w196 h196
gui, d:add, text, x25 y5, Browser Selection
gui, d:add, DDL, x10 y30 vBrowserToUse gUpdateTheGODDAMNSetting, Chrome | Opera

guicontrol, d:choose, BrowserToUse, % Content[1]

gui, d:font, CFFFFFF,
gui, d:add, checkbox, x15 y70 GMultiThread VCheckbox11, <-- Multi Instance
gui, d:add, groupbox, x10 y50 w180 h70
gui, d:add, groupbox, x10 y115 w180 h77
gui, d:font, cFFFFFF s10 q1 w400, Tahoma
gui, d:add, text, x15 y100, Multi-Instance made by 
gui, d:add, checkbox, x15 y130 vstartupcc gUpdateTheGODDAMNSetting, <- Clear Cache on startup
gui, d:add, checkbox, x15 y150 vsilentcacheremoval gUpdateTheGODDAMNSetting, <- Silent Cache Removal

guicontrol, d:, startupcc, % StartupSettings
guicontrol, d:, silentcacheremoval, % SilentCacheRmovlal

gui, d:font, cBD89DC s10 q1 w400, Tahoma
gui, d:add, text, x152 y100,  Lunar
gui, d:font, cFFFFFF s12 q1 w800, Tahoma
return

LinkClicked:
; run, https://discord.com/invite/mangos
return

StartTS:
gui, a:submit, nohide
AccountName := trim(AccountName)
if (AccountName == "") {
	msgbox, 0x40030, ERROR, ENTER A VALID USERNAME!
	return
}
if (RegExMatch(AccountName, "[^\w\s]")) {
	msgbox, 0x40030, ERROR, ENTER A VALID USERNAME!
	return
}
ACCCLIST := ""
loop, files, %A_ScriptDir%\%BrowserFName%\*.*, D
{
	ACCCLIST .= A_LoopFileName "|"
}
loop, parse, ACCCLIST, "|"
{
	if (A_LoopField == AccountName) {
		msgbox, 0x40030, ERROR, USE A DIFFERENT USERNAME!
		return
	}
}
Run, %ExeRun% --new-window --user-data-dir="%A_ScriptDir%\%BrowserFName%\%AccountName%" "https://roblox.com/login"
sleep 1000
gosub UpdateAccountList
return

Run2:
gui, a:submit, nohide
if (AccountList == "") {
	msgbox, 0x40030, ERROR?, You Haven't Selected The Account
	return
}
AccountListSend(AccountList)
return

UpdateAccountList:
GuiControl, a:, AccountList, |
CAccList := ""
amountths := 0
Loop, Files, %A_ScriptDir%\%BrowserFName%\*.*, D
{
		guicontrol, a:,AccountList, %A_LoopFileName%
		CAccList .= A_LoopFileName "|"
		amountths++
}
gui, f:font, cFFFFFF s15 q2 w800, Tahoma
gui, f:add, text, x275 y457 vAmountAlt2, %amountths%
guicontrolget, AmountAlt2, f:pos
sizesh := 275 - AmountAlt2w/2
guicontrol, a:move, AmountAlt, x%sizesh%
guicontrol, a:text, AmountAlt, %amountths%
gui, f:destroy
return

UpdateGameIDList:
GuiControl, a:, GameIDList, |
cID := ""
cGame := ""
FileRead, GameIDSave, GameIDSaveD
loop, parse, GameIDSave, `n
{
	if (A_LoopField != "") {
		IHateCoding := strsplit(A_LoopField, ",")
		IDNow := trim(IHateCoding[1])
		GameNow := trim(IHateCoding[2])
		if (IDNow != "" or GameNow != "") {
			cID .= IDNow "|"
			cGame .= GameNow "|"
		}
		guicontrol, a:, GameIDList, %GameNow% (%IDNow%)
	}
}
return

DeleteCache:
math1:=0
gui, b:new, +hwndHere2 +LabelGui2 -border +alwaysontop
gui, b:color, 3b3b3b
gui, b:font, cwhite
gui, b:add, text, x5 y10, Clearing Cache...
gui, b:add, progress, x5 y25 w200 h15 +border vprogress, 0
gui, b:show
Loop, Files, %A_ScriptDir%\%BrowserFName%\*.*, D
{
	NameSave := A_LoopFileName
	Loop, Files, %A_ScriptDir%\%BrowserFName%\%NameSave%\*.*, D
	{
		if (A_LoopFileName != "Default") {
			math1++
		}
	}
	Loop, Files, %A_ScriptDir%\%BrowserFName%\%NameSave%\Default\Extensions\*.*, D
	{
		math1++
	}
	Loop, Files, %A_ScriptDir%\%BrowserFName%\%NameSave%\Default\Cache\*.*, D
	{
		math1++
	}
	Loop, Files, %A_ScriptDir%\%BrowserFName%\%NameSave%\Default\Code Cache\*.*, D
	{
		math1++
	}
}
progress := 100/math1
Cprogress := progress
Loop, Files, %A_ScriptDir%\%BrowserFName%\*.*, D
{
	NameSave := A_LoopFileName
	Loop, Files, %A_ScriptDir%\%BrowserFName%\%NameSave%\*.*, D
	{
		if (A_LoopFileName != "Default") {
			Cprogress := Cprogress
			FileRemoveDir, %A_ScriptDir%\%BrowserFName%\%NameSave%\%A_LoopFileName%, 1
			guicontrol, b:, progress, %Cprogress%
			Cprogress := Cprogress + progress
		}
	}
	filedelete, %A_ScriptDir%\%BrowserFName%\%NameSave%\Default\Cache*.*
	filedelete, %A_ScriptDir%\%BrowserFName%\%NameSave%\Default\Code Cache*.*
	Loop, Files, %A_ScriptDir%\%BrowserFName%\%NameSave%\Default\Extensions\*.*, D
	{
		Cprogress := Cprogress
		FileRemoveDir, %A_ScriptDir%\%BrowserFName%\%NameSave%\Default\Extensions\%A_LoopFileName%, 1
		guicontrol, b:, progress, %Cprogress%
		Cprogress := Cprogress + progress
	}
	Loop, Files, %A_ScriptDir%\%BrowserFName%\%NameSave%\Default\Cache\*.*, D
	{
		Cprogress := Cprogress
		FileRemoveDir, %A_ScriptDir%\%BrowserFName%\%NameSave%\Default\Cache\%A_LoopFileName%, 1
		guicontrol, b:, progress, %Cprogress%
		Cprogress := Cprogress + progress
	}
	Loop, Files, %A_ScriptDir%\%BrowserFName%\%NameSave%\Default\Code Cache\*.*, D
	{
		Cprogress := Cprogress
		FileRemoveDir, %A_ScriptDir%\%BrowserFName%\%NameSave%\Default\Code Cache\%A_LoopFileName%, 1
		guicontrol, b:, progress, %Cprogress%
		Cprogress := Cprogress + progress	
	}
}
gui, b:destroy
return

Delete:
gui, a:submit, nohide
if (AccountList == "") {
	msgbox, 0x40030, ERROR?, You Haven't Selected The Account
	return
}
msgbox, 0x40034, Cautions, Are you sure? This action is irreversible.
IfMsgBox Yes
	{
	FileRemoveDir, % A_ScriptDir . "\" . BrowserFName . "\" . AccountList, 1
	if ErrorLevel {
		msgbox, 0x40030, ERROR, YOU STILL HAVE THE ACCOUNT OPENED! PLEASE CLOSE THEM.
		return
	}
	gosub UpdateAccountList
	}
return

SearchFilter:
gosub UpdateAccountList
gui,a:submit,nohide
guicontrol,a:,AccountList, |
loop, parse, CAccList, "|"
{
	if (instr(A_LoopField, SearchBarACC))
	guicontrol,a:,AccountList, %A_LoopField%
}
return

SearchFilter2:
gosub UpdateGameIDList
gui,a:submit,nohide
guicontrol,a:,GameIDList, |
IDArr := strsplit(cID, "|")
GAMEArr := strsplit(cGame, "|")
NewIDArr := []
for index, value in IDArr {
    if (value != "")
        NewIDArr.Push(value)
}
loop % NewIDArr.Length()
{
	CurrentGame := % GAMEArr[A_Index] . " (" . IDArr[A_Index] . ")"
	if (instr(cID, GameSB2) or instr(cGame, GameSB2)) {
		guicontrol,a:,GameIDList, % CurrentGame
	}
}
return

RenameAcc:
gui, a:submit, nohide
if (AccountList == "") {
	msgbox, 0x40030, ERROR?, You Haven't Selected The Account
	return
}
gui, c:new, +hwndHere3 +LabelGui3 +alwaysontop -border
gui, c:color, 3b3b3b, 3b3b3b
gui, c:font, cwhite s10, Tahoma
gui, c:add, text, x5 y10 vfocusremove, Name:
gui, c:add, edit, x5 y25 w190 -vscroll VNewName, % AccountList
gui, c:add, button, x100 y55 h20 GRenameFun, Rename
gui, c:add, button, x40 y55 h20 gcloseguic, Cancel
gui, c:show, w200 h80
guicontrol, c:focus, focusremove
return

closeguic:
gui, c:destroy
return

RenameFun:
gui, c:submit,nohide
if (NewName == "") {
	msgbox, 0x40030, ERROR, ENTER A VALID USERNAME!
	return
}
NewName := trim(NewName)
if (RegExMatch(NewName, "[^\w\s]")) {
	msgbox, 0x40030, ERROR, ENTER A VALID USERNAME!
	return
}
loop, parse, CAccList, "|"
if (A_LoopField != "") {
	if (A_LoopField == NewName) {
		msgbox, 0x40030, ERROR, USE A DIFFERENT USERNAME!
		return
	}
}
FileMoveDir, %A_ScriptDir%\%BrowserFName%\%AccountList%, %A_ScriptDir%\%BrowserFName%\%NewName%, R
gui, c:destroy
gosub UpdateAccountList
return

JoinGame:
gui,a:submit,nohide
gosub UpdateGameIDList
if (AccountList == "") {
	msgbox, 0x40030, ERROR?, You Haven't Selected The Account
	return
}
GameSB2 := trim(GameSB2)
if (GameSB2 != "") {
	url := "https://www.roblox.com/games/" GameSB2
	html := GetPageSource(url)
	if (html == "ERROR") {
		return
	}
	if (RegExMatch(html, "data-place-name=""(.*?)""", match)) {
		gameName := match1
		if !(instr(cID, GameSB2)) {
			fileappend, % GameSB2 . ", " . gameName "`n", GameIDSaveD
		}
		RunningGameID(AccountList, GameSB2)
		gosub UpdateGameIDList
		return
		} else {
		if (GameIDList == "") {
		MsgBox, 0x40030, ERROR, CAN'T FIND THE GAME! INVALID ID'S
		return
		}else{
			MsgBox, 0x40034, ERROR, CAN'T FIND THE GAME! INVALID ID'S!`nWould you want to launch the choosen game ID instead?
			IfMsgBox, Yes
			{
				fileread, GameIDSave2, GameIDSaveD
				loop, parse, GameIDSave2, `n
				{
					if (A_LoopField != "") {
						FirstLine := strsplit(A_LoopField, ",")
						FirstLine1 := trim(FirstLine[1])
						if (instr(GameIDList, FirstLine1)) {
							RunningGameID(AccountList, FirstLine1)
							break
						}
					}
				}
			}
		}
	}
}else{
	if (GameIDList == "") {
		MsgBox, 0x40030, ERROR, PUT THE GAME ID/SELECT THE ID!
		return
	}
	fileread, GameIDSave2, GameIDSaveD
	loop, parse, GameIDSave2, `n
	{
		if (A_LoopField != "") {
			FirstLine := strsplit(A_LoopField, ",")
			FirstLine1 := trim(FirstLine[1])
			if (instr(GameIDList, FirstLine1)) {
				RunningGameID(AccountList, FirstLine1)
			break
			}
		}
	}
}
return

DeleteGame:
gui,a:submit,nohide
if (GameIDList == "") {
	MsgBox, 0x40030, ERROR, PUT THE GAME ID/SELECT THE ID!
	return
}
FileRead, GameIDSave, GameIDSaveD
FileDelete, GameIDSaveD
THISARR := strsplit(GameIDSave, "`n")
Loop % THISARR.MaxIndex()
{
    if (Trim(THISARR[A_Index]) = "")
        THISARR.Delete(A_Index)
}
loop % THISARR.MaxIndex()
{
	aaa := strsplit(THISARR[A_Index], ",")
	ThisVal := trim(aaa[1])
	ThisVal2 := trim(aaa[2])
	if !(instr(GameIDList, ThisVal)) {
		fileappend, % ThisVal . ", " . ThisVal2 "`n", GameIDSaveD
	}
}
gosub UpdateGameIDList
return

Settings:
WinGetPos, x1x, y1y,,, ahk_id %Here%
x1x := x1x+565
y1y := y1y+100
gui, d:show, x%x1x% y%y1y% w200 h200, Settings
return

UpdateTheGODDAMNSetting:
gui, d:submit,nohide
BrowserToUse := trim(BrowserToUse)
startupcc := trim(startupcc)
silentcacheremoval := trim(silentcacheremoval)
filedelete, settings
fileappend,
(
%BrowserToUse%
%startupcc%
%silentcacheremoval%
), settings
sleep 100
gosub UpdateThemSettings
return

UpdateThemSettings:
filereadline, SettingsContent, settings, 1
filereadline, StartupSettings, settings, 2
filereadline, SilentCacheRmovlal, settings, 3
Content := strsplit(SettingsContent, "`n")
Browser := % trim(Content[1])

if (Browser != "Chrome" and Browser != "Opera") {
	filedelete, settings
	fileappend,
	(
Chrome
%StartupSettings%
%SilentCacheRmovlal%
	),settings
	sleep 500
	reload
}
BrowserFName := "ChromeProfileSave"
if (Browser == "Chrome") {
	ExeRun := "chrome.exe"
}
if (Browser == "Opera") {
	ExeRun := "opera.exe"
}

StartupSettings := % trim(StartupSettings)

if (StartupSettings != "0" and StartupSettings != "1") {
	filedelete, settings
	fileappend,
	(
%SettingsContent%
0
%SilentCacheRmovlal%
	),settings
	sleep 500
	reload
}

SilentCacheRmovlal := % trim(SilentCacheRmovlal)

if (SilentCacheRmovlal != "0" and SilentCacheRmovlal != "1") {
	filedelete, settings
	fileappend,
	(
%SettingsContent%
%StartupSettings%
1
	),settings
	sleep 500
	reload
}
return

MultiThread:
gui,d:submit,nohide
if (Checkbox11 == 1) {
	run, rMultiThreader.ahk
} else {
	closeahkscript("rMultiThreader.ahk")
}
return

Decline:
msgbox, 0x40030, Declined, License Declined`, You must agree to the license to use this software.`nExiting application..., 2
exitapp
return

Agree:
FormatTime, Today, 
FileAppend,
(
**Licensed Agreed On The Date Of:** %Today%
%LicenseText%
), License_Agreed.md
gui, e:Destroy
goto TheStartOfTheCode
return

IReadAndAgreeToIt:
gui,e:submit,nohide
if (CheckToAgree == 1) {
	GuiControl, Enable, AgreedBTTR
}else{
	GuiControl, Disable, AgreedBTTR
}
return
;==============================================================================
;f1::
;gosub DeleteCache
;exitapp
;return
;f2::
;reload

WM_LBUTTONDOWN(wParam, lParam, msg, hwnd)
{
PostMessage, 0xA1, 2
}

Gui1Escape:
Gui1Close:
if (GetKeyState("Esc", "P")) {
return
}
closeahkscript("rMultiThreader.ahk")
type := 1
gosub DeleteCache
exitapp
return

Gui4Escape:
Gui4Close:
if (GetKeyState("Esc", "P")) {
return
}
gui, d:hide
return

Gui5Escape:
Gui5Close:
if (GetKeyState("Esc", "P")) {
return
}
exitapp
return
AccountListSend(User) {
global
SaveNameLastSecond := % User "|"
Run, %ExeRun% --new-window --user-data-dir="%A_ScriptDir%\%BrowserFName%\%User%" "https://roblox.com",,, User
SaveNameLastSecond .= User
IHateScriptingThis.push(SaveNameLastSecond)
}

RunningGameID(User, GMID) {
global
SaveNameLastSecond := % User "|"
Run, %ExeRun% --new-window --user-data-dir="%A_ScriptDir%\%BrowserFName%\%User%" "https://www.roblox.com/games/%GMID%",,, User
SaveNameLastSecond .= User
IHateScriptingThis.push(SaveNameLastSecond)
}

GetPageSource(url) { ; peak code bro
global
	try {
    http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    http.Open("GET", url, false)
    http.Send()
	return http.ResponseText
} catch {
msgbox, 0x40030, NO INTERNET, Weak Internet Connection OR Roblox Is Blocked, Failed to Fetch Game
return "ERROR"
}
}

closeahkscript(name){
DetectHiddenWindows On
SetTitleMatchMode RegEx

IfWinExist, i)%name%.* ahk_class AutoHotkey
	{
	WinClose
	WinWaitClose, i)%name%.* ahk_class AutoHotkey, , 2
	}
	
SetTitleMatchMode 2
}

CheckingChromeAndRemovingIt() {
global
	if (SilentCacheRmovlal := 1) { 
		for i, v in IHateScriptingThis
		{
			AccNameAlongWithWinID := strsplit(v, "|")
			if (!winexist("ahk_pid " AccNameAlongWithWinID[2])) {
				RemoveSingularCacheFile(AccNameAlongWithWinID[1])
;				msgbox,0x40000,, % "Removed Cache for " AccNameAlongWithWinID[1]
				IHateScriptingThis.removeat(i)
			}
		}
	}
}

RemoveSingularCacheFile(TheStuffToClearCacheNameFileIDKBro) {
global
	Loop, Files, %A_ScriptDir%\%BrowserFName%\%TheStuffToClearCacheNameFileIDKBro%\*.*, D
	{
		if (A_LoopFileName != "Default") {
			FileRemoveDir, %A_ScriptDir%\%BrowserFName%\%TheStuffToClearCacheNameFileIDKBro%\%A_LoopFileName%, 1
		}
	}
	filedelete, %A_ScriptDir%\%BrowserFName%\%TheStuffToClearCacheNameFileIDKBro%\Default\Cache*.*
	filedelete, %A_ScriptDir%\%BrowserFName%\%TheStuffToClearCacheNameFileIDKBro%\Default\Code Cache*.*
	Loop, Files, %A_ScriptDir%\%BrowserFName%\%TheStuffToClearCacheNameFileIDKBro%\Default\Extensions\*.*, D
	{
		FileRemoveDir, %A_ScriptDir%\%BrowserFName%\%TheStuffToClearCacheNameFileIDKBro%\Default\Extensions\%A_LoopFileName%, 1
	}
	Loop, Files, %A_ScriptDir%\%BrowserFName%\%TheStuffToClearCacheNameFileIDKBro%\Default\Cache\*.*, D
	{
		FileRemoveDir, %A_ScriptDir%\%BrowserFName%\%TheStuffToClearCacheNameFileIDKBro%\Default\Cache\%A_LoopFileName%, 1
	}
	Loop, Files, %A_ScriptDir%\%BrowserFName%\%TheStuffToClearCacheNameFileIDKBro%\Default\Code Cache\*.*, D
	{
		FileRemoveDir, %A_ScriptDir%\%BrowserFName%\%TheStuffToClearCacheNameFileIDKBro%\Default\Code Cache\%A_LoopFileName%, 1
	}
}


LicenseText() {
return "
(
---------------------------------
# PROPRIETARY LICENSE AGREEMENT
**Last Updated:** 14-03-2025 (DD-MM-YYYY) 
**Creator:** Lolzzn

## 1. GRANT OF LICENSE  

This software is created and owned by **Lolzzn** and is provided **for free use** under the following conditions:

- You **may not** modify or redistribute this software.  

- You **must not** distribute this software without explicit written authorization from **Lolzzn**. Even if granted **authorization to distribute**, you **may not** change the **official download location** or **host the software** on **alternative** platforms.

- **Sublicensing, leasing, renting, or selling this software is strictly prohibited.**

- You **must credit** the original creator **Lolzzn** if granted authorization to use or distribute it.  

- You may not **copy, modify, or create derivative works** from this script, in whole or in part, without explicit written permission from **Lolzzn**.

- This script is provided **as-is** for **execution** only. Any form of **code alteration, adaptation, or incorporation** into **other projects** is strictly **forbidden**.


## 2. DOWNLOAD & DISTRIBUTION RESTRICTIONS

- This software **must only be downloaded from the official source**: https://discord.gg/mangos.  

- **Rehosting, mirroring, or alternative download links are strictly prohibited**.  

- **Any unauthorized redistribution may result in legal action, including DMCA takedowns and copyright infringement claims.**


## 3. SAFETY DISCLAIMER

- This software is designed to be **safe to use** and does **not** contain malware, spyware, or harmful code.  

- The creator, **Lolzzn**, has taken **reasonable steps** to ensure security and reliability.  

- However, the creator **cannot guarantee** that the software will always function as expected in all environments.  


## 4. NO WARRANTY & LIMITED LIABILITY

- The creator, **Lolzzn**, is **not responsible** for any **damages, data loss, or issues** caused by using this software.  

- By using this software, you agree that the creator, **Lolzzn**, holds no liability for any direct or indirect consequences of its use.


## 5. ENFORCEMENT & PENALTIES  

- **Any unauthorized use, redistribution, or modification of this software will result in immediate revocation of your authorization and may lead to DMCA takedown and/or legal action.**


## 6. OWNERSHIP & TERMINATION 
 
- The creator, **Lolzzn**, retains **full ownership** of this software.

- The creator may **revoke this license at any time** for violations or other reasons. 


## 7. GOVERNING LAW  

- This agreement is governed by the laws of **Indonesia**. Any disputes must be resolved in the courts of **[Jakarta, Indonesia]**.  


## 8. ADDITIONAL INFORMATION

- This software is an **independent project** and is **not affiliated with**, endorsed by, or **associated with Roblox Corporation** in any way.


## 9. CONTACT INFORMATION  

**For authorization requests or reporting violations, contact: ** 
**Email:** nilavian02@gmail.com
**Official Website/Discord Server:** https://discord.gg/mangos
)"
}
