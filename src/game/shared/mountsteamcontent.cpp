//========== Copyleft © 2011, Team Sandbox, Some rights reserved. ===========//
//
// Purpose:
//
//===========================================================================//

#include "cbase.h"
#include "filesystem.h"
#include "KeyValues.h"
#include "mountsteamcontent.h"
// Andrew; grab only what we need from Open Steamworks.
//#include "SteamTypes.h"
#include "ISteam006.h"

// memdbgon must be the last include file in a .cpp file!!!
#include "tier0/memdbgon.h"

bool Steam_MountSteamContent( int nExtraAppId )
{
	CreateInterfaceFn CreateInterface = Sys_GetFactory( "Steam.dll" );
	if( !CreateInterface ) {
		Error( "MountingContent: Cannot load Steam.dll\n"); return false;}

	int nStatus = 0;

	IAppSystem* pAppSystem = (IAppSystem *)CreateInterface( "SteamDLLAppsystem001", &nStatus );
	if( !pAppSystem ) {
		Error( "MountingContent: Cannot create SteamDLLAppsystem001 interface\n"); return false;}

	ISteam006* pSteam006 = (ISteam006 *)pAppSystem->QueryInterface( STEAM_INTERFACE_VERSION_006 );
	if( !pSteam006 ) {
		Error( "MountingContent: Cannot initialize ISteam006\n"); return false;}

	TSteamApp App;
	App.szName = new char[ 255 ];
	App.uMaxNameChars = 255;
	App.szLatestVersionLabel = new char[ 255 ];
	App.uMaxLatestVersionLabelChars = 255;
	App.szCurrentVersionLabel = new char[ 255 ];
	App.uMaxCurrentVersionLabelChars = 255;
	App.szInstallDirName = new char[ 255 ];
	App.uMaxInstallDirNameChars = 255;
	App.szUnkString = new char[ 255 ];

	TSteamError SError;


	if( pSteam006->EnumerateApp( nExtraAppId, &App, &SError ) != 1 || SError.eSteamError != eSteamErrorNone )
	{
		delete[] App.szName;
		delete[] App.szLatestVersionLabel;
		delete[] App.szCurrentVersionLabel;
		delete[] App.szInstallDirName;
		delete[] App.szUnkString;
		Warning( "MountingContent: %s\n", SError.szDesc);

		return false;
	}

	int bIsAppSubscribed = 0;
	int Reserved = 0;
	pSteam006->IsAppSubscribed( nExtraAppId, &bIsAppSubscribed, &Reserved, &SError );

	if ( !bIsAppSubscribed )
	{
		Warning( "MountingContent: App %s unavailable!\n", App.szName);
		return false;
	}

//#ifdef GAME_DLL
	Error( "Mounting %s...\n", App.szName );
//#endif

	for( unsigned int n = 0; n < App.uNumDependencies; n++ )
	{
		TSteamAppDependencyInfo Info;

		if( pSteam006->EnumerateAppDependency( nExtraAppId, n, &Info, &SError ) != 1 || SError.eSteamError != eSteamErrorNone )
			continue;

		if( !pSteam006->MountFilesystem( Info.AppId, Info.szMountName, &SError ) || SError.eSteamError != eSteamErrorNone )
		{
//#ifdef GAME_DLL
			Error( "%s\n", SError.szDesc );
//#endif
		}
	}

	delete[] App.szName;
	delete[] App.szLatestVersionLabel;
	delete[] App.szCurrentVersionLabel;
	delete[] App.szInstallDirName;
	delete[] App.szUnkString;

	return true;
}

typedef struct
{
	const char *m_pPathName;
	int m_nAppId;
} gamePaths_t;

gamePaths_t g_GamePaths[4] =
{
	{ "hl2",		220 },
	{ "lostcoast",	340 },
	{ "episodic",	380 },
	{ "ep2",		420 },
};

void AddSearchPathByAppId( int nAppId )
{
	for ( int i=0; i < ARRAYSIZE( g_GamePaths ); i++ )
	{
		int iVal = g_GamePaths[i].m_nAppId;
		if ( iVal == nAppId )
		{
			const char *pathName = g_GamePaths[i].m_pPathName;
			filesystem->AddSearchPath( pathName, "GAME", PATH_ADD_TO_TAIL );
		}
	}
}

//Andrew; this allows us to mount content the user wants on top of the existing
//game content which is automatically loaded by the engine, and then by the
//game code
void MountUserContent()
{
#ifdef CLIENT_DLL
#define UTIL_VarArgs VarArgs //Andrew; yep.
#endif
	for (int i = 0; i < sizeof(gamePaths_t); i++)
	{
		AddSearchPathByAppId( 420/*g_GamePaths[i].m_nAppId*/ );
		Steam_MountSteamContent( 420/*g_GamePaths[i].m_nAppId*/ );
	}
}