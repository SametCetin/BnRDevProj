FUNCTION_BLOCK FB_CylinderControl
	
	(*****************************************************************************************************************************)
	rtRst(CLK := Rst AND Enabled AND NOT Emergency);
	ftRst(CLK := Rst AND Enabled AND NOT Emergency);

	rtSet(CLK := Set AND Enabled AND NOT Emergency);
	ftSet(CLK := Set AND Enabled AND NOT Emergency);

	IF rtSet.Q THEN	actCmd := 2;	END_IF
	IF rtRst.Q THEN	actCmd := 1;	END_IF
	rtActCmd(CLK := actCmd <> prevCmd);
	prevCmd				:= actCmd;

	NoRstSensor			:= Mode = _tbsi OR Mode = _cbsi OR Mode = _tbsy OR Mode = _cbsy OR Mode = _casy;
	NoSetSensor			:= Mode = _tbsg OR Mode = _cbsg OR Mode = _tbsy OR Mode = _cbsy OR Mode = _casy;
	SingleActing		:= Mode = _tbsg OR Mode = _tbsi OR Mode = _tbcs OR Mode = _tbsy;
	DoubleActing		:= Mode = _cbsg OR Mode = _cbsi OR Mode = _cbcs OR Mode = _cbsy OR Mode = _casy;
	OpenCenter			:= Mode = _casy OR Mode = _casg;
	(*****************************************************************************************************************************)
	CASE StateRst OF
		0:
			tonRst(IN := FALSE);

			tonRstAlarm.IN		:= FALSE;
			OutRst				:= FALSE;
			OnRstPos			:= FALSE;
			OutRstAlm			:= FALSE;

		10:
			Set					:= FALSE;
			StateSet				:= 0;
			StateRst				:= 20;

		20:
			OutRst				:= NOT Simulation;

			IF Simulation THEN
				tonRst.IN			:= TRUE;
				tonRst.PT			:=  UINT_TO_TIME(OnRstPosTime);
				tonRstAlarm.IN	:= FALSE;
				tonRstAlarm.PT	:= UINT_TO_TIME(AlarmTime);

			ELSIF NOT NoRstSensor THEN											(* Reset pos sensoru varsa *)
				tonRst.IN			:= OnRstPosSensor;
				tonRst.PT			:= FilterTime;
				tonRstAlarm.IN	:= NOT OnRstPosSensor;
				tonRstAlarm.PT	:= UINT_TO_TIME(AlarmTime);

			ELSIF NOT NoSetSensor THEN											(* Reset pos sensoru yok, Set pos sensoru varsa *)
				tonRst.IN			:= NOT OnSetPosSensor;
				tonRst.PT			:= UINT_TO_TIME(OnRstPosTime);
				tonRstAlarm.IN	:= OnSetPosSensor;
				tonRstAlarm.PT	:= UINT_TO_TIME(AlarmTime);

			ELSE
				tonRst.IN			:= TRUE;
				tonRst.PT			:= UINT_TO_TIME(OnRstPosTime);
				tonRstAlarm.IN	:= FALSE;
			END_IF

			tonRst();
			IF tonRst.Q AND NOT OutRstAlm THEN
				StateRst			:= 30;
			END_IF

		30:
			OutRst				:= NOT Simulation AND (NOT OpenCenter AND (SingleActing OR DoubleActing) OR (OpenCenter AND Rst));
			OnRstPos			:= (NOT OpenCenter AND (SingleActing OR DoubleActing) OR (OpenCenter AND Rst));
	END_CASE
	(*****************************************************************************************************************************)
	tonRstAlarm();
	IF tonRstAlarm.Q THEN
		OutRstAlm		:= TRUE;
	ELSIF AlarmAck THEN
		OutRstAlm		:= FALSE;
	END_IF
	(*****************************************************************************************************************************)
	CASE StateSet OF
		0:
			tonSet(IN := FALSE);

			tonSetAlarm.IN		:= FALSE;
			OutSet				:= FALSE;
			OnSetPos			:= FALSE;
			OutSetAlm			:= FALSE;

		10:
			Rst					:= FALSE;
			StateRst				:= 0;
			StateSet				:= 20;

		20:
			OutSet				:= NOT Simulation;

			IF Simulation THEN
				tonSet.IN			:= TRUE;
				tonSet.PT			:=  UINT_TO_TIME(OnRstPosTime);
				tonSetAlarm.IN	:= FALSE;
				tonSetAlarm.PT	:= UINT_TO_TIME(AlarmTime);

			ELSIF NOT NoSetSensor THEN
				tonSet.IN			:= OnSetPosSensor;
				tonSet.PT			:= FilterTime;
				tonSetAlarm.IN	:= NOT OnSetPosSensor;
				tonSetAlarm.PT	:= UINT_TO_TIME(AlarmTime);

			ELSIF NOT NoRstSensor THEN
				tonSet.IN			:= NOT OnRstPosSensor;
				tonSet.PT			:= UINT_TO_TIME(OnSetPosTime);
				tonSetAlarm.IN	:= OnRstPosSensor;
				tonSetAlarm.PT	:= UINT_TO_TIME(AlarmTime);

			ELSE
				tonSet.IN			:= NOT tonSetAlarm.Q;
				tonSet.PT			:= UINT_TO_TIME(OnSetPosTime);
				tonSetAlarm.IN	:= FALSE;
			END_IF

			tonSet();

			IF tonSet.Q AND NOT OutSetAlm THEN
				StateSet			:= 30;
			END_IF

		30:
			OutSet				:= NOT Simulation AND (NOT OpenCenter AND (SingleActing OR DoubleActing) OR (OpenCenter AND Set));
			OnSetPos			:= (NOT OpenCenter AND (SingleActing OR DoubleActing) OR (OpenCenter AND Set));
	END_CASE
	(*****************************************************************************************************************************)
	tonSetAlarm();
	IF tonSetAlarm.Q THEN
		OutSetAlm			:= TRUE;
	ELSIF AlarmAck THEN
		OutSetAlm			:= FALSE;
	END_IF
	(*****************************************************************************************************************************)
	IF Emergency OR NOT Enabled THEN
		StateRst				:= 0;
		StateSet				:= 0;
	END_IF

	ftEmergency(CLK := Emergency);
	IF NOT Enabled THEN
		OutRstAlm			:=
		OutSetAlm			:= FALSE;
		OnRstPos			:=
		OnSetPos			:= TRUE;

	ELSIF Emergency THEN
		OutRstAlm			:=
		OutSetAlm			:= FALSE;

	ELSIF ftEmergency.Q THEN
		IF actCmd = 2 THEN
			StateSet			:= 30;
		ELSE
			StateRst			:= 30;
		END_IF

	ELSE
		IF rtRst.Q OR (Rst AND ftSet.Q) THEN
			OnSetPos		:=
			Set				:= FALSE;
			StateSet			:= 0;
			IF NOT OnRstPos THEN
				StateRst		:= 10;
			END_IF
		END_IF

		IF rtSet.Q OR (Set AND ftRst.Q) THEN
			OnRstPos		:=
			Rst				:= FALSE;
			StateRst			:= 0;
			IF NOT OnSetPos THEN
				StateSet		:= 10;
			END_IF
		END_IF
	END_IF
	
	
END_FUNCTION_BLOCK
