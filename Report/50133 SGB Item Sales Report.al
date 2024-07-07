report 50133 ItemWiseSalesReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'Item Wise Sales Report';
    RDLCLayout = 'Report/salesReport.rdl';
    //DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem("LSC Trans. Sales Entry"; "LSC Trans. Sales Entry")
        {
            // RequestFilterFields = "Store No.";

            column(Store_No_; "Store No.")
            {

            }
            column(Date; Date)
            {
            }
            column(Receipt_No_; "Receipt No.")
            {
            }
            column(Item_No_; "Item No.")
            {

            }
            column(CustName; CustName)
            { }
            column(GstregistNo; GstregistNo)
            { }
            column(LSCIN_HSN_SAC_Code; "LSCIN HSN/SAC Code")
            {

            }
            column(LSCIN_GST_Group_Code; "LSCIN GST Group Code")
            {

            }
            column(Quantity; -UOMQTY)
            {

            }
            column(Sales_Type; "Sales Type")
            {

            }
            column(Unit_of_Measure; "Unit of Measure")
            {

            }
            column(Price; PRICEUOM)
            {

            }

            column(Discount_Amount; "Discount Amount")
            {

            }
            column(tendortype; Transacton_Hedaer_rec."Tender Type")
            {

            }
            column(posRceeiptNo; TH_rec."Pos Receipt No.")
            {

            }
            column(CGST_LSC; CGST_LSC)
            {

            }
            column(SGST_LSC; SGST_LSC)
            {

            }
            column(IGST_LSC; IGST_LSC)
            {

            }
            column(Net_Amount; -"Net Amount")
            {

            }
            column(ItemNameLSC; item.Description)
            {

            }
            column(GROSSAmt; TH_rec."Gross Amount")
            {

            }
            column(TENDERNAME; TTS.Description)
            {

            }
            column(ComInfo; ComInfo.Name)
            { }
            column(storeName; StoreRec.Name)
            { }
            column(Item_Category_Code; "Item Category Code")
            { }
            column(Division_Code; "Division Code")
            {

            }
            column(Retail_Product_Code; "Retail Product Code")
            {

            }
            column(CGST; CGST)
            {

            }
            column(SGST; SGST)
            {

            }
            column(IGST; IGST)
            {

            }
            column(CESS; CESS)
            {

            }
            column(Return_No_Sale; "Return No Sale")
            {

            }
            column(Sale_Is_Return_Sale; SalesTypes)
            {

            }


            trigger OnPreDataItem()
            var
            begin
                "LSC Trans. Sales Entry".SetRange(Date, StartDate, EndDate);
                if store <> '' then
                    "LSC Trans. Sales Entry".SetRange("Store No.", store);
                ComInfo.get()
            end;

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                If Quantity = 0 then CurrReport.Skip();

                Transacton_Hedaer_rec.Reset();
                Transacton_Hedaer_rec.SetRange("Transaction No.", "LSC Trans. Sales Entry"."Transaction No.");
                Transacton_Hedaer_rec.SetRange("POS Terminal No.", "LSC Trans. Sales Entry"."POS Terminal No.");
                if Transacton_Hedaer_rec.FindFirst() then;
                TTS.Reset();
                TTS.SetRange(Code, Transacton_Hedaer_rec."Tender Type");
                If TTS.FindFirst() then;

                TH_rec.Reset();
                TH_rec.SetRange("Receipt No.", "LSC Trans. Sales Entry"."Receipt No.");
                TH_rec.SetRange("POS Terminal No.", "LSC Trans. Sales Entry"."POS Terminal No.");
                TH_rec.SetRange("Store No.", "LSC Trans. Sales Entry"."Store No.");
                TH_rec.SetRange("Transaction No.", "LSC Trans. Sales Entry"."Transaction No.");
                if TH_rec.FindFirst() then;

                Clear(CGST_LSC);
                Clear(IGST_LSC);
                Clear(SGST_LSC);

                if "LSCIN GST Jurisdiction Type" = "LSCIN GST Jurisdiction Type"::Intrastate then begin
                    CGST_LSC := "LSC Trans. Sales Entry"."LSCIN GST Amount" / 2;
                    SGST_LSC := "LSC Trans. Sales Entry"."LSCIN GST Amount" / 2;
                end else
                    if "LSCIN GST Jurisdiction Type" = "LSCIN GST Jurisdiction Type"::Interstate then
                        IGST_LSC := "LSC Trans. Sales Entry"."LSCIN GST Amount";

                item.Reset();
                item.SetRange("No.", "LSC Trans. Sales Entry"."Item No.");
                if item.FindFirst() then;
                Clear(GstregistNo);
                LscPosTransHeader.Reset();
                LscPosTransHeader.SetRange("Receipt No.", "LSC Trans. Sales Entry"."Receipt No.");
                LscPosTransHeader.SetRange("POS Terminal No.", "LSC Trans. Sales Entry"."POS Terminal No.");
                LscPosTransHeader.SetRange("Store No.", "LSC Trans. Sales Entry"."Store No.");
                LscPosTransHeader.SetRange("Transaction No.", "LSC Trans. Sales Entry"."Transaction No.");
                if LscPosTransHeader.FindFirst() then begin

                    Cust.Reset();
                    Cust.SetRange("No.", LscPosTransHeader."Customer No.");
                    if Cust.FindFirst() then begin
                        //If CustName = '' then begin
                        CustName := Cust.Name;
                        GstregistNo := cust."GST Registration No.";
                    end else
                        CustName := 'Pos Customer';
                end;
                Clear(UOMQTY);
                Clear(PRICEUOM);
                lscTransSalsentryRec.Reset();
                lscTransSalsentryRec.SetRange("Receipt No.", "LSC Trans. Sales Entry"."Receipt No.");
                lscTransSalsentryRec.SetRange("Transaction No.", "LSC Trans. Sales Entry"."Transaction No.");
                lscTransSalsentryRec.SetRange("Item No.", "LSC Trans. Sales Entry"."Item No.");
                lscTransSalsentryRec.SetRange("Line No.", "LSC Trans. Sales Entry"."Line No.");
                lscTransSalsentryRec.SetRange("Store No.", "LSC Trans. Sales Entry"."Store No.");
                if lscTransSalsentryRec.FindFirst() then begin
                    if (lscTransSalsentryRec."UOM Price" <> 0) and (lscTransSalsentryRec."UOM Quantity" <> 0) then begin
                        UOMQTY := lscTransSalsentryRec."UOM Quantity";
                        PRICEUOM := lscTransSalsentryRec."UOM Price";
                    end else
                        if (lscTransSalsentryRec."UOM Price" = 0) and (lscTransSalsentryRec."UOM Quantity" = 0) then begin
                            UOMQTY := lscTransSalsentryRec.Quantity;
                            PRICEUOM := lscTransSalsentryRec.Price;

                        end;
                end;


                Clear(SGST);
                Clear(IGST);
                Clear(CESS);
                Clear(CGST);
                LSCINTaxTransactionValueV2Rec.Reset();
                LSCINTaxTransactionValueV2Rec.SetRange("Receipt No.", "LSC Trans. Sales Entry"."Receipt No.");
                LSCINTaxTransactionValueV2Rec.SetRange("Store No.", "LSC Trans. Sales Entry"."Store No.");
                LSCINTaxTransactionValueV2Rec.SetRange("Transaction No.", "LSC Trans. Sales Entry"."Transaction No.");
                LSCINTaxTransactionValueV2Rec.SetRange("POS Terminal No.", "LSC Trans. Sales Entry"."POS Terminal No.");
                LSCINTaxTransactionValueV2Rec.SetRange("Receipt Line No.", "Line No.");
                LSCINTaxTransactionValueV2Rec.SetRange("Item No.", "LSC Trans. Sales Entry"."Item No.");
                if LSCINTaxTransactionValueV2Rec.FindFirst() then begin
                    repeat

                        IF LSCINTaxTransactionValueV2Rec."Tax Component ID" = 6 then begin
                            if "Return No Sale" = true then
                                SGST -= LSCINTaxTransactionValueV2Rec."GST Amount"
                            else
                                if "Return No Sale" = false then
                                    SGST += LSCINTaxTransactionValueV2Rec."GST Amount"

                        end;

                        IF LSCINTaxTransactionValueV2Rec."Tax Component ID" = 2 then begin
                            if "Return No Sale" = true then
                                CGST -= LSCINTaxTransactionValueV2Rec."GST Amount"

                            else
                                if "Return No Sale" = false then
                                    CGST += LSCINTaxTransactionValueV2Rec."GST Amount";
                        end;



                        IF LSCINTaxTransactionValueV2Rec."Tax Component ID" = 3 then begin
                            if "Return No Sale" = true then
                                IGST -= LSCINTaxTransactionValueV2Rec."GST Amount"
                            else
                                if "Return No Sale" = false then
                                    IGST += LSCINTaxTransactionValueV2Rec."GST Amount"

                        end;

                        IF LSCINTaxTransactionValueV2Rec."Tax Component ID" = 10000 then begin
                            if "Return No Sale" = true then
                                CESS -= LSCINTaxTransactionValueV2Rec."GST Amount"
                            else
                                if "Return No Sale" = false then
                                    CESS += LSCINTaxTransactionValueV2Rec."GST Amount";

                        end;

                    UNTIL LSCINTaxTransactionValueV2Rec.Next() = 0;

                    // Clear(BILLTYPE);//PRATHAM FBTS 
                    // Clear(SalesTypes);
                    // lscTransHeader.Reset();
                    // lscTransHeader.SetRange("Receipt No.", "LSC Trans. Sales Entry"."Receipt No.");
                    // if lscTransHeader.FindFirst() then begin
                    //     IF lscTransHeader."Return No Sale" = true then begin
                    //         BILLTYPE := lscTransHeader.;
                    //     end;
                    //     lscTransHeader1.Reset();
                    //     lscTransHeader1.SetRange("Receipt No.", BILLTYPE);
                    //     if lscTransHeader1.FindFirst() then begin
                    //         IF lscTransHeader1."Return No Sale" = false then begin
                    //             SalesTypes := lscTransHeader1."Pos Receipt No.";
                    //         end;
                    //     end;


                    // END;




                end;
                Clear(StoreRec);
                StoreRec.Get("Store No.");

                lscTransHeader.Reset();
                Clear(SalesTypes);
                Clear(BILLTYPE);

                lscTransHeader.SetRange("Receipt No.", "Receipt No.");
                lscTransHeader.SetRange("Transaction No.", "Transaction No.");
                if lscTransHeader.FindFirst() then begin
                    //  Message('%1..', lscTransHeader."Receipt No.");
                    if "LSC Trans. Sales Entry"."Return No Sale" = true then
                        BILLTYPE := lscTransHeader."Retrieved from Receipt No.";
                    //  Message(BILLTYPE);
                end;

                lscTransHeader1.Reset();
                lscTransHeader1.SetRange("Receipt No.", BILLTYPE);
                if lscTransHeader1.FindFirst() then begin
                    if "LSC Trans. Sales Entry"."Return No Sale" = true then
                        SalesTypes := lscTransHeader1."Pos Receipt No.";

                end;

            end;


            //  end;
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
                    field(StartDate; StartDate)
                    {
                        ApplicationArea = All;

                    }
                    field(EndDate; EndDate)
                    {
                        ApplicationArea = all;
                    }
                    field(StoreNo; store)
                    {
                        ApplicationArea = all;
                        //Editable = false;
                        Caption = 'Store No';
                        TableRelation = "LSC Store";

                    }
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



    var
        DetailedLedgerEntry: Record "Detailed GST Ledger Entry";
        Transacton_Hedaer_rec: Record "LSC Trans. Payment Entry";
        TH_rec: Record "LSC Transaction Header";
        IGST_LSC: Decimal;
        lscTransSalsentryRec: Record "LSC Trans. Sales Entry";
        UOMQTY: Decimal;
        PRICEUOM: Decimal;
        CGST_LSC: Decimal;
        SGST_LSC: Decimal;
        CGSTAmtTol: Decimal;
        SGSTAmtTol: Decimal;
        IGSTAmtTol: Decimal;
        Cust: Record Customer;
        SGST: Decimal;
        CustName: Text[100];
        GstregistNo: Code[20];
        LscPosTransHeader: Record "LSC Transaction Header";
        ComInfo: Record "Company Information";
        item: Record Item;
        LocationRec: Record Location;

        TTS: Record "LSC Tender Type Setup";
        TENDERNAME: TEXT;
        StoreRec: Record "LSC Store";
        lscTransHeader: Record 99001472;
        lscTransHeader1: Record "LSC Transaction Header";
        LscstoreName: Text[50];
        StoreNo: Code[20];
        GstgroupCodeRec: Decimal;
        GSTAMOUNT: Decimal;
        GstgroupRec: Record "GST Group";

        StartDate: Date;
        EndDate: Date;
        //dhd: Record "LSCIN Tax Transaction Value"  RetailUser: Record "LSC Retail User";
        store: Code[30];

        RetailUser: Record "LSC Retail User";
        LSCINTaxTransactionValueV2Rec: Record "LSCIN Posted Comp POSTrLine V2";
        BILLTYPE: Code[20];
        SalesTypes: Code[20];
        CGST: Decimal;
        IGST: Decimal;
        CESS: Decimal;
        TransalesheaderRec: Record "LSC Transaction Header";



}




