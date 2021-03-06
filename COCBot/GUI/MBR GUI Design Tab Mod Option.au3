; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design Tab SmartZap
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: LunaEclipse(February, 2016)
; Modified ......: TheRevenor (Jul, 2016)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
$hGUI_ModOption = GUICreate("", $_GUI_MAIN_WIDTH - 28, $_GUI_MAIN_HEIGHT - 255 - 28, 5, 25, BitOR($WS_CHILD, $WS_TABSTOP), -1, $hGUI_MOD)
GUISetBkColor($COLOR_WHITE, $hGUI_ModOption)

GUISwitch($hGUI_ModOption)

	; SmartZap Settings
	Local $x = 20, $y = 25
    $grpStatsMisc = GUICtrlCreateGroup("Smart Zap && Extreme Zap", $x - 20, $y - 20, 438, 148)
		GUICtrlCreateIcon($pIconLib, $eIcnLightSpell, $x - 10, $y + 20, 24, 24)
		GUICtrlCreateIcon($pIconLib, $eIcnDrill, $x - 10, $y - 7, 24, 24)
		$chkSmartLightSpell = GUICtrlCreateCheckbox("Use Lightning Spells to SmartZap Drills", $x + 20, $y - 5, -1, -1)
			$txtTip = "Check this to drop Lightning Spells on top of Dark Elixir Drills." & @CRLF & @CRLF & _
					  "Remember to go to the tab 'troops' and put the maximum capacity " & @CRLF & _
					  "of your spell factory and the number of spells so that the bot " & @CRLF & _
					  "can function perfectly."
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkSmartLightSpell")
			GUICtrlSetState(-1, $GUI_UNCHECKED)
		$chkExtLightSpell = GUICtrlCreateCheckbox("Use ExtremeZap To Zap Dark Drill", $x + 20, $y + 21, -1, -1)
			$txtTip = "Check this to drop Extreme lightning spells on Dark Elixir Drills," & @CRLF & @CRLF & _
					  "__If You Do Not Like SmartZap, This Is The Right Choice.__"
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "ExtLightSpell")
			GUICtrlSetState(-1, $GUI_UNCHECKED)
		$chkSmartZapDB = GUICtrlCreateCheckbox("Only Zap Drills in Dead Bases", $x + 20, $y + 47, -1, -1)
			$txtTip = "It is recommended you only zap drills in dead bases as most of the " & @CRLF & _
					  "Dark Elixir in a live base will be in the storage."
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkSmartZapDB")
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblSmartZap = GUICtrlCreateLabel("Min. amount of Dark Elixir:", $x + 0, $y + 74, 160, -1, $SS_RIGHT)
		$txtMinDark = GUICtrlCreateInput("250", $x + 180, $y + 69, 35, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
		    $txtTip = "The value here depends a lot on what level your Town Hall is, " & @CRLF & _
					  "and what level drills you most often see." & @CRLF & @CRLF & _
					  "Input The Min Dark Elixir If You Want To Extreme Drill Zap"
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 4)
			GUICtrlSetOnEvent(-1, "txtMinDark")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkSmartZapSaveHeroes = GUICtrlCreateCheckbox("Don't Zap on Town Hall Snipe when Heroes Deployed", $x + 20, $y + 94, -1, -1)
			$txtTip = "This will stop SmartZap from zapping a base on a Town Hall Snipe " & @CRLF & _
					  "if your heroes were deployed. " & @CRLF & @CRLF & _
					  "This protects their health so they will be ready for battle sooner!"
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkSmartZapSaveHeroes")
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
	Local $x = 236, $y = 25
		$picSmartZap = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 160, $y + 3, 24, 24)
		$lblSmartZap = GUICtrlCreateLabel("0", $x + 60, $y + 5, 80, 30, $SS_RIGHT)
			GUICtrlSetFont(-1, 16, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
			GUICtrlSetColor(-1, 0x279B61)
			$txtTip = "Number of dark elixir zapped during the attack with lightning."
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlCreateIcon($pIconLib, $eIcnLightSpell, $x + 160, $y + 40, 24, 24)
		$lblLightningUsed = GUICtrlCreateLabel("0", $x + 60, $y + 40, 80, 30, $SS_RIGHT)
			GUICtrlSetFont(-1, 16, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
			GUICtrlSetColor(-1, 0x279B61)
			$txtTip = "Amount of used spells."
			_GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
;GUICtrlCreateTabItem("")

; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design Tab Mod Option
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: lakereng
; Modified ......: IceCube and TheRevenor (Jul, 2016)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Local $x = 20, $y = 177 ;150
	$grpMultyFarming = GUICtrlCreateGroup( "Multy-Farming With Smart Switch", $x - 20, $y - 20, 438, 65)
	;$x -= 10
		$chkMultyFarming = GUICtrlCreateCheckbox(GetTranslated(17,1, "Multy-Farming"), $x - 10, $y -7, -1 , -1)
			$txtTip = GetTranslated(17,3, "Will switch account and attack, then switch back")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "MultiFarming")
		$chkSwitchDonate = GUICtrlCreateCheckbox(GetTranslated(6,1, "Donate"), $x - 10, $y +13, -1, -1)
			$txtTip = GetTranslated(17,4, "Will switch account For Donate, then switch back")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "SwitchDonate")
		$Account = GUICtrlCreateInput("2", $x +170, $y -5, 18, 15, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(17,5, "How many account to use For multy-farming")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 1)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblmultyAcc = GUICtrlCreateLabel(GetTranslated(17,2, "How Many:"), $x +100, $y -2, -1, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblmultyAccBtn = GUICtrlCreateLabel(GetTranslated(17, 22, "Fast Switch:"), $x +100, $y +18, -1, -1)
			$txtTip = GetTranslated(17, 22, "Fast switch between accounts")
			_GUICtrlSetTip(-1, $txtTip)
		$btnmultyAcc1 = GUICtrlCreateButton("#1", $x + 170, $y +15, 20, 18)
			$txtTip = GetTranslated(17,22, "Switch to Main Account")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnmultyAcc1")
			GUICtrlSetState(-1, $GUI_DISABLE)			
		$btnmultyAcc2 = GUICtrlCreateButton("#2", $x + 200, $y +15, 20, 18)
			$txtTip = GetTranslated(17,23, "Switch to Second Account")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnmultyAcc2")
			GUICtrlSetState(-1, $GUI_DISABLE)	
		$btnmultyAcc3 = GUICtrlCreateButton("#3", $x + 230, $y +15, 20, 18)
			$txtTip = GetTranslated(17,24, "Switch to Third Account")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnmultyAcc3")
			GUICtrlSetState(-1, $GUI_DISABLE)	
		$btnmultyAcc4 = GUICtrlCreateButton("#4", $x + 260, $y +15, 20, 18)
			$txtTip = GetTranslated(17,25, "Switch to Fourth Account")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnmultyAcc4")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$btnmultyAcc5 = GUICtrlCreateButton("#5", $x + 290, $y +15, 20, 18)
			$txtTip = GetTranslated(17,26, "Switch to Fifth Account")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnmultyAcc5")
			GUICtrlSetState(-1, $GUI_DISABLE)	
		$btnmultyAcc6 = GUICtrlCreateButton("#6", $x + 320, $y +15, 20, 18)
			$txtTip = GetTranslated(17,27, "Switch to Sixth Account")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnmultyAcc6")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$btnmultyDetectAcc = GUICtrlCreateButton("?", $x + 350, $y +15, 20, 18)
			$txtTip = GetTranslated(17,28, "Detect Current Account")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnmultyDetectAcc")
			GUICtrlSetState(-1, $GUI_ENABLE)				
		GUICtrlCreateGroup("", -99, -99, 1, 1)

; #FUNCTION# ====================================================================================================================
; Name ..........: Android Settings
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: LunaEclipse(February, 2016)
; Modified ......: TheRevenor (Jul, 2016)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

	Local $x = 20, $y = 247
	$grpHideAndroid = GUICtrlCreateGroup("Android Options", $x - 20, $y - 20, 438, 73)
		$cmbAndroid = GUICtrlCreateCombo("", $x - 10, $y - 5, 130, 18, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Use this to select the Android Emulator to use with this profile."
			_GUICtrlSetTip(-1, $txtTip)
			setupAndroidComboBox()
			GUICtrlSetState(-1, $GUI_SHOW)
			GUICtrlSetOnEvent(-1, "cmbAndroid")
		$lblAndroidInstance = GUICtrlCreateLabel("Instance:", $x + 130, $y - 2 , 60, 21, $SS_RIGHT)
		$txtAndroidInstance = GUICtrlCreateInput("", $x + 200, $y - 5, 210, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			$txtTip = "Enter the Instance to use with this profile."
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "txtAndroidInstance")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkFastADBClicks = GUICtrlCreateCheckbox("Enable Fast ADB Clicks", $x - 10, $y + 20, -1, -1)
			$txtTip = "Tick this to enable faster ADB deployment of Troops for MEmu and Droid4x" & @CRLF & @CRLF & _ 
				      "     WARNING:  This is experimental, if you have issues with deployment, disable it."
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkFastADBClicks")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
