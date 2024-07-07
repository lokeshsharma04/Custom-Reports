report 50108 "Purchase Invoice Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/Purchase Invoice.rdl';

    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            RequestFilterFields = "No.";
            column(User_ID; "User ID")
            {

            }
            column(No_; "No.")
            {
            }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            { }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.")
            {

            }
            column(Buy_from_Address; "Buy-from Address")
            { }
            column(Buy_from_City; "Buy-from City")
            { }
            column(Buy_from_Address_2; "Buy-from Address 2")
            {

            }
            column(Buy_from_Post_Code; "Buy-from Post Code")
            { }
            column(MSMSNO; Vendo_gRec."AGMARK NO.")
            { }
            column(Vendor_Invoice_No_; "Vendor Invoice No.")
            { }
            column(Document_Date; "Document Date")
            { }
            column(Order_Date; FORMAT("Purch. Inv. Header"."Order Date", 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }
            column(CompanyInfoPic; CompanyInfo.Picture)
            { }
            column(PONo_gvar; PONo_gvar)
            { }
            column(PODate; PODate)
            { }
            column(CompanyInfoName; CompanyInfo.Name)
            { }
            column(CompanyInfoName1; CompanyInfo.Address + ' ' + CompanyInfo."Address 2")
            { }
            column(LocAdder; LocationRec.Address + ' ' + LocationRec."Address 2")
            { }
            column(LocPhne; LocationRec."Phone No.")
            { }
            column(FASSI_Code; LocationRec."Fassi Code")
            {

            }
            column(MSME_Code; LocationRec.MSME)
            {

            }
            column(GST_loction; LocationRec."GST Registration No.")
            {

            }
            column(TAN_loction; LocationRec."T.A.N. No.")
            {

            }
            column(LocEmail; LocationRec."E-Mail")
            { }
            column(website; LocationRec."Home Page")
            { }
            column(Ship_to_Address; "Ship-to Address")
            { }
            column(CompanyInfoAddress; CompanyInfo.Address)
            { }

            column(CompanyInfoCity; CompanyInfo.City)
            { }
            column(CompanyInfoPhone; CompanyInfo."Phone No.")
            { }
            column(CompanyInfoGSTRegis; CompanyInfo."P.A.N. No.")
            { }
            column(BankName; BankName)
            {

            }
            column(BankAccountNO; BankAccountNO)
            {

            }
            column(BANKbRANCHNO; BANKbRANCHNO)
            {

            }
            column(ReportCaption; ReportCaption)
            {

            }
            column(statename; statename)
            {

            }
            column(Roundoff; Roundoff)
            {

            }

            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemLinkReference = "Purch. Inv. Header";
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = where(Type = filter(2 | 4 | 1 | 5));

                //              value(0; " ") { Caption = ' '; }
                // value(1; "G/L Account") { Caption = 'G/L Account'; }
                // value(2; "Item") { Caption = 'Item'; }
                // value(3; "Resource") { Caption = 'Resource'; }
                // value(4; "Fixed Asset") { Caption = 'Fixed Asset'; }
                // value(5; "Charge (Item)") { Caption = 'Charge (Item)'; }
                column(Document_No_; "Document No.")
                {
                }
                column(No; "No.")
                { }
                column(Description; Description)
                { }
                column(GRNDate; GRNDate)
                { }
                column(Receipt_No_; "Receipt No.")
                { }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                { }
                column(Unit_Cost; "Direct Unit Cost")
                { }
                column(Line_Discount__; "Line Discount %")
                {

                }
                column(GST_Group_Code; "GST Group Code")
                { }
                column(Quantity; Quantity)
                { }
                column(TotalAmount; "Purch. Inv. Line"."Line Amount" + "Purch. Inv. Line"."Line Discount Amount")
                {
                }
                column(HSN_SAC_Code; "HSN/SAC Code")
                {
                }
                column(TotalAmt; Round("Purch. Inv. Line".Quantity * "Purch. Inv. Line"."Direct Unit Cost"))
                { }
                column(TaxvalueAmount; abs("Purch. Inv. Line".Quantity * "Purch. Inv. Line"."Direct Unit Cost"))
                {

                }
                column(Posting_Date; "Purch. Inv. Line"."Posting Date")
                {

                }

                column(GSTPer; GSTPer)
                { }
                column(Buy_From_GST_Registration_No; "Buy-From GST Registration No")
                {
                }
                column(Line_Discount_Amount; "Line Discount Amount")
                {

                }
                column(CGSTAmount; CGSTAmount)
                { }
                column(SGSTAmount; SGSTAmount)
                { }
                column(IGSTAmount; IGSTAmount)
                { }
                column(PACKINGAmt; PACKINGAmt)
                { }
                column(FREIGHTAmt; FREIGHTAmt)
                { }
                column(GstRate; GstRate)
                { }
                column(Lineamt; Lineamt)
                { }
                column(CesssAmount; CesssAmount)
                { }
                column(TDSAmt; TDSAmt)
                { }
                column(SRNo; SRNo)
                { }
                column(Grandtotal; Grandtotal)
                {

                }
                column(Grandtotal1; Grandtotal1)
                {

                }
                column(AmountInWord; AmountInWord)
                {

                }

                column(AmountInWord2; AmountInWord2)
                {

                }
                column(Type; Type)
                {

                }
                column(GstRate2; GstRate2)
                {

                }


                column(Line_Amount; "Line Amount")
                {

                }
                column(Comments; Comments)
                {

                }
                column(finalTOTAL; finalTOTAL)
                {

                }



                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    // if "Purch. Inv. Line"."No." = '523022' then begin
                    //     Roundoff := "Purch. Inv. Line"."Line Amount";
                    //     Message('%1', Roundoff);
                    // end;

                    if "Purch. Inv. Line".Type = "Purch. Inv. Line".Type::"G/L Account" then
                        if "Purch. Inv. Line"."No." = '523022' then
                            CurrReport.Skip();

                    SRNo += 1;

                    Clear(PACKINGAmt);
                    Clear(FREIGHTAmt);


                    // if ("Purch. Inv. Line".Type = "Purch. Inv. Line".Type::Item) Or ("Purch. Inv. Line".Type = "Purch. Inv. Line".Type::"Fixed Asset")
                    // OR ("Purch. Inv. Line".Type = "Purch. Inv. Line".Type::"G/L Account") then
                    //     Lineamt := "Purch. Inv. Line"."Line Amount";



                    if "Purch. Inv. Line".Type = "Purch. Inv. Line".Type::"Charge (Item)" then begin
                        if ("Purch. Inv. Line"."No." = 'PACKING CHARGES PM T') or ("Purch. Inv. Line"."No." = 'PACKING CHARGES PM') or ("Purch. Inv. Line"."No." = 'PACKING CHARGES RM') Then
                            PACKINGAmt := "Purch. Inv. Line"."Line Amount";
                        //   Message('%1', PACKINGAmt);
                        if ("Purch. Inv. Line"."No." = 'FREIGHT RM') or ("Purch. Inv. Line"."No." = 'FREIGHT PM') or
                         ("Purch. Inv. Line"."No." = 'FREIGHT') or ("Purch. Inv. Line"."No." = 'FREIGHT PM-T') or ("Purch. Inv. Line"."No." = 'FREIGHT RM-T') Then
                            FREIGHTAmt := "Purch. Inv. Line"."Line Amount";


                    End;

                    /*

                CLEAR(CESEPer);
                CLEAR(CESEAMT);
                CLEAR(IntegratedGSTPer);
                CLEAR(IntegratedGSTAmount);
                CLEAR(CentralGSTPer);
                CLEAR(CentralGSTAmount);
                CLEAR(StateGSTPer);
                CLEAR(StateGSTAmount);
                DetailedGST.RESET;
                DetailedGST.SetCurrentKey("Document No.");
                DetailedGST.SetLoadFields("Document No.", "Document Line No.", "GST Amount");
                DetailedGST.SETRANGE(DetailedGST."Document No.", "Purch. Inv. Line"."Document No.");
                //DetailedGST.SetFilter(DetailedGST."GST Component Code", '%1', 'CGST');
                DetailedGST.SetRange("No.", "Purch. Inv. Line"."No.");
                DetailedGST.SetRange("Document line No.", "Purch. Inv. Line"."Line No.");
                IF DetailedGST.FINDSET THEN BEGIN
                    REPEAT
                        case DetailedGST."GST Component Code" of
                            'CGST':
                                begin

                                    CentralGSTPer += DetailedGST."GST %";
                                    //  CentralGSTPer := DetailedGST."GST %";
                                    CentralGSTAmount += DetailedGST."GST Amount";
                                end;
                            'SGST':
                                begin
                                    StateGSTPer += DetailedGST."GST %";
                                    StateGSTAmount += DetailedGST."GST Amount";
                                end;
                            'IGST':
                                begin
                                    IntegratedGSTPer += DetailedGST."GST %";
                                    IntegratedGSTAmount += DetailedGST."GST Amount";
                                end;
                            'CESS':
                                begin
                                    CESEPer += DetailedGST."GST %";
                                    CESEAMT += DetailedGST."GST Amount";
                                end;

                        end;
                    UNTIL DetailedGST.NEXT = 0;

                END;


                    */

                    /////////////////////////////
                    Clear(GstRate);
                    // Clear(AmountSum);
                    Clear(CGST);
                    Clear(CGSTAmount);
                    DetailedGST_gVr.Reset();
                    DetailedGST_gVr.SetRange("Document No.", "Purch. Inv. Line"."Document No.");
                    DetailedGST_gVr.SetRange("No.", "Purch. Inv. Line"."No.");
                    DetailedGST_gVr.SetRange("Document Line No.", "Purch. Inv. Line"."Line No.");
                    DetailedGST_gVr.SETRANGE(DetailedGST_gVr."GST Component Code", 'CGST');
                    if DetailedGST_gVr.FindSet() then begin
                        repeat
                            CGSTAmount := DetailedGST_gVr."GST Amount";
                            CGST := DetailedGST_gVr."GST %";
                        until DetailedGST_gVr.Next = 0;
                    end;
                    Clear(GstRate);
                    Clear(SGST);
                    Clear(SGSTAmount);
                    DetailedGST_gVr.RESET;
                    DetailedGST_gVr.SETRANGE("Document No.", "Purch. Inv. Line"."Document No.");
                    DetailedGST_gVr.SetRange("No.", "Purch. Inv. Line"."No.");
                    DetailedGST_gVr.SetRange("Document Line No.", "Purch. Inv. Line"."Line No.");
                    DetailedGST_gVr.SETRANGE(DetailedGST_gVr."GST Component Code", 'SGST');
                    IF DetailedGST_gVr.FINDSET then begin
                        repeat
                            SGST := DetailedGST_gVr."GST %";
                            SGSTAmount := DetailedGST_gVr."GST Amount";
                        UNTIL DetailedGST_gVr.NEXT = 0;
                    END;
                    Clear(GstRate);
                    Clear(IGST);
                    Clear(IGSTAmount);
                    DetailedGST_gVr.RESET;
                    DetailedGST_gVr.SETRANGE("Document No.", "Purch. Inv. Line"."Document No.");
                    DetailedGST_gVr.SetRange("Document Line No.", "Purch. Inv. Line"."Line No.");
                    DetailedGST_gVr.SetRange("No.", "Purch. Inv. Line"."No.");
                    DetailedGST_gVr.SETRANGE(DetailedGST_gVr."GST Component Code", 'IGST');
                    IF DetailedGST_gVr.FINDSET then begin
                        repeat
                            IGST := DetailedGST_gVr."GST %";
                            IGSTAmount += DetailedGST_gVr."GST Amount";
                        until DetailedGST_gVr.NEXT = 0;
                        // Clear(GstRate);
                    end;
                    Clear(CessPer);
                    Clear(CesssAmount);
                    DetailedGST_gVr1.RESET;
                    DetailedGST_gVr1.SETRANGE("Document No.", "Purch. Inv. Line"."Document No.");
                    DetailedGST_gVr1.SetRange("No.", "Purch. Inv. Line"."No.");
                    DetailedGST_gVr.SetRange("Document Line No.", "Purch. Inv. Line"."Line No.");
                    DetailedGST_gVr1.SETRANGE(DetailedGST_gVr1."GST Component Code", 'CESS');
                    IF DetailedGST_gVr1.FINDSET then begin
                        repeat
                            CessPer := DetailedGST_gVr1."GST %";
                            CesssAmount := DetailedGST_gVr1."GST Amount";

                        until DetailedGST_gVr1.NEXT = 0;
                    end;////..PT

                    Clear(TDSAmt);
                    TDSEntryRec.Reset();
                    TDSEntryRec.SetRange("Document No.", "Purch. Inv. Header"."No.");
                    if TDSEntryRec.FindFirst() then begin
                        repeat
                            TDSAmt := TDSEntryRec."TDS Amount";
                        UNTIL TDSEntryRec.Next() = 0;
                    end;

                    Clear(PONo_gvar);
                    Clear(PODate);
                    Clear(GRNNo);
                    Clear(GRNDate);
                    clear(ReceiptNo);
                    Clear(GRNINVNO);
                    PurchInvHead.Reset();
                    PurchInvHead.SetRange("No.", "Purch. Inv. Line"."Document No.");
                    if PurchInvHead.FindFirst() then begin
                        ReceiptNo := "Purch. Inv. Line"."Receipt No.";

                        PurchRecepitHeader.reset();
                        PurchRecepitHeader.SetRange("No.", ReceiptNo);
                        if PurchRecepitHeader.FindFirst() then begin
                            PONo_gvar := PurchRecepitHeader."Order No.";
                            PODate := PurchRecepitHeader."Order Date";
                            GRNNo := PurchRecepitHeader."No.";
                            GRNDate := PurchRecepitHeader."Document Date";
                            //  GRNINVNO := PurchRecepitHeader."Vendor Shipment No.";
                        end;


                    end;

                    GSTPer := CGST + SGST + IGST;
                    GstRate := CGSTAmount + SGSTAmount + IGSTAmount + CesssAmount;
                    GstRate2 += GstRate;


                    repcheck2.InitTextVariable;
                    repcheck2.FormatNoText(Notext2, GstRate2, "Purch. Inv. Header"."Currency Code");
                    AmountInWord2 := Notext2[1] + Notext2[2];

                    Clear(Grandtotal1);
                    Grandtotal1 := "Line Amount" + GstRate;
                    PurchaseInvLineRec.Reset();
                    PurchaseInvLineRec.SetRange("Document No.", "Document No.");
                    if PurchaseInvLineRec.FindFirst() then begin
                        PurchaseInvLineRec.CalcSums("Line Amount");
                        Lineamt := PurchaseInvLineRec."Line Amount";
                    end;

                    Clear(finalTOTAL);
                    finalTOTAL := Round(Lineamt + GstRate2 - TDSAmt, 0.01);

                    repcheck.InitTextVariable();
                    repcheck.FormatNoText(Notext, finalTOTAL, "Purch. Inv. Header"."Currency Code");
                    AmountInWord := Notext[1] + Notext[2];

                end;

                trigger OnPreDataItem()
                var
                    myInt: Integer;
                begin
                    SRNo := 0;
                end;

            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
                purchinvline: Record "Purch. Inv. Line";
            begin
                VendorBankaccountRec.Reset();

                LocationRec.Get("Purch. Inv. Header"."Location Code");
                Vendo_gRec.get("Purch. Inv. Header"."Buy-from Vendor No.");
                VendorBankAccountNo := Vendo_gRec."Preferred Bank Account Code";
                //Message(VendorBankAccountNo);
                VendorBankaccountRec.SetRange(Code, VendorBankAccountNo);
                if VendorBankaccountRec.FindFirst() then begin
                    BankName := VendorBankaccountRec.Name + VendorBankaccountRec."Name 2";
                    BankAccountNO := VendorBankaccountRec."Bank Account No.";
                    BANKbRANCHNO := VendorBankaccountRec."Bank Branch No.";

                end;
                StateRec.Reset();
                Clear(statename);
                StateRec.SetRange(Code, "Location State Code");
                if StateRec.FindFirst() then begin
                    statename := StateRec.Description;
                end;

                PurInvLineRec.Reset();
                PurInvLineRec.SetRange("Document No.", "No.");
                PurInvLineRec.SetRange(Type, PurInvLineRec.Type::"G/L Account");
                PurInvLineRec.SetRange("No.", '523022');
                if PurInvLineRec.FindFirst() then
                    roundoff := PurInvLineRec."Line Amount";

                PurchCommenLine.Reset();
                Clear(Comments);
                PurchCommenLine.SetRange("No.", "Purch. Inv. Header"."No.");

                if PurchCommenLine.FindSet() then begin
                    repeat
                        Comments += PurchCommenLine.Comment + ' ';
                    until PurchCommenLine.Next() = 0;
                end;


                PurInvLineRec.Reset();
                Clear(ReportCaption);
                PurInvLineRec.SetRange("Document No.", "No.");
                PurInvLineRec.SetRange(Type, PurInvLineRec.Type::Item);
                if PurInvLineRec.FindFirst() then begin
                    if PurInvLineRec."GST Group Code" = 'GST0' then
                        ReportCaption := 'Service Invoice'
                    else
                        ReportCaption := 'Purchase Invoice'
                end;





                // PurchaseInvLineRec.reset();
                // Clear(Lineamt);
                // Clear(finalTOTAL);
                // PurchaseInvLineRec.SetRange("Document No.", "No.");
                // if PurchaseInvLineRec.FindSet() then begin

                //     repeat
                //         PurchaseInvLineRec.CalcSums("Line Amount");
                //         Lineamt := PurchaseInvLineRec."Line Amount" ;
                // until PurchaseInvLineRec.next = 0;


                //   end;
                // finalTOTAL := Lineamt + GstRate;
                // Message('%1.....Final Amount', finalTOTAL);
                // // PurchaseInvLineRec.SetRange(docu ty);

            end;




        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    // field(Name; SourceExpression)
                    // {
                    //     ApplicationArea = All;

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }

    }
    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        CompanyInfo.get();
        CompanyInfo.CalcFields(Picture);
    end;

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = RDLC;
    //         LayoutFile = 'mylayout.rdl';
    //     }
    // }

    var
        PurInvLineRec: Record "Purch. Inv. Line";
        DetailedGST_gVr: Record "Detailed GST Ledger Entry";//PT
        DetailedGST_gVr1: Record "Detailed GST Ledger Entry";
        GSTSetup: Record "GST Setup";//PT
        PurchRecHeader_gVer: Record "Purch. Rcpt. Header";
        PurchRecepitHeader: Record "Purch. Rcpt. Header";
        repcheck2: Report CheckCOpy;
        repcheck: Report CheckCOpy;
        Notext: Array[2] of text[100];
        Notext2: Array[2] of text[100];
        PONo_gvar: Code[20];
        GRNNo: Code[20];
        GRNDate: Date;

        PODate: Date;
        Roundoff: Decimal;
        finalTOTAL: Decimal;
        FinalRounfoff: Decimal;



        SRNo: Integer;
        CompanyInfo: Record "Company Information";
        PurInvlINE: Record "Purch. Inv. Line";

        VendorBankaccountRec: Record "Vendor Bank Account";
        LocationRec: Record Location;
        TaxComponentName: Text;//PT
        GSTPer: Decimal;
        PurcInvLine_gVer: Record "Purch. Inv. Line";
        ReceiptNo: Text[20];
        SGSTAmount: Decimal;//PT
        CGSTAmount: Decimal;//PT

        IGSTAmount: Decimal;//PT
        CGST: Decimal;//PT
        SGST: Decimal;//PT
        IGST: Decimal;//PT
        CesssAmount: Decimal;
        GstRate2: Decimal;
        CessPer: Decimal;
        frieghtAmount: Decimal;
        Lineamt: Decimal;
        PACKINGAmt: Decimal;
        PurchInvHead: Record "Purch. Inv. Header";
        FREIGHTAmt: Decimal;
        GstRate: Decimal;//PT
        Vendo_gRec: Record Vendor;
        StateRec: Record State;
        statename: Text[30];

        TDSEntryRec: Record "TDS Entry";
        BANKbRANCHNO: CODE[30];
        TDSAmt: Decimal;
        VendorBankAccountNo: code[30];
        BankName: Text[30];
        BankAccountNO: Code[30];
        IFSCCODE: Code[30];
        TaxvalueAmount: Decimal;
        Grandtotal: Decimal;
        Grandtotal1: Decimal;

        repcheck1: Report "Posted Voucher";
        ReportCaption: Text[100];

        AmountInWord: text;
        AmountInWord2: Text;
        PurchRcptHeaderRec: Record "Purch. Rcpt. Header";
        GRNINVNO: Code[30];
        PurchaseInvLineRec: Record "Purch. Inv. Line";
        PurchCommenLine: Record "Purch. Comment Line";
        Comments: text[200];
        UserRec: Record User;

}