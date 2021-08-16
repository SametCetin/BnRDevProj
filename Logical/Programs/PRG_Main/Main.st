
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
//AxisX1
	HMI.Axis[0].Enabled			:= AxisX1.Ctrl.OUT.Powered;
	HMI.Axis[0].ActPos			:= AxisX1.Ref.ActPos;
	
	AxisX1.Ctrl.IN.Reset		:= HMI.Axis[0].Reset;
	AxisX1.Ctrl.IN.JogVelo		:= HMI.Axis[0].JogVelo;
	AxisX1.Ctrl.IN.JogFw		:= HMI.Axis[0].JogPlus;
	AxisX1.Ctrl.IN.JogBw		:= HMI.Axis[0].JogMinus;
	
	AxisX1.Ctrl.IN.MoveSetPos	:= HMI.Axis[0].MoveSetPos;
	AxisX1.Ctrl.IN.SetVelo		:= HMI.Axis[0].SetVelo;
	AxisX1.Ctrl.IN.SetPos		:= HMI.Axis[0].SetPos;

//AxisZ1	
	HMI.Axis[1].Enabled			:= AxisZ1.Ctrl.OUT.Powered;
	HMI.Axis[1].ActPos			:= AxisZ1.Ref.ActPos;
	
	AxisZ1.Ctrl.IN.Reset		:= HMI.Axis[1].Reset;
	AxisZ1.Ctrl.IN.JogVelo		:= HMI.Axis[1].JogVelo;
	AxisZ1.Ctrl.IN.JogFw		:= HMI.Axis[1].JogPlus;
	AxisZ1.Ctrl.IN.JogBw		:= HMI.Axis[1].JogMinus;
	
	AxisZ1.Ctrl.IN.MoveSetPos	:= HMI.Axis[1].MoveSetPos;
	AxisZ1.Ctrl.IN.SetVelo		:= HMI.Axis[1].SetVelo;
	AxisZ1.Ctrl.IN.SetPos		:= HMI.Axis[1].SetPos;
	
	BRPlcVar1;
	BRPlcVar2;
	
END_PROGRAM















PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

