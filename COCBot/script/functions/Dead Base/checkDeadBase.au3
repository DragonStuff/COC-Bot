Func checkDeadBase()
	Return ZombieSearch() ; just so it compiles
EndFunc   ;==>checkDeadBase

;checkDeadBase Variables:-------------===========================
GLOBAL $AdjustTolerance=0
Global $Tolerance[5][11]=[[55,55,55,80,70,70,75,80,0,75,65],[55,55,55,80,80,70,75,80,0,75,65],[55,55,55,80,80,70,75,80,0,75,65],[55,55,55,80,80,60,75,75,0,75,60],[55,55,55,80,80,70,75,80,0,75,65]]
Global $ZC = 0, $ZombieCount = 0;, $E
Global $ZombieFileSets = 4 ;Variant Image to use organized as per Folder
Global $ZSExclude = 0 ;Set to 0 to include Elixir Lvl 6, 1 to include lvl 7 and so on..
Global $Lx[4] = [0, 400, 0, 400]
Global $Ly[4] = [0, 0, 265, 265]
Global $Rx[4] = [460, 860, 400, 860]
Global $Ry[4] = [325, 325, 590, 590]

Global $Area[5][11][4], $IS_x[11][4], $IS_y[11][4], $E[5][11]

$E[0][0] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX1\E6F9.bmp"
$E[0][1] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX1\E7F9.bmp"
$E[0][2] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX1\E8F9.bmp"
$E[0][3] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX1\E9F9.bmp"
$E[0][4] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX1\E10F8.bmp"
$E[0][5] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX1\E10F9.bmp"
$E[0][6] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX1\E11F8.bmp"
$E[0][7] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX1\E11F9.bmp"
$E[0][8] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX1\E12F7.bmp"
$E[0][9] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX1\E12F8.bmp"
$E[0][10] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX1\E12F9.bmp"

$E[1][0] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX2\E6F9.bmp"
$E[1][1] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX2\E7F9.bmp"
$E[1][2] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX2\E8F9.bmp"
$E[1][3] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX2\E9F9.bmp"
$E[1][4] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX2\E10F8.bmp"
$E[1][5] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX2\E10F9.bmp"
$E[1][6] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX2\E11F8.bmp"
$E[1][7] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX2\E11F9.bmp"
$E[1][8] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX2\E12F7.bmp"
$E[1][9] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX2\E12F8.bmp"
$E[1][10] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX2\E12F9.bmp"

$E[2][0] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX3\E6F9.bmp"
$E[2][1] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX3\E7F9.bmp"
$E[2][2] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX3\E8F9.bmp"
$E[2][3] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX3\E9F9.bmp"
$E[2][4] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX3\E10F8.bmp"
$E[2][5] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX3\E10F9.bmp"
$E[2][6] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX3\E11F8.bmp"
$E[2][7] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX3\E11F9.bmp"
$E[2][8] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX3\E12F7.bmp"
$E[2][9] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX3\E12F8.bmp"
$E[2][10] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX3\E12F9.bmp"

$E[3][0] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX4\E6F9.bmp"
$E[3][1] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX4\E7F9.bmp"
$E[3][2] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX4\E8F9.bmp"
$E[3][3] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX4\E9F9.bmp"
$E[3][4] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX4\E10F8.bmp"
$E[3][5] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX4\E10F9.bmp"
$E[3][6] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX4\E11F8.bmp"
$E[3][7] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX4\E11F9.bmp"
$E[3][8] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX4\E12F7.bmp"
$E[3][9] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX4\E12F8.bmp"
$E[3][10] = @ScriptDir & "\COCBot\script\functions\Dead Base\images\ELIX4\E12F9.bmp"

#Region ### Check Dead Base Functions ###
;==============================================================================================================
;===Main Function==============================================================================================
;--------------------------------------------------------------------------------------------------------------
;Uses imagesearch to see whether a collector is full or semi-full to indicate that it is a dead base
;Returns True if it is, returns false if it is not a dead base
;--------------------------------------------------------------------------------------------------------------

