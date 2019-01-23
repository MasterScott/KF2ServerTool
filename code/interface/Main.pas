unit Main;

interface

uses
  Forms, Windows, SysUtils, Classes, Graphics, Controls,
  Dialogs, ComCtrls, JvComCtrls, StdCtrls,
  Menus,
  IniFiles, KFServerTool,
  MiscFunc, ExtCtrls, Buttons, ShellAPI, frmDnt, Workshop, Clipbrd,

  KFWksp,
  JvCombobox, JvEdit, IdBaseComponent,
  IdTCPClient, ImgList, OleCtrls,
  MSHTML, Variants, SHDocVw,
  ItemProgress,
  Vcl.Themes, GitAutoUpdate, System.uitypes,
  downloaderTool,
  Registry,
  System.Types, KFTypes, Jpeg,
  TypInfo, IOUtils, CommCtrl, System.ImageList, JvExStdCtrls, JvExComCtrls,
  toolLanguage, JvComponentBase, JvBalloonHint;

type
  TLvSelectedItems = Array of TListItem;
  TListViewDisplayStyle = (LVDS_Simple, LVDS_Thumbnail, LVDS_Icon);

  TFormMain = class(TForm)
    pmRemove: TPopupMenu;
    RemoveGameSteamCache1: TMenuItem;
    RemovefromCycle1: TMenuItem;
    RemoveMapEntry1: TMenuItem;
    Removeall1: TMenuItem;
    ilSmallIcons: TImageList;
    RemoveServerSubcribe1: TMenuItem;
    pmLV: TPopupMenu;
    add1: TMenuItem;
    Remove1: TMenuItem;
    Browserworkshop1: TMenuItem;
    AddbyID1: TMenuItem;
    Manual1: TMenuItem;
    allfilesandentry1: TMenuItem;
    cache1: TMenuItem;
    Mapentry1: TMenuItem;
    MapCycle1: TMenuItem;
    Subcribe1: TMenuItem;
    Forceupdate1: TMenuItem;
    Reinstall1: TMenuItem;
    N1: TMenuItem;
    lblCredits: TLabel;
    pnl1: TPanel;
    lblDonate: TLabel;
    btnReinstall: TBitBtn;
    btnUpdate: TBitBtn;
    mniCopyID1: TMenuItem;
    mniShowitempage1: TMenuItem;
    mniN2: TMenuItem;
    jvpgcntrl1: TJvPageControl;
    tsMods: TTabSheet;
    lvMods: TListView;
    tsServer: TTabSheet;
    grpStartServer: TGroupBox;
    tsExtra: TTabSheet;
    grpEnableDisable: TGroupBox;
    tsUnknowed: TTabSheet;
    lvUnknowed: TListView;
    grpapplication: TGroupBox;
    lblFontSize: TLabel;
    trckbrFontSize: TTrackBar;
    pnl3: TPanel;
    btnNewProfile: TButton;
    btnRenameProfile: TButton;
    btnDeleteProfile: TButton;
    cbbProfile: TComboBox;
    lblProfile: TLabel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnlmap: TPanel;
    pnldifficulty: TPanel;
    cbbMap: TComboBox;
    lblMap: TLabel;
    cbbDifficulty: TComboBox;
    lblDifficulty: TLabel;
    pnlgamelenght: TPanel;
    cbbLength: TComboBox;
    lblGameLength: TLabel;
    pnl10: TPanel;
    lblAddParam: TLabel;
    edtExtra: TEdit;
    edtGmPass: TEdit;
    lblGamePass: TLabel;
    btnStartServer: TButton;
    tsNotes: TTabSheet;
    mmoNotepad: TMemo;
    grpmaintenance: TGroupBox;
    btnCheckForUpdate: TButton;
    btnCleanDownloadCache: TButton;
    btnCheckForPreview: TButton;
    lblServerUpdate: TLabel;
    lblWorkshop: TLabel;
    btnCleanWorkshopData: TButton;
    tswebadmin: TTabSheet;
    wb1: TWebBrowser;
    tmrWebAdmin: TTimer;
    chkAutoConnectWeb: TCheckBox;
    lblAllChangesWillbe: TLabel;
    pmAdd: TPopupMenu;
    AddWorkshopMap: TMenuItem;
    AddWorkshopIDorURL: TMenuItem;
    Multipleitems1: TMenuItem;
    AddManualEntry: TMenuItem;
    lblGameMode: TLabel;
    cbbGameMode: TComboBox;
    lblLanguage: TLabel;
    cbbLanguage: TJvComboBox;
    tsDebug: TTabSheet;
    lblUpdate: TLabel;
    chkOnlyFromConfigItems: TCheckBox;
    Redirect1: TMenuItem;
    ManualEntry1: TMenuItem;
    pnl7: TPanel;
    edtPort: TJvEdit;
    lblDescWebPort: TLabel;
    lblDescWebAdmin: TLabel;
    cbStatusWeb: TJvComboBox;
    lblWkspDownMan: TLabel;
    cbWorkshopDMStatus: TJvComboBox;
    Panel1: TPanel;
    lblRedirectURL: TLabel;
    lblCustomRedirect: TLabel;
    edtRedirectURL: TJvEdit;
    cbbRedirectEnabled: TJvComboBox;
    FromRedirect1: TMenuItem;
    N2: TMenuItem;
    lblHelpAdditionParam: TLabel;
    Export1: TMenuItem;
    Explorerlocalfolder1: TMenuItem;
    FromList1: TMenuItem;
    edtWebPass: TJvEdit;
    lblWebPass: TLabel;
    chkAutoLoginAdmin: TCheckBox;
    lblTheme: TLabel;
    cbbTheme: TJvComboBox;
    btnAddNew: TBitBtn;
    btnRemove: TBitBtn;
    chkAutoCheckForUpdates: TCheckBox;
    tsMaps: TTabSheet;
    pnl2: TPanel;
    lblSearch: TLabel;
    edtSearch: TEdit;
    lvMaps: TListView;
    imgListItems: TImageList;
    cbbListViewDisplayStyle: TJvComboBox;
    lbl2: TLabel;
    Image1: TImage;
    ilMiscImgs: TImageList;
    btnSvIntegrityCurrent: TButton;
    lblVerifyServInt: TLabel;
    btnSvIntegrityBeta: TButton;
    mniRedownloadThumbnail: TMenuItem;
    pb1: TPaintBox;
    ilLVGroups: TImageList;
    lblMapCycleOptions: TLabel;
    chkGrouMapCycle: TCheckBox;
    chkIncludeSepratorsMapCycle: TCheckBox;
    btnGenerateCurrentStrings: TButton;
    btnGenerateNewTranslation: TButton;
    blhintHelp: TBalloonHint;
    procedure AddWorkshopClick(Sender: TObject);
    procedure Removeall1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AddWorkshopIDorURLClick(Sender: TObject);
    procedure pmRemovePopup(Sender: TObject);
    procedure RemoveGameSteamCache1Click(Sender: TObject);
    procedure RemovefromCycle1Click(Sender: TObject);
    procedure RemoveMapEntry1Click(Sender: TObject);
    procedure RemoveServerSubcribe1Click(Sender: TObject);
    procedure btnReinstallClick(Sender: TObject);
    procedure pmLVPopup(Sender: TObject);
    procedure lvClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure lblDonateClick(Sender: TObject);
    procedure jvpgcntrl1Change(Sender: TObject);
    procedure btnStartServerClick(Sender: TObject);
    procedure lblsasdadClick(Sender: TObject);
    procedure mniShowitempage1Click(Sender: TObject);
    procedure mniCopyID1Click(Sender: TObject);
    procedure lvMapsColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer;
      var Compare: Integer);
    procedure edtSearchChange(Sender: TObject);
    procedure cbbProfileChange(Sender: TObject);
    procedure btnNewProfileClick(Sender: TObject);
    procedure btnDeleteProfileClick(Sender: TObject);
    procedure btnRenameProfileClick(Sender: TObject);
    procedure cbbMapChange(Sender: TObject);
    procedure cbbDifficultyChange(Sender: TObject);
    procedure cbbLengthChange(Sender: TObject);
    procedure edtExtraChange(Sender: TObject);
    procedure edtGmPassChange(Sender: TObject);
    procedure RealignUIItems(Sender: TObject);
    procedure btnCheckForUpdateClick(Sender: TObject);
    procedure cbWorkshopDMStatusChange(Sender: TObject);
    procedure cbStatusWebChange(Sender: TObject);
    procedure edtPortExit(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure btnCleanDownloadCacheClick(Sender: TObject);
    procedure btnCleanWorkshopDataClick(Sender: TObject);
    procedure tmrWebAdminTimer(Sender: TObject);
    procedure chkAutoConnectWebClick(Sender: TObject);
    procedure Multipleitems1Click(Sender: TObject);
    function getSelectedCount(ListView: TListView): Integer;
    procedure lvMapsCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure cbbGameModeChange(Sender: TObject);
    procedure cbbLanguageChange(Sender: TObject);
    procedure checkForUpdates(Sender: TObject);
    procedure lostFocusSave(Sender: TObject);
    procedure chkOnlyFromConfigItemsClick(Sender: TObject);
    procedure edtRedirectURLExit(Sender: TObject);
    procedure cbbRedirectEnabledCloseUp(Sender: TObject);
    procedure FromRedirect1Click(Sender: TObject);
    procedure btnAddNewClick(Sender: TObject);
    procedure edtExtraEnter(Sender: TObject);

    procedure Export1Click(Sender: TObject);
    procedure FromList1Click(Sender: TObject);
    procedure Explorerlocalfolder1Click(Sender: TObject);
    procedure edtWebPassExit(Sender: TObject);
    procedure chkAutoLoginAdminClick(Sender: TObject);
    procedure wb1DocumentComplete(ASender: TObject; const pDisp: IDispatch;
      const URL: OleVariant);
    procedure cbbThemeChange(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure chkAutoCheckForUpdatesClick(Sender: TObject);
    procedure RedownloadSelectedThumbnails(Sender: TObject);
    procedure loadIMGFolder(Sender: TObject);
    procedure cbbListViewDisplayStyleChange(Sender: TObject);
    procedure lvMapsDblClick(Sender: TObject);
    procedure lvMapsInfoTip(Sender: TObject; Item: TListItem;
      var InfoTip: string);
    procedure GenerateGroupTitleImages(Sender: TObject);
    procedure sortCycleChange(Sender: TObject);
    procedure chkGrouMapCycleClick(Sender: TObject);
    procedure chkIncludeSepratorsMapCycleClick(Sender: TObject);
    function _s(text: String): String;
    function _p(text: String): PWideChar;
    procedure btnGenerateCurrentStringsClick(Sender: TObject);
    procedure btnGenerateNewTranslationClick(Sender: TObject);
    procedure AddManualEntryClick(Sender: TObject);
  private
    function loadConfig: Boolean;
    function saveconfig: Boolean;
    procedure LoadItensToLv(Filter: String);
    procedure LoadServerProfile;
    procedure LoadUIConfig;
    procedure InstallServer(Path: String);
    function CheckForServerRunningAndClose: Boolean;
    function GetLVSelectedItems(ListView: TListView): TLvSelectedItems;
    function IsDiffCategory(lvitems: TLvSelectedItems): Boolean;
    procedure autoLoginWb;
    procedure RedirectDownloadProgress(currentPosition: Int64);
    procedure RedirectDownloadStarted(fileSize: Int64);
    procedure RedirectDownloadFinished();
    procedure alignControlAtoControlB(elementA, elementB: TControl);
    procedure checkAutoWebLoginRequirements;
    procedure CheckIfTheServerIsRuning;
    procedure InstallRegBrowserKey;
    procedure CheckDependencies;
    procedure LoadFolderToImageList(Path: String);
    procedure translateUIElements;
    function _h(text: String): String;

  var
    ActiveLV: TListView;
    Descending: Boolean;
    SortedColumn: Integer;
    frmProgress: TformPB;

  const

    MEMONAME = 'KF2ServerTool.text';
    UPDATEPARAM = '-installupdate';
    LOCALIZATIONFILE = 'KF2ServerTool.lc';
    { Private declarations }
  public
  var
    pathKFGameIni, pathKFEngineIni, pathKFWebIni, pathCmdTool, customServerPath,
      pathServerEXE: string;
    useCustomServerPath, AutoConnectWeb, appMaximized, GroupMapCycle,
      GroupMapCycleSeparators: Boolean;
    onlyFromConfigItems: Boolean;
    appWidth: Integer;
    appHeight: Integer;
    fontSize: Integer;
    defaultProfile: Integer;
    configName: String;
    autoLoginWebAdmin: Boolean;
    { Public declarations }
    serverTool: TKFServerTool;
    kfprofiles: array of TKFServerProfile;
    fdefaultStyleName: String;
    AutoCheckForUpdates: Boolean;
    imgListIDIndex: TStringList;
    LVStyle: TListViewDisplayStyle;
    UILoaded: Boolean;
    tlTool: TKFTranslation;
    languageInitial: String;
  end;

var
  FormMain: TFormMain;

implementation

uses
  AddItem, PathDialog, Queue;
{$R *.dfm}

procedure TFormMain.AddManualEntryClick(Sender: TObject);
var
  frmAdd: TFormAdd;
  mdResult: Integer;
  progressForm: TformPB;
begin
  if ActiveLV = lvMaps then
  begin
    try
      frmAdd := TFormAdd.Create(Self);
      try
        CheckIfTheServerIsRuning;
        frmAdd.SetAddType(TKFItemType.LocalItem);
        mdResult := frmAdd.ShowModal;
        if (mdResult = mrOk) and (frmAdd.edtItemName.text <> '') then
        begin
          progressForm := TformPB.Create(Self);
          try
            progressForm.NextPBValue(_s('Installing item '));
            progressForm.tmrUndeterminedPB.Enabled := True;
            progressForm.Show;
            Application.ProcessMessages;
            try

              serverTool.InstallLocalItem(frmAdd.edtItemName.text,
                frmAdd.addMapCycle, frmAdd.addMapENtry)
            except
              on E: Exception do
                Application.MessageBox(PWideChar(_s(E.Message)), '',
                  MB_OK + MB_ICONEXCLAMATION);
            end;
            progressForm.Close;
            ShowMessage(_s('Finished!'));
          finally
            progressForm.Free;
          end;
        end;
      finally
        frmAdd.Free;
      end;
    finally
      LoadItensToLv('');
    end;
  end;

end;

procedure TFormMain.AddWorkshopClick(Sender: TObject);
var
  frmAdd: TFormAdd;
  frmWksp: TFormWorkshop;
  textToFind: string;
  itemID: string;
  isMod: Boolean;
  mdResult: Integer;
  progressForm: TformPB;

begin
  if InputQuery(_s('Find an item in workshop'), _s('Search for'), textToFind)
  then
  begin

    frmWksp := TFormWorkshop.Create(Self);

    try
      isMod := ActiveLV = lvMods;
      if isMod then
      begin

        itemID := frmWksp.BrowserItem(TWkspType.WorkshopMod, textToFind)
      end
      else
      begin
        itemID := frmWksp.BrowserItem(TWkspType.WorkshopMap, textToFind)
      end;
      if itemID <> '' then
      begin

        frmAdd := TFormAdd.Create(Self);
        try
          CheckIfTheServerIsRuning;
          if isMod then
          begin
            frmAdd.SetAddType(TKFItemType.WorkshopItem);
          end
          else
          begin
            frmAdd.SetAddType(TKFItemType.WorkshopMap);
          end;
          frmAdd.edtID.text := itemID;
          mdResult := frmAdd.ShowModal;
          if mdResult = mrOk then
          begin
            progressForm := TformPB.Create(Self);
            try
              progressForm.NextPBValue(_s('Installing item ') + itemID);
              progressForm.tmrUndeterminedPB.Enabled := True;
              progressForm.Show;
              Application.ProcessMessages;
              if serverTool.InstallWorkshopItem(frmAdd.edtID.text,
                frmAdd.ItemName, frmAdd.addWkspRedirect, frmAdd.downloadNow,
                True { dlImg } , frmAdd.addMapCycle, frmAdd.addMapENtry) = false
              then
              begin
                Application.MessageBox
                  (PWideChar(_s('One o more steps for item ') +
                  frmAdd.edtID.text + _s(' failed!')), '',
                  MB_OK + MB_ICONEXCLAMATION);

              end;
              progressForm.Close;
            finally
              progressForm.Free;
            end;

          end;

        finally
          frmAdd.Free;
        end;
      end;
    finally
      frmWksp.Free;
      LoadItensToLv('');
    end;

  end;

end;

procedure TFormMain.AddWorkshopIDorURLClick(Sender: TObject);
var
  frmAdd: TFormAdd;
  inputText: String;
  itemID: string;
  mdResult: Integer;
  progressForm: TformPB;
begin

  if InputQuery(_s('Add Workshop item'), _s('Workshop ID or URL'), inputText)
  then
  begin
    if Length(inputText) <= 11 then
    begin
      itemID := cleanInt(inputText)
    end
    else
    begin
      itemID := WorkshopURLtoID(inputText);
    end;

    if Length(itemID) > 4 then
    begin

      frmAdd := TFormAdd.Create(Self);
      try
        frmAdd.edtID.text := itemID;
        if ActiveLV = lvMaps then
        begin
          frmAdd.SetAddType(TKFItemType.WorkshopMap);
        end
        else
        begin
          frmAdd.SetAddType(TKFItemType.WorkshopItem);
        end;

        mdResult := frmAdd.ShowModal;

        if mdResult = mrOk then
        begin
          progressForm := TformPB.Create(Self);
          CheckIfTheServerIsRuning;
          try
            progressForm.NextPBValue(_p('Installing item ') + itemID);
            progressForm.Show;
            progressForm.tmrUndeterminedPB.Enabled := True;
            if serverTool.InstallWorkshopItem(frmAdd.edtID.text,
              frmAdd.ItemName, frmAdd.addWkspRedirect, frmAdd.downloadNow,
              True { dlImg } , frmAdd.addMapCycle, frmAdd.addMapENtry) = false
            then
            begin
              Application.MessageBox(PWideChar(_p('One o more steps for item ')
                + frmAdd.edtID.text + _p(' failed!')), '',
                MB_OK + MB_ICONEXCLAMATION);

            end;
          finally
            progressForm.Free;
          end;
        end;

      finally
        frmAdd.Free;
        LoadItensToLv('');
      end;
    end
    else
    begin

      Application.MessageBox(_p('Invalid ID/URL'), 'Error',
        MB_OK + MB_ICONWARNING);

    end;

  end;

end;

procedure TFormMain.btnStartServerClick(Sender: TObject);
var
  svPath: string;
  argCmd: string;
begin
  saveconfig;

  if ProcessExists(ExtractFileName(pathServerEXE)) then
  begin

    case Application.MessageBox
      (_p('An instace of server is already running.\nDo you wanna kill this process before?'),
      'Server', MB_YESNOCANCEL + MB_ICONINFORMATION) of
      IDCANCEL:
        begin
          Exit;
        end;
      IDYES:
        begin
          KillProcessByName(ExtractFileName(pathServerEXE));
          Sleep(1000);
        end;
    end;

  end
  else
  begin

  end;

  if cbbMap.text <> '' then
  begin

    if useCustomServerPath then
    begin
      svPath := IncludeTrailingPathDelimiter(customServerPath);
    end
    else
    begin
      svPath := ExtractFilePath(Application.ExeName);
    end;
    argCmd := cbbMap.text;
    argCmd := argCmd + '?Difficulty=' + IntToStr(cbbDifficulty.ItemIndex);
    argCmd := argCmd + '?GameLength=' + IntToStr(cbbLength.ItemIndex);
    if edtGmPass.text <> '' then
      argCmd := argCmd + '?GamePassword=' + edtGmPass.text;
    if edtExtra.text <> '' then
      argCmd := argCmd + edtExtra.text;
    case cbbGameMode.ItemIndex of
      0:
        argCmd := argCmd + '?game=KFGameContent.KFGameInfo_Endless';
      1:
        argCmd := argCmd + '?game=KFGameContent.KFGameInfo_Survival';
      2:
        argCmd := argCmd + '?game=KFGameContent.KFGameInfo_VersusSurvival';
      3:
        argCmd := argCmd + '?game=KFGameContent.KFGameInfo_WeeklySurvival';
      4:
        begin
          if (Pos('GAME=', UpperCase(edtExtra.text)) <= 0) then
            Application.MessageBox
              (_p('You have set the game mode to custom but you won''t \nspecified the custom game in additional parameters'),
              _p('Invalid custom game mod'), MB_OK + MB_ICONWARNING);

        end;
    end;

    // ShowMessage(argCmd);
    ShellExecute(handle, 'open', Pchar(pathServerEXE), Pchar(argCmd),
      Pchar(svPath), SW_SHOWNORMAL);

    if (chkAutoConnectWeb.Checked) and (cbStatusWeb.ItemIndex = 1) then
      tmrWebAdmin.Enabled := True;
  end
  else
  begin
    Application.MessageBox(_p('Select a map before start the server'), 'Map',
      MB_OK + MB_ICONINFORMATION);

  end;

end;

procedure TFormMain.GenerateGroupTitleImages(Sender: TObject);
var

  Bmp: TBitmap;
  i: Integer;
begin
  ilLVGroups.Clear;
  for i := 0 to 6 do
  begin

    Bmp := TBitmap.Create();
    Bmp.Canvas.Brush.Color := StyleServices.GetStyleColor(scListView);;
    Bmp.Width := ilLVGroups.Width;
    Bmp.Height := ilLVGroups.Height;
    Bmp.Transparent := True;
    Bmp.TransparentColor := StyleServices.GetStyleColor(scListView);;
    try
      with Bmp.Canvas do
      begin
        Font.Color := StyleServices.GetStyleFontColor(sfCaptionTextNormal);
        Brush.Style := bsClear;
        Font.Size := 14;
        case i of
          0:
            begin
              Font.Color := StyleServices.GetStyleColor(scButtonHot);
              TextOut(2, 2, 'Steam Workshop');
              Font.Color := StyleServices.GetStyleFontColor
                (sfCaptionTextNormal);
              TextOut(3, 3, 'Steam Workshop');
            end;
          1:
            begin
              Font.Color := StyleServices.GetStyleColor(scButtonHot);
              TextOut(2, 2, 'Official');
              Font.Color := StyleServices.GetStyleFontColor
                (sfCaptionTextNormal);
              TextOut(3, 3, 'Official');
            end;
          2:
            begin
              Font.Color := StyleServices.GetStyleColor(scButtonHot);
              TextOut(2, 2, 'Oficial');
              Font.Color := StyleServices.GetStyleFontColor
                (sfCaptionTextNormal);
              TextOut(3, 3, 'Oficial');
            end;
          3:
            begin
              Font.Color := StyleServices.GetStyleColor(scButtonHot);
              TextOut(2, 2, 'Local or redirect');
              Font.Color := StyleServices.GetStyleFontColor
                (sfCaptionTextNormal);
              TextOut(3, 3, 'Local or redirect');
            end;
          4:
            begin
              Font.Color := StyleServices.GetStyleColor(scButtonHot);
              TextOut(2, 2, 'Local ou redirect');
              Font.Color := StyleServices.GetStyleFontColor
                (sfCaptionTextNormal);
              TextOut(3, 3, 'Local ou redirect');
            end;
          5:
            begin
              Font.Color := StyleServices.GetStyleColor(scButtonHot);
              TextOut(2, 2, 'Incomplete');
              Font.Color := StyleServices.GetStyleFontColor
                (sfCaptionTextNormal);
              TextOut(3, 3, 'Incomplete');
            end;
          6:
            begin
              Font.Color := StyleServices.GetStyleColor(scButtonHot);
              TextOut(2, 2, 'Incompleto');
              Font.Color := StyleServices.GetStyleFontColor
                (sfCaptionTextNormal);
              TextOut(3, 3, 'Incompleto');
            end;
        end;

      end;
      ilLVGroups.Add(Bmp, nil);
    finally
      Bmp.Free
    end;
  end;

end;

procedure TFormMain.RedownloadSelectedThumbnails(Sender: TObject);
var
  wksp: TKFWorkshop;
  dlManager: TDownloadManager;
  i: Integer;
  itemID: String;
  seletectItems: TLvSelectedItems;
begin
  wksp := TKFWorkshop.Create(serverTool.GetKFApplicationPath);
  dlManager := TDownloadManager.Create;
  seletectItems := GetLVSelectedItems(lvMaps);
  if Assigned(frmProgress) then
    FreeAndNil(frmProgress);
  frmProgress := TformPB.Create(Self);
  frmProgress.Show;
  frmProgress.lblTitle.Caption := _s('Preparing to start');
  frmProgress.SetPBMax(Length(seletectItems));
  Application.ProcessMessages;

  try
    try
      for i := 0 to High(seletectItems) do
      begin
        Application.ProcessMessages;
        if seletectItems[i].GroupID = 0 then

          itemID := seletectItems[i].SubItems[0]
        else
          Continue;

        dlManager.OnFinished := RedirectDownloadFinished;
        dlManager.FileDAbort := @frmProgress.cancel;
        frmProgress.btncancel.Visible := True;
        frmProgress.lblTitle.Caption :=
          _s('Downloading Thumbnail of item ') + itemID;
        frmProgress.lblStatus.Caption := '[' + IntToStr(i + 1) + '/' +
          IntToStr(Length(seletectItems)) + '] item ' + itemID;
        frmProgress.SetPBValue(i + 1);
        wksp.DownloadWorkshopImage(itemID, dlManager);
        Application.ProcessMessages;
      end;
      Application.ProcessMessages;
    finally

      FreeAndNil(dlManager);
      FreeAndNil(wksp);
      FreeAndNil(frmProgress);
    end;
  except
    on E: Exception do
      ShowMessage(E.Message);

  end;
  LoadItensToLv('');
end;

procedure TFormMain.loadIMGFolder(Sender: TObject);
var

  BmpIMG: TBitmap;
  imgIdx: Integer;
begin
  try
    // LocalCache Load
    imgListItems.Clear;
    imgListIDIndex.Clear;
    LoadFolderToImageList(serverTool.GetKFApplicationPath + IMGCACHEFOLDER);
    // Official maps imgs
    LoadFolderToImageList(serverTool.GetKFApplicationPath + IMGWEBFOLDER);
    // Default Redirect img
    BmpIMG := TBitmap.Create;
    try
      ilMiscImgs.GetBitmap(0, BmpIMG);
      imgIdx := imgListItems.Add(BmpIMG, nil);
      imgListIDIndex.AddPair('DEFAULT_REDIRECT', IntToStr(imgIdx));

    finally
      FreeAndNil(BmpIMG);
    end;
    // Default Steam img
    try
      ilMiscImgs.GetBitmap(1, BmpIMG);
      imgIdx := imgListItems.Add(BmpIMG, nil);
      imgListIDIndex.AddPair('DEFAULT_STEAM', IntToStr(imgIdx));

    finally
      FreeAndNil(BmpIMG);
    end;

  except
    on E: Exception do
      serverTool.LogEvent('imgCacheLoad', 'Error: ' + E.Message);
  end;

end;

procedure TFormMain.LoadFolderToImageList(Path: String);
var
  imgsPathList: TStringList;
  wic: TWICImage;
  BmpIMG: TBitmap;
  imgIdx: Integer;
  i: Integer;
  filename: String;
  imgId: String;
begin
  imgsPathList := GetAllFilesInsideDirectory(Path, '*.jpg');

  try
    for i := 0 to imgsPathList.Count - 1 do
    begin
      try
        filename := TPath.GetFileNameWithoutExtension(imgsPathList[i]);
        imgId := UpperCase(filename);
        BmpIMG := TBitmap.Create;
        wic := TWICImage.Create;
        try
          wic.LoadFromFile(imgsPathList[i]);
          BmpIMG.Assign(wic);
          ResizeBitmap(BmpIMG, imgListItems.Width, imgListItems.Height);
          imgIdx := imgListItems.Add(BmpIMG, nil);
          if imgIdx >= 0 then
            imgListIDIndex.AddPair(imgId, IntToStr(imgIdx));
        finally
          FreeAndNil(BmpIMG);
          FreeAndNil(wic);
        end;
      except
        on E: Exception do
          serverTool.LogEvent('Preview images load', 'Error to load ' + filename
            + ' image. / Error: ' + E.Message);
      end;

    end;
  finally
    FreeAndNil(imgsPathList);
  end;
end;

procedure TFormMain.btnAddNewClick(Sender: TObject);
begin
  try
    with (Sender as TBitBtn).ClientToScreen
      (point(0, (Sender as TBitBtn).Height)) do
      pmAdd.Popup(X, Y);
  except

  end;
end;

procedure TFormMain.btnCheckForUpdateClick(Sender: TObject);
var
  i: Integer;
  cmdToolFullPath, cmdToolArgs: string;
  serverpath: string;
  dlgMsg: string;
  dlgType: string;
begin
  if useCustomServerPath then
    serverpath := IncludeTrailingPathDelimiter(customServerPath)
  else
    serverpath := ExtractFilePath(Application.ExeName);
  if Sender = btnCheckForUpdate then
  begin
    cmdToolArgs := '+login anonymous +force_install_dir ' + serverpath +
      ' +app_update 232130 +exit';
    dlgMsg := _s
      ('This will check for a server update.\nIf it''s avaliable the server will be updated.\nAre you sure?');
    dlgType := _s('Update server');
  end;
  if Sender = btnSvIntegrityCurrent then
  begin
    cmdToolArgs := '+login anonymous +force_install_dir ' + serverpath +
      ' +app_update 232130 validate +exit';
    dlgMsg := _s
      ('This will force verify the integrity of server, if some file is missing/corrupted will be reapaired\nAlso if it''s avaliable the server will be updated.\nAre you sure?');
    dlgType := _s('Server Integrity');
  end;

  if Sender = btnCheckForPreview then
  begin
    dlgMsg := _s
      ('This will check for a BETA PREVIEW server update.\nIf it''s avaliable the server will be updated.\nAre you sure?');
    dlgType := _s('Update server to BETA/PREVIEW');
    cmdToolArgs := '+login anonymous +force_install_dir ' + serverpath +
      ' +app_update 232130 -beta +exit';

  end;
  if Sender = btnSvIntegrityBeta then
  begin
    dlgMsg := _s
      ('This will force verify the integrity of server BETA/PREVIEW state, if some file is missing/corrupted will be reapaired\nAlso if it''s avaliable the server will be updated.\nAre you sure?');
    dlgType := _s('Update server to BETA/PREVIEW');
    cmdToolArgs := '+login anonymous +force_install_dir ' + serverpath +
      ' +app_update 232130 validate -beta preview +exit';

  end;

  i := Application.MessageBox(PWideChar(dlgMsg), PWideChar(dlgType),
    MB_OKCANCEL + MB_ICONQUESTION);

  if i = IDOK then
  begin
    cmdToolFullPath := serverpath + pathCmdTool;
    ExecuteFileAndWait(Self.handle, cmdToolFullPath, cmdToolArgs, SW_NORMAL);
    Application.MessageBox(_p('Finished'), PWideChar(dlgType),
      MB_OK + MB_ICONINFORMATION);
  end;

end;

procedure TFormMain.btnCleanDownloadCacheClick(Sender: TObject);
var
  i: Integer;

  DeleteFolder: TStringList;
  serverpath: String;
begin
  i := Application.MessageBox
    (_p('This will erase all data in cache folder.\nAre you sure?'),
    _p('Clean download cache'), MB_OKCANCEL + MB_ICONEXCLAMATION);
  if i = IDOK then
  begin

    DeleteFolder := TStringList.Create;
    try
      if useCustomServerPath then
        serverpath := IncludeTrailingPathDelimiter(customServerPath)
      else
        serverpath := ExtractFilePath(Application.ExeName);
      DeleteFolder.Add(serverpath + 'KFGame\Cache\');
      FileOperation(DeleteFolder, '', FO_DELETE);
    finally
      FreeAndNil(DeleteFolder);
    end;
    Application.MessageBox(_p('Finished'), _p('Clear cache'),
      MB_OK + MB_ICONINFORMATION);

  end;

end;

procedure TFormMain.btnCleanWorkshopDataClick(Sender: TObject);
var
  i: Integer;
  DeleteFolder: TStringList;
  wkspacf: TStringList;
  serverpath: String;
begin
  i := Application.MessageBox
    (_p('This will erase the workshop data base file.\nAre you sure?'),
    _p('Clean download cache'), MB_OKCANCEL + MB_ICONEXCLAMATION);
  if i = IDOK then
  begin
    DeleteFolder := TStringList.Create;
    wkspacf := TStringList.Create;
    try
      if useCustomServerPath then
        serverpath := IncludeTrailingPathDelimiter(customServerPath)
      else
        serverpath := ExtractFilePath(Application.ExeName);
      DeleteFolder.Add(serverpath +
        'Binaries\Win64\steamapps\workshop\content\232090');
      FileOperation(DeleteFolder, '', FO_DELETE);
      serverTool.CreateBlankACFFile;
    finally
      FreeAndNil(DeleteFolder);
      FreeAndNil(wkspacf);
    end;
    Application.MessageBox(_p('Finished'), _p('Clear cache'),
      MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TFormMain.CheckDependencies;
var
  steamcmdpath: String;
begin
  steamcmdpath := ExtractFilePath(Application.ExeName) + pathCmdTool;
  if not FileExists(steamcmdpath) then
  begin
    raise Exception.Create
      (_p('SteamCmd tool not found.\nYour installation of kf2servertool is incomplete.\nThe steamcmd tool is missing in the path ')
      + steamcmdpath +
      _p(' Reinstall the tool and start the application again.'));
    Exit;
  end;

end;

procedure TFormMain.btnDeleteProfileClick(Sender: TObject);
var
  i: Integer;
begin
  if Application.MessageBox(_p('Are you sure you want to delete this profile?'),
    _p('Remove profile'), MB_OKCANCEL + MB_ICONWARNING) = IDOK then
  begin
    kfprofiles[cbbProfile.ItemIndex].Free;
    for i := cbbProfile.ItemIndex to High(kfprofiles) - 1 do
      kfprofiles[i] := kfprofiles[i + 1];
    SetLength(kfprofiles, Length(kfprofiles) - 1);
    defaultProfile := 0;
    LoadServerProfile;
  end;

end;

procedure TFormMain.btnGenerateCurrentStringsClick(Sender: TObject);
var
  listOut: TStringList;
  currentList: TStringList;
  i: Integer;
begin
  listOut := TStringList.Create;
  currentList := tlTool.getCurrentLanguage.tlsource;
  for i := 0 to currentList.Count - 1 do
  begin
    listOut.Add(currentList.ValueFromIndex[i])
  end;
  with TSaveDialog.Create(Self) do
  begin
    if Execute() then
      listOut.SaveToFile(filename);
    Destroy;
  end;
  FreeAndNil(listOut);
end;

procedure TFormMain.btnGenerateNewTranslationClick(Sender: TObject);
var
  listOut: TStringList;
  lisSrc: TStringList;
  currentList: TStringList;
  i: Integer;
begin
  listOut := TStringList.Create;
  lisSrc := TStringList.Create;

  currentList := tlTool.getCurrentLanguage.tlsource;
  with TOpenDialog.Create(Self) do
  begin
    if Execute() then
      lisSrc.LoadFromFile(filename);
    Destroy;
  end;
  if currentList.Count = lisSrc.Count then
  begin

    for i := 0 to currentList.Count - 1 do
    begin
      listOut.AddPair(currentList.Names[i], lisSrc[i])
    end;
    with TSaveDialog.Create(Self) do
    begin
      if Execute() then
        listOut.SaveToFile(filename);
      Destroy;
    end;
  end
  else
  begin
    ShowMessage('Lists with diferent lines');
  end;
  FreeAndNil(listOut);
  FreeAndNil(lisSrc);
end;

procedure TFormMain.InstallServer(Path: String);
var
  cmdToolFullPath, cmdToolArgs: string;
begin
  cmdToolFullPath := ExtractFilePath(Application.ExeName) + pathCmdTool;
  cmdToolArgs := '+login anonymous +force_install_dir ' + Path +
    ' +app_update 232130 +exit';
  ExecuteFileAndWait(Self.handle, cmdToolFullPath, cmdToolArgs, SW_NORMAL);
end;

procedure TFormMain.btnNewProfileClick(Sender: TObject);
var
  newName: String;
  inputResult: Boolean;
begin

  repeat
    inputResult := InputQuery(_s('Add new profile'),
      _s('Profile name'), newName);
    if inputResult then
    begin
      if newName = '' then
      begin
        Application.MessageBox(_p('You must type in a name for the profile'),
          _p('Error'), MB_OK + MB_ICONSTOP);

      end
      else
      begin
        SetLength(kfprofiles, Length(kfprofiles) + 1);
        kfprofiles[High(kfprofiles)] := TKFServerProfile.Create;
        defaultProfile := High(kfprofiles);
        with kfprofiles[defaultProfile] do
        begin
          ProfileName := newName;
          DefaultDifficulty := 0;
          DefaultLength := 0;
          DefaultPass := '';
          AdditionalParam := '';
          DefaultMap := '';

        end;
        LoadServerProfile;

      end;

    end;

  until (newName <> '') or (inputResult = false);

end;

procedure TFormMain.btnReinstallClick(Sender: TObject);
var
  ItemName: string;
  itemID: string;
  frmReinstall: TFormAdd;
  slItemsCount, i: Integer;
  itemsDone: Integer;
  modalResult: Integer;
  selectedItems: TLvSelectedItems;
  progressForm: TformPB;

begin

  if ActiveLV.Selected = nil then
  begin
    ShowMessage(_s('Select an item first.'));
    Exit;
  end
  else
  begin
    slItemsCount := getSelectedCount(ActiveLV);
    itemsDone := 0;
    modalResult := mrNone;
    selectedItems := GetLVSelectedItems(ActiveLV);
    frmReinstall := TFormAdd.Create(Self);
    try
      if IsDiffCategory(selectedItems) then
      begin
        ShowMessage
          ('You cannot reinstall multiple items of different types. Select items of only one type.');
        Exit
      end;
      progressForm := TformPB.Create(Self);
      progressForm.SetPBMax(slItemsCount);
      progressForm.btncancel.Visible := True;
      progressForm.Show;
      CheckIfTheServerIsRuning;
      try
        for i := 0 to High(selectedItems) do
        begin
          try
            // For more than one item
            ItemName := selectedItems[i].Caption;
            itemID := selectedItems[i].SubItems[0];

            if ActiveLV = lvMaps then
            begin
              if (ItemName <> '') and (itemID <> '') then
              begin
                frmReinstall.SetAddType(TKFItemType.ReinstallWorkshopMap);

              end
              else
              begin
                case selectedItems[i].GroupID of
                  0:
                    frmReinstall.SetAddType(TKFItemType.WorkshopMap);

                  1:
                    frmReinstall.SetAddType(TKFItemType.OfficialItem);
                  2:
                    frmReinstall.SetAddType(TKFItemType.LocalOrRedirectItem);
                else
                  raise Exception.Create('Unknowed Group ID');
                end;

              end;
            end
            else if ActiveLV = lvMods then
            begin
              if (ItemName <> '') and (itemID <> '') then
                frmReinstall.SetAddType(TKFItemType.ReinstallWorkshopItem)
              else
              begin
                case selectedItems[i].GroupID of
                  0:
                    frmReinstall.SetAddType(TKFItemType.WorkshopItem);
                  1:
                    frmReinstall.SetAddType(TKFItemType.OfficialItem);
                  2:
                    frmReinstall.SetAddType(TKFItemType.RedirectMod);
                else
                  raise Exception.Create('Unknowed Group ID unsuported');
                end;

              end;
            end
            else if ActiveLV = lvUnknowed then
            begin
              frmReinstall.SetAddType(TKFItemType.UnknowedWorkshopItem)

            end;

            frmReinstall.edtID.text := itemID;
            frmReinstall.ItemName := ItemName;
            frmReinstall.edtID.Enabled := false;
            frmReinstall.Caption := _s('Reinstall ') + ItemName;
            if slItemsCount > 1 then
            begin
              frmReinstall.chkDoForAll.Visible := True;

              frmReinstall.chkDoForAll.Caption :=
                _s('Do the same for the next ') +
                IntToStr(slItemsCount - itemsDone) + _s(' items');

              if modalResult <> mrAll then
              begin
                modalResult := frmReinstall.ShowModal;
                if modalResult = mrCancel then
                  Exit;

              end;

              if (modalResult = mrOk) or (modalResult = mrAll) then
              begin
                if progressForm.cancel then
                  break;

                progressForm.NextPBValue(IntToStr(i + 1) + '/' +
                  IntToStr(High(selectedItems) + 1) + _s(' Installing item ')
                  + itemID);
                if serverTool.InstallWorkshopItem(frmReinstall.edtID.text,
                  frmReinstall.ItemName, frmReinstall.addWkspRedirect,
                  frmReinstall.downloadNow, frmReinstall.downloadNow { dlImg } ,
                  frmReinstall.addMapCycle, frmReinstall.addMapENtry) = false
                then
                begin
                  Application.MessageBox
                    (PWideChar(_s('One o more steps for item ') +
                    frmReinstall.edtID.text + _s(' failed!')), '',
                    MB_OK + MB_ICONEXCLAMATION);

                end;
              end
              else
              begin
                break;
              end;

              itemsDone := itemsDone + 1;
            end
            else
            begin
              // Just one item
              modalResult := frmReinstall.ShowModal;
              if (modalResult = mrOk) then
              begin

                progressForm.NextPBValue(_s('Installing item ') + itemID);

                if serverTool.InstallWorkshopItem(frmReinstall.edtID.text,
                  frmReinstall.ItemName, frmReinstall.addWkspRedirect,
                  frmReinstall.downloadNow, frmReinstall.downloadNow { dlImg } ,
                  frmReinstall.addMapCycle, frmReinstall.addMapENtry) = false
                then
                begin
                  Application.MessageBox
                    (PWideChar(_s('One o more steps for item ') +
                    frmReinstall.edtID.text + _s(' failed!')), '',
                    MB_OK + MB_ICONEXCLAMATION);

                end;

              end
              else
              begin
                LoadItensToLv('');
                Exit;
              end;

            end;

          except
            on E: Exception do
              ShowMessage(E.Message);
          end;

        end;
      finally
        progressForm.Free;
      end;
      LoadItensToLv('');
      Application.MessageBox(_p('Finished!'), '', MB_OK + MB_ICONINFORMATION)
    finally
      frmReinstall.Free;
    end;

  end;
end;

procedure TFormMain.btnRemoveClick(Sender: TObject);
begin
  try
    with (Sender as TBitBtn).ClientToScreen
      (point(0, (Sender as TBitBtn).Height)) do
      pmRemove.Popup(X, Y);
  except

  end;
end;

procedure TFormMain.btnRenameProfileClick(Sender: TObject);
var
  newName: String;
  inputResult: Boolean;
begin
  repeat
    inputResult := InputQuery(_s('Rename profile'), _s('New name'), newName);
    if inputResult then
    begin
      if newName = '' then
      begin
        Application.MessageBox(_p('You must type in a name for the profile'),
          _p('Error'), MB_OK + MB_ICONSTOP);

      end
      else
      begin
        kfprofiles[defaultProfile].ProfileName := newName;
        LoadServerProfile;
      end;
    end;
  until (newName <> '') or (inputResult = false);

end;

function TFormMain.GetLVSelectedItems(ListView: TListView): TLvSelectedItems;
var
  i: Integer;
begin
  try
    SetLength(Result, 0);
    try
      for i := 0 to ListView.Items.Count - 1 do
      begin
        if ListView.Items[i].Selected then
        begin

          SetLength(Result, Length(Result) + 1);
          Result[High(Result)] := ListView.Items[i];
        end;
      end;
    finally

    end;
  except
    SetLength(Result, 0);
    raise Exception.Create('Failed to generate Seletec itens array');
  end;
end;

function TFormMain.IsDiffCategory(lvitems: TLvSelectedItems): Boolean;
var
  i: Integer;
begin
  Result := false;
  try
    try
      for i := 0 to High(lvitems) - 1 do
      begin
        if lvitems[i].GroupID <> lvitems[i + 1].GroupID then
        begin
          Result := True;
          Exit;

        end;
      end;
    finally

    end;
  except
    raise Exception.Create('Error getting selected cagegorys types');
  end;
end;

procedure TFormMain.btnUpdateClick(Sender: TObject);
var
  ItemName: string;
  itemID: string;
  slItems, i: Integer;
  dlgText: String;
  progressForm: TformPB;
  selectedItems: TLvSelectedItems;
begin
  if ActiveLV.Selected = nil then
  begin
    ShowMessage(_s('Select an item first.'));
    Exit;
  end
  else
  begin

    slItems := getSelectedCount(ActiveLV);
    selectedItems := GetLVSelectedItems(ActiveLV);
    try
      if slItems = 1 then
        dlgText := _s('Force update?')
      else
        dlgText := _s('Force update to ') + IntToStr(slItems) +
          _s(' selected items?');

      if messagedlg(dlgText, mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
      begin
        progressForm := TformPB.Create(Self);
        progressForm.btncancel.Visible := True;
        progressForm.SetPBMax(slItems);
        try
          for i := 0 to High(selectedItems) do
          begin
            if progressForm.cancel then
              break;

            ItemName := selectedItems[i].Caption;
            itemID := selectedItems[i].SubItems[0];
            if slItems = 1 then
              progressForm.NextPBValue(_s(' Updating item ') + itemID + ' '
                + ItemName)
            else
              progressForm.NextPBValue(IntToStr(i + 1) + '/' + IntToStr(slItems)
                + _s(' Updating item ') + itemID);
            progressForm.Show;
            CheckIfTheServerIsRuning;
            serverTool.ForceUpdate(itemID, false);

          end;
          progressForm.Close;
        finally
          progressForm.Free;
        end;
        ShowMessage(_s('Finished!'));
        LoadItensToLv('');
      end;

    except
      on E: Exception do
        ShowMessage(E.Message);
    end;

  end;

end;

procedure TFormMain.chkAutoCheckForUpdatesClick(Sender: TObject);
begin
  AutoCheckForUpdates := chkAutoCheckForUpdates.Checked;
end;

procedure TFormMain.cbbDifficultyChange(Sender: TObject);
begin
  kfprofiles[defaultProfile].DefaultDifficulty := cbbDifficulty.ItemIndex;
end;

procedure TFormMain.cbbGameModeChange(Sender: TObject);
begin
  kfprofiles[defaultProfile].DefaultGameMode := cbbGameMode.ItemIndex;
  if (cbbGameMode.ItemIndex = 4) then
  begin
    if (Pos('?GAME=', UpperCase(edtExtra.text)) <= 0) then
    begin
      Application.MessageBox
        (PWideChar
        (_s('Specify the gamemod param in additional paramenters.\nExample: ') +
        '?Game=CustomModGame.MyGame'), _p('Custom game mode set'),
        MB_OK + MB_ICONINFORMATION);
      edtExtra.SetFocus;
    end;
  end
  else
  begin
    if Pos('?GAME=', UpperCase(edtExtra.text)) > 0 then
      Application.MessageBox
        (PWideChar
        (_s('You specified a custom game mode in additional parameters.\nConfiguring ')
        + cbbGameMode.text +
        _s(' as a game mode will cause the server to ignore\nthe custom game that you specified in Additional parameters box.')
        ), 'Custom game mode set', MB_OK + MB_ICONWARNING);
  end;
end;

procedure TFormMain.cbbLanguageChange(Sender: TObject);
begin

  languageInitial := tlTool.getLanguageByName(cbbLanguage.text).initial;

  // ShowMessage('The application will be restarted');
  Application.Terminate;
  ShellExecute(Application.handle, 'Open', Pchar(Application.ExeName), nil, nil,
    SW_NORMAL);
end;

procedure TFormMain.cbbLengthChange(Sender: TObject);
begin
  kfprofiles[defaultProfile].DefaultLength := cbbLength.ItemIndex;
end;

procedure TFormMain.cbbListViewDisplayStyleChange(Sender: TObject);
begin
  LVStyle := TListViewDisplayStyle(cbbListViewDisplayStyle.ItemIndex);
  LoadItensToLv('');
  // force update column size
  Self.Height := Self.Height + 1;
  Self.Height := Self.Height - 1;
  lvMaps.ShowHint := (LVStyle = LVDS_Icon);

end;

procedure TFormMain.cbbMapChange(Sender: TObject);
begin
  if (cbbMap.Items[cbbMap.ItemIndex] = KF_CYCLE_OFFICIAL_SEPARATOR) or
    (cbbMap.Items[cbbMap.ItemIndex] = KF_CYCLE_CUSTOM_SEPARATOR) then
    cbbMap.ItemIndex := -1;
  kfprofiles[defaultProfile].DefaultMap := cbbMap.Items[cbbMap.ItemIndex];
end;

procedure TFormMain.cbbProfileChange(Sender: TObject);
begin
  // cb Server Length and Difficulty
  saveconfig();
  defaultProfile := cbbProfile.ItemIndex;
  LoadServerProfile();
  saveconfig();
end;

procedure TFormMain.cbbRedirectEnabledCloseUp(Sender: TObject);
begin
  if cbbRedirectEnabled.ItemIndex = 0 then
  begin
    edtRedirectURL.text := '';
    try
      serverTool.SetCustomRedirect('');
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
    edtRedirectURL.Enabled := false;
    lblRedirectURL.Enabled := false;

  end
  else
  begin
    edtRedirectURL.Enabled := True;
    lblRedirectURL.Enabled := True;
    edtRedirectURL.SetFocus;
  end;
end;

procedure TFormMain.cbbThemeChange(Sender: TObject);
begin
  fdefaultStyleName := cbbTheme.text;
  if Assigned(TStyleManager.ActiveStyle) then
  begin
    TStyleManager.TrySetStyle(fdefaultStyleName);
    GenerateGroupTitleImages(nil);
    // whatever was in the project settings.
  end;
end;

function TFormMain.CheckForServerRunningAndClose: Boolean;
begin
  Result := false;
  if ProcessExists(ExtractFileName(pathServerEXE)) then
  begin
    Result := True;
    case Application.MessageBox
      (_p('An instace of server is running, you need close it to make this kind of change.\nDo you wanna close the server now?'),
      'Server', MB_YESNOCANCEL + MB_ICONINFORMATION) of
      IDCANCEL:
        begin
          Result := True;
          Exit;
        end;
      IDYES:
        begin
          KillProcessByName(ExtractFileName(pathServerEXE));
          Sleep(1000);
          Result := false;
        end;
    end;

  end;
end;

procedure TFormMain.chkOnlyFromConfigItemsClick(Sender: TObject);
begin
  onlyFromConfigItems := chkOnlyFromConfigItems.Checked;
  LoadItensToLv('');
end;

procedure TFormMain.chkAutoConnectWebClick(Sender: TObject);
begin
  AutoConnectWeb := chkAutoConnectWeb.Checked;
end;

procedure TFormMain.chkAutoLoginAdminClick(Sender: TObject);
begin
  autoLoginWebAdmin := chkAutoLoginAdmin.Checked;
end;

procedure TFormMain.chkGrouMapCycleClick(Sender: TObject);
begin
  chkIncludeSepratorsMapCycle.Enabled := chkGrouMapCycle.Checked;
  GroupMapCycle := chkGrouMapCycle.Checked;
  if UILoaded then
    sortCycleChange(Sender);
end;

procedure TFormMain.chkIncludeSepratorsMapCycleClick(Sender: TObject);
begin
  GroupMapCycleSeparators := chkIncludeSepratorsMapCycle.Checked;
  if UILoaded then
    sortCycleChange(Sender);
end;

procedure TFormMain.sortCycleChange(Sender: TObject);
begin
  serverTool.SetMapCycleOptions(GroupMapCycle, GroupMapCycleSeparators);
  serverTool.ResortMapCycle();
  LoadItensToLv(edtSearch.text);
end;

procedure TFormMain.cbStatusWebChange(Sender: TObject);

begin
  try
    if CheckForServerRunningAndClose = false then
    begin
      if cbStatusWeb.ItemIndex = 0 then
        serverTool.SetWebStatus(false)
      else
        serverTool.SetWebStatus(True);

    end;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TFormMain.cbWorkshopDMStatusChange(Sender: TObject);
begin
  try
    if cbWorkshopDMStatus.ItemIndex = 0 then
      serverTool.RemoveWorkshopManager
    else
      serverTool.InstallWorkshopManager;

  except
    on E: Exception do
      ShowMessage(E.Message);
  end;

end;

procedure TFormMain.edtExtraChange(Sender: TObject);
begin
  kfprofiles[defaultProfile].AdditionalParam := edtExtra.text;
  if Pos('GAME=', UpperCase(edtExtra.text)) > 0 then
    cbbGameMode.ItemIndex := 4;

end;

procedure TFormMain.edtExtraEnter(Sender: TObject);
begin
  lblHelpAdditionParam.Visible := True;
end;

procedure TFormMain.edtGmPassChange(Sender: TObject);
begin
  kfprofiles[defaultProfile].DefaultPass := edtGmPass.text;
end;

procedure TFormMain.lostFocusSave(Sender: TObject);
begin
  lblHelpAdditionParam.Visible := false;
  saveconfig();
end;

procedure TFormMain.edtPortExit(Sender: TObject);
var
  Port: Integer;
begin
  if CheckForServerRunningAndClose = false then
  begin
    try
      edtPort.text := cleanInt(edtPort.text);
      Port := StrToInt(edtPort.text);

    except
      ShowMessage(_s('Invalid port number'));
      edtPort.text := '8080';
      Exit;
    end;
    try
      serverTool.SetWebPort(Port);
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;

  end;
end;

procedure TFormMain.edtRedirectURLExit(Sender: TObject);
begin
  try
    serverTool.SetCustomRedirect(Trim(edtRedirectURL.text));
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TFormMain.edtSearchChange(Sender: TObject);
begin
  LoadItensToLv(edtSearch.text);
end;

procedure TFormMain.edtWebPassExit(Sender: TObject);
begin
  try
    serverTool.SetWebPass(edtWebPass.text);
    checkAutoWebLoginRequirements();
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TFormMain.checkAutoWebLoginRequirements;
begin
  if edtWebPass.text = '' then
  begin
    chkAutoLoginAdmin.Checked := false;
    chkAutoLoginAdmin.Enabled := false;
  end
  else
  begin
    chkAutoLoginAdmin.Enabled := True;
  end;
end;

procedure TFormMain.Explorerlocalfolder1Click(Sender: TObject);
var
  i: Integer;
  slItems: TLvSelectedItems;
  itemPath: String;
begin
  slItems := GetLVSelectedItems(ActiveLV);

  for i := 0 to High(slItems) do
  begin
    case slItems[i].GroupID of
      0:
        // workshop
        itemPath := serverTool.GetKFApplicationPath + WKP_CACHEFOLDER +
          slItems[i].SubItems[0];
      1, 2: // redirect or official
        begin
          if ActiveLV = lvMods then
            itemPath := serverTool.GetKFApplicationPath + KF_BREWEDPCSSUBFOLDER
          else
            itemPath := serverTool.GetKFApplicationPath + KF_LOCALMAPSSUBFOLDER
        end;
      3:
        ShowMessage('Unable to browser.');
    end;
    ShellExecute(Application.handle, 'open', 'explorer.exe', Pchar(itemPath),
      nil, SW_NORMAL);
  end;

end;

procedure TFormMain.CheckIfTheServerIsRuning();
var
  warningText, serverRunning: string;
begin

  warningText := '';
  serverRunning := '';

  if serverTool.IsServerRunning then
  begin
    if Application.MessageBox
      (_p('You should close the server before make changes.\nDo you wanna close it now?'),
      _p('Server is running'), MB_YESNO + MB_ICONWARNING) = IDYES then
    begin
      serverTool.KillKFServer();
    end;

  end;
end;

procedure TFormMain.Export1Click(Sender: TObject);
var
  i: Integer;
  exportItems: Array of TKFItem;
  aKFItem: TKFItem;
  dlgOutputFile: TSaveDialog;
  itemsExported: Integer;
  selectedItems: TLvSelectedItems;
begin
  dlgOutputFile := TSaveDialog.Create(Self);

  try
    try
      SetLength(exportItems, 0);

      dlgOutputFile.filename := 'MapListBackup.mapList';
      dlgOutputFile.Options := [ofFileMustExist];
      dlgOutputFile.Filter := 'KF2 MAP LIST BACKUP (*.mapList)|*.mapList';
      selectedItems := GetLVSelectedItems(ActiveLV);
      if IsDiffCategory(selectedItems) then
      begin
        ShowMessage(_s('Select just one category of items and try again.'));
        Exit;
      end;

      if dlgOutputFile.Execute(Self.handle) then
      begin

        for i := 0 to High(selectedItems) do
        begin

          aKFItem := TKFItem.Create;
          aKFItem.filename := selectedItems[i].Caption;
          aKFItem.ID := selectedItems[i].SubItems[0];

          SetLength(exportItems, Length(exportItems) + 1);
          exportItems[High(exportItems)] := aKFItem;
        end;
        itemsExported := serverTool.ExportItemsList(exportItems,
          dlgOutputFile.filename);
        if itemsExported > 0 then
        begin
          ShowMessage(IntToStr(itemsExported) +
            _s(' items exported successfully.'));
        end;
      end;
    finally
      dlgOutputFile.Free;
    end;

  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TFormMain.LoadItensToLv(Filter: String);
var
  i: Integer;
  Item: TListItem;
  textYes, textNo: string;
  mapCycle: TStringList;
  ItemNameF, ItemIDF: string;
  itemImgIdx: String;
  itemType: KFTypes.TKFItemType;
begin

  serverTool.LoadItems;

  lvMaps.Items.Clear;
  lvMods.Clear;
  lvUnknowed.Items.Clear;
  if (LVStyle = LVDS_Thumbnail) or (LVStyle = LVDS_Icon) then
    loadIMGFolder(nil);
  lvMaps.Items.BeginUpdate;
  try
    case LVStyle of
      LVDS_Simple:
        begin
          // Simple icon
          lvMaps.SmallImages := ilSmallIcons;
          // No text
          textYes := '';
          textNo := '';
          lvMaps.ViewStyle := vsReport;
        end;
      LVDS_Thumbnail:
        begin
          // Preview image list
          lvMaps.SmallImages := imgListItems;
          // Yes no text
          textYes := 'True';
          textNo := 'False';
          lvMaps.ViewStyle := vsReport;
        end;
      LVDS_Icon:
        begin
          // Preview image list
          lvMaps.SmallImages := imgListItems;
          // Yes no text
          textYes := '';
          textNo := '';
          lvMaps.ViewStyle := vsIcon;
        end;
    end;
    // lvSubscriptions.Clear;
    for i := 0 to High(serverTool.Items) do
    begin
      Filter := UpperCase(Filter);
      ItemNameF := UpperCase(serverTool.Items[i].filename);
      ItemIDF := UpperCase(serverTool.Items[i].ID);
      itemType := serverTool.Items[i].itemType;
      if (Filter = '') or (Pos(Filter, ItemNameF) > 0) or
        (Pos(Filter, ItemIDF) > 0) then
      begin
        // Ignore cache files if the server is not subscribed
        if (onlyFromConfigItems) and (serverTool.Items[i].ServerCache) and
          (serverTool.Items[i].ServerSubscribe = false) then
        begin
          Continue;
        end;

        if itemType = KFMod then
        begin
          Item := lvMods.Items.Add;
          Item.Caption := serverTool.Items[i].filename;
          Item.SubItems.Add(serverTool.Items[i].ID);
          Item.Data := @serverTool.Items[i];
          case serverTool.Items[i].SourceFrom of
            KFSteamWorkshop:
              begin
                Item.GroupID := 0;
                Item.SubItems.Add
                  (BoolToWord(serverTool.Items[i].ServerSubscribe));
              end;
            KFOfficial:
              begin
                Item.GroupID := 1;
                Item.SubItems.Add('');
              end;
            KFRedirectOrLocal:
              begin
                Item.GroupID := 2;
                Item.SubItems.Add('');
              end;
            KFUnknowedSource:
              begin
                Item.GroupID := 3;
                Item.SubItems.Add('');
              end;
          end;
          Item.SubItems.Add(BoolToWord(serverTool.Items[i].ServerCache));

        end
        else
        begin
          if itemType = KFMap then
            Item := lvMaps.Items.Add
          else
            Item := lvUnknowed.Items.Add;
          Item.Data := @serverTool.Items[i];
          case LVStyle of
            LVDS_Simple:
              begin
                Item.ImageIndex := 5;
              end;
            LVDS_Thumbnail, LVDS_Icon:
              begin
                if itemType = KFMap then
                begin

                  try
                    itemImgIdx := '';
                    if serverTool.Items[i].SourceFrom = KFSteamWorkshop then
                    begin
                      itemImgIdx := imgListIDIndex.ValueFromIndex
                        [imgListIDIndex.IndexOfName(serverTool.Items[i].ID)];
                      if itemImgIdx = '' then
                        itemImgIdx := imgListIDIndex.ValueFromIndex
                          [imgListIDIndex.IndexOfName('DEFAULT_STEAM')];
                    end;

                    if serverTool.Items[i].SourceFrom = KFOfficial then
                      itemImgIdx := imgListIDIndex.ValueFromIndex
                        [imgListIDIndex.IndexOfName
                        (UpperCase(serverTool.Items[i].filename))];
                    if serverTool.Items[i].SourceFrom = KFRedirectOrLocal then
                    begin
                      itemImgIdx := imgListIDIndex.ValueFromIndex
                        [imgListIDIndex.IndexOfName
                        (UpperCase(serverTool.Items[i].filename))];
                      if itemImgIdx = '' then
                        itemImgIdx := imgListIDIndex.ValueFromIndex
                          [imgListIDIndex.IndexOfName('DEFAULT_REDIRECT')];
                    end;

                    if cleanInt(itemImgIdx) <> '' then

                      Item.ImageIndex := StrToInt(itemImgIdx)
                    else
                      Item.ImageIndex := -1;
                  except
                    Item.ImageIndex := -1;
                  end;

                  { try
                    with lblTest do
                    begin
                    Parent := lvMaps;
                    lblRect := Item.DisplayRect(drBounds);

                    BoundsRect := lblRect;
                    Caption := 'test';//serverTool.Items[i].filename;
                    Font.Size := 14;
                    end;
                    except

                    end;
                  }
                end
                else
                begin
                  Item.ImageIndex := 3;
                end;

              end;

          end;

          Item.Caption := serverTool.Items[i].filename;
          Item.SubItems.Add(serverTool.Items[i].ID);
          if (LVStyle = LVDS_Thumbnail) and (itemType = KFMap) then
            Item.Caption := Item.Caption + #13 + #13 + _s('Workshop ID: ') +
              serverTool.Items[i].ID;
          // ServerSubscription
          if serverTool.Items[i].ServerSubscribe then
          begin
            Item.SubItems.Add(textYes);
            Item.SubItemImages[1] := 0;
            if (LVStyle = LVDS_Thumbnail) and (itemType = KFMap) then
              Item.Caption := Item.Caption + #13 + _s('Server subscribed: ')
                + textYes;
          end
          else
          begin
            Item.SubItems.Add(textNo);
            if serverTool.Items[i].SourceFrom = KFSteamWorkshop then
            begin

              if itemType = KFUnknowed then
                Item.SubItemImages[1] := 4
              else
                Item.SubItemImages[1] := 1;
              if (LVStyle = LVDS_Thumbnail) and (itemType = KFMap) then
                Item.Caption := Item.Caption + #13 +
                  _s('Server subscribed: ') + textNo;
            end;

          end;
          // MapCycle
          if serverTool.Items[i].MapEntry then
          begin
            Item.SubItems.Add(textYes);
            Item.SubItemImages[2] := 0;
            if (LVStyle = LVDS_Thumbnail) and (itemType = KFMap) then
              Item.Caption := Item.Caption + #13 + _s('In map entrys: ')
                + textYes;
          end
          else
          begin
            Item.SubItems.Add(textNo);
            if itemType = KFUnknowed then
              Item.SubItemImages[2] := 4
            else
              Item.SubItemImages[2] := 1;
            if (LVStyle = LVDS_Thumbnail) and (itemType = KFMap) then
              Item.Caption := Item.Caption + #13 +
                _s('In map entrys: ') + textNo;
          end;
          // MapEntry
          if serverTool.Items[i].MapCycleEntry then
          begin
            Item.SubItems.Add(textYes);
            Item.SubItemImages[3] := 0;
            if (LVStyle = LVDS_Thumbnail) and (itemType = KFMap) then
              Item.Caption := Item.Caption + #13 + _s('In map cycle: ')
                + textYes;
          end
          else
          begin
            Item.SubItems.Add(textNo);
            if itemType = KFUnknowed then
              Item.SubItemImages[3] := 4
            else
              Item.SubItemImages[3] := 1;
            if (LVStyle = LVDS_Thumbnail) and (itemType = KFMap) then
              Item.Caption := Item.Caption + #13 + _s('In map cycle: ')
                + textNo;
          end;
          // ServerCache
          if serverTool.Items[i].ServerCache then
          begin
            Item.SubItems.Add(textYes);
            Item.SubItemImages[4] := 0;
            if (LVStyle = LVDS_Thumbnail) and (itemType = KFMap) then
              Item.Caption := Item.Caption + #13 + _s('In server Cache: ')
                + textYes;
          end
          else
          begin
            Item.SubItems.Add(textNo);
            if itemType = KFUnknowed then
              Item.SubItemImages[4] := 4
            else
              Item.SubItemImages[4] := 1;
            if (LVStyle = LVDS_Thumbnail) and (itemType = KFMap) then
              Item.Caption := Item.Caption + #13 +
                _s('In server Cache: ') + textNo;

          end;
          // Item group
          case serverTool.Items[i].SourceFrom of
            KFSteamWorkshop:
              Item.GroupID := 0;
            KFOfficial:
              Item.GroupID := 1;
            KFRedirectOrLocal:
              Item.GroupID := 2;
            KFUnknowedSource:
              Item.GroupID := 3;
          end;

        end;
      end;

    end;

    if lvUnknowed.Items.Count > 0 then
      tsUnknowed.TabVisible := True
    else
      tsUnknowed.TabVisible := false;
    // Map Cycle to combo box

    cbbMap.Clear;

    mapCycle := serverTool.GetGameCycle;
    try
      for i := 0 to mapCycle.Count - 1 do
        cbbMap.Items.Add(mapCycle[i]);
    finally
      FreeAndNil(mapCycle);
    end;
    case LVStyle of
      LVDS_Simple:
        begin
          // Show columns
          lvMaps.Column[1].Width := 89;
          lvMaps.Column[2].Width := 85;
          lvMaps.Column[3].Width := 73;
          lvMaps.Column[4].Width := 73;
          lvMaps.Column[5].Width := 85;
          lvMaps.ShowColumnHeaders := True;
        end;
      LVDS_Thumbnail:
        begin
          // Hide columns
          lvMaps.Column[1].Width := 0;
          lvMaps.Column[2].Width := 0;
          lvMaps.Column[3].Width := 0;
          lvMaps.Column[4].Width := 0;
          lvMaps.Column[5].Width := 0;
          lvMaps.ShowColumnHeaders := false;
        end;
    end;
  finally
    lvMaps.Items.EndUpdate;
  end;

end;

procedure TFormMain.lvMapsColumnClick(Sender: TObject; Column: TListColumn);
begin
  TListView(Sender).SortType := stNone;
  if Column.Index <> SortedColumn then
  begin
    SortedColumn := Column.Index;
    Descending := false;
  end
  else
    Descending := not Descending;
  TListView(Sender).SortType := stText;
end;

procedure TFormMain.lvMapsCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if not(fdefaultStyleName <> 'Windows') then

    with lvMaps.Canvas.Brush do
    begin
      if (Item.Index mod 2) = 0 then
        Color := clInactiveBorder
      else
        Color := clWhite;
    end;

end;

procedure TFormMain.lvMapsDblClick(Sender: TObject);
begin
  try

    pmLV.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);

  except

  end;
end;

procedure TFormMain.lvMapsInfoTip(Sender: TObject; Item: TListItem;
  var InfoTip: string);
var

  kfitem: TKFItem;
  kfitemP: ^TKFItem;
begin

  if Assigned(Item.Data) then
  begin

    kfitemP := Item.Data;
    kfitem := kfitemP^;
    InfoTip := '';
    InfoTip := kfitem.filename + #13 + #13;

    if kfitem.SourceFrom = KFSteamWorkshop then
    begin
      InfoTip := InfoTip + _s('Workshop ID: ') + kfitem.ID + #13;
      InfoTip := InfoTip + _s('Subcribed: ') +
        BoolToWord(kfitem.ServerSubscribe) + #13;
    end;
    InfoTip := InfoTip + _s('Map Entry: ') + BoolToWord(kfitem.MapEntry) + #13;
    InfoTip := InfoTip + _s('Map in cycle: ') +
      BoolToWord(kfitem.MapCycleEntry) + #13;
    InfoTip := InfoTip + _s('In Cache: ') + BoolToWord(kfitem.ServerCache);

  end;
end;

procedure TFormMain.lvCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
begin
  if SortedColumn = 0 then
    Compare := CompareText(Item1.Caption, Item2.Caption)
  else if SortedColumn <> 0 then
    Compare := CompareText(Item1.SubItems[SortedColumn - 1],
      Item2.SubItems[SortedColumn - 1]);
  if Descending then
    Compare := -Compare;
end;

procedure TFormMain.lvClick(Sender: TObject);
var
  selectedItems: TLvSelectedItems;
begin

  try
    if (ActiveLV.Selected <> nil) then
    begin
      selectedItems := GetLVSelectedItems(ActiveLV);
      if IsDiffCategory(selectedItems) then
      begin

        btnReinstall.Enabled := false;
        btnUpdate.Enabled := false;
        btnRemove.Enabled := false;
        Exit;
      end;

      if ActiveLV.Selected.GroupID = 0 then // Workshop
      begin
        btnReinstall.Enabled := True;
        btnReinstall.Visible := True;
        btnUpdate.Visible := True;
        btnUpdate.Enabled := True;
        btnRemove.Enabled := True;
        Removeall1.Visible := True;
        RemoveGameSteamCache1.Visible := True;
        RemoveMapEntry1.Visible := True;
        RemovefromCycle1.Visible := True;
        RemoveServerSubcribe1.Visible := True;
      end
      else if ActiveLV.Selected.GroupID = 1 then
      begin // Official
        btnReinstall.Enabled := True;
        btnReinstall.Visible := True;
        btnUpdate.Visible := false;
        btnUpdate.Enabled := false;
        btnRemove.Enabled := True;
        Removeall1.Visible := false;
        RemoveGameSteamCache1.Visible := false;
        RemoveMapEntry1.Visible := false;
        RemovefromCycle1.Visible := True;
        RemoveServerSubcribe1.Visible := false;
      end
      else if ActiveLV.Selected.GroupID = 2 then
      begin
        // Redirect or local
        if ActiveLV = lvMaps then
        begin

          btnReinstall.Enabled := True;
          btnReinstall.Visible := True;
        end
        else
        begin
          btnReinstall.Enabled := false;
          btnReinstall.Visible := false;
        end;
        btnUpdate.Visible := false;
        btnUpdate.Enabled := false;
        btnRemove.Enabled := True;

        Removeall1.Visible := True;
        RemoveGameSteamCache1.Visible := True;
        RemoveMapEntry1.Visible := True;
        RemovefromCycle1.Visible := True;
        RemoveServerSubcribe1.Visible := false;

      end;

    end
    else
    begin

      btnReinstall.Enabled := false;
      btnUpdate.Enabled := false;
      btnRemove.Enabled := false;
    end;

  finally
    SetLength(selectedItems, 0);
  end;
end;

procedure TFormMain.mniCopyID1Click(Sender: TObject);
var
  itemsId: String;
  i: Integer;
  slItems: TLvSelectedItems;
begin
  itemsId := '';
  slItems := GetLVSelectedItems(ActiveLV);
  for i := 0 to High(slItems) do
  begin
    itemsId := itemsId + slItems[i].SubItems[0] + ' ';

    Clipboard.AsText := itemsId;

  end;
end;

procedure TFormMain.mniShowitempage1Click(Sender: TObject);
var
  i: Integer;
  slItems: TLvSelectedItems;
begin
  slItems := GetLVSelectedItems(ActiveLV);
  if ActiveLV.Selected <> nil then
  begin

    for i := 0 to High(slItems) do
    begin
      if slItems[i].Selected then
        ShellExecute(0, 'open',
          Pchar('https://steamcommunity.com/sharedfiles/filedetails/?id=' +
          slItems[i].SubItems[0]), nil, nil, SW_SHOWNORMAL);
    end;
  end;

end;

procedure TFormMain.Multipleitems1Click(Sender: TObject);
var
  frmQueue: TfrmQueue;
  isMod: Boolean;
begin
  frmQueue := TfrmQueue.Create(Self);
  isMod := ActiveLV = lvMods;
  try
    try
      if isMod then
      begin
        frmQueue.addType := TKFItemType.WorkshopItem;
      end
      else
      begin
        frmQueue.addType := TKFItemType.WorkshopMap;
      end;
      frmQueue.Font.Size := fontSize;
      frmQueue.ShowModal;
      LoadItensToLv('');
    finally
      frmQueue.Free;
    end;

  except
    on E: Exception do
      ShowMessage(E.Message);

  end;
end;

procedure TFormMain.pmLVPopup(Sender: TObject);
var
  selectedItems: TLvSelectedItems;
begin

  selectedItems := GetLVSelectedItems(ActiveLV);
  try
    if (ActiveLV = lvMaps) or (ActiveLV = lvUnknowed) then
    begin
      Mapentry1.Visible := True;
      MapCycle1.Visible := True;
      mniRedownloadThumbnail.Visible := True;
    end
    else if ActiveLV = lvMods then
    begin
      Mapentry1.Visible := false;
      MapCycle1.Visible := false;
      mniRedownloadThumbnail.Visible := false;
    end;

    if (ActiveLV.Selected = nil) or IsDiffCategory(selectedItems) then
    begin
      add1.Enabled := True;
      add1.Visible := True;
      Browserworkshop1.Enabled := True;
      AddbyID1.Enabled := True;
      Remove1.Enabled := false;
      allfilesandentry1.Enabled := false;
      cache1.Enabled := false;
      RemoveMapEntry1.Enabled := false;
      MapCycle1.Enabled := false;
      Subcribe1.Enabled := false;
      Forceupdate1.Enabled := false;
      Reinstall1.Enabled := false;
      mniShowitempage1.Visible := false;
      mniCopyID1.Visible := false;
      mniRedownloadThumbnail.Visible := false;
    end
    else
    begin
      // ShowMessage(IntToStr( ActiveLV.Selected.SubItemImages[2]));

      if ActiveLV.Selected.GroupID = 0 then // Workshop
      begin
        Browserworkshop1.Enabled := True;
        Browserworkshop1.Visible := True;
        Remove1.Enabled := True;
        mniShowitempage1.Visible := True;
        mniCopyID1.Visible := True;
        Subcribe1.Visible := True;
        Forceupdate1.Visible := True;
        Subcribe1.Enabled := True;
        Forceupdate1.Enabled := True;
        allfilesandentry1.Enabled := True;
        cache1.Enabled := True;
        RemoveMapEntry1.Enabled := True;
        MapCycle1.Enabled := True;
        allfilesandentry1.Visible := True;
        cache1.Visible := True;
        if ActiveLV = lvMaps then
        begin

          RemoveMapEntry1.Visible := True;
          MapCycle1.Visible := True;
          mniRedownloadThumbnail.Visible := True;
        end
        else
        begin
          RemoveMapEntry1.Visible := false;
          MapCycle1.Visible := false;
          mniRedownloadThumbnail.Visible := false;
        end;
      end
      else if ActiveLV.Selected.GroupID = 1 then
      begin // Official
        Browserworkshop1.Enabled := false;
        Browserworkshop1.Visible := false;
        mniShowitempage1.Visible := false;
        mniCopyID1.Visible := false;
        Subcribe1.Visible := false;
        Forceupdate1.Visible := false;
        allfilesandentry1.Enabled := false;
        cache1.Enabled := false;
        RemoveMapEntry1.Enabled := false;
        MapCycle1.Enabled := True;
        allfilesandentry1.Visible := false;
        cache1.Visible := false;
        mniRedownloadThumbnail.Visible := false;
        if ActiveLV = lvMaps then
        begin

          RemoveMapEntry1.Visible := True;
          MapCycle1.Visible := True;
        end
        else
        begin
          RemoveMapEntry1.Visible := false;
          MapCycle1.Visible := false;
        end;

      end
      else if ActiveLV.Selected.GroupID = 2 then
      begin
        // Redirect or local

        Browserworkshop1.Enabled := false;
        Browserworkshop1.Visible := false;
        mniShowitempage1.Visible := false;
        mniCopyID1.Visible := false;
        Subcribe1.Visible := false;
        Forceupdate1.Visible := false;
        allfilesandentry1.Enabled := True;
        cache1.Enabled := True;
        RemoveMapEntry1.Enabled := True;
        MapCycle1.Enabled := True;
        allfilesandentry1.Visible := True;
        cache1.Visible := True;
        mniRedownloadThumbnail.Visible := false;
        if ActiveLV = lvMaps then
        begin
          Reinstall1.Visible := True;
          Reinstall1.Enabled := True;
          RemoveMapEntry1.Visible := True;
          MapCycle1.Visible := True;
        end
        else
        begin
          Reinstall1.Visible := false;
          Reinstall1.Enabled := false;
          RemoveMapEntry1.Visible := false;
          MapCycle1.Visible := false;
        end;
      end;

      Remove1.Enabled := True;
      add1.Visible := false;
      add1.Enabled := True;

      AddbyID1.Enabled := True;

      Reinstall1.Enabled := True;

    end;

  finally
    SetLength(selectedItems, 0);
  end;
end;

procedure TFormMain.pmRemovePopup(Sender: TObject);
var
  i: Integer;
begin
  if ActiveLV = lvMaps then
  begin
    Removeall1.Caption := _s('Remove full map');
    RemoveGameSteamCache1.Caption := _s('Remove map cache');
    RemoveServerSubcribe1.Caption := _s('Remove map subcribe');
    RemoveMapEntry1.Visible := True;
    RemovefromCycle1.Visible := True;
  end
  else
  begin
    Removeall1.Caption := _s('Remove full item');
    RemoveGameSteamCache1.Caption := _s('Remove item cache');
    RemoveServerSubcribe1.Caption := _s('Remove item subcribe');
    RemoveMapEntry1.Visible := false;
    RemovefromCycle1.Visible := false;
  end;

  if ActiveLV.Selected = nil then
  begin
    for i := 0 to pmRemove.Items.Count - 1 do
      pmRemove.Items[i].Enabled := false;
  end
  else
  begin
    for i := 0 to pmRemove.Items.Count - 1 do
      pmRemove.Items[i].Enabled := True;

  end;
end;

procedure TFormMain.FormCanResize(Sender: TObject;
  var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
  try
    edtRedirectURL.Width := Panel1.Width - 15;
    if NewWidth > 950 then
    begin
      pnlgamelenght.Align := alLeft;
      pnldifficulty.Align := alLeft;
    end
    else
    begin

      pnlgamelenght.Align := alRight;
      pnldifficulty.Align := alRight;
    end;
  except

  end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
var

  serverpath: string;
  kfPathDialog: TkfPathDialog;
  pathDialogResult: Integer;
  ExeName: String;
  i: Integer;

begin
  UILoaded := false;

  tlTool := TKFTranslation.Create(ExtractFilePath(Application.ExeName));

  // ---- Configname path
  ExeName := ExtractFileName(Application.ExeName);
  configName := Copy(ExeName, 0, Length(ExeName) - 4) + '.ini';
  if ParamCount > 0 then
  begin
    for i := 0 to ParamCount do
    begin
      if LowerCase(ParamStr(i)) = '-config' then
      begin
        if ExtractFileExt(ParamStr(i + 1)) = '.ini' then
        begin
          configName := ParamStr(i + 1);
          break;
        end
        else
          ShowMessage(_s('Config is not valid'));
        break;
      end;
    end;
  end;

  // ---- Config load
  loadConfig;
  // ---Loader language source
  try
    tlTool.loadSource(LOCALIZATIONFILE);
    tlTool.setLanguage(languageInitial);

  except
    on E: Exception do
      Application.MessageBox(PWideChar(E.Message), 'Error',
        MB_OK + MB_ICONSTOP);

  end;
  // ----- Verify for dependencies
  try
    CheckDependencies;
  except
    on E: Exception do
    begin
      Application.MessageBox(PWideChar(E.Message), _p('Dependencie not found'),
        MB_OK + MB_ICONSTOP);
      Application.Terminate;
      Exit;
    end;
  end;

  // ---- Server check
  repeat
    if useCustomServerPath then
      serverpath := IncludeTrailingPathDelimiter(customServerPath)
    else
      serverpath := ExtractFilePath(Application.ExeName);

    if FileExists(serverpath + pathServerEXE) = false then
    begin
      kfPathDialog := TkfPathDialog.Create(Self);
      try
        pathDialogResult := kfPathDialog.ShowModal;
        case pathDialogResult of
          2:
            // Cancel
            begin
              Application.Terminate;
              Exit;
            end;
          101: // Path set
            begin
              useCustomServerPath := True;
              serverpath := IncludeTrailingPathDelimiter(customServerPath)
            end;
          102:
            // Install Server
            begin
              useCustomServerPath := false;
              customServerPath := '';
              serverpath := ExtractFilePath(Application.ExeName);
              InstallServer(ExtractFilePath(Application.ExeName));
            end;
        end;

      finally
        kfPathDialog.Free;
      end;
    end;
  until FileExists(serverpath + pathServerEXE);

  // ---- Files load
  serverTool := TKFServerTool.Create;
  try
    serverTool.SetKFApplicationPath(serverpath);
    serverTool.SetKFngineIniSubPath(pathKFEngineIni);
    serverTool.SetKFGameIniSubPath(pathKFGameIni);
    serverTool.SetKFServerPathEXE(pathServerEXE);
    serverTool.SetKFWebIniSubPath(pathKFWebIni);
    serverTool.SetSteamCmdPath(serverpath + pathCmdTool);
    serverTool.SetMapCycleOptions(GroupMapCycle, GroupMapCycleSeparators);
  except
    on E: Exception do
    begin
      Application.MessageBox(PWideChar(E.Message), _p('Error'),
        MB_OK + MB_ICONSTOP);
      Application.Terminate;
      Exit
    end;
  end;

  // ---- Load UI Config
  LoadUIConfig;

  // ---- Auto check for update system
  if AutoCheckForUpdates then
    checkForUpdates(Self);
end;

procedure TFormMain.LoadUIConfig;
var
  i: Integer;
var

  webPort: String;
  customRedirect: string;
  avaliableLanguages: TKFLanguages;
begin
  Self.Caption := Self.Caption + ' ' + TKFServerTool.SERVERTOOLVERSION;

  imgListIDIndex := TStringList.Create;
  // Language
  cbbLanguage.ItemIndex := 0;
  lvMaps.Groups[0].TitleImage := 0;
  lvMaps.Groups[1].TitleImage := 1;
  lvMaps.Groups[2].TitleImage := 3;
  lvMaps.Groups[3].TitleImage := 5;
  lvMods.Groups[0].TitleImage := 0;
  lvMods.Groups[1].TitleImage := 1;
  lvMods.Groups[2].TitleImage := 3;
  lvMods.Groups[3].TitleImage := 5;

  LoadOfficialMapList(serverTool.GetKFApplicationPath);
  LoadItensToLv('');

  translateUIElements;

  // ------------------------------- all component changes after language set
  jvpgcntrl1.ActivePageIndex := 0;
  // pgcMaps.ActivePageIndex := 0;
  jvpgcntrl1Change(Self);

  btnRemove.Enabled := false;
  if jvpgcntrl1.ActivePage = tsMaps then

    ActiveLV := lvMaps
  else
    ActiveLV := lvMods;
  btnReinstall.Enabled := false;
  btnUpdate.Enabled := false;
  chkOnlyFromConfigItems.Checked := onlyFromConfigItems;
  customRedirect := serverTool.GetCustomRedirect;
  // ShowMessage(configName);
{$IFDEF DEBUG}
  tsDebug.TabVisible := True;
{$ELSE}
  tsDebug.TabVisible := false;
{$ENDIF}
  if customRedirect = '' then
  begin
    cbbRedirectEnabled.ItemIndex := 0;
    edtRedirectURL.text := '';
    edtRedirectURL.Enabled := false;
  end
  else
  begin
    cbbRedirectEnabled.ItemIndex := 1;
    edtRedirectURL.text := customRedirect;
    edtRedirectURL.Enabled := True;
  end;

  lblHelpAdditionParam.Visible := false;
  // Windows size
  Self.Width := appWidth;
  Self.Height := appHeight;
  if appMaximized then
    Self.WindowState := wsMaximized;

  // Font size
  Self.Font.Size := fontSize;
  trckbrFontSize.Position := fontSize;
  // Workshop redirect installed

  if serverTool.IsWorkshopManagerInstalled then
    cbWorkshopDMStatus.ItemIndex := 1
  else
    cbWorkshopDMStatus.ItemIndex := 0;
  chkAutoConnectWeb.Checked := AutoConnectWeb;
  cbWorkshopDMStatus.Font.Size := fontSize;
  cbWorkshopDMStatus.Top := lblWkspDownMan.Top;
  cbWorkshopDMStatus.Left := lblWkspDownMan.Left + lblWkspDownMan.Width + 5;
  // Web port
  try
    webPort := IntToStr(serverTool.GetWebPort);
  except
    on E: Exception do
    begin
      webPort := 'Error';
      ShowMessage(E.Message);
    end;
  end;
  edtPort.text := webPort;
  // Web Status
  try
    if serverTool.GetWebStatus then
      cbStatusWeb.ItemIndex := 1
    else
      cbStatusWeb.ItemIndex := 0;
  except
    on E: Exception do
    begin
      cbStatusWeb.ItemIndex := -1;
      ShowMessage(E.Message);
    end;
  end;
  case LVStyle of
    LVDS_Simple:
      cbbListViewDisplayStyle.ItemIndex := 0;
    LVDS_Thumbnail:
      cbbListViewDisplayStyle.ItemIndex := 1;
    LVDS_Icon:
      cbbListViewDisplayStyle.ItemIndex := 2;
  end;
  // Web pass
  try
    edtWebPass.text := serverTool.GetWebPass;
  except
    on E: Exception do
      ShowMessage('Failed to get webPass ' + E.Message);
  end;

  chkAutoLoginAdmin.Checked := autoLoginWebAdmin;
  checkAutoWebLoginRequirements();

  if Assigned(TStyleManager.ActiveStyle) then
  begin
    for i := 0 to High(TStyleManager.StyleNames) do
      cbbTheme.Items.Add(TStyleManager.StyleNames[i]);
  end;

  // Language combobox
  avaliableLanguages := tlTool.getLanguages;
  for i := 0 to High(avaliableLanguages) do
  begin
    cbbLanguage.Items.Add(avaliableLanguages[i].name);
  end;

  if tlTool.getCurrentLanguage <> nil then
    cbbLanguage.ItemIndex := cbbLanguage.Items.IndexOf
      (tlTool.getCurrentLanguage.name);

  // Auto check for updates checkbox
  chkAutoCheckForUpdates.Checked := AutoCheckForUpdates;

  cbbTheme.ItemIndex := cbbTheme.Items.IndexOf(fdefaultStyleName);
  TStyleManager.TrySetStyle(fdefaultStyleName);
  // Map cycle group
  chkGrouMapCycle.Checked := GroupMapCycle;
  chkIncludeSepratorsMapCycle.Checked := GroupMapCycleSeparators;
  chkIncludeSepratorsMapCycle.Enabled := chkGrouMapCycle.Checked;
  // whatever was in the project settings.
  Application.HintHidePause := 15000; // 15 Sec

  // Fix webbrowser compabillity
  InstallRegBrowserKey();
  RealignUIItems(nil);
  // Generate group images title by theme colors
  GenerateGroupTitleImages(nil);
  LoadServerProfile();
  UILoaded := True;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  try
    // cb Server Length and Difficulty
    if Assigned(kfprofiles) then
    begin
      with kfprofiles[defaultProfile] do
      begin
        DefaultDifficulty := cbbDifficulty.ItemIndex;
        DefaultLength := cbbLength.ItemIndex;
        DefaultPass := edtGmPass.text;
        AdditionalParam := edtExtra.text;
        if (cbbMap.text <> KF_CYCLE_CUSTOM_SEPARATOR) and
          (cbbMap.text <> KF_CYCLE_OFFICIAL_SEPARATOR) then
          DefaultMap := cbbMap.text
        else
          DefaultMap := '';
      end;
    end;
    appWidth := Self.Width;
    appHeight := Self.Height;
    appMaximized := FormMain.WindowState = wsMaximized;
    saveconfig;
    if Assigned(serverTool) then

      FreeAndNil(serverTool);
    for i := 0 to High(kfprofiles) do
      FreeAndNil(kfprofiles[i]);
    if Assigned(imgListIDIndex) then
      FreeAndNil(imgListIDIndex);
    if Assigned(tlTool) then
      FreeAndNil(tlTool);

  except

  end;

end;

procedure TFormMain.FromList1Click(Sender: TObject);
var
  ItemName: string;
  itemID: string;
  frmReinstall: TFormAdd;
  ItemsCount, i: Integer;
  itemsDone: Integer;
  modalResult: Integer;
  bkpFile: TStringList;
  dlgOpenbkp: TOpenDialog;
  bkpFilePath: String;
  separatorPoint: Integer;
  separator: String;
  progressForm: TformPB;
begin
  bkpFilePath := '';
  separator := '\\';

  dlgOpenbkp := TOpenDialog.Create(Self);
  dlgOpenbkp.Filter := '';
  if dlgOpenbkp.Execute(Self.handle) then
    bkpFilePath := dlgOpenbkp.filename;

  if bkpFilePath = '' then
  begin
    ShowMessage(_s('No item selected'));
    Exit;
  end
  else
  begin
    itemsDone := 0;
    modalResult := mrNone;
    bkpFile := TStringList.Create();
    bkpFile.LoadFromFile(bkpFilePath);
    ItemsCount := bkpFile.Count;
    frmReinstall := TFormAdd.Create(Self);
    progressForm := TformPB.Create(Self);

    try
      progressForm.SetPBMax(bkpFile.Count);
      progressForm.btncancel.Visible := True;
      progressForm.Show;
      CheckIfTheServerIsRuning;
      for i := 0 to bkpFile.Count - 1 do
      begin
        try
          Application.ProcessMessages;
          // For more than one item
          separatorPoint := Pos(separator, bkpFile[i]);
          itemID := Copy(bkpFile[i], 0, separatorPoint - 1);
          ItemName := Copy(bkpFile[i], separatorPoint + 2,
            Length(bkpFile[i]) - separatorPoint - 2);
          if ActiveLV = lvMaps then
          begin
            if (ItemName <> '') and (itemID <> '') then
            begin
              frmReinstall.SetAddType(TKFItemType.ReinstallWorkshopMap);
            end;
            frmReinstall.edtID.text := itemID;
            frmReinstall.ItemName := ItemName;
            frmReinstall.edtID.Enabled := false;
            frmReinstall.Caption := _s('Reinstall ') + ItemName;
            if bkpFile.Count > 1 then
            begin
              frmReinstall.chkDoForAll.Visible := True;

              frmReinstall.chkDoForAll.Caption :=
                _s('Do the same for the next ') +
                IntToStr(ItemsCount - 1 - itemsDone) + _s(' items');

              if modalResult <> mrAll then
              begin
                modalResult := frmReinstall.ShowModal;
                if modalResult = mrCancel then
                  Exit;

              end;
              Application.ProcessMessages;
              if (modalResult = mrOk) or (modalResult = mrAll) then
              begin
                if progressForm.cancel then
                  break;
                progressForm.NextPBValue(IntToStr(i + 1) + '/' +
                  IntToStr(bkpFile.Count) + _s(' Installing item ') + itemID);
                if serverTool.InstallWorkshopItem(frmReinstall.edtID.text,
                  frmReinstall.ItemName, frmReinstall.addWkspRedirect,
                  frmReinstall.downloadNow, frmReinstall.downloadNow { dlImg } ,
                  frmReinstall.addMapCycle, frmReinstall.addMapENtry) = false
                then
                begin
                  Application.MessageBox
                    (PWideChar(_s('One o more steps for item ') +
                    frmReinstall.edtID.text + _s(' fialed!')), '',
                    MB_OK + MB_ICONEXCLAMATION);

                end;
              end
              else
              begin
                break;
              end;

              itemsDone := itemsDone + 1;
            end
            else
            begin
              Application.ProcessMessages;
              // Just one item
              modalResult := frmReinstall.ShowModal;
              if (modalResult = mrOk) then
              begin
                progressForm.NextPBValue(_s('Installing item ') + itemID);
                if serverTool.InstallWorkshopItem(frmReinstall.edtID.text,
                  frmReinstall.ItemName, frmReinstall.addWkspRedirect,
                  frmReinstall.downloadNow, frmReinstall.downloadNow { dlImg } ,
                  frmReinstall.addMapCycle, frmReinstall.addMapENtry) = false
                then
                begin
                  Application.MessageBox
                    (PWideChar(_s('One o more steps for item ') +
                    frmReinstall.edtID.text + _s(' failed!')), '',
                    MB_OK + MB_ICONEXCLAMATION);

                end;

              end
              else
              begin
                LoadItensToLv('');
                Exit;
              end;
              Application.ProcessMessages;
            end;
          end;

        except
          on E: Exception do
            ShowMessage(E.Message);
        end;

      end;
      LoadItensToLv('');
      Application.MessageBox(_p('Finished!'), '', MB_OK + MB_ICONINFORMATION)
    finally
      FreeAndNil(progressForm);
      FreeAndNil(frmReinstall);
      FreeAndNil(bkpFile);
    end;

  end;

end;

procedure TFormMain.FromRedirect1Click(Sender: TObject);
var
  frmAdd: TFormAdd;
  mdResult: Integer;
  redirectURL: String;
  DownURL: string;
  filename: String;
  dlManager: TDownloadManager;
  i: Integer;
  itemsList: TStringList;
  redirectItemType: TKFRedirectItemType;
begin
  frmAdd := TFormAdd.Create(Self);

  try
    try
      if ActiveLV = lvMaps then
      begin
        frmAdd.SetAddType(TKFItemType.RedirectMap);
        redirectItemType := KFRmap;
      end
      else
      begin
        frmAdd.SetAddType(TKFItemType.RedirectMod);
        redirectItemType := KFRmod;
      end;
      redirectURL := serverTool.GetCustomRedirect();
      if redirectURL <> '' then
        frmAdd.edtRedirectURL.text := redirectURL
      else
        ShowMessage
          (_s('Warning: The redirect URL is not set. Go to the options tab to set it up.')
          );

      mdResult := frmAdd.ShowModal;
      if (mdResult = mrOk) and (Trim(frmAdd.edtItemName.text) <> '') then
      begin
        itemsList := TStringList.Create;
        try
          if Assigned(frmProgress) then
            FreeAndNil(frmProgress);
          frmProgress := TformPB.Create(Self);
          if Pos(',', frmAdd.edtItemName.text) > 0 then
            ExtractStrings([','], [], Pchar(frmAdd.edtItemName.text), itemsList)
          else
            itemsList.Add(Trim(frmAdd.edtItemName.text));

          for i := 0 to itemsList.Count - 1 do
          begin

            redirectURL := frmAdd.edtRedirectURL.text;
            filename := itemsList.Strings[i];
            if redirectURL[Length(redirectURL)] <> '/' then
              redirectURL := Trim(redirectURL) + '/';
            DownURL := redirectURL + filename;

            dlManager := TDownloadManager.Create;
            try
              dlManager.OnProgress := RedirectDownloadProgress;
              dlManager.OnStarted := RedirectDownloadStarted;
              dlManager.OnFinished := RedirectDownloadFinished;
              dlManager.FileDAbort := @frmProgress.cancel;
              frmProgress.btncancel.Visible := True;
              frmProgress.lblTitle.Caption := '[' + IntToStr(i + 1) + '/' +
                IntToStr(itemsList.Count) + '] ' + filename;
              frmProgress.Show;
              CheckIfTheServerIsRuning;
              if True then

                serverTool.NewRedirectItem(DownURL, filename, (DownURL <> ''),
                  (frmAdd.addMapCycle) and (redirectItemType = KFRmap),
                  (frmAdd.addMapENtry) and (redirectItemType = KFRmap),
                  dlManager, redirectItemType);
            finally
              FreeAndNil(dlManager);
            end;
          end;

        finally
          FreeAndNil(frmProgress);
          LoadItensToLv('');
        end;
      end;
    finally
      FreeAndNil(frmAdd);
      FreeAndNil(itemsList);
    end;

  except
    on E: Exception do
      ShowMessage(_s('Failed to add item: ' + E.Message));
  end;

end;

procedure TFormMain.RedirectDownloadProgress(currentPosition: Int64);
begin
  if Assigned(frmProgress) then
  begin
    with frmProgress do
    begin
      if currentPosition < pb1.Max then
        pb1.Position := currentPosition;

      frmProgress.lblStatus.Caption := _s('Downloading ') +
        FormatFloat('0%', ((currentPosition * 100) / frmProgress.pb1.Max)) +
        ' - ' + FormatByteSize(currentPosition);
    end;
    Application.ProcessMessages;

  end;
end;

procedure TFormMain.RedirectDownloadStarted(fileSize: Int64);
begin
  if Assigned(frmProgress) then
  begin
    frmProgress.pb1.Max := fileSize;

  end;
  Application.ProcessMessages;
end;

procedure TFormMain.RedirectDownloadFinished();
begin
  if Assigned(frmProgress) then
  begin
    frmProgress.pb1.Position := 0;
  end;
  Application.ProcessMessages;
end;

procedure TFormMain.LoadServerProfile();
var
  i: Integer;
begin
  if cbbMap.Items.Count > 0 then
    cbbMap.ItemIndex := 0;
  // cb Profile
  cbbProfile.Clear;
  for i := 0 to High(kfprofiles) do
    cbbProfile.Items.Add(kfprofiles[i].ProfileName);

  // cb Server Length and Difficulty
  cbbProfile.ItemIndex := defaultProfile;
  with kfprofiles[defaultProfile] do
  begin
    cbbDifficulty.ItemIndex := DefaultDifficulty;
    cbbLength.ItemIndex := DefaultLength;
    edtGmPass.text := DefaultPass;
    edtExtra.text := AdditionalParam;
    if (cbbMap.Items.IndexOf(DefaultMap) > 0) and
      (DefaultMap <> KF_CYCLE_CUSTOM_SEPARATOR) and
      (DefaultMap <> KF_CYCLE_OFFICIAL_SEPARATOR) then
      cbbMap.ItemIndex := cbbMap.Items.IndexOf(DefaultMap)
    else
      cbbMap.ItemIndex := -1;
    cbbGameMode.ItemIndex := DefaultGameMode;
  end;
  if High(kfprofiles) < 1 then
    btnDeleteProfile.Enabled := false
  else
    btnDeleteProfile.Enabled := True;

end;

procedure TFormMain.jvpgcntrl1Change(Sender: TObject);
begin
  if jvpgcntrl1.ActivePage = tsMaps then
  begin
    ActiveLV := lvMaps;
    btnRemove.Visible := True;
    btnAddNew.Visible := True;
    btnReinstall.Visible := True;
    btnUpdate.Visible := True;
    lvClick(Sender);
  end;
  if jvpgcntrl1.ActivePage = tsMods then
  begin
    ActiveLV := lvMods;
    btnRemove.Visible := True;
    btnAddNew.Visible := True;
    btnReinstall.Visible := True;
    btnUpdate.Visible := True;
    lvClick(Sender);
  end;
  if jvpgcntrl1.ActivePage = tsUnknowed then
  begin
    ActiveLV := lvUnknowed;
    btnRemove.Visible := True;
    btnAddNew.Visible := false;
    btnReinstall.Visible := True;
    btnUpdate.Visible := True;
    lvClick(Sender);
  end;
  if (jvpgcntrl1.ActivePage = tsServer) or (jvpgcntrl1.ActivePage = tsExtra)
  then
  begin
    ActiveLV := nil;
    btnRemove.Visible := false;
    btnAddNew.Visible := false;
    btnReinstall.Visible := false;
    btnUpdate.Visible := false;
  end;

  if jvpgcntrl1.ActivePage = tswebadmin then
  begin
    ActiveLV := nil;
    btnRemove.Visible := false;
    btnAddNew.Visible := false;
    btnReinstall.Visible := false;
    btnUpdate.Visible := false;
    if ProcessExists(ExtractFileName(pathServerEXE)) then
    begin

      wb1.Navigate('http://127.0.0.1:' + edtPort.text);
    end
    else
    begin

      Application.MessageBox(_p('Web server is not running'), _p('Server'),
        MB_OK + MB_ICONINFORMATION)
    end;
  end;

end;

function TFormMain.getSelectedCount(ListView: TListView): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to ActiveLV.Items.Count - 1 do
    if ActiveLV.Items[i].Selected then
      Result := Result + 1;
end;

procedure TFormMain.Removeall1Click(Sender: TObject);
var
  ItemName: string;
  itemID: string;
  lgText: string;
  i: Integer;
  slCount: Integer;
  itemSource: TKFSource;
  slItems: TLvSelectedItems;
  progressForm: TformPB;
begin
  slCount := getSelectedCount(ActiveLV);
  slItems := GetLVSelectedItems(ActiveLV);
  if ActiveLV.Selected = nil then
  begin
    ShowMessage(_s('Select na item first.'));
    Exit;
  end
  else
  begin
    try
      if slCount = 1 then
        lgText := _s('Are you sure you want to full delete the item?')
      else
        lgText := _s('Are you sure you want to full delete the ') +
          IntToStr(slCount) + _s(' selected items?');

      if messagedlg(lgText, mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
      begin

        progressForm := TformPB.Create(Self);
        progressForm.Show;
        progressForm.SetPBMax(slCount);
        try
          CheckIfTheServerIsRuning;
          for i := 0 to High(slItems) do
          begin

            ItemName := slItems[i].Caption;
            itemID := slItems[i].SubItems[0];
            itemSource := TKFSource(slItems[i].GroupID);
            if ActiveLV = lvMaps then
            begin
              progressForm.NextPBValue(IntToStr(i + 1) + '/' + IntToStr(slCount)
                + _s(' Removing map ') + ItemName + ' ' + itemID);
              serverTool.RemoveItem(ItemName, itemID, (ItemName <> ''),
                (ItemName <> ''), (itemID <> ''), (ItemName <> ''),
                itemSource, KFMap);

            end
            else
            begin
              if ActiveLV = lvMods then
              begin
                progressForm.NextPBValue(IntToStr(i + 1) + '/' +
                  IntToStr(slCount) + _s(' Removing mod ') + ItemName + ' '
                  + itemID);
                serverTool.RemoveItem(ItemName, itemID, false, false,
                  itemSource = KFSteamWorkshop, True, itemSource, KFMod);

              end
              else
              begin
                progressForm.NextPBValue(IntToStr(i + 1) + '/' +
                  IntToStr(slCount) + _s(' Removing item ') + ItemName + ' '
                  + itemID);
                if ActiveLV = lvUnknowed then
                  serverTool.RemoveItem(ItemName, itemID, True, True, True,
                    True, itemSource, KFUnknowed);
              end;
            end;
            progressForm.Close;
          end;
        finally
          progressForm.Free;
        end;
      end;

      LoadItensToLv('');

    except
      on E: Exception do
        ShowMessage(E.Message);
    end;

  end;
end;

procedure TFormMain.RemovefromCycle1Click(Sender: TObject);
var
  ItemName: string;
  itemID: string;
  lgText: string;
  slCount, i: Integer;
  slItems: TLvSelectedItems;
  itemSource: TKFSource;
  progressForm: TformPB;
begin
  slCount := getSelectedCount(ActiveLV);
  slItems := GetLVSelectedItems(ActiveLV);
  if ActiveLV.Selected = nil then
  begin
    ShowMessage(_s('Select na item first.'));
    Exit;
  end
  else
  begin
    try

      if slCount = 1 then
        lgText := _s('Remove ') + ActiveLV.Selected.Caption +
          _s(' from map cycle?')
      else
        lgText := _s('Remove the ') + IntToStr(slCount) +
          _s(' selected maps from map cycle?');

      if messagedlg(lgText, mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
      begin
        progressForm := TformPB.Create(Self);
        progressForm.SetPBMax(slCount);
        progressForm.Show;

        try
          CheckIfTheServerIsRuning;
          for i := 0 to High(slItems) do
          begin

            ItemName := slItems[i].Caption;
            itemID := slItems[i].SubItems[0];
            itemSource := TKFSource(slItems[i].GroupID);
            progressForm.NextPBValue(_s('Removing map ') + ItemName +
              _s(' from map cycle'));
            serverTool.RemoveItem(ItemName, itemID, false, True, false, false,
              itemSource, KFMap);
            progressForm.Close;
          end;
        finally
          progressForm.Free;
        end;

      end;
      LoadItensToLv('');
    except

    end;

  end;
end;

procedure TFormMain.RemoveGameSteamCache1Click(Sender: TObject);
var
  ItemName: string;
  itemID: string;
  lgText: string;
  slCount, i: Integer;
  itemSource: TKFSource;
  slItems: TLvSelectedItems;
  progressForm: TformPB;
begin
  slCount := getSelectedCount(ActiveLV);
  slItems := GetLVSelectedItems(ActiveLV);
  if ActiveLV.Selected = nil then
  begin
    ShowMessage(_s('Select na item first.'));
    Exit;
  end
  else
  begin

    if slCount = 1 then
      lgText := _s('Delete cache for ') + ActiveLV.Selected.Caption + '?'
    else
      lgText := _s('Delete cache for the ') + IntToStr(slCount) +
        _s(' selected itens?');

    try

      if messagedlg(lgText, mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
      begin
        progressForm := TformPB.Create(Self);
        progressForm.Show;
        progressForm.SetPBMax(slCount);
        try
          CheckIfTheServerIsRuning;
          for i := 0 to High(slItems) do
          begin

            ItemName := slItems[i].Caption;
            itemID := slItems[i].SubItems[0];
            itemSource := TKFSource(slItems[i].GroupID);
            progressForm.NextPBValue(_s('Removing cache for item ') + ItemName +
              ' ' + itemID);
            if ActiveLV = lvMods then
            begin
              serverTool.RemoveItem(ItemName, itemID, false, false, false, True,
                itemSource, KFMod);
            end;
            if ActiveLV = lvMaps then
            begin
              serverTool.RemoveItem(ItemName, itemID, false, false, false, True,
                itemSource, KFMap);
            end;

            if ActiveLV = lvUnknowed then
            begin
              serverTool.RemoveItem(ItemName, itemID, false, false, false, True,
                itemSource, KFUnknowed);
            end;
          end;
          progressForm.Close;
        finally
          progressForm.Free;
        end;
      end;
      LoadItensToLv('');
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;

  end;
end;

procedure TFormMain.RemoveMapEntry1Click(Sender: TObject);
var
  ItemName: string;
  itemID: string;
  lgText: string;
  slCount, i: Integer;
  slItems: TLvSelectedItems;
  itemSource: TKFSource;
  progressForm: TformPB;
begin
  slCount := getSelectedCount(ActiveLV);
  slItems := GetLVSelectedItems(ActiveLV);
  if ActiveLV.Selected = nil then
  begin
    ShowMessage(_s('Select na item first.'));
    Exit;
  end
  else
  begin
    try
      if slCount = 1 then
        lgText := _s('Remove the map entry of ') +
          ActiveLV.Selected.Caption + '?'
      else
        lgText := _s('Remove the map entrys from the ') + IntToStr(slCount) +
          _s(' selected maps?');

      if messagedlg(lgText, mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
      begin
        progressForm := TformPB.Create(Self);
        progressForm.SetPBMax(slCount);
        progressForm.Show;
        try
          CheckIfTheServerIsRuning;
          for i := 0 to High(slItems) do
          begin
            ItemName := slItems[i].Caption;
            itemID := slItems[i].SubItems[0];
            itemSource := TKFSource(slItems[i].GroupID);
            progressForm.NextPBValue(_s('Removing map entry of ') + ItemName +
              ' ' + itemID);
            serverTool.RemoveItem(ItemName, itemID, True, false, false, false,
              itemSource, KFMap);
            progressForm.Close;
          end;
        finally
          progressForm.Free;
        end;

      end;
      LoadItensToLv('');
    except

    end;

  end;
end;

procedure TFormMain.RemoveServerSubcribe1Click(Sender: TObject);
var
  ItemName: string;
  itemID: string;
  lgText: string;
  slCount, i: Integer;
  itemSource: TKFSource;
  slItems: TLvSelectedItems;
  progressForm: TformPB;
begin
  slCount := getSelectedCount(ActiveLV);
  slItems := GetLVSelectedItems(ActiveLV);
  if ActiveLV.Selected = nil then
  begin
    ShowMessage(_s('Select na item first.'));
    Exit;
  end
  else
  begin
    try
      if slCount = 1 then
        lgText := _s('Remove workshop server subcribe for ') +
          ActiveLV.Selected.Caption + ' ?'
      else
        lgText := _s('Remove the ') + IntToStr(slCount) +
          _s(' selected items from workshop server subscribe?');
      if messagedlg(lgText, mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
      begin
        progressForm := TformPB.Create(Self);
        progressForm.Show;
        progressForm.SetPBMax(slCount);
        try
          CheckIfTheServerIsRuning;
          for i := 0 to High(slItems) do
          begin
            progressForm.NextPBValue('Removing subscription for item '
              + itemID);
            ItemName := slItems[i].Caption;
            itemID := slItems[i].SubItems[0];
            itemSource := TKFSource(slItems[i].GroupID);
            serverTool.RemoveItem(ItemName, itemID, false, false, True, false,
              itemSource, KFUnknowed);

          end;
          progressForm.Close;
        finally
          progressForm.Free;
        end;

      end;
      LoadItensToLv('');
    except

    end;

  end;
end;

procedure TFormMain.checkForUpdates(Sender: TObject);
var
  gitUpdate: TGitAutoUpdate;
  latestRelease: TLatestRelease;
  currentVCode, latestVCode: Integer;
  dlManager: TDownloadManager;
begin
  gitUpdate := TGitAutoUpdate.Create(ExtractFilePath(Application.ExeName));
  try
    try
      latestRelease := gitUpdate.GetLatestRelease('darkdks/KF2ServerTool');
    except
      on E: Exception do
      begin
        ShowMessage(_s('Failed to check for updates') + #13 + E.Message);
        Exit
      end;
    end;
    try
      try
        latestVCode := StrToInt(cleanInt(latestRelease.version));
      except
        latestVCode := 0;
      end;
      try
        currentVCode := StrToInt(cleanInt(serverTool.SERVERTOOLVERSION));
      except
        currentVCode := 0;
      end;
      if latestVCode > currentVCode then
      begin

        if Application.MessageBox(PWideChar(_p('A new version is avaliable.') +
          #13#13 + _p('Your current version is: ') +
          serverTool.SERVERTOOLVERSION + #13 + _p('The newer version is: ') +
          latestRelease.version + #13 + #13 + _p('Change log: ') + #13 +
          latestRelease.change_log + #13 + #13 +
          _p('Do you wanna update it now?')), _p('Update aviable'),
          MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin
          { ShellExecute(0, 'open', Pchar(latestRelease.download_url), nil, nil,
            SW_SHOWNORMAL)
          }
          dlManager := TDownloadManager.Create;
          if Assigned(frmProgress) then
            frmProgress.Free;
          frmProgress := TformPB.Create(Self);
          dlManager := TDownloadManager.Create;
          dlManager.OnStarted := RedirectDownloadStarted;
          dlManager.OnFinished := RedirectDownloadFinished;
          dlManager.FileDAbort := @frmProgress.cancel;
          frmProgress.btncancel.Visible := True;
          frmProgress.lblStatus.Caption :=
            _s('Downloading the update, please wait...');
          frmProgress.Show;
          try
            if gitUpdate.DownloadAndExtractUpdate(latestRelease.download_url,
              dlManager, 'KF2ServerTool.exe', True) then
            begin
              ShowMessage
                (_s('The application will restart to complete the update'));
              KillProcessByName(gitUpdate.TEMUPDATEFILE);
              gitUpdate.executeUpdateInstall(gitUpdate.TEMUPDATEFILE,
                UPDATEPARAM + ' "' + Application.ExeName + '"');
              Application.Terminate;
            end
            else
              ShowMessage(_s('Error to update'));
          finally
            FreeAndNil(dlManager);
            FreeAndNil(frmProgress);
          end;

        end;

      end
      else
      begin
        if Assigned(Sender) then
          if (Sender is TLabel) then
            ShowMessage(_s('The current version is updated.'));

      end;

    except
      on E: Exception do
        ShowMessage(_s('Failed to download update') + #13 + E.Message);
    end;

  finally
    FreeAndNil(gitUpdate);
    FreeAndNil(latestRelease);
  end;
end;

procedure TFormMain.lblDonateClick(Sender: TObject);
var
  frmDnt: TfrmDonate;
begin
  frmDnt := TfrmDonate.Create(Self);
  try
    frmDnt.Position := poMainFormCenter;
    frmDnt.ShowModal;
  finally
    frmDnt.Free;
  end;

end;

procedure TFormMain.lblsasdadClick(Sender: TObject);
begin

  if serverTool.IsWorkshopManagerInstalled then
  begin
    // servertool.RemoveWorkshopManager
  end
  else
  begin
    serverTool.InstallWorkshopManager;
  end;

end;

function TFormMain.loadConfig: Boolean;
var
  IniConfig: TIniFile;
  regCount, i: Integer;
  section: String;
begin
  SetLength(kfprofiles, 0);
  Result := false;
  try

    IniConfig := TIniFile.Create(ExtractFilePath(Application.ExeName) +
      configName);
    try
      with IniConfig do
      begin
        // GAME
        useCustomServerPath := ReadBool('PATHS', 'UseCustomServerPath', false);
        customServerPath := ReadString('PATHS', 'CustomServerPath',
          'CHANGE_ME_FOR_CUSTOM_PATH');
        pathKFWebIni := ReadString('PATHS', 'KFWebIni',
          'KFGame\Config\KFWeb.ini');
        pathKFGameIni := ReadString('PATHS', 'KFGameIni',
          'KFGame\Config\PCServer-KFGame.ini');
        pathKFEngineIni := ReadString('PATHS', 'KFEngineIni',
          'KFGame\Config\PCServer-KFEngine.ini');
        pathCmdTool := ReadString('PATHS', 'SteamCmdTool',
          'STEAMCMD\SteamCmd.exe');
        pathServerEXE := ReadString('PATHS', 'ServerEXE',
          'Binaries\win64\kfserver.exe');
        regCount := ReadInteger('GERAL', 'ProfileCount', 1);
        defaultProfile := ReadInteger('GERAL', 'DefaultProfileID', 0);

        for i := 0 to regCount - 1 do
        begin
          SetLength(kfprofiles, Length(kfprofiles) + 1);
          kfprofiles[High(kfprofiles)] := TKFServerProfile.Create;
          with kfprofiles[High(kfprofiles)] do
          begin
            section := 'SERVERPROFILE' + IntToStr(i);
            DefaultDifficulty := ReadInteger(section, 'DefaultDifficulty', 2);
            DefaultLength := ReadInteger(section, 'DefaultLength', 2);
            DefaultPass := ReadString(section, 'DefaultPass', '');
            AdditionalParam := ReadString(section, 'AdditionalParam', '');
            DefaultMap := ReadString(section, 'DefaultMap', '');
            DefaultGameMode := ReadInteger(section, 'DefaultGameMode', 0);
            ProfileName := ReadString(section, 'ProfileName', 'Default');
            AutoConnectWeb := ReadBool(section, 'AutoConnectWeb', false);
            GroupMapCycle := ReadBool(section, 'GroupMapCycle', True);
            GroupMapCycleSeparators :=
              ReadBool(section, 'GroupMapCycleSeparators', false);
          end;
        end;

        // App
        onlyFromConfigItems := ReadBool('GENERAL',
          'OnlyShowItemsFromConfig', false);
        languageInitial := (ReadString('GENERAL', 'Language', 'EN'));

        fdefaultStyleName := ReadString('GENERAL', 'Theme', 'Windows');
        autoLoginWebAdmin := ReadBool('GENERAL', 'AutoWebAdminLogin', True);
        appHeight := ReadInteger('GENERAL', 'WindowHeight', Self.Height);
        appWidth := ReadInteger('GENERAL', 'WindowWidth', Self.Width);
        fontSize := ReadInteger('GENERAL', 'FontSize', 10);
        LVStyle := TListViewDisplayStyle(ReadInteger('GENERAL',
          'ListViewMode', 0));

        appMaximized := ReadBool('GENERAL', 'Maximized', false);
        AutoCheckForUpdates := ReadBool('GENERAL',
          'AutoCheckForUpdates', false);
        if FileExists(ExtractFilePath(Application.ExeName) + MEMONAME) then
          mmoNotepad.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) +
            MEMONAME);
      end;
    finally
      IniConfig.Free;
    end;
  except
    ShowMessage('Failed to load config file');

  end;
end;

function TFormMain.saveconfig: Boolean;
var
  IniConfig: TIniFile;
  i: Integer;
  section: String;
begin
  Result := false;

  try

    IniConfig := TIniFile.Create(ExtractFilePath(Application.ExeName) +
      configName);
    try
      with IniConfig do
      begin
        WriteBool('PATHS', 'UseCustomServerPath', useCustomServerPath);
        WriteString('PATHS', 'CustomServerPath', customServerPath);
        WriteString('PATHS', 'KFWebIni', pathKFWebIni);
        WriteString('PATHS', 'KFGameIni', pathKFGameIni);
        WriteString('PATHS', 'KFEngineIni', pathKFEngineIni);
        WriteString('PATHS', 'SteamCmdTool', pathCmdTool);
        WriteString('PATHS', 'ServerEXE', pathServerEXE);
        WriteInteger('GERAL', 'ProfileCount', Length(kfprofiles));
        WriteInteger('GERAL', 'DefaultProfileID', defaultProfile);

        for i := 0 to High(kfprofiles) do
        begin
          with kfprofiles[i] do
          begin
            section := 'SERVERPROFILE' + IntToStr(i);
            WriteInteger(section, 'DefaultDifficulty', DefaultDifficulty);
            WriteInteger(section, 'DefaultLength', DefaultLength);
            WriteInteger(section, 'DefaultGameMode', DefaultGameMode);
            WriteString(section, 'DefaultPass', DefaultPass);
            WriteString(section, 'AdditionalParam', AdditionalParam);
            WriteString(section, 'DefaultMap', DefaultMap);
            WriteString(section, 'ProfileName', ProfileName);
            WriteBool(section, 'AutoConnectWeb', AutoConnectWeb);
            WriteBool(section, 'GroupMapCycle', GroupMapCycle);
            WriteBool(section, 'GroupMapCycleSeparators',
              GroupMapCycleSeparators);
          end;
          WriteBool('GENERAL', 'OnlyShowItemsFromConfig', onlyFromConfigItems);
          WriteString('GENERAL', 'Language', languageInitial);
          WriteString('GENERAL', 'Theme', fdefaultStyleName);
          WriteBool('GENERAL', 'AutoWebAdminLogin', autoLoginWebAdmin);
          WriteInteger('GENERAL', 'WindowHeight', appHeight);
          WriteInteger('GENERAL', 'WindowWidth', appWidth);
          WriteInteger('GENERAL', 'FontSize', fontSize);

          case LVStyle of
            LVDS_Simple:
              WriteInteger('GENERAL', 'ListViewMode', 0);
            LVDS_Thumbnail:
              WriteInteger('GENERAL', 'ListViewMode', 1);
            LVDS_Icon:
              WriteInteger('GENERAL', 'ListViewMode', 2);
          end;

          WriteBool('GENERAL', 'Maximized', appMaximized);
          WriteBool('GENERAL', 'AutoCheckForUpdates', AutoCheckForUpdates);
        end;
      end;
      if mmoNotepad.text <> '' then
      begin
        mmoNotepad.Lines.SaveToFile(ExtractFilePath(Application.ExeName) +
          MEMONAME);
      end
      else
      begin
        if FileExists(ExtractFilePath(Application.ExeName) + MEMONAME) then
          DeleteFile(ExtractFilePath(Application.ExeName) + MEMONAME)
      end;

      Result := True;
    finally
      IniConfig.Free;
    end;
  except
    ShowMessage(_s('Failed to save config. Admin rights?'));
  end;

end;

procedure TFormMain.tmrWebAdminTimer(Sender: TObject);
var
  tcpResponse: TIdTCPClient;
begin
  tcpResponse := TIdTCPClient.Create(Self);
  try
    try
      tcpResponse.Host := '127.0.0.1';
      tcpResponse.Port := StrToInt(edtPort.text);
      tcpResponse.ConnectTimeout := 200;
      tcpResponse.Connect;
      if tcpResponse.Connected then
      begin

        wb1.Navigate('http://127.0.0.1:' + edtPort.text);
        jvpgcntrl1.ActivePage := tswebadmin;
        tmrWebAdmin.Enabled := false;
        // autoLoginWb;
      end;

    finally
      tcpResponse.Free;
    end;
  except

  end;
end;

procedure TFormMain.autoLoginWb;
var
  Doc: IHTMLDocument2;
  i: Integer;
  Element: OleVariant;
  Elements: IHTMLElementCollection;
  form: IHTMLFormElement;
begin
  try
    Doc := wb1.Document as IHTMLDocument2;
    Elements := Doc.All;
    for i := 0 to Elements.Length - 1 do
    begin
      Element := Elements.Item(i, varEmpty);
      if (UpperCase(Element.tagName) = 'INPUT') and
        (UpperCase(Element.Type) = 'TEXT') then
      begin
        if (Element.name = 'username') then
          Element.value := 'admin';
      end;
      if (UpperCase(Element.tagName) = 'INPUT') and
        (UpperCase(Element.Type) = 'PASSWORD') then
      begin
        if (Element.name = 'password') then
          Element.value := serverTool.GetWebPass;
      end;

      form := (Doc.Forms.Item('loginform', 0) as IHTMLFormElement);
      if Assigned(form) then
        form.submit;
    end;
  except
    // silent discart
  end;
end;

procedure TFormMain.translateUIElements();
begin
  btnRemove.Caption := _s(btnRemove.Caption);
  btnAddNew.Caption := _s(btnAddNew.Caption);
  btnReinstall.Caption := _s(btnReinstall.Caption);
  btnUpdate.Caption := _s(btnUpdate.Caption);
  lblDonate.Caption := _s(lblDonate.Caption);
  with lvMaps do
  begin
    Columns.Items[0].Caption := _s(Columns.Items[0].Caption);
    Columns.Items[2].Caption := _s(Columns.Items[2].Caption);
    Columns.Items[3].Caption := _s(Columns.Items[3].Caption);
    Columns.Items[4].Caption := _s(Columns.Items[4].Caption);
    Columns.Items[5].Caption := _s(Columns.Items[5].Caption);
  end;
  with lvMods do
  begin
    Columns.Items[0].Caption := _s(Columns.Items[0].Caption);
    Columns.Items[2].Caption := _s(Columns.Items[2].Caption);
    Columns.Items[3].Caption := _s(Columns.Items[3].Caption);
  end;
  AddWorkshopMap.Caption := _s(AddWorkshopMap.Caption);
  AddWorkshopIDorURL.Caption := _s(AddWorkshopIDorURL.Caption);
  tsMaps.Caption := _s(tsMaps.Caption);
  lblMap.Caption := _s(lblMap.Caption);
  lblDifficulty.Caption := _s(lblDifficulty.Caption);
  lblGameLength.Caption := _s(lblGameLength.Caption);
  lblGamePass.Caption := _s(lblGamePass.Caption);
  btnStartServer.Caption := _s(btnStartServer.Caption);
  grpEnableDisable.Caption := _s(grpEnableDisable.Caption);
  grpStartServer.Caption := _s(grpStartServer.Caption);
  cbbDifficulty.Items[1] := _s(cbbDifficulty.Items[1]);
  cbbDifficulty.Items[2] := _s(cbbDifficulty.Items[2]);
  cbbDifficulty.Items[3] := _s(cbbDifficulty.Items[3]);
  cbbLength.Items[0] := _s(cbbLength.Items[0]);
  cbbLength.Items[1] := _s(cbbLength.Items[1]);
  cbbLength.Items[2] := _s(cbbLength.Items[2]);
  add1.Caption := _s(add1.Caption);
  Remove1.Caption := _s(Remove1.Caption);
  lblMapCycleOptions.Caption := _s(lblMapCycleOptions.Caption);
  Forceupdate1.Caption := _s(Forceupdate1.Caption);
  Reinstall1.Caption := _s(Reinstall1.Caption);
  Browserworkshop1.Caption := _s(Browserworkshop1.Caption);
  AddbyID1.Caption := _s(AddbyID1.Caption);
  allfilesandentry1.Caption := _s(allfilesandentry1.Caption);
  Mapentry1.Caption := _s(Mapentry1.Caption);
  MapCycle1.Caption := _s(MapCycle1.Caption);
  Subcribe1.Caption := _s(Subcribe1.Caption);
  mniShowitempage1.Caption := _s(mniShowitempage1.Caption);
  mniCopyID1.Caption := _s(mniCopyID1.Caption);
  lblAddParam.Caption := _s(lblAddParam.Caption);
  lblSearch.Caption := _s(lblSearch.Caption);
  btnNewProfile.Caption := _s(btnNewProfile.Caption);
  btnRenameProfile.Caption := _s(btnRenameProfile.Caption);
  btnDeleteProfile.Caption := _s(btnDeleteProfile.Caption);
  lblProfile.Caption := _s(lblProfile.Caption);
  chkAutoConnectWeb.Caption := _s(chkAutoConnectWeb.Caption);
  Multipleitems1.Caption := _s(Multipleitems1.Caption);
  lblDescWebPort.Caption := _s(lblDescWebPort.Caption);
  cbWorkshopDMStatus.Items[0] := _s(cbWorkshopDMStatus.Items[0]);
  cbWorkshopDMStatus.Items[1] := _s(cbWorkshopDMStatus.Items[1]);
  cbStatusWeb.Items[0] := _s(cbStatusWeb.Items[0]);
  cbStatusWeb.Items[1] := _s(cbStatusWeb.Items[1]);
  cbbRedirectEnabled.Items[0] := _s(cbbRedirectEnabled.Items[0]);
  cbbRedirectEnabled.Items[1] := _s(cbbRedirectEnabled.Items[1]);
  tsExtra.Caption := _s(tsExtra.Caption);
  btnCheckForUpdate.Caption := _s(btnCheckForUpdate.Caption);
  btnCleanDownloadCache.Caption := _s(btnCleanDownloadCache.Caption);
  btnCleanWorkshopData.Caption := _s(btnCleanWorkshopData.Caption);
  btnSvIntegrityCurrent.Caption := _s(btnSvIntegrityCurrent.Caption);
  btnSvIntegrityBeta.Caption := _s(btnSvIntegrityBeta.Caption);
  btnCheckForPreview.Caption := _s(btnCheckForPreview.Caption);
  grpmaintenance.Caption := _s(grpmaintenance.Caption);
  grpapplication.Caption := _s(grpapplication.Caption);
  lblFontSize.Caption := _s(lblFontSize.Caption);
  lblGameMode.Caption := _s(lblGameMode.Caption);
  FromRedirect1.Caption := _s(FromRedirect1.Caption);
  FromList1.Caption := _s(FromList1.Caption);
  tsNotes.Caption := _s(tsNotes.Caption);
  Export1.Caption := _s(Export1.Caption);
  RemoveMapEntry1.Caption := _s(RemoveMapEntry1.Caption);
  lblTheme.Caption := _s(lblTheme.Caption);
  Explorerlocalfolder1.Caption := _s(Explorerlocalfolder1.Caption);
  lblLanguage.Caption := _s(lblLanguage.Caption);
  chkAutoLoginAdmin.Caption := _s(chkAutoLoginAdmin.Caption);
  chkOnlyFromConfigItems.Caption := _s(chkOnlyFromConfigItems.Caption);
  chkAutoCheckForUpdates.Caption := _s(chkAutoCheckForUpdates.Caption);
  lblServerUpdate.Caption := _s(lblServerUpdate.Caption);
  lblVerifyServInt.Caption := _s(lblVerifyServInt.Caption);
  lblWorkshop.Caption := _s(lblWorkshop.Caption);
  lblAllChangesWillbe.Caption := _s(lblAllChangesWillbe.Caption);
  cbbListViewDisplayStyle.Items[0] := _s(cbbListViewDisplayStyle.Items[0]);
  cbbListViewDisplayStyle.Items[1] := _s(cbbListViewDisplayStyle.Items[1]);
  cbbListViewDisplayStyle.Items[2] := _s(cbbListViewDisplayStyle.Items[2]);
  chkGrouMapCycle.Caption := _s(chkGrouMapCycle.Caption);
  chkIncludeSepratorsMapCycle.Caption :=
    _s(chkIncludeSepratorsMapCycle.Caption);
  lblHelpAdditionParam.Caption := _s('Example: ') +
    '?Mutator=KFMutator.KFMutator_MaxPlayersV2?MaxPlayers=15?MaxMonsters=64' +
    #10#13 + _s('Example: ') +
    '?Game=MyCustoGameMode.GameMode?Mutator=MyMutator.Mutator';

  cbbMap.hint := _h(cbbMap.hint);
  cbbLength.hint := _h(cbbLength.hint);
  cbbDifficulty.hint := _h(cbbDifficulty.hint);
  cbbGameMode.hint := _h(cbbGameMode.hint);
  edtGmPass.hint := _h(edtGmPass.hint);
  edtExtra.hint := _h(edtExtra.hint);
  btnStartServer.hint := _h(btnStartServer.hint);
  cbStatusWeb.hint := _h(cbStatusWeb.hint);
  cbbProfile.hint := _h(cbbProfile.hint);
  btnCheckForPreview.hint := _h(btnCheckForPreview.hint);
  btnSvIntegrityCurrent.hint := _h(btnSvIntegrityCurrent.hint);
  btnSvIntegrityBeta.hint := _h(btnSvIntegrityBeta.hint);
  btnCleanDownloadCache.hint := _h(btnCleanDownloadCache.hint);
  btnCleanWorkshopData.hint := _h(btnCleanWorkshopData.hint);
  chkAutoLoginAdmin.hint := _h(chkAutoLoginAdmin.hint);
  cbWorkshopDMStatus.hint := _h(cbWorkshopDMStatus.hint);
  edtPort.hint := _h(edtPort.hint);
  edtWebPass.hint := _h(edtWebPass.hint);
  cbbRedirectEnabled.hint := _h(cbbRedirectEnabled.hint);
  edtRedirectURL.hint := _h(edtRedirectURL.hint);
  chkAutoConnectWeb.hint := _h(chkAutoConnectWeb.hint);
  chkIncludeSepratorsMapCycle.hint := _h(chkIncludeSepratorsMapCycle.hint);
  chkGrouMapCycle.hint := _h(chkGrouMapCycle.hint);
  btnNewProfile.hint := _h(btnNewProfile.hint);
  btnRenameProfile.hint := _h(btnRenameProfile.hint);
  btnDeleteProfile.hint := _h(btnDeleteProfile.hint);
  btnAddNew.hint := _h(btnAddNew.hint);
  btnRemove.hint := _h(btnRemove.hint);
  btnReinstall.hint := _h(btnReinstall.hint);
  btnUpdate.hint := _h(btnUpdate.hint);
  chkAutoCheckForUpdates.hint := _h(chkAutoCheckForUpdates.hint);
  chkOnlyFromConfigItems.hint := _h(chkOnlyFromConfigItems.hint);

end;

procedure TFormMain.RealignUIItems(Sender: TObject);
begin
  fontSize := trckbrFontSize.Position;
  Self.Font.Size := fontSize;
  alignControlAtoControlB(cbbRedirectEnabled, lblCustomRedirect);
  alignControlAtoControlB(cbWorkshopDMStatus, lblWkspDownMan);
  alignControlAtoControlB(trckbrFontSize, lblFontSize);
  alignControlAtoControlB(cbbLanguage, lblLanguage);
  alignControlAtoControlB(cbStatusWeb, lblDescWebAdmin);
  alignControlAtoControlB(edtPort, lblDescWebPort);
  alignControlAtoControlB(edtWebPass, lblWebPass);
  alignControlAtoControlB(cbbTheme, lblTheme);

end;

procedure TFormMain.wb1DocumentComplete(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
  if autoLoginWebAdmin then
  begin

    if URL = 'http://127.0.0.1:' + edtPort.text + '/ServerAdmin/' then
      autoLoginWb;

  end;

end;

function TFormMain._p(text: String): PWideChar;
begin
  try
    Result := PWideChar(tlTool.tlStr(text))
  except
    on E: Exception do
    begin
      Result := PWideChar(text);
      serverTool.LogEvent('Error: ', E.Message);
    end;
  end;
end;

function TFormMain._h(text: String): String;
begin
  try
    Result := (tlTool.tlStr(text))
  except
    on E: Exception do
    begin
      Result := PWideChar(text);
      serverTool.LogEvent('Error: ', E.Message);
    end;
  end;
end;

function TFormMain._s(text: String): String;
begin
  try
    Result := tlTool.tlStr(text)
  except
    on E: Exception do
    begin
      Result := text;
      serverTool.LogEvent('Error: ', E.Message);
    end;
  end;
end;

procedure TFormMain.alignControlAtoControlB(elementA, elementB: TControl);
begin
  try
    elementA.Top := elementB.Top + Round(elementB.Height / 2) -
      Round(elementA.Height / 2);

    elementA.Left := elementB.Left + elementB.Width + 5;
  except
    serverTool.LogEvent('Error', 'Error aligncontrolAToB');
  end;

end;

procedure TFormMain.InstallRegBrowserKey();
var
  R: TRegistry;
begin

  try
    R := TRegistry.Create(KEY_WRITE);
    R.RootKey := HKEY_LOCAL_MACHINE;
    try
      if not R.OpenKey
        ('SOFTWARE\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION',
        True) then
        RaiseLastOSError;
      R.WriteInteger(ExtractFileName(Application.ExeName), 9999);
    finally
      R.Free;
    end;
  except

  end;
end;

end.
