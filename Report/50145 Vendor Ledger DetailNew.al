report 50145 "Vendor Ledger-Detail New"
{
    ApplicationArea = All;
    UsageCategory = Administration;
    DefaultLayout = RDLC;
    Caption = 'Vendor Ledger-Detail New';
    RDLCLayout = 'Report/Vendor Ledger-DetailNew1.rdl';
    PreviewMode = PrintLayout;
    dataset
    {
        dataitem(Vendor1; Vendor)
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";
            column(Vend_No; Vendor."No.")
            {
            }
            column(CompanyName; Company.Name)
            {
            }
            column(CAddress; Company.Address + ',' + Company."Address 2" + ',' + Company.City)
            {
            }
            column(Company_Picture; Company.Picture)
            {

            }
            column(CPhone; Company."Phone No.")
            {
            }
            column(tgComp; tgComp)
            {
            }
            column(tgComp1; tgComp1)
            {
            }
            column(tgComp2; tgComp2)
            {
            }
            column(tgComp3; tgComp3)
            {
            }
            column(CustAccNo; CustAcc."No.")
            {
            }
            column(CustName; CustAcc.Name)
            {
            }
            column(CustName2; CustAcc."Name 2")
            {
            }
            column(DimFilter; DimFilter)
            {
            }
            column(StateCode_Vendor1; Vendor1."State Code")
            {
            }
            column(City_Vendor1; Vendor1.City)
            {
            }
            column(Address_Vendor1; Vendor1.Address)
            {
            }
            column(Address2_Vendor1; Vendor1."Address 2")
            {
            }
            column(Name_Vendor1; Vendor1.Name)
            {
            }
            column(Sub; Sub)
            {
            }
            column(Body1; Body1)
            {
            }
            column(Body2; Body2)
            {
            }
            column(Body3; Body3)
            {
            }
            column(Body4; Body4)
            {
            }
            column(Body5; Body5)
            {
            }
            column(Body6; Body6)
            {
            }
            column(CompanyInfoName; CompanyInfo.Name)
            {
            }
            column(Txt1; Txt1)
            {
            }
            column(BFDebit; ROUND(BFDebit, 1))
            {
            }
            column(BFCredit; ROUND(BFCredit, 1))
            {
            }
            column(CFDedit; ROUND(CFDedit, 1))
            {
            }
            column(CFCredit; ROUND(CFCredit, 1))
            {
            }
            column(Balamt; ROUND(ABS(Balamt), 1))
            {
            }
            column(PrintToExcel; PrintToExcel)
            {
            }
            dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
            {
                CalcFields = "Debit Amount (LCY)", "Credit Amount (LCY)", "Remaining Amount";
                DataItemLink = "Vendor No." = FIELD("No.");
                DataItemTableView = SORTING("Vendor No.", "Posting Date", "Currency Code")
                                    ORDER(Ascending);
                RequestFilterFields = "Posting Date", "Location Code", "Global Dimension 1 Code";
                column(TotalTDSIncludingSHECESS_VendorLedgerEntry; "Vendor Ledger Entry"."Total TDS Including SHE CESS")
                {
                }
                column(PurchComment; PurchComment)
                {
                }
                column(CommNarration; CommNarration)
                {

                }


                column(VLE_Vend_no; "Vendor Ledger Entry"."Vendor No.")
                {
                }
                column(VLE_Trans_no; "Vendor Ledger Entry"."Transaction No.")
                {
                }
                column(Description_VendorLedgerEntry; "Vendor Ledger Entry".Description)
                {
                }
                column(DocumentNo_VendorLedgerEntry; "Vendor Ledger Entry"."Document No.")
                {
                }
                column(PostingDate_VendorLedgerEntry; "Vendor Ledger Entry"."Posting Date")
                {
                }
                column(SourceCode_VendorLedgerEntry; "Vendor Ledger Entry"."Source Code")
                {
                }
                column(Cost_Center; CostCenter)
                {
                }
                column(Scode; Scode)
                {
                }
                column(GlobalDimension1Code_VendorLedgerEntry; LocationCode)
                {
                }
                column(GlobalDimension2Code_VendorLedgerEntry; "Vendor Ledger Entry"."Global Dimension 2 Code")
                {
                }
                column(dbamt; ROUND(dbamt, 1))
                {
                }
                column(Cramt; ROUND(Cramt, 1))
                {
                }
                column(Bal3; ROUND(ABS(Balance3), 1))
                {
                }
                column(dbamtround; ROUND(dbamt, 1))
                {
                }
                column(Cramtround; ROUND(Cramt, 1))
                {
                }
                column(Bal3round; ROUND(ABS(Balance3), 1))
                {
                }
                column(Txt; Txt)
                {
                }
                column(FORAMT; ABS(FORAMT))
                {
                }
                column(TXT2; TXT2)
                {
                }
                column(TransDebits; ROUND(TransDebits, 1))
                {
                }
                column(TransCredits; ROUND(TransCredits, 1))
                {
                }
                column(TotalBFDebit; ROUND(TotalBFDebit, 1))
                {
                }
                column(TotalCFDebit; ROUND(TotalCFDebit, 1))
                {
                }
                column(Balance2; ROUND(Balance2, 1))
                {
                }
                column(BalancingAmount; BalancingAmount)
                {
                }
                column(BalancingAmount1; BalancingAmount1)
                {
                }
                column(DrCrText; DrCrText)
                {
                }
                column(VLE_DEBIT_LCY; "Debit Amount (LCY)" + BFDebit)
                {
                }
                column(CFDedit1; ROUND(ABS(CFDedit1), 1))
                {
                }
                column(CFCredit1; ROUND(ABS(CFCredit1), 1))
                {
                }
                column(VLE_CREDIT_LCY; ROUND("Credit Amount (LCY)" + BFCredit, 1))
                {
                }
                column(VENDOR_DEBIT_LCY; ROUND("Vendor Ledger Entry"."Debit Amount (LCY)" + TgDecOpedDeb, 1))
                {
                }
                column(VENDOR_CREDIT_LCY; ROUND("Vendor Ledger Entry"."Credit Amount (LCY)" + TgDecOpedCre, 1))
                {
                }
                column(TOT_VENDOR_DEBIT_LCY; ROUND(CFDedit + "Vendor Ledger Entry"."Debit Amount (LCY)" + TgDecOpedDeb, 1))
                {
                }
                column(TOT_VENDOR_CREDIT_LCY; ROUND("Vendor Ledger Entry"."Credit Amount (LCY)" + CFCredit + TgDecOpedCre, 1))
                {
                }
                column(PrintDetail; PrintDetail)
                {
                }
                column(PrintNarration; NarrReq)
                {
                }
                column(PrintComment; Commnt)
                {
                }
                column(TDS_amt; TDSAmt)
                {
                }
                column(TDSTotal; -TDSTotal)
                { }
                column(TDS_Sent; TDSentryDoc)
                {
                }
                column(VendorInvoiceNo; VendorInvoiceNo)//+ ' - ' + FORMAT(VendorInvoiceDate))
                {
                }
                column(VendorDocumentNo; VendorDocumentNo)
                {

                }
                dataitem("G/L Entry"; "G/L Entry")
                {
                    CalcFields = "G/L Account Name";
                    DataItemLink = "Document No." = FIELD("Document No."),
                                   "Posting Date" = FIELD("Posting Date"),
                                   "Transaction No." = FIELD("Transaction No.");
                    DataItemTableView = SORTING("G/L Account No.", "Posting Date")
                                        ORDER(Ascending) where("Document Type" = filter(Invoice));
                    column(DetGSTBaseAmt; DetGSTBaseAmt)
                    {
                    }

                    column(DebAmt; GstAmtTotal)
                    {
                    }
                    column(CrDrText; CrDrText)
                    { }
                    column(GlName; GlName)
                    {
                    }
                    column(GL_AC_no; "G/L Entry"."G/L Account No.")
                    {
                    }
                    column(GL_AC_no1; "G/L Entry"."G/L Account No.")
                    {
                    }
                    column(ControlAccountName; ControlAccountName)
                    {
                    }
                    column(GLEntryDR; GLEntryDR)
                    { }
                    column(GLEntryCR; GLEntryCR)
                    { }
                    // column(GST_Credit; "G/L Entry"."GST Credit")
                    // {
                    // }
                    column(AccountName; AccountName)
                    {
                    }
                    column(DetailAmt; ABS(DetailAmt))
                    {
                    }
                    column(TgGLAmount; ABS(TgGLAmount))
                    {
                    }
                    column(VendorLedgerEntry_DocNo; VendorLedgerEntry."Document No.")
                    {
                    }
                    column(ChequeDetail; ChequeNo + '  -  ' + FORMAT(ChequeDate))
                    {
                    }
                    column(ChequeNo; ChequeNo)
                    {
                    }
                    column(ChequeDate; ChequeDate)
                    {
                    }
                    trigger OnAfterGetRecord()
                    var
                        TlDiscountAmount: Decimal;
                        TlGLEntry: Record "G/L Entry";
                        BankAccLedgEntry: Record "Bank Account Ledger Entry";
                    begin

                        //DrCrText := '';
#pragma warning disable 
                        CurrReport.SHOWOUTPUT(FirstRecord AND (ControlAccountName <> ''));
                        IF CurrReport.SHOWOUTPUT THEN BEGIN
                            DetailAmt := 0;
                            IF PrintDetail THEN
                                DetailAmt := GLEntry.Amount;
                            /*
                              IF DetailAmt > 0 THEN
                                DrCrText := 'Dr';
                              IF DetailAmt < 0 THEN
                                DrCrText := 'Cr';
                            */

                            IF not PrintDetail THEN begin
                                "G/L Entry".CalcFields("G/L Account Name");
                                AccountName := Text16500
                            end ELSE
                                AccountName := "G/L Entry"."G/L Account Name" //:= Daybook.FindGLAccName(GLEntry."Source Type", GLEntry."Entry No.", GLEntry."Source No.", GLEntry."G/L Account No.")
                                                                              //;

                        END;

                        //-------------------------------------------------------------------------------------------------------------------------------------//
                        CLEAR(DetGSTBaseAmt);
                        CLEAR(GstAmtTotal);
                        DetailedGSTLedgerEntry.RESET;
                        DetailedGSTLedgerEntry.SETRANGE("Document No.", "G/L Entry"."Document No.");
                        //DetailedGSTLedgerEntry.SETRANGE("Posting date", "Vendor Ledger Entry"."Posting Date");
                        DetailedGSTLedgerEntry.CALCSUMS("GST Base Amount");   //.................FBTS
                        //IF DetailedGSTLedgerEntry."GST Base Amount" > 0 THEN
                        //    DetailedGSTLedgerEntry.FindFirst;
                        DetailedGSTLedgerEntry.CALCSUMS("GST Amount");
                        DetGSTBaseAmt := DetailedGSTLedgerEntry."GST Base Amount";
                        GstAmtTotal := DetailedGSTLedgerEntry."GST Amount";     //...............FBTS
                        CurrReport.SHOWOUTPUT(FirstRecord AND (ControlAccountName = ''));
                        IF CurrReport.SHOWOUTPUT THEN BEGIN
                            DetailAmt := 0;
                            IF PrintDetail THEN BEGIN
                                DetailAmt := GLEntry.Amount;
                                /*IF GLEntry."GST Credit"=GLEntry."GST Credit"::" " THEN
                                GstAmtTotal:= 0;
                                IF GLEntry."GST Credit"=GLEntry."GST Credit"::"Non-Availment" THEN
                                GstAmtTotal:=0;*/
                                /*
                               IF "G/L Entry"."Document Type" ="G/L Entry"."Document Type"::Invoice THEN BEGIN
                               GstAmtTotal :="G/L Entry"."Debit Amount";
                               //..................FBTS
                                END ELSE
                                IF "G/L Entry"."Document Type" ="G/L Entry"."Document Type"::"Credit Memo" THEN
                                GstAmtTotal :="G/L Entry"."Credit Amount";
                                */
                                /*
                                  IF DetailAmt > 0 THEN
                                    DrCrText := 'Dr';
                                  IF DetailAmt < 0 THEN
                                    DrCrText := 'Cr';
                                    */

                                IF not PrintDetail THEN begin
                                    "G/L Entry".CalcFields("G/L Account Name");
                                    AccountName := Text16500
                                end ELSE
                                    AccountName := "G/L Entry"."G/L Account Name" //:= Daybook.FindGLAccName(GLEntry."Source Type", GLEntry."Entry No.", GLEntry."Source No.", GLEntry."G/L Account No.");

                            END;


                            // TRI S.P. 03.07.12 Add Code Start
                            IF CurrReport.ShowOutput THEN BEGIN
                                IF ("G/L Account No." >= FORMAT(33100)) AND ("G/L Account No." < FORMAT(33199)) THEN
                                    CurrReport.SHOWOUTPUT(false);
                            END;
                            IF ("G/L Account No." >= FORMAT(35150)) AND ("G/L Account No." < FORMAT(35999)) THEN BEGIN
                                TlDiscountAmount := 0;
                                TlGLEntry.RESET;
                                TlGLEntry.CalcFields("G/L Account Name");
                                TlGLEntry.SETFILTER("G/L Account No.", '<>%1', PostGrp."Receivables Account");
                                TlGLEntry.SETRANGE("Document No.", "Vendor Ledger Entry"."Document No.");
                                TlGLEntry.SETRANGE("Posting Date", "Vendor Ledger Entry"."Posting Date");
                                TlGLEntry.SETRANGE("Transaction No.", "Vendor Ledger Entry"."Transaction No.");
                                IF TlGLEntry.FINDFIRST THEN
                                    REPEAT

                                        IF (TlGLEntry."G/L Account No." >= FORMAT(33100)) AND (TlGLEntry."G/L Account No." < FORMAT(33199)) THEN
                                            TlDiscountAmount += TlGLEntry.Amount;
                                    UNTIL TlGLEntry.NEXT = 0;
                                TgGLAmount := "G/L Entry".Amount + TlDiscountAmount;
                            END;
                            IF CurrReport.SHOWOUTPUT THEN BEGIN
                                IF ("G/L Account No." >= FORMAT(35150)) AND ("G/L Account No." < FORMAT(35999)) THEN
                                    TgGLAmount := TgGLAmount
                                ELSE
                                    TgGLAmount := "G/L Entry".Amount;
                                /*
                                  IF TgGLAmount > 0 THEN
                                    DrCrText := 'Dr';
                                  IF TgGLAmount < 0 THEN
                                    DrCrText := 'Cr';
                                */
                            END;
                            // TRI S.P. 03.07.12 Add Code End
                            //--------------------------------------------------------------------------------------------------------------------------//
                            //Sunil 25012021+
                            ChequeNo := '';
                            ChequeDate := 0D;
                            IF ("G/L Entry"."Source No." <> '') AND ("G/L Entry"."Source Type" = "G/L Entry"."Source Type"::"Bank Account") THEN BEGIN
                                IF BankAccLedgEntry.GET("G/L Entry"."Entry No.") THEN BEGIN
                                    ChequeNo := BankAccLedgEntry."Cheque No.";
                                    ChequeDate := BankAccLedgEntry."Cheque Date";
                                END;
                            END;
                            //Sunil 25012021-

                            //CurrReport.SHOWOUTPUT := CurrReport.TOTALSCAUSEDBY = "G/L Entry".FIELDNO("G/L Account No.");
                            IF CurrReport.SHOWOUTPUT THEN
                                CurrReport.SHOWOUTPUT(PrintDetail);
                            IF CurrReport.SHOWOUTPUT THEN BEGIN

                                IF GLEntry.Amount > 0 THEN
                                    DrCrText := 'Dr';
                                IF GLEntry.Amount < 0 THEN
                                    DrCrText := 'Cr';

                                AccountName := Daybook.FindGLAccName("Source Type", "Entry No.", "Source No.", "G/L Account No.");

                                // TRI S.P. 03.07.12 Add Code Start
                                IF CurrReport.SHOWOUTPUT THEN BEGIN
                                    IF ("G/L Account No." >= FORMAT(33100)) AND ("G/L Account No." < FORMAT(33199)) THEN
                                        CurrReport.SHOWOUTPUT(false);
                                END;
                                IF ("G/L Account No." >= FORMAT(35150)) AND ("G/L Account No." < FORMAT(35999)) THEN BEGIN
                                    TlDiscountAmount := 0;
                                    TlGLEntry.RESET;
                                    TlGLEntry.CalcFields("G/L Account Name");
                                    TlGLEntry.SETFILTER("G/L Account No.", '<>%1', PostGrp."Receivables Account");
                                    TlGLEntry.SETRANGE("Document No.", "Vendor Ledger Entry"."Document No.");
                                    TlGLEntry.SETRANGE("Posting Date", "Vendor Ledger Entry"."Posting Date");
                                    TlGLEntry.SETRANGE("Transaction No.", "Vendor Ledger Entry"."Transaction No.");
                                    IF TlGLEntry.FINDFIRST THEN
                                        REPEAT
                                            IF (TlGLEntry."G/L Account No." >= FORMAT(33100)) AND (TlGLEntry."G/L Account No." < FORMAT(33199)) THEN
                                                TlDiscountAmount += TlGLEntry.Amount;
                                        UNTIL TlGLEntry.NEXT = 0;
                                    TgGLAmount := GLEntry.Amount + TlDiscountAmount;
                                END;
                                IF CurrReport.SHOWOUTPUT THEN BEGIN
                                    IF ("G/L Account No." >= FORMAT(35150)) AND ("G/L Account No." < FORMAT(35999)) THEN
                                        TgGLAmount := TgGLAmount
                                    ELSE
                                        TgGLAmount := "G/L Entry".Amount;

                                    IF TgGLAmount > 0 THEN
                                        DrCrText := 'Dr';
                                    IF TgGLAmount < 0 THEN
                                        DrCrText := 'Cr';

                                END;
                                // TRI S.P. 03.07.12 Add Code End
                            END;

                        END;
                        Clear(GLEntryDR);
                        Clear(GLEntryCR);
                        GlName := '';
                        "G/L Entry".CALCFIELDS("G/L Account Name");
                        IF ("G/L Entry"."Debit Amount" > 0) or ("G/L Entry"."Credit Amount" > 0) THEN BEGIN
                            "G/L Entry".SetRange("Document No.", "Vendor Ledger Entry"."Document No.");
                            GlName := "G/L Entry"."G/L Account Name";
                            // MESSAGE('%1', GlName);
                            GLEntryDR += "G/L Entry".Amount;
                            IF "G/L Entry".Amount < 0 THEN begin
                                CrDrText := 'Cr'
                            end else
                                IF "G/L Entry".Amount > 0 THEN
                                    CrDrText := 'Dr'


                        END;

                    end;



                    trigger OnPreDataItem()
                    begin

                        SETFILTER("G/L Account No.", '<>%1', PostGrp."Receivables Account");
                        SETFILTER("Entry No.", '<>%1', "Vendor Ledger Entry"."Entry No.");
                    end;
                }
                // dataitem("Posted Narration"; "Posted Narration")
                // {
                //     DataItemLink = "Transaction No." = FIELD("Transaction No."), "Document No." = field("Document No."),
                //                   "Entry No." = FIELD("Entry No.");
                //     DataItemTableView = SORTING("Entry No.", "Transaction No.", "Line No.", "Document No.");
                //     column(LN_TNo; "Posted Narration"."Transaction No.")
                //     {
                //     }
                //     column(Narration; Narration)
                //     {
                //     }

                // }
                dataitem("Line Narration"; "Posted Narration")
                {
                    DataItemLink = "Transaction No." = FIELD("Transaction No."), "Document No." = field("Document No.");
                    DataItemTableView = SORTING("Entry No.", "Transaction No.", "Line No.")
                                        ;//narrationNewz
                    column(PN_TNo; "Line Narration"."Transaction No.")
                    {
                    }
                    column(Narration1; narration)
                    {
                    }

                    column(Narration2; Narration2)
                    {
                    }
                    column(narrationNew; narrationNew)
                    {
                    }
                    trigger OnAfterGetRecord()
                    var
                        myInt: Integer;
                    begin
                        Clear(narrationNew);
                        PostedNaration.Reset();
                        PostedNaration.SetRange(PostedNaration."Document No.", "Document No.");
                        PostedNaration.SetRange(PostedNaration."Transaction No.", "Transaction No.");
                        if PostedNaration.FindFirst() then
                            narrationNew := PostedNaration.Narration;

                    end;
                }
                dataitem("Purch. Comment Line"; "Purch. Comment Line")
                {
                    DataItemLink = "No." = FIELD("Document No.");
                    DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.");
                    column(PCL_No; "Purch. Comment Line"."No.")
                    {
                    }
                    column(Commnt; Comment)
                    {
                    }
                }

                trigger OnAfterGetRecord()
                var
                    TlGLEntry: Record "G/l Entry";
                    PurchInvHeader: Record "Purch. Inv. Header";
                    TDSEntryRec: Record "TDS Entry";
                begin
                    TDSentryDoc := '';
                    //TDSAmt := 0;

                    CLEAR(CostCenter);
                    CLEAR(LocationCode);
                    CLEAR(PurchComment);
                    RecPurComment.RESET;
                    RecPurComment.SETRANGE(RecPurComment."No.", "Document No.");
                    IF RecPurComment.FINDFIRST THEN
                        PurchComment := RecPurComment.Comment;



                    CostCenter := "Vendor Ledger Entry"."Global Dimension 1 Code";
                    LocationCode := "Vendor Ledger Entry"."Location Code";
                    //Description;//GKG
                    Customer.RESET;
                    Vendor.GET("Vendor No.");
                    PostGrp.RESET;
                    IF PostGrp.GET(Vendor."Vendor Posting Group") THEN
                        //Balance1:=0;
                        //TRI CA 160212 Add Start
                        dbamt := 0;
                    Cramt := 0;

                    IF "Vendor Ledger Entry"."Source Code" = 'REVERSAL' THEN BEGIN
                        Vendle.RESET;
                        Vendle.SETRANGE("Document No.", "Vendor Ledger Entry"."Document No.");
                        Vendle.SETRANGE("Posting Date", "Vendor Ledger Entry"."Posting Date");
                        Vendle.SETRANGE("Vendor No.", "Vendor Ledger Entry"."Vendor No.");
                        Vendle.SETRANGE("Source Code", "Vendor Ledger Entry"."Source Code");
                        IF Vendle.FINDSET THEN
                            REPEAT
                                Vendle.CALCFIELDS(Vendle."Credit Amount (LCY)");
                                Vendle.CALCFIELDS(Vendle."Debit Amount (LCY)");
                                dbamt := -1 * Vendle."Credit Amount (LCY)";
                                Cramt := -1 * Vendle."Debit Amount (LCY)" + Vendle."Total TDS Including SHE CESS";
                            UNTIL Vendle.NEXT = 0;
                    END ELSE
                        IF "Vendor Ledger Entry"."Source Code" = 'FINVOIDCHK' THEN BEGIN
                            Vendle.RESET;
                            Vendle.SETRANGE("Document No.", "Vendor Ledger Entry"."Document No.");
                            Vendle.SETRANGE("Posting Date", "Vendor Ledger Entry"."Posting Date");
                            Vendle.SETRANGE("Vendor No.", "Vendor Ledger Entry"."Vendor No.");
                            Vendle.SETRANGE("Source Code", "Vendor Ledger Entry"."Source Code");
                            IF Vendle.FINDSET THEN
                                REPEAT
                                    Vendle.CALCFIELDS(Vendle."Credit Amount (LCY)");
                                    Vendle.CALCFIELDS(Vendle."Debit Amount (LCY)");
                                    dbamt := Vendle."Debit Amount (LCY)";
                                    Cramt := Vendle."Credit Amount (LCY)" + Vendle."Total TDS Including SHE CESS";
                                UNTIL Vendle.NEXT = 0;
                        END ELSE BEGIN
                            "Vendor Ledger Entry".CALCFIELDS("Credit Amount (LCY)", "Debit Amount (LCY)");
                            dbamt := "Vendor Ledger Entry"."Debit Amount (LCY)";
                            Cramt := "Vendor Ledger Entry"."Credit Amount (LCY)" + Vendle."Total TDS Including SHE CESS";
                        END;

                    //chetan>>>

                    CLEAR(CommNarration);
                    PurchcommentRec.RESET;
                    PurchcommentRec.SETRANGE("No.", "Vendor Ledger Entry"."Document No.");
                    IF PurchcommentRec.FINDFIRST THEN BEGIN
                        REPEAT
                            CommNarration += PurchcommentRec.Comment + '   ';
                        UNTIL PurchcommentRec.NEXT = 0;

                    END ELSE BEGIN
                        // LineNo:=0;
                        narration.RESET;
                        narration.SETRANGE("Document No.", "Vendor Ledger Entry"."Document No.");
                        narration.SETRANGE("Transaction No.", "Vendor Ledger Entry"."Transaction No.");
                        IF narration.FINDSET THEN
                            REPEAT
                                CommNarration += narration.Narration + '  ' + ' ';
                            UNTIL narration.NEXT = 0;

                    END;
                    //chetan<<<<

                    //Sunil +05012019
                    // Clear(TDSTotal);


                    //exit;


                    //Sunil -05012019

                    //Sunil 25012021+
                    CLEAR(VendorInvoiceNo);
                    CLEAR(VendorInvoiceDate);
                    Clear(VendorDocumentNo);
                    IF "Vendor Ledger Entry"."Document Type" = "Vendor Ledger Entry"."Document Type"::Invoice THEN BEGIN
                        //PurchInvHeader.GET("Vendor Ledger Entry"."Document No.");
                        VendorInvoiceNo := "Vendor Ledger Entry"."External Document No.";
                        VendorDocumentNo := "Vendor Ledger Entry"."Document Date";
                        //  VendorInvoiceDate:=PurchInvHeader."Vendor Shipment Date";
                    END;
                    //Sunil 25012021-

                    //TRI CA 160212 Add Stop
                    GLEntry.RESET;
                    //GLEntry.SETFILTER("Source No.", '<>%1', "VendorNo.");
                    //GLEntry.SETCURRENTKEY("Posting Date","Document No.","Global Dimension 1 Code","G/L Account No.");
                    GLEntry.SETFILTER("G/L Account No.", '<>%1', PostGrp."Receivables Account");
                    GLEntry.SETRANGE("Document No.", "Document No.");
                    GLEntry.SETRANGE("Posting Date", "Posting Date");
                    GLEntry.SETRANGE("Transaction No.", "Transaction No.");
                    OnEntryRecord := TRUE;
                    IF GLEntry.FIND('-') THEN BEGIN
                        IF GLEntry.COUNT > 1 THEN
                            OnEntryRecord := FALSE
                        ELSE
                            IF GLEntry.COUNT = 1 THEN BEGIN
                                GLAccount.GET(GLEntry."G/L Account No.");
                                AccountName := GLAccount.Name;
                                IF GLEntry."Source Type" = GLEntry."Source Type"::Customer THEN BEGIN
                                    Customer.RESET;
                                    Customer.SETRANGE("No.", GLEntry."Source No.");
                                    IF Customer.FIND('-') THEN
                                        AccountName := Customer.Name;
                                    CustPostGrp.RESET;
                                    CustPostGrp.SETRANGE(Code, Vendor."Vendor Posting Group");
                                    CustPostGrp.SETRANGE("Payables Account", GLEntry."G/L Account No.");
                                    IF NOT CustPostGrp.FIND('-') THEN BEGIN
                                        GLAccount.RESET;
                                        GLAccount.SETRANGE("No.", GLEntry."G/L Account No.");
                                        IF GLAccount.FIND('-') THEN
                                            AccountName := GLAccount.Name;

                                    END;
                                END
                                ELSE
                                    IF GLEntry."Source Type" = GLEntry."Source Type"::Vendor THEN BEGIN
                                        Vendor.RESET;
                                        Vendor.SETRANGE("No.", GLEntry."Source No.");
                                        IF Vendor.FIND('-') THEN
                                            AccountName := Vendor.Name;
                                        VendPostGrp.RESET;
                                        VendPostGrp.SETRANGE(Code, Vendor."Vendor Posting Group");
                                        VendPostGrp.SETRANGE("Payables Account", GLEntry."G/L Account No.");
                                        IF NOT VendPostGrp.FIND('-') THEN BEGIN
                                            GLAccount.RESET;
                                            GLAccount.SETRANGE("No.", GLEntry."G/L Account No.");
                                            IF GLAccount.FIND('-') THEN
                                                AccountName := GLAccount.Name;
                                        END;
                                    END;
                            END;
                    END;

                    // AccountName := Description;

                    //TRI SYED 130416 START
                    FOR j := 1 TO 1000 DO BEGIN
                        IF VendArr[j] = '' THEN BEGIN
                            FOR k := 1 TO 1000 DO BEGIN
                                IF VendArr[k] <> "Vendor No." THEN BEGIN
                                    VendArr[j] := "Vendor No.";
                                    // Balance3:=0;//
                                    CFDedit1 := 0;
                                    CFCredit1 := 0;
                                    BalancingAmount := 0;
                                    BalancingAmount1 := 0;
                                END;
                            END;
                        END;
                    END;

                    Balance1 := ("Debit Amount (LCY)" - "Credit Amount (LCY)");

                    IF NOT flag THEN BEGIN
                        Balance3 := Balance1 + Balance3 + Balamt;
                        flag := TRUE;
                    END ELSE
                        Balance3 := Balance3 + Balance1;

                    IF Balance3 < 0 THEN BEGIN
                        Txt := 'Cr';
                        CFDedit1 := Balance3;
                        CFCredit1 := 0;
                    END
                    ELSE
                        IF Balance3 > 0 THEN BEGIN
                            Txt := 'Dr';
                            CFDedit1 := 0;
                            CFCredit1 := Balance3;
                        END
                        ELSE BEGIN
                            Txt := '';
                            CFDedit1 := 0;
                            CFCredit1 := 0;
                        END;
                    //TRI SYED 130416 STOP

                    //TRI SYED 130416 COMMENTED

                    // Balance1:=("Debit Amount (LCY)"-"Credit Amount (LCY)");
                    // Balance2:=Balance2+Balance1;
                    // Balance3:=Balance2+Balance3;

                    //TRI SYED 130416 COMMENTED


                    // STEntry.RESET;
                    // STEntry.SETRANGE("Document No.","Document No.");
                    // STEntry.SETRANGE("Posting Date","Posting Date");
                    // IF STEntry.FINDFIRST THEN BEGIN
                    //   STax:=STEntry."Service Tax Amount"+STEntry."eCess Amount"+STEntry."SHE Cess Amount";
                    //   STaxTotal+=STax;
                    // END;

                    //tri shv

                    IF "Vendor Ledger Entry"."Source Code" = 'PAYMENTJNL' THEN
                        "Vendor Ledger Entry"."Source Code" := 'PAY/RCT';

                    IF "Vendor Ledger Entry"."Source Code" = 'BACKOFFICE' THEN
                        "Vendor Ledger Entry"."Source Code" := 'Sales';


                    FORAMT := 0;
                    IF PrintDetail THEN
                        FORAMT := tgBal4
                    ELSE
                        FORAMT := Balance1;//TRI VPS START 210712

                    IF FORAMT > 0 THEN
                        TXT2 := 'Dr'
                    ELSE
                        TXT2 := 'Cr';


                    //TRI SYED 130416 COMMENTED

                    Balamt := 0;
                    Balamt := BFDebit - BFCredit;
                    Balance1 := ("Debit Amount (LCY)" - "Credit Amount (LCY)");
                    Balance2 := Balance2 + Balance1;
                    // Balance3:=Balance2+Balance3+Balamt;

                    Txt := '';
                    IF (Balamt) < 0 THEN
                        Txt := 'Cr'
                    ELSE
                        IF (Balamt) > 0 THEN
                            Txt := 'Dr';

                    //TRI SYED 130416 COMMENTED


                    //------------------------------------------------------------------------------------------------------------------//

                    Txt := '';
                    IF (Balance3) < 0 THEN
                        Txt := 'Cr'
                    ELSE
                        Txt := 'Dr';
                    IF (AccountName = '') AND (CurrReport.SHOWOUTPUT) THEN BEGIN //GKG

                    END;                              //GKG
                    documentnum := '';
                    IF "Source Code" = 'PURCHASES' THEN
                        IF "Document Type" = "Document Type"::"Credit Memo" THEN
                            documentnum := COPYSTR("Document No.", 1, 4);
                    IF (documentnum = 'P-DN') OR ("No. Series" = 'P-D-DN') THEN BEGIN
                        Scode := 'D/Note';
                        // IF "External Document No." <> '' THEN
                        //Description:='Debit Note No.'+"External Document No."
                        // ELSE
                        Description := Description;
                    END ELSE
                        IF (documentnum = 'PPDB') THEN BEGIN
                            Scode := 'P.Ret';
                            crmemhdr.RESET;
                            crmemhdr.SETRANGE("Buy-from Vendor No.", "Vendor No.");
                            crmemhdr.SETRANGE("Posting Date", "Posting Date");
                            crmemhdr.SETRANGE("No.", "Document No.");
                            IF crmemhdr.FIND('-') THEN
                                Description := 'P.Return ' + crmemhdr."Return Order No.";
                            //           MESSAGE('%1',description);
                        END ELSE
                            Scode := "Source Code";

                    IF ("Source Code" = 'PURCHASES') AND ("Document Type" = "Document Type"::"Credit Memo") THEN BEGIN
                        IF STRPOS(Description, 'REC-DB') <> 0 THEN
                            Scode := 'D/Note';
                    END;
                    IF (Scode = 'PURCHASES') AND ("Document Type" = "Document Type"::Invoice) THEN
                        Scode := ScodeDesc;

                    IF "Source Code" = 'PURCHASES' THEN BEGIN
                        IF ("No. Series" = 'P.RETURN.') OR ("No. Series" = 'PRET') THEN BEGIN //OR ("No. Series" = 'P-D-DN')
                            Scode := 'P.Ret';
                            Description := 'Purchase Return No.' + ' ' + "Document No.";
                        END;
                        IF STRPOS("No. Series", 'PP-CRM') <> 0 THEN BEGIN
                            Scode := 'P.Ret';
                            IF STRPOS("Vendor Ledger Entry".Description, 'Return Order') <> 0 THEN BEGIN
                                Description := DELSTR(Description, STRPOS(Description, 'Return Order'), 13);
                                Description := 'Credit Note No. ' + Description;
                            END;
                        END;
                    END;

                    IF (STRPOS("Vendor Ledger Entry".Description, 'REC/') <> 0) OR (STRPOS("Vendor Ledger Entry".Description, 'RECN/') <> 0) THEN BEGIN
                        Scode := 'RCTFY';
                        IF STRPOS(Description, 'Invoice') <> 0 THEN
                            Description := 'Rctfy P. Retr No. ' + Description;
                    END;

                    IF "Source Code" = 'REVERSAL' THEN BEGIN
                        Scode := 'REVR';
                        TlGLEntry.RESET;
                        TlGLEntry.SETRANGE("Document No.", "Document No.");
                        TlGLEntry.SETRANGE("Posting Date", "Posting Date");
                        TlGLEntry.SETRANGE("Source Code", 'REVERSAL');
                        TlGLEntry.SETFILTER("Entry No.", '<>%1', "Entry No.");
                        IF TlGLEntry.FINDFIRST THEN BEGIN
                            //TlGLEntry.CALCFIELDS("G/L Account Name");
                            Description := TlGLEntry."G/L Account Name";
                        END;

                    END;
                    IF "Source Code" = 'JOURNALV' THEN BEGIN
                        Scode := 'Jrnl';
                        TlGLEntry.RESET;
                        TlGLEntry.SETRANGE("Document No.", "Document No.");
                        TlGLEntry.SETRANGE("Posting Date", "Posting Date");
                        TlGLEntry.SETRANGE("Source Code", 'JOURNALV');
                        TlGLEntry.SETFILTER("Entry No.", '<>%1', "Entry No.");
                        IF TlGLEntry.FINDFIRST THEN BEGIN
                            //TlGLEntry.CALCFIELDS("G/L Account Name");
                            Description := TlGLEntry."G/L Account Name";
                        END;
                    END;
                    IF (STRPOS("Vendor Ledger Entry".Description, 'REC/') = 0) AND ("Document Type" = "Document Type"::Invoice) AND (
                      STRPOS(Description, 'PCR') = 0) THEN
                        Description := 'Invoice No' + "External Document No."
                    ELSE
                        IF bankrec.GET("Bal. Account No.") THEN
                            Description := bankrec.Name;
                    IF STRPOS(Description, 'PCR') <> 0 THEN BEGIN
                        Scode := 'C/Note';
                        IF STRPOS(Description, 'Invoice') <> 0 THEN BEGIN
                            Description := DELSTR(Description, STRPOS(Description, 'Invoice'), 8);
                            Description := 'Credit Note No. ' + Description;
                        END;

                    END;

                    IF "Source Code" = 'GENJNL' THEN
                        Scode := 'Jrnl';
                    DimVal.RESET;
                    DimVal.SETRANGE(DimVal.Code, "Vendor Ledger Entry"."Global Dimension 1 Code");
                    IF DimVal.FINDFIRST THEN BEGIN
                        DimName := DimVal.Name;
                    END;

                    //TRI SYED 130416 START
                    IF NOT flag1 THEN BEGIN
                        TotalBFDebit := BFDebit;
                        flag1 := TRUE;
                    END;
                    IF NOT flag2 THEN BEGIN
                        TotalCFDebit := BFCredit;
                        flag2 := TRUE;
                    END;

                    TotalBFDebit += ROUND("Debit Amount (LCY)", 1);
                    TotalCFDebit += ROUND("Credit Amount (LCY)", 1);

                    BalancingAmount := TotalBFDebit + (CFDedit1 * -1);
                    BalancingAmount1 := TotalCFDebit + CFCredit1;

                    //Chetan>>>>>
                    Clear(TDSAmt);
                    Clear(RTDSEntry1);
                    RTDSEntry.RESET;
                    RTDSEntry.SETRANGE("Document No.", "Vendor Ledger Entry"."Document No.");
                    RTDSEntry.SetRange("Transaction No.", "Vendor Ledger Entry"."Transaction No.");
                    RTDSEntry.SetRange("Vendor No.", "Vendor Ledger Entry"."Buy-from Vendor No.");

                    IF RTDSEntry.FINDFIRST THEN BEGIN
                        repeat
                            //  TDSentryDoc := RTDSEntry."Document No.";
                            // IF RTDSEntry."TDS Amount" > 0 THEN
                            //TDSAmt := RTDSEntry."TDS Amount"; //+ ' Dr';
                            //IF RTDSEntry."TDS Amount" < 0 THEN
                            TDSAmt += RTDSEntry."TDS Amount";
                        //+ ' Cr';
                        // TDSTotal += RTDSEntry."TDS Amount";
                        until RTDSEntry.Next() = 0;

                    END;
                    ;





                end;

                trigger OnPreDataItem()
                begin


                    //TRI SYED 130416 START
                    flag := FALSE;
                    flag1 := FALSE;
                    flag2 := FALSE;
                    FOR i := 1 TO 1000 DO BEGIN
                        VendArr[i] := '';
                    END;
                    //TRI SYED 130416 STOP
                    //Balance3:=0;
                    CurrReport.CREATETOTALS(Balance1, Balance2);

                    IF opendate1 <> 0D THEN
                        SETRANGE("Posting Date", opendate1 + 1, enddate1);

                    IF GETFILTER("Posting Date") = '' THEN
                        ERROR('Date Filter is mandatory');
                end;
            }

            trigger OnAfterGetRecord()
            begin

                CompanyInfo.GET;

                IF Cntry.GET(CompanyInfo."Country/Region Code") THEN
                    CompInfoCountry := Cntry.Name;

                //TRI SYED 130416 START
                tgComp := CompanyInfo."Name 2" + ',' + ' ' +
                        CompanyInfo.Address + CompanyInfo."Address 2" + ' ';
                tgComp1 := CompanyInfo.City + '-' + CompanyInfo."Post Code" + ',' + '' + (CompInfoCountry);
                tgComp2 := 'Ph:' + ' ' + CompanyInfo."Phone No." + ',' + ' ' + CompanyInfo."Phone No. 2" + ' ' + 'Fax No.' + ' ' + CompanyInfo."Fax No.";
                tgComp3 := 'Email:' + CompanyInfo."E-Mail" + '-Website:' + CompanyInfo."Home Page";
                //TRI SYED 130416 STOP


                CustAcc.GET("No.");

                CompanyInfo.GET;
                //TRI SYED 130416 COMMENTED
                /*
                IF Cntry.GET(CompanyInfo."Country/Region Code") THEN
                  CompInfoCountry:= Cntry.Name;
                 tgComp:=
                 //CompanyInfo."Name 2"+','+' '+
                         CompanyInfo.Address+' '+','+
                         CompanyInfo."Address 2"+' '+
                         '\'+CompanyInfo.City+'-'+CompanyInfo."Post Code"+','+''+(CompInfoCountry)+' \Ph:'+' '+
                         CompanyInfo."Phone No."+','+' '+
                         CompanyInfo."Phone No. 2"+' '+'Fax No.'+' '+
                         CompanyInfo."Fax No."+'\ Email:'+
                         CompanyInfo."E-Mail"+'-Website:'+
                         CompanyInfo."Home Page";
                */
                //TRI SYED 130416 COMMENTED
                CLEAR(BFCredit);
                CLEAR(BFDebit);
                CLEAR(BFAmount);
                CLEAR(Balamt);
                TgDecOpedCre := 0;
                TgDecOpedDeb := 0;

                BFDebit := 0;
                BFCredit := 0;
                BFAmount := 0;
                IF "Vendor Ledger Entry".GETFILTER("Posting Date") <> '' THEN
                    OpenDate := "Vendor Ledger Entry".GETRANGEMIN("Vendor Ledger Entry"."Posting Date") - 1;
                CustAcc.RESET;
                CustAcc.SETRANGE("No.", "No.");
                CustAcc.SETFILTER("Date Filter", '%1..%2', 0D, OpenDate);
                //IF "Vendor Ledger Entry".GETFILTER("Posting Date") <>'' THEN
                //OpenDate :="Vendor Ledger Entry".GETRANGEMIN("Vendor Ledger Entry"."Posting Date")-1;

                IF "Vendor Ledger Entry".GETFILTER("Global Dimension 1 Code") <> '' THEN
                    CustAcc.SETFILTER("Global Dimension 1 Filter", "Vendor Ledger Entry".GETFILTER("Global Dimension 1 Code"));
                IF "Vendor Ledger Entry".GETFILTER("Global Dimension 2 Code") <> '' THEN
                    CustAcc.SETFILTER("Global Dimension 2 Filter", "Vendor Ledger Entry".GETFILTER("Global Dimension 2 Code"));
                CustAcc.FIND('-');
                CustAcc.CALCFIELDS("Debit Amount (LCY)", "Credit Amount (LCY)");
                IF CustAcc."Debit Amount (LCY)" > CustAcc."Credit Amount (LCY)" THEN
                    BFAmount := CustAcc."Debit Amount (LCY)"
                ELSE
                    BFAmount := CustAcc."Credit Amount (LCY)";
                BFCredit := BFAmount - CustAcc."Debit Amount (LCY)";
                BFDebit := BFAmount - CustAcc."Credit Amount (LCY)";

                TgDecOpedCre := BFCredit;
                TgDecOpedDeb := BFDebit;

                //Balamt:=0;
                //Balamt:= BFDebit-BFCredit;


                Balamt := 0;
                Balamt := BFDebit - BFCredit;

                Balance1 := ("Debit Amount (LCY)" - "Credit Amount (LCY)");
                Balance2 := Balance2 + Balance1;
                // Balance3:=Balance2+Balance3+Balamt;

                //TRI SYED 130416 START
                IF (Balamt) < 0 THEN
                    Txt1 := 'Cr'
                ELSE
                    IF (Balamt) > 0 THEN
                        Txt1 := 'Dr'
                    ELSE
                        Txt1 := '';

                //TRI SYED 130416 STOP

                IF ("Vendor Ledger Entry"."Debit Amount (LCY)" + TgDecOpedDeb) > ("Vendor Ledger Entry"."Credit Amount (LCY)" + TgDecOpedCre) THEN BEGIN
                    CFDedit := 0;
                    CFCredit := "Vendor Ledger Entry"."Debit Amount (LCY)" - "Vendor Ledger Entry"."Credit Amount (LCY)" + TgDecOpedDeb -
                  TgDecOpedCre;
                END ELSE BEGIN
                    CFDedit := "Vendor Ledger Entry"."Credit Amount (LCY)" - "Vendor Ledger Entry"."Debit Amount (LCY)" - TgDecOpedDeb +
                  TgDecOpedCre;
                    CFCredit := 0;
                END;

                /*
                //Trident Vipul 20.04.06 Add start
                IF ("Vendor Ledger Entry"."Debit Amount (LCY)" + TgDecOpedDeb) > ("Vendor Ledger Entry"."Credit Amount (LCY)" + TgDecOpedCre) THEN
                  CrDrText := 'Dr.'
                ELSE IF ("Vendor Ledger Entry"."Debit Amount (LCY)" + TgDecOpedDeb)
                                                                           < ("Vendor Ledger Entry"."Credit Amount (LCY)" + TgDecOpedCre) THEN
                  CrDrText := 'Cr.'
                ELSE
                  CrDrText := '';
                //Trident Vipul 20.04.06 Add stop
                */


                IF ("Vendor Ledger Entry"."Debit Amount (LCY)" + TgDecOpedDeb) > ("Vendor Ledger Entry"."Credit Amount (LCY)" + TgDecOpedCre) THEN BEGIN
                    CFDedit := 0;
                    CFCredit := "Vendor Ledger Entry"."Debit Amount (LCY)" - "Vendor Ledger Entry"."Credit Amount (LCY)" + TgDecOpedDeb -
                  TgDecOpedCre;
                END ELSE BEGIN
                    CFDedit := "Vendor Ledger Entry"."Credit Amount (LCY)" - "Vendor Ledger Entry"."Debit Amount (LCY)" - TgDecOpedDeb +
                  TgDecOpedCre;
                    CFCredit := 0;
                END;

                /*
                //Trident Vipul 20.04.06 Add start
                IF ("Vendor Ledger Entry"."Debit Amount (LCY)" + TgDecOpedDeb) > ("Vendor Ledger Entry"."Credit Amount (LCY)" + TgDecOpedCre) THEN
                  CrDrText := 'Dr.'
                ELSE IF ("Vendor Ledger Entry"."Debit Amount (LCY)" + TgDecOpedDeb)
                                                                           < ("Vendor Ledger Entry"."Credit Amount (LCY)" + TgDecOpedCre) THEN
                  CrDrText := 'Cr.'
                ELSE
                  CrDrText := '';
                //Trident Vipul 20.04.06 Add stop
                */


            end;

            trigger OnPreDataItem()
            begin

                //Vendor1.COPYFILTERS(Vendor2);
                CurrReport.CREATETOTALS("Vendor Ledger Entry"."Credit Amount (LCY)", "Vendor Ledger Entry"."Debit Amount (LCY)");
                // IF RecState.GET("State Code") THEN;

                // Tri Arun 25.11.15
                IF RecStmnt THEN BEGIN
                    Sub := Tx001;
                    Body1 := Tx002;
                    Body2 := Tx003 + ' ' + FORMAT(CloseDt) + ' ' + Tx008 + ' ' + Tx004;
                    Body4 := Tx005;
                    Body5 := Tx006;
                    Body6 := Tx007;
                END ELSE
                    IF ConfAct THEN BEGIN
                        Sub := Tx009 + ' F.Y.' + ' ' + FNYR;
                        Body1 := Tx002;
                        Body2 := Tx010 + ' ' + FNYR + ' ' + Tx011 + ' ' + Tx012 + ' ' + Tx013;
                        Body4 := Tx014;
                        Body5 := Tx015;
                        Body6 := Tx007;
                    END;
                // Tri Arun 25.11.15
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Print Detail"; PrintDetail)
                {
                    ApplicationArea = all;
                }
                field("Print To excel"; PrintToExcel)
                {
                }
                field(NarrReq; NarrReq)
                {
                    // ApplicationArea = all;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin

        STaxTotal := 0;
        STax := 0;
        AccountName := '';
    end;

    trigger OnPostReport()
    var
        //TLVendorLedgerDetailNew: Report "50092";
        TlVendor: Record "Vendor";
        TlVendorLedgerEntry: Record "Vendor Ledger Entry";
    begin
        // Tri Arun 25.11.15 Start
        //CLEAR(SmtpGm);
        /*IF NOT flag5 THEN BEGIN
          // TRI S.P. 22.05.18 Add Code Start
        
          CLEAR(TLVendorLedgerDetailNew);
          TlVendor.RESET;
          TlVendor.COPYFILTERS(Vendor1);
          TlVendorLedgerEntry.RESET;
          TlVendorLedgerEntry.COPYFILTERS("Vendor Ledger Entry");
          IF RecStmnt THEN BEGIN
            IF CONFIRM(Tx016,FALSE) THEN BEGIN
              TLVendorLedgerDetailNew.SetValue(TRUE,FALSE,TRUE,"Vendor Ledger Entry".GETRANGEMIN("Vendor Ledger Entry"."Posting Date"),"Vendor Ledger Entry".GETRANGEMAX("Vendor Ledger Entry"."Posting Date"));
              TLVendorLedgerDetailNew.SETTABLEVIEW(TlVendor);
              TLVendorLedgerDetailNew.SETTABLEVIEW(TlVendorLedgerEntry);
              TLVendorLedgerDetailNew.SAVEASPDF('C:\AutonavReport\Reconcilation.pdf');
              //SmtpGm.EmailReconAccount('Reconcilation.pdf',Vendor1,1,"Vendor Ledger Entry".GETRANGEMIN("Vendor Ledger Entry"."Posting Date")-1,"Vendor Ledger Entry".GETRANGEMAX("Vendor Ledger Entry"."Posting Date"));
            END;
          END ELSE IF ConfAct THEN BEGIN
            IF CONFIRM(Tx017,FALSE) THEN BEGIN
              TLVendorLedgerDetailNew.SetValue(FALSE,TRUE,TRUE,"Vendor Ledger Entry".GETRANGEMIN("Vendor Ledger Entry"."Posting Date"),"Vendor Ledger Entry".GETRANGEMAX("Vendor Ledger Entry"."Posting Date"));
              TLVendorLedgerDetailNew.SETTABLEVIEW(TlVendor);
              TLVendorLedgerDetailNew.SETTABLEVIEW(TlVendorLedgerEntry);
              TLVendorLedgerDetailNew.SAVEASPDF('C:\AutonavReport\AccountConfirmation.pdf');
              //SmtpGm.EmailReconAccount('AccountConfirmation.pdf',Vendor1,1,"Vendor Ledger Entry".GETRANGEMIN("Vendor Ledger Entry"."Posting Date")-1,"Vendor Ledger Entry".GETRANGEMAX("Vendor Ledger Entry"."Posting Date"));
            END;
          END ELSE BEGIN
            IF CONFIRM(Tx018,FALSE) THEN BEGIN
              TLVendorLedgerDetailNew.SetValue(FALSE,FALSE,TRUE,"Vendor Ledger Entry".GETRANGEMIN("Vendor Ledger Entry"."Posting Date"),"Vendor Ledger Entry".GETRANGEMAX("Vendor Ledger Entry"."Posting Date"));
              TLVendorLedgerDetailNew.SETTABLEVIEW(TlVendor);
              TLVendorLedgerDetailNew.SETTABLEVIEW(TlVendorLedgerEntry);
              TLVendorLedgerDetailNew.SAVEASPDF('C:\AutonavReport\AccountStatement.pdf');
        
        
              //SmtpGm.EmailReconAccount('AccountStatement.pdf',Vendor1,1,"Vendor Ledger Entry".GETRANGEMIN("Vendor Ledger Entry"."Posting Date")-1,"Vendor Ledger Entry".GETRANGEMAX("Vendor Ledger Entry"."Posting Date"));
            END;
          END;
          */

        /*
        IF RecStmnt THEN BEGIN
         IF CONFIRM(Tx016,FALSE) THEN
         // SmtpGm.EmailReconAccount('Reconcilation.pdf',Vendor1,1)  //TRI VC 140916 COMMENT
         SmtpGm.EmailReconAccount('Reconcilation.pdf',Vendor1,1,"Vendor Ledger Entry".GETRANGEMIN("Vendor Ledger Entry"."Posting Date")-1,"Vendor Ledger Entry".GETRANGEMAX("Vendor Ledger Entry"."Posting Date")) //TRI VC 140916
        END ELSE IF ConfAct THEN BEGIN
         IF CONFIRM(Tx017,FALSE) THEN
         //SmtpGm.EmailReconAccount('AccountConfirmation.pdf',Vendor1,2); //TRI VC 140916 COMMENT
         SmtpGm.EmailReconAccount('AccountConfirmation.pdf',Vendor1,2,"Vendor Ledger Entry".GETRANGEMIN("Vendor Ledger Entry"."Posting Date")-1,"Vendor Ledger Entry".GETRANGEMAX("Vendor Ledger Entry"."Posting Date")); //TRI VC 140916
        END ELSE BEGIN
         IF CONFIRM(Tx018,FALSE) THEN
          //SmtpGm.EmailReconAccount('AccountSatement.pdf',Vendor1,0); //TRI VC 140916 COMMENT
          SmtpGm.EmailReconAccount('AccountStatement.pdf',Vendor1,0,"Vendor Ledger Entry".GETRANGEMIN("Vendor Ledger Entry"."Posting Date")-1,"Vendor Ledger Entry".GETRANGEMAX("Vendor Ledger Entry"."Posting Date"));//TRI VC 140916
        END;
        */
        // TRI S.P. 22.05.18 Add Code End
        //END;
        // Tri Arun 25.11.15 Start




    end;

    trigger OnPreReport()
    begin

        Company.GET;
        CompanyInfo.CALCFIELDS(Picture);
        VenderDateFilter := "Vendor Ledger Entry".GETFILTER("Posting Date");
        DimFilter := "Vendor Ledger Entry".GETFILTER("Posting Date");
        vedfil := Vendor1.GETFILTER("No.");
        OpenDate := 0D;
        IF "Vendor Ledger Entry".GETFILTER("Posting Date") <> '' THEN BEGIN
            OpenDate := "Vendor Ledger Entry".GETRANGEMIN("Vendor Ledger Entry"."Posting Date") - 1;

            CloseDt := "Vendor Ledger Entry".GETRANGEMAX("Vendor Ledger Entry"."Posting Date");
            //TRI VC 140916 ADD START
        END ELSE BEGIN
            OpenDate := opendate1;
            CloseDt := enddate1;
            VenderDateFilter := FORMAT(opendate1 + 1) + '..' + FORMAT(CloseDt);
            DimFilter := VenderDateFilter;
        END;
        //TRI VC 140916 ADD STOP


        FNYR := FORMAT(OpenDate, 0, '<YEAR,2>');

        FNYR := FNYR + '-' + FORMAT(CloseDt, 0, '<YEAR,2>');
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        BFAmount: Decimal;
        BalancingAmount: Decimal;
        BFDebit: Decimal;
        BFCredit: Decimal;
        CFDedit: Decimal;
        CFCredit: Decimal;
        CustAccLedEntry: Record "Cust. Ledger Entry";
        CustAcc: Record "Vendor";
        BHShowCount: Integer;
        AccountChanged: Boolean;
        GLAccount: Record "G/L Account";
        GLEntry: Record "G/L Entry";
        OnEntryRecord: Boolean;
        TransDebits: Decimal;
        TransCredits: Decimal;
        PageBreakforMonth: Boolean;
        GLRecNo: Integer;
        txtNarration: Text[250];
        Company: Record "Company Information";
        CustPostGrp: Record "Vendor Posting Group";
        VendPostGrp: Record "Vendor Posting Group";
        Customer: Record "Customer";
        Vendor: Record "Vendor";
        AccountName: Text[150];
        PostGrp: Record "Customer Posting Group";
        Narration2: Text[250];
        DimFilter: Text[250];
        DetailReq: Boolean;
        DetailAmt: Decimal;

        narration: Record "Posted Narration";
        DimVal: Record "Dimension Value";
        NarrReq: Boolean;
        gBool_ShowMonth: Boolean;
        QtyDetailReq: Boolean;
        GLEntryDR: Decimal;
        PurchcommentRec: Record "Purch. Comment Line";
        GLEntryCR: Decimal;
        TgDecOpedDeb: Decimal;
        TgDecOpedCre: Decimal;
        CrDrText: Text[3];
        CUSTL: Record "Cust. Ledger Entry";
        DAYS: Text[30];
        tempdate: Date;
        tempdate1: Date;
        OpenDate: Date;
        OpenDte: Text[30];
        DimName: Text[50];
        Balance1: Decimal;
        Balance2: Decimal;
        Balance3: Decimal;
        Commnt: Boolean;

        ExporttoExcel: Boolean;
        ExcelBUff: Record "Excel Buffer" temporary;
        NotDecimalValues: Boolean;
        RowNo: Integer;
        // STEntry: Record "16473";
        STax: Decimal;
        STaxTotal: Decimal;

        CommNarration: text[100];

        Balamt: Decimal;
        Txt: Text[30];
        DrCrText: Text[5];
        FirstRecord: Boolean;
        ControlAccountName: Text[150];
        PrintDetail: Boolean;
        Daybook: Report "Day Book";
        DrCrTextBalance: Text[5];
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        //RecState: Record "13762";
        VenderDateFilter: Text[30];
        SrcCodeText: Text[50];
        tgComp: Text[100];
        CompanyInfo: Record "Company Information";
        Cntry: Record "Country/Region";
        CompInfoCountry: Text[30];
        VendDateFilter: Text[30];
        dbamt: Decimal;
        Cramt: Decimal;
        Vendle: Record "Vendor Ledger Entry";
        Desc: Text[100];
        Des1: Text[100];
        des2: Text[100];
        Textdesc: Text[100];
        bankrec: Record "Bank Account";
        VLEntr: Record "Vendor Ledger Entry";
        Txt1: Text[30];
        venreco: Record "Vendor Ledger Entry";
        glreco: Record "G/L Entry";
        documentnum: Text[50];
        Scode: Code[20];
        crmemhdr: Record "Purch. Cr. Memo Hdr.";
        vedfil: Text[100];
        TgGLAmount: Decimal;
        FORAMT: Decimal;
        tgChk: Boolean;
        tgBal4: Decimal;
        TXT2: Text[2];
        CloseDt: Date;
        "----Tri ARun --------------": Integer;
        Sub: Text[100];
        Body1: Text[1024];
        Body2: Text[1024];
        Body3: Text[1024];
        Body4: Text[1024];
        Body5: Text[1024];
        Body6: Text[1024];
        RecVend: Record "Vendor";
        RecStmnt: Boolean;
        ConfAct: Boolean;
        FNYR: Text[100];
        flag5: Boolean;
        TotalFor: Label 'Total for ';
        Text16500: Label 'As per Details';
        Text000: Label 'Period: %1';
        ScodeDesc: Label 'Pur''s';
        Tx001: Label 'Sub:  Reconciliation of Accounts ';
        Tx002: Label 'Dear Sir,';
        Tx003: Label 'Please find enclosed Statement of Accounts  as on';
        Tx004: Label 'Please reconcile the same and inform us within 15 days any discrepancy in your books of accounts.';
        Tx005: Label 'Kindly inform us in time else it will be assumed that balance appearing in our books as confirmed.';
        Tx006: Label 'Thanking You,';
        Tx007: Label '(Authorised Signatory)';
        Tx008: Label 'appering in Accounts. ';
        //"----------": ;
        Tx009: Label 'Sub: Confirmation of Accounts';
        Tx010: Label 'We enclosed herewith statement of accounts for the financial year';
        Tx011: Label 'for your confirmation.';
        Tx012: Label 'We request you to verify the said statement from your records and confirm the same and also quote your PAN';
        Tx013: Label 'and jurisdiction of Income Tax. We require verified copy within 15 Days time else it shall be assumed as confirmed.';
        Tx014: Label 'Kindly do the needful and oblige.';
        Tx015: Label 'Your''s faithfully,';
        Tx016: Label 'Do You want to send mail Reconciliation of Accounts to the Vendor ?';
        Tx017: Label 'Do You want to send mail Confirmation of Accounts to the Vendor ?';
        Tx018: Label 'Do You want to send mail Accounts Statement to the Vendor ?';
        CFDedit1: Decimal;
        CFCredit1: Decimal;
        flag: Boolean;
        flag1: Boolean;
        flag2: Boolean;
        CRDR: Text;
        BalancingAmount1: Decimal;
        VendArr: array[1000] of Code[20];
        i: Integer;
        j: Integer;
        k: Integer;
        TotalBFDebit: Decimal;
        TotalCFDebit: Decimal;
        tgComp1: Text[100];
        tgComp2: Text[100];
        tgComp3: Text[100];
        opendate1: Date;
        enddate1: Date;
        VendorLedgerEntry1: Record "Vendor Ledger Entry";
        PrintToExcel: Boolean;
        RTDSEntry: Record "TDS Entry";
        RTDSEntry1: Record "TDS Entry";
        TDSentryDoc: Code[20];

        TDSAmt: Decimal;
        TDSTotal: Decimal;
        ChequeNo: Code[50];
        ChequeDate: Date;
        VendorInvoiceNo: Code[40];
        VendorDocumentNo: Date;
        VendorInvoiceDate: Date;
        GstAmtTotal: Decimal;
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        DetGSTBaseAmt: Decimal;
        "GST Credit": Record "G/L Entry";
        RecPurComment: Record "Purch. Comment Line";
        PostedNaration: Record "Posted Narration";
        narrationNew: Text;
        PurchComment: Text;
        GlName: Text;
        CostCenter: Text[50];
        pdate: Date;
        LocationCode: Text[50];

    procedure SetValue(flag3: Boolean; flag1: Boolean; flag2: Boolean; StartDate: Date; EndDate: Date)
    begin
        RecStmnt := flag3;
        ConfAct := flag1;
        flag5 := flag2;
        //TRI VC 140916 ADD START
        opendate1 := StartDate;
        enddate1 := EndDate;
        //TRI VC 140916 ADD STOP
    end;
}

