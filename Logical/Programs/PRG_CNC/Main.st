
PROGRAM _INIT
	(* Insert code here *)
	M31;
	RParams;
	Override			:= 10,
	RapidOverride		:= 20,
	FeedrateOverride	:= 30,
	
	fbCncChannel.Enable	:= TRUE;
	
END_PROGRAM

PROGRAM _CYCLIC
	
	CncChParams.ProgramName := 'CncProg.cnc';

	fbCncChannel(
	MpLink		:= ADR(CncXZ_Link),
	//		Enable	
	//		ErrorReset
	Parameters	:= ADR(CncChParams),
	//		Update
	
	//		Power
	//		Home
	//		MoveProgram
	//		Interrupt
	//		Continue
	//		Stop
	//		Jog
	//		MoveBlock
	//		SingleStep
	//		Active
	//		Error
	//		StatusID
	//		UpdateDone
	//		X
	//		Y
	//		PathVelocity
	//		CommandBusy
	//		CommandAborted
	//		PowerOn
	//		IsHomed
	//		MoveActive
	//		MoveInterrupted
	//		InMotion
	//		MoveDone
	//		Stopped
	//		SingleStepActive
	//		Info
	);
	
	CncChInfo := fbCncChannel.Info;
		
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

