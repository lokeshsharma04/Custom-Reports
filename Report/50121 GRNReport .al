report 50121 GRNReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Item Wise GRN Report';
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/GRNReport.rdl';


    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            RequestFilterFields = "Posting Date";
            column(GRN_Date; "Purch. Rcpt. Header"."Posting Date")
            {

            }
            column(compinfopic; compinfo.Picture)
            {

            }
            column(compinfoName; compinfo.Name)
            {

            }
            column(compinfoAddress; compinfo.Address)
            {

            }
            column(compinfoAddress2; compinfo."Address 2")
            {

            }
            column(compinfoPhoneNo; compinfo."Phone No.")
            {

            }
            column(compinfoPhoneNo2; compinfo."Phone No. 2")
            {

            }
            column(compinfoEMail; compinfo."E-Mail")
            {

            }
            column(GRN_NO; "No.")
            {

            }
            column(SUPPLIER_INV_NO; "Purch. Rcpt. Header"."Vendor Shipment No.")
            {

            }
            column(SUP_INV_DATE; "Purch. Rcpt. Header"."Document Date")
            {

            }
            column(PO_NUMBER; "Order No.")
            {

            }
            column(PO_DATE; "Purch. Rcpt. Header"."Order Date")
            {

            }

            column(SUPPLIER_NAME; "Buy-from Vendor Name")
            {

            }
            dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = "Purch. Rcpt. Header";

                column(HSN_CODE; "HSN/SAC Code")
                {

                }
                column(ITEM_CODE; "No.")
                {

                }
                column(ITEM_NAME; Description)
                {

                }
                column(GSTTotal; GSTTotal)
                { }
                column(Unit_of_Measure; "Unit of Measure Code")
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(RATE; "Direct Unit Cost")
                {

                }
                column(GST_TAX; "GST Group Code")
                {

                }
                column(SGSTTAX; SGSTTAX)
                { }
                column(CGSTTAX; CGSTTAX)
                {

                }
                column(IGSTTAX; IGSTTAX)
                {

                }
                column(SGSTTAXAMT; SGSTTAXAMT)
                {

                }
                column(CGSTTAXAMNT; CGSTTAXAMNT)
                {

                }
                column(DiscountAmt_g; DiscountAmt_g)
                { }
                column(IGSTAMNT; IGSTAMNT)
                {

                }
                column(TotCESS; TotCESS)
                {

                }
                column(GSTCESSAMT; GSTCESSAMT)
                {

                }
                column(LineAmount; Quantity * "Direct Unit Cost")
                {

                }
                column(DISCOUNT; "Line Discount %")
                {

                }
                column(DirectUnitCost_PurchRcptLine; "Purch. Rcpt. Line"."Direct Unit Cost")
                {
                }
                column(UnitCostLCY_PurchRcptLine; "Purch. Rcpt. Line"."Unit Cost")
                {
                }
                // column(Quantity_PurchRcptLine; "Purch. Rcpt. Line".Quantity)
                // {
                // }
                column(DISCOUNT_AMNT; "Line Discount %")
                {

                }
                column(DiscountCost_g; DiscountCost_g)
                { }
                column(FRIEGHTAMT; FRIEGHTAMT)
                {

                }
                column(FRIEGHTTAX; FRIEGHTTAX)
                {

                }
                column(FRIEGHTTAXAMT; FRIEGHTTAXAMT)
                {

                }
                column(PACKINGAMNT; PACKINGAMNT)
                {

                }
                column(PACKINGTAX; PACKINGTAX)
                {

                }
                column(PACKINGTAXAMNT; PACKINGTAXAMNT)
                {

                }
                column(TOTALAMT; TOTALAMT)
                {

                }
                column(GstRate; GstRate)
                {

                }

                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    UOM.Reset();
                    UOM.SetRange(Code, "Purch. Rcpt. Line"."Unit of Measure");
                    If UOM.FindFirst() then;

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

            }
            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                compinfo.Get();
                //  compinfo.CalcFields(Picture);
            end;

            trigger OnAfterGetRecord()
            begin
                //         PurchReceiptLine_gVer.Reset();
                //         PurchReceiptLine_gVer.SetRange("Document No.", "Purch. Rcpt. Line"."Document No.");
                //         PurchReceiptLine_gVer.SetRange("GST Jurisdiction Type", "Purch. Rcpt. Line"."GST Jurisdiction Type"::Interstate);
                //         PurchReceiptLine_gVer.SetRange("GST Group Code", "Purch. Rcpt. Line"."GST Group Code");
                //         if PurchReceiptLine_gVer.FindFirst() then begin
                //             repeat
                //             //LineAmt += PurchReceiptLine_gVer.Quantity * PurchReceiptLine_gVer."Direct Unit Cost";
                //             // GstRate +=  * (100 - "Purch. Rcpt. Line"."Line Discount %");
                //             until PurchReceiptLine_gVer.Next() = 0;
                //             // Message('%1.,.%2', LineAmt, GstRate);

                //             //Currency."Amount Rounding Precision"
                //         end;
                //         LineAmt += "Purch. Rcpt. Line".Quantity * "Purch. Rcpt. Line"."Direct Unit Cost";
                //         LineDiscountAmt += Round(Round(LineAmt) *
                //  "Purch. Rcpt. Line"."Line Discount %" / 100);
                // Message('%1', LineDiscountAmt);

            end;
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
                action(search)
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
        myInt: Integer;
        GSTSetup: Record "GST Setup";//PT

        LineDiscountAmt: Decimal;
        SGSTTAX: Decimal;
        CGSTTAX: Decimal;
        IGSTTAX: Decimal;
        UOM: Record "Unit of Measure";
        Currency: Record Currency;
        SGSTTAXAMT: Decimal;
        CGSTTAXAMNT: Decimal;
        IGSTAMNT: Decimal;
        GSTCESS: Decimal;
        LineAmt: Decimal;
        GSTCESSAMT: Decimal;
        FRIEGHTAMT: Decimal;
        FRIEGHTTAXAMT: Decimal;
        FRIEGHTTAX: Decimal;
        PACKINGAMNT: Decimal;
        PACKINGTAX: Decimal;
        PACKINGTAXAMNT: Decimal;
        TOTALAMT: Decimal;
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
        GSTAmt: Decimal;//PT
        GstRate: Decimal;//PT
        DiscountAmt_g: Decimal;//PT
        DiscountCost_g: Decimal;

        PurchReceiptLine_gVer: Record "Purch. Rcpt. Line";

        compinfo: Record "Company Information";

    procedure ValidateLineDiscountPercent(DropInvoiceDiscountAmount: Boolean)
    var
        LineDiscountAmt: Decimal;
        Currency: Record Currency;
    begin
        // TestJobPlanningLine();
        // TestStatusOpen();
        // OnValidateLineDiscountPercentOnAfterTestStatusOpen(Rec, xRec, CurrFieldNo);

        // if DropInvoiceDiscountAmount then begin
        //     "Inv. Discount Amount" := 0;
        //     "Inv. Disc. Amount to Invoice" := 0;
        // end;
        // OnValidateLineDiscountPercentOnBeforeUpdateAmounts(Rec, CurrFieldNo);
        // UpdateAmounts();

        // OnAfterValidateLineDiscountPercent(Rec, CurrFieldNo);
        //  Message('%1', LineDiscountAmt);
    end;

    local procedure NotifyOnMissingSetup(FieldNumber: Integer)
    var
        DiscountNotificationMgt: Codeunit "Discount Notification Mgt.";
    // GetSalesSetup:Record "Sales & Receivables Setup";
    begin
        // if CurrFieldNo = 0 then
        //     exit;
        // GetSalesSetup();
        // DiscountNotificationMgt.RecallNotification(SalesSetup.RecordId);
        // if (FieldNumber = FieldNo("Line Discount Amount")) and ("Line Discount Amount" = 0) then
        //     exit;
        // DiscountNotificationMgt.NotifyAboutMissingSetup(
        //   SalesSetup.RecordId, "Gen. Bus. Posting Group", "Gen. Prod. Posting Group",
        //   SalesSetup."Discount Posting", SalesSetup."Discount Posting"::"Invoice Discounts");
    end;



}