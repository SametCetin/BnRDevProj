
FUNCTION_BLOCK FB_AxisControl

	
	
	tMpAxisBasicParType.Position		:= stAxisInterface.IN.SetPos;
	tMpAxisBasicParType.Velocity		:= stAxisInterface.IN.SetVelo;
	tMpAxisBasicParType.Jog.Velocity	:= stAxisInterface.IN.JogVelo;
	
	fbMpAxisBasic(	
		MpLink			:= ADR(AxisLink),
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
