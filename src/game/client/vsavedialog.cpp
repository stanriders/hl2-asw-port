//========= Copyright © 1996-2008, Valve Corporation, All rights reserved. ============//
//
// Purpose: 
//
//=====================================================================================//

#include "vkeyboard.h"
#include "VFooterPanel.h"
#include "VDropDownMenu.h"
#include "VSliderControl.h"
#include "VHybridButton.h"
#include "EngineInterface.h"
#include "gameui_util.h"
#include "vgui/ISurface.h"
#include "VGenericConfirmation.h"
#include "materialsystem/materialsystem_config.h"
#include "ConfigManager.h"
#include "cdll_util.h"
#include "nb_header_footer.h"
#include "optionssubkeyboard.h"
#include "vcontrolslistpanel.h"

// memdbgon must be the last include file in a .cpp file!!!
#include "tier0/memdbgon.h"

using namespace vgui;
using namespace BaseModUI;

//=============================================================================
VSaveDialog::VSaveDialog(Panel *parent, const char *panelName):
BaseClass(parent, panelName)
{
	GameUI().PreventEngineHideGameUI();

	SetDeleteSelfOnClose(true);

	SetProportional( true );

	SetUpperGarnishEnabled(true);
	SetLowerGarnishEnabled(true);

	m_pHeaderFooter = new CNB_Header_Footer( this, "HeaderFooter" );
	m_pHeaderFooter->SetTitle( "" );
	m_pHeaderFooter->SetHeaderEnabled( false );
	m_pHeaderFooter->SetFooterEnabled( true );
	m_pHeaderFooter->SetGradientBarEnabled( true );
	m_pHeaderFooter->SetGradientBarPos( 60, 320 );

	m_pOptionsSubKeyboard = new COptionsSubKeyboard( this );
	m_pOptionsSubKeyboard->OnResetData();
}

//=============================================================================
VSaveDialog::~VSaveDialog()
{
	GameUI().AllowEngineHideGameUI();
}

//=============================================================================
void VSaveDialog::Activate()
{
	BaseClass::Activate();

	UpdateFooter();
}

void VSaveDialog::UpdateFooter()
{
	CBaseModFooterPanel *footer = BaseModUI::CBaseModPanel::GetSingleton().GetFooterPanel();
	if ( footer )
	{
		footer->SetButtons( FB_ABUTTON | FB_BBUTTON, FF_AB_ONLY, false );
		footer->SetButtonText( FB_ABUTTON, "#L4D360UI_Select" );
		footer->SetButtonText( FB_BBUTTON, "#L4D360UI_Controller_Done" );
	}
}

void VSaveDialog::OnThink()
{
	BaseClass::OnThink();
}

void VSaveDialog::OnKeyCodePressed(KeyCode code)
{
	int joystick = GetJoystickForCode( code );
	int userId = CBaseModPanel::GetSingleton().GetLastActiveUserId();
	if ( joystick != userId || joystick < 0 )
	{	
		return;
	}

	switch ( GetBaseButtonCode( code ) )
	{
	case KEY_XBUTTON_B:
		// Ready to write that data... go ahead and nav back
		BaseClass::OnKeyCodePressed(code);
		break;

	default:
		BaseClass::OnKeyCodePressed(code);
		break;
	}
}

#ifndef _X360
void VSaveDialog::OnKeyCodeTyped( vgui::KeyCode code )
{
	// For PC, this maps space bar to OK and esc to cancel
	switch ( code )
	{
	case KEY_SPACE:
		OnKeyCodePressed( ButtonCodeToJoystickButtonCode( KEY_XBUTTON_A, CBaseModPanel::GetSingleton().GetLastActiveUserId() ) );
		break;

	case KEY_ESCAPE:
		// close active menu if there is one, else navigate back
		if ( FlyoutMenu::GetActiveMenu() )
		{
			FlyoutMenu::CloseActiveMenu( FlyoutMenu::GetActiveMenu()->GetNavFrom() );
		}
		else if ( !m_pOptionsSubKeyboard->GetControlsList()->IsInEditMode() )
		{
			m_pOptionsSubKeyboard->OnApplyChanges();
			OnKeyCodePressed( ButtonCodeToJoystickButtonCode( KEY_XBUTTON_B, CBaseModPanel::GetSingleton().GetLastActiveUserId() ) );
		}
		break;
	}

	BaseClass::OnKeyTyped( code );
}
#endif

//=============================================================================
void VSaveDialog::OnCommand(const char *command)
{
	if( Q_stricmp( "Back", command ) == 0 )
	{
		m_pOptionsSubKeyboard->OnApplyChanges();
		OnKeyCodePressed( KEY_XBUTTON_B );
	}
	else if( Q_stricmp( "Cancel", command ) == 0 )
	{
		OnKeyCodePressed( KEY_XBUTTON_B );
	}
	else
	{
		BaseClass::OnCommand( command );
	}
}

void VSaveDialog::OnNotifyChildFocus( vgui::Panel* child )
{
}

void VSaveDialog::OnFlyoutMenuClose( vgui::Panel* flyTo )
{
	UpdateFooter();
}

void VSaveDialog::OnFlyoutMenuCancelled()
{
}

//=============================================================================
Panel* VSaveDialog::NavigateBack()
{
	return BaseClass::NavigateBack();
}

void VSaveDialog::PaintBackground()
{
	//BaseClass::DrawDialogBackground( "#L4D360UI_Cloud_Title", NULL, "#L4D360UI_Cloud_Subtitle", NULL, NULL, true );
}

void VSaveDialog::ApplySchemeSettings( vgui::IScheme *pScheme )
{
	BaseClass::ApplySchemeSettings( pScheme );

	// required for new style
	SetPaintBackgroundEnabled( true );
	SetupAsDialogStyle();
}
