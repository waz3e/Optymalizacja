#NoEnv
#SingleInstance, Force
;
;
;  _____       _ _      _                       _____ _                     _         
; |  __ \     | | |    (_)                     / ____| |                   | |        
; | |__) |___ | | | ___ _  _____      _____   | (___ | | ___ __ _   _ _ __ | |_ _   _ 
; |  _  // _ \| | |/ _ \ |/ _ \ \ /\ / / _ \   \___ \| |/ / '__| | | | '_ \| __| | | |
; | | \ \ (_) | | |  __/ | (_) \ V  V /  __/   ____) |   <| |  | |_| | |_) | |_| |_| |
; |_|  \_\___/|_|_|\___| |\___/ \_/\_/ \___|  |_____/|_|\_\_|   \__, | .__/ \__|\__, |
;                     _/ |                                       __/ | |         __/ |
;                    |__/                                       |___/|_|        |___/ 
;
;
; Napisane przez krytyYT w 2020 roku! Projekt na licencji GNU GPL v3.0
; Dodatkowo jakiekolwiek edycje skryptu są dozwolone.
; Publikacja Skryptu bądź jego części na swoim kanale YouTube bądź na innej platformie jest zezwolone tylko jeżeli podlinkujesz autora w górnej cześci opisu (Czyli np.: nie po tagach)
; Dziękuje i pozdrawiam ~krytyYT https://kryty.xyz
;
;
;
; Kod na zmiane seta od https://www.youtube.com/watch?v=3MSkO6QVp5g
;
;
;
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 1
SetBatchLines, -1
SetMouseDelay, -1
SetKeyDelay, 0
hotkey, F10, power
pow3r = 1
IniRead, set1, config.ini, przyciski, key1
IniRead, punch22, config.ini, przyciski, key2
IniRead, punch3, config.ini, przyciski, key3
IniRead, efekty4, config.ini, przyciski, key4
IniRead, schowek5, config.ini, przyciski, key5
IniRead, miecz6, config.ini, przyciski, key6
IniRead, wedka7, config.ini, przyciski, key7
IniRead, wedka8, config.ini, przyciski, key8
IniRead, perla9, config.ini, przyciski, key9
IniRead, perla10, config.ini, przyciski, key10
IniRead, water11, config.ini, przyciski, key11
IniRead, water12, config.ini, przyciski, key12
IniRead, schowekkey13, config.ini, przyciski, key13
IniRead, efektykey14, config.ini, przyciski, key14
IniRead, snow15, config.ini, przyciski, key15
IniRead, snow16, config.ini, przyciski, key16
IniRead, scale17, config.ini, przyciski, key17
IniRead, scale18, config.ini, przyciski, key18
IniRead, schowekx11, config.ini, koordynaty, k1
IniRead, schoweky12, config.ini, koordynaty, k2
IniRead, efektx13, config.ini, koordynaty, k3
IniRead, efekty14, config.ini, koordynaty, k4
MsgBox, , TANIMINECRAFT.PL, Wbij na TaniMinecraft.pl i kup premke z kodem Rollej!
Gui,+AlwaysOnTop
Gui Add, Hotkey, x100 y8 w125 h21 vsecik
Gui Add, Text, x10 y6 w78 h23 +0x200, Bind Seta
Gui Add, Hotkey, x100 y35 w125 h21 vefekty
Gui Add, Text, x10 y33 w78 h23 +0x200, Bind Efektow
Gui Add, Hotkey, x100 y63 w125 h21 vschowek
Gui Add, Text, x10 y60 w78 h23 +0x200, Bind Schowka
Gui Add, Hotkey, x100 y93 w125 h21 vpunch
Gui Add, Text, x10 y90 w78 h23 +0x200, Bind Puncha
Gui Add, Edit, x100 y123 w125 h21 vpunch2
Gui Add, Text, x10 y120 w78 h23 +0x200, Slot Puncha
Gui Add, Edit, x100 y153 w125 h21 vmiecz
Gui Add, Text, x10 y153 w78 h23, Slot Miecza
Gui Add, Hotkey, x100 y183 w125 h21 vwedka
Gui Add, Text, x10 y181 w78 h23 +0x200, Bind Wedki
Gui Add, Edit, x100 y213 w125 h21 vwedka2
Gui Add, Text, x10 y211 w78 h23 +0x200, Slot Wedki
Gui Add, Hotkey, x100 y243 w125 h21 vperla
Gui Add, Text, x10 y241 w78 h23 +0x200, Bind Perly
Gui Add, Edit, x100 y273 w125 h21 vperla2
Gui Add, Text, x10 y271 w78 h23 +0x200, Slot Perly
Gui Add, Hotkey, x100 y298 w125 h21 vwater
Gui Add, Text, x10 y296 w78 h23 +0x200, Bind Wody
Gui Add, Edit, x100 y323 w125 h21 vwater2
Gui Add, Text, x10 y321 w78 h23 +0x200, Slot Wody
Gui Add, Hotkey, x100 y351 w125 h21 vsnow
Gui Add, Text, x10 y350 w78 h23 +0x200, Bind Sniezki
Gui Add, Edit, x100 y383 w125 h21 vsnow2
Gui Add, Text, x10 y381 w78 h23 +0x200, Slot Sniezki
Gui Add, Text, x120 y420 w78 h23 +0x200, Large
Gui Add, Text, x180 y420 w78 h23 +0x200, Normal
Gui, Add, CheckBox, x100 y420 w15 h23 vscale, Large
Gui, Add, CheckBox, x160 y420 w15 h23 vscale2, Normal
Gui Add, Text, x10 y420 w78 h23 +0x200, Gui Scale
Gui Add, Text, x22 y451 w200 h23 +0x200, Jaki przycisk klikac po kupieniu efektu?
Gui Add, Edit, x52 y480 w125 h23 vefektkey,
Gui Add, Text, x32 y505 w200 h23 +0x200, Jaki przycisk klikac po dobraniu sie?
Gui Add, Edit, x52 y530 w125 h23 vschowekkey,
Gui Add, Link, x20 y555 w214 h23 +0x200, Autor <a href="https://kryty.xyz">krytyYT</a> napisane na kanal <a href="https://www.youtube.com/channel/UCLq5bGFpMfZFuWEoesS5QUQ">Rollej</a>
Gui Add, Link, x70 y570 w214 h23 +0x200, <a href="https://discord.gg/ZTrwsGK">Discord Rolleja</a>
Gui Add, Button, x3 y630 w226 h33 gustawschowek, &Ustaw pozycje schowka
Gui Add, Button, x3 y590 w226 h33 gustawefekt, &Ustaw pozycje efektow
Gui Add, Button, x3 y667 w226 h33 gGO, &Odpalaj machine
Gui Show, w230 h710, Rollejowe Skrypty || 2.0
GuiControl, , msctls_hotkey321, %set1%
GuiControl, , msctls_hotkey322, %punch22%
GuiControl, , punch2, %punch3%
GuiControl, , efekty, %efekty4%
GuiControl, , schowek, %schowek5%
GuiControl, , miecz, %miecz6%
GuiControl, , msctls_hotkey325, %wedka7%
GuiControl, , wedka2, %wedka8%
GuiControl, , msctls_hotkey326, %perla9%
GuiControl, , perla2, %perla10%
GuiControl, , msctls_hotkey327, %water11%
GuiControl, , water2, %water12%
GuiControl, , snow, %snow15%
GuiControl, , snow2, %snow16%
GuiControl, , scale, %scale17%
GuiControl, , scale2, %scale18%
GuiControl, , efektkey, %efektykey14%
GuiControl, , schowekkey, %schowekkey13%
schowekx = %schowekx11%
schoweky = %schoweky12%
efektx = %efektx13%
efektyy = %efekty14%
if (punch3 = "ERROR" or "") {
	GuiControl, , punch2, Brak
}
if (miecz6 = "ERROR" or "") {
	GuiControl, , miecz, Brak
}
if (wedka8 = "ERROR" or "") {
	GuiControl, , wedka2, Brak
}
if (perla10 = "ERROR" or "") {
	GuiControl, , perla2, Brak
}
if (water12 = "ERROR" or "") {
	GuiControl, , water2, Brak
}
if (snow16 = "ERROR" or "") {
	GuiControl, , snow2, Brak
}
if (schowekkey13 = "ERROR" or "") {
	GuiControl, , schowekkey, Brak
}
if (efektykey14 = "ERROR" or "") {
	GuiControl, , efektkey, Brak
}
Return
GO:
GUI, submit, NoHide
if (scale = 1) {
	hotkey, ~*%secik%, zmianaseta2
}
if (scale2 = 1) {
	hotkey, ~*%secik%, zmianaseta
}
hotkey, ~*%punch%, punch
hotkey, ~*%efekty%, efekty
hotkey, ~*%schowek%, schowek
hotkey, ~*%wedka%, wedka
hotkey, ~*%perla%, perla
hotkey, ~*%water%, water
hotkey, ~*%snow%, snowball
IniWrite, %secik%, config.ini, Przyciski, key1
IniWrite, %punch%, config.ini, Przyciski, key2
IniWrite, %punch2%, config.ini, Przyciski, key3
IniWrite, %efekty%, config.ini, Przyciski, key4
IniWrite, %schowek%, config.ini, Przyciski, key5
IniWrite, %miecz%, config.ini, Przyciski, key6
IniWrite, %wedka%, config.ini, Przyciski, key7
IniWrite, %wedka2%, config.ini, Przyciski, key8
IniWrite, %perla%, config.ini, Przyciski, key9
IniWrite, %perla2%, config.ini, Przyciski, key10
IniWrite, %water%, config.ini, Przyciski, key11
IniWrite, %water2%, config.ini, Przyciski, key12
IniWrite, %schowekkey%, config.ini, Przyciski, key13
IniWrite, %efektkey%, config.ini, Przyciski, key14
IniWrite, %snow%, config.ini, Przyciski, key15
IniWrite, %snow2%, config.ini, Przyciski, key16
IniWrite, %scale%, config.ini, Przyciski, key17
IniWrite, %scale2%, config.ini, Przyciski, key18
IniWrite, %schowekx%, config.ini, Koordynaty, k1
IniWrite, %schoweky%, config.ini, Koordynaty, k2
IniWrite, %efektx%, config.ini, Koordynaty, k3
IniWrite, %efektyy%, config.ini, Koordynaty, k4
if (punch2 = "ERROR") {
	IniWrite, Brak, config.ini, Przyciski, key3
}
if (miecz = "ERROR") {
	IniWrite, Brak, config.ini, Przyciski, key6
}
if (wedka2 = "ERROR") {
	IniWrite, Brak, config.ini, Przyciski, key8
}
if (perla2 = "ERROR") {
	IniWrite, Brak, config.ini, Przyciski, key10
}
if (water2 = "ERROR") {
	IniWrite, Brak, config.ini, Przyciski, key12
}
if (snow2 = "ERROR") {
	IniWrite, Brak, config.ini, Przyciski, key16
}
if (schowekkey = "ERROR") {
	IniWrite, Brak, config.ini, Przyciski, key13
}
if (efektkey = "ERROR") {
	IniWrite, Brak, config.ini, Przyciski, key14
}
MsgBox, , Ustawienia, Zapisano ustawienia!,
MAIN()
return
MAIN(){
sleep 5
}
Komenda(string){
	SendInput {T}
	sleep 65
	Send /%string%
	sleep 85
	SendInput {Enter}
	sleep 85
}
return
snowball:
{
	IfWinnotActive, Minecraft
		return
	If (pow3r = 0) {
		return
	}
	send %snow2%
	send {RButton}
	sleep 123
	send %miecz%
}
return
ustawefekt:
{
	Sleep 100
    KeyWait, LButton, D
    MouseGetPos, efektx, efektyy
    MsgBox, , Efekt, Pozycja efektu zostala zapisana (%efektx% %efektyy%),
}
return
ustawschowek:
{
	Sleep 100
    KeyWait, LButton, D
    MouseGetPos, schowekx, schoweky
    MsgBox, , Schowek, Pozycja schowku zostala zapisana (%schowekx% %schoweky%),
    
}
return
water:
{
	IfWinnotActive, Minecraft
		return
	If (pow3r = 0) {
		return
	}
	send %water2%
	sleep 100
	send {RButton}
	sleep 50
	send {RButton}
	sleep 100
	send %miecz%
}
return
wedka:
{
	IfWinnotActive, Minecraft
		return
	If (pow3r = 0) {
		return
	}
	send %wedka2%
	send {RButton}
	sleep 123
	send %miecz%
}
return
perla:
{
	IfWinnotActive, Minecraft
		return
	If (pow3r = 0) {
		return
	}
	send %perla2%
	send {RButton}
	sleep 123
	send %miecz%
}
return
schowek:
{
	IfWinnotActive, Minecraft
		return
	If (pow3r = 0) {
		return
	}
	Komenda("schowek")
	sleep 100
	SendInput {click left %schowekx%, %schoweky%}
	sleep 50
	if (schowekkey = "Brak" or "") {
		return
	}
	send {%schowekkey%}
}
return
efekty:
{
	IfWinnotActive, Minecraft
		return
	If (pow3r = 0) {
		return
	}
	Komenda("efekty")
	sleep 100
	SendInput {click left %efektx%, %efektyy%}
	sleep 50
	if (efektkey = "Brak" or "") {
		return
	}
	send {%efektkey%}
}
return
punch:
{
	IfWinnotActive, Minecraft
		return
	If (pow3r = 0) {
		return
	}
	send %punch2%
	send {lctrl down}
	sleep 1
	send {Rbutton down}
	sleep 152
	send {Rbutton up}
	send {s}
	sleep 1
	send {lctrl up}
}
return
zmianaseta2:
{
	IfWinnotActive, Minecraft
		return
	If (pow3r = 0) {
		return
	}
	BlockInput, On
	send e
	sleep 40
	MouseGetPos, X, Y
	X2 := X - 212
	Y2 := Y + 25
	X3 := X2
	Y3 := Y2 - 212
	sendinput {click left %X2%, %Y2%}
	sleep 12
	sendinput {click left %X3%, %Y3%}
	sleep 12
	sendinput {click left %X2%, %Y2%}
	X2 := X2 + 53
	Y3 := Y3 + 53
	sleep 12
	sendinput {click left %X2%, %Y2%}
	sleep 12
	sendinput {click left %X3%, %Y3%}
	sleep 12
	sendinput {click left %X2%, %Y2%}
	X2 := X2 + 53
	Y3 := Y3 + 53
	sleep 12
	sendinput {click left %X2%, %Y2%}
	sleep 12
	sendinput {click left %X3%, %Y3%}
	sleep 12
	sendinput {click left %X2%, %Y2%}
	X2 := X2 + 53
	Y3 := Y3 + 53
	sleep 12
	sendinput {click left %X2%, %Y2%}
	sleep 12
	sendinput {click left %X3%, %Y3%}
	sleep 12
	sendinput {click left %X2%, %Y2%}
	X2 := X2 + 53
	Y3 := Y3 + 53
	sleep 40
	send e
	Random, rnd,1,100
	if (rnd <= 25) {
		temp = %clipboard%
		clipboard := ">> S.krypt na wszystkie serwery! YT: Rollej <<"
		sleep 30
		send {T}
		sleep 30
		sendinput {CTRL down}
		sendinput {V down}
		sleep 30
		sendinput {CTRL up}
		sendinput {V up}
		send {ENTER}
	}
	BlockInput, Off
}
return
zmianaseta:
{
	IfWinnotActive, Minecraft
		return
	If (pow3r = 0) {
		return
	}
	BlockInput, On
	send e
	sleep 40
	MouseGetPos, X, Y
	X2 := X - 147
	Y2 := Y + 18
	X3 := X2
	Y3 := Y2 - 160
	sendinput {click left %X2%, %Y2%}
	sendinput {click left %X3%, %Y3%}
	sendinput {click left %X2%, %Y2%}
	X2 := X2 + 33
	Y3 := Y3 + 33
	sendinput {click left %X2%, %Y2%}
	sendinput {click left %X3%, %Y3%}
	sendinput {click left %X2%, %Y2%}
	X2 := X2 + 33
	Y3 := Y3 + 33
	sendinput {click left %X2%, %Y2%}
	sendinput {click left %X3%, %Y3%}
	sendinput {click left %X2%, %Y2%}
	X2 := X2 + 33
	Y3 := Y3 + 33
	sendinput {click left %X2%, %Y2%}
	sendinput {click left %X3%, %Y3%}
	sendinput {click left %X2%, %Y2%}
	X2 := X2 + 33
	Y3 := Y3 + 33
	sleep 40
	send e
	Random, rnd,1,100
	if (rnd <= 25) {
		temp = %clipboard%
		clipboard := ">> S.krypt na wszystkie serwery! YT: Rollej <<"
		sleep 30
		send {T}
		sleep 30
		sendinput {CTRL down}
		sendinput {V down}
		sleep 30
		sendinput {CTRL up}
		sendinput {V up}
		send {ENTER}
	}
	BlockInput, Off
}
return
power:
{
	if (pow3r = 1) {
		pow3r = 0
	} else {
		pow3r = 1
	}
}
return
exit:
exitapp
return
GuiEscape:
GuiClose:
ExitApp