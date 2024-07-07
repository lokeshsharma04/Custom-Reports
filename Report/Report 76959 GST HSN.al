Report 76959 "GST HSN"
{
    Caption = 'GST HSN';
    ProcessingOnly = true;
    //ApplicationArea = All;
    // UsageCategory = Administration;
    // DefaultLayout = RDLC;
    // RDLCLayout = 'Report/GST HSN.rdl';

    dataset
    {
        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")

        {
            DataItemTableView = sorting("Transaction Type", "Document Type", "Document No.", "Document Line No.");
            RequestFilterFields = "Document Type", "Document No.", "HSN/SAC Code";


            column(gsbaseAmt; "Detailed GST Ledger Entry"."GST Base Amount")
            {

            }

            trigger OnPreDataItem()
            var
            begin

                Clear("Detailed GST Ledger Entry");
                SD_gDte := Dmy2date(1, Month_gInt, Year_gInt);
                ED_gDte := CalcDate('CM', SD_gDte);

                if GSTRegNo_gCod <> '' then
                    SetRange("Location  Reg. No.", GSTRegNo_gCod);
                SetRange("Entry Type", "entry type"::"Initial Entry");
                SetRange("Posting Date", SD_gDte, ED_gDte);
                SetFilter("Document Type", '%1|%2', "document type"::Invoice, "document type"::"Credit Memo");
                SetFilter("GST Component Code", '<>%1', 'SGST');  //Only CGST Line consider for export data
                SetRange("Transaction Type", "transaction type"::Sales);




                TempExcelBuffer.Reset();
                TempExcelBuffer.DeleteAll();

                TempExcelBuffer.NewRow;
                TempExcelBuffer.AddColumn('HSN', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
                TempExcelBuffer.AddColumn('Description', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
                TempExcelBuffer.AddColumn('UQC', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
                TempExcelBuffer.AddColumn('Total Quantity', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
                TempExcelBuffer.AddColumn('Rate', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
                TempExcelBuffer.AddColumn('Total Value', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
                TempExcelBuffer.AddColumn('Taxable Value', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
                TempExcelBuffer.AddColumn('Integrated Tax Amount', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
                TempExcelBuffer.AddColumn('Central Tax Amount', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
                TempExcelBuffer.AddColumn('State UT Tax Amount', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
                TempExcelBuffer.AddColumn('Cess Amount', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
                WindowDialog.Open('Fetching Records\' + Text001Lbl);
                CtrTot := Count();
            end;

            trigger OnAfterGetRecord()
            var
                ItemRec: Record Item;
            begin


                Ctr += 1;
                WindowDialog.Update(1, "No." + ' - ' + format(Ctr));

                ItemRec.Reset();
                ItemRec.SetRange("HSN/SAC Code", "HSN/SAC Code");
                IF ItemRec.FindFirst() then;
                // TempExcelBuffer.NewRow;
                // TempExcelBuffer.AddColumn("Detailed GST Ledger Entry"."HSN/SAC Code", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
                // TempExcelBuffer.AddColumn(ItemRec.Description, false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
                // TempExcelBuffer.AddColumn(ItemRec."Base Unit of Measure", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
                // TempExcelBuffer.AddColumn("Detailed GST Ledger Entry".Quantity, false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
                // TempExcelBuffer.AddColumn("Detailed GST Ledger Entry"."GST %", false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
                // TempExcelBuffer.AddColumn("Detailed GST Ledger Entry"."GST Amount", false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
                // TempExcelBuffer.AddColumn("Detailed GST Ledger Entry"."GST Base Amount", false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
                // TempExcelBuffer.AddColumn(-1 * Abs("Detailed GST Ledger Entry"."GST Amount"), false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
                // if "Detailed GST Ledger Entry"."GST Component Code" = 'CGST' then
                //     TempExcelBuffer.AddColumn(-1 * Abs("Detailed GST Ledger Entry"."GST Amount"), false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
                // if "Detailed GST Ledger Entry"."GST Component Code" = 'CGST' then
                //     TempExcelBuffer.AddColumn(Abs("Detailed GST Ledger Entry"."GST Amount"), false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
                // TempExcelBuffer.AddColumn(0, false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
                //Sachin aziz sir fbts
                TempExcelBuffer.NewRow;
                TempExcelBuffer.AddColumn("Detailed GST Ledger Entry"."HSN/SAC Code", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
                TempExcelBuffer.AddColumn(ItemRec.Description, false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
                TempExcelBuffer.AddColumn(ItemRec."Base Unit of Measure", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
                TempExcelBuffer.AddColumn(-1 * "Detailed GST Ledger Entry".Quantity, false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
                if "Detailed GST Ledger Entry"."GST Component Code" = 'IGST' then begin
                    TempExcelBuffer.AddColumn("Detailed GST Ledger Entry"."GST %", false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
                end else begin
                    TempExcelBuffer.AddColumn(2 * "Detailed GST Ledger Entry"."GST %", false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
                end;
                if "Detailed GST Ledger Entry"."GST Component Code" = 'IGST' then begin
                    TempExcelBuffer.AddColumn(-1 * ("Detailed GST Ledger Entry"."GST Amount" + "Detailed GST Ledger Entry"."GST Base Amount"), false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
                end else begin
                    TempExcelBuffer.AddColumn(-1 * ((2 * "Detailed GST Ledger Entry"."GST Amount") + "Detailed GST Ledger Entry"."GST Base Amount"), false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
                end;
                TempExcelBuffer.AddColumn(-1 * "Detailed GST Ledger Entry"."GST Base Amount", false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
                if "Detailed GST Ledger Entry"."GST Component Code" = 'IGST' then begin
                    TempExcelBuffer.AddColumn(-1 * ("Detailed GST Ledger Entry"."GST Amount"), false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
                end else begin
                    TempExcelBuffer.AddColumn(0, false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
                end;
                if "Detailed GST Ledger Entry"."GST Component Code" = 'CGST' then
                    TempExcelBuffer.AddColumn(-1 * ("Detailed GST Ledger Entry"."GST Amount"), false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
                if "Detailed GST Ledger Entry"."GST Component Code" = 'CGST' then
                    TempExcelBuffer.AddColumn(-1 * ("Detailed GST Ledger Entry"."GST Amount"), false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
                TempExcelBuffer.AddColumn(0, false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);



            end;

            trigger OnPostDataItem()
            begin
                WindowDialog.Close();

                TempExcelBuffer.CreateNewBook(StudentList);
                TempExcelBuffer.WriteSheet(StudentList, CompanyName, UserId);
                TempExcelBuffer.CloseBook();
                TempExcelBuffer.SetFriendlyFilename(StrSubstNo(ExcelFileName, CurrentDateTime, UserId));
                TempExcelBuffer.OpenExcel();
            end;
        }


    }


    requestpage
    {

        layout
        {
            area(content)
            {
                field(Month; Month_gInt)
                {
                    ApplicationArea = Basic;
                    Caption = 'Month';
                    MaxValue = 12;
                    MinValue = 0;
                }
                field(Year; Year_gInt)
                {
                    ApplicationArea = Basic;
                    Caption = 'Year';
                    MaxValue = 2099;
                    MinValue = 2017;
                }
                field("GST Register No."; GSTRegNo_gCod)
                {
                    ApplicationArea = Basic;
                    Caption = 'GST Registration No.';
                    // TableRelation = "GST Registration Nos.";

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        GSTRegnNos_lRec: Record "GST Registration Nos.";
                        GSTRegnNos_lPge: Page "GST Registration Nos.";
                    begin
                        GSTRegnNos_lRec.Reset();

                        Clear(GSTRegnNos_lPge);
                        GSTRegNo_gCod := '';
                        GSTRegnNos_lPge.LookupMode(true);
                        GSTRegnNos_lPge.SetTableView(GSTRegnNos_lRec);
                        if GSTRegnNos_lPge.RunModal() = Action::LookupOK then begin
                            GSTRegnNos_lRec.Reset();
                            GSTRegnNos_lPge.SetSelectionFilter(GSTRegnNos_lRec);
                            if GSTRegnNos_lRec.FindSet then begin
                                repeat
                                    if GSTRegNo_gCod = '' then
                                        GSTRegNo_gCod := GSTRegnNos_lRec.Code
                                    else
                                        GSTRegNo_gCod := GSTRegNo_gCod + '|' + GSTRegnNos_lRec.Code;
                                until GSTRegnNos_lRec.Next = 0;
                            end;
                        end else
                            Error('');
                    end;
                }
                field("Export to Excel"; ExportToExcel_gBln)
                {
                    ApplicationArea = Basic;
                    Caption = 'Export to Excel';
                }
            }

        }
    }
    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        // if SD_gDte = 0D then
        //     ERROR('Start Date must have a value');
        // if SD_gDte = 0D then
        //     ERROR('End Date must have a value');
        SD_gDte := DMY2Date(1, Month_gInt, Year_gInt);
        Message('%1', SD_gDte);
        SD_gDte := CalcDate('CM', SD_gDte);
    end;

    // procedure SetJustFillData_gFnc(; Month_iInt: Integer; Year_iInt: Integer; GSTRegNo_iCod: Text; JustFillData_iBln: Boolean)
    // begin
    //     Day_gint := Day_iint;
    //     Month_gInt := Month_iInt;
    //     Year_gInt := Year_iInt;
    //     GSTRegNo_gCod := GSTRegNo_iCod;
    //     JustFillData_gBln := JustFillData_iBln;
    // end;

    procedure SetJustFillData_gFnc(Month_iInt: Integer; Year_iInt: Integer; GSTRegNo_iCod: Text; JustFillData_iBln: Boolean)
    begin
        Month_gInt := Month_iInt;
        Year_gInt := Year_iInt;
        GSTRegNo_gCod := GSTRegNo_iCod;
        JustFillData_gBln := JustFillData_iBln;
    end;

    var
        TempExcelBuffer: Record "Excel Buffer" temporary;

        StudentList: Label 'GST hsn';
        ExcelFileName: Label 'GST HSN Report_%1_%2';
        Text001Lbl: Label 'Document No/.     ############1################\';
        WindowDialog: Dialog;
        Ctr: Integer;
        CtrTot: Integer;


        Text001: label 'Outward';
        Text005: label 'Company Name';
        Text006: label 'Report No.';
        Text007: label 'Report Name';
        Text008: label 'User ID';
        Text009: label 'Date';
        Text010: label 'Filters';
        Month_gInt: Integer;
        Day_gint: Integer;
        Year_gInt: Integer;
        GSTRegNo_gCod: Text;
        SD_gDte: Date;


        ED_gDte: Date;
        Text50009_gCtx: label 'Outward';
        Win: Dialog;
        CurrRec_gInt: Integer;
        // GSTManagement: Codeunit UnknownCodeunit16401;
        GSTHSN_gRec: Record "GST HSN_Saffron";
        GSTRCommonFunction_gCdu: Codeunit "GSTR Common Function_Saffron";
        UOMCod_gCod: Code[10];
        SetOutPutFile_gTxt: Text[250];
        DataExported_gBln: Boolean;
        ExportToExcel_gBln: Boolean;
        JustFillData_gBln: Boolean;
        ExcelSaveFilePath_gTxt: Text;

}


// Report 76959 "GST HSN"
// {
//     Caption = 'GST HSN';
//     //ProcessingOnly = true;
//     ApplicationArea = All;
//     UsageCategory = Administration;
//     DefaultLayout = RDLC;
//     RDLCLayout = 'Report/GST HSN.rdl';

//     dataset
//     {
//         dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
//         {
//             DataItemTableView = sorting("Transaction Type", "Document Type", "Document No.", "Document Line No.");
//             RequestFilterFields = "Document Type", "Document No.", "HSN/SAC Code";


//             column(gsbaseAmt; "Detailed GST Ledger Entry"."GST Base Amount")
//             {

//             }

//             trigger OnAfterGetRecord()
//             var
//                 ConsiderEntry_lBln: Boolean;
//                 PostedSalesInvocie_gFncSIL_lRec: Record "Sales Invoice Line";
//                 SerInvLine_lRec: Record "Service Invoice Line";
//                 SalesCrMemoLine_lRec: Record "Sales Cr.Memo Line";
//                 ServiceCrMemoLine_lRec: Record "Service Cr.Memo Line";
//                 TSL_lRec: Record "Transfer Shipment Line";
//                 DataExport_lBln: Boolean;
//             begin
//                 CurrRec_gInt += 1;
//                 if SetOutPutFile_gTxt = '' then
//                     Win.Update(2, CurrRec_gInt);

//                 ConsiderEntry_lBln := false;

//                 // if "GST Component Code" = 'KFLOODCESS' then
//                 //     CurrReport.Skip();

//                 //Posted Sales & Service Invoice
//                 // if ("Transaction Type" = "transaction type"::Sales) and ("Document Type" in ["document type"::Invoice, "document type"::"Credit Memo"]) then begin
//                 //     ConsiderEntry_lBln := true;
//                 // end;

//                 // if not ConsiderEntry_lBln then
//                 //     CurrReport.Skip;

//                 //Posted Sales & Service Invoice


//                 DataExport_lBln := false;
//                 if SIL_lRec.Get("Document No.", "Document Line No.") then begin
//                     Clear(UOMCod_gCod);
//                     UOMCod_gCod := SIL_lRec."Unit of Measure Code";
//                     DataExport_lBln := true;
//                 end;

//                 PostedSalesInvocie_gFnc("Detailed GST Ledger Entry");
//                 TempExcelBuffer.NewRow;
//                 TempExcelBuffer.AddColumn("Detailed GST Ledger Entry"."GST Base Amount", false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);


//                 // if not DataExport_lBln then begin
//                 //     if SerInvLine_lRec.Get("Document No.", "Document Line No.") then begin
//                 //         Clear(UOMCod_gCod);
//                 //         UOMCod_gCod := SerInvLine_lRec."Unit of Measure Code";
//                 //         PostedSalesInvocie_gFnc("Detailed GST Ledger Entry");
//                 //         DataExport_lBln := true;
//                 //     end;
//                 // end;

//                 // if not DataExport_lBln then begin
//                 //     if SalesCrMemoLine_lRec.Get("Document No.", "Document Line No.") then begin
//                 //         Clear(UOMCod_gCod);
//                 //         UOMCod_gCod := SalesCrMemoLine_lRec."Unit of Measure Code";
//                 //         PostedSalesCrMemo_gFnc("Detailed GST Ledger Entry");
//                 //         DataExport_lBln := true;
//                 //     end;
//                 // end;

//                 // if not DataExport_lBln then begin
//                 //     if ServiceCrMemoLine_lRec.Get("Document No.", "Document Line No.") then begin
//                 //         Clear(UOMCod_gCod);
//                 //         UOMCod_gCod := ServiceCrMemoLine_lRec."Unit of Measure Code";
//                 //         PostedSalesCrMemo_gFnc("Detailed GST Ledger Entry");
//                 //         DataExport_lBln := true;
//                 //     end;
//                 // end;
//                 // if not DataExport_lBln then begin
//                 //     if TSL_lRec.Get("Document No.", "Document Line No.") then begin
//                 //         Clear(UOMCod_gCod);
//                 //         UOMCod_gCod := TSL_lRec."Unit of Measure Code";
//                 //         PostedSalesInvocie_gFnc("Detailed GST Ledger Entry");
//                 //         DataExport_lBln := true;
//                 //     end;
//                 // end;
//                 // if not DataExport_lBln then //Ashish-DON
//                 //     Error('Case not found for Data Export');
//             end;

//             trigger OnPreDataItem()
//             var
//                 TempCnt_lInt: Integer;
//             begin

//                 SD_gDte := Dmy2date(1, Month_gInt, Year_gInt);
//                 ED_gDte := CalcDate('CM', SD_gDte);

//                 if GSTRegNo_gCod <> '' then
//                     SetRange("Location  Reg. No.", GSTRegNo_gCod);
//                 SetRange("Entry Type", "entry type"::"Initial Entry");
//                 SetRange("Posting Date", SD_gDte, ED_gDte);
//                 SetFilter("Document Type", '%1|%2', "document type"::Invoice, "document type"::"Credit Memo");
//                 //SETFILTER("Invoice Type",'%1|%2|%3',"Invoice Type"::Taxable,"Invoice Type"::"Bill of Supply","Invoice Type"::Supplementary);
//                 SetFilter("GST Component Code", '<>%1', 'SGST');  //Only CGST Line consider for export data
//                 //SetRange("Buyer/Seller Reg. No.", '');
//                 SetRange("Transaction Type", "transaction type"::Sales);

//                 CurrRec_gInt := 0;
//                 TempCnt_lInt := Count;
//                 if SetOutPutFile_gTxt = '' then
//                     Win.Update(1, Count);

//                 GSTHSN_gRec.Reset;
//                 GSTHSN_gRec.SetCurrentkey("GST Month", "GST Year");
//                 GSTHSN_gRec.SetRange("GST Month", Month_gInt);
//                 GSTHSN_gRec.SetRange("GST Year", Year_gInt);
//                 GSTHSN_gRec.SetRange("GST Registration No.", GSTRegNo_gCod);
//                 GSTHSN_gRec.DeleteAll;
//             end;
//         }
//     }

//     requestpage
//     {
//         SaveValues = true;

//         layout
//         {
//             area(content)
//             {
//                 field(Month; Month_gInt)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Month';
//                     MaxValue = 12;
//                     MinValue = 0;
//                 }
//                 field(Year; Year_gInt)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Year';
//                     MaxValue = 2099;
//                     MinValue = 2017;
//                 }
//                 field("GST Register No."; GSTRegNo_gCod)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'GST Registration No.';
//                     // TableRelation = "GST Registration Nos.";

//                     trigger OnLookup(var Text: Text): Boolean
//                     var
//                         GSTRegnNos_lRec: Record "GST Registration Nos.";
//                         GSTRegnNos_lPge: Page "GST Registration Nos.";
//                     begin
//                         GSTRegnNos_lRec.Reset();

//                         Clear(GSTRegnNos_lPge);
//                         GSTRegNo_gCod := '';
//                         GSTRegnNos_lPge.LookupMode(true);
//                         GSTRegnNos_lPge.SetTableView(GSTRegnNos_lRec);
//                         if GSTRegnNos_lPge.RunModal() = Action::LookupOK then begin
//                             GSTRegnNos_lRec.Reset();
//                             GSTRegnNos_lPge.SetSelectionFilter(GSTRegnNos_lRec);
//                             if GSTRegnNos_lRec.FindSet then begin
//                                 repeat
//                                     if GSTRegNo_gCod = '' then
//                                         GSTRegNo_gCod := GSTRegnNos_lRec.Code
//                                     else
//                                         GSTRegNo_gCod := GSTRegNo_gCod + '|' + GSTRegnNos_lRec.Code;
//                                 until GSTRegnNos_lRec.Next = 0;
//                             end;
//                         end else
//                             Error('');
//                     end;
//                 }
//                 field("Export to Excel"; ExportToExcel_gBln)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Export to Excel';
//                 }
//             }
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//     }
//     trigger OnPostReport()
//     var
//         GSTHSN_lRec: Record "GST HSN_Saffron";
//         GSTHSN_lXml: XmlPort "GST - HSN Export";
//         OutputFile_lFile: File;
//         OutStream_lOST: OutStream;
//         TempBlob_lCdu: Codeunit "Temp Blob";
//         SetOutPutFile_Instr: Instream;
//     begin
//         if SetOutPutFile_gTxt = '' then
//             Win.Close;

//         Commit;

//         if not JustFillData_gBln then begin
//             GSTHSN_lRec.Reset;
//             GSTHSN_lRec.SetRange("GST Month", Month_gInt);
//             GSTHSN_lRec.SetRange("GST Year", Year_gInt);
//             GSTHSN_lRec.SetRange("GST Registration No.", GSTRegNo_gCod);
//             if ExportToExcel_gBln then begin
//                 MakeExcelDataInfo_lFnc;
//                 if GSTHSN_lRec.FindSet then begin
//                     DataExported_gBln := true;
//                     if ExcelSaveFilePath_gTxt <> '' then
//                         MakeExcelDataHdr_lFnc;
//                     repeat
//                         MakeExcelDataBody_lFnc(GSTHSN_lRec);
//                     until GSTHSN_lRec.Next = 0;
//                 end;
//                 CreateExcelBook_lFnc;
//             end else begin
//                 Clear(GSTHSN_lXml);
//                 GSTHSN_lXml.SetTableview(GSTHSN_lRec);

//                 if SetOutPutFile_gTxt = '' then begin
//                     GSTHSN_lXml.Run;
//                 end else begin
//                     if GSTHSN_lRec.IsEmpty then
//                         CurrReport.Break;
//                     // OutputFile_lFile.Create(SetOutPutFile_gTxt);
//                     // OutputFile_lFile.CreateOutstream(OutStream_lOST);

//                     Clear(TempBlob_lCdu);
//                     TempBlob_lCdu.CreateInStream(SetOutPutFile_Instr);
//                     SetOutPutFile_Instr.ReadText(SetOutPutFile_gTxt);
//                     CopyStream(OutStream_lOST, SetOutPutFile_Instr);

//                     GSTHSN_lXml.HideWinDialog_gFnc;
//                     GSTHSN_lXml.SetDestination(OutStream_lOST);
//                     GSTHSN_lXml.Export;
//                     DataExported_gBln := true;
//                 end;
//             end;
//         end;
//     end;

//     trigger OnPreReport()
//     var
//         GSTHSN_lRec: Record "GST HSN_Saffron";
//     begin
//         if Month_gInt = 0 then
//             Error('Select Month to Export Data');

//         if Year_gInt = 0 then
//             Error('Select Year to Export Data');

//         if GSTRegNo_gCod = '' then
//             Error('Select GST Registration No.');

//         GSTHSN_lRec.Reset;
//         GSTHSN_lRec.DeleteAll;

//         SD_gDte := Dmy2date(1, Month_gInt, Year_gInt);
//         ED_gDte := CalcDate('CM', SD_gDte);

//         if SetOutPutFile_gTxt = '' then
//             Win.Open('Total Record #1##########\Current Record #2###########');
//     end;

//     var
//         Text001: label 'Outward';
//         Text005: label 'Company Name';
//         Text006: label 'Report No.';
//         Text007: label 'Report Name';
//         Text008: label 'User ID';
//         Text009: label 'Date';
//         Text010: label 'Filters';
//         Month_gInt: Integer;
//         Year_gInt: Integer;
//         GSTRegNo_gCod: Text;
//         SD_gDte: Date;
//         ED_gDte: Date;
//         Text50009_gCtx: label 'Outward';
//         Win: Dialog;
//         CurrRec_gInt: Integer;
//         // GSTManagement: Codeunit UnknownCodeunit16401;
//         GSTHSN_gRec: Record "GST HSN_Saffron";
//         GSTRCommonFunction_gCdu: Codeunit "GSTR Common Function_Saffron";
//         UOMCod_gCod: Code[10];
//         SetOutPutFile_gTxt: Text[250];
//         DataExported_gBln: Boolean;
//         ExportToExcel_gBln: Boolean;
//         TempExcelBuffer: Record "Excel Buffer" temporary;
//         JustFillData_gBln: Boolean;
//         ExcelSaveFilePath_gTxt: Text;

//     local procedure PostedSalesInvocie_gFnc(DetailedGSTLedgerEntry_iRec: Record "Detailed GST Ledger Entry")
//     var
//         GSTHSN_lRec: Record "GST HSN_Saffron";
//     begin
//         GSTHSN_lRec.Reset;
//         GSTHSN_lRec.SetCurrentkey(HSN, UQC);
//         GSTHSN_lRec.SetRange("GST Month", Month_gInt);
//         GSTHSN_lRec.SetRange("GST Year", Year_gInt);
//         GSTHSN_lRec.SetRange("GST Registration No.", DetailedGSTLedgerEntry_iRec."Location  Reg. No.");
//         GSTHSN_lRec.SetRange(HSN, DetailedGSTLedgerEntry_iRec."HSN/SAC Code");
//         //   GSTHSN_lRec.SetRange(UQC, GSTRCommonFunction_gCdu.GetUOMDescription_gFnc(UOMCod_gCod));
//         GSTHSN_lRec.SetRange("GST %", Abs(GetGSTpercentage_lFnc(DetailedGSTLedgerEntry_iRec)));
//         if not GSTHSN_lRec.FindFirst then begin

//             GSTHSN_lRec.Init;
//             GSTHSN_lRec."GST Month" := Month_gInt;
//             GSTHSN_lRec."GST Year" := Year_gInt;
//             GSTHSN_lRec."GST Registration No." := DetailedGSTLedgerEntry_iRec."Location  Reg. No.";
//             GSTHSN_lRec.HSN := DetailedGSTLedgerEntry_iRec."HSN/SAC Code";

//             GSTHSN_lRec.Description := GetHSNDescription_gFnc(DetailedGSTLedgerEntry_iRec."GST Group Code", DetailedGSTLedgerEntry_iRec."HSN/SAC Code");
//             ItemRec.Reset();
//             ItemRec.SetRange("HSN/SAC Code", GSTHSN_lRec.HSN);
//             IF ItemRec.FindFirst() then
//                 GSTHSN_lRec.UQC := ItemRec."Base Unit of Measure";// GSTRCommonFunction_gCdu.GetUOMDescription_gFnc(UOMCod_gCod);
//             GSTHSN_lRec."GST %" := Abs(GetGSTpercentage_lFnc(DetailedGSTLedgerEntry_iRec)); //T24136
//             GSTHSN_lRec.Insert;
//         end;

//         GSTHSN_lRec."Total Quantity" += Abs(DetailedGSTLedgerEntry_iRec.Quantity);
//         GSTHSN_lRec."Total Value" += Abs(DetailedGSTLedgerEntry_iRec."GST Base Amount");

//         GSTHSN_lRec."Taxable Value" += Abs(DetailedGSTLedgerEntry_iRec."GST Base Amount");
//         if DetailedGSTLedgerEntry_iRec."GST Component Code" = 'IGST' then begin
//             GSTHSN_lRec."Integrated Tax Amount" += Abs(DetailedGSTLedgerEntry_iRec."GST Amount");
//             GSTHSN_lRec."Total Value" += Abs(DetailedGSTLedgerEntry_iRec."GST Amount");
//         end;
//         if DetailedGSTLedgerEntry_iRec."GST Component Code" = 'CGST' then begin
//             GSTHSN_lRec."Central Tax Amount" += Abs(DetailedGSTLedgerEntry_iRec."GST Amount");
//             GSTHSN_lRec."State/UT Tax Amount" += Abs(DetailedGSTLedgerEntry_iRec."GST Amount");
//             GSTHSN_lRec."Total Value" += 2 * Abs(DetailedGSTLedgerEntry_iRec."GST Amount");
//         end;
//         GSTHSN_lRec.Modify;
//     end;

//     local procedure PostedSalesCrMemo_gFnc(DetailedGSTLedgerEntry_iRec: Record "Detailed GST Ledger Entry")
//     var
//         GSTHSN_lRec: Record "GST HSN_Saffron";
//     begin
//         GSTHSN_lRec.Reset;
//         GSTHSN_lRec.SetCurrentkey(HSN, UQC);
//         GSTHSN_lRec.SetRange("GST Month", Month_gInt);
//         GSTHSN_lRec.SetRange("GST Year", Year_gInt);
//         GSTHSN_lRec.SetRange("GST Registration No.", DetailedGSTLedgerEntry_iRec."Location  Reg. No.");
//         GSTHSN_lRec.SetFilter(HSN, DetailedGSTLedgerEntry_iRec."HSN/SAC Code");
//         //  GSTHSN_lRec.SetRange(UQC, GSTRCommonFunction_gCdu.GetUOMDescription_gFnc(UOMCod_gCod));
//         GSTHSN_lRec.SetRange("GST %", Abs(GetGSTpercentage_lFnc(DetailedGSTLedgerEntry_iRec))); //T24136
//         if not GSTHSN_lRec.FindFirst then begin
//             GSTHSN_lRec.Init;
//             GSTHSN_lRec."GST Month" := Month_gInt;
//             GSTHSN_lRec."GST Year" := Year_gInt;
//             GSTHSN_lRec."GST Registration No." := DetailedGSTLedgerEntry_iRec."Location  Reg. No.";
//             GSTHSN_lRec.HSN := DetailedGSTLedgerEntry_iRec."HSN/SAC Code";
//             GSTHSN_lRec.Description := GetHSNDescription_gFnc(DetailedGSTLedgerEntry_iRec."GST Group Code", DetailedGSTLedgerEntry_iRec."HSN/SAC Code");
//             ItemRec.Reset();
//             ItemRec.SetRange("HSN/SAC Code", GSTHSN_lRec.HSN);
//             IF ItemRec.FindFirst() then
//                 GSTHSN_lRec.UQC := ItemRec."Base Unit of Measure";
//             //  GSTHSN_lRec.UQC := GSTRCommonFunction_gCdu.GetUOMDescription_gFnc(UOMCod_gCod);
//             GSTHSN_lRec."GST %" := Abs(GetGSTpercentage_lFnc(DetailedGSTLedgerEntry_iRec)); //T24136
//             GSTHSN_lRec.Insert;
//         end;

//         GSTHSN_lRec."Total Quantity" += (-1 * Abs(DetailedGSTLedgerEntry_iRec.Quantity));
//         GSTHSN_lRec."Total Value" += (-1 * Abs(DetailedGSTLedgerEntry_iRec."GST Base Amount"));
//         GSTHSN_lRec."Taxable Value" += (-1 * Abs(DetailedGSTLedgerEntry_iRec."GST Base Amount"));
//         if DetailedGSTLedgerEntry_iRec."GST Component Code" = 'IGST' then begin
//             GSTHSN_lRec."Integrated Tax Amount" += (-1 * Abs(DetailedGSTLedgerEntry_iRec."GST Amount"));
//             GSTHSN_lRec."Total Value" += (-1 * Abs(DetailedGSTLedgerEntry_iRec."GST Amount"));
//         end;
//         if DetailedGSTLedgerEntry_iRec."GST Component Code" = 'CGST' then begin
//             GSTHSN_lRec."Central Tax Amount" += (-1 * Abs(DetailedGSTLedgerEntry_iRec."GST Amount"));
//             GSTHSN_lRec."State/UT Tax Amount" += (-1 * Abs(DetailedGSTLedgerEntry_iRec."GST Amount"));
//             GSTHSN_lRec."Total Value" += (-2 * Abs(DetailedGSTLedgerEntry_iRec."GST Amount"));
//         end;
//         GSTHSN_lRec.Modify;
//     end;


//     procedure SetParameter_gFnc(Month_iInt: Integer; Year_iInt: Integer; GSTRegNo_iCod: Text; SetOutPutFile_iTxt: Text[250])
//     begin
//         Month_gInt := Month_iInt;
//         Year_gInt := Year_iInt;
//         GSTRegNo_gCod := GSTRegNo_iCod;
//         SetOutPutFile_gTxt := SetOutPutFile_iTxt;
//     end;


//     procedure IsDataExported_gFnc(): Boolean
//     begin
//         exit(DataExported_gBln);
//     end;


//     procedure GetHSNDescription_gFnc(GSTGroup_iCod: Code[20]; HSNCode_iCod: Code[8]): Text[50]
//     var
//         HSNSAC_lRec: Record "HSN/SAC";
//         Desc_lTxt: Text;
//     begin
//         if HSNSAC_lRec.Get(GSTGroup_iCod, HSNCode_iCod) then begin
//             //HSNSAC_lRec.TESTFIELD(Description);
//             Desc_lTxt := DelChr(HSNSAC_lRec.Description, '=', ','); ////T24136-N

//             exit(Desc_lTxt)
//         end else
//             exit('');
//     end;

//     local procedure GetGSTpercentage_lFnc(var DetailedGSTLE_iRec: Record "Detailed GST Ledger Entry"): Decimal
//     var
//         DetGST_lRec: Record "Detailed GST Ledger Entry";
//         GSTper_lDec: Decimal;
//         GSTSetup_lRec: Record "GST Setup";
//     begin
//         ////T24136-NS
//         if DetailedGSTLE_iRec."GST %" = 0 then begin
//             exit(0);
//             // GSTSetup_lRec.Reset;
//             // GSTSetup_lRec.SetCurrentkey("Effective Date");
//             // GSTSetup_lRec.SetRange("GST Group Code", DetailedGSTLE_iRec."GST Group Code");
//             // GSTSetup_lRec.SetFilter("Effective Date", '<=%1', DetailedGSTLE_iRec."Posting Date");
//             // GSTSetup_lRec.SetRange("GST Component Code", DetailedGSTLE_iRec."GST Component Code");
//             // if GSTSetup_lRec.FindLast then
//             //     exit(GSTSetup_lRec."GST Component %");
//         end;


//         if DetailedGSTLE_iRec."GST Component Code" = 'IGST' then
//             exit(DetailedGSTLE_iRec."GST %");

//         // GSTper_lDec := 0;
//         // DetGST_lRec.Reset;
//         // DetGST_lRec.SetRange("Entry Type", DetGST_lRec."entry type"::"Initial Entry");
//         // DetGST_lRec.SetRange("Document Type", DetailedGSTLE_iRec."Document Type");
//         // DetGST_lRec.SetRange("Document No.", DetailedGSTLE_iRec."Document No.");
//         // DetGST_lRec.SetRange("Document Line No.", DetailedGSTLE_iRec."Document Line No.");
//         // DetGST_lRec.SetFilter("GST Component Code", 'CGST');
//         // if DetGST_lRec.FindFirst then begin
//         //     GSTper_lDec += DetGST_lRec."GST %";
//         // end;

//         DetGST_lRec.Reset;
//         DetGST_lRec.SetRange("Entry Type", DetGST_lRec."entry type"::"Initial Entry");
//         DetGST_lRec.SetRange("Document Type", DetailedGSTLE_iRec."Document Type");
//         DetGST_lRec.SetRange("Document No.", DetailedGSTLE_iRec."Document No.");
//         DetGST_lRec.SetRange("Document Line No.", DetailedGSTLE_iRec."Document Line No.");
//         DetGST_lRec.SetFilter("GST Component Code", 'SGST');
//         if DetGST_lRec.FindFirst then begin
//             GSTper_lDec += DetGST_lRec."GST %";
//         end;

//         exit(GSTper_lDec);

//         ////T24136-NE
//     end;

//     local procedure MakeExcelDataInfo_lFnc()
//     begin
//         if ExcelSaveFilePath_gTxt <> '' then
//             exit;

//         TempExcelBuffer.SetUseInfoSheet;
//         TempExcelBuffer.AddInfoColumn(Format(Text005), false, true, false, false, '', TempExcelBuffer."cell type"::Text);
//         TempExcelBuffer.AddInfoColumn(COMPANYNAME, false, false, false, false, '', TempExcelBuffer."cell type"::Text);
//         TempExcelBuffer.NewRow;
//         TempExcelBuffer.AddInfoColumn(Format(Text007), false, true, false, false, '', TempExcelBuffer."cell type"::Text);
//         TempExcelBuffer.AddInfoColumn('GST HSN', false, false, false, false, '', TempExcelBuffer."cell type"::Text);
//         TempExcelBuffer.NewRow;
//         TempExcelBuffer.AddInfoColumn(Format(Text006), false, true, false, false, '', TempExcelBuffer."cell type"::Text);
//         TempExcelBuffer.AddInfoColumn(Report::"GST HSN", false, false, false, false, '', TempExcelBuffer."cell type"::Number);
//         TempExcelBuffer.NewRow;
//         TempExcelBuffer.AddInfoColumn(Format(Text008), false, true, false, false, '', TempExcelBuffer."cell type"::Text);
//         TempExcelBuffer.AddInfoColumn(UserId, false, false, false, false, '', TempExcelBuffer."cell type"::Text);
//         TempExcelBuffer.NewRow;
//         TempExcelBuffer.AddInfoColumn(Format(Text009), false, true, false, false, '', TempExcelBuffer."cell type"::Text);
//         TempExcelBuffer.AddInfoColumn(Today, false, false, false, false, '', TempExcelBuffer."cell type"::Date);
//         TempExcelBuffer.NewRow;
//         TempExcelBuffer.AddInfoColumn('Filters', false, true, false, false, '', TempExcelBuffer."cell type"::Text);
//         TempExcelBuffer.AddInfoColumn(CopyStr("Detailed GST Ledger Entry".GetFilters, 1, 250), false, false, false, false, '', TempExcelBuffer."cell type"::Text);

//         TempExcelBuffer.ClearNewRow;
//         MakeExcelDataHdr_lFnc;
//     end;

//     local procedure MakeExcelDataHdr_lFnc()
//     begin
//         TempExcelBuffer.NewRow;
//         TempExcelBuffer.AddColumn('HSN', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
//         TempExcelBuffer.AddColumn('Description', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
//         TempExcelBuffer.AddColumn('UQC', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
//         TempExcelBuffer.AddColumn('Total Quantity', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
//         TempExcelBuffer.AddColumn('Rate', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
//         TempExcelBuffer.AddColumn('Total Value', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
//         TempExcelBuffer.AddColumn('Taxable Value', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
//         TempExcelBuffer.AddColumn('Integrated Tax Amount', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
//         TempExcelBuffer.AddColumn('Central Tax Amount', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
//         TempExcelBuffer.AddColumn('State UT Tax Amount', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
//         TempExcelBuffer.AddColumn('Cess Amount', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
//     end;

//     local procedure MakeExcelDataBody_lFnc(GSTHSN_iRec: Record "GST HSN_Saffron")
//     var
//         BankAcc_lRec: Record "Bank Account";
//         Vendor_lRec: Record Vendor;
//         Customer_lRec: Record Customer;
//         FixedAsset_lRec: Record "Fixed Asset";
//         AmtDrLCY_lDec: Decimal;
//         AmtCrLCY_lDec: Decimal;
//     begin
//         // TempExcelBuffer.NewRow;
//         // TempExcelBuffer.AddColumn(GSTHSN_iRec.HSN, false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
//         // TempExcelBuffer.AddColumn(GSTHSN_iRec.Description, false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
//         // TempExcelBuffer.AddColumn(GSTHSN_iRec.UQC, false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
//         // TempExcelBuffer.AddColumn(GSTHSN_iRec."Total Quantity", false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
//         // TempExcelBuffer.AddColumn(GSTHSN_iRec."GST %", false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
//         // TempExcelBuffer.AddColumn(GSTHSN_iRec."Total Value", false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
//         // TempExcelBuffer.AddColumn("Detailed GST Ledger Entry"."GST Base Amount", false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
//         // TempExcelBuffer.AddColumn(GSTHSN_iRec."Integrated Tax Amount", false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
//         // TempExcelBuffer.AddColumn(GSTHSN_iRec."Central Tax Amount", false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
//         // TempExcelBuffer.AddColumn(GSTHSN_iRec."State/UT Tax Amount", false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);
//         // TempExcelBuffer.AddColumn(GSTHSN_iRec."Cess Amount", false, '', false, false, false, '#,##0.00', TempExcelBuffer."cell type"::Number);

//     end;

//     local procedure CreateExcelBook_lFnc()
//     begin
//         TempExcelBuffer.CreateNewBook('GST HSN');
//         TempExcelBuffer.WriteSheet('Data', CompanyName(), UserId());
//         TempExcelBuffer.CloseBook();
//         TempExcelBuffer.OpenExcel();

//         // if ExcelSaveFilePath_gTxt = '' then
//         //     TempExcelBuffer.CreateBookAndOpenExcel('', 'GST HSN', 'Data', COMPANYNAME, UserId)
//         // else begin
//         //     TempExcelBuffer.FixLocationCreateBookAndSaveExcelMailSharedFile_gFnc('GST HSN', 'Data', ExcelSaveFilePath_gTxt);
//         // end;
//     end;


//     procedure SetFixLocationExcelExport_gFnc(ExcelSaveFilePath_iTxt: Text)
//     begin
//         ExportToExcel_gBln := true;
//         ExcelSaveFilePath_gTxt := ExcelSaveFilePath_iTxt;
//     end;

//     procedure SetJustFillData_gFnc(Month_iInt: Integer; Year_iInt: Integer; GSTRegNo_iCod: Text; JustFillData_iBln: Boolean)
//     begin
//         Month_gInt := Month_iInt;
//         Year_gInt := Year_iInt;
//         GSTRegNo_gCod := GSTRegNo_iCod;
//         JustFillData_gBln := JustFillData_iBln;
//     end;

//     var
//         ItemRec: Record Item;

// }