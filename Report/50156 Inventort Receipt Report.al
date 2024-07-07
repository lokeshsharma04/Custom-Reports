Report 50158 "Inventory Receipt report"
{
    DefaultLayout = RDLC;
    UsageCategory = Administration;
    ApplicationArea = all;

    RDLCLayout = 'Layout/InventoryReceiptreport.rdl';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Invt. Document Header"; "Invt. Receipt Header")
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
            column(Location_Code; "Location Code")
            {

            }
            column(Document_Date; "Document Date")
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




            column(companyPic; CompanyInfo.Picture)
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
            column(No_; "No.")
            {

            }
            column(Party_Code; "Party Code")
            {

            }
            column(Party_Name; "Party Name")
            {

            }
            column(VendorAdrecc; VendorAdrecc)
            {

            }
            column(VendorGSTnO; VendorGSTnO)
            {

            }
            column(VendorCity; VendorCity)
            {

            }
            dataitem("Invt. Document Line"; "Invt. Receipt Line")
            {
                DataItemLink = "Document No." = field("No.");
                //DataItemTableView = where(Quantity = filter(> 0));//,"Undo Receipt"=filter(<>Yes));
                column(Item_No_; "Item No.")
                {

                }
                column(Description; Description)
                {

                }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                {

                }

                column(Quantity; Quantity)
                {


                }
                column(Unit_Amount; "Unit Amount")
                {

                }
                column(Amount; Amount)
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
                    // Clear(GLAccount);
                    // PurchRcptLine.Reset;
                    // PurchRcptLine.SetRange(Type, PurchRcptLine.Type::"G/L Account");
                    // PurchRcptLine.SetRange("Document No.", "Document No.");
                    // if PurchRcptLine.FindSet then
                    //     repeat
                    //         GLAccount := true
                    //     until PurchRcptLine.Next = 0;
                    // if RecPurchRcptHeader.Get("Purch. Rcpt. Line"."Document No.") then;
                    // RecDetaGSTEtyBuffer.Reset;
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

                    /*//TRI HG 260718 START
                    Barcodes.RESET;
                    Barcodes.SETRANGE("Item No.","Purch. Rcpt. Line"."No.");
                    IF Barcodes.FINDFIRST THEN
                      "Barcode No." := Barcodes."Barcode No.";
                    //TRI HG 260718 END*/
                    //TRI AS 210818 START

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
                if RecLocation.Get("Invt. Document Header"."Location Code") then begin
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
                VendorRec.Reset();
                Clear(VendorCity);
                Clear(VendorAdrecc);
                Clear(VendorGSTnO);
                if VendorRec.get("Invt. Document Header"."Party Code") then begin
                    VendorAdrecc := VendorRec.Address + ',' + VendorRec."Address 2";
                    VendorCity := VendorRec.City + '-' + VendorRec."Post Code";
                    VendorGSTnO := VendorRec."GST Registration No.";

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
        VendorRec: Record Vendor;
        VendorAdrecc: text[100];
        VendorCity: Text[20];
        VendorGSTnO: Code[30];


    // SGST: Decimal;
    // IGST: Decimal;
    // CGST: Decimal;
}

