// report 50157 "Item  Order Excel Report"
// {
//     ApplicationArea = all;
//     UsageCategory = Administration;
//     ProcessingOnly = true;
//     Caption = 'Item Wise sales Report Excel';
//     ExecutionTimeout = '3';

//     dataset
//     {
//         dataitem("LSC Trans. Sales Entry"; "LSC Trans. Sales Entry")
//         {
//             MaxIteration = 500000;
//             trigger OnPreDataItem()
//             var
//                 myInt: Integer;
//             begin
//                 "LSC Trans. Sales Entry".SetRange(Date, StartDate, EndDate);
//                 "LSC Trans. Sales Entry".SetFilter("Store No.", StoreNo);
//                 TempExcelBuffer.Reset();
//                 TempExcelBuffer.DeleteAll();
//                 TempExcelBuffer.AddColumn('Booking', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn('Pay Mode', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn('Store', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn('Store Name', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn('Invoice Date', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn('Receipt ID', FALSE, '', true, false, FALSE, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn('Invoice No.', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn('Party Name', FALSE, '', true, false, FALSE, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn('Item No.', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn('Item Name', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn('HSN/SAC', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn('Party GST NO.', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn('Qty.', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn('UOM', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn('Rate', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn('Basic Amount', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn('Discount Amount', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn('Tax Rate', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn('CGST', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn('SGST', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn('IGST', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn('Invoice Amount', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);

//             end;

//             trigger OnAfterGetRecord()
//             begin
//                 If Quantity = 0 then CurrReport.Skip();

//                 Transacton_Hedaer_rec.Reset();
//                 Transacton_Hedaer_rec.SetRange("Transaction No.", "LSC Trans. Sales Entry"."Transaction No.");
//                 Transacton_Hedaer_rec.SetRange("POS Terminal No.", "LSC Trans. Sales Entry"."POS Terminal No.");
//                 if Transacton_Hedaer_rec.FindFirst() then;
//                 TTS.Reset();
//                 TTS.SetRange(Code, Transacton_Hedaer_rec."Tender Type");
//                 If TTS.FindFirst() then;

//                 TH_rec.Reset();
//                 TH_rec.SetRange("Receipt No.", "LSC Trans. Sales Entry"."Receipt No.");
//                 if TH_rec.FindFirst() then;

//                 Clear(CGST_LSC);
//                 Clear(IGST_LSC);
//                 Clear(SGST_LSC);
//                 Clear(GstgroupCodeRec);//PT FBTS Start(26/04/23 Start)
//                 GstgroupRec.Reset();
//                 GstgroupRec.SetRange(Code, "LSC Trans. Sales Entry"."LSCIN GST Group Code");
//                 if GstgroupRec.FindFirst() then
//                     GstgroupCodeRec := GstgroupRec."GST Rate";
//                 if "LSC Trans. Sales Entry"."LSCIN GST Amount" = 0 then begin
//                     GSTAMOUNT := "LSC Trans. Sales Entry"."Net Amount" * GstgroupCodeRec / 100;
//                     CGST_LSC := -GSTAMOUNT / 2;
//                     SGST_LSC := -GSTAMOUNT / 2;
//                 end else
//                     if "LSCIN GST Jurisdiction Type" = "LSCIN GST Jurisdiction Type"::Interstate then
//                         IGST_LSC := -"LSCIN GST Amount"
//                     else begin
//                         CGST_LSC := -"LSCIN GST Amount" / 2;
//                         SGST_LSC := -"LSCIN GST Amount" / 2;
//                     end;////PT FBTS Start(26/04/23 END)
//                 item.Reset();
//                 item.SetRange("No.", "LSC Trans. Sales Entry"."Item No.");
//                 if item.FindFirst() then;

//                 LscPosTransHeader.Reset();
//                 LscPosTransHeader.SetRange("Receipt No.", "LSC Trans. Sales Entry"."Receipt No.");
//                 if LscPosTransHeader.FindFirst() then begin
//                     Clear(CustName);
//                     Clear(CustGstRegistrationNo);
//                     Cust.Reset();
//                     Cust.SetRange("No.", LscPosTransHeader."Customer No.");
//                     if Cust.FindFirst() then begin
//                         //If CustName = '' then begin
//                         CustName := Cust.Name;
//                         CustGstRegistrationNo := Cust."GST Registration No.";

