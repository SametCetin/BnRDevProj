
FUNCTION_BLOCK FB_CylinderControl
	VAR_INPUT
		Emergency : BOOL;
		Enabled : BOOL;
		Mode : E_CylinderModes;
		OnRstPosSensor : BOOL;
		OnRstPosTime : UINT;
		OnSetPosSensor : BOOL;
		OnSetPosTime : UINT;
		AlarmTime : UINT;
		AlarmAck : BOOL;
		ID : UINT;
		Simulation : BOOL;
		Rst : BOOL;
		Set : BOOL;
	END_VAR
	VAR_OUTPUT
		OutRst : BOOL;
		OutSet : BOOL;
		OnRstPos : BOOL;
		OnSetPos : BOOL;
		OutRstAlm : BOOL;
		OutSetAlm : BOOL;
	END_VAR
	VAR
		tonSet : TON;
		tonRst : TON;
		rtSet : R_TRIG;
		ftSet : F_TRIG;
		rtRst : R_TRIG;
		ftRst : F_TRIG;
		FilterTime : TIME := T#50ms;
		NoSetSensor : BOOL;
		NoRstSensor : BOOL;
		SingleActing : BOOL;
		DoubleActing : BOOL;
		StateRst : UINT;
		StateSet : UINT;
		tonSetAlarm : TON;
		tonRstAlarm : TON;
		OpenCenter : BOOL;
		rtActCmd : R_TRIG;
		actCmd : UINT;
		prevCmd : UINT;
		ftEmergency : F_TRIG;
	END_VAR
END_FUNCTION_BLOCK
