"Resource/UI/Audio.res"
{
	"Audio"
	{
		"ControlName"		"Frame"
		"fieldName"			"Audio"
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
		"ypos"		"151"
		"wide"		"150"
		"tall"		"19"
		"zpos"		"5"
		"font"		"DefaultExtraLarge"
		"textAlignment"		"west"
		"ControlName"		"Label"
		"labelText"		"#GameUI_Audio"
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
	
	"SldGameVolume"
	{
		"ControlName"			"SliderControl"
		"fieldName"				"SldGameVolume"
		"xpos"					"c-180"
		"ypos"					"180"
		"zpos"					"3"
		"wide"					"360"
		"tall"					"15"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"minValue"				"0.0"
		"maxValue"				"1.0"
		"stepSize"				"0.05"
		"navUp"					"Btn3rdPartyCredits"
		"navDown"				"SldMusicVolume"
		"conCommand"			"volume"
		"inverseFill"			"0"
				
		//button and label
		"BtnDropButton"
		{
			"ControlName"			"BaseModHybridButton"
			"fieldName"				"BtnDropButton"
			"xpos"					"0"
			"ypos"					"0"
			"zpos"					"0"
			"wide"					"360"
			"wideatopen"			"260"	[$WIN32 && !$WIN32WIDE]
			"tall"					"15"
			"autoResize"			"1"
			"pinCorner"				"0"
			"visible"				"1"
			"enabled"				"1"
			"tabPosition"			"1"
			"AllCaps"				"1"
			"labelText"				"#GameUI_SoundEffectVolume"
			"tooltiptext"			"#L4D360UI_AudioOptions_Tooltip_Volume"
			"disabled_tooltiptext"	"#L4D360UI_AudioOptions_Tooltip_Volume_Disabled"
			"style"					"DefaultButton"
			"command"				""
			"ActivationType"		"1"
			"OnlyActiveUser"		"1"
			"usablePlayerIndex"		"nobody"
		}
	}
	
	"SldMusicVolume"
	{
		"ControlName"			"SliderControl"
		"fieldName"				"SldMusicVolume"
		"xpos"					"c-180"
		"ypos"					"200"
		"zpos"					"3"
		"wide"					"360"
		"tall"					"15"
		"visible"				"1"
		"enabled"				"1"
		"usetitlesafe"			"0"
		"tabPosition"			"0"
		"minValue"				"0.0"
		"maxValue"				"1.0"
		"stepSize"				"0.05"
		"navUp"					"SldGameVolume"
		"navDown"				"DrpSpeakerConfiguration"
		"conCommand"			"snd_musicvolume"
		"inverseFill"			"0"
		
		//button and label
		"BtnDropButton"
		{
			"ControlName"			"BaseModHybridButton"
			"fieldName"				"BtnDropButton"
			"xpos"					"0"
			"ypos"					"0"
			"zpos"					"0"
			"wide"					"360"
			"wideatopen"			"260"	[$WIN32 && !$WIN32WIDE]
			"tall"					"15"
			"autoResize"			"1"
			"pinCorner"				"0"
			"visible"				"1"
			"enabled"				"1"
			"tabPosition"			"0"
			"AllCaps"				"1"
			"labelText"				"#GameUI_MusicVolume"
			"tooltiptext"			"#L4D360UI_AudioOptions_Tooltip_MusicVolume"
			"disabled_tooltiptext"	"#L4D360UI_AudioOptions_Tooltip_MusicVolume"
			"style"					"DefaultButton"
			"command"				""
			"ActivationType"		"1"
			"OnlyActiveUser"		"1"
			"usablePlayerIndex"		"nobody"
		}
	}
	
	"DrpSpeakerConfiguration"
	{
		"ControlName"		"DropDownMenu"
		"fieldName"			"DrpSpeakerConfiguration"
		"xpos"				"c-180"
		"ypos"				"220"
		"zpos"				"3"
		"wide"				"360"
		"tall"				"15"
		"visible"			"1"
		"enabled"			"1"
		"usetitlesafe"		"0"
		"tabPosition"		"0"
		"navUp"				"SldMusicVolume"
		"navDown"			"DrpSoundQuality"
				
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
			"labelText"					"#GameUI_SpeakerConfiguration"
			"tooltiptext"				"#L4D_spkr_config_tip"
			"style"						"DropDownButton"
			"command"					"FlmSpeakerConfiguration"
			"ActivationType"			"1"
			"OnlyActiveUser"			"1"
		}
	}
	
	//flyouts		
	"FlmSpeakerConfiguration"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSpeakerConfiguration"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"4"
		"InitialFocus"			"BtnHeadphones"
		"ResourceFile"			"resource/UI/basemodui/DropDownSpeakerConfiguration.res"
		"OnlyActiveUser"		"1"
	}
	
	"DrpSoundQuality"
	{
		"ControlName"		"DropDownMenu"
		"fieldName"			"DrpSoundQuality"
		"xpos"				"c-180"
		"ypos"				"240"
		"zpos"				"3"
		"wide"				"360"
		"tall"				"15"
		"visible"			"1"
		"enabled"			"1"
		"usetitlesafe"		"0"
		"tabPosition"		"0"
		"navUp"				"DrpSpeakerConfiguration"
		"navDown"			"DrpCaptioning"
				
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
			"labelText"					"#GameUI_SoundQuality"
			"tooltiptext"				"#L4D_sound_qual_tip"
			"style"						"DropDownButton"
			"command"					"FlmSoundQuality"
			"ActivationType"			"1"
			"OnlyActiveUser"			"1"
		}
	}
	
	//flyouts		
	"FlmSoundQuality"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSoundQuality"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"4"
		"InitialFocus"			"BtnHigh"
		"ResourceFile"			"resource/UI/basemodui/DropDownSoundQuality.res"
		"OnlyActiveUser"		"1"
	}
	
	"DrpCaptioning"
	{
		"ControlName"		"DropDownMenu"
		"fieldName"			"DrpCaptioning"
		"xpos"				"c-180"
		"ypos"				"260"
		"zpos"				"3"
		"wide"				"360"
		"tall"				"15"
		"visible"			"1"
		"enabled"			"1"
		"usetitlesafe"		"0"
		"tabPosition"		"0"
		"navUp"				"DrpSoundQuality"
		"navDown"			"DrpLanguage"
				
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
			"labelText"					"#GameUI_Captioning"
			"tooltiptext"				"#L4D360UI_AudioOptions_Tooltip_Caption"
			"disabled_tooltiptext"		"#L4D360UI_AudioOptions_Tooltip_Caption_Disabled"
			"style"						"DropDownButton"
			"command"					"FlmCaption"
			"ActivationType"			"1"
			"OnlyActiveUser"			"1"
		}
	}
	
	//flyouts		
	"FlmCaption"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCaption"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"4"
		"InitialFocus"			"BtnOff"
		"ResourceFile"			"resource/UI/basemodui/DropDownCaption.res"
		"OnlyActiveUser"		"1"
	}
	
	"DrpLanguage"
	{
		"ControlName"			"DropDownMenu"
		"fieldName"				"DrpLanguage"
		"xpos"					"c-180"
		"ypos"					"280"
		"zpos"					"3"
		"wide"					"360"
		"tall"					"15"
		"visible"				"1"
		"enabled"				"1"
		"usetitlesafe"			"0"
		"tabPosition"			"0"
		"navUp"					"DrpCaptioning"
		"navDown"				"DrpVoiceCommunication"
				
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
			"labelText"					"#GAMEUI_AudioSpokenLanguage"
			"tooltiptext"				"#L4D360UI_AudioOptions_Tooltip_Language"
			"disabled_tooltiptext"		"#L4D360UI_AudioOptions_Tooltip_Language_Disabled"
			"style"						"DropDownButton"
			"command"					"FlmLanguage"
			"ActivationType"			"1"
			"OnlyActiveUser"			"1"
		}
	}

	//flyouts		
	"FlmLanguage"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmLanguage"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"4"
		"InitialFocus"			"BtnOtherLanguage"
		"ResourceFile"			"resource/UI/basemodui/DropDownLanguagePC.res"
		"OnlyActiveUser"		"1"
	}

	//flyouts		
	"FlmVoiceCommunication"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmVoiceCommunication"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"4"
		"InitialFocus"			"BtnOn"
		"ResourceFile"			"resource/UI/basemodui/DropDownVoiceCommunication.res"
		"OnlyActiveUser"		"1"
	}
	"Btn3rdPartyCredits"
	{
		"ControlName"			"BaseModHybridButton"
		"fieldName"				"Btn3rdPartyCredits"
		"xpos"					"c-140"
		"ypos"					"310"
		"zpos"					"0"
		"wide"					"280"
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCancel"
		"navDown"				"SldGameVolume"
		"AllCaps"				"1"
		"labelText"				"#GameUI_ThirdPartyAudio_Title"
		"tooltiptext"			"#GameUI_ThirdPartyTechCredits"
		"style"					"DialogButton"
		"command"				"3rdPartyCredits"
		EnabledTextInsetX		"2"
		DisabledTextInsetX		"2"
		FocusTextInsetX			"2"
		OpenTextInsetX			"2"
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