Func ZombieSearch()
   _CaptureRegion()
	$ZombieCount = 0
	 $ZC = 0
	 For $s = 0 To ($ZombieFileSets - 1) Step 1
		 For $p = 10 To 0 + $ZSExclude Step -1
			 If FileExists($E[$s][$p]) Then
			 $Area[$s][$p][0] = _ImageSearch($E[$s][$p], 1, $IS_x[$p][0], $IS_y[$p][0], $Tolerance[$s][$p]+$AdjustTolerance)
				 If $Area[$s][$p][0] > 0 Then
					 $ZC = 1
					 ExitLoop (2)
				 EndIf
			 Else
				 $Area[$s][$p][0]= 0
			 EndIf
		 Next
	 Next
	 $ZombieCount += $ZC
	If $ZombieCount > 0 Then
		Return True
	Else
		Return False
	EndIf
EndFunc   ;==>ZombieSearch

;==============================================================================================================
;===Other Functions============================================================================================
;==============================================================================================================

Func _ImageSearch($findImage, $resultPosition, ByRef $x, ByRef $y, $Tolerance)
	Return _ImageSearchArea($findImage, $resultPosition, 0, 0, 840, 720, $x, $y, $Tolerance)
EndFunc   ;==>_ImageSearch

Func _ImageSearchArea($findImage, $resultPosition, $x1, $y1, $right, $bottom, ByRef $x, ByRef $y, $Tolerance)
	Global $HBMP = $hHBitmap
	If $ichkBackground = 0 Then
	    $HBMP = 0
		$x1 += $BSPos[0]
		$y1 += $BSPos[1]
		$right += $BSPos[0]
		$bottom += $BSPos[1]
	EndIf
	;MsgBox(0,"asd","" & $x1 & " " & $y1 & " " & $right & " " & $bottom)
	#cs
		If IsString($findImage) Then
		$result = DllCall("COCBot64.dll","str","ImageSearch","int",$x1,"int",$y1,"int",$right,"int",$bottom,"str",$findImage,"ptr",$HBMP)
		If IsArray($result) = False Then $result = DllCall("COCBot32.dll","str","ImageSearch","int",$x1,"int",$y1,"int",$right,"int",$bottom,"str",$findImage,"ptr",$HBMP)
		Else
		$result = DllCall("COCBot64.dll","str","ImageSearch","int",$x1,"int",$y1,"int",$right,"int",$bottom,"ptr",$findImage,"ptr",$HBMP)
		If IsArray($result) = False Then $result = DllCall("COCBot32.dll","str","ImageSearch","int",$x1,"int",$y1,"int",$right,"int",$bottom,"ptr",$findImage,"ptr",$HBMP)
		EndIf
	#ce

	If IsString($findImage) Then
		If $Tolerance > 0 Then $findImage = "*" & $Tolerance & " " & $findImage
		If $HBMP = 0 Then
			$result = DllCall("COCBot\script\functions\Dead Base\COCBot.dll", "str", "ImageSearch", "int", $x1, "int", $y1, "int", $right, "int", $bottom, "str", $findImage)
		Else
			$result = DllCall("COCBot\script\functions\Dead Base\COCBot.dll", "str", "ImageSearchEx", "int", $x1, "int", $y1, "int", $right, "int", $bottom, "str", $findImage, "ptr", $HBMP)
		EndIf
	Else
		$result = DllCall("COCBot\script\functions\Dead Base\COCBot.dll", "str", "ImageSearchExt", "int", $x1, "int", $y1, "int", $right, "int", $bottom, "int", $Tolerance, "ptr", $findImage, "ptr", $HBMP)
	EndIf

	; If error exit
	If IsArray($result) Then
		If $result[0] = "0" Then Return 0
	Else
		SetLog("Error cannot check for Dead Base, Attacking...")
		Return 1
	EndIf


	; Otherwise get the x,y location of the match and the size of the image to
	; compute the centre of search
	$array = StringSplit($result[0], "|")
	If (UBound($array) >= 4) Then
		$x = Int(Number($array[2]))
		$y = Int(Number($array[3]))
		If $resultPosition = 1 Then
			$x = $x + Int(Number($array[4]) / 2)
			$y = $y + Int(Number($array[5]) / 2)
		EndIf
	    If $Hide = False Then
		   $x -= $x1
		   $y -= $y1
	    EndIf
	  Return 1
	EndIf
EndFunc   ;==>_ImageSearchArea
#EndRegion ### Check Dead Base Functions ###
