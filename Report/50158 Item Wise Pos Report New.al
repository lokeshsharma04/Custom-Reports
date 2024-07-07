// report 50158 "Item Wise Pos Report"
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     Caption = 'Item  Wise Sales Report New';
//     RDLCLayout = 'Report/salesReport1.rdl';
//     //DefaultRenderingLayout = LayoutName;

//     dataset
//     {
//         dataitem("LSC Trans. Sales Entry"; "LSC Trans. Sales Entry")
//         {
//             RequestFilterFields = Date, "Store No.";

//             column(Store_No_; "Store No.")
//             {

//             }
//             column(Date; Date)
//             {

//             }
//             column(Receipt_No_; "Receipt No.")
//             {

//             }
//             column(Item_No_; "Item No.")
//             {

//             }
//             column(CustName; CustName)
//             { }
//             column(GstregistNo; GstregistNo)
//             { }
//             column(LSCIN_HSN_SAC_Code; "LSCIN HSN/SAC Code")
//             {

//             }
//             column(LSCIN_GST_Group_Code; "LSCIN GST Group Code")
//             {

//             }
//             column(Quantity; -Quantity)
//             {

//             }
//             column(Unit_of_Measure; "Unit of Measure")
//             {

//             }
//             column(Price; Price)
//             {

//             }

//             column(Discount_Amount; "Discount Amount")
//             {

//             }
//             column(tendortype; Transacton_Hedaer_rec."Tender Type")
//             {

//             }
//             column(posRceeiptNo; TH_rec."Pos Receipt No.")
//             {

//             }
//             column(CGST_LSC; CGST_LSC)
//             {

//             }
//             column(SGST_LSC; SGST_LSC)
//             {

//             }
//             column(IGST_LSC; IGST_LSC)
//             {

//             }
//             column(Net_Amount; -"Net Amount")
//             {

//             }
//             column(ItemNameLSC; item.Description)
//             {

//             }
//             column(GROSSAmt; TH_rec."Gross Amount")
//             {

//             }
//             column(TENDERNAME; TTS.Description)
//             {

//             }
//             column(ComInfo; ComInfo.Name)
//             { }
//             column(storeName; StoreRec.Name)
//             { }
//             trigger OnPreDataItem()
//             var
//             begin
//                 "LSC Trans. Sales Entry".SetRange(Date, StartDate, EndDate);
//                 "LSC Trans. Sales Entry".SetFilter("Store No.", StoreNo);
//                 ComInfo.get()
//             end;

//             trigger OnAfterGetRecord()
//             var
//                 myInt: Integer;
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
//                 TH_rec.SetRange("POS Terminal No.", "LSC Trans. Sales Entry"."POS Terminal No.");
//                 TH_rec.SetRange("Store No.", "LSC Trans. Sales Entry"."Store No.");
//                 TH_rec.SetRange("Transaction No.", "LSC Trans. Sales Entry"."Transaction No.");

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
//                 Clear(GstregistNo);
//                 LscPosTransHeader.Reset();
//                 LscPosTransHeader.SetRange("Receipt No.", "LSC Trans. Sales Entry"."Receipt No.");
//                 LscPosTransHeader.SetRange("POS Terminal No.", "LSC Trans. Sales Entry"."POS Terminal No.");
//                 LscPosTransHeader.SetRange("Store No.", "LSC Trans. Sales Entry"."Store No.");
//                 LscPosTransHeader.SetRange("Transaction No.", "LSC Trans. Sales Entry"."Transaction No.");
//                 if LscPosTransHeader.FindFirst() then begin

//                     Cust.Reset();
//                     Cust.SetRange("No.", LscPosTransHeader."Customer No.");
//                     if Cust.FindFirst() then begin
//                         //If CustName = '' then begin
//                         CustName := Cust.Name;
//                         GstregistNo := cust."GST Registration No.";
//                     end else
//                         CustName := 'Pos Customer';
//                 end;
//                 Clear(StoreRec);
//                 StoreRec.Get("Store No.")


