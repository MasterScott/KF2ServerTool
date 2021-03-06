unit DownloaderTool;

interface

uses
  Classes,
  System.Net.URLClient,
{$IFDEF MSWINDOWS}
  System.Net.HttpClientComponent,
  System.Net.HttpClient,
{$ENDIF MSWINDOWS}
  System.SysUtils;

type
  TDownloadManager = class(TObject)
  private
    FileDSize: Int64;
    FileDPostion: Int64;

  var
  public
    OnProgress: TProc<Int64>;
    OnStarted: TProc<Int64>;
    OnFinished: TProc;

  var
    FileDAbort: ^Boolean;
    constructor Create();
    destructor Destroy; override;

  end;

  TDownloaderTool = class(TObject)
  private
{$IFDEF MSWINDOWS}
    procedure HTTPClientReceiveData(const Sender: TObject;
      AContentLength, AReadCount: Int64; var Abort: Boolean);
    procedure HTTPClientRequestCompleted(const Sender: TObject;
      const AResponse: IHTTPResponse);
{$ENDIF MSWINDOWS}

  var
    DLSize: Int64;
    DLPostion: Int64;
  public
    function downloadFile(URL: String; Destination: string;
      var dlManager: TDownloadManager): Boolean;

  var
    downloadManager: TDownloadManager;
    constructor Create();
    destructor Destroy; override;

  end;

implementation

constructor TDownloaderTool.Create;
begin

end;

destructor TDownloaderTool.Destroy;
begin

  inherited;
end;

{$IFDEF MSWINDOWS}

procedure TDownloaderTool.HTTPClientReceiveData(const Sender: TObject;
  AContentLength, AReadCount: Int64; var Abort: Boolean);
begin
  DLSize := AContentLength;
  DLPostion := AReadCount;
  if Assigned(downloadManager) then
  begin
    if Assigned(downloadManager.FileDAbort) then
      Abort := (downloadManager.FileDAbort)^;

    downloadManager.FileDPostion := AReadCount;
    if Assigned(downloadManager.OnStarted) and (downloadManager.FileDSize = 0)
    then
      downloadManager.OnStarted(AContentLength);

    downloadManager.FileDSize := AContentLength;
    if Assigned(downloadManager.OnProgress) then
      downloadManager.OnProgress(AReadCount);
  end;
end;

procedure TDownloaderTool.HTTPClientRequestCompleted(const Sender: TObject;
  const AResponse: IHTTPResponse);
begin
  if Assigned(downloadManager) then
  begin
    if Assigned(downloadManager.OnFinished) then
      downloadManager.OnFinished();
  end;
end;
{$ENDIF MSWINDOWS}

function TDownloaderTool.downloadFile(URL: String; Destination: string;
  var dlManager: TDownloadManager): Boolean;

{$IFDEF MSWINDOWS}
var
  httpRq: TNetHTTPClient;
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  downloadManager := dlManager;
  httpRq := TNetHTTPClient.Create(nil);
  httpRq.OnReceiveData := HTTPClientReceiveData;
  httpRq.OnRequestCompleted := HTTPClientRequestCompleted;
  httpRq.UserAgent :=
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36';
  httpRq.Get(URL, Stream, nil);
  try
    try
      if DLSize = DLPostion then
      begin
        if DirectoryExists(ExtractFilePath(Destination)) = false then
          CreateDir(ExtractFilePath(Destination));
        if FileExists(Destination) then
          DeleteFile(Destination);

        Stream.SaveToFile(Destination);
        Result := FileExists(Destination);
      end
      else
      begin
        Result := false;
      end;
    except
      Result := false;
    end;
  finally
    FreeAndNil(Stream);
    FreeAndNil(httpRq);
  end;
end;
{$ELSE}

begin
  raise Exception.Create('No implemented');
  Result := false;
end;
{$ENDIF MSWINDOWS}

constructor TDownloadManager.Create;
begin
  FileDSize := 0;
  FileDPostion := 0;
  FileDAbort := nil;
end;

destructor TDownloadManager.Destroy;
begin

  inherited;
end;

end.
