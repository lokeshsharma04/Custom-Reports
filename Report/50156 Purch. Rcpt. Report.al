Report 50156 "Purch. Rcpt. Report"
{
    DefaultLayout = RDLC;
    UsageCategory = Administration;
    ApplicationArea = all;

    RDLCLayout = 'Report/Purch. Rcpt. Report.rdl';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            RequestFilterFields = "No.";
            column(CostCenter; CostCenter)
            {
            }
            column(LocName; LocName)
            {
            }
            column(LocAdd; LocAdd)
            {
            }
            column(LocAdd2; LocAdd2)
            {
            }
            column(PostCode; PostCode)
            {
            }
            column(LocPhone2; LocPhone2)
            {
            }
            column(LocPhone1; LocPhone1)
            {
            }
            column(LocCity; LocCity)
            {
            }
            column(LocStateCode; LocStateCode)
            {
            }
            column(LocName2; LocName2)
            {
            }
            column(OrderNo_PurchRcptHeader; "Purch. Rcpt. Header"."Order No.")
            {
            }
            column(LocationCode_PurchRcptHeader; "Purch. Rcpt. Header"."Location Code")
            {
            }
            column(PaymentTermsCode_PurchRcptHeader; "Purch. Rcpt. Header"."Payment Terms Code")
            {
            }
            column(DueDate_PurchRcptHeader; "Purch. Rcpt. Header"."Due Date")
            {
            }
            column(OrderDate_PurchRcptHeader; "Purch. Rcpt. Header"."Order Date")
            {
            }
            column(PostingDate_PurchRcptHeader; "Purch. Rcpt. Header"."Posting Date")
            {
            }
            column(ExpectedReceiptDate_PurchRcptHeader; "Purch. Rcpt. Header"."Expected Receipt Date")
            {
            }
            column(PaytoVendorNo_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to Vendor No.")
            {
            }
            column(PaytoName_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to Name")
            {
            }
            column(PaytoName2_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to Name 2")
            {
            }
            column(PaytoAddress_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to Address" + ',' + "Pay-to Address 2")
            {
            }
            column(PaytoAddress2_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to Address 2")
            {
            }
            column(PaytoCity_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to City")
            {
            }
            column(PaytoContact_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to Contact")
            {
            }
            column(No; "Purch. Rcpt. Header"."No.")
            {
            }
            column(VendorOrderNo_PurchRcptHeader; "Purch. Rcpt. Header"."Vendor Order No.")
            {
            }
            column(companyPic; CompanyInfo.Picture)
            {
            }
            column(VendorInvoiceDate_PurchRcptHeader; Format("Purch. Rcpt. Header"."Document Date", 0, 1))
            {
            }
            column(VendorShipmentNo_PurchRcptHeader; "Purch. Rcpt. Header"."Vendor Shipment No.")
            {
            }
            column(Cname; CompanyInfo.Name)
            {
            }
            column(Name2; CompanyInfo."Name 2")
            {
            }
            column(emailcompany; CompanyInfo."E-Mail")
            {
            }
            column(ComHomePAge; CompanyInfo."Home Page")
            {
            }
            column(CAddress; CompanyInfo.Address + ' ' + CompanyInfo."Address 2")
            {
            }
            column(Cphione; CompanyInfo."Phone No.")
            {
            }
            column(Caddress2; CompanyInfo."Address 2")
            {
            }
            column(Cgst; CompanyInfo."GST Registration No.")
            {
            }
            column(Ccity; CompanyInfo.City)
            {
            }
            column(CPostcode; CompanyInfo."Post Code")
            {
            }
            column(Vendor_GST_Reg__No_; "Vendor GST Reg. No.")
            { }
            dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = where(Quantity = filter(> 0));//,"Undo Receipt"=filter(<>Yes));
                column(ReportForNavId_1000000015; 1000000015)
                {
                }
                column(BrandCode_PurchRcptLine; "Purch. Rcpt. Line"."QC Code")//"QC Group Code"
                {
                }
                column(Type_PurchRcptLine; "Purch. Rcpt. Line".Type)
                {
                }
                column(QCGroupCode_PurchRcptLine; '')//"Purch. Rcpt. Line"."Original Qty"
                {
                }
                column(QCStatus_PurchRcptLine; '')//"Purch. Rcpt. Line"."Short Closed"
                {
                }
                column(QCRejected_PurchRcptLine; "Purch. Rcpt. Line"."Rejected Qty")//"QC Rejected Quantity"
                {
                }
                column(QCRejectedQty_PurchRcptLine; "Purch. Rcpt. Line"."Rejected Qty")//"QC Rejected Quantity"
                {
                }
                column(QuantityInvoiced_PurchRcptLine; "Purch. Rcpt. Line"."Quantity Invoiced")
                {
                }
                column(LineDiscount_PurchRcptLine; "Purch. Rcpt. Line"."Line Discount %")
                {
                }
                column(DirectUnitCost_PurchRcptLine; "Purch. Rcpt. Line"."Direct Unit Cost")
                {
                }
                column(UnitofMeasure_PurchRcptLine; "Purch. Rcpt. Line"."Unit of Measure")
                {
                }
                column(UnitofMeasureCode_PurchRcptLine; "Purch. Rcpt. Line"."Unit of Measure Code")
                {
                }
                column(Quantity_PurchRcptLine; "Purch. Rcpt. Line".Quantity)
                {
                }
                column(Description_PurchRcptLine; "Purch. Rcpt. Line".Description)
                {
                }
                column(MRP; '')//"Purch. Rcpt. Line".LRP
                {
                }
                column(EAN_Code; "Barcode No.")
                {
                }
                column(No_PurchRcptLine; "Purch. Rcpt. Line"."No.")
                {
                }
                column(HSNSACCode_PurchRcptLine; "Purch. Rcpt. Line"."HSN/SAC Code")
                {
                }
                column(GST_PurchRcptLine; 0)//"Purch. Rcpt. Line"."GST %"
                {
                }
                column(TotalGSTAmount_PurchRcptLine; 0)//"Purch. Rcpt. Line"."Total GST Amount"
                {
                }
                column(UnitCostLCY_PurchRcptLine; "Purch. Rcpt. Line"."Unit Cost")
                {
                }
                column(GSTGroupCode_PurchRcptLine; "Purch. Rcpt. Line"."GST Group Code")
                {
                }
                column(GSTAmt; GSTAmt)
                {
                }
                column(Line_Discount__; "Line Discount %")
                { }
                column(CGSTAmount; CGSTAmount)
                {
                }
                column(SGSTAmount; SGSTAmount)
                {
                }
                column(IGSTAmount; IGSTAmount)
                {
                }
                column(DiscountCost_g; DiscountCost_g)
                { }
                column(GSTBaseAmount_PurchRcptLine; 0)//"Purch. Rcpt. Line"."GST Base Amount"
                {
                }
                column(Amt; Amt)
                {
                }
                column(ShortQuantity_PurchRcptLine; 0)  //"Purch. Rcpt. Line"."Short Quantity"
                {
                }
                column(TotCGST; TotCGST)
                {
                }
                column(TotSGST; TotSGST)
                {
                }
                column(TotIGST; TotIGST)
                {
                }
                column(TotCESS; TotCESS)
                {
                }
                column(cessPer; cessPer)
                { }
                column(Unitcost; Unitcost)
                {
                }
                column(Directunitcost; Directunitcost)
                {
                }
                column(GLAccount; GLAccount)
                {
                }

                column(GSTTotal; GSTTotal)
                {
                }
                column(SGST; SGST)
                {
                }
                column(IGST; IGST)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    /*
                    RecPurchRcptHeader.GET("Purch. Rcpt. Line"."Document No.");
                    RecDetaGSTEtyBuffer.RESET;
                    CLEAR(GSTAmt);
                    CLEAR(Amt);
                    IF Item <> "Purch. Rcpt. Line"."No." THEN BEGIN
                    RecDetaGSTEtyBuffer.SETRANGE("Document No.",RecPurchRcptHeader."Order No.");
                    RecDetaGSTEtyBuffer.SETRANGE("No.","Purch. Rcpt. Line"."No.");
                    IF RecDetaGSTEtyBuffer.FINDFIRST THEN
                      IF RecDetaGSTEtyBuffer."GST Component Code" = 'CGST' THEN BEGIN
                        GSTAmt := (RecDetaGSTEtyBuffer."GST Base Amount"/RecDetaGSTEtyBuffer.Quantity)* "Purch. Rcpt. Line".Quantity;
                        Amt := RecDetaGSTEtyBuffer."GST Amount" *2 ;
                      END;
                      IF RecDetaGSTEtyBuffer."GST Component Code" = 'IGST' THEN BEGIN
                        GSTAmt := (RecDetaGSTEtyBuffer."GST Base Amount"/RecDetaGSTEtyBuffer.Quantity)* "Purch. Rcpt. Line".Quantity;
                        Amt := RecDetaGSTEtyBuffer."GST Amount" *2;
                      END;
                    
                    END;
                    Item := "Purch. Rcpt. Line"."No." ;
                    MESSAGE((FORMAT(GSTAmt)));
                    */
                    Clear(GLAccount);
                    PurchRcptLine.Reset;
                    PurchRcptLine.SetRange(Type, PurchRcptLine.Type::"G/L Account");
                    PurchRcptLine.SetRange("Document No.", "Document No.");
                    if PurchRcptLine.FindSet then
                        repeat
                            GLAccount := true
                        until PurchRcptLine.Next = 0;
                    if RecPurchRcptHeader.Get("Purch. Rcpt. Line"."Document No.") then;
                    RecDetaGSTEtyBuffer.Reset;
                    //  Clear(GSTAmt);
                    //Clear(TotCESS);
                    // if Item <> "Purch. Rcpt. Line"."No." then begin
                    //     RecDetaGSTEtyBuffer.SetRange("Document No.", RecPurchRcptHeader."Order No.");
                    //     RecDetaGSTEtyBuffer.SetRange("No.", "Purch. Rcpt. Line"."No.");
                    //     if RecDetaGSTEtyBuffer.FindSet then
                    //         repeat
                    //             if RecDetaGSTEtyBuffer."GST Component Code" = 'CGST' then begin
                    //                 GSTAmt := (RecDetaGSTEtyBuffer."GST Base Amount" / RecDetaGSTEtyBuffer.Quantity) * "Purch. Rcpt. Line".Quantity;
                    //                 if "Purch. Rcpt. Line".Quantity <> RecDetaGSTEtyBuffer.Quantity then
                    //                     Amt += ((RecDetaGSTEtyBuffer."GST Amount" / RecDetaGSTEtyBuffer.Quantity) * "Purch. Rcpt. Line".Quantity) * 2
                    //                 else
                    //                     Amt += RecDetaGSTEtyBuffer."GST Amount" * 2;
                    //                 TotCGST := Amt / 2;
                    //                 TotSGST := Amt / 2;
                    //             end;

                    //             if RecDetaGSTEtyBuffer."GST Component Code" = 'CESS' then begin
                    //                 GSTAmt := (RecDetaGSTEtyBuffer."GST Base Amount" / RecDetaGSTEtyBuffer.Quantity) * "Purch. Rcpt. Line".Quantity;
                    //                 if "Purch. Rcpt. Line".Quantity <> RecDetaGSTEtyBuffer.Quantity then
                    //                     Amt += ((RecDetaGSTEtyBuffer."GST Amount" / RecDetaGSTEtyBuffer.Quantity) * "Purch. Rcpt. Line".Quantity)
                    //                 else
                    //                     Amt += RecDetaGSTEtyBuffer."GST Amount";
                    //                 TotCESS := Amt;
                    //             end;

                    //             if RecDetaGSTEtyBuffer."GST Component Code" = 'IGST' then begin
                    //                 GSTAmt := (RecDetaGSTEtyBuffer."GST Base Amount" / RecDetaGSTEtyBuffer.Quantity) * "Purch. Rcpt. Line".Quantity;
                    //                 if "Purch. Rcpt. Line".Quantity <> RecDetaGSTEtyBuffer.Quantity then
                    //                     Amt += (RecDetaGSTEtyBuffer."GST Amount" / RecDetaGSTEtyBuffer.Quantity) * "Purch. Rcpt. Line".Quantity
                    //                 else
                    //                     Amt += RecDetaGSTEtyBuffer."GST Amount";
                    //                 TotIGST := Amt;
                    //             end;
                    //         until RecDetaGSTEtyBuffer.Next = 0;
                    // end;
                    Item := "Purch. Rcpt. Line"."No.";
                    /*//TRI HG 260718 START
                    Barcodes.RESET;
                    Barcodes.SETRANGE("Item No.","Purch. Rcpt. Line"."No.");
                    IF Barcodes.FINDFIRST THEN
                      "Barcode No." := Barcodes."Barcode No.";
                    //TRI HG 260718 END*/
                    //TRI AS 210818 START
                    ItemLedgerEntry.Reset;
                    ItemLedgerEntry.SetRange("Document No.", "Purch. Rcpt. Line"."Document No.");
                    ItemLedgerEntry.SetRange("Item No.", "Purch. Rcpt. Line"."No.");
                    if ItemLedgerEntry.FindFirst then
                        // "Barcode No." := ItemLedgerEntry.ba;
                        //TRI AS 210818 STOP
                        purchaseline.Reset;
                    purchaseline.SetRange("Document No.", "Purch. Rcpt. Line"."Order No.");
                    purchaseline.SetRange("Line No.", "Purch. Rcpt. Line"."Order Line No.");
                    if purchaseline.FindFirst then
                        Unitcost := purchaseline."Direct Unit Cost";

                    PurchRcptLine.Reset;
                    PurchRcptLine.SetRange("Document No.", "Document No.");
                    PurchRcptLine.SetRange("Line No.", "Line No.");
                    if PurchRcptLine.FindFirst then
                        Directunitcost := PurchRcptLine.Quantity * PurchRcptLine."Unit Cost";
                    /////////////////////////// PT Fbts
                    Clear(CGSTAmount);
                    Clear(DiscountAmt_g);
                    Clear(DiscountCost_g);
                    Clear(SGSTAmount);
                    Clear(cessPer);
                    Clear(GSTTotal);
                    Clear(TotCESS);
                    Clear(GSTAmt);
                    Clear(GstRate);
                    Clear(GSTGroup);
                    GSTGroup.Reset();
                    GSTGroup.SetRange(Code, "Purch. Rcpt. Line"."GST Group Code");
                    if GSTGroup.Findset() then begin
                        GstRate := GSTGroup."GST Rate";
                        cessPer := GSTGroup."Cess Tax Rate";
                    end;
                    IF "Purch. Rcpt. Line"."Line Discount %" <> 0 then begin
                        DiscountCost_g += ("Purch. Rcpt. Line".Quantity * "Direct Unit Cost") * "Line Discount %" / 100;
                        //  Message('%1', DiscountCost_g);
                    end;
                    //  Message('%1', DiscountAmt_g);
                    GSTAmt := "Purch. Rcpt. Line".Quantity * "Purch. Rcpt. Line"."Direct Unit Cost" - DiscountCost_g;
                    GSTTotal := GSTAmt * GstRate / 100;
                    TotCESS += GSTAmt * cessPer / 100;
                    if "GST Jurisdiction Type" = "Purch. Rcpt. Line"."GST Jurisdiction Type"::Interstate then begin
                        IGSTAmount := GSTTotal;
                    end else
                        CGSTAmount := GSTTotal / 2;
                    SGSTAmount := GSTTotal / 2;

                end;


                trigger OnPreDataItem()
                begin

                    Clear(Amt);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                //TRI MK
                Clear(LocAdd);
                Clear(LocAdd2);
                Clear(PostCode);
                Clear(LocName);
                Clear(LocCity);
                Clear(LocName2);
                Clear(LocStateCode);
                if RecLocation.Get("Purch. Rcpt. Header"."Location Code") then begin
                    LocAdd := RecLocation.Address;
                    LocAdd2 := RecLocation."Address 2";
                    PostCode := RecLocation."Post Code";
                    LocName := RecLocation.Name;
                    LocCity := RecLocation.City;
                    LocStateCode := RecLocation."State Code";
                    LocName2 := RecLocation."Name 2";
                    LocPhone1 := RecLocation."Phone No.";
                    LocPhone2 := RecLocation."Phone No. 2"
                end;
                // TRI MK

                //TRI HG 260718
                DetailedGSTLedgerEntry.Reset;
                //DetailedGSTLedgerEntry.SETRANGE("Document No.",);
                DimensionValue.Reset;
                DimensionValue.SetRange(Code, "Shortcut Dimension 2 Code");
                if DimensionValue.FindFirst then
                    CostCenter := DimensionValue.Name;

            end;

            trigger OnPreDataItem()
            begin
                // TRI MK
                //RecLocation.RESET;
                //RecLocation.SETRANGE(Code,"Purch. Rcpt. Header"."Location Code");
                //IF RecLocation.FINDFIRST THEN BEGIN

                // TRI MK
            end;
        }
    }

    requestpage
    {

        layout
        {
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
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        CompanyInfo: Record 79;
        GSTAmt: Decimal;
        RecDetaGSTEtyBuffer: Record "Detailed GST Entry Buffer";//16412
        RecPurchRcptHeader: Record 120;
        Item: Code[20];
        Amt: Decimal;
        RecLocation: Record 14;
        LocAdd: Text;
        LocAdd2: Text;
        PostCode: Code[20];
        LocCity: Text;
        LocationCode: Code[20];
        LocStateCode: Code[20];
        LocName: Text;
        LocName2: Text;
        LocPhone1: Text[20];
        LocPhone2: Text[20];
        "Barcode No.": Code[20];
        Barcodes: Record 99001451;
        TotCGST: Decimal;
        TotSGST: Decimal;
        TotIGST: Decimal;
        TotCESS: Decimal;
        cessPer: Decimal;
        TaxTransValue: Record "Tax Transaction Value";//PT
        GSTGroup: Record "GST Group";//PT
        TaxComponentName: Text;//PT
        SGSTAmount: Decimal;//PT
        CGSTAmount: Decimal;//PT

        IGSTAmount: Decimal;//PT
        GSTTotal: Decimal;//PT
        SGST: Decimal;//PT
        IGST: Decimal;//PT
        GstRate: Decimal;//PT
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        purchaseline: Record 39;
        Unitcost: Decimal;
        ItemLedgerEntry: Record 32;
        DimensionValue: Record 349;
        CostCenter: Text;
        Directunitcost: Decimal;
        PurchRcptLine: Record 121;
        DiscountAmt_g: Decimal;//PT
        DiscountCost_g: Decimal;
        GLAccount: Boolean;
    // SGST: Decimal;
    // IGST: Decimal;
    // CGST: Decimal;
}

