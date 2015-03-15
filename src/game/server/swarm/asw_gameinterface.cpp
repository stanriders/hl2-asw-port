//====== Copyright © 1996-2003, Valve Corporation, All rights reserved. =======
//
// Purpose: FIXME: Place it anywhere in HL2. [str]
//
//=============================================================================

#include "cbase.h"
#include "gameinterface.h"
#include "mapentities.h"
#include "fmtstr.h"

// -------------------------------------------------------------------------------------------- //
// Mod-specific CServerGameClients implementation.
// -------------------------------------------------------------------------------------------- //

void CServerGameClients::GetPlayerLimits( int& minplayers, int& maxplayers, int &defaultMaxPlayers ) const
{
	minplayers = 1; 
	defaultMaxPlayers = maxplayers = 1;
	
}

// -------------------------------------------------------------------------------------------- //
// Mod-specific CServerGameDLL implementation.
// -------------------------------------------------------------------------------------------- //

void CServerGameDLL::LevelInit_ParseAllEntities( const char *pMapEntities )
{
}

bool g_bOfflineGame = false;

extern const char *COM_GetModDirectory( void );

//-----------------------------------------------------------------------------
// Purpose: Called to apply lobby settings to a dedicated server
//-----------------------------------------------------------------------------
void CServerGameDLL::ApplyGameSettings( KeyValues *pKV )
{
	if ( !pKV )
		return;

	// Fix the game settings request when a generic request for
	// map launch comes in (it might be nested under reservation
	// processing)
	bool bAlreadyLoadingMap = false;
	//char const *szBspName = NULL;
	const char *pGameDir = COM_GetModDirectory();
	if ( !Q_stricmp( pKV->GetName(), "::ExecGameTypeCfg" ) )
	{
		if ( !engine )
			return;

		char const *szNewMap = pKV->GetString( "map/mapname", "" );
		if ( !szNewMap || !*szNewMap )
			return;

		KeyValues *pLaunchOptions = engine->GetLaunchOptions();
		if ( !pLaunchOptions )
			return;

		if ( FindLaunchOptionByValue( pLaunchOptions, "changelevel" ) ||
			FindLaunchOptionByValue( pLaunchOptions, "changelevel2" ) )
			return;

		if ( FindLaunchOptionByValue( pLaunchOptions, "map_background" ) )
			return;

		bAlreadyLoadingMap = true;

		pKV->SetName( pGameDir );
	}

	if ( Q_stricmp( pKV->GetName(), pGameDir ) || bAlreadyLoadingMap )
		return;

	//g_bOfflineGame = pKV->GetString( "map/offline", NULL ) != NULL;
	g_bOfflineGame = !Q_stricmp( pKV->GetString( "system/network", "LIVE" ), "offline" );

	//Msg( "GameInterface reservation payload:\n" );
	//KeyValuesDumpAsDevMsg( pKV );

	// Vitaliy: Disable cheats as part of reservation in case they were enabled (unless we are on Steam Beta)
	/*if ( sv_force_transmit_ents.IsFlagSet( FCVAR_DEVELOPMENTONLY ) &&	// any convar with FCVAR_DEVELOPMENTONLY flag will be sufficient here
		sv_cheats && sv_cheats->GetBool() )
	{
		sv_cheats->SetValue( 0 );
	}*/
}