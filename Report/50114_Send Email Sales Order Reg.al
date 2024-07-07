report 50114 "Send Email Sales Order Reg"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;
    Caption = 'Send Email Sales Report';
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(SendToEmail; SendToEmailID)
                    {
                        ApplicationArea = All;
                        Caption = 'Send To Email ID';
                        ToolTip = 'Send To Email ID';
                        ExtendedDatatype = EMail;

                        trigger OnValidate()
                        var
                            EmailMgt: Codeunit "Email Account";
                            Cod_90: Codeunit Cod_90;
                            SAS: Record "Sales Header";
                        begin
                            //   Cod_90.SendMail(SAS);
                            IF SendToEmailID <> '' Then
                                EmailMgt.ValidateEmailAddresses(SendToEmailID);
                        end;
                    }
                }
            }
        }
    }

    trigger OnInitReport()
    var
        DayOfWeek: Integer;
    begin

    end;

    trigger OnPreReport()
    var
        FileMngt: Codeunit "File Management";
        PDFFileName: Text;
        SMTPMail: Codeunit "Email Message";
        Email: Codeunit Email;
        Recipients: List of [Text];
        CC: List of [Text];
        BCC: List of [Text];
        BodyHTML_lTxt: Text;
        Out: OutStream;
        Instr: InStream;
        TempBlob_lCdu: Codeunit "Temp Blob";
        SentEmailCnt_lInt: Integer;
        Equipment_Rec: Record "LSC Trans. Payment Entry";
        RecepitText: text;
        AdditionalReceipt: text;
        CCText: text;
        EquipmentDueDate: Report "Daily sales Report";
        EquipmentDueDate1: Report "Daily  Total sales Report";

        Equipment_Rec1: Record "LSC Transaction Header";

        BCCText: text;

    begin
        Clear(RecepitText);
        RecepitText := SendToEmailID;// 'ashish.sharma@fbts.in';

        while StrPos(RecepitText, ';') <> 0 do begin
            Recipients.Add(CopyStr(RecepitText, 1, StrPos(RecepitText, ';') - 1));
            RecepitText := CopyStr(RecepitText, StrPos(RecepitText, ';') + 1, StrLen(RecepitText));
        end;
        if RecepitText <> '' then
            Recipients.Add(RecepitText);

        Clear(CCText);
        // CCText := 'rohit.kumar@fbts.in';

        while StrPos(CCText, ';') <> 0 do begin
            CC.Add(CopyStr(CCText, 1, StrPos(CCText, ';') - 1));
            CCText := CopyStr(CCText, StrPos(CCText, ';') + 1, StrLen(CCText));
        end;
        if CCText <> '' then
            CC.Add(CCText);


        Clear(BCCText);
        // BCCText := 'ashish.sharma@fbts.in';

        while StrPos(BCCText, ';') <> 0 do begin
            BCC.Add(CopyStr(BCCText, 1, StrPos(BCCText, ';') - 1));
            BCCText := CopyStr(BCCText, StrPos(BCCText, ';') + 1, StrLen(BCCText));
        end;
        if BCCText <> '' then
            BCC.Add(BCCText);

        BodyHTML_lTxt := '';

        BodyHTML_lTxt += 'Please find attached Report';


        SMTPMail.Create(Recipients, 'Daily Sales Report:' + Format(Today - 1), BodyHTML_lTxt, true, CC, BCC);


        PDFFileName := 'Daily Sales Report:' + Format(Today - 1) + '.pdf';
        PDFFileName := FileMngt.StripNotsupportChrInFileName(PDFFileName);

        Equipment_Rec.Reset();
        Equipment_Rec.SetRange(Date, 20220927D);
        Equipment_Rec.FindSet();

        TempBlob_lCdu.CreateOutStream(Out);
        Clear(EquipmentDueDate);
        EquipmentDueDate.SetTableview(Equipment_Rec);
        EquipmentDueDate.SaveAs('', ReportFormat::Pdf, Out);
        TempBlob_lCdu.CREATEINSTREAM(Instr);

        // Clear(Email);
        // Email.Send(SMTPMail, Enum::"Email Scenario"::Default);

        Equipment_Rec1.Reset();
        Equipment_Rec1.SetRange(Date, 20220927D);
        Equipment_Rec1.FindSet();

        TempBlob_lCdu.CreateOutStream(Out);
        Clear(EquipmentDueDate1);
        EquipmentDueDate1.SetTableview(Equipment_Rec1);
        EquipmentDueDate1.SaveAs('', ReportFormat::Pdf, Out);
        TempBlob_lCdu.CREATEINSTREAM(Instr);
        SMTPMail.AddAttachment(PDFFileName, 'PDF', Instr);
        Clear(Email);
        Email.Send(SMTPMail, Enum::"Email Scenario"::Default);

        Message('email sent successfully');
        // If SendToEmailID = '' then
        //     Error('Enter Email ID');

        // Clear(Recipients);

        // RecipientsText := DELCHR(SendToEmailID, '<>', ' ');

        // IF STRPOS(RecipientsText, ';') <> 0 THEN BEGIN  //System doesn't work if the email address end with semi colon  /ex: nileshg@intech-systems.com;
        //     LastChr := COPYSTR(RecipientsText, STRLEN(RecipientsText));
        //     IF LastChr = ';' THEN
        //         RecipientsText := COPYSTR(RecipientsText, 1, STRPOS(RecipientsText, ';') - 1);
        // END;

        // IF STRPOS(RecipientsText, ',') <> 0 THEN BEGIN  //System doesn't work if the email address end with Comma  /ex: nileshg@intech-systems.com,
        //     LastChr := COPYSTR(RecipientsText, STRLEN(RecipientsText));
        //     IF LastChr = ',' THEN
        //         RecipientsText := COPYSTR(RecipientsText, 1, STRPOS(RecipientsText, ',') - 1);
        // END;

        // TmpRecipients := DELCHR(RecipientsText, '<>', ';');
        // WHILE STRPOS(TmpRecipients, ';') > 1 DO BEGIN
        //     Recipients.Add((COPYSTR(TmpRecipients, 1, STRPOS(TmpRecipients, ';') - 1)));
        //     TmpRecipients := COPYSTR(TmpRecipients, STRPOS(TmpRecipients, ';') + 1);
        // END;
        // Recipients.Add(TmpRecipients);

        // // Subject := 'Daily Shipment Report - ' + Format(Today);
        // // GetHTMLBody();
        // // Body := HTMLBodyText;
        // // EmailMessage.Create(Recipients, Subject, Body, true);

        // // //   GetAttchment();
        // // Message('%1', 'AS');

        // // if Email.Send(EmailMessage, Enum::"Email Scenario"::Default) then
        // //     Message('Email sent successfully');




        // Subject := 'Sales Order - ';
        // EmailMessage.Create(Recipients, Subject, Body, true);
        // EmailMessage.AppendToBody('<br><br>');
        // EmailMessage.AppendToBody('Please Check! ');

        // LSCTransPaymentEntry.Reset();
        // // LSCTransPaymentEntry.SetRange(Date, Today - 1);
        // LSCTransPaymentEntry.FindSet();

        // Clear(DailsalesReport);
        // DailsalesReport.SetTableview(LSCTransPaymentEntry);
        // DailsalesReport.SaveAs('', ReportFormat::Pdf, Out);
        // TempBlob_lCdu.CREATEINSTREAM(Instr);
        // EmailMessage.AddAttachment('Report', 'PDF', Instr);
        // if Email.Send(EmailMessage, Enum::"Email Scenario"::Default) then
        //     Message('email sent successfully');
    end;



    local procedure GetHTMLBody()
    var
        ReportLayoutSelection: Record "Report Layout Selection";
        CustomReportLayout: Record "Custom Report Layout";
        TempBlob_lRec: Codeunit "Temp Blob";
        RecRef: RecordRef;
        BlobOutStream: OutStream;
        InOutStream: InStream;
    begin

        HTMLBodyText := 'HI PFA';
    end;

    procedure GetAttchment()
    var

        TempBlob_lCdu: Codeunit "Temp Blob";
        SORg_lRpt: Report "Daily sales Report";
        RecRef: RecordRef;
        Out: OutStream;
        Instr: InStream;
        MyPath: Text[250];
        Text0001Lbl: Label '%1_%2.xlsx', Comment = '%1 = Shipment Text  ; %2 = Shipment No.';
    begin
        TempBlob_lCdu.CreateOutStream(Out);

        Clear(SORg_lRpt);
        SORg_lRpt.SetSendByEmail();
        SORg_lRpt.UseRequestPage(false);
        SORg_lRpt.RunModal();
        SORg_lRpt.GetExportExcelFileToBlob(TempBlob_lCdu);

        //RecRef.GetTable(PostedWhseShipmentHeader);
        //REPORT.SAVEAS(Report::"VTK Daily Ship Report", '', REPORTFORMAT::Pdf, Out, RecRef);

        TempBlob_lCdu.CREATEINSTREAM(Instr);
        MyPath := STRSUBSTNO(Text0001Lbl, 'Sales Order Register - ', Format(Today));
        EmailMessage.AddAttachment(MyPath, 'xlsx', Instr);
    end;

    var
        EmailMessage: Codeunit "Email Message";
        SendToEmailID: Text[50];
        HTMLBodyText: Text;
}