//             end;

//             // end;
//         }

//         // dataitem("Sales Invoice Line"; "Sales Invoice Line")
//         // {
//         //     RequestFilterFields = "Posting Date", "Location Code";

//         //     column(Posting_Date; "Posting Date")
//         //     {

//         //     }
//         //     column(sdate; "Sales Invoice Line"."Posting Date")
//         //     {

//         //     }
//         //     column(edate; "Sales Invoice Line"."Posting Date")
//         //     {

//         //     }
//         //     column(Document_No_; "Document No.")
//         //     {

//         //     }
//         //     column(Sell_to_Customer_No_; "Sell-to Customer No.")
//         //     {

//         //     }
//         //     column(No_; "No.")
//         //     {

//         //     }
//         //     column(Description; Description)
//         //     {

//         //     }
//         //     column(HSN_SAC_Code; "HSN/SAC Code")

//         //     {

//         //     }
//         //     column(Quantity2; Quantity)
//         //     {

//         //     }
//         //     column(Unit_of_Measure2; "Unit of Measure")
//         //     {

//         //     }
//         //     column(Unit_Price; "Unit Price")
//         //     {

//         //     }
//         //     column(Line_Discount_Amount; "Line Discount Amount")
//         //     {

//         //     }
//         //     column(Line_Amount; "Line Amount")
//         //     {

//         //     }
//         //     column(GST_Group_Code; "GST Group Code")
//         //     {

//         //     }
//         //     column(IGSTAmtTol; IGSTAmtTol)
//         //     {

//         //     }
//         //     column(SGSTAmtTol; SGSTAmtTol)
//         //     {
//         //     }
//         //     column(CGSTAmtTol; CGSTAmtTol)
//         //     {
//         //     }
//         //     column(CustGST; Cust."GST Registration No.")
//         //     {
//         //     }
//         //     column(Cust; Cust.Name)
//         //     {

//         //     }
//         //     column(Location_Code; "Location Code")
//         //     {

//         //     }
//         //     column(LocationName; LocationRec.Name)
//         //     { }

//         //     trigger OnPreDataItem()
//         //     var
//         //     begin
//         //         SetRange("Posting Date", StartDate, EndDate);
//         //         SetFilter("Location Code", StoreNo);
//         //         ComInfo.get();
//         //     end;

//         //     trigger OnAfterGetRecord()
//         //     var
//         //         myInt: Integer;
//         //     begin

//         //         // If Quantity > 0 then CurrReport.Skip();    Rohit chaudhary
//         //         Clear(LocationRec);
//         //         LocationRec.Get("Location Code");


//         //         CGSTAmtTol := 0;
//         //         DetailedLedgerEntry.RESET;
//         //         DetailedLedgerEntry.SETRANGE("Transaction Type", DetailedLedgerEntry."Transaction Type"::Sales);
//         //         DetailedLedgerEntry.SetRange("Entry Type", DetailedLedgerEntry."Entry Type"::"Initial Entry");
//         //         DetailedLedgerEntry.SETRANGE(DetailedLedgerEntry."Document No.", "Document No.");
//         //         DetailedLedgerEntry.SetRange("Document Line No.", "Sales Invoice Line"."Line No.");
//         //         DetailedLedgerEntry.SETRANGE(DetailedLedgerEntry."GST Component Code", 'CGST');
//         //         DetailedLedgerEntry.CALCSUMS(DetailedLedgerEntry."GST Amount");
//         //         CGSTAmtTol := ABS(DetailedLedgerEntry."GST Amount");

