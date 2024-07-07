report 50138 "Custom Sales Order Posted"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/Custom Sales Order Posted.rdl';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            column(BankName_; CompanyInfo."Bank Name")
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
            column(IRN_Number; "IRN Number")
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
            column(CGSTGroupAmt1; ABS(CGSTGroupAmt[1]))
            {
            }
            column(CGSTGroupAmt2; ABS(CGSTGroupAmt[2]))
            {
            }
            column(CGSTGroupAmt3; ABS(CGSTGroupAmt[3]))
            {
            }
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
            column(CGSTGroupAmt4; ABS(CGSTGroupAmt[4]))
            {
            }
            column(IGSTGroupAmt1; ABS(IGSTGroupAmt[1]))
            {
            }
            column(IGSTGroupAmt2; ABS(IGSTGroupAmt[2]))
            {
            }
            column(IGSTGroupAmt3; ABS(IGSTGroupAmt[3]))
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
            column(TotalAmt1; Round("Sales Invoice Header"."Amount Including VAT", 1))
            {
            }

            column(CompanyInfo_Address; CompanyInfo.Address + '  ' + CompanyInfo."Address 2")
            {
            }
            column(CompInfo_City_Pstcode; CompanyInfo.City + '-' + CompanyInfo."Post Code")//+ ', ' + CompanyInfo.State + ' - '
            {
            }
            column(CompInfo_Ph; CompanyInfo."Phone No.")
            {
            }
            column(CompInfo_Email; CompanyInfo."E-Mail")
            {
            }

            // column(FSSAINo; CompanyInfo."FSSAI No.")
            // {

            // }PT
            column(GSTCompAmount2; GSTCompAmount[2])
            {

            }
            column(GSTCompAmount3; GSTCompAmount[3])
            {

            }
            column(GSTCompAmount4; GSTCompAmount[4])
            {

            }

            column(GSTCompPer2; GSTCompPer[2])
            {

            }
            column(GSTCompPer3; GSTCompPer[3])
            {

            }
            column(GSTCompPer4; GSTCompPer[4])
            {

            }
            column(Ship_to_Address; "Ship-to Address")
            { }
            column(Ship_to_Address_2; "Ship-to Address 2")
            { }
            column(Ship_to_Name; "Ship-to Name")
            { }

            column(SelltoAddress_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to Address")
            {
            }
            column(SelltoAddress2_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to Address 2")
            {
            }
            column(ShiptoPostCode_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to Post Code")
            {
            }
            column(ShiptoContact_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to Contact")
            {
            }
            column(SelltoPostCode_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to Post Code")
            {
            }
            column(PhoneNo_SalesInvoiceHeader; '')//"Sales Invoice Header"."Phone No.")
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
            column(RecStateTin; '')// RecState."State Code for TIN")
            {
            }
            column(RecStateDesc; RecState.Description)
            {
            }
            column(No_SalesInHeader; "Sales Invoice Header"."No.")
            {
            }

            column(CName; CompanyInfo.Name)
            {
            }
            column(CName2; CompanyInfo."Name 2")
            {
            }
            column(CAddress; CompanyInfo.Address)
            {
            }
            column(CAddress2; CompanyInfo."Address 2")
            {
            }
            column(CGST_Reg; CompanyInfo."GST Registration No.")
            {
            }
            column(CPost_Code; CompanyInfo."Post Code")
            {
            }
            column(CState; '')// CompanyInfo.State)
            {
            }
            column(CPAN; CompanyInfo."P.A.N. No.")
            {
            }
            column(CIN; '')// CompanyInfo."Company Registration  No.")
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
            column(OrderDate_SalesInvoiceHeader; FORMAT("Sales Invoice Header"."Order Date", 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }
            column(BilltoName_SalesInvoiceHeader; "Sales Invoice Header"."Bill-to Name")
            {
            }
            column(BilltoName2_SalesInvoiceHeader; "Sales Invoice Header"."Bill-to Name 2")
            {
            }
            column(BilltoAddress_SalesInvoiceHeader; "Sales Invoice Header"."Bill-to Address")
            {
            }
            // column(BilltoCustomerState; "Sales Invoice Header"."Bill to Customer State")//PT
            // {
            // }
            column(BilltoAddress2_SalesInvoiceHeader; "Sales Invoice Header"."Bill-to Address 2")
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
            { }
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
            column(CustStateCode; CustStateCode)
            {
            }
            column(CustDesc; CustDesc)
            {
            }
            column(CompStateCode; CompStateCode)
            {
            }
            column(CompStateDesc; CompStateDesc)
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
            column(OrderNo_SalesShipmentHeader; "Sales Invoice Header"."Order No.")
            {
            }


            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");

                //The property 'DataItemTableView' shouldn't have an empty value.

                column(ItemNo_SalesLine; "Sales Invoice Line"."No.")
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
                column(GST_Per_SalesLine; 0)// ROUND("Sales Invoice Line"."GST %"))
                {
                }
                column(Quantity_SalesInvoiceLine; "Sales Invoice Line".Quantity)
                {
                }
                column(UnitPrice_SalesInvoiceLine; "Sales Invoice Line"."Unit Price")
                {
                }
                column(UOM; "Sales Invoice Line"."Unit of Measure Code")
                {
                }
                column(CGSTPer; CGSTPer)
                {
                }
                column(SGSTPer; SGSTPer)
                {
                }
                column(CGSTAmount; Round(CGSTAmount))
                {
                }
                // column(PostingDate; "Sales Invoice Line"."Posting Date")
                // {
                // }
                column(SGSTAmount; SGSTAmount)
                {
                }
                column(Amount; round(Amounts))
                {
                }
                column(IGSTPer; IGSTPer)
                {
                }
                column(Inv__Discount_Amount; "Inv. Discount Amount")
                { }
                column(Line_Discount_Amount; "Line Discount Amount")
                { }
                // column(IGSTAmnt;IGSTAmnt)
                // {
                // }
                column(totalInvValue; totalInvValue)
                { }
                column(totalInvDiscount; totalInvDiscount)
                { }
                column(InvDiscountAmount; "Sales Invoice Line"."Inv. Discount Amount")
                {
                }
                column(LineDiscountAmount_SalesInvoiceLine; "Sales Invoice Line"."Line Discount Amount")
                {
                }
                column(LineDiscount_SalesInvoiceLine; "Sales Invoice Line"."Line Discount %")
                {
                }

                // dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
                // {
                //     DataItemLink = "Document No." = FIELD("Document No."), "Document Line No." = field("Line No.");
                // column(GSTCode; DetailedGST."GST Component Code")
                // {
                // }
                // column(GSTBaseAmount; DetailedGST."GST Base Amount")
                // {
                // }
                // column(GST_Per; DetailedGST."GST %")
                // {
                // }
                // column(GSTAmount; DetailedGST."GST Amount")
                // {
                // }
                column(Description_GSTComponent; '')//"GST Component".Description)
                {
                }
                column(CGSTAmt; CGSTAmt)//"GST Component".Description)
                {
                }
                column(CessPer; CessPer)//"GST Component".Description)
                {
                }
                column(CessAmt; CessAmt)//"GST Component".Description)
                {
                }
                column(IGSTAmnt; IGSTAmnt)//"GST Component".Description)
                {
                }
                column(IGSTPer_; IGSTPer_)//"GST Component".Description)
                {
                }

                column(CGSTPer_; CGSTPer_)//"GST Component".Description)
                {
                }
                column(TotalCGSTPer_; TotalCGSTPer_)
                {

                }

                // column(totalInvDiscount; totalInvDiscount)
                // {

                // }

                column(GLAmt; GLAmt)
                {

                }
                column(Sno; Sno)
                {

                }
                // trigger OnAfterGetRecord()
                // var
                // begin
                //     Clear(IGSTAmnt);
                //     Clear(CGSTAmt);
                //     Clear(IGSTPer_);
                //     Clear(CGSTPer_);
                //     IF "Detailed GST Ledger Entry"."GST Component Code" = 'CGST' then begin
                //         CGSTAmt += "Detailed GST Ledger Entry"."GST Amount";
                //         CGSTPer_ := "Detailed GST Ledger Entry"."GST %";
                //     end;
                //     IF "Detailed GST Ledger Entry"."GST Component Code" = 'IGST' then begin
                //         IGSTAmnt += "Detailed GST Ledger Entry"."GST Amount";
                //         IGSTPer_ := "Detailed GST Ledger Entry"."GST %";

                //     end;
                // end;
                // dataitem("GST Component"; "GST Component")
                // {
                //     DataItemLink = Code = FIELD("GST Component Code");
                //     column(Description_GSTComponent; '')//"GST Component".Description)
                //     {
                //     }
                // }

                //      trigger OnPreDataItem()
                //     begin
                //         //CLEAR(EntryNo);
                //         RecDetailedEntry.RESET;
                //     end;
                // }


                trigger OnAfterGetRecord()
                var
                    DetailedGST: Record "Detailed GST Ledger Entry";
                    GenLedEntry: Record "G/L Entry";

                begin

                    Clear(totalInvDiscount);
                    GenLedEntry.Reset();
                    GenLedEntry.SetRange("Document No.", "Sales Invoice Line"."Document No.");
                    GenLedEntry.SetFilter("G/L Account Name", '%1', 'Retail FG SALE');
                    if GenLedEntry.FindFirst() then begin
                        totalInvDiscount := GenLedEntry.Amount;
                    end;
                    Clear(totalInvValue);
                    GenLedEntry.Reset();
                    GenLedEntry.SetRange("Document No.", "Sales Invoice Line"."Document No.");
                    GenLedEntry.SetFilter("G/L Account Name", '%1', 'DISCOUNT RECEIVED');
                    if GenLedEntry.FindFirst() then
                        totalInvValue := GenLedEntry.Amount;

                    //Add GST Detail
                    //     RecDetailedEntry.RESET;
                    //     CLEAR(CGSTAmount);
                    //     CLEAR(SGSTAmount);
                    //     CLEAR(CGSTPer);
                    //     CLEAR(SGSTPer);
                    //     CLEAR(Amount);
                    //     CLEAR(IGSTAmnt);
                    //     CLEAR(IGSTPer);
                    //     RecDetailedEntry.SETRANGE("Document No.", "Sales Invoice Line"."Document No.");
                    //     //  RecDetailedEntry.SETRANGE("Document Line No.", "Sales Invoice Line"."Line No.");
                    //     IF RecDetailedEntry.FINDFIRST THEN //BEGIN
                    //         REPEAT
                    //             IF (RecDetailedEntry."GST Component Code" = 'SGST') THEN BEGIN
                    //                 SGSTPer := RecDetailedEntry."GST %";
                    //                 SGSTAmount := ABS(RecDetailedEntry."GST Amount");
                    //             END;
                    //             IF (RecDetailedEntry."GST Component Code" = 'CGST') THEN BEGIN
                    //                 //MESSAGE('hi');
                    //                 CGSTPer := RecDetailedEntry."GST %";
                    //                 CGSTAmount := ABS(RecDetailedEntry."GST Amount");
                    //             END;
                    //             IF (RecDetailedEntry."GST Component Code" = 'IGST') THEN BEGIN
                    //                 IGSTPer := RecDetailedEntry."GST %";
                    //                 IGSTAmnt := ABS(RecDetailedEntry."GST Amount");
                    //             END;
                    //         UNTIL RecDetailedEntry.NEXT = 0;
                    //     //END;
                    //     Amount := 0;// "Sales Invoice Line"."GST Base Amount";
                    Sno += 1;
                    IF "Sales Invoice Line".Type = "Sales Invoice Line".Type::"G/L Account" Then
                        Sno := 0;
                    IF "Sales Invoice Line".Type = "Sales Invoice Line".Type::"G/L Account" then begin
                        Clear(GLAmt);
                        IF "Sales Invoice Line".Description = 'ROUNDED OFF' then
                            GLAmt := "Sales Invoice Line"."Line Amount";
                    end;
                    Clear(Amounts);
                    //  IF "Sales Invoice Line".Type = "Sales Invoice Line".Type::Item then
                    Amounts += "Sales Invoice Line".Amount;
                    // If "Sales Invoice Line".Type = "Sales Invoice Line".Type::"G/L Account" then
                    //     CurrReport.Skip();
                    Clear(Item);
                    IF Item.Get("Sales Invoice Line"."No.") then;
                    Clear(IGSTAmnt);
                    Clear(CGSTAmt);
                    Clear(CessPer);
                    Clear(CessAmt);
                    Clear(IGSTPer_);
                    Clear(CGSTPer_);
                    DetailedGST.Reset();
                    DetailedGST.SetRange("Document No.", "Sales Invoice Line"."Document No.");
                    DetailedGST.SetRange("Document Line No.", "Sales Invoice Line"."Line No.");
                    IF DetailedGST.FindFirst() then
                        repeat
                            IF DetailedGST."GST Component Code" = 'CGST' then begin
                                CGSTAmt += DetailedGST."GST Amount";
                                CGSTPer_ := DetailedGST."GST %";
                                IF CGSTPer_ <> 0 then
                                    TotalCGSTPer_ := CGSTPer_ / 2;
                            end;
                            IF DetailedGST."GST Component Code" = 'IGST' then begin
                                IGSTAmnt += DetailedGST."GST Amount";
                                IGSTPer_ := DetailedGST."GST %";
                            end;
                            IF DetailedGST."GST Component Code" = 'CESS' then begin
                                CessAmt += DetailedGST."GST Amount";
                                CessPer := DetailedGST."GST %";
                            end;
                        until DetailedGST.Next() = 0;
                end;

                trigger OnPreDataItem()
                begin
                    CLEAR(GrossAmount);
                end;
            }

            trigger OnAfterGetRecord()
            var
                DetailedGStEntry: Record "Detailed GST Ledger Entry";
                DetailedGStEntry1: Record "Detailed GST Ledger Entry";
                SIL: Record "Sales Invoice Line";
                TotalAmtValue_g1: Decimal;
                IGSTAmnt1: Decimal;
                CGSTAmt1: Decimal;
                IGSTPer_1: Decimal;
                CGSTPer_1: Decimal;
                DetailedGST: Record "Detailed GST Ledger Entry";
                DetailedGST1: Record "Detailed GST Ledger Entry";
            begin

                RecLocation.RESET;
                RecLocation.GET("Sales Invoice Header"."Location Code");

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
                RecCustomer.RESET;
                RecState.RESET;

                IF RecState.FINDFIRST THEN
                    CompStateDesc := RecState.Description;
                Clear(FinalAmount);
                RecCustomer.Reset();
                RecCustomer.SetRange("No.", "Sales Invoice Header"."Bill-to Customer No.");
                if RecCustomer.FindFirst() then begin
                    repeat
                        RecCustomer.CalcFields("Balance (LCY)");
                        FinalAmount += RecCustomer."Balance (LCY)";

                    until RecCustomer.Next() = 0;
                    RecCustomer.Modify();
                end;
                //  Message('%1', FinalAmount);

                RecState.RESET;
                RecCustomer.RESET;
                RecState.SETRANGE(RecState.Code, RecCustomer."State Code");
                IF RecState.FINDFIRST THEN
                    //  CustStateCode := RecState."State Code for TIN";
                    CustDesc := RecState.Description;
                //RecDetailedEntry.SETRANGE("Document No.", "Sales Invoice Header"."No.");
                IF RecDetailedEntry.FINDFIRST THEN
                    REPEAT
                        Temp += ABS(RecDetailedEntry."GST Amount");
                    // GrossAmount += Temp + ABS(RecDetailedEntry."GST Base Amount")/2 ;
                    UNTIL RecDetailedEntry.NEXT = 0;
                GrossAmount += ABS(RecDetailedEntry."GST Base Amount") + Temp;//
                                                                              //MESSAGE(FORMAT(GrossAmount));
                                                                              //AmtInWord:=Inwords(ROUND(GrossAmount,1));

                //// TRI MMK
                CLEAR(AmtInWords);
                CLEAR(NoText);
                // CLEAR(Check);PT
                CLEAR(AmtTOCust);
                GSTFunction;
                // "Sales Invoice Header".CALCFIELDS("Amount to Customer");
                AmtTOCust := 0;// "Sales Invoice Header"."Amount to Customer";
                AmtTOCust := 0;// "Sales Invoice Line"."Amount To Customer";

                EinvoiceETransLogRec.Reset();
                EinvoiceETransLogRec.SetRange("Invoice No.", "Sales Invoice Header"."No.");
                IF EinvoiceETransLogRec.FindFirst() then
                    EinvoiceETransLogRec.CalcFields("Einvoice QR Code");//PT


                DetailedGStEntry.Reset();
                DetailedGStEntry.SetRange("Document No.", "Sales Invoice Header"."No.");
                DetailedGStEntry.SetRange("GST Component Code", 'CGST');
                DetailedGStEntry.CalcSums("GST Amount");

                DetailedGStEntry1.Reset();
                DetailedGStEntry1.SetRange("Document No.", "Sales Invoice Header"."No.");
                DetailedGStEntry1.SetRange("GST Component Code", 'IGST');
                DetailedGStEntry1.CalcSums("GST Amount");

                "Sales Invoice Header".CalcFields("Amount Including VAT");
                // Check.InitTextVariable;PT
                // Check.FormatNoText(NoText, "Sales Invoice Header"."Amount Including VAT" + ABS(DetailedGStEntry."GST Amount" + DetailedGStEntry."GST Amount" + DetailedGStEntry1."GST Amount"), '');
                AmtInWords := NoText[1];




                RecState.RESET;
                IF RecState.GET("Sales Invoice Header"."Location State Code") Then;

                Clear(TotalAmtValue_g1);
                Clear(IGSTAmnt1);
                Clear(CGSTAmt1);
                Clear(IGSTPer_1);
                Clear(CGSTPer_1);
                Clear(CGSTGroupAmt);
                Clear(IGSTGroupAmt);
                SIL.Reset();
                // SIL.SetRange(Type, SIL.Type::Item);
                SIL.SetRange("Document No.", "Sales Invoice Header"."No.");
                if SIL.FindFirst() then
                    repeat
                        TotalAmtValue_g1 += SIL.Amount;
                        DetailedGST.Reset();
                        DetailedGST.SetRange("Document No.", SIL."Document No.");
                        DetailedGST.SetRange("Document Line No.", SIL."Line No.");
                        IF DetailedGST.FindFirst() then
                            repeat
                                IF DetailedGST."GST Component Code" = 'CGST' then begin
                                    CGSTAmt1 += DetailedGST."GST Amount";
                                end;
                                IF DetailedGST."GST Component Code" = 'IGST' then begin
                                    IGSTAmnt1 += DetailedGST."GST Amount";
                                end;
                            until DetailedGST.Next() = 0;
                        DetailedGST1.Reset();
                        DetailedGST1.SetRange("Document No.", SIL."Document No.");
                        DetailedGST1.SetRange("Document Line No.", SIL."Line No.");
                        IF DetailedGST1.FindFirst() then
                            repeat
                                IF DetailedGST1."GST Group Code" = 'GST00' then begin
                                    IF DetailedGST1."GST Component Code" = 'CGST' then
                                        CGSTGroupAmt[1] += DetailedGST1."GST Amount";
                                end;
                                IF DetailedGST1."GST Group Code" = 'GST05' then begin
                                    IF DetailedGST1."GST Component Code" = 'CGST' then
                                        CGSTGroupAmt[2] += DetailedGST1."GST Amount";
                                end;
                                IF DetailedGST1."GST Group Code" = 'GST12' then begin
                                    IF DetailedGST1."GST Component Code" = 'CGST' then
                                        CGSTGroupAmt[3] += DetailedGST1."GST Amount";
                                end;
                                IF DetailedGST1."GST Group Code" = 'GST18' then begin
                                    IF DetailedGST1."GST Component Code" = 'CGST' then
                                        CGSTGroupAmt[4] += DetailedGST1."GST Amount";
                                end;


                                IF DetailedGST1."GST Group Code" = 'GST00' then begin
                                    IF DetailedGST1."GST Component Code" = 'IGST' then
                                        IGSTGroupAmt[1] += DetailedGST1."GST Amount";
                                end;
                                IF DetailedGST1."GST Group Code" = 'GST05' then begin
                                    IF DetailedGST1."GST Component Code" = 'IGST' then
                                        IGSTGroupAmt[2] += DetailedGST1."GST Amount";
                                end;
                                IF DetailedGST1."GST Group Code" = 'GST12' then begin
                                    IF DetailedGST1."GST Component Code" = 'IGST' then
                                        IGSTGroupAmt[3] += DetailedGST1."GST Amount";
                                end;
                                IF DetailedGST1."GST Group Code" = 'GST18' then begin
                                    IF DetailedGST1."GST Component Code" = 'IGST' then
                                        IGSTGroupAmt[4] += DetailedGST1."GST Amount";
                                end;

                            until DetailedGST1.Next() = 0;
                    until SIL.Next() = 0;

                // TotalAmtValue_g := TotalAmtValue_g1 + ABS(CGSTAmt1 + CGSTAmt1 + IGSTAmnt1);// + CGSTAmt + IGSTAmnt;
                // IntAmount := TotalAmtValue_g div 1;
                // DecAmount := TotalAmtValue_g * 100 mod 100;
                // IF (DecAmount < 50) then
                //     FinalAmount := IntAmount
                // else
                "Sales Invoice Header".CalcFields("Remaining Amount");
                // FinalAmount := "Sales Invoice Header"."Remaining Amount";
                Shiptoaddress.Reset();
                //  Shiptoaddress.SetRange("Customer No.", "Sales Invoice Header"."Bill-to Customer No.");
                Shiptoaddress.SetRange(Name, "Sales Invoice Header"."Ship-to Name");
                if Shiptoaddress.FindFirst() then begin
                    shipTophoneNo := Shiptoaddress.Contact;
                    shiptostate := Shiptoaddress.State;
                end;


                //   Message('%1', DecAmount);
                // TRI MMK
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
    requestpage
    {

        layout
        {
            area(content)
            {
                field(A; A)
                {
                    Caption = 'Original Copy';
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        IF B OR C THEN ERROR('You can Select One by One for every print option');

                    end;
                }
                field(B; B)
                {
                    Caption = 'Duplicate Copy';
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        IF A OR C THEN ERROR('You can Select One by One for every print option');
                    end;
                }
                field(C; C)
                {
                    Caption = 'Triplicate Copy';
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        IF A OR B THEN ERROR('You can Select One by One for every print option');
                    end;
                }
                field(NoOfCopies; NoOfCopies)
                {
                    ApplicationArea = all;
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

    trigger OnPreReport()
    begin

        CompanyInfo.Get;
        CompanyInfo.CALCFIELDS(Picture);
        CLEAR(Bankname);
        //if co
        // IF COPYNO = 1 THEN BEGIN
        //   Section = OriginalCopy;
        // END
        // ELSE BEGIN
        //   Section = DuplicateCopy;
        // END;
        SRN := 0;
        //MESSAGE(FORMAT("Sales Shipment Header"."Order No."));
        //IF "Sales Shipment Header"."Order No."<>'' THEN
        //  MESSAGE('hi');
        //  "Sales Shipment Header".SETRANGE("Sales Shipment Header"."Order No.","Sales Shipment Header"."Order No.");
        //ELSE// "Sales Shipment Header"."Order No."='' THEN BEGIN
        //  MESSAGE('Please Enter the Order No.');
        //  CurrReport.QUIT;
    end;

    var

        AmtInWord: Text;

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

        SRN: Integer;
        RecState: Record "State";
        CompStateCode: Code[10];
        CompStateDesc: Text[20];
        CustStateCode: Text[20];
        TotalAmtValue_g: Decimal;
        IntAmount: Decimal;
        DecAmount: Decimal;
        CustDesc: Text[20];
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


        GenLedEntry1: Record "G/L Entry";
        totalInvValue: Decimal;
        totalInvDiscount: Decimal;


        RecLocation: Record Location;//PT
        NoText: array[2] of Text;
        //Check: Report "Check_Custom";//PT
        AmtInWords: Text;
        AmtTOCust: Decimal;
        AmountNew: Decimal;
        FinalAmount: Decimal;
        PanNo: Code[10];
        CGSTGroupAmt: array[4] of Decimal;
        IGSTGroupAmt: array[4] of Decimal;




    procedure Inwords(MAMOUNT: Decimal): Text[250]
    var
        INTAMOUNT: Integer;
        PAISE: Integer;
        CRORE: Integer;
        LAKH: Integer;
        THOUSAND: Integer;
        HUNDRED: Integer;
        RUPEE: Integer;
        AMTTEXT: Text[200];
    begin
        INTAMOUNT := ABS(ROUND(MAMOUNT, 1, '<'));

        PAISE := ROUND(ROUND(ROUND(MAMOUNT) - INTAMOUNT) * 100);

        CRORE := ROUND(MAMOUNT / 10000000, 1, '<');
        MAMOUNT := MAMOUNT MOD 10000000;

        LAKH := ROUND(MAMOUNT / 100000, 1, '<');
        MAMOUNT := MAMOUNT MOD 100000;

        THOUSAND := ROUND(MAMOUNT / 1000, 1, '<');
        MAMOUNT := MAMOUNT MOD 1000;

        HUNDRED := ROUND(MAMOUNT / 100, 1, '<');

        RUPEE := ROUND((MAMOUNT MOD 100), 1, '<');
        AMTTEXT += 'Rupees ';
        IF CRORE <> 0 THEN
            AMTTEXT += RNO(CRORE) + ' Crore ';
        IF LAKH <> 0 THEN
            AMTTEXT += RNO(LAKH) + ' Lakh ';
        IF THOUSAND <> 0 THEN
            AMTTEXT += RNO(THOUSAND) + ' Thousand ';
        IF HUNDRED <> 0 THEN
            AMTTEXT += RNO(HUNDRED) + ' Hundred ';
        IF RUPEE <> 0 THEN
            AMTTEXT += RNO(RUPEE) + ' ';

        IF PAISE <> 0 THEN
            AMTTEXT += 'and Paise ' + RNO(PAISE) + '' + 'Only'
        ELSE
            AMTTEXT += 'Only';

        EXIT(AMTTEXT);
    end;

    procedure RNO(NO: Integer): Text[50]
    begin
        IF NO = 1 THEN
            EXIT('One');
        IF NO = 2 THEN
            EXIT('Two');
        IF NO = 3 THEN
            EXIT('Three');
        IF NO = 4 THEN
            EXIT('Four');
        IF NO = 5 THEN
            EXIT('Five');
        IF NO = 6 THEN
            EXIT('Six');
        IF NO = 7 THEN
            IF NO = 8 THEN
                EXIT('Eight');
        IF NO = 9 THEN
            EXIT('Nine');
        IF NO = 10 THEN
            EXIT('Ten');
        IF NO = 11 THEN
            EXIT('Eleven');
        IF NO = 12 THEN
            EXIT('Twelve');
        IF NO = 13 THEN
            EXIT('Thirteen');
        IF NO = 14 THEN
            EXIT('Fourteen');
        IF NO = 15 THEN
            EXIT('Fifteen');
        IF NO = 16 THEN
            EXIT('Sixteen');
        IF NO = 17 THEN
            EXIT('Seventeen');
        IF NO = 18 THEN
            EXIT('Eighteen');
        IF NO = 19 THEN
            EXIT('Nineteen');
        IF NO = 20 THEN
            EXIT('Twenty');
        IF NO = 21 THEN
            EXIT('Twenty One');
        IF NO = 22 THEN
            EXIT('Twenty Two');
        IF NO = 23 THEN
            EXIT('Twenty Three');
        IF NO = 24 THEN
            EXIT('Twenty Four');
        IF NO = 25 THEN
            EXIT('Twenty Five');
        IF NO = 26 THEN
            EXIT('Twenty Six');
        IF NO = 27 THEN
            EXIT('Twenty Seven');
        IF NO = 28 THEN
            EXIT('Twenty Eight');
        IF NO = 29 THEN
            EXIT('Twenty Nine');
        IF NO = 30 THEN
            EXIT('Thirty');
        IF NO = 31 THEN
            EXIT('Thirty One');
        IF NO = 32 THEN
            EXIT('Thirty Two');
        IF NO = 33 THEN
            EXIT('Thirty Three');
        IF NO = 34 THEN
            EXIT('Thirty Four');
        IF NO = 35 THEN
            EXIT('Thirty Five');
        IF NO = 36 THEN
            EXIT('Thirty Six');
        IF NO = 37 THEN
            EXIT('Thirty Seven');
        IF NO = 38 THEN
            EXIT('Thirty Eight');
        IF NO = 39 THEN
            EXIT('Thirty Nine');
        IF NO = 40 THEN
            EXIT('Fourty');
        IF NO = 41 THEN
            EXIT('Fourty One');
        IF NO = 42 THEN
            EXIT('Fourty Two');
        IF NO = 43 THEN
            EXIT('Fourty Three');
        IF NO = 44 THEN
            EXIT('Fourty Four');
        IF NO = 45 THEN
            EXIT('Fourty Five');
        IF NO = 46 THEN
            EXIT('Fourty Six');
        IF NO = 47 THEN
            EXIT('Fourty Seven');
        IF NO = 48 THEN
            EXIT('Fourty Eight');
        IF NO = 49 THEN
            EXIT('Fourty Nine');
        IF NO = 50 THEN
            EXIT('Fifty');
        IF NO = 51 THEN
            EXIT('Fifty One');
        IF NO = 52 THEN
            EXIT('Fifty Two');
        IF NO = 53 THEN
            EXIT('Fifty Three');
        IF NO = 54 THEN
            EXIT('Fifty Four');
        IF NO = 55 THEN
            EXIT('Fifty Five');
        IF NO = 56 THEN
            EXIT('Fifty Six');
        IF NO = 57 THEN
            EXIT('Fifty Seven');
        IF NO = 58 THEN
            EXIT('Fifty Eight');
        IF NO = 59 THEN
            EXIT('Fifty Nine');
        IF NO = 60 THEN
            EXIT('Sixty');
        IF NO = 61 THEN
            EXIT('Sixty One');
        IF NO = 62 THEN
            EXIT('Sixty Two');
        IF NO = 63 THEN
            EXIT('Sixty Three');
        IF NO = 64 THEN
            EXIT('Sixty Four');
        IF NO = 65 THEN
            EXIT('Sixty Five');
        IF NO = 66 THEN
            EXIT('Sixty Six');
        IF NO = 67 THEN
            EXIT('Sixty Seven');
        IF NO = 68 THEN
            EXIT('Sixty Eight');
        IF NO = 69 THEN
            EXIT('Sixty Nine');
        IF NO = 70 THEN
            EXIT('Seventy');
        IF NO = 71 THEN
            EXIT('Seventy One');
        IF NO = 72 THEN
            EXIT('Seventy Two');
        IF NO = 73 THEN
            EXIT('Seventy Three');
        IF NO = 74 THEN
            EXIT('Seventy Four');
        IF NO = 75 THEN
            EXIT('Seventy Five');
        IF NO = 76 THEN
            EXIT('Seventy Six');
        IF NO = 77 THEN
            EXIT('Seventy Seven');
        IF NO = 78 THEN
            EXIT('Seventy Eight');
        IF NO = 79 THEN
            EXIT('Seventy Nine');
        IF NO = 80 THEN
            EXIT('Eighty');
        IF NO = 81 THEN
            EXIT('Eighty One');
        IF NO = 82 THEN
            EXIT('Eighty Two');
        IF NO = 83 THEN
            EXIT('Eighty Three');
        IF NO = 84 THEN
            EXIT('Eighty Four');
        IF NO = 85 THEN
            EXIT('Eighty Five');
        IF NO = 86 THEN
            EXIT('Eighty Six');
        IF NO = 87 THEN
            EXIT('Eighty Seven');
        IF NO = 88 THEN
            EXIT('Eighty Eight');
        IF NO = 89 THEN
            EXIT('Eighty Nine');
        IF NO = 90 THEN
            EXIT('Ninety');
        IF NO = 91 THEN
            EXIT('Ninety One');
        IF NO = 92 THEN
            EXIT('Ninety Two');
        IF NO = 93 THEN
            EXIT('Ninety Three');
        IF NO = 94 THEN
            EXIT('Ninety Four');
        IF NO = 95 THEN
            EXIT('Ninety Five');
        IF NO = 96 THEN
            EXIT('Ninety Six');
        IF NO = 97 THEN
            EXIT('Ninety Seven');
        IF NO = 98 THEN
            EXIT('Ninety Eight');
        IF NO = 99 THEN
            EXIT('Ninety Nine');
    end;

    local procedure FormatNoText()
    begin
    end;

    procedure GSTFunction()
    var
        SL_lRec: Record "Sales Invoice Line";
        SubTotal_lDec: Decimal;
        j: Integer;
        DecValueEval_lDec: Decimal;
        CLE_lRec: Record "Vendor Ledger Entry";
        TotalAmtInWords_lTxt: Text;
        DocumentGSTAmt_lDec: Decimal;
        NoText: array[2] of Text[500];
        TaxTrnasactionValue: Record "Tax Transaction Value";
        TaxTrnasactionValue1: Record "Tax Transaction Value";
        LineDiscAmt_lDec: Decimal;
        GSTCompNo: Integer;
    begin


        Clear(GSTComponentCodeName);
        Clear(GSTCompAmount);
        Clear(GSTCompPer);
        Clear(GSTComponentCode);
        Clear(GSTCode_gCodArr);
        Clear(GSTCompNo);
        SL_lRec.Reset;
        SL_lRec.SetRange("Document No.", "Sales Invoice Header"."No.");
        SL_lRec.SetRange("System-Created Entry", false);
        SL_lRec.SetFilter(Amount, '<>%1', 0);
        if SL_lRec.FindSet then begin
            repeat
                GSTCompNo := 1;
                TaxTrnasactionValue.Reset();
                TaxTrnasactionValue.SetRange("Tax Record ID", SL_lRec.RecordId);
                TaxTrnasactionValue.SetRange("Tax Type", 'GST');
                TaxTrnasactionValue.SetRange("Value Type", TaxTrnasactionValue."Value Type"::COMPONENT);
                TaxTrnasactionValue.SetFilter(Amount, '<>%1', 0);
                if TaxTrnasactionValue.FindSet() then
                    repeat
                        GSTCompNo := TaxTrnasactionValue."Value ID";

                        GSTComponentCode[GSTCompNo] := TaxTrnasactionValue."Value ID";
                        TaxTrnasactionValue1.Reset();
                        TaxTrnasactionValue1.SetRange("Tax Record ID", SL_lRec.RecordId);
                        TaxTrnasactionValue1.SetRange("Tax Type", 'GST');
                        TaxTrnasactionValue1.SetRange("Value Type", TaxTrnasactionValue1."Value Type"::COMPONENT);
                        TaxTrnasactionValue1.SetRange("Value ID", GSTComponentCode[GSTCompNo]);
                        if TaxTrnasactionValue1.FindSet() then begin
                            repeat
                                GSTCompAmount[GSTCompNo] := TaxTrnasactionValue1."Amount";
                                GSTCompPer[GSTCompNo] += TaxTrnasactionValue1.Percent;
                            until TaxTrnasactionValue1.Next() = 0;
                            GSTCompNo += 1;
                        end;
                    //                      Message('%1', GSTCompAmount[2]);
                    //
                    until TaxTrnasactionValue.Next() = 0;

                // Message('%1', GSTCompAmount[2]);

                TaxTrnasactionValue.Reset();
                TaxTrnasactionValue.SetRange("Tax Record ID", SL_lRec.RecordId);
                TaxTrnasactionValue.SetRange("Tax Type", 'GST');
                TaxTrnasactionValue.SetRange("Value Type", TaxTrnasactionValue."Value Type"::COMPONENT);
                TaxTrnasactionValue.SetFilter(Amount, '<>%1', 0);
                if TaxTrnasactionValue.FindSet() then
                    repeat
                        j := TaxTrnasactionValue."Value ID";
                        case TaxTrnasactionValue."Value ID" of
                            6:
                                GSTComponentCodeName[j] := 'SGST';
                            2:
                                GSTComponentCodeName[j] := 'CGST';
                            3:
                                GSTComponentCodeName[j] := 'IGST';
                            5:
                                GSTComponentCodeName[j] := 'UTGST';
                        end;
                        j += 1;
                    until TaxTrnasactionValue.Next() = 0;
            until SL_lRec.Next = 0;
        end;

        //  Message('%1..%2..%3..%4..%5..%6', GSTCompAmount[1], GSTCompAmount[2], GSTCompAmount[3], GSTCompAmount[4], GSTCompAmount[5], GSTCompAmount[6]);
    end;

    var
        GSTComponentCodeName: array[10] of Text;
        GSTCompAmount: array[10] of Decimal;
        GSTCompPer: array[10] of Decimal;
        GSTComponentCode: array[10] of Decimal;
        GSTCode_gCodArr: Decimal;
        CompanyInfo: Record "Company Information";


        CGSTAmt: Decimal;
        CessPer: Decimal;
        CessAmt: Decimal;
        IGST: Decimal;
        CGSTPer_: Decimal;
        TotalCGSTPer_: Decimal;
        IGSTPer_: Decimal;
        Item: Record Item;
        GLAmt: Decimal;
        Amounts: Decimal;
        Customer: Record Customer;
        PostingDate: DateTime;
        Sno: Integer;
        timex: Time;
        EinvoiceETransLogRec: Record "Einvoice & ETrans Log";//PT
        EinvoiceETransLog: Record "Einvoice & ETrans Log";
}

