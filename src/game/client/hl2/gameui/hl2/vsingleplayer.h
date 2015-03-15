//========= Copyright © 1996-2008, Valve Corporation, All rights reserved. ============//
//
// Purpose: 
//
//=====================================================================================//

#ifndef __VNEWGAMEDIALOG_H__
#define __VNEWGAMEDIALOG_H__

#include "basemodui.h"

#include "vgui_controls/Frame.h"
#include "UtlVector.h"
#include "vfooterpanel.h"
#include "basemodui.h"
#include "VFlyoutMenu.h"


class CGameChapterPanel;
class CSkillSelectionDialog;
using namespace BaseModUI;
using namespace vgui;
class CNB_Button;
class CNB_Header_Footer;

// Slot indices in new game menu
#define INVALID_INDEX	-1
#define SLOT_OFFLEFT	0
#define SLOT_LEFT		1
#define SLOT_CENTER		2
#define SLOT_RIGHT		3
#define SLOT_OFFRIGHT	4
#define	NUM_SLOTS		5

//-----------------------------------------------------------------------------
// Purpose: Handles starting a new game, skill and chapter selection
//-----------------------------------------------------------------------------
class CNewGameDialog : public CBaseModFrame//vgui::Frame
{
	DECLARE_CLASS_SIMPLE( CNewGameDialog, CBaseModFrame );

public:
	MESSAGE_FUNC( FinishScroll,	"FinishScroll" );
	MESSAGE_FUNC( StartGame, "StartGame" );

	CNewGameDialog(vgui::Panel *parent, const char *name, bool bCommentaryMode = false );
	~CNewGameDialog();

	virtual void	Activate( void );

	virtual void	ApplySettings( KeyValues *inResourceData );
	virtual void	ApplySchemeSettings( vgui::IScheme *pScheme );
	virtual void	OnCommand( const char *command );
	virtual void	OnClose( void );
	virtual void	PaintBackground();
	void			SetSelectedChapterIndex( int index );
	void			SetSelectedChapter( const char *chapter );
	void			UpdatePanelLockedStatus( int iUnlockedChapter, int i, CGameChapterPanel *pChapterPanel );

	void			SetCommentaryMode( bool bCommentary ) { m_bCommentaryMode = bCommentary; }

	void UpdateFooter( void );

	// Xbox: Defined values are also used to shift the slot indices
	enum EScrollDirection
	{
		SCROLL_RIGHT	= -1,
		SCROLL_NONE		=  0,
		SCROLL_LEFT		=  1
	};
	EScrollDirection	m_ScrollDirection;

private:
	CNB_Header_Footer *m_pHeaderFooter;

	int m_iSelectedChapter;

	CUtlVector<CGameChapterPanel *> m_ChapterPanels;

	vgui::DHANDLE<CSkillSelectionDialog> m_hSkillSelectionDialog;

	vgui::Button		*m_pNextButton;
	vgui::Button		*m_pPrevButton;
	//vgui::Panel			*m_pCenterBg;
	vgui::Label			*m_pChapterTitleLabels[2];
	vgui::Label			*m_pBonusSelection;
	vgui::ImagePanel	*m_pBonusSelectionBorder;
	bool				m_bCommentaryMode;
	vgui::Label			*m_pCommentaryLabel;

	// Xbox
	void	ScrollSelectionPanels( EScrollDirection dir );
	void	ScrollBonusSelection( EScrollDirection dir );
	void	PreScroll( EScrollDirection dir );
	void	PostScroll( EScrollDirection dir );
	void	SetFastScroll( bool fast );
	void	ContinueScrolling( void );
	void	AnimateSelectionPanels( void );
	void	ShiftPanelIndices( int offset );
	bool	IsValidPanel( const int idx );
	void	InitPanelIndexForDisplay( const int idx );
	void	UpdateMenuComponents( EScrollDirection dir );
	void	UpdateBonusSelection( void );

	int		m_PanelXPos[ NUM_SLOTS ];
	int		m_PanelYPos[ NUM_SLOTS ];
	float	m_PanelAlpha[ NUM_SLOTS ];
	int		m_PanelIndex[ NUM_SLOTS ];
	float	m_ScrollSpeed;
	int		m_ButtonPressed;
	int		m_ScrollCt;
	bool	m_bScrolling;
	char	m_ActiveTitleIdx;
	bool	m_bMapStarting;
	int		m_iBonusSelection;
	bool	m_bScrollToFirstBonusMap;
	
	struct BonusMapDescription_t	*m_pBonusMapDescription;
};

/*
namespace BaseModUI {

class GenericPanelList;
class ChapterLabel;

class CNewGameDialog : public CBaseModFrame
{
	DECLARE_CLASS_SIMPLE( CNewGameDialog, CBaseModFrame );

public:
	CNewGameDialog( vgui::Panel *pParent, const char *pPanelName, bool bIsCommentaryDialog );
	~CNewGameDialog();

	int GetNumAllowedChapters() { return m_nAllowedChapters; }
	bool IsCommentaryDialog() { return m_bIsCommentaryDialog; }

	MESSAGE_FUNC_CHARPTR( OnItemSelected, "OnItemSelected", pPanelName );

protected:
	virtual void OnCommand( char const *pCommand );
	virtual void ApplySchemeSettings( vgui::IScheme *pScheme );
	virtual void Activate();
	virtual void PaintBackground();
	virtual void OnKeyCodePressed( vgui::KeyCode code );

private:
	void UpdateFooter();
	void SetChapterImage( int nChapter, bool bIsLocked = false );
	int	GetImageId( const char *pImageName );
	void DrawChapterImage();
	bool				m_bIsCommentaryDialog;

	int					m_nAllowedChapters;

	CUtlVector< int >	m_ChapterImages;
	int					m_nVignetteImageId;
	int					m_nChapterImageId;
	bool				m_bDrawAsLocked;

	GenericPanelList	*m_pChapterList;
	vgui::ImagePanel	*m_pChapterImage;
	ChapterLabel		*m_pChapterLabel;
};

};
*/
#endif