//         //         IGSTAmtTol := 0;
//         //         DetailedLedgerEntry.RESET;
//         //         DetailedLedgerEntry.SETRANGE("Transaction Type", DetailedLedgerEntry."Transaction Type"::Sales);
//         //         DetailedLedgerEntry.SetRange("Entry Type", DetailedLedgerEntry."Entry Type"::"Initial Entry");
//         //         DetailedLedgerEntry.SETRANGE(DetailedLedgerEntry."Document No.", "Document No.");
//         //         DetailedLedgerEntry.SetRange("Document Line No.", "Sales Invoice Line"."Line No.");

//         //         DetailedLedgerEntry.SETRANGE(DetailedLedgerEntry."GST Component Code", 'IGST');
//         //         DetailedLedgerEntry.CALCSUMS(DetailedLedgerEntry."GST Amount");
//         //         IGSTAmtTol := ABS(DetailedLedgerEntry."GST Amount");

//         //         SGSTAmtTol := 0;
//         //         DetailedLedgerEntry.RESET;
//         //         DetailedLedgerEntry.SETRANGE("Transaction Type", DetailedLedgerEntry."Transaction Type"::Sales);
//         //         DetailedLedgerEntry.SetRange("Entry Type", DetailedLedgerEntry."Entry Type"::"Initial Entry");

//         //         DetailedLedgerEntry.SETRANGE(DetailedLedgerEntry."Document No.", "Document No.");
//         //         DetailedLedgerEntry.SetRange("Document Line No.", "Sales Invoice Line"."Line No.");

//         //         DetailedLedgerEntry.SETRANGE(DetailedLedgerEntry."GST Component Code", 'SGST');
//         //         DetailedLedgerEntry.CALCSUMS(DetailedLedgerEntry."GST Amount");
//         //         SGSTAmtTol := ABS(DetailedLedgerEntry."GST Amount");

//         //         Cust.Reset();
//         //         Cust.SetRange("No.", "Sales Invoice Line"."Sell-to Customer No.");
//         //         if Cust.FindFirst() then;
//         //     end;

//         // }

//     }

//     requestpage
//     {
//         layout
//         {
//             area(Content)
//             {
//                 group(GroupName)
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
//                         TableRelation = "LSC Store";
//                     }
//                 }

//             }
//         }

//         actions
//         {
//             area(processing)
//             {
//                 action(ActionName)
//                 {
//                     ApplicationArea = All;

//                 }
//             }
//         }
//     }


//     // rendering
//     // {
//     //     layout(LayoutName)
//     //     {
//     //         Type = RDLC;
//     //         LayoutFile = 'mylayout.rdl';
//     //     }
//     // }

//     // local procedure MyProcedure(localGST : Code[15]) : Code[10]
//     //  var
//     //     myInt: Integer;
//     //  begin
//     //     EXIT(COPYSTR(localGST,3,10));
//     //  end;
//     var
//         DetailedLedgerEntry: Record "Detailed GST Ledger Entry";
//         Transacton_Hedaer_rec: Record "LSC Trans. Payment Entry";
//         TH_rec: Record "LSC Transaction Header";
//         IGST_LSC: Decimal;
//         CGST_LSC: Decimal;
//         SGST_LSC: Decimal;
//         CGSTAmtTol: Decimal;
//         SGSTAmtTol: Decimal;
//         IGSTAmtTol: Decimal;
//         Cust: Record Customer;
//         CustName: Text[100];
//         GstregistNo: Code[20];
//         LscPosTransHeader: Record "LSC Transaction Header";
//         ComInfo: Record "Company Information";
//         item: Record Item;
//         LocationRec: Record Location;

//         TTS: Record "LSC Tender Type Setup";
//         TENDERNAME: TEXT;
//         StoreRec: Record "LSC Store";
//         LscstoreName: Text[50];
//         StoreNo: Code[20];
//         GstgroupCodeRec: Decimal;
//         GSTAMOUNT: Decimal;
//         GstgroupRec: Record "GST Group";

//         StartDate: Date;
//         EndDate: Date;
//     //dhd: Record "LSCIN Tax Transaction Value"




// }




