unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,DateUtils, ComCtrls, ToolWin, Grids, ExtCtrls,
  ShellCtrls, CategoryPanelGroup, ImgList, jpeg, Mask;

const
  EVENTLOG_SEEK_READ = 2;
  EVENTLOG_FORWARDS_READ = 4;
type
  PEventLogRecord = ^TEventLogRecord;
  TEventLogRecord = packed record
      Length: dword;
      Reserved: dword;
      RecordNumber: dword;
      TimeGenerated: dword;
      TimeWritten: dword;
      EventID: dword;
      EventType: word;
      NumStrings: word;
      EventCategory: word;
      ReservedFlags: word;
      ClosingRecordNumber: dword;
      StringOffset: dword;
      UserSidLength: dword;
      UserSidOffset: dword;
      DataLength: dword;
      DataOffset: dword;
  end;
  TForm1 = class(TForm)
    //Button1: TButton;
    Memo1: TMemo;
    Button1: TButton;
    Panel1: TPanel;
    Button2: TButton;
    HeaderControl1: THeaderControl;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
   // Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
 TLogInfo = class(TObject)
  logDate:TDate;
  startTime:String;
  endTime:String;
 end;
var
  Form1: TForm1;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
    Log: THandle;
    i: integer;
    EventCount,ByteRead,MinByteNeeded: cardinal;
    Buffer: pointer;
    j: integer;
    logDateTime:TDateTime;
    startDate:TDate;
begin
    Log := OpenEventLog('','System');
    GetNumberOfEventLogRecords(Log,EventCount);
    GetMem(Buffer,1024);
    for i := EventCount downto 1 do begin
        if ReadEventLog(Log,EVENTLOG_SEEK_READ or EVENTLOG_FORWARDS_READ,
        i,Buffer,1024,ByteRead,MinByteNeeded) then with PEventLogRecord(Buffer)^ do
        if ((EventID and $FFFF) = 6005) or ((EventID and $FFFF) = 6006)  then
        //Format('#%d   ID: %d   at UTC %s',[RecordNumber,EventID and $FFFF,DateTimeToStr(IncSecond(IncSecond(EncodeDate(1970,1,1),TimeGenerated),8*60*60))])


        begin
         // deal log date
         logDateTime :=IncSecond(IncSecond(EncodeDate(1970,1,1),TimeGenerated),8*60*60);
         startDate:=StrToDateTime(FormatDatetime('YYYY/MM/DD',logDateTime));

         if   (startDate >=  DateTimePicker1.Date) and (startDate <=  DateTimePicker2.Date) then
         begin
          Memo1.Lines.Add(Format('%d    %s    %s    %s',[EventID and $FFFF,DateTimeToStr(startDate),FormatDatetime('h:n',logDateTime),FormatDatetime('h:n',logDateTime)]));
         end;

        end;
    end;
    FreeMem(Buffer);
    CloseEventLog(Log);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    DateTimePicker2.Date:=StrToDateTime(FormatDatetime('YYYY/MM/DD',Date()));
    DateTimePicker1.Date:= IncMonth(StrToDateTime(FormatDatetime('YYYY/MM/21',Date())),-1);
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
   if PageControl1.TabIndex = 0 then
   begin
       Memo1.Lines.Clear;
       Memo1.Lines.Append('事件ID          事件日期');
   end;

   if PageControl1.TabIndex = 1 then
   begin
       Memo1.Lines.Clear;
       Memo1.Lines.Append('序号  姓名   日期    签到时间    签退时间');

   end;

   if PageControl1.TabIndex = 2 then
   begin
       Memo1.Lines.Clear;
       Memo1.Lines.Append('序号  姓名   日期    签到时间    签退时间   是否领取饭补');

   end;


   if PageControl1.TabIndex = 3 then
   begin
      showmessage('加工ing');
   end;
end;

end.

