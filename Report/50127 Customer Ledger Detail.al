report 50127 "Customer Ledger Detail"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'Customer Ledger Detail New';
    RDLCLayout = 'Report/Customer Ledger Detail.rdl';

#pragma warning disable 
    dataset
    {
        dataitem(Customer1; Customer)
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";
            column(Name; Customer1.Name)
            {
            }
            column(Address; Customer1.Address)
            {
            }
            column(companyPic; tgCompInfo.Picture)
            {

            }
            column(Address2; Customer1."Address 2")
            {
            }
            column(City; Customer1.City + '-' + Customer1."State Code")
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
            column(Body4; Body4)
            {
            }
            column(Body5; Body5)
            {
            }
            column(CompanyName; Company.Name)
            {
            }
            column(Body6; Body6)
            {
            }
            column(RecStmnt; RecStmnt)
            {
            }
            column(ConfAct; ConfAct)
            {
            }
            column(CompName; CompanyInfo.Name)
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
            column(PageNo; CurrReport.PAGENO)
            {
            }
            column(CustAccNo; CustAcc."No.")
            {
            }
            column(CustAccName; CustAcc.Name)
            {
            }
            column(CustDateFilter; CustDateFilter)
            {
            }
            column(BFDebit; ROUND(BFDebit, 1))
            {
            }
            column(BFCredit; ROUND(BFCredit, 1))
            {
            }
            column(BFDebit1; ROUND(BFDebit, 1))
            {
            }
            column(Balamt; ROUND(ABS(Balamt), 1))
            {
            }
            column(Balamt1; ROUND(ABS(Balamt), 1))
            {
            }
            column(Txt1; Txt1)
            {
            }
            column(GrandTotalBFDebit; GrandTotalBFDebit)
            {
            }
            column(GrandTotalCFDebit; GrandTotalCFDebit)
            {
            }
            column(CFDedit; ROUND(CFDedit, 1))
            {
            }
            column(CFCredit; ROUND(CFCredit, 1))
            {
            }
            column(GrandBFDebit; ROUND(GrandBFDebit, 1))
            {
            }
            column(GrandCFDebit; ROUND(GrandCFDebit, 1))
            {
            }
            column(opendate; OpenDate)
            {
            }
            column(Closedt; CloseDt)
            {
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                CalcFields = "Debit Amount (LCY)", "Credit Amount (LCY)", "Remaining Amount", "Debit Amount", "Credit Amount";
                DataItemLink = "Customer No." = FIELD("No.");
                DataItemTableView = SORTING("Customer No.", "Posting Date", "Currency Code")
                                    ORDER(Ascending);
                RequestFilterFields = "Posting Date", Reversed;
                column(CUSTEntry_no; "Cust. Ledger Entry"."Entry No.")
                {
                }
                column(CLE_Customer_No; "Cust. Ledger Entry"."Customer No.")
                {
                }
                column(TcsAmount; TcsAmount)
                { }
                column(CLE_Trans_No; "Cust. Ledger Entry"."Transaction No.")
                {
                }
                column(PostingDate_CustLedgerEntry; "Posting Date")
                {
                }
                column(SCode; SCode)
                {
                }
                column(DocumentNo_CustLedgerEntry; "Document No.")
                {
                }
                column(des5; des5)
                {
                }
                column(CurrencyCode_CustLedgerEntry; "Currency Code")
                {
                }
                column(dbamt; dbamt)
                {
                }
                column(Cramt; Cramt)
                {
                }
                column(Bal3; ABS(Balance3))
                {
                }
                column(Txt; Txt)
                {
                }
                column(dbamtround; ROUND(dbamt, 1))
                {
                }
                column(Cramtround; ROUND(Cramt, 1))
                {
                }
                column(dbamt1round; ROUND(dbamt1, 1))
                {
                }
                column(Cramt1round; ROUND(Cramt1, 1))
                {
                }
                column(Bal3round; ROUND(ABS(Balance3), 1))
                {
                }
                column(TransDebits; ROUND(TransDebits, 1))
                {
                }
                column(TransCredits; ROUND(TransCredits, 1))
                {
                }
                column(ForAmt; ROUND(ABS(ForAmt), 1))
                {
                }
                column(DocNo; DocNo)
                {
                }
                column(BFDebit_CustLedgerEntry; ROUND(BFDebit, 1))
                {
                }
                column(BFCredit_CustLedgerEntry; ROUND(BFCredit, 1))
                {
                }
                column(Balamt_CustLedgerEntry; ROUND(Balamt, 1))
                {
                }
                column(TotalBFDebit; ROUND(TotalBFDebit, 1))
                {
                }
                column(TotalCFDebit; ROUND(TotalCFDebit, 1))
                {
                }
                column(CrDrText; CrDrText)
                {
                }
                column(CFDedit_CustLedgerEntry; ROUND(ABS(CFDedit1), 1))
                {
                }
                column(CFCredit_CustLedgerEntry; ROUND(ABS(CFCredit1), 1))
                {
                }
                column(BalancingAmount; ROUND(BalancingAmount, 1))
                {
                }
                column(BalancingAmount1; ROUND(BalancingAmount1, 1))
                {
                }
                column(CrDrText_CustLedgerEntry; CrDrText)
                {
                }
                column(PrintDetail; PrintDetail)
                {
                }
                column(PrintNarration; NarrReq)
                {
                }
                column(ForeignCurrency; ForeignCurrency)
                {
                }
                column(PrintComment; Commnt)
                {
                }
                dataitem("G/L Entry"; "G/L Entry")
                {
                    DataItemLink = "Document No." = FIELD("Document No."),
                                   "Posting Date" = FIELD("Posting Date");
                    DataItemTableView = SORTING("G/L Account No.", "Posting Date")
                                        ORDER(Ascending)
                                        WHERE(Amount = FILTER(<> 0));
                    column(DetGSTBaseAmt; DetGSTBaseAmt)
                    {
                    }

                    column(DebAmt; GstAmtTotal)
                    {
                    }
                    column(AmountGLEntry; AmountGLEntry)
                    { }
                    column(GL_AC_no; "G/L Entry"."G/L Account No.")
                    {
                    }
                    column(ControlAccountName; ControlAccountName)
                    {
                    }

                    column(AccountName; AccountName)
                    {
                    }
                    column(CrDrText_; CrDrText)
                    { }
                    column(DetailAmt; ROUND(ABS(DetailAmt), 1))
                    {
                    }
                    column(TgGLAmount; ROUND(ABS(TgGLAmount), 1))
                    {
                    }

                    trigger OnAfterGetRecord()
                    var
                        TlSalesInvoiceHeader: Record "Sales Invoice Header";
                        TlTransPaymentEntry: Record "LSC Trans. Payment Entry";
                        TlTenderType: Record "LSC Tender Type";
                        TlDiscountAmount: Decimal;
                        TlGLEntry: Record "G/L Entry";
                        TlGlAccount: Record "G/L Account";
                    begin
                        DrCrText := '';
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


                                //GroupFooter4-OnPreSection
                                IF GLEntry.Amount > 0 THEN
                                    DrCrText := 'Dr';
                                IF GLEntry.Amount < 0 THEN
                                    DrCrText := 'Cr';
                                AccountName := Daybook.FindGLAccName("Source Type", "Entry No.", "Source No.", "G/L Account No.");

                                // TRI S.P. 03.07.12 Add Code Start
                                TlGlAccount.GET("G/L Account No.");
                                //IF STRPOS(TlGlAccount.Name,'Dis') <> 0 THEN
                                // CurrReport.SHOWOUTPUT(FALSE);
                                //END;
                                IF ("G/L Account No." >= FORMAT(32150)) AND ("G/L Account No." < FORMAT(32999)) THEN BEGIN
                                    TlDiscountAmount := 0;
                                    TlGLEntry.RESET;
                                    TlGLEntry.SETFILTER("G/L Account No.", '<>%1', PostGrp."Receivables Account");
                                    TlGLEntry.SETRANGE("Document No.", "Cust. Ledger Entry"."Document No.");
                                    TlGLEntry.SETRANGE("Posting Date", "Cust. Ledger Entry"."Posting Date");
                                    TlGLEntry.SETFILTER("Entry No.", '<>%1', "Cust. Ledger Entry"."Entry No.");

                                    //TlGLEntry.SETRANGE("Transaction No.", "Cust. Ledger Entry"."Transaction No.");
                                    IF TlGLEntry.FINDFIRST THEN
                                        REPEAT
                                            TlGlAccount.GET(TlGLEntry."G/L Account No.");
                                            IF STRPOS(TlGlAccount.Name, 'Dis') <> 0 THEN
                                                TlDiscountAmount += TlGLEntry.Amount;
                                        UNTIL TlGLEntry.NEXT = 0;
                                    TgGLAmount := "G/L Entry".Amount + TlDiscountAmount;
                                END;
                                //IF CurrReport.SHOWOUTPUT THEN BEGIN
                                IF ("G/L Account No." >= FORMAT(32150)) AND ("G/L Account No." < FORMAT(32999)) THEN
                                    TgGLAmount := TgGLAmount
                                ELSE
                                    TgGLAmount := "G/L Entry".Amount;
                                IF TgGLAmount > 0 THEN
                                    DrCrText := 'Dr';
                                IF TgGLAmount < 0 THEN
                                    DrCrText := 'Cr';
                                //END;
                                IF ForeignCurrency THEN
                                    TgGLAmount := TgGLAmount * "Cust. Ledger Entry"."Original Currency Factor"
                                ELSE
                                    TgGLAmount := TgGLAmount;
                                // TRI S.P. 03.07.12 Add Code End
                                IF AmountGLEntry = 0 THEN
                                    AmountGLEntry := "G/L Entry".Amount;
                            end;
                        end;
                        AccountName := '';
                        "G/L Entry".CALCFIELDS("G/L Account Name");
                        IF ("G/L Entry"."Debit Amount" > 0) or ("G/L Entry"."Credit Amount" > 0) THEN BEGIN
                            "G/L Entry".SetRange("Document No.", "Cust. Ledger Entry"."Document No.");
                            AccountName := "G/L Entry"."G/L Account Name";
                            // MESSAGE('%1', GlName);
                            AmountGLEntry += "G/L Entry".Amount;
                            IF "G/L Entry".Amount < 0 THEN begin
                                CrDrText := 'Cr'
                            end else
                                IF "G/L Entry".Amount > 0 THEN
                                    CrDrText := 'Dr'


                        END;

                    end;

                    trigger OnPreDataItem()
                    begin
                        FirstRecord := TRUE;
                        SETFILTER("G/L Account No.", '<>%1', PostGrp."Receivables Account");
                        SETFILTER("Entry No.", '<>%1', "Cust. Ledger Entry"."Entry No.");

                    end;

                }
                dataitem("Posted Narration"; "Posted Narration")
                {
                    //Tushar
                    // DataItemLink = " Transaction No." = FIELD("Transaction No."),
                    //                "Entry No." = FIELD("Entry No.");//Tushar
                    DataItemTableView = SORTING("Entry No.", "Transaction No.", "Line No.");
                    column(LN_TNo; "Posted Narration"."Transaction No.")
                    {
                    }
                    column(LN_LNo; "Posted Narration"."Line No.")
                    {
                    }
                    column(Narration; Narration)
                    {
                    }
                }
                dataitem(DataItem1000000004; "Posted Narration")
                {
                    DataItemLink = "Transaction No." = FIELD("Transaction No.");
                    DataItemTableView = SORTING("Entry No.", "Transaction No.", "Line No.")
                                        WHERE("Entry No." = FILTER(0));
                    column(PN_ENo; "Posted Narration"."Entry No.")
                    {
                    }
                    column(PN_TNo; "Posted Narration"."Transaction No.")
                    {
                    }
                    column(PN_LNo; "Posted Narration"."Line No.")
                    {
                    }
                    column(Narration1; Narration)
                    {
                    }
                    column(Narration2; Narration2)
                    {
                    }
                }
                dataitem(DataItem1000000005; "Sales Comment Line")
                {
                    DataItemLink = "No." = FIELD("Document No.");
                    DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.");
                    column(SCL_No; "No.")
                    {
                    }
                    column(Commnt; Comment)
                    {
                    }
                }

                trigger OnAfterGetRecord()
                var
                    TlTransPaymentEntry: Record "LSC Trans. Payment Entry";
                    TlTenderType: Record "LSC Tender Type";
                    TlSalesInvoiceHeader: Record "Sales invoice header";
                begin
                    //shahid
                    // CLEAR(Daybook);
                    CALCFIELDS("Debit Amount", "Credit Amount");
                    //Description11 :='';
                    CLEAR(des5);
                    //TRI Arya
                    IF ForeignCurrency THEN
                        IF "Cust. Ledger Entry"."Currency Code" = '' THEN
                            CurrReport.SKIP;
                    //tri Sunil 311012

                    IF ForeignCurrency THEN
                        IF "Cust. Ledger Entry"."Currency Code" = 'INR' THEN
                            CurrReport.SKIP;


                    IF "Cust. Ledger Entry"."Source Code" = 'SALES' THEN BEGIN
                        SalesinvoiceHeader.RESET;
                        SalesinvoiceHeader.SETRANGE("No.", "Cust. Ledger Entry"."Document No.");
                        IF SalesinvoiceHeader.FINDFIRST THEN BEGIN
                            Description11 := "Cust. Ledger Entry".Description;
                            // CreditMemo3:=DELSTR(Description11,1,11);
                            //DebitNote:= 'Debit Note';
                            //DebitNoteText:= DebitNote+' '+CreditMemo;
                            //MESSAGE(DebitNoteText);
                            //   MESSAGE("Vendor Ledger Entry".Description);//'Invoice'+PurchaseinvoiceHeader."No."
                        END;
                    END ELSE BEGIN
                        IF "Cust. Ledger Entry"."Source Code" = 'PAYMENTJNL' THEN
                            Description11 := "Cust. Ledger Entry"."Document No." //"Vendor Ledger Entry".Description;
                        ELSE
                            IF "Cust. Ledger Entry"."Source Code" = 'JOURNALV' THEN
                                Description11 := "Cust. Ledger Entry"."Document No.";//"Vendor Ledger Entry".Description;
                    END;



                    //TRI CA 160212 Add Start
                    dbamt := 0;
                    Cramt := 0;
                    dbamt1 := 0;
                    Cramt1 := 0;
                    IF "Source Code" = 'REVERSAL' THEN BEGIN
                        Custle.RESET;
                        Custle.SETRANGE("Document No.", "Document No.");
                        Custle.SETRANGE("Posting Date", "Posting Date");
                        //Custle.SETfilter("Source Code",'%1','REVERSAL');
                        Custle.SETRANGE("Customer No.", "Customer No.");
                        IF Custle.FIND('-') THEN BEGIN
                            Custle.CALCFIELDS(Custle."Credit Amount (LCY)", "Credit Amount");
                            Custle.CALCFIELDS(Custle."Debit Amount (LCY)", "Debit Amount");
                            IF ForeignCurrency THEN BEGIN
                                dbamt := Custle."Credit Amount";
                                Cramt := Custle."Debit Amount";
                            END ELSE BEGIN
                                dbamt := Custle."Credit Amount (LCY)";
                                Cramt := Custle."Debit Amount (LCY)";
                                //TRI Arya
                                IF dbamt <> 0 THEN BEGIN
                                    recDetailCLE.RESET;
                                    recDetailCLE.SETRANGE("Cust. Ledger Entry No.", "Entry No.");
                                    IF recDetailCLE.FIND('-') THEN
                                        REPEAT
                                            IF (recDetailCLE."Debit Amount (LCY)" = dbamt) THEN BEGIN
                                                IF recDetailCLE."Entry Type" <> recDetailCLE."Entry Type"::"Initial Entry" THEN BEGIN
                                                    dbamt1 := dbamt;
                                                    dbamt := 0;
                                                END
                                                ELSE
                                                    dbamt1 := 0;
                                            END;
                                            IF (recDetailCLE."Credit Amount (LCY)" = Cramt) THEN BEGIN
                                                IF recDetailCLE."Entry Type" <> recDetailCLE."Entry Type"::"Initial Entry" THEN BEGIN
                                                    Cramt1 := Cramt;
                                                    Cramt := 0;
                                                END
                                                ELSE
                                                    Cramt1 := 0;
                                            END;
                                        UNTIL recDetailCLE.NEXT = 0;
                                END;
                                //TRI Arya      }
                            END;
                        END;
                    END ELSE BEGIN
                        IF ForeignCurrency THEN BEGIN
                            Cramt := "Credit Amount";
                            dbamt := "Debit Amount";
                        END ELSE BEGIN
                            dbamt := "Debit Amount (LCY)";
                            Cramt := "Credit Amount (LCY)";
                            //TRI Arya
                            IF dbamt <> 0 THEN BEGIN
                                recDetailCLE.RESET;
                                recDetailCLE.SETRANGE("Cust. Ledger Entry No.", "Entry No.");
                                IF recDetailCLE.FIND('-') THEN
                                    REPEAT
                                        IF (recDetailCLE."Debit Amount (LCY)" = dbamt) THEN BEGIN
                                            IF recDetailCLE."Entry Type" <> recDetailCLE."Entry Type"::"Initial Entry" THEN BEGIN
                                                dbamt1 := dbamt;
                                                dbamt := 0;
                                            END
                                            ELSE
                                                dbamt1 := 0;
                                        END;
                                        IF (recDetailCLE."Credit Amount (LCY)" = Cramt) THEN BEGIN
                                            IF recDetailCLE."Entry Type" <> recDetailCLE."Entry Type"::"Initial Entry" THEN BEGIN
                                                Cramt1 := Cramt;
                                                Cramt := 0;
                                            END
                                            ELSE
                                                Cramt1 := 0;
                                        END;
                                    UNTIL recDetailCLE.NEXT = 0;
                            END;
                            //TRI Arya
                        END;
                    END;

                    //TRI CA 160212 Add Stop

                    //shaihd

                    DocNo := '';
                    //ACTNAME:='';
                    //Description;//GKG
                    Customer.RESET;
                    Customer.GET("Customer No.");
                    PostGrp.RESET;
                    IF PostGrp.GET(Customer."Customer Posting Group") THEN
                        //Balance1:=0;
                        GLEntry.RESET;
                    //GLEntry.SETFILTER("Source No.", '<>%1', "CustomerNo.");
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
                                    CustPostGrp.SETRANGE(Code, Customer."Customer Posting Group");
                                    CustPostGrp.SETRANGE("Receivables Account", GLEntry."G/L Account No.");
                                    IF NOT CustPostGrp.FIND('-') THEN BEGIN
                                        GLAccount.RESET;
                                        GLAccount.SETRANGE("No.", GLEntry."G/L Account No.");
                                        IF GLAccount.FIND('-') THEN
                                            AccountName := GLAccount.Name;

                                    END;
                                END
                                ELSE
                                    IF GLEntry."Source Type" = GLEntry."Source Type"::Customer THEN BEGIN
                                        Customer.RESET;
                                        Customer.SETRANGE("No.", GLEntry."Source No.");
                                        IF Customer.FIND('-') THEN
                                            AccountName := Customer.Name;
                                        ACTNAME := DELSTR(AccountName, 1, 5);
                                        VendPostGrp.RESET;
                                        VendPostGrp.SETRANGE(Code, Customer."Customer Posting Group");
                                        VendPostGrp.SETRANGE("Receivables Account", GLEntry."G/L Account No.");
                                        IF NOT VendPostGrp.FIND('-') THEN BEGIN
                                            GLAccount.RESET;
                                            GLAccount.SETRANGE("No.", GLEntry."G/L Account No.");
                                            IF GLAccount.FIND('-') THEN
                                                AccountName := GLAccount.Name;   //TRI
                                        END;
                                    END;
                            END;
                    END;

                    // AccountName := "G/L Entry"."G/L Account Name";

                    //TRI SYED 130416 START
                    FOR j := 1 TO 1000 DO BEGIN
                        IF CustArr[j] = '' THEN BEGIN
                            FOR k := 1 TO 1000 DO BEGIN
                                IF CustArr[k] <> "Customer No." THEN BEGIN
                                    CustArr[j] := "Customer No.";
                                    Balance3 := 0;
                                    CFDedit1 := 0;
                                    CFCredit1 := 0;
                                    BalancingAmount := 0;
                                    BalancingAmount1 := 0;
                                END;
                            END;
                        END;
                    END;

                    IF ForeignCurrency THEN
                        Balance1 := ("Debit Amount" - "Credit Amount")
                    ELSE
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



                    IF "Cust. Ledger Entry"."Source Code" = 'PAYMENTJNL' THEN
                        SCode := 'PAY/RCT';

                    IF ("Cust. Ledger Entry"."Source Code" = 'BACKOFFICE') THEN BEGIN
                        CALCFIELDS("Original Amount");
                        IF "Cust. Ledger Entry"."Original Amount" > 0 THEN
                            SCode := 'Sales'
                        ELSE
                            SCode := 'PAY/RCT';

                        IF "Document Type" = "Document Type"::Payment THEN BEGIN
                            des5 := 'Payment ';
                            TlTransPaymentEntry.RESET;
                            TlTransPaymentEntry.SETRANGE("Receipt No.", DELSTR(Description, 1, 8));
                            IF TlTransPaymentEntry.FINDFIRST THEN
                                REPEAT
                                    IF TlTenderType.GET(TlTransPaymentEntry."Store No.", TlTransPaymentEntry."Tender Type") THEN
                                        des5 += TlTenderType.Description + ' ';
                                UNTIL TlTransPaymentEntry.NEXT = 0;
                        END;
                    END;
                    //SHA

                    IF "Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."Document Type"::Invoice THEN BEGIN
                        RecSalesInvHdr.RESET;
                        RecSalesInvHdr.SETRANGE(RecSalesInvHdr."No.", "Cust. Ledger Entry"."Document No.");
                        IF RecSalesInvHdr.FINDFIRST THEN
                            IF RecSalesInvHdr."Location Code" = 'MW-WS' THEN
                                DocNo := RecSalesInvHdr."Order No.";
                    END
                    ELSE
                        DocNo := "Document No.";


                    IF "Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."Document Type"::"Credit Memo" THEN BEGIN
                        RecSalesCrMemoHdr.RESET;
                        RecSalesCrMemoHdr.SETRANGE(RecSalesCrMemoHdr."No.", "Cust. Ledger Entry"."Document No.");
                        IF RecSalesCrMemoHdr.FINDFIRST THEN
                            IF RecSalesCrMemoHdr."Location Code" <> 'MW-WS' THEN
                                DocNo := RecSalesCrMemoHdr."Return Order No.";
                    END;


                    IF "Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."Document Type"::Payment THEN BEGIN
                        RecSalesInvHdr.RESET;
                        RecSalesInvHdr.SETRANGE(RecSalesInvHdr."No.", "Cust. Ledger Entry"."Document No.");
                        IF RecSalesInvHdr.FINDFIRST THEN
                            IF RecSalesInvHdr."Location Code" = 'MW-WS' THEN
                                DocNo := RecSalesInvHdr."Order No.";
                    END;
                    // ELSE
                    //          DocNo:="Cust. Ledger Entry"."Document No.";

                    //TRI SYED 110416 COMMENTED
                    /*
                    //GroupHeader5-OnPreSection
                    Balance1:=("Debit Amount (LCY)"-"Credit Amount (LCY)");//TRI VPS 210712
                    Balance2:=Balance2+Balance1;
                    Balance3:=Balance2+Balance3+Balamt;
                    */
                    //TRI SYED 110416 COMMENTED

                    /*
                    //GroupHeader6-OnPreSection
                    Txt:='';
                    IF Balamt<0 THEN
                    Txt:='Cr'
                    ELSE
                    Txt:='Dr';
                    */
                    //TRI SYED 120416 COMMENTED
                    //Body8-OnPreSection
                    Des := '';
                    des1 := '';
                    des2 := '';
                    Des3 := '';
                    des4 := '';
                    des5 := '';

                    IF GLEntry.ISEMPTY THEN BEGIN
                        GLEntry.SETRANGE("G/L Account No.");
                        IF GLEntry.FIND('-') THEN;
                    END;

                    IF ((Description = CustAcc.Name) AND (GLEntry."G/L Account No." <> '')) THEN
                        Description := Daybook.FindGLAccName(GLEntry."Source Type", GLEntry."Entry No.", GLEntry."Source No.", GLEntry."G/L Account No.");
                    Des := COPYSTR(Description, 1, 5);
                    des1 := COPYSTR(Description, 6);
                    //TRI CA 160212 Add Start
                    IF (Des = 'Order') THEN
                        des2 := des1
                    ELSE BEGIN
                        des2 := Description;
                    END;
                    //DocNo:='';
                    Des3 := COPYSTR(des2, 1, 12);
                    des4 := COPYSTR(des2, 14);
                    //MESSAGE('%1',des4);
                    IF (Des3 = 'Return Order') THEN
                        des5 := des4
                    ELSE
                        des5 := des2;
                    Docu := COPYSTR(DocNo, 1, 2);
                    //IF "Source Code" = 'SALES' THEN
                    IF (Docu = 'WS') THEN
                        des5 := '  WholeSale'
                    ELSE
                        des5 := des5;
                    //TRI CA 160212 Add Stop

                    IF (AccountName = '') AND (CurrReport.SHOWOUTPUT) THEN BEGIN //GKG

                    END;                              //GKG

                    DimVal.RESET;
                    DimVal.SETRANGE(DimVal.Code, "Cust. Ledger Entry"."Global Dimension 1 Code");
                    IF DimVal.FINDFIRST THEN BEGIN
                        DimName := DimVal.Name;
                    END;
                    // TRI S.P. 04.07.12 Add Code Start
                    SCode := "Cust. Ledger Entry"."Source Code";
                    IF "Source Code" = 'JOURNALV' THEN
                        SCode := 'Jrnl';

                    IF STRPOS(Description, 'Slip') = 0 THEN BEGIN
                        IF ("Document Type" = "Document Type"::Invoice) AND ("Source Code" = 'SALES') THEN BEGIN
                            TlSalesInvoiceHeader.RESET;
                            TlSalesInvoiceHeader.SETRANGE("No.", "Document No.");
                            IF TlSalesInvoiceHeader.FINDFIRST THEN BEGIN
                                IF (TlSalesInvoiceHeader."Location Code" = 'MW-WS') OR (TlSalesInvoiceHeader."Location Code" = 'WHOLESALE') THEN
                                    des5 := 'Invoice No. ' + TlSalesInvoiceHeader."Pre-Assigned No."
                                ELSE BEGIN
                                    //IF TlSalesInvoiceHeader."Commercial order No." <> '' THEN
                                    //des5 := 'Export Invoice No. '+ TlSalesInvoiceHeader."Commercial order No."
                                    //ELSE
                                    //des5 :=   'Export Invoice No. ' + TlSalesInvoiceHeader."Order No.";
                                END;
                            END;

                        END;
                    END;
                    //tri sunil
                    IF ("Document Type" = "Document Type"::"Credit Memo") AND ("Source Code" = 'SALES') THEN BEGIN
                        RecSalesCrMemoHdr.RESET;
                        RecSalesCrMemoHdr.SETRANGE("No.", "Document No.");
                        IF RecSalesCrMemoHdr.FINDFIRST THEN
                            //IF RecSalesCrMemoHdr."Location Code" = 'WHOLESALE' THEN
                            des5 := RecSalesCrMemoHdr."Pre-Assigned No."
                    END;

                    // tri sunil

                    IF STRPOS(Description, 'Slip') <> 0 THEN BEGIN
                        des5 := DELSTR(Description, 1, 5);
                        IF STRPOS(des5, 'KB') - 1 > 0 THEN
                            des5 := 'Invoice No. ' + DELSTR(des5, 1, STRPOS(des5, 'KB') - 1);
                        IF STRPOS(des5, 'STX') - 1 > 0 THEN
                            des5 := 'Invoice No. ' + DELSTR(des5, 1, STRPOS(des5, 'STX') - 1);
                        IF STRPOS(des5, 'ST') - 1 > 0 THEN
                            des5 := 'Invoice No. ' + DELSTR(des5, 1, STRPOS(des5, 'ST') - 1);

                    END;

                    IF "Source Code" = 'REVERSAL' THEN
                        SCode := 'REVR';

                    IF ("Cust. Ledger Entry"."Source Code" = 'BACKOFFICE') THEN BEGIN
                        IF "Document Type" = "Document Type"::Payment THEN BEGIN
                            des5 := '';
                            IF STRPOS(Description, 'Payment') <> 0 THEN BEGIN
                                TlTransPaymentEntry.RESET;
                                TlTransPaymentEntry.SETRANGE("Receipt No.", DELSTR("Cust. Ledger Entry".Description, 1, 8));
                                IF TlTransPaymentEntry.FINDFIRST THEN BEGIN
                                    REPEAT
                                        IF TlTenderType.GET(TlTransPaymentEntry."Store No.", TlTransPaymentEntry."Tender Type") THEN
                                            des5 += TlTenderType.Description + ' ';
                                    UNTIL TlTransPaymentEntry.NEXT = 0;
                                END;
                            END ELSE
                                des5 := Description;
                        END;
                        IF "Document Type" = "Document Type"::" " THEN BEGIN
                            des5 := 'Cash';
                            SCode := 'C/Note';
                        END;

                        CALCFIELDS("Original Amount");
                        IF "Cust. Ledger Entry"."Original Amount" > 0 THEN
                            SCode := 'Sales'
                        ELSE
                            SCode := 'PAY/RCT';
                        IF "Document Type" = "Document Type"::"Credit Memo" THEN BEGIN
                            SCode := 'S. Ret';
                            //des5 := DELSTR(Description,1,5);
                            IF STRPOS(des5, 'KB') - 1 > 0 THEN
                                des5 := 'Sales Return No. ' + DELSTR(des5, 1, STRPOS(des5, 'KB') - 1);
                            IF STRPOS(des5, 'STX') - 1 > 0 THEN
                                des5 := 'Sales Return No. ' + DELSTR(des5, 1, STRPOS(des5, 'STX') - 1);
                            IF STRPOS(des5, 'ST') - 1 > 0 THEN
                                des5 := 'Sales Return No. ' + DELSTR(des5, 1, STRPOS(des5, 'ST') - 1);

                        END;
                    END ELSE BEGIN
                        IF ("Document Type" = "Document Type"::"Credit Memo") THEN BEGIN
                            IF STRPOS(Description, 'Return') <> 0 THEN
                                SCode := 'S. Ret'
                            ELSE
                                SCode := 'c/note';
                        END;
                    END;
                    IF "Source Code" = 'PAYMENTJNL' THEN
                        SCode := 'PAY/RCT';
                    // TRI S.P. 04.07.12 Add Code End

                    //Body9-OnPreSection

                    Des := '';
                    des1 := '';
                    des2 := '';
                    Des3 := '';
                    des4 := '';
                    des5 := '';


                    IF ((Description = CustAcc.Name) AND (GLEntry."G/L Account No." <> '')) THEN
                        IF Description = CustAcc.Name THEN
                            Description := Daybook.FindGLAccName(GLEntry."Source Type", GLEntry."Entry No.", GLEntry."Source No.", GLEntry."G/L Account No.");
                    Des := COPYSTR(Description, 1, 5);
                    des1 := COPYSTR(Description, 6);
                    //TRI CA 160212 Add Start
                    IF (Des = 'Order') THEN
                        des2 := des1
                    ELSE BEGIN
                        des2 := Description;
                    END;
                    //DocNo:='';
                    Des3 := COPYSTR(des2, 1, 12);
                    des4 := COPYSTR(des2, 14);
                    //MESSAGE('%1',des4);
                    IF (Des3 = 'Return Order') THEN
                        des5 := des4
                    ELSE
                        des5 := des2;
                    Docu := COPYSTR(DocNo, 1, 2);
                    //IF "Source Code" = 'SALES' THEN
                    /*IF (Docu = 'WS')  THEN
                     des5:='  WholeSale'
                    ELSE
                      des5:=des5;*/
                    //TRI CA 160212 Add Stop

                    IF (AccountName = '') AND (CurrReport.SHOWOUTPUT) THEN BEGIN //GKG

                    END;                              //GKG

                    DimVal.RESET;
                    DimVal.SETRANGE(DimVal.Code, "Cust. Ledger Entry"."Global Dimension 1 Code");
                    IF DimVal.FINDFIRST THEN BEGIN
                        DimName := DimVal.Name;
                    END;
                    // TRI S.P. 04.07.12 Add Code Start
                    SCode := "Cust. Ledger Entry"."Source Code";
                    IF "Source Code" = 'JOURNALV' THEN
                        SCode := 'Jrnl';

                    IF STRPOS(Description, 'Slip') = 0 THEN BEGIN
                        IF ("Document Type" = "Document Type"::Invoice) AND ("Source Code" = 'SALES') THEN BEGIN
                            TlSalesInvoiceHeader.RESET;
                            TlSalesInvoiceHeader.SETRANGE("No.", "Document No.");
                            IF TlSalesInvoiceHeader.FINDFIRST THEN BEGIN
                                IF (TlSalesInvoiceHeader."Location Code" = 'MW-WS') OR (TlSalesInvoiceHeader."Location Code" = 'WHOLESALE') THEN BEGIN
                                    IF (TlSalesInvoiceHeader."Order No." <> '') THEN
                                        des5 := 'Invoice No. ' + TlSalesInvoiceHeader."Order No."
                                    ELSE
                                        des5 := 'Invoice No. ' + TlSalesInvoiceHeader."Pre-Assigned No.";
                                END //ELSE BEGIN
                                    /*IF TlSalesInvoiceHeader."Commercial order No." <> '' THEN
                                     des5 := 'Export Invoice No. '+ TlSalesInvoiceHeader."Commercial order No."
                                     ELSE
                                     des5 :=   'Export Invoice No. ' + TlSalesInvoiceHeader."Order No.";
                                    END;*/

                            END;

                        END;
                    END;



                    IF STRPOS(Description, 'Slip') <> 0 THEN BEGIN
                        des5 := DELSTR(Description, 1, 5);
                        IF STRPOS(des5, 'KB') - 1 > 0 THEN
                            des5 := 'Invoice No. ' + DELSTR(des5, 1, STRPOS(des5, 'KB') - 1);
                        IF STRPOS(des5, 'STX') - 1 > 0 THEN
                            des5 := 'Invoice No. ' + DELSTR(des5, 1, STRPOS(des5, 'STX') - 1);
                        IF STRPOS(des5, 'ST') - 1 > 0 THEN
                            des5 := 'Invoice No. ' + DELSTR(des5, 1, STRPOS(des5, 'ST') - 1);

                    END;

                    IF "Source Code" = 'REVERSAL' THEN
                        SCode := 'REVR';

                    IF ("Cust. Ledger Entry"."Source Code" = 'BACKOFFICE') THEN BEGIN
                        IF "Document Type" = "Document Type"::Payment THEN BEGIN
                            des5 := '';
                            IF STRPOS(Description, 'Payment') <> 0 THEN BEGIN
                                TlTransPaymentEntry.RESET;
                                TlTransPaymentEntry.SETRANGE("Receipt No.", DELSTR("Cust. Ledger Entry".Description, 1, 8));
                                IF TlTransPaymentEntry.FINDFIRST THEN BEGIN
                                    REPEAT
                                        IF TlTenderType.GET(TlTransPaymentEntry."Store No.", TlTransPaymentEntry."Tender Type") THEN
                                            des5 += TlTenderType.Description + ' ';
                                    UNTIL TlTransPaymentEntry.NEXT = 0;
                                END;
                            END ELSE
                                des5 := Description;
                        END;
                        IF "Document Type" = "Document Type"::" " THEN BEGIN
                            des5 := 'Cash';
                            SCode := 'C/Note';
                        END;

                        CALCFIELDS("Original Amount");
                        IF "Cust. Ledger Entry"."Original Amount" > 0 THEN
                            SCode := 'Sales'
                        ELSE
                            SCode := 'PAY/RCT';
                        IF "Document Type" = "Document Type"::"Credit Memo" THEN BEGIN
                            SCode := 'S. Ret';
                            des5 := DELSTR(Description, 1, 5);
                            IF STRPOS(des5, 'KB') - 1 > 0 THEN
                                des5 := 'Sales Return No. ' + DELSTR(des5, 1, STRPOS(des5, 'KB') - 1);
                            IF STRPOS(des5, 'STX') - 1 > 0 THEN
                                des5 := 'Sales Return No. ' + DELSTR(des5, 1, STRPOS(des5, 'STX') - 1);
                            IF STRPOS(des5, 'ST') - 1 > 0 THEN
                                des5 := 'Sales Return No. ' + DELSTR(des5, 1, STRPOS(des5, 'ST') - 1);

                        END;
                    END ELSE BEGIN
                        IF ("Document Type" = "Document Type"::"Credit Memo") THEN BEGIN
                            IF STRPOS(Description, 'Return') <> 0 THEN
                                SCode := 'S. Ret'
                            ELSE
                                SCode := 'c/note';
                        END;
                    END;
                    IF "Source Code" = 'PAYMENTJNL' THEN
                        SCode := 'PAY/RCT';
                    // TRI S.P. 04.07.12 Add Code End


                    //Body10-OnPreSection
                    //TRI Arya 17-07-12 Add Start
                    IF dbamt1 <> 0 THEN
                        Balance3 := Balance3 + dbamt1;

                    IF Cramt1 <> 0 THEN
                        Balance3 := Balance3 - Cramt1;
                    //TRI Arya 17-07-12 Add Stop

                    IF ForeignCurrency THEN BEGIN
                        IF NOT flag1 THEN BEGIN
                            TotalBFDebit := BFDebit;
                            flag1 := TRUE;
                        END;
                        IF NOT flag2 THEN BEGIN
                            TotalCFDebit := BFCredit;
                            flag2 := TRUE;
                        END;
                    END ELSE BEGIN
                        IF NOT flag1 THEN BEGIN
                            TotalBFDebit := BFDebit;
                            flag1 := TRUE;
                        END;
                        IF NOT flag2 THEN BEGIN
                            TotalCFDebit := BFCredit;
                            flag2 := TRUE;
                        END;
                    END;

                    IF ForeignCurrency THEN BEGIN
                        TotalBFDebit += "Debit Amount";
                        TotalCFDebit += "Credit Amount"
                    END ELSE BEGIN
                        TotalBFDebit += ROUND("Debit Amount (LCY)", 1);
                        TotalCFDebit += ROUND("Credit Amount (LCY)", 1);
                    END;
                    //TRI SYED 130416 STOP

                    IF ForeignCurrency THEN BEGIN
                        IF ("Debit Amount" + BFDebit) > ("Credit Amount" + BFCredit) THEN
                            CrDrText := 'Dr.'
                        ELSE
                            IF ("Debit Amount" + BFDebit) < ("Credit Amount" + BFCredit) THEN
                                CrDrText := 'Cr.'
                            ELSE
                                CrDrText := '';

                    END ELSE BEGIN
                        IF ("Debit Amount (LCY)" + BFDebit) > ("Credit Amount (LCY)" + BFCredit) THEN
                            CrDrText := 'Dr.'
                        ELSE
                            IF ("Debit Amount (LCY)" + BFDebit) < ("Credit Amount (LCY)" + BFCredit) THEN
                                CrDrText := 'Cr.'
                            ELSE
                                CrDrText := '';
                    END;
                    //Trident Vipul 20.04.06 Add stop

                    //TRI SYED 120416 START
                    BalancingAmount := TotalBFDebit + (CFDedit1 * -1);
                    BalancingAmount1 := TotalCFDebit + CFCredit1;
                    //TRI SYED 120416 STOP

                    //Transfooter14 - OnPreSection
                    IF NOT ForeignCurrency THEN BEGIN

                        //TRI VPS START 230711
                        IF NOT ForeignCurrency THEN BEGIN
                            Balance1 := (Balance1);
                            tgBal4 := (tgBal4);
                        END;

                        IF PrintDetail THEN
                            ForAmt := tgBal4
                        ELSE
                            ForAmt := Balance1;
                        //TRI VPS STOP 230712
                    END ELSE

                        //Transfooter15 - OnPreSection

                        IF ForeignCurrency THEN BEGIN
                            //TRI VPS START 210711
                            IF NOT tgChk THEN BEGIN
                                Balance1 := Balance1 + Balamt;
                                tgChk := TRUE;
                            END ELSE
                                Balance1 := Balance1;
                            //TRI VPS STOP 210711


                            IF PrintDetail THEN
                                ForAmt := tgBal4
                            ELSE
                                ForAmt := Balance1;
                            //TRI VPS STOP 230712
                        END;

                    //dbamtt+=dbamt;
                    //Cramtt+=Cramt;

                end;

                trigger OnPreDataItem()
                begin
                    //TRI SYED 130416 START

                    flag := FALSE;
                    flag1 := FALSE;
                    flag2 := FALSE;
                    FOR i := 1 TO 1000 DO BEGIN
                        CustArr[i] := '';
                    END;
                    //TRI SYED 13
                    //0416 STOP
                end;
            }

            trigger OnAfterGetRecord()
            begin
                Clear(TcsAmount);
                TcsEntry.Reset();
                TcsEntry.SetRange("Document No.", "Cust. Ledger Entry"."Document No.");
                TcsEntry.CalcSums("TCS Amount");
                if TcsEntry.FindFirst() then
                    TcsAmount += TcsEntry."TCS Amount";
                //Message('%1', TcsAmount);
                /////
                IF ForeignCurrency THEN BEGIN
                    RecCLE.RESET;
                    RecCLE.SETRANGE(RecCLE."Customer No.", Customer."No.");
                    IF (RecCLE.FINDFIRST) AND (RecCLE."Currency Code" = '') AND (RecCLE."Currency Code" = 'INR') THEN
                        CurrReport.SKIP;
                END;


                //GroupHeader3-OnPreSection
                CompanyInfo.GET;
                CompanyInfo.CALCFIELDS(Picture);

                IF Cntry.GET(CompanyInfo."Country/Region Code") THEN
                    CompInfoCountry := Cntry.Name;

                //TRI SYED 130416 START
                tgComp := CompanyInfo."Name 2" + ',' + ' ' +
                        CompanyInfo.Address + CompanyInfo."Address 2" + ' ';
                tgComp1 := CompanyInfo.City + '-' + CompanyInfo."Post Code" + ',' + '' + (CompInfoCountry);
                tgComp2 := 'Ph:' + ' ' + CompanyInfo."Phone No." + ',' + ' ' + CompanyInfo."Phone No. 2" + ' ' + 'Fax No.' + ' ' + CompanyInfo."Fax No.";
                tgComp3 := 'Email:' + CompanyInfo."E-Mail" + '-Website:' + CompanyInfo."Home Page";
                //TRI SYED 130416 STOP

                //CurrReport.SHOWOUTPUT := ((CurrReport.TOTALSCAUSEDBY = FIELDNO("No.")));
                //AND ((CurrReport.PAGENO = 1) OR (AccountChanged)));
                //IF CurrReport.SHOWOUTPUT THEN
                //CurrReport.SHOWOUTPUT(ForeignCurrency);

                CustAcc.GET("No.");


                //IF (CurrReport.TOTALSCAUSEDBY = FIELDNO("No."))THEN BEGIN
                TgDecOpedCre := 0;
                TgDecOpedDeb := 0;

                //CurrReport.SHOWOUTPUT(TRUE);

                BFDebit := 0;
                BFCredit := 0;
                BFAmount := 0;

                CustAcc.RESET;
                CustAcc.SETRANGE("No.", "No.");

                CustAcc.SETFILTER("Date Filter", '%1..%2', 0D, OpenDate); //TRI A.S 19.07.08
                IF ForeignCurrency THEN
                    CustAcc.SETFILTER("Currency Filter", '<>%1', '');


                IF "Cust. Ledger Entry".GETFILTER("Global Dimension 1 Code") <> '' THEN
                    CustAcc.SETFILTER("Global Dimension 1 Filter", "Cust. Ledger Entry".GETFILTER("Global Dimension 1 Code"));
                IF "Cust. Ledger Entry".GETFILTER("Global Dimension 2 Code") <> '' THEN
                    CustAcc.SETFILTER("Global Dimension 2 Filter", "Cust. Ledger Entry".GETFILTER("Global Dimension 2 Code"));
                CustAcc.FIND('-');
                CustAcc.CALCFIELDS("Debit Amount (LCY)", "Credit Amount (LCY)", "Debit Amount", "Credit Amount");
                IF NOT ForeignCurrency THEN BEGIN

                    IF CustAcc."Debit Amount (LCY)" > CustAcc."Credit Amount (LCY)" THEN
                        BFAmount := CustAcc."Debit Amount (LCY)"
                    ELSE
                        BFAmount := CustAcc."Credit Amount (LCY)";
                    BFCredit := BFAmount - CustAcc."Debit Amount (LCY)";
                    BFDebit := BFAmount - CustAcc."Credit Amount (LCY)";
                END ELSE BEGIN
                    IF CustAcc."Debit Amount" > CustAcc."Credit Amount" THEN
                        BFAmount := CustAcc."Debit Amount"
                    ELSE
                        BFAmount := CustAcc."Credit Amount";
                    BFCredit := BFAmount - CustAcc."Debit Amount";
                    BFDebit := BFAmount - CustAcc."Credit Amount";

                END;
                TgDecOpedCre := BFCredit;
                //*************** Comment *****************
                /*
                END ELSE IF  ((CustAcc."Debit Amount (LCY)" = 0) AND (CustAcc."Credit Amount (LCY)"=0)) THEN
                  BFCredit :=  "Cust. Ledger Entry".Amount;
                  BFDebit :=  "Cust. Ledger Entry".Amount;
                */


                //END ELSE
                //  CurrReport.SHOWOUTPUT(FALSE);
                //END;
                TgDecOpedDeb := BFDebit;

                Balamt := 0;
                Balamt := BFDebit - BFCredit;
                IF Balamt < 0 THEN
                    Txt1 := 'Cr'
                ELSE
                    Txt1 := 'Dr';
                IF Balamt = 0 THEN
                    Txt1 := '';

                //GroupFooter6-OnPreSection
                IF ForeignCurrency THEN BEGIN
                    IF ("Cust. Ledger Entry"."Debit Amount" + TgDecOpedDeb) > ("Cust. Ledger Entry"."Credit Amount" + TgDecOpedCre) THEN BEGIN
                        CFDedit := 0;
                        CFCredit := "Cust. Ledger Entry"."Debit Amount" - "Cust. Ledger Entry"."Credit Amount" + TgDecOpedDeb -
                      TgDecOpedCre;
                    END ELSE BEGIN
                        CFDedit := "Cust. Ledger Entry"."Credit Amount" - "Cust. Ledger Entry"."Debit Amount" - TgDecOpedDeb +
                      TgDecOpedCre;
                        CFCredit := 0;
                    END;

                    IF ("Cust. Ledger Entry"."Debit Amount" + TgDecOpedDeb) > ("Cust. Ledger Entry"."Credit Amount" + TgDecOpedCre) THEN
                        CrDrText := 'Dr.'
                    ELSE
                        IF ("Cust. Ledger Entry"."Debit Amount" + TgDecOpedDeb)
                                                                              < ("Cust. Ledger Entry"."Credit Amount" + TgDecOpedCre) THEN
                            CrDrText := 'Cr.'
                        ELSE
                            CrDrText := '';
                    GrandTotalBFDebit := ("Cust. Ledger Entry"."Debit Amount" + TgDecOpedDeb);
                    GrandTotalCFDebit := ("Cust. Ledger Entry"."Credit Amount" + TgDecOpedCre);
                    GrandBFDebit := CFDedit + "Cust. Ledger Entry"."Debit Amount" + TgDecOpedDeb;
                    GrandCFDebit := "Cust. Ledger Entry"."Credit Amount" + CFCredit + TgDecOpedCre;
                END ELSE BEGIN
                    IF ("Cust. Ledger Entry"."Debit Amount (LCY)" + TgDecOpedDeb) > ("Cust. Ledger Entry"."Credit Amount (LCY)" + TgDecOpedCre) THEN BEGIN
                        CFDedit := 0;
                        CFCredit := ROUND("Cust. Ledger Entry"."Debit Amount (LCY)" - "Cust. Ledger Entry"."Credit Amount (LCY)" + TgDecOpedDeb -
                      TgDecOpedCre, 1);
                    END ELSE BEGIN
                        CFDedit := ROUND("Cust. Ledger Entry"."Credit Amount (LCY)" - "Cust. Ledger Entry"."Debit Amount (LCY)" - TgDecOpedDeb +
                      TgDecOpedCre, 1);
                        CFCredit := 0;
                    END;
                    GrandTotalBFDebit := ROUND("Cust. Ledger Entry"."Debit Amount (LCY)" + TgDecOpedDeb, 1);
                    GrandTotalCFDebit := ROUND("Cust. Ledger Entry"."Credit Amount (LCY)" + TgDecOpedCre, 1);
                    GrandBFDebit := ROUND(CFDedit + "Cust. Ledger Entry"."Debit Amount (LCY)" + TgDecOpedDeb, 1);
                    GrandCFDebit := ROUND("Cust. Ledger Entry"."Credit Amount (LCY)" + CFCredit + TgDecOpedCre, 1);
                    //Trident Vipul 20.04.06 Add start
                    IF ("Cust. Ledger Entry"."Debit Amount (LCY)" + TgDecOpedDeb) > ("Cust. Ledger Entry"."Credit Amount (LCY)" + TgDecOpedCre) THEN
                        CrDrText := 'Dr.'
                    ELSE
                        IF ("Cust. Ledger Entry"."Debit Amount (LCY)" + TgDecOpedDeb)
                                                                              < ("Cust. Ledger Entry"."Credit Amount (LCY)" + TgDecOpedCre) THEN
                            CrDrText := 'Cr.'
                        ELSE
                            CrDrText := '';
                END;
                //Trident Vipul 20.04.06 Add stop



            end;

            trigger OnPreDataItem()
            begin
                //Tushar//   IF RecState.GET("State Code") THEN;

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
                field("Foreign Currency"; ForeignCurrency)
                {
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
        TlCustomer: Record "Customer";
        TlCustLedgerEntry: Record "Cust. Ledger Entry";
    //  RepCustomerLedgerDetail: Report "50091";
    begin


    end;

    trigger OnPreReport()
    begin
        Clear(tgCompInfo);
        tgCompInfo.get;
        tgCompInfo.CalcFields(Picture);
        Company.GET;
        CustDateFilter := "Cust. Ledger Entry".GETFILTER("Posting Date");
        IF "Cust. Ledger Entry".GETFILTER("Posting Date") <> '' THEN
            OpenDate := "Cust. Ledger Entry".GETRANGEMIN("Cust. Ledger Entry"."Posting Date") - 1;
        IF "Cust. Ledger Entry".GETFILTER("Posting Date") <> '' THEN
            CloseDt := "Cust. Ledger Entry".GETRANGEMAX("Cust. Ledger Entry"."Posting Date");

        FNYR := FORMAT(OpenDate, 0, '<YEAR,2>');

        FNYR := FNYR + '-' + FORMAT(CloseDt, 0, '<YEAR,2>');
    end;

    var
        GstAmtTotal: Decimal;
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        DetGSTBaseAmt: Decimal;
        TcsEntry: Record "TCS Entry";
        TcsAmount: Decimal;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        BFAmount: Decimal;
        BalancingAmount: Decimal;
        BFDebit: Decimal;
        BFCredit: Decimal;
        CFDedit: Decimal;
        CFCredit: Decimal;
        CustAccLedEntry: Record "Cust. Ledger Entry";
        CustAcc: Record "Customer";
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
        CustPostGrp: Record "Customer Posting Group";
        VendPostGrp: Record "Customer Posting Group";
        Customer: Record "Customer";
        AccountName: Text[50];
        PostGrp: Record "Customer Posting Group";
        Narration2: Text[250];
        DetailReq: Boolean;
        DetailAmt: Decimal;
        DimVal: Record "Dimension Value";
        NarrReq: Boolean;
        gBool_ShowMonth: Boolean;
        QtyDetailReq: Boolean;
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
        Balamt: Decimal;
        Txt: Text[30];
        Txt1: Text[30];
        DrCrText: Text[5];
        FirstRecord: Boolean;
        ControlAccountName: Text[150];
        PrintDetail: Boolean;
        Daybook: Report "Day Book";
        DrCrTextBalance: Text[5];
        CustLedgerEntry: Record "Cust. Ledger Entry";
        // RecState: Record "13762";
        CustDateFilter: Text[30];
        SrcCodeText: Text[50];
        CompInfo: Record "Company Information";
        tgComp: Text[100];
        CompanyInfo: Record "Company Information";
        CompInfoCountry: Text[30];
        Cntry: Record "Country/Region";
        DocNo: Code[20];
        RecSalesInvHdr: Record "Sales Invoice Header";
        RecGLEntry: Record "G/L Entry";
        RecSalesCrMemoHdr: Record "Sales Cr.Memo Header";
        ACTNAME: Text[100];
        DimFilter: Text[50];
        SalesinvoiceHeader: Record "Sales Invoice Header";
        Description11: Text[150];
        glrec: Record "G/L Entry";
        le: Text[30];
        Des: Text[100];
        des1: Text[100];
        des2: Text[100];
        Custle: Record "Cust. Ledger Entry";
        dbamt: Decimal;
        Cramt: Decimal;
        Des3: Text[100];
        des4: Text[100];
        des5: Text[100];
        Docu: Text[30];
        TgGLAmount: Decimal;
        AmountGLEntry: Decimal;
        SCode: Code[20];
        ForeignCurrency: Boolean;
        TotalBFDebit: Decimal;
        TotalCFDebit: Decimal;
        GrandTotalBFDebit: Decimal;
        GrandTotalCFDebit: Decimal;
        GrandBFDebit: Decimal;
        GrandCFDebit: Decimal;
        recDetailCLE: Record "Detailed Cust. Ledg. Entry";
        dbamt1: Decimal;
        Cramt1: Decimal;
        RecCLE: Record "Cust. Ledger Entry";
        tgChk: Boolean;
        tgBal4: Decimal;
        ForAmt: Decimal;
        CloseDt: Date;
        "----Tri ARun --------------": Integer;
        Sub: Text[100];
        Body1: Text[1024];
        Body2: Text[1024];
        Body3: Text[1024];
        Body4: Text[1024];
        Body5: Text[1024];
        Body6: Text[1024];
        RecVend: Record "vendor";
        RecStmnt: Boolean;
        ConfAct: Boolean;
        FNYR: Text[100];
        flag5: Boolean;
        TotalFor: Label 'Total for ';
        Text16500: Label 'As per Details';
        Tx001: Label 'Sub:  Reconciliation of Accounts ';
        Tx002: Label 'Dear Sir,';
        Tx003: Label 'Please find enclosed Statement of Accounts  as on';
        Tx004: Label 'Please reconcile the same and inform us within 15 days any discrepancy in your books of accounts.';
        Tx005: Label 'Kindly inform us in time else it will be assumed that balance appearing in our books as confirmed.';
        Tx006: Label 'Thanking You,';
        Tx007: Label '(Authorised Signatory)';
        Tx008: Label 'appering in Accounts. ';
        // "----------": 
        Tx009: Label 'Sub: Confirmation of Accounts';
        Tx010: Label 'We enclosed herewith statement of accounts for the financial year';
        Tx011: Label 'for your confirmation.';
        Tx012: Label 'We request you to verify the said statement from your records and confirm the same and also quote your PAN';
        Tx013: Label 'and jurisdiction of Income Tax. We require verified copy within 15 Days time else it shall be assumed as confirmed.';
        Tx014: Label 'Kindly do the needful and oblige.';
        Tx015: Label 'Your''s faithfully,';
        Tx016: Label 'Do You want to send mail Reconciliation of Accounts to the Customer ?';
        Tx017: Label 'Do You want to send mail Confirmation of Accounts to the Customer ?';
        Tx018: Label 'Do You want to send mail Accounts Statement to the Customer ?';
        "--------TRI SYED--------": Integer;
        CFDedit1: Decimal;
        CFCredit1: Decimal;
        flag: Boolean;
        flag1: Boolean;
        flag2: Boolean;
        BalancingAmount1: Decimal;
        CustArr: array[1000] of Code[20];
        i: Integer;
        j: Integer;
        k: Integer;
        tgComp1: Text[100];
        tgComp2: Text[100];
        tgComp3: Text[100];
        tgCompInfo: Record "Company Information";

    procedure SetValue(flag3: Boolean; flag1: Boolean; flag2: Boolean)
    begin
        RecStmnt := flag3;
        ConfAct := flag1;
        flag5 := flag2;
    end;
}

