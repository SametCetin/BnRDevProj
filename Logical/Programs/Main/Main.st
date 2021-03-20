
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	IF in1 THEN
		out1 := TRUE;
	ELSIF in2 THEN
		out1 := FALSE;
	END_IF
		
	
	fbCyCo1(
		Emergency := FALSE,
		Enabled := TRUE,
		Mode := _tbsy,
		OnRstPosSensor := FALSE,
		OnRstPosTime := 1000,
		OnSetPosSensor := FALSE,
		OnSetPosTime := 1000,
		AlarmTime := 2000,
		AlarmAck := FALSE,
		ID := 1,
		Simulation := FALSE,
//		Rst :=
//		Set :=
		);
	
	AxisX1.Ref := ADR(LinkAxis1);
	fbAxCtrlX1(
		stAxisInterface := AxisX1.Ctrl,
		stAxisParams 	:= AxisX1.Params,
		AxisLink 		:= AxisX1.Ref,
	);
	LinkAxis1	:= ADR(AxisX1.Ref);
	
END_PROGRAM















PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

