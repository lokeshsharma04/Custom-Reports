Report 50136 "Cashier Variance Detailed"
{
    Caption = 'Cashier Variance Detailed';
    RDLCLayout = 'Report/CashierVarianceDetailed.rdl';
    DefaultLayout = RDLC;
    ApplicationArea = all;
    UsageCategory = Administration;

    dataset
    {
        dataitem("LSC Trans. Payment Entry"; "LSC Trans. Payment Entry")
        {
            // CalcFields = "Transaction Type";
            DataItemTableView = sorting("Staff ID", "Tender Decl. ID", "Tender Type", "Currency Code") where("Tender Type" = filter(<> 9));
            RequestFilterFields = Date;
            column(getfilter1; getfilter1)
            {
            }
            column(Amt; SafeAmt)
            {
            }
            column(Store; "Store No.")
            {

            }
            column(Staff; "Staff ID")
            {

            }
            column(Tender; TenderDesc)
            {

            }

            column(ExpAmt; ExpAmt)
            {
            }
            column(AdvOrd; AdvOrd)
            {
            }
            column(OpenFloatAmt; OpenFloatAmt)
            {

            }
            column(OrdBooking; OrdBooking)
            {
            }
            column(NonCashAdvOrd; NonCashAdvOrd)
            {
            }
            column(NonCashOrdBooking; NonCashOrdBooking)
            {
            }
            column(TenderType_TransPaymentEntry; "LSC Trans. Payment Entry"."Tender Type")
            {
            }
            column(DeclareAmt; -DeclareAmt)
            {
            }
            column(DeclareAmtCard_1; DeclareAmtCard)
            {
            }
            column(TenerType_Description; TenderType.Description)
            {
            }
            trigger OnPreDataItem();
            begin
                if gDate <> 0D then
                    "LSC Trans. Payment Entry".SetRange("LSC Trans. Payment Entry".Date, gDate);
                getfilter1 := "LSC Trans. Payment Entry".GetFilters;
                DATE1 := "LSC Trans. Payment Entry".GetRangeMin(Date);
                DATE2 := "LSC Trans. Payment Entry".GetRangemax(Date);
            end;

            trigger OnAfterGetRecord();
            var
                TransTenderDeclarEntry: Record 99001465;
                lHeader: Record 99001472;
                lTransExpense: Record 99001475;
                StaffStoreLink: Record 99001633;
            begin
                NonCashOrdBooking := 0; // Inserted by ForNAV
                NonCashAdvOrd := 0; // Inserted by ForNAV
                DeclareAmtCard := 0; // Inserted by ForNAV
                DeclareAmt := 0; // Inserted by ForNAV
                ExpAmt := 0; // Inserted by ForNAV
                AdvOrd := 0; // Inserted by ForNAV
                OrdBooking := 0; // Inserted by ForNAV
                SafeAmt := 0; // Inserted by ForNAV
                StoreFilter := "LSC Trans. Payment Entry"."Store No.";
                // IF "Trans. Payment Entry"."Receipt No." = '00P1009000020003' THEN
                //  MESSAGE('hi');
                if lStore.Get("LSC Trans. Payment Entry"."Store No.") then;
                SafeAmt := 0;
                DeclareAmtCard := 0;
                ExpAmt := 0;
                AdvOrd := 0;
                NonCashAdvOrd := 0;
                NonCashOrdBooking := 0;
                Clear(DifferenceAmt);
                Clear(OpenFloatAmt);
                Clear(RemoveFloatAmt);
                if StaffPayment.Get("LSC Trans. Payment Entry"."Staff ID") then;
                if TenderType.Get("LSC Trans. Payment Entry"."Store No.", "LSC Trans. Payment Entry"."Tender Type") then;
                TenderType.CalcFields(Payments);//PT
                //IF "Trans. Payment Entry"."Tender Type" = '9' THEN
                if TransactionHeader.Get("LSC Trans. Payment Entry"."Store No.", "LSC Trans. Payment Entry"."POS Terminal No.", "LSC Trans. Payment Entry"."Transaction No.") then;
                //Total Declaration as perComputer
                // TransactionHeader.CalcFields("Exchange Rate");//"Expenses Bill"
                if (TransactionHeader."Income/Exp. Amount" = 0) then begin
                    if "LSC Trans. Payment Entry"."Safe type" = "LSC Trans. Payment Entry"."safe type"::" " then begin
                        SafeAmt := "LSC Trans. Payment Entry"."Amount Tendered";
                        if ("LSC Trans. Payment Entry"."Tender Type" in ['3', '4', '50', '2', '11', '12', '23', '24', '5', '6', '14']) then
                            DeclareAmtCard := "LSC Trans. Payment Entry"."Amount Tendered"
                        else
                            DeclareAmtCard := 0;
                    end else
                        SafeAmt := 0;
                    // end else if TransactionHeader."Expenses Bill" then
                    //   ExpAmt:=TransactionHeader."Income/Exp. Amount";
                    // if (not TransactionHeader."Expenses Bill") then begin
                    if TransactionHeader."Income/Exp. Amount" < 0 then begin //Get Advance Payment detail
                        AdvOrd := "LSC Trans. Payment Entry"."Amount Tendered";
                        if "LSC Trans. Payment Entry"."Tender Type" <> '1' then
                            NonCashAdvOrd := "LSC Trans. Payment Entry"."Amount Tendered"
                        else
                            NonCashAdvOrd := 0;
                        //	MESSAGE(FORMAT(AdvOrd));
                        //	MESSAGE(TransactionHeader."Receipt No.");
                    end else
                        AdvOrd := 0;
                    if TransactionHeader."Income/Exp. Amount" > 0 then begin//Get Pending Order booking Details
                        OrdBooking := "LSC Trans. Payment Entry"."Amount Tendered";
                        if "LSC Trans. Payment Entry"."Tender Type" <> '1' then
                            NonCashOrdBooking := "LSC Trans. Payment Entry"."Amount Tendered"
                        else
                            NonCashOrdBooking := 0;
                    end else
                        OrdBooking := 0;
                    //  MESSAGE(FORMAT(OrdBooking));
                end;
                SelectLatestVersion;
                if StaffIDFilter <> "LSC Trans. Payment Entry"."Staff ID" then begin
                    DeclareAmt := 0;
                    //  IF "Trans. Payment Entry"."Staff ID" ='SATISH' THEN
                    //	MESSAGE('');
                    //  MESSAGE('S: '+StaffIDFilter+' ,TRPAY: '+"Trans. Payment Entry"."Staff ID");
                    StaffFilter.Reset;
                    StaffFilter.SetRange(ID, "LSC Trans. Payment Entry"."Staff ID");
                    StaffFilter.SetRange("Store Filter", "LSC Trans. Payment Entry"."Store No.");
                    StaffFilter.SetRange("Date Filter", DATE1, DATE2);
                    //StaffFilter.SetRange("Tender Decl. ID",'1');//"Tender Filter"
                    if StaffFilter.FindFirst then begin
                        //  StaffFilter.CalcFields("Tender Declaration");//"Tender Declare"PT
                        //DeclareAmt:=StaffFilter."Tender Declare";
                        if DeclareAmt = 0 then begin
                            StaffStoreLink.Reset;
                            StaffStoreLink.SetRange("Staff ID", "LSC Trans. Payment Entry"."Staff ID");
                            StaffStoreLink.SetRange("Store No.", "LSC Trans. Payment Entry"."Store No.");
                            //   StaffStoreLink.SetRange("Date Filter",DATE1,DATE2);
                            //   StaffStoreLink.SetRange("Tender Filter",'1');
                            if StaffStoreLink.FindFirst then begin
                                //StaffStoreLink.CalcFields("Tender Decl. ID");//"Tender Declare"
                                //DeclareAmt:=StaffStoreLink."Tender Declare";//Pt
                            end else
                                DeclareAmt := 0;
                        end;
                    end else
                        DeclareAmt := 0;
                    //MESSAGE(FORMAT(-DeclareAmt));
                end else
                    DeclareAmt := 0;
                if "Lsc Trans. Payment Entry"."Tender Type" <> '1' then
                    DeclareAmt := 0;
                //MESSAGE(StoreFilter);
                //  IF "Trans. Payment Entry"."Amount Tendered" < 0 THEN
                //	//IF "Trans. Payment Entry"."Safe type"="Trans. Payment Entry"."Safe type"::Safe THEN
                //	 IF "Trans. Payment Entry"."Transaction Type"="Trans. Payment Entry"."Transaction Type"::"Tender Decl." THEN//New add
                //	   IF ("Trans. Payment Entry"."Tender Type" <> '28') AND ("Trans. Payment Entry"."Tender Type" <> '4') THEN
                //		  IF NOT "Trans. Payment Entry"."Change Line" THEN
                //		   DeclareAmt:=("Trans. Payment Entry"."Amount Tendered")
                //		 ELSE
                //		   DeclareAmt:=0;
                //Total Declar as per User
                if not TransactionHeader."Sale Is Return Sale" then
                    if TransactionHeader."Transaction Type" = TransactionHeader."transaction type"::"Float Entry" then
                        OpenFloatAmt := "LSC Trans. Payment Entry"."Amount Tendered"
                    else
                        OpenFloatAmt := 0;
                if not TransactionHeader."Sale Is Return Sale" then
                    if TransactionHeader."Transaction Type" = TransactionHeader."transaction type"::"Remove Tender" then
                        RemoveFloatAmt := "LSC Trans. Payment Entry"."Amount Tendered"
                    else
                        RemoveFloatAmt := 0;
                POSFixedStartAmount.Reset;
                POSFixedStartAmount.SetRange("Store No.", "LSC Trans. Payment Entry"."Store No.");
                if POSFixedStartAmount.FindFirst then;
                POSFixedStartAmount.CalcFields("Tender Type Description");//"Tender Type Description"PT
                StaffIDFilter := "LSC Trans. Payment Entry"."Staff ID";
            end;

        }
        dataitem("LSC Trans. Inc./Exp. Entry"; "LSC Trans. Inc./Exp. Entry")
        {
            // column(ReportForNavId_1000000009; 1000000009) { } // Autogenerated by ForNav - Do not delete
            //column(ReportForNav_Table99001475; ReportForNavWriteDataItem('Table99001475',UnknownTable99001475)) {}
            dataitem("LSC Trans. Infocode Entry"; "LSC Trans. Infocode Entry")
            {
                DataItemLink = "Store No." = field("Store No."), "Transaction No." = field("Transaction No."), "POS Terminal No." = field("POS Terminal No."), Date = field(Date);
                column(ReportForNavId_1000000014; 1000000014) { } // Autogenerated by ForNav - Do not delete
                                                                  //column(ReportForNav_Table99001478; ReportForNavWriteDataItem('Table99001478',UnknownTable99001478)) {}
                trigger OnPreDataItem();
                begin
                    //ReportForNav.OnPreDataItem('Table99001478',UnknownTable99001478);
                end;
            }
            trigger OnPreDataItem();
            begin
                "LSC Trans. Inc./Exp. Entry".SetRange(Date, DATE1, DATE2);
                "LSC Trans. Inc./Exp. Entry".SetRange("Store No.", "LSC Trans. Payment Entry"."Store No.");
                //ReportForNav.OnPreDataItem('Table99001475',UnknownTable99001475);
            end;

            trigger OnAfterGetRecord();
            begin
                if IncomeExpenseAccount.Get("LSC Trans. Inc./Exp. Entry"."Store No.", "LSC Trans. Inc./Exp. Entry"."No.") then;
            end;

        }
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            DataItemTableView = order(ascending) where("Document Type" = filter(Payment | Refund), "External Document No." = filter(<> ''));
            column(ReportForNavId_1000000025; 1000000025) { } // Autogenerated by ForNav - Do not delete
                                                              //	column(ReportForNav_CustLedgerEntry; ReportForNavWriteDataItem('CustLedgerEntry',"Cust. Ledger Entry")) {}
            trigger OnPreDataItem();
            begin
                //"Cust. Ledger Entry".SETRANGE("Cust. Ledger Entry"."Posting Date","Trans. Payment Entry".Date);
                "Cust. Ledger Entry".SetRange("Cust. Ledger Entry"."Posting Date", DATE1, DATE2);
                "Cust. Ledger Entry".SetRange("Cust. Ledger Entry"."Location Code", "LSC Trans. Payment Entry"."Store No.");
                //ReportForNav.OnPreDataItem('CustLedgerEntry',"Cust. Ledger Entry");
            end;

            trigger OnAfterGetRecord();
            var
                User: Record User;
            begin
                Clear(name);
                staff.Reset;
                //staff.SETRANGE(staff.ID,"Cust. Ledger Entry"."Staff ID"); HIM 19.06.18
                if staff.FindFirst then
                    name := staff."First Name"
                else begin
                    User.Reset;
                    User.SetRange("User Name", "Cust. Ledger Entry"."User ID");
                    if User.FindFirst then
                        name := User."Full Name";
                end;
                cust.Reset;
                cust.SetRange(cust."Document Type", cust."document type"::Payment);
                cust.SetRange(cust."Posting Date", DATE1, DATE2);
                if cust.FindSet then begin
                    Clear(PaymentAmount);
                    repeat
                        cust.CalcFields(cust.Amount);
                        PaymentAmount += cust.Amount;
                    until cust.Next = 0;
                end;
                cust.Reset;
                cust.SetRange(cust."Document Type", cust."document type"::Invoice);
                cust.SetRange(cust."Posting Date", DATE1, DATE2);
                if cust.FindSet then begin
                    Clear(RefundCard);
                    repeat
                        cust.CalcFields(cust.Amount);
                        RefundCard += cust.Amount;
                    until cust.Next = 0;
                end;
                TenderType1.Reset;
                if TenderType1.Get("Cust. Ledger Entry"."Location Code", "Cust. Ledger Entry"."Journal Batch Name") then
                    TenderDesc := TenderType1.Description;
                Clear(OBDecAmt);
                /*  //HIM 19.06.18
				TenderDeclarationPostedSO.RESET;
				TenderDeclarationPostedSO.SETCURRENTKEY("No.","Line No.",Description);
				TenderDeclarationPostedSO.SETRANGE("No.","Cust. Ledger Entry"."Location Code");
				TenderDeclarationPostedSO.SETRANGE("Line No.","Cust. Ledger Entry"."Posting Date");
				TenderDeclarationPostedSO.SETRANGE(Description,"Cust. Ledger Entry"."User ID");
				//TenderDeclarationPostedSO.SETRANGE(Code,"Cust. Ledger Entry"."Journal Batch Name");
				IF TenderDeclarationPostedSO.FINDSET THEN REPEAT
				  OBDecAmt+=TenderDeclarationPostedSO."Shortcut Dimension 1 Code";
				UNTIL TenderDeclarationPostedSO.NEXT=0;
				//MESSAGE('%1',OBDecAmt);
				*/  //HIM 19.06.18

            end;

            trigger OnPostDataItem();
            var
            //TenderDeclarationPostedSO: Record 50008;
            begin
            end;

        }
        dataitem("LSC Trans. Sales Entry"; "LSC Trans. Sales Entry")
        {
            column(ReportForNavId_1000000040; 1000000040) { } // Autogenerated by ForNav - Do not delete
                                                              //column(ReportForNav_Table99001473; ReportForNavWriteDataItem('Table99001473',UnknownTable99001473)) {}
                                                              // column(SGST_TransSalesEntry; "LSC Trans. Sales Entry"."SGST %")
                                                              // {
                                                              // }
                                                              // column(SGSTAmount_TransSalesEntry; -1*"LSC Trans. Sales Entry"."SGST Amount")
                                                              // {
                                                              // }
                                                              // column(CGST_TransSalesEntry; "LSC Trans. Sales Entry"."CGST %")
                                                              // {
                                                              // }
                                                              // column(CGSTAmount_TransSalesEntry; -1*"Trans. Sales Entry"."CGST Amount")
                                                              // {
                                                              // }
                                                              // column(CESS_TransSalesEntry; "Trans. Sales Entry"."CESS %")
                                                              // {
                                                              // }
                                                              // column(CESSAmount_TransSalesEntry; -1*"Trans. Sales Entry"."CESS Amount")
                                                              // {
                                                              // }
                                                              // column(IGST_TransSalesEntry; "Trans. Sales Entry"."IGST %")
                                                              // {
                                                              // }
                                                              // column(IGSTAmount_TransSalesEntry; -1*"Trans. Sales Entry"."IGST Amount")
                                                              // {
                                                              // }
                                                              // column(GSTBase; -1*"Trans. Sales Entry"."GST Base Amount")
                                                              // {
                                                              // }
                                                              // column(GSTJurisdictionType_TransSalesEntry; "LSC Trans. Sales Entry"."GST Jurisdiction Type")
                                                              // {
                                                              // }
            trigger OnPreDataItem();
            begin
                "LSC Trans. Sales Entry".SetRange("LSC Trans. Sales Entry".Date, "LSC Trans. Payment Entry".Date);
                //ReportForNav.OnPreDataItem('Table99001473',UnknownTable99001473);
            end;

        }
    }

    requestpage
    {


        SaveValues = false;
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(ForNavOpenDesigner; ReportForNavOpenDesigner)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Design';
                        Visible = ReportForNavAllowDesign;
                    }
                }
            }
        }

        actions
        {
        }
    }

    trigger OnPreReport()
    begin
        Clear(RefundCard);
        Clear(PaymentAmount);
        Clear(name);
        //;ReportsForNavPre;

    end;

    var
        StaffPayment: Record 99001461;
        TenderType: Record 99001462;
        SafeAmt: Decimal;
        DeclareAmt: Decimal;
        DeclareAmtCard: Decimal;
        TransactionHeader: Record 99001472;
        POSFixedStartAmount: Record 99001629;
        IncomeExpenseAccount: Record 99001476;
        getfilter1: Text[100];
        new: Decimal;
        RefundHand: Decimal;
        RefundCard: Decimal;
        cUSTR: Record "Cust. Ledger Entry";
        DATE1: Date;
        DATE2: Date;
        RecSalesHeader: Record "Sales Header";
        RecSalesInvHeader: Record "Sales Invoice Header";
        Status: Text;
        PaymentAmount: Decimal;
        CashierId: Text[50];
        amt: Decimal;
        cust: Record "Cust. Ledger Entry";
        staff: Record 99001461;
        name: Text[50];
        StoreFilter: Code[10];
        TenderType1: Record 99001462;
        TenderDesc: Text;
        Remark: Text;
        x: Decimal;
        DifferenceAmt: Decimal;
        OBDecAmt: Decimal;
        JournalBatchTender: Code[20];
        OpenFloatAmt: Decimal;
        RemoveFloatAmt: Decimal;
        StaffFilter: Record 99001461;
        StaffIDFilter: Code[20];
        ExpAmt: Decimal;
        gDate: Date;
        AdvOrd: Decimal;
        OrdBooking: Decimal;
        lStore: Record 99001470;
        NonCashAdvOrd: Decimal;
        NonCashOrdBooking: Decimal;

    procedure GetDetails(lDate: Date)
    begin
        gDate := lDate;
    end;

    trigger OnInitReport();
    begin
        //;ReportsForNavInit;
    end;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //ReportForNav: Codeunit "ForNAV Report Management";
        ReportForNavTotalsCausedBy: Integer;
        ReportForNavInitialized: Boolean;
        ReportForNavShowOutput: Boolean;
        ReportForNavOpenDesigner: Boolean;
        [InDataSet]
        ReportForNavAllowDesign: Boolean;

    // local procedure ReportsForNavInit() var id: Integer; begin Evaluate(id, CopyStr(CurrReport.ObjectId(false), StrPos(CurrReport.ObjectId(false), ' ') + 1)); ReportForNav.OnInit(id, ReportForNavAllowDesign); end;
    // local procedure ReportsForNavPre() begin if ReportForNav.LaunchDesigner(ReportForNavOpenDesigner) then CurrReport.Quit(); end;
    // local procedure ReportForNavSetTotalsCausedBy(value : Integer) begin ReportForNavTotalsCausedBy := value; end;
    // local procedure ReportForNavSetShowOutput(value : Boolean) begin ReportForNavShowOutput := value; end;
    // local procedure ReportForNavInit(jsonObject : JsonObject) begin ReportForNav.Init(jsonObject, CurrReport.ObjectId); end;
    // local procedure ReportForNavWriteDataItem(dataItemId: Text; rec : Variant) : Text
    // var
    // 	values: Text;
    // 	jsonObject: JsonObject;
    // 	currLanguage: Integer;
    // begin
    // 	if not ReportForNavInitialized then begin
    // 		ReportForNavInit(jsonObject);
    // 		ReportForNavInitialized := true;
    // 	end;

    // 	case (dataItemId) of
    // 		'Table99001475':
    // 			begin
    // 				currLanguage := GlobalLanguage; GlobalLanguage := 1033; jsonObject.Add('DataItem$Table99001475$CurrentKey$Text',UnknownTable99001475.CurrentKey); GlobalLanguage := currLanguage;
    // 			end;
    // 		'Table99001478':
    // 			begin
    // 				currLanguage := GlobalLanguage; GlobalLanguage := 1033; jsonObject.Add('DataItem$Table99001478$CurrentKey$Text',UnknownTable99001478.CurrentKey); GlobalLanguage := currLanguage;
    // 			end;
    // 		'CustLedgerEntry':
    // 			begin
    // 				currLanguage := GlobalLanguage; GlobalLanguage := 1033; jsonObject.Add('DataItem$CustLedgerEntry$CurrentKey$Text',"Cust. Ledger Entry".CurrentKey); GlobalLanguage := currLanguage;
    // 			end;
    // 		'Table99001473':
    // 			begin
    // 				currLanguage := GlobalLanguage; GlobalLanguage := 1033; jsonObject.Add('DataItem$Table99001473$CurrentKey$Text',UnknownTable99001473.CurrentKey); GlobalLanguage := currLanguage;
    // 			end;
    // 	end;
    // 	ReportForNav.AddDataItemValues(jsonObject,dataItemId,rec);
    // 	jsonObject.WriteTo(values);
    // 	exit(values);
    // end;
    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
