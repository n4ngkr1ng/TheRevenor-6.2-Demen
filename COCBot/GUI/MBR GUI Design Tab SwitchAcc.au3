; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design Tab SwitchAcc
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

$hGUI_SwitchAcc = GUICreate("", $_GUI_MAIN_WIDTH - 28, $_GUI_MAIN_HEIGHT - 255 - 28, 5, 25, BitOR($WS_CHILD, $WS_TABSTOP), -1, $hGUI_MOD)
GUISwitch($hGUI_SwitchAcc)

Local $x = 25, $y = 25
	$grpProfiles = GUICtrlCreateGroup(GetTranslated(637,1, "Switch Profiles"), $x - 20, $y - 20, 433, 85)	; Resize Profile Group to make room for SwitchAcc Grp - DEMEN
		$x -= 5
	   ; Defining botting type of eachh profile - SwitchAcc - DEMEN
	    $HelpSwich = GUICtrlCreateLabel("1) Create profile for each account at Profiles Tab." & @CRLF & _
		"2) Load every profile at Profiles Tab and match it to account.", $x - 3, $y + 1, 200, 55)
	    $lblProfile = GUICtrlCreateLabel("Profile Type:", $x + 230, $y , -1, -1)
			$txtTip = "Choosing type for this Profile" & @CRLF & "Active Profile for botting" & @CRLF & "Donate Profile for donating only" & @CRLF & "Idle Profile for staying inactive"
			GUICtrlSetTip(-1, $txtTip)

	    $radActiveProfile= GUICtrlCreateRadio("Active", $x + 245 , $y + 18, -1, 16)
			GUICtrlSetTip(-1, "Set as Active Profile for training troops & attacking")
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetOnEvent(-1, "radProfileType")

		$radDonateProfile = GUICtrlCreateRadio("Donate", $x + 305, $y + 18, -1, 16)
			GUICtrlSetTip(-1, "Set as Donating Profile for training troops & donating only")
			GUICtrlSetOnEvent(-1, "radProfileType")

		$radIdleProfile = GUICtrlCreateRadio("Idle", $x + 375, $y + 18, -1, 16)
			GUICtrlSetTip(-1, "Set as Idle Profile. The Bot will ignore this Profile")
			GUICtrlSetOnEvent(-1, "radProfileType")

	    $lblMatchProfileAcc = GUICtrlCreateLabel("Matching Acc. No.", $x + 230 , $y + 42 , -1, 16)
			$txtTip = "Select the index of CoC Account to match with this Profile"
			GUICtrlSetTip(-1, $txtTip)

		$cmbMatchProfileAcc = GUICtrlCreateCombo("", $x + 330, $y + 38, 60, 18, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, "---" & "|" & "Acc. 1" & "|" & "Acc. 2" & "|" & "Acc. 3" & "|" & "Acc. 4" & "|" & "Acc. 5" & "|" & "Acc. 6", "---")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "cmbMatchProfileAcc")

	GUICtrlCreateGroup("", -99, -99, 1, 1)
;GUISetState()

    ; SwitchAcc - DEMEN
	Local $x = 25, $y = 115
	$grpSwitchAcc = GUICtrlCreateGroup("Switch Account Mode", $x - 20, $y - 20, 220, 160)

		$chkSwitchAcc = GUICtrlCreateCheckbox("Enable Switch Account", $x , $y, -1, -1)
			$txtTip = "Switch to another account & profile when troop training time is >= 3 minutes" & @CRLF & "This function supports maximum 6 CoC accounts & 6 Bot profiles" & @CRLF & "Make sure to create sufficient Profiles equal to number of CoC Accounts, and align the index of accounts order with profiles order"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkSwitchAcc")

		$lblTotalAccount = GUICtrlCreateLabel("Total CoC Acc:", $x + 15, $y + 29, -1, -1)
			$txtTip = "Choose number of CoC Accounts pre-logged"
			GUICtrlSetState(-1, $GUI_DISABLE)

		$cmbTotalAccount= GUICtrlCreateCombo("", $x + 100, $y + 25, -1, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, "Auto detect" & "|" & "1 Account" & "|" & "2 Accounts" & "|" & "3 Accounts" & "|" & "4 Accounts" & "|" & "5 Accounts" & "|" & "6 Accounts", "Auto detect")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)

		$radSmartSwitch= GUICtrlCreateRadio("Smart switch", $x + 15 , $y + 55, -1, 16)
			GUICtrlSetTip(-1, "Switch to account with the shortest remain training time")
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)

		$radNormalSwitch = GUICtrlCreateRadio("Normal switch", $x + 100, $y + 55, -1, 16)
			GUICtrlSetTip(-1, "Switching accounts continously")
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "radNormalSwitch")

		$y += 80
		$chkUseTrainingClose = GUICtrlCreateCheckbox("Combo Sleep after Switch Account", $x, $y, -1, -1)
			$txtTip = "Close CoC combo with Switch Account when there is more than 3 mins remaining on training time of all accounts."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkUseTrainingClose")
		$radCloseCoC= GUICtrlCreateRadio("Close CoC", $x + 15 , $y + 30, -1, 16)
			GUICtrlSetState(-1, $GUI_CHECKED)
		$radCloseAndroid = GUICtrlCreateRadio("Close Android", $x + 100, $y + 30, -1, 16)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	; Profiles & Account matching
    Local $x = 250, $y = 115
	  $grpSwitchAccMapping = GUICtrlCreateGroup("Profiles", $x - 20, $y - 20, 208, 267)
		$btnUpdateProfiles = GUICtrlCreateButton("Update Profiles/ Acc matching", $x, $y - 5 , 170, 25)
		GUICtrlSetOnEvent(-1, "btnUpdateProfile")
		Global $lblProfileList[8]
	  $y += 25
		 For $i = 0 To 7
			$lblProfileList[$i] = GUICtrlCreateLabel("", $x, $y + ($i) * 25, 190, 18, $SS_LEFT)
		 Next
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	; Restart Android - DEMEN
	Local $x = 25, $y = 279
	$grpRestartAndroid = GUICtrlCreateGroup("Restart Android", $x - 20, $y - 20, 220, 103)
	    $chkRestartAndroid = GUICtrlCreateCheckbox("Restart Android every" & ":", $x, $y, -1, -1)
			$txtTip = "Restart Android after long searches or after getting stuck at opening train window"
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			GUICtrlSetOnEvent(-1, "chkRestartAndroid")
		$txtRestartAndroidSearchLimit = GUICtrlCreateInput("200", $x + 20, $y + 30, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 4)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblRestartAndroidSearchLimit = GUICtrlCreateLabel("Search(es)", $x + 57, $y + 32, -1, -1)

		$txtRestartAndroidTrainError = GUICtrlCreateInput("10", $x + 20, $y + 55, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 4)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblRestartAndroidTrainError = GUICtrlCreateLabel("times error at Train Window", $x + 57, $y + 57, -1, -1)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
