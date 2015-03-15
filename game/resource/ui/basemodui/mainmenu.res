"Resource/UI/MainMenu.res"
{
	"MainMenu"
	{
		"ControlName"			"Frame"
		"fieldName"				"MainMenu"
		"xpos"					"0"
		"ypos"					"0"
		"wide"					"f0"
		"tall"					"f0"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"PaintBackgroundType"	"0"
	}
	"BtnSingleplayer"
	{
		"ControlName"			"BaseModHybridButton"
		"fieldName"				"BtnLoadgame"
		"xpos"					"80"
		"ypos"					"260"
		"wide"					"210"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"PnlQuickJoin"
		"navDown"				"BtnMultiplayer"
		"labelText"				"#HL2PORTUI_MainMenu_Singleplayer"
		"tooltiptext"			"#HL2PORTUI_MainMenu_Singleplayer_Tip"
		"style"					"AlienSwarmMenuButtonSmall"
		"command"				"FlmSingleplayerFlyout"	
		"ActivationType"		"1"
	}	
	"BtnStatsAndAchievements"
	{
		"ControlName"			"BaseModHybridButton"
		"fieldName"				"BtnStatsAndAchievements"
		"xpos"					"80"
		"ypos"					"280"
		"wide"					"180"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"0"		[$X360GUEST]
		"enabled"				"0"		[$X360GUEST]
		"visible"				"1"		[!$X360GUEST]		// jms: TEMP disabled
		"enabled"				"1"		[!$X360GUEST]
		"tabPosition"			"0"
		"navUp"					"BtnChangeGamers"
		"navDown"				"BtnOptions"
		"labelText"				"#L4D360UI_MainMenu_StatsAndAchievements"
		"tooltiptext"			"#L4D360UI_MainMenu_StatsAndAchievements_Tip"	[$X360]
		"tooltiptext"			"#L4D360UI_MainMenu_PCStatsAndAchievements_Tip"	[$WIN32]
		"style"					"AlienSwarmMenuButtonSmall"
		"command"				"StatsAndAchievements"
		"ActivationType"		"1"
		"EnableCondition"		"Never" [$DEMO]
	}
	"BtnOptions"
	{
		"ControlName"			"BaseModHybridButton"
		"fieldName"				"BtnOptions"
		"xpos"					"80"
		"ypos"					"300"
		"wide"					"180"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnStatsAndAchievements"
		"navDown"				"BtnExtras"
		"labelText"				"#L4D360UI_MainMenu_Options"
		"tooltiptext"			"#L4D360UI_MainMenu_Options_Tip"
		"style"					"AlienSwarmMenuButtonSmall"
		"command"				"FlmOptionsFlyout"
		"ActivationType"		"1"
	}
	
	"BtnExtras"
	{
		"ControlName"			"BaseModHybridButton"
		"fieldName"				"BtnExtras"
		"xpos"					"80"
		"ypos"					"320" 
		"wide"					"180"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"0"		[!$X360 || !$DEMO]
		"visible"				"0"		[$X360 && $DEMO]		
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnOptions"
		"navDown"				"BtnQuit"
		"style"					"AlienSwarmMenuButtonSmall"
		"ActivationType"		"1"
		"labelText"				"#L4D360UI_MainMenu_Extras"
		"tooltiptext"			"#L4D360UI_MainMenu_Extras_Tip"
		"command"				"FlmExtrasFlyoutCheck"
		"EnableCondition"		"Never" [$DEMO]
	}

	"BtnQuit"
	{
		"ControlName"			"BaseModHybridButton"
		"fieldName"				"BtnQuit"
		"xpos"					"80"
		"ypos"					"340"	[$WIN32]
		"wide"					"180"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"		[$WIN32]
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnExtras"
		"navDown"				"PnlQuickJoin" [$WIN32]
		"navDown"				"BtnGameModes" [$X360]
		"style"					"AlienSwarmMenuButtonSmall"
		"ActivationType"		"1"
		"labelText"				"#L4D360UI_MainMenu_Quit"			[$WIN32]
		"tooltiptext"			"#L4D360UI_MainMenu_Quit_Tip"		[$WIN32]
		"command"				"QuitGame"
	}
	"FlmSingleplayerFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSingleplayerFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSingleplayer"
		"ResourceFile"			"resource/UI/basemodui/SingleplayerFlyout.res"
	}
	
	"FlmOptionsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmOptionsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnGameplay"
		"ResourceFile"			"resource/UI/basemodui/OptionsFlyout.res"
	}

	"FlmExtrasFlyout_Simple"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmExtrasFlyout_Simple"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCommentary"
		"ResourceFile"			"resource/UI/basemodui/ExtrasFlyout.res"
	}

	"FlmExtrasFlyout_Live"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmExtrasFlyout_Live"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCommunity"
		"ResourceFile"			"resource/UI/basemodui/ExtrasFlyoutLive.res"
	}
}
