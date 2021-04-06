
TYPE
	T_HmiAxis : 	STRUCT 
		Enabled : BOOL;
		ActPos : LREAL;
		Reset : BOOL;
		JogPlus : BOOL;
		JogMinus : BOOL;
		JogVelo : REAL;
		MoveSetPos : BOOL;
		SetVelo : REAL;
		SetPos : LREAL;
	END_STRUCT;
	T_Hmi : 	STRUCT 
		StartMachine : BOOL;
		Axis : ARRAY[0..C_AXIS_COUNT]OF T_HmiAxis;
	END_STRUCT;
END_TYPE
