
PROGRAM _INIT
	(* Insert code here *)
	M31;
	RParams;

	CncChParams.ProgramName := 'CncProg.cnc';
	
	fbCncChannel.MpLink				:= ADR(CncXZ_Link);
	fbCncChannel.Enable				:= TRUE;
	fbCncChannel.Override			:= 10;
	fbCncChannel.RapidOverride		:= 20;
	fbCncChannel.FeedrateOverride	:= 30;
	fbCncChannel.Parameters			:= ADR(CncChParams);
	
END_PROGRAM

PROGRAM _CYCLIC

	CASE State OF
		0:
			;
		10:
			IF AxisX1.Ctrl.OUT.Powered AND AxisX1.Ctrl.OUT.Homed
			AND AxisZ1.Ctrl.OUT.Powered AND AxisZ1.Ctrl.OUT.Homed THEN
				RParams[31]		:= 30;
				State			:= State + 10;
			END_IF
			
		20:
			IF fbCncChannel.Active THEN
				fbCncChannel.Power	:= TRUE;
			END_IF
	
			IF fbCncChannel.PowerOn THEN
				State				:= State + 10;
			END_IF
			
		30:
			fbCncChannel.MoveProgram	:= TRUE;
		
			IF fbCncChannel.MoveDone THEN
				State					:= State + 10;
			END_IF
		
		40:
			fbCncChannel.MoveProgram	:= FALSE;
			State						:= State + 10;
		
	END_CASE;
	
	fbCncChannel();
		
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

