
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	ACT_AxisX1;
	
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
	


	
END_PROGRAM















PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

