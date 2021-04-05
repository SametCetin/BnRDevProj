
ACTION ACT_AxisX1: 

	CASE stateAxX1 OF
		0:
			AxisX1.Ctrl.IN.Enable			:= TRUE;
			AxisX1.Params.WriteParam		:= FALSE;
			IF AxisX1.Ctrl.OUT.Enabled AND NOT AxisX1.Params.WriteParamDone THEN
				stateAxX1					:= stateAxX1 + 10;
			END_IF
		
		10:
			AxisX1.Params.WritePositionBias		:= TRUE;
			
			IF AxisX1.Params.WriteParamDone THEN
				AxisX1.Params.WritePositionBias	:= FALSE;
				stateAxX1						:= stateAxX1 + 10;
			END_IF
//			AxisX1.Ctrl.IN.HomePos	:= 100;
//			AxisX1.Ctrl.IN.Home		:= TRUE;
//		
//			IF AxisX1.Ctrl.OUT.Homed THEN
//				AxisX1.Ctrl.IN.Home	:= FALSE;
//				stateAxX1			:= stateAxX1 + 10;	
//			END_IF
		
		20:
			AxisX1.Ctrl.IN.JogVelo	:= 100;
			AxisX1.Ctrl.IN.Power	:= TRUE;
			IF AxisX1.Ctrl.OUT.Powered THEN
				stateAxX1			:= stateAxX1 + 10;
			END_IF
			
		30:
			;
		
	END_CASE
	
	HMI.AxisX1.ActPos	:= AxisX1.Ref.ActPos;
	
	fbAxCtrlX1
	(
		stAxisInterface := AxisX1.Ctrl,
		stAxisParams 	:= AxisX1.Params,
		AxisLink 		:= AxisX1_Link,
		AxisRef			:= AxisX1.Ref
	);
	

	
END_ACTION
