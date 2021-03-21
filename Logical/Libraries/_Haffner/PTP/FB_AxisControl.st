
FUNCTION_BLOCK FB_AxisControl

	
	
	tMpAxisBasicParType.Position		:= stAxisInterface.IN.SetPos;
	tMpAxisBasicParType.Velocity		:= stAxisInterface.IN.SetVelo;
	tMpAxisBasicParType.Jog.Velocity	:= stAxisInterface.IN.JogVelo;
	
	
	IF stAxisParams.Calibrate THEN
		tMpAxisBasicParType.Homing.Position	:= stAxisParams.CalibrationPos 
		tMpAxisBasicParType.Homing.Mode		:= mcHOMING_ABSOLUTE;
		stAxisParams.CalibrationDone		:= fbMpAxisBasic.IsHomed;
		
	ELSIF stAxisParams.WritePositionBias THEN
		tMpAxisBasicParType.Homing.Mode		:= mcHOMING_DIRECT;
		tMpAxisBasicParType.Homing.Position	:= stAxisParams.CalibrationPos;
		stAxisParams.CalibrationDone		:= fbMpAxisBasic.IsHomed;
	END_IF
	
	
	
	
	fbMpAxisBasic(	
		MpLink			:= ADR(AxisRef),
		Enable			:= stAxisInterface.IN.Enable,
		ErrorReset		:= stAxisInterface.IN.Reset,	
		Parameters		:= ADR(tMpAxisBasicParType),
(*		Update			:=, 
*)		Power			:=  fbMpAxisBasic.Info.ReadyToPowerOn AND stAxisInterface.IN.Power,
		Home			:= stAxisInterface.IN.Home,
(*		MoveVelocity	:= ,
*)		MoveAbsolute	:= stAxisInterface.IN.MoveSetPos, 
(*		MoveAdditive	:= ,
		Stop			:= , 
*)		JogPositive		:= stAxisInterface.IN.JogFw,
		JogNegative		:= stAxisInterface.IN.JogBw,
(*		LimitLoad		:= ,
	ReleaseBrake	:= ,
*)		
);

	stAxisInterface.OUT.Enabled		:= fbMpAxisBasic.Active;
	stAxisInterface.OUT.Error		:= fbMpAxisBasic.Error;
	stAxisInterface.OUT.ErrID		:= fbMpAxisBasic.StatusID;
	stAxisInterface.OUT.Powered		:= fbMpAxisBasic.PowerOn;
	stAxisInterface.OUT.MoveDone	:= fbMpAxisBasic.MoveDone;
	stAxisInterface.OUT.Homed		:= fbMpAxisBasic.IsHomed;
		
END_FUNCTION_BLOCK
