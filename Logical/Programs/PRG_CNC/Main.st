
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	CncChParams.ProgramName := 'CncProg.cnc';

	fbCncChannel(
		MpLink		:= ADR(CncXZ_Link),
//		Enable	
//		ErrorReset
		Parameters	:= ADR(CncChParams),
//		Update
		Override			:= 10,
		RapidOverride		:= 20,
		FeedrateOverride	:= 30,
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
	
	fbBRMFunc[31](
	AxesGroup := fbCncChannel.MpLink,
(*	Enable	*)
	MFunction	:= MFunc[31],
(*	Reset	*)
(*	Valid
	Busy
	Error
	ErrorID
	Value	*)
	);
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

