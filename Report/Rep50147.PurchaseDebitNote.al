report 50147 "Purchase Debit Note"
{
    Caption = 'Purchase Debit Note Report';

    DefaultLayout = RDLC;
    UsageCategory = ReportsAndAnalysis;
    PreviewMode = PrintLayout;
    ApplicationArea = all;
    RDLCLayout = 'Layout/PurchaseDebitNote.rdl';
    //  ApplicationArea =all;

    dataset
    {
        dataitem("Purch. Cr. Memo Hdr."; "Purch. Cr. Memo Hdr.")

        {
            RequestFilterFields = "No.";
            column(CName; CompanyInfo.Name + '' + CompanyInfo."Name 2")
            {
            }
            column(User_ID; "User ID")
            {

            }

            column(CAddress; CompanyInfo.Address + ' ' + CompanyInfo."Address 2")
            {
            }

            column(CGST_Reg; CompanyInfo."GST Registration No.")
            {
            }

            column(CState; '')// CompanyInfo.State)
            {
            }
            column(CPAN; CompanyInfo."P.A.N. No.")
            {
            }
            column(CIN; CIN)// CompanyInfo."Company Registration  No.")
            {
            }
            column(CCity; CompanyInfo.City)
            {
            }
            column(CompanyPicture; CompanyInfo.Picture)
            {
            }
            column(No_Doc; "No.")
            {

            }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.")
            {

            }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            {

            }
            column(Buy_from_Address; "Buy-from Address")
            {

            }
            column(Buy_from_Address_2; "Buy-from Address 2")
            {

            }
            column(Buy_from_City; "Buy-from City")
            {

            }
            column(Buy_from_Contact_No_; "Buy-from Contact No.")
            {

            }
            column(Buy_from_Post_Code; "Buy-from Post Code")
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }
            column(Document_Date; "Document Date")
            {

            }
            column(Vendor_Cr__Memo_No_; "Vendor Cr. Memo No.")
            {

            }
            column(Vendor_GST_Reg__No_; "Vendor GST Reg. No.")
            {

            }
            column(LocationRecAddress; LocationRec.Address + ' ' + LocationRec."Address 2")
            {

            }
            column(LocationPhone; LocationRec."Phone No.")
            {

            }
            column(TAN_LOC; LocationRec."T.A.N. No.")
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
            column(LocTAN; LocationRec."T.A.N. No.")
            {

            }
            column(LocationGST; LocationRec."GST Registration No.")
            {

            }
            column(LocationCIN; LocationRec.cinno)
            {

            }
            column(roundoff; roundoff)
            {

            }
            column(BankAccNo; BankAccNo)
            {

            }
            column(IFCSCode; IFCSCode)
            {

            }
            column(BankName; BankName)
            {

            }
            column(Brach; Brach)
            {

            }
            column(VendorPAN; VendorPAN)
            {

            }
            column(PhoenNO; PhoenNO)
            {

            }
            column(Applies_to_Doc__No_; "Applies-to Doc. No.")
            {

            }
            column(Fassi; Fassi)
            {

            }

            column(Email; Email)
            {

            }
            column(TAN; TAN)
            {

            }
            column(statename; statename)
            {

            }
            column(StateCode; StateCode)
            {


            }
            column(Comments; Comments)
            {

            }
            dataitem("Purch. Cr. Memo Line"; "Purch. Cr. Memo Line")
            {

                DataItemLink = "Document No." = field("No.");
                DataItemTableView = where(Type = filter(2 | 4 | 1 | 5));
                column(No_; "No.")
                {

                }
                column(Description; Description)
                {

                }
                column(HSN_SAC_Code; "HSN/SAC Code")
                {

                }

                column(Unit_Cost; "Unit Cost")
                {

                }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Line_Discount_Amount; "Line Discount Amount")
                { }
                column(Line_Discount__; "Line Discount %")
                {

                }
                column(Line_Amount; "Line Amount")
                {


                }
                column(TotalGSTAmount; TotalGSTAmount)
                {

                }
                column(TotalGSTPer; TotalGSTPer)
                {

                }
                column(SRNo; SRNo)
                {


                }
                column(GST_Group_Code; "GST Group Code")
                {

                }
                column(CGSTAmount; CGSTAmt)
                {

                }
                column(SGSTAmount; SGSTAmount)
                {

                }
                column(IGSTAmnt; IGSTAmnt)
                {

                }
                column(CessAmt; CessAmt)
                {

                }
                column(CGSTPer_; CGSTPer_)
                {

                }
                column(IGSTPer_; IGSTPer_)
                {

                }
                column(SGSTPer; SGSTPer)
                {

                }
                column(CessPer; CessPer)
                {

                }
                column(Grandtotal; Grandtotal)
                {

                }
                column(AmountInWord; AmountInWord)
                {

                }


                trigger OnAfterGetRecord()
                begin
                    Clear(SGSTAmount);
                    Clear(CGSTAmt);
                    Clear(CGSTPer_);
                    Clear(SGSTPer);
                    Clear(CessAmt);
                    Clear(CessPer);
                    Clear(IGSTAmnt);
                    Clear(IGSTPer_);
                    Clear(AmountInWord);

                    SRNo += 1;

                    if "Purch. Cr. Memo Line".Type = "Purch. Cr. Memo Line".Type::"G/L Account" then
                        if "Purch. Cr. Memo Line"."No." = '523022' then
                            CurrReport.Skip();

                    DetailedGST_gVr.Reset();
                    DetailedGST_gVr.SetRange("Document No.", "Purch. Cr. Memo Line"."Document No.");
                    DetailedGST_gVr.SetRange("No.", "Purch. Cr. Memo Line"."No.");
                    DetailedGST_gVr.SetRange("Document Line No.", "Purch. Cr. Memo Line"."Line No.");
                    DetailedGST_gVr.SETRANGE(DetailedGST_gVr."GST Component Code", 'CGST');
                    if DetailedGST_gVr.FindSet() then begin
                        repeat
                            CGSTAmt := ABS(DetailedGST_gVr."GST Amount");
                            CGSTPer_ := DetailedGST_gVr."GST %";
                        until DetailedGST_gVr.Next = 0;
                    end;


                    DetailedGST_gVr.RESET;
                    DetailedGST_gVr.SETRANGE("Document No.", "Purch. Cr. Memo Line"."Document No.");
                    DetailedGST_gVr.SetRange("No.", "Purch. Cr. Memo Line"."No.");
                    DetailedGST_gVr.SetRange("Document Line No.", "Purch. Cr. Memo Line"."Line No.");
                    DetailedGST_gVr.SETRANGE(DetailedGST_gVr."GST Component Code", 'SGST');
                    IF DetailedGST_gVr.FINDSET then begin
                        repeat
                            SGSTAmount := Abs(DetailedGST_gVr."GST Amount");
                            SGSTPer := DetailedGST_gVr."GST %";

                        UNTIL DetailedGST_gVr.NEXT = 0;
                    END;


                    DetailedGST_gVr.RESET;
                    DetailedGST_gVr.SETRANGE("Document No.", "Purch. Cr. Memo Line"."Document No.");
                    DetailedGST_gVr.SetRange("Document Line No.", "Purch. Cr. Memo Line"."Line No.");
                    DetailedGST_gVr.SetRange("No.", "Purch. Cr. Memo Line"."No.");
                    DetailedGST_gVr.SETRANGE(DetailedGST_gVr."GST Component Code", 'IGST');
                    IF DetailedGST_gVr.FINDSET then begin
                        repeat
                            IGSTAmnt := ABS(DetailedGST_gVr."GST Amount");
                            IGSTPer_ := DetailedGST_gVr."GST %";
                        until DetailedGST_gVr.NEXT = 0;
                        // Clear(GstRate);
                    end;

                    DetailedGST_gVr.RESET;
                    DetailedGST_gVr.SETRANGE("Document No.", "Purch. Cr. Memo Line"."Document No.");
                    DetailedGST_gVr.SetRange("No.", "Purch. Cr. Memo Line"."No.");
                    DetailedGST_gVr.SetRange("Document Line No.", "Purch. Cr. Memo Line"."Line No.");
                    DetailedGST_gVr.SETRANGE(DetailedGST_gVr."GST Component Code", 'CESS');
                    IF DetailedGST_gVr.FINDSET then begin
                        repeat
                            CessAmt := ABS(DetailedGST_gVr."GST Amount");
                            CessPer := DetailedGST_gVr."GST %";
                        until DetailedGST_gVr.NEXT = 0;
                    end;

                    Clear(TotalGSTPer);
                    Clear(TotalGSTAmount);
                    Clear(Grandtotal);
                    TotalGSTAmount := SGSTAmount + CGSTAmt + IGSTAmnt + CessAmt;
                    TotalGSTPer := IGSTPer_ + CGSTPer_ + SGSTPer + CessPer;

                    Grandtotal := "Line Amount" + TotalGSTAmount;
                    //  Grandtotal := Grandtotal + roundoff;



                end;
            }
            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                SRNo := 0;
            end;

            trigger OnAfterGetRecord()
            begin

                PurInvLineRec.Reset();
                Clear(roundoff);
                PurInvLineRec.SetRange("Document No.", "No.");
                PurInvLineRec.SetRange(Type, PurInvLineRec.Type::"G/L Account");
                PurInvLineRec.SetRange("No.", '523022');
                if PurInvLineRec.FindFirst() then
                    roundoff := PurInvLineRec."Line Amount";

                LocationRec.Reset();
                LocationRec.Get("Purch. Cr. Memo Hdr."."Location Code");

                VendorRec.Reset();
                VendorBankAccount.Reset();
                VendorRec.SetRange("No.", "Buy-from Vendor No.");
                if VendorRec.FindFirst() then begin
                    VendorPAN := VendorRec."P.A.N. No.";
                    PhoenNO := VendorRec."Phone No.";
                    CIN := VendorRec."CIN No.";
                    Fassi := VendorRec.FSSAI;
                    Email := VendorRec."E-Mail";
                    TAN := VendorRec."TAN No.";
                    StateCode := VendorRec."State Code";

                    VendorBankAccount.SetRange(Code, VendorRec."Preferred Bank Account Code");
                    if VendorBankAccount.FindFirst() then begin
                        BankName := VendorBankAccount.Name;
                        Brach := VendorBankAccount."Bank Branch No.";
                        IFCSCode := VendorBankAccount.IBAN;
                        BankAccNo := VendorBankAccount."Bank Account No.";
                    end;

                    state.Reset();
                    state.SetRange(Code, VendorRec."State Code");
                    if state.FindFirst() then begin
                        statename := state.Description;
                    end;

                end;

                PurchCommenLine.Reset();
                Clear(Comments);
                PurchCommenLine.SetRange("No.", "Purch. Cr. Memo Hdr."."No.");

                if PurchCommenLine.FindSet() then begin
                    repeat
                        Comments += PurchCommenLine.Comment + ' ';
                    until PurchCommenLine.Next() = 0;
                end;



            end;

            //  VendorRec.SetRange("Preferred Bank Account Code");




        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }

    }
    trigger OnPreReport()
    begin
        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(Picture);

    end;

    var
        CompanyInfo: Record "Company Information";
        CGSTAmount: Decimal;
        DetailedGST_gVr: Record "Detailed GST Ledger Entry";
        CGSTAmt: Decimal;
        CGSTPer_: Decimal;
        SGSTAmount: Decimal;
        SGSTPer: Decimal;
        ContactPerson: Code[20];
        IGSTAmnt: Decimal;
        IGSTPer_: Decimal;
        CessAmt: Decimal;
        CessPer: Decimal;
        StateCode: code[10];
        LocationRec: Record Location;
        TotalGSTPer: Decimal;
        repcheck: Report CheckCOpy;

        AmountInWord: text;
        TotalGSTAmount: Decimal;
        Notext: Array[2] of text;
        SRNo: Integer;
        Grandtotal: Decimal;
        PurInvLineRec: Record "Purch. Cr. Memo Line";
        roundoff: Decimal;
        VendorRec: Record Vendor;
        VendorBankAccount: Record "Vendor Bank Account";
        PurchCommenLine: Record "Purch. Comment Line";
        BankName: Text;
        state: Record State;
        TAN: CODE[20];
        Brach: Code[30];
        BankAccNo: Code[20];
        Email: text[30];

        Fassi: Code[20];
        Comments: text[200];
        statename: text;

        IFCSCode: Code[30];
        VendorPAN: Code[30];
        CIN: Code[20];

        MSME: Code[30];
        PhoenNO: CODE[30];
        EMAILVEN: text[40];
    //   STATECODE: CODE[10];









}
