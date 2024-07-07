report 50134 "WillWiseePurchaseReturnRegis"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'Bill Wise  Purchase Return Register';
    RDLCLayout = 'Layout/Invoice Purchase Return Register.rdl';

    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Cr. Memo Hdr.")
        {
            RequestFilterFields = "No.", "Buy-from Vendor No.", "Posting Date";
            column(No_; "No.")
            {

            }
            column(Buy_From_GST_Registration_No; "Vendor GST Reg. No.")
            {
            }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            { }
            column(Vendor_Invoice_No_; "Vendor Cr. Memo No.")
            { }
            column(Order_Date; FORMAT("Purch. Inv. Header"."Document Date", 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }
            dataitem("Purch. Inv. Line"; "Purch. Cr. Memo Line")
            {
                DataItemLinkReference = "Purch. Inv. Header";
                DataItemLink = "Document No." = field("No.");
                // DataItemTableView = sorting("Document No.", "Line No.") order(ascending) where(Type = filter('Item|G/L Account|Fixed Asset'));
                column(Document_No_; "Document No.")
                {

                }
                column(Posting_Date; FORMAT("Purch. Inv. Line"."Posting Date", 0, '<Day,2>/<Month,2>/<Year4>'))
                {

                }
                column(Buy_from_Vendor_No_; "Buy-from Vendor No.")
                {

                }
                column(CGSTAmount; Abs(CGSTAmount))
                { }
                column(SGSTAmount; Abs(SGSTAmount))
                { }
                column(IGSTAmount; Abs(IGSTAmount))
                { }
                column(CesssAmount; Abs(CesssAmount))
                { }
                column(PACKINGAmt; PACKINGAmt)
                { }
                column(FREIGHTAmt; FREIGHTAmt)
                { }
                column(GstRate; Abs(GstRate))
                { }
                column(Lineamt; Lineamt)
                { }
                column(TDSAmt; TDSAmt)
                { }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    Clear(Lineamt);
                    Clear(PACKINGAmt);
                    Clear(FREIGHTAmt);
                    Clear(TDSAmt);
                    if ("Purch. Inv. Line".Type = "Purch. Inv. Line".Type::Item) Or ("Purch. Inv. Line".Type = "Purch. Inv. Line".Type::"Fixed Asset")
                    OR ("Purch. Inv. Line".Type = "Purch. Inv. Line".Type::"G/L Account") then
                        Lineamt := "Purch. Inv. Line"."Line Amount";



                    // if "Purch. Inv. Line".Type = "Purch. Inv. Line".Type::"Charge (Item)" then begin
                    //     if ("Purch. Inv. Line"."No." = 'PACKING CHARGES PM T') or ("Purch. Inv. Line"."No." = 'PACKING CHARGES PM') or ("Purch. Inv. Line"."No." = 'PACKING CHARGES RM') Then
                    //         PACKINGAmt := "Purch. Inv. Line"."Line Amount";
                    //     //   Message('%1', PACKINGAmt);
                    //     if ("Purch. Inv. Line"."No." = 'FREIGHT RM') or ("Purch. Inv. Line"."No." = 'FREIGHT PM') or
                    //      ("Purch. Inv. Line"."No." = 'FREIGHT') or ("Purch. Inv. Line"."No." = 'FREIGHT PM-T') or ("Purch. Inv. Line"."No." = 'FREIGHT RM-T') Then
                    //         FREIGHTAmt := "Purch. Inv. Line"."Line Amount";
                    // Message('%1', FREIGHTAmt);
                    if "Purch. Inv. Line".Type = "Purch. Inv. Line".Type::"Charge (Item)" then begin
                        // if ("Purch. Inv. Line"."No." = 'PACKING CHARGES PM T') or ("Purch. Inv. Line"."No." = 'PACKING CHARGES PM') or ("Purch. Inv. Line"."No." = 'PACKING CHARGES RM') Then
                        //     PACKINGAmt := "Purch. Inv. Line"."Line Amount";
                        //   Message('%1', PACKINGAmt);
                        ItemChargesRec.Reset();
                        ItemChargesRec.SetRange("No.", "Purch. Inv. Line"."No.");
                        if ItemChargesRec.FindFirst() then begin
                            if ItemChargesRec."PACKING CHARGES" = true then begin
                                PACKINGAmt += "Purch. Inv. Line"."Line Amount";
                            end else
                                if ItemChargesRec."FREIGHT CHARGES" = true then
                                    PACKINGAmt += "Purch. Inv. Line"."Line Amount";
                        end
                        // if ("Purch. Inv. Line"."No." = 'FREIGHT RM') or ("Purch. Inv. Line"."No." = 'FREIGHT PM') or
                        //  ("Purch. Inv. Line"."No." = 'FREIGHT') or ("Purch. Inv. Line"."No." = 'FREIGHT PM-T') or ("Purch. Inv. Line"."No." = 'FREIGHT RM-T') OR ("Purch. Inv. Line"."No." = 'FRIGHT INWARD') Then
                        //     FREIGHTAmt := "Purch. Inv. Line"."Line Amount";
                        // // Message('%1', FREIGHTAmt);
                        //   End;
                    End;

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
                    DetailedGST_gVr.RESET;
                    DetailedGST_gVr.SETRANGE("Document No.", "Purch. Inv. Line"."Document No.");
                    DetailedGST_gVr.SetRange("No.", "Purch. Inv. Line"."No.");
                    DetailedGST_gVr.SETRANGE(DetailedGST_gVr."GST Component Code", 'CESS');
                    IF DetailedGST_gVr.FINDSET then begin
                        repeat
                            CessPer := DetailedGST_gVr."GST %";
                            CesssAmount := DetailedGST_gVr."GST Amount";
                        until DetailedGST_gVr.NEXT = 0;
                    end;////..PT
                    //Message('%1', CesssAmount);
                    GstRate := CGSTAmount + SGSTAmount + IGSTAmount + CesssAmount;
                    //  Message('%1', GstRate);
                    ////////////////////////////////////
                    //Message('%1..%2..%3', CGSTAmount, SGSTAmount, IGSTAmount);
                    Clear(TDSAmt);
                    TDSEntryRec.Reset();
                    TDSEntryRec.SetRange("Document No.", "Purch. Inv. Header"."No.");
                    if TDSEntryRec.FindFirst() then begin
                        repeat
                            TDSAmt += TDSEntryRec."TDS Amount";
                        until TDSEntryRec.Next() = 0;
                    end;


                end;
            }



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

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = RDLC;
    //         LayoutFile = 'mylayout.rdl';
    //     }
    // }

    var
        DetailedGST_gVr: Record "Detailed GST Ledger Entry";//PT
        DetailedGST_gVr1: Record "Detailed GST Ledger Entry";
        GSTSetup: Record "GST Setup";//PT
        TaxComponentName: Text;//PT
        PurcInvLine_gVer: Record "Purch. Inv. Line";
        SGSTAmount: Decimal;//PT
        CGSTAmount: Decimal;//PT
        ItemChargesRec: Record "Item Charge";

        IGSTAmount: Decimal;//PT
        CGST: Decimal;//PT
        SGST: Decimal;//PT
        IGST: Decimal;//PT
        CesssAmount: Decimal;
        CessPer: Decimal;
        frieghtAmount: Decimal;
        Lineamt: Decimal;
        PACKINGAmt: Decimal;
        FREIGHTAmt: Decimal;
        GstRate: Decimal;//PT

        TDSEntryRec: Record "TDS Entry";
        TDSAmt: Decimal;
        TotalBill: Decimal;
}