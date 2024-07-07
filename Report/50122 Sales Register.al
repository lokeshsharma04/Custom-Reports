report 50122 "Sales Register"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/Sales Register.rdl';
    PreviewMode = Normal;
    ApplicationArea = all;
    UsageCategory = Lists;

    dataset
    {
        dataitem("Sales Invoice Line"; "Sales Invoice Line")
        {
            DataItemTableView = SORTING("Document No.", "Line No.")
                                ORDER(Ascending)
                                WHERE(Type = CONST(Item),
                                      "No." = FILTER(<> ' '),
                                      Quantity = FILTER(<> 0));
            RequestFilterFields = "Sell-to Customer No.", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Gen. Prod. Posting Group", "Gen. Bus. Posting Group";
            column(CompInfo_Pic; CompInfo.Picture)
            {
            }
            column(Comp_Name; CompInfo.Name)
            {
            }
            column(Comp_Add; '')//CompInfo.Address+CompInfo."Address 2"+CompInfo.City+CompInfo.State)
            {
            }
            column(Comp_CityState; '')//CompInfo.City+CompInfo.State)
            {
            }
            column(CustomerName; Customer.Name + Customer."Name 2")
            {
            }
            column(Address; Customer.Address + Customer."Address 2")
            {
            }
            column(TinNo; Customer."GST Registration No.")
            {
            }
            column(SalesInvState; SalesInvHeader.State)
            {
            }
            column(SalesInvOrder; SalesInvHeader."Order No.")
            {
            }
            column(OurPoNo; SalesInvHeader."External Document No.")
            {
            }
            column(StateDesc; StateDesc)
            {
            }
            column(ContactPerson; Customer.Contact)
            {
            }
            column(OurSONo; SalesInvHeader."External Document No.")
            {
            }
            column(Unit_of_Measure; "Unit of Measure")
            {
            }
            column(PODt; "Sales Invoice Line"."Posting Date")
            {
            }
            column(HSNSACCode_SalesInvoiceLine; "Sales Invoice Line"."HSN/SAC Code")
            {
            }
            column(ShortcutDimension1Code_SalesInvoiceLine; "Sales Invoice Line"."Shortcut Dimension 1 Code")
            {
            }
            column(ItemCode; "Sales Invoice Line"."No.")
            {
            }
            column(ItemDesc; "Sales Invoice Line".Description)
            {
            }
            column(GSTBaseAmount_SalesInvoiceLine; '')//"Sales Invoice Line"."GST Base Amount")
            {
            }
            column(ItemTariff; '')//"Sales Invoice Line"."Excise Prod. Posting Group")
            {
            }
            column(Qty; "Sales Invoice Line".Quantity)
            {
            }
            column(BasicValue; "Sales Invoice Line"."Line Amount" / CurrFtr + "Sales Invoice Line"."Line Discount Amount" / CurrFtr)
            {
            }
            column(Discount; "Sales Invoice Line"."Line Discount Amount" / CurrFtr)
            {
            }
            column(BasicValue1; "Sales Invoice Line"."Line Amount" / CurrFtr)
            {
            }
            column(SalesTax; '')//"Sales Invoice Line"."Tax Amount"/CurrFtr)
            {
            }
            column(ExciseDuty; '')//"Sales Invoice Line"."BED Amount"/CurrFtr)
            {
            }
            column(EDCess; '')//"Sales Invoice Line"."eCess Amount"/CurrFtr)
            {
            }
            column(HECess; '')//"Sales Invoice Line"."SHE Cess Amount"/CurrFtr)
            {
            }
            column(ADCAmt; '')//"Sales Invoice Line"."ADC VAT Amount"/CurrFtr)
            {
            }
            column(ProductGroupCode_SalesInvoiceLine; '')//"Sales Invoice Line"."Product Group Code")
            {
            }
            column(revcodt1; revcodt1)
            {
            }
            column(Freight; FreightCharges)
            {
            }
            column(OtherCharges; OtherTax)
            {
            }
            column(TotalBillAmt; '')//"Sales Invoice Line"."Amount To Customer"/CurrFtr)
            {
            }
            column(SalesOfficer; SalesInvHeader."Salesperson Code")
            {
            }
            column(SaleTaxRate; '')//"Sales Invoice Line"."Tax %")
            {
            }
            column(ApplicableForm; '')//"Sales Invoice Line"."Form Code")
            {
            }
            column(DocumentNo_SalesInvoiceLine; "Sales Invoice Line"."Document No.")
            {
            }
            column(OrderNo; SalesInvHeader."Order No.")
            {
            }
            column(HSSSale; HssSale)
            {
            }
            column(Original_Cost_LCY; ABS(CostLCY))
            {
            }
            column(Original_Profit_LCY; ProfitLCY)
            {
            }
            column(Cost; revcodt1)
            {
            }
            column(Line_No; "Sales Invoice Line"."Line No.")
            {
            }
            column(Segment; '')
            {
            }
            column(LocationCode; "Sales Invoice Line"."Location Code")
            {
            }
            column(ProductpostingGroup; "Sales Invoice Line"."Gen. Prod. Posting Group")
            {
            }
            column(LocCode; "Sales Invoice Line"."Shortcut Dimension 2 Code")
            {
            }
            column(CentralGSTPer; CentralGSTPer)
            {
            }
            column(CentralGSTAmount; CentralGSTAmount)
            {
            }
            column(StateGSTPer; StateGSTPer)
            {
            }
            column(StateGSTAmount; StateGSTAmount)
            {
            }
            column(IntegratedGSTPer; IntegratedGSTPer)
            {
            }
            column(IntegratedGSTAmount; IntegratedGSTAmount)
            {
            }

            trigger OnAfterGetRecord()
            begin
                SalesInvHeader.GET("Document No.");

                CurrFtr := 1;
                IF ShowAmtsInLCY THEN BEGIN
                    IF SalesInvHeader."Currency Factor" <> 0 THEN
                        CurrFtr := SalesInvHeader."Currency Factor"
                END;

                StateDesc := '';
                IF Customer.GET("Sell-to Customer No.") THEN
                    IF StateRec.GET(Customer."State Code") THEN
                        StateDesc := StateRec.Description;

                //  IF ExciseProdPosting.GET("Excise Prod. Posting Group") THEN;

                FreightCharges := 0;
                OtherTax := 0;

                // PostStrOrdLineDet.RESET;
                // //PostStrOrdLineDet.SETCURRENTKEY(Type, "Document Type", "Invoice No.", "Tax/Charge Type", "Tax/Charge Group");
                // //PostStrOrdLineDet.SETRANGE(Type, PostStrOrdLineDet.Type::"2");
                // //PostStrOrdLineDet.SETRANGE("Document Type", PostStrOrdLineDet."Document Type"::"2");
                // //PostStrOrdLineDet.SETRANGE("Invoice No.", "Document No.");
                // //PostStrOrdLineDet.SETRANGE("Tax/Charge Type", PostStrOrdLineDet."Tax/Charge Type"::"0");
                // //PostStrOrdLineDet.SETFILTER("Tax/Charge Group", '%1|%2|%3', 'Freight', 'Packing', 'Handling');
                // IF PostStrOrdLineDet.FIND('-') THEN
                //     REPEAT
                //         IF PostStrOrdLineDet."Tax/Charge Group" = 'Freight' THEN
                //             FreightCharges += PostStrOrdLineDet.Amount;
                //         IF PostStrOrdLineDet."Tax/Charge Group" = 'Packing' THEN
                //             PackingCharges += PostStrOrdLineDet.Amount;
                //         IF PostStrOrdLineDet."Tax/Charge Group" = 'Handling' THEN
                //             HandlingCharges += PostStrOrdLineDet.Amount;
                //     UNTIL PostStrOrdLineDet.NEXT = 0;
                // // PostStrOrdLineDet.SETRANGE("Tax/Charge Type", PostStrOrdLineDet."Tax/Charge Type"::"3");
                // // PostStrOrdLineDet.SETRANGE("Tax/Charge Group");
                // IF PostStrOrdLineDet.FIND('-') THEN
                //     REPEAT
                //         OtherTax += PostStrOrdLineDet.Amount;
                //     UNTIL PostStrOrdLineDet.NEXT = 0;

                /*
                CLEAR(BillNo);
                CLEAR(BillDate);
                CLEAR(PONo);
                IF SalesShipmentLine.GET("Shipment No.","Shipment Line No.") THEN BEGIN
                    BillNo := SalesShipmentLine."Source Document No.";
                */
                /*HssSale := '';
                IF SalesInvHeader."External Document Date" <> 0D THEN
                  HssSale := 'HSS Sale';
                */
                CostLCY := 0;
                CustAmount := 0;
                AmountLCY := 0;
                ProfitLCY := 0;

                //CostLCY := CostLCY + ("Sales Invoice Line".Quantity * "Sales Invoice Line"."Unit Cost (LCY)");   //TRI A.V 09.10.15 DEL

                //TRI A.V 09.10.15 START
                ValueEntry.RESET;
                ValueEntry.SETCURRENTKEY("Document No.");
                ValueEntry.SETRANGE("Document No.", "Sales Invoice Line"."Document No.");
                ValueEntry.SETRANGE("Document Line No.", "Sales Invoice Line"."Line No.");
                IF ValueEntry.FINDFIRST THEN
                    REPEAT
                        CostLCY += ValueEntry."Cost Amount (Actual)";
                    UNTIL ValueEntry.NEXT = 0;
                //TRI A.V 09.10.15 DEL STOP

                CustAmount := CustAmount + "Sales Invoice Line".Amount;

                IF SalesInvHeader."Currency Code" = '' THEN
                    AmountLCY := CustAmount
                ELSE
                    AmountLCY :=
                      CurrExchRate.ExchangeAmtFCYToLCY(
                        WORKDATE, SalesInvHeader."Currency Code", CustAmount, SalesInvHeader."Currency Factor");

                CustLedgEntry.RESET;
                CustLedgEntry.SETCURRENTKEY("Document No.", "Document Type", "Customer No.");
                CustLedgEntry.SETRANGE("Document No.", "No.");
                CustLedgEntry.SETRANGE("Document Type", CustLedgEntry."Document Type"::Invoice);
                CustLedgEntry.SETRANGE("Customer No.", "Bill-to Customer No.");
                IF CustLedgEntry.FINDFIRST THEN
                    AmountLCY := CustLedgEntry."Sales (LCY)";

                ProfitLCY := AmountLCY - ABS(CostLCY);

                //"Sales Invoice Line"."Include in Sales Register" := TRUE;
                // PRITI
                SalesHeader.RESET;
                SalesHeader.SETRANGE(SalesHeader."Sell-to Customer No.", SalesInvHeader."Sell-to Customer No.");
                IF SalesHeader.FINDFIRST THEN BEGIN
                    SalesLine.RESET;
                    SalesLine.SETRANGE(SalesLine."Document No.", SalesHeader."No.");
                    IF SalesLine.FINDFIRST THEN BEGIN
                        SQty := SalesLine.Quantity;
                        InvQty := SalesLine."Qty. to Invoice";
                    END;
                END;
                // PRITI 9Feb 2017


                /*
                //MODIFY;
                CLEAR(revcodt1);
                //IF saleslineplancost.GET("Document No.") THEN BEGIN
                   revcost.RESET;
                   //revcost.CALCFIELDS(revcost.Segment);
                   //revcost.SETRANGE("SO/SI No.",saleslineplancost."Document No.");
                   //revcost.SETRANGE(Segment, saleslineplancost."Type of Order");
                   revcost.setrange(revcost."SO/SI No.",);
                    IF revcost.FINDFIRST THEN REPEAT
                      revcodt1:=(revcost."Plan Cost");///SQty)*InvQty;
                    UNTIL revcost.NEXT=0;
                END;
                //MESSAGE('%1',revcost);
                */

                /* revcost.RESET;
                 revcost.SETRANGE(revcost.Code,"Sales Invoice Line"."Order No.");
                 IF revcost.FINDSET THEN REPEAT
                   revcodt1+=(revcost."Plan Cost")/"Sales Invoice Line".Quantity;
                 UNTIL revcost.NEXT=0;
                 */

                CLEAR(CentralGSTPer);
                CLEAR(CentralGSTAmount);
                DetailedGST.RESET;
                DetailedGST.SETRANGE(DetailedGST."Document No.", "Sales Invoice Line"."Document No.");//PT(FBTS)
                DetailedGST.SetRange("Document Line No.", "Sales Invoice Line"."Line No.");
                DetailedGST.SetRange("No.", "Sales Invoice Line"."No.");
                DetailedGST.SETRANGE(DetailedGST."GST Component Code", 'CGST');
                IF DetailedGST.FINDSET THEN BEGIN
                    REPEAT
                        CentralGSTPer := DetailedGST."GST %";
                        CentralGSTAmount += DetailedGST."GST Amount";
                    UNTIL DetailedGST.NEXT = 0;
                END;

                CLEAR(StateGSTPer);
                CLEAR(StateGSTAmount);
                DetailedGST.RESET;
                DetailedGST.SETRANGE(DetailedGST."Document No.", "Sales Invoice Line"."Document No.");
                DetailedGST.SetRange("Document Line No.", "Sales Invoice Line"."Line No.");
                DetailedGST.SetRange("No.", "Sales Invoice Line"."No.");
                DetailedGST.SETRANGE(DetailedGST."GST Component Code", 'SGST');
                IF DetailedGST.FINDSET THEN BEGIN
                    REPEAT
                        StateGSTPer := DetailedGST."GST %";
                        StateGSTAmount += DetailedGST."GST Amount";
                    UNTIL DetailedGST.NEXT = 0;
                END;
                CLEAR(IntegratedGSTPer);
                CLEAR(IntegratedGSTAmount);
                DetailedGST.RESET;
                DetailedGST.SETRANGE(DetailedGST."Document No.", "Sales Invoice Line"."Document No.");
                DetailedGST.SetRange("Document Line No.", "Sales Invoice Line"."Line No.");
                DetailedGST.SetRange("No.", "Sales Invoice Line"."No.");
                DetailedGST.SETRANGE(DetailedGST."GST Component Code", 'IGST');
                IF DetailedGST.FINDSET THEN BEGIN
                    REPEAT
                        IntegratedGSTPer := DetailedGST."GST %";
                        IntegratedGSTAmount := DetailedGST."GST Amount";
                    UNTIL DetailedGST.NEXT = 0;
                END;

            end;

            trigger OnPreDataItem()
            begin
                SETRANGE("Posting Date", StDate, EdDate);
                IF CustomerNo <> '' then
                    SetRange("Sell-to Customer No.", CustomerNo);
                CLEAR(revcodt1);
            end;
        }
        dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
        {
            DataItemTableView = SORTING("Document No.", "Line No.")
                                ORDER(Ascending)
                                WHERE(Type = CONST(Item),
                                      "No." = FILTER(<> ' '),
                                      Quantity = FILTER(<> 0));
            column(CustomerNameCr; Customer.Name + Customer."Name 2")
            {
            }
            column(AddressCr; Customer.Address + Customer."Address 2")
            {
            }
            column(TinNoCr; Customer."GST Registration No.")
            {
            }
            column(StateDescCr; StateDesc)
            {
            }
            column(ContactPersonCr; Customer.Contact)
            {
            }
            column(OurSONoCr; SalesInvHeader."External Document No.")
            {
            }
            column(GST_BaseAMT; '')// "Sales Cr.Memo Line"."GST Base Amount")
            {
            }
            column(PostingDate; "Sales Cr.Memo Line"."Posting Date")
            {
            }
            column(ItemNoCr; "Sales Cr.Memo Line"."No.")
            {
            }
            column(ItemDescriptionCr; "Sales Cr.Memo Line".Description)
            {
            }
            column(HSNSACCode_SalesCrMemoLine; "Sales Cr.Memo Line"."HSN/SAC Code")
            {
            }
            column(ItemTariffCr; '')//"Sales Cr.Memo Line"."Excise Prod. Posting Group")
            {
            }
            column(QtyCr; "Sales Cr.Memo Line".Quantity)
            {
            }
            column(BasicValueCr; "Sales Cr.Memo Line"."Line Amount" / CurrFtr + "Sales Cr.Memo Line"."Line Discount Amount" / CurrFtr)
            {
            }
            column(DiscountCR; "Sales Cr.Memo Line"."Line Discount Amount" / CurrFtr)
            {
            }
            column(BasicValueCR1; "Sales Cr.Memo Line"."Line Amount" / CurrFtr)
            {
            }
            column(UOMSalesCredit; "Sales Cr.Memo Line"."Unit of Measure")
            {
            }
            column(SalesTaxCr; '')//"Sales Cr.Memo Line"."Tax Amount" / CurrFtr)
            {
            }
            column(ExciseDutyCr; '')// "Sales Cr.Memo Line"."BED Amount" / CurrFtr)
            {
            }
            column(EDCessCr; '')// "Sales Cr.Memo Line"."eCess Amount" / CurrFtr)
            {
            }
            column(HECessCr; '')// "Sales Cr.Memo Line"."SHE Cess Amount" / CurrFtr)
            {
            }
            column(ADCAmtCr; '')// "Sales Cr.Memo Line"."ADC VAT Amount" / CurrFtr)
            {
            }
            column(TotalBillAmtCr; '')// "Sales Cr.Memo Line"."Amount To Customer" / CurrFtr)
            {
            }
            column(SaleTaxRateCr; '')// "Sales Cr.Memo Line"."Tax %")
            {
            }
            column(GSTBaseAmount_SalesCrMemoLine; '')// "Sales Cr.Memo Line"."GST Base Amount")
            {
            }
            column(ApplicableFormCr; '')// "Sales Cr.Memo Line"."Form Code")
            {
            }
            column(DocumentNoCr; '')// "Sales Cr.Memo Line"."Document No.")
            {
            }
            column(Location2; "Sales Cr.Memo Line"."Location Code")
            {
            }
            column(Productpostinggrp1; "Sales Cr.Memo Line"."Gen. Prod. Posting Group")
            {
            }
            column(LocCode2; "Sales Cr.Memo Line"."Shortcut Dimension 2 Code")
            {
            }
            column(Unit_Cost; "Sales Cr.Memo Line"."Unit Cost (LCY)")
            {
            }
            column(QTY1; "Sales Cr.Memo Line".Quantity)
            {
            }

            trigger OnAfterGetRecord()
            begin
                SCrMemoHdr.GET("Sales Cr.Memo Line"."Document No.");

                CurrFtr := 1;
                IF ShowAmtsInLCY THEN BEGIN
                    IF SCrMemoHdr."Currency Factor" <> 0 THEN
                        CurrFtr := SCrMemoHdr."Currency Factor"
                END;

                StateDesc := '';
                IF Customer.GET("Sell-to Customer No.") THEN
                    IF StateRec.GET(Customer."State Code") THEN
                        StateDesc := StateRec.Description;



                CLEAR(CentralGSTPer);
                CLEAR(CentralGSTAmount);
                DetailedGST.RESET;
                DetailedGST.SETRANGE(DetailedGST."Document No.", "Sales Cr.Memo Line"."Document No.");
                DetailedGST.SETRANGE(DetailedGST."GST Component Code", 'CGST');
                IF DetailedGST.FINDSET THEN BEGIN
                    REPEAT
                        CentralGSTPer := DetailedGST."GST %";
                        CentralGSTAmount := DetailedGST."GST Amount";
                    UNTIL DetailedGST.NEXT = 0;
                END;

                CLEAR(StateGSTPer);
                CLEAR(StateGSTAmount);
                DetailedGST.RESET;
                DetailedGST.SETRANGE(DetailedGST."Document No.", "Sales Cr.Memo Line"."Document No.");
                DetailedGST.SETRANGE(DetailedGST."GST Component Code", 'SGST');
                IF DetailedGST.FINDSET THEN BEGIN
                    REPEAT
                        StateGSTPer := DetailedGST."GST %";
                        StateGSTAmount := DetailedGST."GST Amount";

                    UNTIL DetailedGST.NEXT = 0;
                END;
                //Message('%1', StateGSTAmount);
                CLEAR(IntegratedGSTPer);
                CLEAR(IntegratedGSTAmount);
                DetailedGST.RESET;
                DetailedGST.SETRANGE(DetailedGST."Document No.", "Sales Cr.Memo Line"."Document No.");
                DetailedGST.SETRANGE(DetailedGST."GST Component Code", 'IGST');
                IF DetailedGST.FINDSET THEN BEGIN
                    REPEAT
                        IntegratedGSTPer := DetailedGST."GST %";
                        IntegratedGSTAmount := DetailedGST."GST Amount";
                    UNTIL DetailedGST.NEXT = 0;
                END;
            end;

            trigger OnPreDataItem()
            begin
                SETRANGE("Posting Date", StDate, EdDate);
            end;
        }
        // dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
        // {
        //     DataItemTableView = SORTING("Document No.", "Line No.");
        //     column(VendorName; Vendor.Name + Vendor."Name 2")
        //     {
        //     }
        //     column(AddressPI; Vendor.Address + Vendor."Address 2")
        //     {
        //     }
        //     column(TinNoPI; Vendor."GST Registration No.")
        //     {
        //     }
        //     column(PivOrderNo; PInvHdr."Order No.")
        //     {
        //     }
        //     column(StateDescPI; StateDesc)
        //     {
        //     }
        //     column(ContactPersonPI; Vendor.Contact)
        //     {
        //     }
        //     column(VendorInvNo; PInvHdr."Vendor Invoice No.")
        //     {
        //     }
        //     column(GSTBaseAmount_PurchInvLine; '')// "Purch. Inv. Line"."GST Base Amount")
        //     {
        //     }
        //     column(PostingDatePI; "Purch. Inv. Line"."Posting Date")
        //     {
        //     }
        //     column(ItemNoPI; "Purch. Inv. Line"."No.")
        //     {
        //     }
        //     column(ItemDescriptionPI; "Purch. Inv. Line".Description)
        //     {
        //     }
        //     column(ItemTariffPI; '')// "Purch. Inv. Line"."Excise Prod. Posting Group")
        //     {
        //     }
        //     column(QtyPI; "Purch. Inv. Line".Quantity)
        //     {
        //     }
        //     column(BasicValuePI; "Purch. Inv. Line"."Line Amount" / CurrFtr)
        //     {
        //     }
        //     column(SalesTaxPI; '')// "Purch. Inv. Line"."Tax Amount" / CurrFtr)
        //     {
        //     }
        //     column(ExciseDutyPI; '')//''ine"."BED Amount" / CurrFtr)
        //     {
        //     }
        //     column(EDCessPI; '')// "Purch. Inv. Line"."eCess Amount" / CurrFtr)
        //     {
        //     }
        //     column(HECessPI; '')// "Purch. Inv. Line"."SHE Cess Amount" / CurrFtr)
        //     {
        //     }
        //     column(ADCAmtPI; '')// "Purch. Inv. Line"."ADC VAT Amount" / CurrFtr)
        //     {
        //     }
        //     column(TotalBillAmtPI; '')// "Purch. Inv. Line"."Amount To Vendor" / CurrFtr)
        //     {
        //     }
        //     column(SaleTaxRatePI; '')// "Purch. Inv. Line"."Tax %")
        //     {
        //     }
        //     column(ApplicableFormPI; '')// "Purch. Inv. Line"."Form Code")
        //     {
        //     }
        //     column(DocumentNoPI; "Purch. Inv. Line"."Document No.")
        //     {
        //     }
        //     column(Location3; "Purch. Inv. Line"."Location Code")
        //     {
        //     }
        //     column(Productpostinggrp2; "Purch. Inv. Line"."Gen. Prod. Posting Group")
        //     {
        //     }
        //     column(Loccode3; "Purch. Inv. Line"."Shortcut Dimension 2 Code")
        //     {
        //     }
        //     column(SQty; SQty)
        //     {
        //     }
        //     column(InvQty; InvQty)
        //     {
        //     }

        //     trigger OnAfterGetRecord()
        //     begin
        //         PInvHdr.GET("Purch. Inv. Line"."Document No.");
        //         /*IF NOT PInvHdr."Sales Return" THEN
        //           CurrReport.SKIP;
        //         */
        //         CurrFtr := 1;
        //         IF ShowAmtsInLCY THEN BEGIN
        //             IF PInvHdr."Currency Factor" <> 0 THEN
        //                 CurrFtr := PInvHdr."Currency Factor"
        //         END;

        //         IF Vendor.GET("Purch. Inv. Line"."Buy-from Vendor No.") THEN
        //             IF StateRec.GET(Customer."State Code") THEN
        //                 StateDesc := StateRec.Description;

        //     end;

        //     trigger OnPreDataItem()
        //     begin
        //         SETRANGE("Posting Date", StDate, EdDate);
        //     end;
        // }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Filters)
                {
                    field(StDate; StDate)
                    {
                        Caption = 'Start Date';
                        ApplicationArea = all;
                    }
                    field(EdDate; EdDate)
                    {
                        Caption = 'End Date';
                        ApplicationArea = all;
                    }
                    field(ShowAmtsInLCY; ShowAmtsInLCY)
                    {
                        Caption = 'Show Amounts in LCY';
                        ApplicationArea = all;
                    }

                    field(CustomerNo; CustomerNo)
                    {
                        Caption = 'Customer No.';
                        ApplicationArea = all;
                        TableRelation = Customer;
                    }

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
        CompInfo.GET;

        IF (StDate = 0D) OR (EdDate = 0D) THEN
            ERROR(Text001);

        IF StDate > EdDate THEN
            ERROR(Text002);

        CompInfo.CALCFIELDS(Picture);
    end;

    var
        Customer: Record "customer";
        StateDesc: Text[50];
        SQty: Decimal;
        InvQty: Decimal;
        //  ExciseProdPosting: Record "13710";
        SalesInvHeader: Record "Sales Invoice Header";
        // PostStrOrdLineDet: Record "13798";
        FreightCharges: Decimal;
        PackingCharges: Decimal;
        HandlingCharges: Decimal;
        OtherTax: Decimal;
        CompInfo: Record "company information";
        StateRec: Record "state";
        SalesShipmentLine: Record "Sales Shipment Line";
        HssSale: Text[10];
        CurrExchRate: Record "Currency Exchange Rate";
        CustLedgEntry: Record "Cust. Ledger Entry";
        CostLCY: Decimal;
        CustAmount: Decimal;
        AmountLCY: Decimal;
        ProfitLCY: Decimal;
        SCrMemoHdr: Record "Sales Cr.Memo Header";
        PInvHdr: Record "Purch. Inv. Header";
        CustomerNo: Code[20];
        Vendor: Record "vendor";
        StDate: Date;
        EdDate: Date;
        Text001: Label 'You must Enter Start Date and End Date.';
        Text002: Label 'End Date must be Greater than Start Date.';
        ShowAmtsInLCY: Boolean;
        CurrFtr: Decimal;
        ValueEntry: Record "Value Entry";
        //  revcost: Record "50009";
        revcodt1: Decimal;
        SalesLine: Record "sales line";
        SalesHeader: Record "sales header";
        saleslineplancost: Record "Sales Line";
        RecSIH: Record "Sales Invoice Header";
        REVQTY: Decimal;
        DetailedGST: Record "Detailed GST Ledger Entry";
        CentralGSTPer: Decimal;
        CentralGSTAmount: Decimal;
        StateGSTPer: Decimal;
        StateGSTAmount: Decimal;
        IntegratedGSTPer: Decimal;
        IntegratedGSTAmount: Decimal;
}

