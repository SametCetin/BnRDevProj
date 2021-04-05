
FUNCTION_BLOCK FB_AxisControl
	VAR_IN_OUT
		stAxisInterface : T_AxisInterface;
		stAxisParams : T_AxisParams;
		AxisLink : McAxisType;
	END_VAR
	VAR
		fbMpAxisBasic : MpAxisBasic;
		tMpAxisBasicParType : MpAxisBasicParType;
	END_VAR
	VAR_IN_OUT
		AxisRef : T_AxisRef;
	END_VAR
END_FUNCTION_BLOCK
