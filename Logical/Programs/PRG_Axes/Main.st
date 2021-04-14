
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	CASE stateAxX1 OF
		0:
			stateAxX1	:= stateAxX1 + 10;
			
		10:
			AxisX1.Ctrl.IN.Enable			:= TRUE;
			AxisX1.Params.WriteParam		:= FALSE;
			
			AxisZ1.Ctrl.IN.Enable			:= TRUE;
			AxisZ1.Params.WriteParam		:= FALSE;
			
			IF AxisX1.Ctrl.OUT.Enabled AND NOT AxisX1.Params.WriteParamDone
			AND AxisZ1.Ctrl.OUT.Enabled AND NOT AxisZ1.Params.WriteParamDone THEN
				stateAxX1					:= stateAxX1 + 10;
			END_IF
		
		20:
			AxisX1.Params.WritePositionBias		:= TRUE;
			AxisZ1.Params.WritePositionBias		:= TRUE;
			
			IF AxisX1.Params.WriteParamDone AND AxisZ1.Params.WriteParamDone THEN
				AxisX1.Params.WritePositionBias	:= FALSE;
				AxisZ1.Params.WritePositionBias	:= FALSE;
				stateAxX1						:= stateAxX1 + 10;
			END_IF
			
			//			AxisX1.Ctrl.IN.HomePos	:= 100;
			//			AxisX1.Ctrl.IN.Home		:= TRUE;
			//		
			//			IF AxisX1.Ctrl.OUT.Homed THEN
			//				AxisX1.Ctrl.IN.Home	:= FALSE;
			//				stateAxX1			:= stateAxX1 + 10;	
			//			END_IF
		
		30:
			AxisX1.Ctrl.IN.JogVelo	:= 100;
			AxisX1.Ctrl.IN.Power	:= TRUE;
			
			AxisZ1.Ctrl.IN.JogVelo	:= 100;
			AxisZ1.Ctrl.IN.Power	:= TRUE;
			
			IF AxisX1.Ctrl.OUT.Powered AND AxisZ1.Ctrl.OUT.Powered THEN
				stateAxX1			:= stateAxX1 + 10;
			END_IF
			
		40:
			;

	END_CASE
	
	fbAxCtrlX1(
	stAxisInterface := AxisX1.Ctrl,
	stAxisParams 	:= AxisX1.Params,
	AxisLink 		:= AxisX1_Link,
	AxisRef			:= AxisX1.Ref
	);
	
	fbAxCtrlZ1(
	stAxisInterface := AxisZ1.Ctrl,
	stAxisParams 	:= AxisZ1.Params,
	AxisLink 		:= AxisZ1_Link,
	AxisRef			:= AxisZ1.Ref
	);
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

