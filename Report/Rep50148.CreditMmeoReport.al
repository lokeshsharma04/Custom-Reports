report 50148 "Credit Note Report"
{
    DefaultLayout = RDLC;
    // ApplicationArea = all; 
    PreviewMode = PrintLayout;
    RDLCLayout = 'Layout/Credit Note Report.rdl';


    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Cr.Memo Header")
        {
            RequestFilterFields = "No.";
            column(BankName_; CompanyInfo."Bank Name")
            {
            }
            column(roundoff; roundoff)
            {

            }
            column(Bill_to_Conta; "Bill-to Contact No.")
            {

            }
            column(QrCode; EinvoiceETransLog."Einvoice QR Code")
            {

            }
            column(External_Document_No_; "External Document No.")
            { }
            column(Remaining_Amount; "Remaining Amount")
            {

            }
            column(IRN_Number; '')// "IRN Number")
            {

            }
            column(IRNNo; EinvoiceETransLogRec."IRN No.")
            {
            }//PT
            column(EinvoiceQRCode; EinvoiceETransLogRec."Einvoice QR Code")
            {
            }//PT
            column(Work_Description; GetWorkDescription())
            {
            }
            // column(CGSTGroupAmt1; ABS(CGSTGroupAmt[1]))
            // {
            // }
            // column(CGSTGroupAmt2; ABS(CGSTGroupAmt[2]))
            // {
            // }
            // column(CGSTGroupAmt3; ABS(CGSTGroupAmt[3]))
            // {
            // }

            column(timex; timex)
            {

            }
            column(TXT; TXT)
            {
            }
            column(PrintCopyName; '')
            {
            }
            column(fassiNo; fassiNo)
            {

            }
            column(PosDate_SalesInHeader; (Format("Sales Invoice Header"."Posting Date", 0, '<Day,2>-<Month Text,3>-<Year4>')))
            {
            }

            column(IGSTGroupAmt4; ABS(IGSTGroupAmt[4]))
            {
            }
            column(FinalAmount; FinalAmount)
            {
            }
            column(BankAcc; CompanyInfo."Bank Account No.")
            {
            }
            column(BankBranch; CompanyInfo."Bank Branch No.")
            {
            }
            column(BankIBAN; CompanyInfo.IBAN)
            {
            }

            column(SelltoCustomerName_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to Customer Name")
            {
            }
            column(GSTIN; CompanyInfo."GST Registration No.")
            {
            }
            column(TotalAmt; "Sales Invoice Header"."Amount Including VAT")
            {
            }
            column(Applies_to_Doc__No_; "Applies-to Doc. No.")
            {

            }

            column(TotalAmt1; Round("Sales Invoice Header"."Amount Including VAT", 1))
            {
            }


            column(CompanyInfo_Address; CompanyInfo.Address + '  ' + CompanyInfo."Address 2")
            {
            }
            column(CompInfo_City_Pstcode; CompanyInfo.City + '-' + CompanyInfo."Post Code")
            {
            }
            column(CompInfo_Ph; CompanyInfo."Phone No.")
            {
            }
            column(CompInfo_Email; CompanyInfo."E-Mail")
            {

            }
            column(Ship_to_Address; "Ship-to Address")
            { }
            column(Ship_to_Address_2; "Ship-to Address 2")
            { }
            column(Ship_to_Name; "Ship-to Name")
            { }


            column(SelltoAddress_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to Address" + '' + "Sales Invoice Header"."Sell-to Address 2")
            {
            }

            column(ShiptoPostCode_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to Post Code")
            {
            }
            column(ShiptoContact_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to Contact")
            {
            }
            column(SelltoPostCode; "Sales Invoice Header"."Sell-to Post Code")
            {
            }
            column(PhoneNo_SalesInvoiceHeader; '')
            {
            }
            column(SelltoCity_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to City")
            {
            }
            column(SelltoContact_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to Contact")
            {
            }
            column(AmtInWords; AmtInWords)
            {
            }

            column(RecStateDesc; RecState.Description)
            {
            }
            column(No_SalesInHeader; "Sales Invoice Header"."No.")
            {
            }




            column(CName; CompanyInfo.Name + '' + CompanyInfo."Name 2")
            {
            }

            column(CAddress; CompanyInfo.Address + ' ' + CompanyInfo."Address 2")
            {
            }

            column(CGST_Reg; CompanyInfo."GST Registration No.")
            {
            }

            column(CState; '')
            {
            }
            column(CPAN; CompanyInfo."P.A.N. No.")
            {
            }
            column(CIN; '')
            {
            }
            column(CCity; CompanyInfo.City)
            {
            }
            column(CompanyPicture; CompanyInfo.Picture)
            {
            }
            column(State_SalesInvoiceHeader; "Sales Invoice Header".State)
            {
            }
            column(VehicleNo; "Sales Invoice Header"."Vehicle No.")
            {
            }
            column(CustNo; "Sales Invoice Header"."Bill-to Customer No.")
            {
            }
            column(OrderDate_SalesInvoiceHeader; "Sales Invoice Header"."Posting Date")
            {
            }
            column(BilltoName_SalesInvoiceHeader; "Sales Invoice Header"."Bill-to Name")
            {
            }
            column(BilltoName2_SalesInvoiceHeader; "Sales Invoice Header"."Bill-to Name 2")
            {
            }
            column(BilltoAddress_SalesInvoiceHeader; "Sales Invoice Header"."Bill-to Address" + '' + "Sales Invoice Header"."Bill-to Address 2")
            {
            }

            column(BilltoPostCode; "Sales Invoice Header"."Bill-to Post Code")
            {
            }
            column(ShiptoCode; "Sales Invoice Header"."Ship-to Code")
            {
            }
            column(BilltoCity; "Sales Invoice Header"."Bill-to City")
            {
            }
            column(shipTophoneNo; shipTophoneNo)
            {

            }
            column(shiptostate; shiptostate)
            {

            }
            column(DispatchThrough; "Sales Invoice Header"."Shipment Method Code")
            {
            }
            column(ExternalDocumentNo; "Sales Invoice Header"."External Document No.")
            {
            }
            column(Discount_Amt; "Sales Invoice Header"."Invoice Discount Amount")
            {
            }
            column(CustGSTNo; GSTNo)
            {
            }
            column(CustPanNo; PanNo)
            {
            }
            column(BankAdd; BankAdd)
            {
            }
            column(Bankname; Bankname)
            {
            }

            column(BankAccNo; BankAccNo)
            {
            }
            column(Srn; SRN)
            {
            }
            column(BilltoCity_SalesInvoiceHeader; "Sales Invoice Header"."Bill-to City")
            {
            }
            column(AmtInWord; AmtInWord)
            {
            }
            column(OrderNo_SalesShipmentHeader; "Sales Invoice Header"."Document Date")
            {
            }
            column(LocationRecAddress; LocationRec.Address + '' + LocationRec."Address 2" + ',' + LocationRec."Post Code")
            {

            }
            column(LocationPhone; LocationRec."Phone No.")
            {

            }

            column(LocationEmail; LocationRec."E-Mail")
            {

            }
            column(LocationFassi; LocationRec."Fassi Code")
            {

            }
            column(LocationWebsite; LocationRec."Home Page")
            {


            }
            column(LocatiomFassi; LocationRec."Fassi Code")
            {

            }
            column(LocationMSME; LocationRec.MSME)
            {

            }
            column(LocationTan; LocationRec."T.A.N. No.")
            {

            }
            column(LocationGST; LocationRec."GST Registration No.")
            {

            }
            column(LocationCIN; LocationRec.cinno)
            {

            }

            column(statenameBillto; statenameship)
            {

            }
            column(statenameship; statenameship)
            {

            }
            column(State; State)
            {

            }
            column(Shiptomail; Shiptomail)
            {

            }
            column(SelltoCustomerNo; "Sell-to Customer No.")
            {
            }
            column(CINNO; CINNO)
            {

            }



            dataitem("Sales Invoice Line"; "Sales Cr.Memo Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = where(Type = filter(2 | 4 | 1 | 5));
                column(ItemNo; "Sales Invoice Line"."No.")
                {
                }
                column(GST_Group_Code; "GST Group Code")
                { }
                column(Desc_SalesLine; "Sales Invoice Line".Description)
                {
                }
                column(HSN_SalesLine; Item."HSN/SAC Code")
                {
                }
                column(GST_Per_SalesLine; 0)
                {
                }
                column(Quantity; Quantity)
                { }
                column(Unit_Price; "Unit Price")
                {
                }

                column(UOM; "Sales Invoice Line"."Unit of Measure Code")
                {
                }
                column(CGSTPer; CGSTPer)
                {
                }
                column(GSTPer; GSTPer)
                {

                }

                column(CGSTAmount; Round(CGSTAmount))
                {
                }

                column(SGSTAmount; Abs(SGSTAmount))
                {
                }
                column(Amount; round(Amounts))
                {
                }
                column(IGSTPer; IGSTPer)
                {
                }

                column(Discount_Amount; "Line Discount Amount")
                { }
                column(Line_Discount__; "Line Discount %")
                {

                }
                column(totalInvValue; totalInvValue)
                { }
                column(totalInvDiscount; totalInvDiscount)
                { }
                column(InvDiscountAmount; "Sales Invoice Line"."Inv. Discount Amount")
                {
                }



                column(Description_GSTComponent; '')
                {
                }
                column(CGSTAmt; Abs(CGSTAmt))
                {
                }
                column(CessPer; CessPer)
                {
                }
                column(CessAmt; ABS(CessAmt))
                {
                }
                column(IGSTAmnt; ABS(IGSTAmnt))
                {
                }
                column(IGSTPer_; IGSTPer_)
                {
                }

                column(CGSTPer_; CGSTPer_)
                {
                }
                column(TotalCGSTPer_; TotalCGSTPer_)
                {

                }
                column(SGSTPer; SGSTPer)
                {

                }



                column(GLAmt; GLAmt)
                {

                }
                column(Sno; Sno)
                {

                }

                column(GrandTotal; GrandTotal)
                {

                }
                column(TotalAmount; "Line Amount")
                {

                }
                column(TotalAmountWithoutGST; "Sales Invoice Line"."Line Amount" + abs(TotalGST))
                {
                }
                column(TotalGST; Abs(TotalGST))
                {

                }


                trigger OnAfterGetRecord()
                var
                    DetailedGST: Record "Detailed GST Ledger Entry";
                    GenLedEntry: Record "G/L Entry";

                begin
                    Clear(TotalGST);
                    Clear(GrandTotal);
                    Clear(TotalAmount);
                    Clear(TotalGrandTotal);
                    Sno += 1;

                    if "Sales Invoice Line".Type = "Sales Invoice Line".Type::"G/L Account" then
                        if "Sales Invoice Line"."No." = '523022' then
                            CurrReport.Skip();

                    Clear(Item);
                    IF Item.Get("Sales Invoice Line"."No.") then;
                    Clear(IGSTAmnt);
                    Clear(CGSTAmt);
                    Clear(CessPer);
                    Clear(CessAmt);
                    Clear(IGSTPer_);
                    Clear(CGSTPer_);
                    Clear(GSTPer);


                    Clear(CGSTAmount);
                    DetailedGST_gVr.Reset();
                    DetailedGST_gVr.SetRange("Document No.", "Sales Invoice Line"."Document No.");
                    DetailedGST_gVr.SetRange("No.", "Sales Invoice Line"."No.");
                    // DetailedGST_gVr.SetRange("Document Line No.","Sales Invoice Line"."Line No.");
                    DetailedGST_gVr.SETRANGE(DetailedGST_gVr."GST Component Code", 'CGST');
                    if DetailedGST_gVr.FindSet() then begin
                        repeat
                            CGSTAmt := DetailedGST_gVr."GST Amount";
                            CGSTPer_ := DetailedGST_gVr."GST %";
                        until DetailedGST_gVr.Next = 0;
                    end;

                    Clear(SGSTAmount);
                    DetailedGST_gVr.RESET;
                    DetailedGST_gVr.SETRANGE("Document No.", "Sales Invoice Line"."Document No.");
                    DetailedGST_gVr.SetRange("No.", "Sales Invoice Line"."No.");
                    // DetailedGST_gVr.SetRange("Document Line No.","Sales Invoice Line"."Line No.");
                    DetailedGST_gVr.SETRANGE(DetailedGST_gVr."GST Component Code", 'SGST');
                    IF DetailedGST_gVr.FINDSET then begin
                        repeat
                            SGSTAmount := DetailedGST_gVr."GST Amount";
                            SGSTPer := DetailedGST_gVr."GST %";
                        UNTIL DetailedGST_gVr.NEXT = 0;
                    END;

                    DetailedGST_gVr.RESET;
                    DetailedGST_gVr.SETRANGE("Document No.", "Sales Invoice Line"."Document No.");
                    DetailedGST_gVr.SetRange("Document Line No.", "Sales Invoice Line"."Line No.");
                    DetailedGST_gVr.SetRange("No.", "Sales Invoice Line"."No.");
                    DetailedGST_gVr.SETRANGE(DetailedGST_gVr."GST Component Code", 'IGST');
                    IF DetailedGST_gVr.FINDSET then begin
                        repeat
                            IGSTAmnt := DetailedGST_gVr."GST Amount";
                            IGSTPer_ := DetailedGST_gVr."GST %";
                        until DetailedGST_gVr.NEXT = 0;
                        // Clear(GstRate);
                    end;

                    DetailedGST_gVr1.RESET;
                    DetailedGST_gVr1.SETRANGE("Document No.", "Sales Invoice Line"."Document No.");
                    DetailedGST_gVr1.SetRange("No.", "Sales Invoice Line"."No.");
                    DetailedGST_gVr1.SETRANGE(DetailedGST_gVr1."GST Component Code", 'CESS');
                    IF DetailedGST_gVr1.FINDSET then begin
                        repeat
                            CessAmt := DetailedGST_gVr1."GST Amount";
                            CessPer := DetailedGST_gVr1."GST %";
                        until DetailedGST_gVr1.NEXT = 0;
                    end;

                    GSTPer := SGSTPer + IGSTPer_ + CGSTPer_;

                    TotalAmount := "Sales Invoice Line".Quantity * "Sales Invoice Line"."Unit Price" - "Sales Invoice Line"."Line Discount Amount";
                    TotalGST := IGSTAmnt + CGSTAmt + CessAmt + SGSTAmount;

                    GrandTotal := "Line Amount" + abs(TotalGST);
                end;

                trigger OnPreDataItem()
                begin
                    CLEAR(GrossAmount);
                end;

                trigger OnPostDataItem()
                begin

                end;
            }

            trigger OnAfterGetRecord()
            var
                DetailedGStEntry: Record "Detailed GST Ledger Entry";
                DetailedGStEntry1: Record "Detailed GST Ledger Entry";
                SIL: Record "Sales Invoice Line";


                DetailedGST: Record "Detailed GST Ledger Entry";
                DetailedGST1: Record "Detailed GST Ledger Entry";
                StateRec: Record state;
                statename11: TEXT;
                PurInvLineRec: Record "Sales Invoice Line";
            begin
                PurInvLineRec.Reset();
                PurInvLineRec.SetRange("Document No.", "No.");
                PurInvLineRec.SetRange(Type, PurInvLineRec.Type::"G/L Account");
                PurInvLineRec.SetRange("No.", '523022');
                if PurInvLineRec.FindFirst() then
                    roundoff := PurInvLineRec."Line Amount";

                LocationRec.Reset();
                LocationRec.Get("Sales Invoice Header"."Location Code");
                ////statte
                StateRec.Reset();
                Clear(statename11);
                Clear(statenameship);
                StateRec.SetRange(Code, "Location State Code");
                if StateRec.FindFirst() then begin
                    statename11 := StateRec.Description;
                    statenameship := StateRec.Description;
                end;


                TXT := '';
                timex := TIME;
                IF A THEN TXT := 'Original Copy';
                IF B THEN TXT := 'Duplicate Copy';
                IF C THEN TXT := 'Triplicate Copy';
                EinvoiceETransLog.Reset();
                EinvoiceETransLog.SetRange("Invoice No.", "No.");
                IF EinvoiceETransLog.FindFirst() Then
                    EinvoiceETransLog.CalcFields("Einvoice QR Code");

                timex := Time;
                CLEAR(CompStateCode);
                CLEAR(CompStateDesc);
                SRN += 1;
                AmtInWord := '';
                IF RecCustomer.GET("Sell-to Customer No.") Then;
                GSTNo := RecCustomer."GST Registration No.";
                PanNo := RecCustomer."P.A.N. No.";
                fassiNo := RecCustomer.FSSAI;
                CINNO := RecCustomer."CIN No.";


                // CLEAR(NoText);
                // CLEAR(Check);PT

                Shiptoaddress.Reset();
                Shiptoaddress.SetRange(Name, "Sales Invoice Header"."Ship-to Name");
                if Shiptoaddress.FindFirst() then begin
                    shipTophoneNo := Shiptoaddress.Contact;
                    shiptostate := Shiptoaddress.State;
                end;


                CustomerRec.Reset();
                CustomerRec.get("Sales Invoice Header"."Sell-to Customer No.");
                Shiptomail := CustomerRec."E-Mail";



            end;

            trigger OnPostDataItem()
            var
                myInt: Integer;
            begin

            end;


            trigger OnPreDataItem()
            begin
                CLEAR(GrossAmount);
            end;
        }
    }
    // requestpage
    // {

    //     layout
    //     {
    //         area(content)
    //         {
    //             field(A; A)
    //             {
    //                 Caption = 'Original Copy';
    //                 ApplicationArea = all;

    //                 trigger OnValidate()
    //                 begin
    //                     IF B OR C THEN ERROR('You can Select One by One for every print option');

    //                 end;
    //             }
    //             field(B; B)
    //             {
    //                 Caption = 'Duplicate Copy';
    //                 ApplicationArea = all;

    //                 trigger OnValidate()
    //                 begin
    //                     IF A OR C THEN ERROR('You can Select One by One for every print option');
    //                 end;
    //             }
    //             field(C; C)
    //             {
    //                 Caption = 'Triplicate Copy';
    //                 ApplicationArea = all;

    //                 trigger OnValidate()
    //                 begin
    //                     IF A OR B THEN ERROR('You can Select One by One for every print option');
    //                 end;
    //             }
    //             field(NoOfCopies; NoOfCopies)
    //             {
    //                 ApplicationArea = all;
    //             }
    //         }
    //     }

    //     actions
    //     {
    //     }
    // }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(Picture);
        SRN := 0;
    end;

    var

        GSTCode_gCodArr: Decimal;
        CGSTAmt: Decimal;
        CessPer: Decimal;
        CessAmt: Decimal;
        IGST: Decimal;
        CGSTPer_: Decimal;
        TotalCGSTPer_: Decimal;
        repcheck2: Report CheckCOpy;
        IGSTPer_: Decimal;
        Item: Record Item;
        GLAmt: Decimal;
        Amounts: Decimal;
        Customer: Record Customer;
        PostingDate: DateTime;
        Sno: Integer;
        timex: Time;
        EinvoiceETransLogRec: Record "Einvoice & ETrans Log";
        EinvoiceETransLog: Record "Einvoice & ETrans Log";
        CompanyInfo: Record "Company Information";
        TotalGST: Decimal;
        TotalGrandTotal: Decimal;
        AmtInWord: Text;
        CINNO: CODE[30];
        roundoff: Decimal;


        fassiNo: Text[50];
        RecCustomer: Record "Customer";
        // CustomerLedEntry1: Record ;
        GSTNo: Code[15];
        BankAcc: Record "Bank Account";
        Bankname: Text;
        Shiptoaddress: Record "Ship-to Address";
        shipTophoneNo: Text[100];
        shiptostate: Code[20];
        BankAdd: Text;
        BankAccNo: Code[20];
        A: Boolean;
        B: Boolean;
        C: Boolean;
        TXT: Text[50];
        NoOfCopies: Integer;
        LocationRec: Record Location;

        SRN: Integer;
        RecState: Record "State";
        CompStateCode: Code[10];
        CompStateDesc: Text[20];
        CustStateCode: Text[20];
        DetailedGST_gVr: Record "Detailed GST Ledger Entry";//PT
        DetailedGST_gVr1: Record "Detailed GST Ledger Entry";
        GSTSetup: Record "GST Setup";//PT        TotalAmtValue_g: Decimal;
        IntAmount: Decimal;
        DecAmount: Decimal;

        CGSTPer: Decimal;
        SGSTPer: Decimal;
        CGSTAmount: Decimal;
        SGSTAmount: Decimal;
        Amount: Decimal;
        RecDetailedEntry: Record "Detailed GST Ledger Entry";
        GrossAmount: Decimal;
        RecDetailedEntry2: Record "Detailed GST Ledger Entry";
        RecSaleShip: Record "Sales Invoice Line";
        IGSTPer: Decimal;
        CustomerLedEntry: Record "Cust. Ledger Entry";
        IGSTAmnt: Decimal;
        Temp: Decimal;
        Location: Record Location;

        GenLedEntry1: Record "G/L Entry";
        repcheck: Report CheckCOpy;
        totalInvValue: Decimal;
        totalInvDiscount: Decimal;

        RecLocation: Record "LSC Store";//PT

        //Check: Report "Check_Custom";//PT
        AmtInWords: Text;
        AmtTOCust: Decimal;
        AmountNew: Decimal;
        FinalAmount: Decimal;
        AmtTOCust1: Decimal;

        PanNo: Code[10];
        CGSTGroupAmt: array[4] of Decimal;
        IGSTGroupAmt: array[4] of Decimal;
        statenameship: Text;
        Shiptomail: Code[40];
        CustomerRec: Record Customer;
        GrandTotal: Decimal;
        TotalAmount: Decimal;
        GSTPer: Decimal;
        AmountInWord2: text[100];
        Notext2: Array[2] of text;


}

