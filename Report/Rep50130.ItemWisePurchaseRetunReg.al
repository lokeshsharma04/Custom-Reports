report 50130 "ItemWisePurchaseReturnRegister"
{
    DefaultLayout = RDLC;
    Caption = 'Item Wise Purchase Return Register';
    RDLCLayout = 'Layout/ItemWisePurchaseReturnRegister.rdl';
    PreviewMode = Normal;
    ApplicationArea = all;
    UsageCategory = Lists;

    dataset
    {
        dataitem("Purch. Inv. Line"; "Purch. Cr. Memo Line")
        {
            DataItemTableView = SORTING("Document No.", "Line No.") ORDER(Ascending) WHERE("No." = FILTER(<> ' '), Quantity = FILTER(<> 0));
            RequestFilterFields = "Buy-from Vendor No.", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Gen. Prod. Posting Group", "Gen. Bus. Posting Group";
            column(CompInfo_Pic; CompInfo.Picture)
            {
            }
            column(Comp_Name; CompInfo.Name)
            {
            }
            column(CredMemoNo; "Purch. Inv. Line"."Document No.")
            {

            }
            column(vendinvNo; SalesInvHeader."Vendor Cr. Memo No.")
            { }
            column(VendInvDate; SalesInvHeader."Document Date")
            { }
            column(TDSAmount; Round((TDSAmount), 1))
            { }

            column(GST_Group_Code; "Purch. Inv. Line"."GST Group Code")
            {
            }
            column(Common_Credit; "Common Credit")
            {

            }
            column(Comp_Add; '')//CompInfo.Address+CompInfo."Address 2"+CompInfo.City+CompInfo.State)
            {
            }
            column(Comp_CityState; '')//CompInfo.City+CompInfo.State)
            {
            }
            column(VendorName; Vendor.Name + Vendor."Name 2")
            {
            }
            column(Address; Vendor.Address + Vendor."Address 2")
            {
            }
            column(TinNo; Vendor."GST Registration No.")
            {
            }
            column(SalesInvState; '')
            {
            }
            column(SalesInvOrder; SalesInvHeader."Return Order No.")
            {
            }
            column(OurPoNo; '')
            {
            }
            column(StateDesc; StateDesc)
            {
            }
            column(ContactPerson; Vendor.Contact)
            {
            }
            column(OurSONo; '')
            {
            }
            column(Unit_of_Measure; "Unit of Measure")
            {
            }
            column(PODt; "Purch. Inv. Line"."Posting Date")
            {
            }
            column(CESEPer; CESEPer)
            { }
            column(CESEAMT; CESEAMT)
            { }
            column(HSNSACCode_SalesInvoiceLine; "Purch. Inv. Line"."HSN/SAC Code")
            {
            }
            column(Return_Shipment_No_; "Return Shipment No.")

            {

            }
            column(ShortcutDimension1Code_SalesInvoiceLine; "Purch. Inv. Line"."Shortcut Dimension 1 Code")
            {
            }
            column(ItemCode; "Purch. Inv. Line"."No.")
            {
            }
            column(ItemDesc; "Purch. Inv. Line".Description)
            {
            }
            column(Type; "Purch. Inv. Line".type)
            {

            }
            column(VednorCode; Vendor."No.")
            {


            }
            column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group")
            {

            }
            column(Gen__Bus__Posting_Group; "Gen. Bus. Posting Group")
            {

            }

            column(GSTBaseAmount_SalesInvoiceLine; '')//"Purch. Inv. Line"."GST Base Amount")
            {
            }
            column(ItemTariff; '')//"Purch. Inv. Line"."Excise Prod. Posting Group")
            {
            }
            column(Qty; "Purch. Inv. Line".Quantity)
            {
            }
            column(BasicValue; "Purch. Inv. Line"."Line Amount" / CurrFtr + "Purch. Inv. Line"."Line Discount Amount" / CurrFtr)
            {
            }
            column(Discount; "Purch. Inv. Line"."Line Discount Amount" / CurrFtr)
            {
            }
            column(BasicValue1; "Purch. Inv. Line"."Line Amount" / CurrFtr)
            {
            }
            column(SalesTax; '')//"Purch. Inv. Line"."Tax Amount"/CurrFtr)
            {
            }
            column(ExciseDuty; '')//"Purch. Inv. Line"."BED Amount"/CurrFtr)
            {
            }
            column(EDCess; '')//"Purch. Inv. Line"."eCess Amount"/CurrFtr)
            {
            }
            column(HECess; '')//"Purch. Inv. Line"."SHE Cess Amount"/CurrFtr)
            {
            }
            column(ADCAmt; '')//"Purch. Inv. Line"."ADC VAT Amount"/CurrFtr)
            {
            }
            column(ProductGroupCode_SalesInvoiceLine; '')//"Purch. Inv. Line"."Product Group Code")
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
            column(TotalBillAmt; '')//"Purch. Inv. Line"."Amount To Vendor"/CurrFtr)
            {
            }
            column(SalesOfficer; '')
            {
            }
            column(SaleTaxRate; '')//"Purch. Inv. Line"."Tax %")
            {
            }
            column(ApplicableForm; '')//"Purch. Inv. Line"."Form Code")
            {
            }
            column(DocumentNo_SalesInvoiceLine; "Purch. Inv. Line"."Document No.")
            {
            }
            column(OrderNo; SalesInvHeader."Return Order No.")
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
            column(Line_No; "Purch. Inv. Line"."Line No.")
            {
            }
            column(Segment; '')
            {
            }
            column(LocationCode; "Purch. Inv. Line"."Location Code")
            {
            }
            column(ProductpostingGroup; "Purch. Inv. Line"."Gen. Prod. Posting Group")
            {
            }
            column(LocCode; "Purch. Inv. Line"."Shortcut Dimension 2 Code")
            {
            }
            column(CentralGSTPer; CentralGSTPer)
            {
            }
            column(CentralGSTAmount; ABS(CentralGSTAmount))
            {
            }
            column(StateGSTPer; StateGSTPer)
            {
            }
            column(StateGSTAmount; Abs(StateGSTAmount))
            {
            }
            column(IntegratedGSTPer; IntegratedGSTPer)
            {
            }
            column(gsrdate; gsrdate)
            {

            }
            column(IntegratedGSTAmount; Abs(IntegratedGSTAmount))
            {
            }

            column(GSTVendorType; Vendor_gRec."GST Vendor Type")
            {

            }
            column(GSTCredit; "Purch. Inv. Line"."GST Credit")
            {

            }

            trigger OnAfterGetRecord()
            var
                PIH: Record "Purch. Cr. Memo Hdr.";
                posredpurretshirec: Record 6650;
            begin

                posredpurretshirec.Reset();
                Clear(gsrdate);
                posredpurretshirec.SetRange("No.", "Return Shipment No.");
                if posredpurretshirec.FindFirst() then begin
                    gsrdate := posredpurretshirec."Posting Date";

                end;


                Clear(PIH);
                PIH.GET("Purch. Inv. Line"."Document No.");
                Clear(Vendor_gRec);
                IF Vendor_gRec.GET(PIH."Buy-from Vendor No.") Then;
                SalesInvHeader.GET("Document No.");

                CurrFtr := 1;
                IF ShowAmtsInLCY THEN BEGIN
                    IF SalesInvHeader."Currency Factor" <> 0 THEN
                        CurrFtr := SalesInvHeader."Currency Factor"
                END;

                StateDesc := '';
                IF Vendor.GET("Buy-from Vendor No.") THEN
                    IF StateRec.GET(Vendor."State Code") THEN
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

                //CostLCY := CostLCY + ("Purch. Inv. Line".Quantity * "Purch. Inv. Line"."Unit Cost (LCY)");   //TRI A.V 09.10.15 DEL

                //TRI A.V 09.10.15 START
                ValueEntry.RESET;
                ValueEntry.SETCURRENTKEY("Document No.");
                ValueEntry.SETRANGE("Document No.", "Purch. Inv. Line"."Document No.");
                ValueEntry.SETRANGE("Document Line No.", "Purch. Inv. Line"."Line No.");
                IF ValueEntry.FINDFIRST THEN
                    REPEAT
                        CostLCY += ValueEntry."Cost Amount (Actual)";
                    UNTIL ValueEntry.NEXT = 0;
                //TRI A.V 09.10.15 DEL STOP

                CustAmount := CustAmount + "Purch. Inv. Line".Amount;

                IF SalesInvHeader."Currency Code" = '' THEN
                    AmountLCY := CustAmount
                ELSE
                    AmountLCY :=
                      CurrExchRate.ExchangeAmtFCYToLCY(
                        WORKDATE, SalesInvHeader."Currency Code", CustAmount, SalesInvHeader."Currency Factor");

                CustLedgEntry.RESET;
                CustLedgEntry.SETCURRENTKEY("Document No.", "Document Type", "Vendor No.");
                CustLedgEntry.SETRANGE("Document No.", "No.");
                CustLedgEntry.SETRANGE("Document Type", CustLedgEntry."Document Type"::Invoice);
                CustLedgEntry.SETRANGE("Vendor No.", "Buy-from Vendor No.");
                IF CustLedgEntry.FINDFIRST THEN
                    AmountLCY := CustLedgEntry."Purchase (LCY)";

                ProfitLCY := AmountLCY - ABS(CostLCY);

                //"Purch. Inv. Line"."Include in Sales Register" := TRUE;
                // PRITI
                SalesHeader.RESET;
                SalesHeader.SETRANGE(SalesHeader."Buy-from Vendor No.", SalesInvHeader."Buy-from Vendor No.");
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
                 revcost.SETRANGE(revcost.Code,"Purch. Inv. Line"."Order No.");
                 IF revcost.FINDSET THEN REPEAT
                   revcodt1+=(revcost."Plan Cost")/"Purch. Inv. Line".Quantity;
                 UNTIL revcost.NEXT=0;
                 */

                CLEAR(CentralGSTPer);
                CLEAR(CentralGSTAmount);
                DetailedGST.RESET;
                DetailedGST.SETRANGE(DetailedGST."Document No.", "Purch. Inv. Line"."Document No.");
                DetailedGST.SetFilter(DetailedGST."GST Component Code", '%1', 'CGST');
                DetailedGST.SetRange("No.", "Purch. Inv. Line"."No.");
                DetailedGST.SetRange("Document line No.", "Purch. Inv. Line"."Line No.");
                IF DetailedGST.FINDSET THEN BEGIN
                    REPEAT
                        CentralGSTPer += DetailedGST."GST %";
                        //  CentralGSTPer := DetailedGST."GST %";
                        CentralGSTAmount += DetailedGST."GST Amount";
                    UNTIL DetailedGST.NEXT = 0;
                END;

                CLEAR(StateGSTPer);
                CLEAR(StateGSTAmount);
                DetailedGST.RESET;
                DetailedGST.SETRANGE(DetailedGST."Document No.", "Purch. Inv. Line"."Document No.");
                DetailedGST.SETRANGE(DetailedGST."GST Component Code", 'SGST');
                DetailedGST.SetRange("No.", "Purch. Inv. Line"."No.");
                DetailedGST.SetRange("Document line No.", "Purch. Inv. Line"."Line No.");
                IF DetailedGST.FINDSET THEN BEGIN
                    REPEAT
                        StateGSTPer += DetailedGST."GST %";
                        StateGSTAmount += DetailedGST."GST Amount";
                    UNTIL DetailedGST.NEXT = 0;
                END;

                CLEAR(IntegratedGSTPer);
                CLEAR(IntegratedGSTAmount);
                DetailedGST.RESET;
                DetailedGST.SETRANGE(DetailedGST."Document No.", "Purch. Inv. Line"."Document No.");
                DetailedGST.SETRANGE(DetailedGST."GST Component Code", 'IGST');
                DetailedGST.SetRange("No.", "Purch. Inv. Line"."No.");
                DetailedGST.SetRange("Document line No.", "Purch. Inv. Line"."Line No.");
                IF DetailedGST.FINDSET THEN BEGIN
                    REPEAT
                        IntegratedGSTPer += DetailedGST."GST %";
                        IntegratedGSTAmount += DetailedGST."GST Amount";
                    UNTIL DetailedGST.NEXT = 0;
                END;
                CLEAR(CESEPer);
                CLEAR(CESEAMT);
                DetailedGST.RESET;
                DetailedGST.SETRANGE(DetailedGST."Document No.", "Purch. Inv. Line"."Document No.");
                DetailedGST.SETRANGE(DetailedGST."GST Component Code", 'CESS');
                DetailedGST.SetRange("No.", "Purch. Inv. Line"."No.");
                DetailedGST.SetRange("Document line No.", "Purch. Inv. Line"."Line No.");
                IF DetailedGST.FINDSET THEN BEGIN
                    REPEAT
                        CESEPer += DetailedGST."GST %";
                        CESEAMT += DetailedGST."GST Amount";
                    UNTIL DetailedGST.NEXT = 0;
                END;
                Clear(TDSAmount);
                TaxTransValue.Reset();
                TaxTransValue.SetRange("Tax Type", 'TDS');
                TaxTransValue.SetRange("Tax Record ID", "Purch. Inv. Line".RecordId());
                TaxTransValue.SetRange("Value Type", TaxTransValue."Value Type"::COMPONENT);
                TaxTransValue.SetFilter(Percent, '<>%1', 0);
                if TaxTransValue.FindSet() then
                    repeat
                        TaxComponentName := TaxTransValue.GetAttributeColumName();
                        case TaxComponentName of
                            'TDS':
                                begin
                                    evaluate(TDSAmount, TaxTransValue."Column Value");
                                end;
                        end;
                    until TaxTransValue.Next() = 0;
            end;

            trigger OnPreDataItem()
            begin
                SETRANGE("Posting Date", StDate, EdDate);
                IF VendorNo <> '' then
                    SetFilter("Buy-from Vendor No.", VendorNo);
                CLEAR(revcodt1);


                // "Purch. Inv. Line".GetFilter("Document No.") 
            end;
        }


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
                        Visible = false;
                    }

                    field(VendorNo; VendorNo)
                    {
                        Caption = 'Vendor No.';
                        ApplicationArea = all;
                        TableRelation = Vendor;
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
        Vendor: Record "Vendor";
        StateDesc: Text[50];
        SQty: Decimal;
        InvQty: Decimal;
        //  ExciseProdPosting: Record "13710";
        SalesInvHeader: Record "Purch. Cr. Memo Hdr.";
        // PostStrOrdLineDet: Record "13798";
        FreightCharges: Decimal;
        PackingCharges: Decimal;
        HandlingCharges: Decimal;
        OtherTax: Decimal;
        CompInfo: Record "company information";
        StateRec: Record "state";
        gsrdate: date;
        SalesShipmentLine: Record "Sales Shipment Line";
        HssSale: Text[10];
        CurrExchRate: Record "Currency Exchange Rate";
        CustLedgEntry: Record "Vendor Ledger Entry";
        CostLCY: Decimal;
        CustAmount: Decimal;
        AmountLCY: Decimal;
        ProfitLCY: Decimal;
        SCrMemoHdr: Record "Sales Cr.Memo Header";
        SCrMemoline: Record "Sales Cr.Memo line";
        PInvHdr: Record "Purch. Cr. Memo Hdr.";
        VendorNo: Code[20];
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
        SalesHeader: Record "Purchase header";
        saleslineplancost: Record "Sales Line";
        RecSIH: Record "Purch. Cr. Memo Hdr.";
        REVQTY: Decimal;
        DetailedGST: Record "Detailed GST Ledger Entry";
        CentralGSTPer: Decimal;
        CentralGSTAmount: Decimal;
        TaxTransValue: Record "Tax Transaction Value";
        TaxComponentName: Text;
        TDSAmount: Decimal;

        StateGSTPer: Decimal;
        StateGSTAmount: Decimal;
        IntegratedGSTPer: Decimal;
        CESEPer: Decimal;
        CESEAMT: Decimal;
        IntegratedGSTAmount: Decimal;
        Vendor_gRec: Record Vendor;
}

