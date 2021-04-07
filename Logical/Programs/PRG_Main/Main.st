
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
		
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
	
//Hmi and plc assigning
	HMI.Axis[0].Enabled			:= AxisX1.Ctrl.OUT.Powered;
	HMI.Axis[0].ActPos			:= AxisX1.Ref.ActPos;
	
	AxisX1.Ctrl.IN.Reset		:= HMI.Axis[0].Reset;
	AxisX1.Ctrl.IN.JogVelo		:= HMI.Axis[0].JogVelo;
	AxisX1.Ctrl.IN.JogFw		:= HMI.Axis[0].JogPlus;
	AxisX1.Ctrl.IN.JogBw		:= HMI.Axis[0].JogMinus;
	
	AxisX1.Ctrl.IN.MoveSetPos	:= HMI.Axis[0].MoveSetPos;
	AxisX1.Ctrl.IN.SetVelo		:= HMI.Axis[0].SetVelo;
	AxisX1.Ctrl.IN.SetPos		:= HMI.Axis[0].SetPos;
	
	
END_PROGRAM















PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

