; Orthopedic Referral Checklist - Total Joint Replacement Pre-surg. Eval 
; tool to eval before referral and as Pre-op eval as well
; Walker Jackson, MD; 9/19/17
; Texas Orthopedics / Sports & Rehabilitations Associates (Austin Texas) 

; set up variables
oPT := 0, oBMI := 0, oA1c := 0, oSmoke := 0, oAnticoag := 0, oWarfarin := 0, oXeralto := 0
oASA := 0, oCardiac :=0, oAnticoag := 0
oCoag = 0

rptString := ""

Gui, Add, GroupBox, x6 y5 w460 h319 , Risk Check List

Gui, Add, Text, x16 y25 w340 h30 , Has the patient failed conservative meaures?  (These include NSAID's / analgesics`, steroid joint injections`, PT`, weight loss`, exercise program)
Gui, Add, Radio, x366 y15 w40 h30 voPT goPT , Y
Gui, Add, Radio, x416 y15 w40 h30 goPT , N

Gui, Add, Text, x16 y65 w340 h30 , Is the BMI >= 40`, or >=35 with comorbidities?   (increased post-op risk)
Gui, Add, Radio, x366 y55 w40 h30 voBMI goBMI, Y
Gui, Add, Radio, x416 y55 w40 h30 goBMI, N

Gui, Add, Text, x16 y102 w340 h30 , Is the A1c >= 7.5`%  (increased post-op risk)
Gui, Add, Radio, x366 y95 w40 h30 voA1c goA1c, Y
Gui, Add, Radio, x416 y95 w40 h30 goA1c, N

Gui, Add, Text, x16 y142 w340 h30 , If a smoker`, has the patient quite or not smoked for at least the past 6 weeks?
Gui, Add, Radio, x366 y135 w40 h30 voSmoke goSmoke, Y
Gui, Add, Radio, x416 y135 w40 h30 goSmoke, N

Gui, Add, Text, x16 y182 w340 h100 , Is the patient on anticoagulation for a medical indication?
Gui, Add, Radio, x366 y175 w40 h30  voAnticoag goAnticoag, Y
Gui, Add, Radio, x416 y175 w40 h30 goAnticoag, N
Gui, Add, Text, x30 y210, a. Warfarin or Coumadin with plan for bridging
Gui, Add, Text, x30 y235, b.  Xeralto / Eliquis
Gui, Add, Text, x20 y260, c.  Aspirin / Plavix
Gui, Add, Radio, x366 y200 w40 h30 voWarfarin goWarfarin, Y
;Gui, Add, Radio, x416 y200 w40 h30  goWarfarin, N 
Gui, Add, Radio, x366 y225 w40 h30 voXeralto goXeralto, Y
;Gui, Add, Radio, x416 y225 w40 h30  goXeralto, N 
Gui, Add, Radio, x366 y250 w40 h30 voAsa goASA, Y
;Gui, Add, Radio, x416 y250 w40 h30  goASA, N

Gui, Add, Text, X16 y300 w340 h30, Is the patient stable for surgery from a cardiac Standpoint? 
Gui, Add, Radio, x366 y290 w40 h30 voCardiac goCardiac, Y
Gui, Add, Radio, x416 y290 w40 h30 goCardiac, N 

; ********************

Gui, Add, GroupBox, x6 y332 w460 h380 , Risk Assessment and Prediction Tool`; Discharge Planning
Gui, Add, Text, x16 y355 w150 h50 , What is their age group?
Gui, Add, Radio, x276 y355 w90 h20 voAge goAge , > 75 years (0)
Gui, Add, Radio, x176 y380 w90 h20 goAge , 66-75 years (1)
Gui, Add, Radio, x176 y355 w90 h20 goAge , 50-65 years (2)

Gui, Add, Text, x16 y410 w150 h50 , Gender?
Gui, Add, Radio, x176 y435 w90 h20 voSex goSex , Female (1)
Gui, Add, Radio, x176 y410 w90 h20 goSex, Male (2)


Gui, Add, Text, x16 y470 w150 h50 , How far`, on avg.`, can they walk? (a block is ~ 200m)
Gui, Add, Radio, x356 y470 w100 h50 voWalk goWalk , Housebound (most of the time) (0)
Gui, Add, Radio, x176 y500 w170 h20 goWalk , 1-2 blocks (shopping center) (1)
Gui, Add, Radio, x176 y470 w170 h20 goWalk, 2 blocks or more (2)

Gui, Add, Text, x16 y530 w150 h50 , Which Gait aid do they use? (More often than not)
Gui, Add, Radio, x356 y530 w90 h30 voCane goCane, Crutches / frame (0)
Gui, Add, Radio, x176 y560 w130 h20 goCane, Single point stick (1)
Gui, Add, Radio, x176 y530 w90 h20 goCane, None (2)

Gui, Add, Text, x16 y590 w150 h50 , Do they use community supports? (Home help`, meals-on-wheels`, district nurse)
Gui, Add, Radio, x176 y610 w130 h20 voComHelp goComHelp, 2 or more / week (0)
Gui, Add, Radio, x176 y590 w130 h20 goComHelp, None or 1 / week (1)

Gui, Add, Text, x16 y650 w150 h50 , Will you live with someone who can care for your after your operation?
Gui, Add, Radio, x176 y650 w80 h20 voLiveWith goLiveWith , Yes (3)
Gui, Add, Radio, x176 y675 w80 h20 goLiveWith, No (0)

Gui, Add, Button, x326 y570 w120 h30 goriskScore, Risk Score
Gui, Add, Edit, x326 y610 w120 h20 , 

Gui, Add, Groupbox, x235 y642 w225 h65, Risk Interpretation
Gui, Add, Text, x246 y655 w210 h55 , ** < 6 Post acute care facility (SNF or Rehab)`n** 6-9 Home health PT/OT`n** >9 Home with outpatient PT/OT

; Generated using SmartGUI Creator for SciTE
Gui, Show, w472 h717, Orthopedic Referral - Total Joint Replacement Pre-Op eval
return

; ********************
; Ortho referral 'Check List'

oPT:
Gui, Submit, NOHIDE
oPT := (oPT = 1) ?  "has" :  "has not"
oPTStr := "The patient " . YNoPT . " failed conservative measures."
;MsgBox , % oPTStr
return 

oBMI:
Gui, Submit, NOHIDE
oBMI := oBMI = 1 ? "is" : "is not"
oBMIStr := "The patient's BMI " . YNoBMI . " >= 40 or >=35 with comorbidities." 
;MsgBox, % oBMIStr
return 

oA1c:
Gui, Submit, NOHIDE
oA1c := (oA1c = 1) ? "is" : "is not"
oA1cStr := "The patient's A1c " . oA1c . " >= to 7.5`%"
;MsgBox, % oA1cStr
return 

oSmoke:
Gui, Submit, NOHIDE
oSmoke := (oSmoke = 1) ? "have" : "have not" 
oSmokeStr := "If the patient was a smoker they " . oSmoke . " quite`; or they also " . oSmoke . " quite smoking in the past 6 weeks."  
;MsgBox, % oSmokeStr
return

oAnticoag:
Gui, Submit, NOHIDE
if (oAnticoag = 2){
	oAnticoagStr := (oAnticoag = 2) ? "The patient is not on anticoagulationg therapy" : 2
	;MsgBox, % oAnticoagStr	
	Control, Disable, , Button12, Orthopedic
	Control, Disable, , Button13, Orthopedic
	Control, Disable, , Button14, Orthopedic
	} else {
	Control, Enable, , Button12, Orthopedic
	Control, Enable, , Button13, Orthopedic
	Control, Enable, , Button14, Orthopedic 
	}
return

oWarfarin:
Gui, Submit, NOHIDE
If (oAnticoag = 2) {
	return
}
if (oWarfarin = 1) {
	oAnticoagStr := "The patient is taking Warfarin / Coumadin for anticoagulation"
;	MsgBox, % oAnticoagStr
}
Return 

oXeralto:
Gui, Submit, NOHIDE
If (oAnticoag = 2) {
	return
}
if (oXeralto = 1) {
	oAnticoagStr := "The patient is taking either Xeralto or Eliquis for anticoagulation"
;	MsgBox, % oAnticoagStr
}
Return 

oASA:
Gui, Submit, NOHIDE
If (oAnticoag = 2) {
	return
}
if (oASA = 1) {
	oAnticoagStr := "The patient is taking Aspirin and/or Plavix for anticoagulation"
;MsgBox, % oAnticoagStr
}
Return 

oCardiac:
Gui, Submit, NOHIDE
oCardiacStr := (oCardiac = 1) ? "The patient is stable from a cardiac standpoint" : "The patient is not stable from a cardiac standpoint"
;MsgBox, % oCardiacStr
return 

; ********************
; Risk predition / DC planning 

oAge:
Gui, Submit, NOHIDE
oAge := oAge - 1
if (oAge = 0) {
	oAgeStr := "The patient's age group is >75 years"
} else if (oAge = 1) {
	oAgeStr := "The patient's age group is 66-75 years"
} else {
	oAgeStr := "The patient's age group is 50-65 years"
}
;MsgBox, % oAgeStr
return 

oSex:
Gui, Submit, NOHIDE
if (oSex = 1) {
	oSexStr := "Patient is Female"
} else {
	oSexStr := "Patient is Male"
}
;MsgBox, % oSexStr
return 

oWalk:
Gui, Submit, NOHIDE
oWalk := oWalk - 1
if (oWalk = 0) {
	oWalkStr := "The patient is Housebound"
} else if (oWalk = 1) {
	oWalkStr := "The patient is able to walk 1-2 blocks(shopping center)"
} else {
	oWalkStr := "The patient is able to walk 2 or more blocks"
}
;MsgBox, % oWalkStr "`n" oWalk
return 

oCane:
Gui, Submit, NOHIDE
oCane := oCane - 1
if (oCane = 0) {
	oCaneStr := "The patient uses crutches or a frame"
} else if (oCane = 1) {
	oCaneStr := "The patient uses a basic cane"
} else {
	oCaneStr := "The patient dose not require a walking aid"
}
;MsgBox, % oCaneStr "`n" oCane
return 

oComHelp: 
Gui, Submit, NOHIDE
oComHelp := oComHelp -1
if (oComHelp = 1){
	oComHelpStr := "They requir community help on once a week or not at all"
} else {
	oComHelpStr := "They require community help 2 or more times a week"
}
;MsgBox, % oComHelpStr "`n" oComHelp
return 

oLiveWith:
Gui, Submit, NOHIDEgit
if (oLiveWith = 1) {
	oLiveWith := 3
	oLiveWithStr := "The patient will live with somebody to assist in their care after the surgery"
} else {
	oLiveWith := 0
	oLiveWithStr := "The patient will not have help at home to assist in their care after surgery"
}
;MsgBox, % oLiveWithStr "`n" oLiveWith
return

; ********************
; Score and report 

oriskScore:
rptString := oPtStr . "`n" . oBMIStr . "`n" . oA1cStr . "`n" . oSmokeStr . "`n" . oAnticoagStr . "`n" . oCardiacStr .  "`n" . oAgeStr . "`n" . oSexStr . "`n" . oWalkStr . "`n" . oCaneStr . "`n" . oComHelpStr . "`n" . oLiveWithStr . "`n"
MsgBox, % rptString
return 

GuiClose:
ExitApp