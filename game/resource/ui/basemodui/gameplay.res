"Resource/UI/Gameplay.res"
{
	"Gameplay"
	{
		"ControlName"		"Frame"
		"fieldName"			"Gameplay"
		"xpos"				"0"
		"ypos"				"0"
		"wide"				"f0"
		"tall"				"f0"
		"visible"			"1"
		"enabled"			"1"
	}
	
	"Title"
	{
		"fieldName"		"Title"
		"xpos"		"c-266"
		"ypos"		"181"
		"wide"		"150"
		"tall"		"19"
		"zpos"		"5"
		"font"		"DefaultExtraLarge"
		"textAlignment"		"west"
		"ControlName"		"Label"
		"labelText"		"#HL2PORTUI_Titles_Gameplay"
		"fgcolor_override"		"224 224 224 255"
	}
	
	"ImgBackground" [$WIN32]
	{
		"ControlName"		"L4DMenuBackground"
		"fieldName"			"ImgBackground"
		"xpos"				"0"
		"ypos"				"79"
		"zpos"				"-1"
		"wide"				"f0"
		"tall"				"220"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"fillColor"			"0 0 0 0"
	}
	"DrpGameDifficulty"
	{
		"ControlName"		"DropDownMenu"
		"fieldName"			"DrpGameDifficulty"
		"xpos"				"c-190"
		"ypos"				"215"
		"zpos"				"3"
		"wide"				"360"
		"tall"				"15"
		"visible"			"1"
		"enabled"			"1"
		"usetitlesafe"		"0"
		"tabPosition"		"0"
		"navUp"				"DrpGameDifficulty"
		"navDown"			"DrpGameDifficulty"
				
		//button and label
		"BtnDropButton"
		{
			"ControlName"				"BaseModHybridButton"
			"fieldName"					"BtnDropButton"
			"xpos"						"0"
			"ypos"						"0"
			"zpos"						"0"
			"wide"						"360"
			"wideatopen"				"260"	[$WIN32 && !$WIN32WIDE]
			"tall"						"15"
			"autoResize"				"1"
			"pinCorner"					"0"
			"visible"					"1"
			"enabled"					"1"
			"tabPosition"				"1"
			"AllCaps"					"1"
			"labelText"					"#HL2PORTUI_Options_GameDifficulty"
			"tooltiptext"				"#HL2PORTUI_Options_GameDifficulty_tip"
			"style"						"DropDownButton"
			"command"					"FlmGameDifficulty"
			"ActivationType"			"1"
			"OnlyActiveUser"			"1"
		}
	}
	
	//flyouts		
	"FlmGameDifficulty"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmGameDifficulty"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"4"
		"InitialFocus"			"BtnHigh"
		"ResourceFile"			"resource/UI/basemodui/DropDownGameDifficulty.res"
		"OnlyActiveUser"		"1"
	}
	
	"BtnDone" [$WIN32]
	{
		"ControlName"			"CNB_Button"
		"fieldName"				"BtnDone"
		"xpos"		"c-264"
		"ypos"		"r23"
		"wide"		"117"
		"tall"		"27"
		"zpos"		"1"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"labelText"				"#L4D360UI_Done_Caps"
		"command"				"Back"
		"textAlignment"		"center"
		"font"		"DefaultMedium"
		"fgcolor_override"		"113 142 181 255"
	}
}
