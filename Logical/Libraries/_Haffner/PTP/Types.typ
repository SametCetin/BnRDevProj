
TYPE
	T_AxisInterface : 	STRUCT 
		IN : T_AxisInterfaceIn;
		OUT : T_AxisInterfaceOut;
	END_STRUCT;
	T_AxisInterfaceIn : 	STRUCT 
		Enable : BOOL;
		Power : BOOL;
		Interlock : BOOL;
		Reset : BOOL;
		SetActPosVal : LREAL; (* Setlenecek pozisyon degeri *)
		SetActPos : BOOL;
		DriveReset : BOOL;
		MoveSetPos : BOOL;
		Home : BOOL;
		HomeSensor : BOOL;
		JogFw : BOOL;
		JogBw : BOOL;
		ReadDiagMsg : BOOL;
		HomePos : LREAL;
		SetPos : LREAL;
		SetVelo : REAL;
		SetAcc : LREAL;
		SetDec : LREAL;
		SetJerk : LREAL;
		JogVelo : REAL;
		Couple : BOOL;
		CoupleRef : REFERENCE TO McAxisType;
		Override : LREAL := 100.0;
	END_STRUCT;
	T_AxisInterfaceOut : 	STRUCT 
		Enabled : BOOL;
		Powered : BOOL;
		Homed : BOOL;
		MoveDone : BOOL;
		DiagMsgError : BOOL;
		DiagMessage : STRING[80];
		ErrID : DINT;
		Error : BOOL;
	END_STRUCT;
	T_AxisParams : 	STRUCT 
		WriteParam : BOOL;
		Calibrate : BOOL;
		WritePositionBias : BOOL;
		WriteParamDone : BOOL;
		CalibrationDone : BOOL;
		CalcPositionBias : LREAL;
		Error : BOOL;
		ErrorId : UDINT;
		PositionBias : LREAL;
		MinLimitPos : LREAL;
		MaxLimitPos : LREAL;
		HomePos : LREAL;
		GroundPos : LREAL;
		MaxVelo : LREAL;
		RapidTraverseVelo : LREAL;
		MoveVelo : LREAL;
		MinLimitEnabled : BOOL;
		MaxLimitEnabled : BOOL;
		CalibrationPos : LREAL;
		PositionTolerance : LREAL;
		RefStatus : LREAL; (* 0: Not referenced, 1: Referenced, 2: Homing axis *)
	END_STRUCT;
	T_Axis : 	STRUCT 
		Ctrl : T_AxisInterface;
		Params : T_AxisParams;
		ID : UINT;
		AbsEnc : BOOL;
		Installed : BOOL;
		Ref : T_AxisRef;
	END_STRUCT;
	T_AxisRef : 	STRUCT 
		ActPos : LREAL;
	END_STRUCT;
END_TYPE
