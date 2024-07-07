report 50106 "Item WIse Purchase Credit Memo"
{
    Caption = 'Item WIse Purchase Return Register';
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/ItemWIsePurchaseReturnRegister.rdl';
    dataset
    {
        dataitem("Purch. Cr. Memo Line"; "Purch. Cr. Memo Line")
        {
            // DataItemTableView = SORTING("Document No.", "Line No. ORDER(Ascending) WHERE(Type = CONST(Item), "No." = FILTER(<> ' '), Quantity = FILTER(<> 0));
            column(VendorNameCr; Vendor.Name + Vendor."Name 2")
            {
            }
            column(AddressCr; Vendor.Address + Vendor."Address 2")
            {
            }
            column(Common_Credit; "Common Credit")
            {

            }
            column(Return_Shipment_No_; "Return Shipment No.")

            {

            }


            column(TinNoCr; Vendor."GST Registration No.")
            {
            }
            column(StateDescCr; StateDesc)
            {
            }
            column(ContactPersonCr; Vendor.Contact)
            {
            }
            column(OurSONoCr; '')
            {
            }
            column(GST_BaseAMT; '')// "Purch. Cr. Memo Line"."GST Base Amount")
            {
            }
            column(PostingDate; "Purch. Cr. Memo Line"."Posting Date")
            {
            }
            column(ItemNoCr; "Purch. Cr. Memo Line"."No.")
            {
            }
            column(ItemDescriptionCr; "Purch. Cr. Memo Line".Description)
            {
            }
            column(HSNSACCode_SalesCrMemoLine; "Purch. Cr. Memo Line"."HSN/SAC Code")
            {
            }
            column(ItemTariffCr; '')//"Purch. Cr. Memo Line"."Excise Prod. Posting Group")
            {
            }
            column(QtyCr; "Purch. Cr. Memo Line".Quantity)
            {
            }
            column(BasicValueCr; "Purch. Cr. Memo Line"."Line Amount" / CurrFtr + "Purch. Cr. Memo Line"."Line Discount Amount" / CurrFtr)
            {
            }
            column(DiscountCR; "Purch. Cr. Memo Line"."Line Discount Amount" / CurrFtr)
            {
            }
            column(BasicValueCR1; "Purch. Cr. Memo Line"."Line Amount" / CurrFtr)
            {
            }
            column(UOMSalesCredit; "Purch. Cr. Memo Line"."Unit of Measure")
            {
            }
            column(SalesTaxCr; '')//"Purch. Cr. Memo Line"."Tax Amount" / CurrFtr)
            {
            }
            column(ExciseDutyCr; '')// "Purch. Cr. Memo Line"."BED Amount" / CurrFtr)
            {
            }
            column(EDCessCr; '')// "Purch. Cr. Memo Line"."eCess Amount" / CurrFtr)
            {
            }
            column(HECessCr; '')// "Purch. Cr. Memo Line"."SHE Cess Amount" / CurrFtr)
            {
            }
            column(ADCAmtCr; '')// "Purch. Cr. Memo Line"."ADC VAT Amount" / CurrFtr)
            {
            }
            column(TotalBillAmtCr; '')// "Purch. Cr. Memo Line"."Amount To Vendor" / CurrFtr)
            {
            }
            column(SaleTaxRateCr; '')// "Purch. Cr. Memo Line"."Tax %")
            {
            }
            column(GSTBaseAmount_SalesCrMemoLine; '')// "Purch. Cr. Memo Line"."GST Base Amount")
            {
            }
            column(ApplicableFormCr; '')// "Purch. Cr. Memo Line"."Form Code")
            {
            }
            column(DocumentNoCr; '')//== "Purch. Cr. Memo Line"."Document No.")
            {
            }
            column(Location2; "Purch. Cr. Memo Line"."Location Code")
            {
            }
            column(Productpostinggrp1; "Purch. Cr. Memo Line"."Gen. Prod. Posting Group")
            {
            }
            column(LocCode2; "Purch. Cr. Memo Line"."Shortcut Dimension 2 Code")
            {
            }
            column(Unit_Cost; "Purch. Cr. Memo Line"."Unit Cost (LCY)")
            {
            }
            column(QTY1; "Purch. Cr. Memo Line".Quantity)
            {
            }

            column(GSTVendorType1; Vendor_gRec."GST Vendor Type")
            {

            }
            column(GST_Group_Code1; "GST Group Code")
            {

            }
            column(GSRDATE; GSRDATE)
            {

            }
            trigger OnAfterGetRecord()
            var
                PCH: Record "Purch. Cr. Memo Hdr.";
            begin
                Clear(GSRDATE);
                ReturnShipmentHeaderRec.Reset();
                ReturnShipmentHeaderRec.SetRange("No.", "Return Shipment No.");
                if ReturnShipmentHeaderRec.FindFirst() then begin
                    GSRDATE := ReturnShipmentHeaderRec."Posting Date";
                end;

                Clear(PCH);
                PCH.GET("Purch. Cr. Memo Line"."Document No.");
                Clear(Vendor_gRec);
                IF Vendor_gRec.GET(PCH."Buy-from Vendor No.") Then;



                IF SCrMemoHdr.GET("Purch. Cr. Memo Line"."Document No.") then
                    CurrFtr := 1;
                IF ShowAmtsInLCY THEN BEGIN
                    IF SCrMemoHdr."Currency Factor" <> 0 THEN
                        CurrFtr := SCrMemoHdr."Currency Factor"
                END;

                //StateDesc := '';
                IF Vendor.GET("Buy-from Vendor No.") THEN
                    IF StateRec.GET(Vendor."State Code") THEN
                        StateDesc := StateRec.Description;



                CLEAR(CentralGSTPer);
                CLEAR(CentralGSTAmount);
                DetailedGST.RESET;
                DetailedGST.SETRANGE(DetailedGST."Document No.", "Purch. Cr. Memo Line"."Document No.");
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
                DetailedGST.SETRANGE(DetailedGST."Document No.", "Purch. Cr. Memo Line"."Document No.");
                DetailedGST.SETRANGE(DetailedGST."GST Component Code", 'SGST');
                IF DetailedGST.FINDSET THEN BEGIN
                    REPEAT
                        StateGSTPer := DetailedGST."GST %";
                        StateGSTAmount := DetailedGST."GST Amount";
                    UNTIL DetailedGST.NEXT = 0;
                END;

                CLEAR(IntegratedGSTPer);
                CLEAR(IntegratedGSTAmount);
                DetailedGST.RESET;
                DetailedGST.SETRANGE(DetailedGST."Document No.", "Purch. Cr. Memo Line"."Document No.");
                DetailedGST.SETRANGE(DetailedGST."GST Component Code", 'IGST');
                IF DetailedGST.FINDSET THEN BEGIN
                    REPEAT
                        IntegratedGSTPer := DetailedGST."GST %";
                        IntegratedGSTAmount := DetailedGST."GST Amount";
                    UNTIL DetailedGST.NEXT = 0;
                END;
                CLEAR(CESEPer);
                CLEAR(CESEAMT);
                DetailedGST.RESET;
                DetailedGST.SETRANGE(DetailedGST."Document No.", "Purch. Cr. Memo Line"."Document No.");
                DetailedGST.SETRANGE(DetailedGST."GST Component Code", 'CESS');
                DetailedGST.SetRange("No.", "Purch. Cr. Memo Line"."No.");
                DetailedGST.SetRange("Document line No.", "Purch. Cr. Memo Line"."Line No.");
                IF DetailedGST.FINDSET THEN BEGIN
                    REPEAT
                        CESEPer += DetailedGST."GST %";
                        CESEAMT += DetailedGST."GST Amount";
                    UNTIL DetailedGST.NEXT = 0;
                END;
            end;

            trigger OnPreDataItem()
            begin
                SETRANGE("Posting Date", StDate, EdDate);
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
                    // field(ShowAmtsInLCY; ShowAmtsInLCY)
                    // {
                    //     Caption = 'Show Amounts in LCY';
                    //     ApplicationArea = all;
                    // }

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
    trigger OnPreReport()
    begin
        // CompInfo.GET;

        // IF (StDate = 0D) OR (EdDate = 0D) THEN
        //     ERROR(Text001);

        // IF StDate > EdDate THEN
        //     ERROR(Text002);

        //CompInfo.CALCFIELDS(Picture);
    end;

    var
        Vendor: Record "Vendor";
        StateDesc: Text[50];
        SQty: Decimal;
        InvQty: Decimal;
        //  ExciseProdPosting: Record "13710";
        SalesInvHeader: Record "Purch. Inv. Header";
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
        CustLedgEntry: Record "Vendor Ledger Entry";
        CostLCY: Decimal;
        CustAmount: Decimal;
        Purchase: Record "Purch. Cr. Memo Line";
        AmountLCY: Decimal;
        GSRDATE: DATE;
        ProfitLCY: Decimal;
        SCrMemoHdr: Record "Sales Cr.Memo Header";
        SCrMemoline: Record "Sales Cr.Memo line";
        PInvHdr: Record "Purch. Inv. Header";
        VendorNo: Code[20];
        StDate: Date;
        EdDate: Date;
        Text001: Label 'You must Enter Start Date and End Date.';
        Text002: Label 'End Date must be Greater than Start Date.';
        ShowAmtsInLCY: Boolean;
        CurrFtr: Decimal;
        ValueEntry: Record "Value Entry";
        ReturnShipmentHeaderRec: Record "Return Shipment Header";
        //  revcost: Record "50009";
        revcodt1: Decimal;
        SalesLine: Record "sales line";
        SalesHeader: Record "Purchase header";
        saleslineplancost: Record "Sales Line";
        RecSIH: Record "Sales Invoice Header";
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