//                     end else
//                         CustName := 'Pos Customer';
//                 end;
//                 Clear(StoreRec);
//                 StoreRec.Get("Store No.");

//                 ////////////////
//                 TempExcelBuffer.NewRow();
//                 TempExcelBuffer.AddColumn('Pos', false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn(TTS.Description, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn("Store No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn(StoreRec.Name, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn("LSC Trans. Sales Entry".Date, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Date);
//                 TempExcelBuffer.AddColumn("LSC Trans. Sales Entry"."Receipt No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn(TH_rec."Pos Receipt No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn(CustName, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn("LSC Trans. Sales Entry"."Item No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn(item.Description, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn("LSC Trans. Sales Entry"."LSCIN HSN/SAC Code", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn(CustGstRegistrationNo, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn(ABS(Quantity), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn("Unit of Measure", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn(ABS(Price), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn(ABS(Quantity * Price), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn("Discount Amount", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn("LSC Trans. Sales Entry"."LSCIN GST Group Code", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn(CGST_LSC, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn(SGST_LSC, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn(IGST_LSC, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 TempExcelBuffer.AddColumn(Abs("Net Amount") + Abs((CGST_LSC + SGST_LSC + IGST_LSC)), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 // TempExcelBuffer.AddColumn("Discount Amount", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//                 // TempExcelBuffer.AddColumn("Discount Amount", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

//             end;

//             trigger OnPostDataItem()
//             begin
//                 TempExcelBuffer.CreateNewBook(StudentList);
//                 TempExcelBuffer.WriteSheet(StudentList, CompanyName, UserId);
//                 TempExcelBuffer.CloseBook();
//                 TempExcelBuffer.SetFriendlyFilename(StrSubstNo(ExcelFileName, CurrentDateTime, UserId));
//                 TempExcelBuffer.OpenExcel();
//             end;

//         }

//     }
//     requestpage
//     {
//         SaveValues = true;
//         layout
//         {
//             area(Content)
//             {
//                 group(Options)
//                 {
//                     field(StartDate; StartDate)
//                     {
//                         ApplicationArea = All;

//                     }
//                     field(EndDate; EndDate)
//                     {
//                         ApplicationArea = all;
//                     }
//                     field(StoreNo; StoreNo)
//                     {
//                         ApplicationArea = all;
//                         TableRelation = Location;
//                     }
//                 }
//             }
//         }
//     }
//     var
//         item: Record Item;
//         TempExcelBuffer: Record "Excel Buffer" temporary;
//         // AcademicYear: code[40];
//         // PurchaseHeader: Record "Purchase Header";
//         // PurchaseLine: Record "Purchase Line";
//         // SalesLine: Record "Sales Line";
//         // PurchAmtWithoutTax: Decimal;
//         // SalesLinewithTax: Decimal;
//         StudentList: Label 'Sale Order Excel Report';
//         ExcelFileName: Label 'Sale Order Excel Report';
//         DetailedLedgerEntry: Record "Detailed GST Ledger Entry";
//         Transacton_Hedaer_rec: Record "LSC Trans. Payment Entry";
//         TH_rec: Record "LSC Transaction Header";
//         IGST_LSC: Decimal;
//         CGST_LSC: Decimal;
//         SGST_LSC: Decimal;
//         CGSTAmtTol: Decimal;
//         SGSTAmtTol: Decimal;
//         IGSTAmtTol: Decimal;
//         StoreNo: Code[20];
//         Cust: Record Customer;
//         CustName: Text[100];
//         CustGstRegistrationNo: Text[20];
//         LscPosTransHeader: Record "LSC Transaction Header";
//         ComInfo: Record "Company Information";
//         // item: Record Item;
//         TTS: Record "LSC Tender Type Setup";
//         TENDERNAME: TEXT;
//         GstgroupCodeRec: Decimal;
//         StoreRec: Record "LSC Store";
//         GSTAMOUNT: Decimal;
//         GstgroupRec: Record "GST Group";

//         StartDate: Date;
//         EndDate: Date;
// }