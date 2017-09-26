; Orthopedic Referral Checklist - Total Joint Replacement Pre-surg. Eval 
; tool to eval before referral and as Pre-op eval as well
; Walker Jackson, MD; 9/19/17
; Texas Orthopedics / Sports & Rehabilitations Associates (Austin Texas) 

; set up variables
oPT := 0, oBMI := 0, oA1c := 0, oSmoke := 0, oAnticoag := 0, oWarfarin := 0, oXeralto := 0
oASA := 0, oCardiac :=0

reportString := ""

Gui, Add, GroupBox, x6 y5 w460 h319 , Check List
Gui, Add, Text, x16 y25 w340 h30 , Has the patient failed conservative meaures?  (These include NSAID's / analgesics`, steroid joint injections`, PT`, weight loss`, exercise program)
Gui, Add, Radio, x366 y15 w40 h30 voPT goPT , Y
Gui, Add, Radio, x416 y15 w40 h30 goPT , N

Gui, Add, Text, x16 y65 w340 h30 , Is the BMI >= 40`, or >=35 with comorbidities?   (increased post-op risk)
Gui, Add, Radio, x366 y55 w40 h30 voBMI goBMI, Y
Gui, Add, Radio, x416 y55 w40 h30 goBMI, N

Gui, Add, Text, x16 y102 w340 h30 , Is the A1c >= 7.5`%  (increased post-op risk)
Gui, Add, Radio, x366 y95 w40 h30 goA1c, Y
Gui, Add, Radio, x416 y95 w40 h30 goA1c, N

Gui, Add, Text, x16 y142 w340 h30 , If a smoker`, has the patient quite or not smoked for at least the past 6 weeks?
Gui, Add, Radio, x366 y135 w40 h30 , Y
Gui, Add, Radio, x416 y135 w40 h30 , N

Gui, Add, Text, x16 y182 w340 h100 , Is the patient on anticoagulation for a medical indication?
Gui, Add, Radio, x366 y175 w40 h30 , Y
Gui, Add, Radio, x416 y175 w40 h30 , N
Gui, Add, Text, x30 y210, a. Warfarin or Coumadin with plan for bridging
Gui, Add, Radio, x366 y200 w40 h30 , Y
Gui, Add, Radio, x416 y200 w40 h30 , N
Gui, Add, Text, x30 y235, b.  Xeralto / Eliquis 
Gui, Add, Radio, x366 y225 w40 h30 , Y
Gui, Add, Radio, x416 y225 w40 h30 , N
Gui, Add, Text, x20 y260, c.  Aspirin / Plavix 
Gui, Add, Radio, x366 y250 w40 h30 , Y
Gui, Add, Radio, x416 y250 w40 h30 , N

Gui, Add, Text, x16 y292 w340 h30 , Is the patient stable for surgery from a cardiac standpoint?
Gui, Add, Radio, x366 y285 w40 h30 , Y
Gui, Add, Radio, x416 y285 w40 h30 , N

; *****

Gui, Add, GroupBox, x6 y330 w460 h395 , Risk Assessment and Prediction Tool`; Discharge Planning
Gui, Add, Text, x16 y355 w150 h50 , What is their age group?
Gui, Add, Radio, x176 y355 w90 h20 , 50-65 years (2)
Gui, Add, Radio, x176 y380 w90 h20 , 66-75 years (1)
Gui, Add, Radio, x276 y355 w90 h20 , > 75 years (0)

Gui, Add, Text, x16 y410 w150 h50 , Gender?
Gui, Add, Radio, x176 y410 w90 h20 , Male (2)
Gui, Add, Radio, x176 y435 w90 h20 , Female (1)

Gui, Add, Text, x16 y470 w150 h50 , How far`, on avg.`, can they walk? (a blook is ~ 200m)
Gui, Add, Radio, x176 y470 w170 h20 , 2 blocks or moer (2)
Gui, Add, Radio, x176 y500 w170 h20 , 1-2 blocks (shopping center) (1)
Gui, Add, Radio, x356 y470 w100 h50 , Housebound (most of the time) (0)

Gui, Add, Text, x16 y530 w150 h50 , Which Gait aid do they use? (More oftent than not)
Gui, Add, Radio, x176 y530 w90 h20 , None (2)
Gui, Add, Radio, x176 y560 w130 h20 , Single point stick (1)
Gui, Add, Radio, x356 y530 w90 h30 , Crutches / frame (0)

Gui, Add, Text, x16 y590 w150 h50 , Do they use community supports? (Home help`, meals-on-wheels`, district nurse)
Gui, Add, Radio, x176 y590 w130 h20 , None or 1 / week (1)
Gui, Add, Radio, x176 y610 w130 h20 , 2 or more / week (0)

Gui, Add, Text, x16 y650 w150 h50 , Will you live with someone who can care for your after your operation?
Gui, Add, Radio, x176 y650 w80 h20 , Yes (3)
Gui, Add, Radio, x176 y675 w80 h20 , No (0)

Gui, Add, Button, x326 y570 w120 h30 , Risk Score
Gui, Add, Edit, x326 y610 w120 h20 , 

Gui, Add, Groupbox, x235 y640 w225 h65, Risk Interpretation
Gui, Add, Text, x246 y655 w210 h45 , * < 6 Post acute care facility (SNF or Rehab)`n* 6-9 Home health PT/OT`n* >9 Home with outpatient PT/OT

; Generated using SmartGUI Creator for SciTE
Gui, Show, w480 h727, Orthopedic Referral Checklist - Total Joint Replacement Pre-Op eval
return

; TODO  - not the actual scoring code and the report to clipboard

oPT:
Gui, Submit, NOHIDE
YNoPT := (oPT = 1) ?  "has" :  "has not"
MsgBox, % "The patient " . YNoPT . " failed conservative measures."
return 

oBMI:
Gui, Submit, NOHIDE
YNoBMI := oBMI = 1 ? "is" : "is not"
MsgBox, % "The patient's BMI " . YNoBMI . " >= 40 or >=35 with comorbidities."
return 

oA1c:
Gui, Submit, NOHIDE
return 

GuiClose:
ExitApp