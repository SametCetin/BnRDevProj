
TYPE
	T_HmiAxis : 	STRUCT 
		ActPos : LREAL;
		Enabled : BOOL;
	END_STRUCT;
	T_Hmi : 	STRUCT 
		StartMachine : BOOL;
		AxisX1 : T_HmiAxis;
	END_STRUCT;
END_TYPE
