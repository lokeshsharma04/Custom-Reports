report 50140 "Bill wise Pos Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Bill Wise sales Report';
    ExecutionTimeout = '3';
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/Bill Wise Pos Report.rdl';
    dataset
    {
        dataitem("LSC Transaction Header"; "LSC Transaction Header")
        {
            DataItemTableView = where("Transaction Type" = filter(Sales | Voided), "Sales Type" = filter(<> 'ESTIMATE'), "Pos Receipt No." = filter(<> ''));
            RequestFilterFields = Date;
            MaxIteration = 5000000;
            column(Store_No_; "Store No.")//'SHOWROOM|ODRBOOKING|PREPAYMENT|DELIVERY|RESTAURANT'
            {

            }
            column(storename; LSCStore.Name)
            {

            }
            column(Customer_No_; "Customer No.")
            {
            }
            column(Sale_Is_Return_Sale; SalesTypes)
            {

            }
            column(Rounded; Rounded)
            {

            }
            column(Sales_Type; "Sales Type")
            {

            }
            column(LSCIN_Customer_GST_Reg__No_; "LSCIN Customer GST Reg. No.")
            {

            }
            column(Receipt_No_; "Receipt No.")
            { }
            column(Pos_Receipt_No_; "Pos Receipt No.")
            {

            }
            column(Date; FORMAT("LSC Transaction Header".Date, 0, '<Day,2>/<Month,2>/<Year4>'))
            {

            }
            column(Time; "LSC Transaction Header".Time)
            {

            }
            column(Transaction_Type; "Transaction Type")
            {

            }
            column(Gross_Amount; "Gross Amount")
            {

            }
            column(Discount_Amount; "Discount Amount")
            {

            }
            column(store; store)
            {

            }
            column(Net_Amount; -"Net Amount")
            {

            }
            // column(LSCIN_GST_Amount; CGST_LSC + SGST_LSC + IGST_LSC)
            // {

            // }
            column(LSCIN_GST_Amount; "LSCIN GST Amount")
            {

            }
            column(TenderName; TenderName)
            { }
            column(TenderName1; TenderName1)
            { }
            column(TenderName2; TenderName2)
            {
            }
            column(TenderName3; TenderName3)
            { }
            column(TenderAmt; TenderAmt)
            { }
            column(TenderAmt1; TenderAmt1)
            { }
            column(TenderAmt2; TenderAmt2)
            { }
            column(TenderAmt3; TenderAmt3)
            { }
            column(Price; Abs(Price))
            { }
            column(QtySales; ABS(QtySales))
            { }
            column(CustName; CustName)
            { }
            column(Income_Exp__Amount; "Income/Exp. Amount")
            { }

            column(Payment; Payment)
            { }
            column(Ext_OrderId; Ext_OrderId)
            {

            }
            column(Netsales; "LSC Transaction Header".Payment - ("LSC Transaction Header"."Income/Exp. Amount" * -1))
            {

            }
            column(OrderBookingNoi; OrderBookingNoi)
            {

            }

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                Clear(LSCStore);
                LSCStore.Get("Store No.");

                Clear(CustName);
                CustomerRec.Reset();
                CustomerRec.SetRange("No.", "LSC Transaction Header"."Customer No.");
                if CustomerRec.FindFirst() then
                    CustName := CustomerRec.Name;
                Clear(BILLTYPE);//PRATHAM FBTS 
                Clear(SalesTypes);
                lscTransHeader.Reset();
                lscTransHeader.SetRange("Receipt No.", "LSC Transaction Header"."Receipt No.");
                if lscTransHeader.FindFirst() then begin
                    IF lscTransHeader."Sale Is Return Sale" = true then begin
                        BILLTYPE := lscTransHeader."Retrieved from Receipt No.";
                    end;

                    lscTransHeader1.Reset();
                    lscTransHeader1.SetRange("Receipt No.", BILLTYPE);
                    if lscTransHeader1.FindFirst() then begin
                        IF lscTransHeader1."Sale Is Return Sale" = false then begin
                            SalesTypes := lscTransHeader1."Pos Receipt No.";
                        end;
                    end;
                    lscTransHeader1.Reset();
                    Clear(BookingNo);
                    Clear(OrderBookingNoi);
                    lscTransHeader1.SetRange("Receipt No.", "LSC Transaction Header"."Receipt No.");
                    if lscTransHeader1.FindFirst() then begin

                        if lscTransHeader1."Sales Type" = 'PREPAYMENT' then
                            BookingNo := lscTransHeader1."Order Booking OrderID";
                        lscTransHeader1.Reset();
                        lscTransHeader1.SetRange("Receipt No.", BookingNo);
                        if lscTransHeader1.FindFirst() then begin
                            OrderBookingNoi := lscTransHeader1."Pos Receipt No.";
                        end;



                    end;


                END;//END PRATHAM FBTS
                Clear(TenderAmt);
                Clear(TenderAmt1);
                Clear(TenderAmt2);
                Clear(TenderAmt3);
                Clear(TenderName1);
                Clear(TenderName);
                Clear(TenderName2);
                Clear(TenderName3);
                LSCTransPaymentEntry.Reset();
                LSCTransPaymentEntry.SetRange("Receipt No.", "LSC Transaction Header"."Receipt No.");
                LSCTransPaymentEntry.SetRange("Store No.", "LSC Transaction Header"."Store No.");
                LSCTransPaymentEntry.SetRange("Transaction No.", "LSC Transaction Header"."Transaction No.");
                LSCTransPaymentEntry.SetRange("POS Terminal No.", "LSC Transaction Header"."POS Terminal No.");
                If LSCTransPaymentEntry.FindFirst() then begin
                    repeat
                        TenderTypeRec.Reset();
                        TenderTypeRec.SetRange(Code, LSCTransPaymentEntry."Tender Type");
                        if TenderTypeRec.FindFirst() then begin

                            If TenderTypeRec.Code = '1' then begin
                                TenderName := TenderTypeRec.Description;
                                TenderAmt += LSCTransPaymentEntry."Amount Tendered";

                            end;
                            If TenderTypeRec.Code = '21' then begin
                                TenderName1 := TenderTypeRec.Description;
                                TenderAmt1 += LSCTransPaymentEntry."Amount Tendered";
                            end;
                            If TenderTypeRec.Code = '4' then begin
                                TenderName2 := TenderTypeRec.Description;
                                TenderAmt2 += LSCTransPaymentEntry."Amount Tendered";
                            end;
                            If TenderTypeRec.Code = '5' then begin
                                TenderName3 := TenderTypeRec.Description;
                                TenderAmt3 += LSCTransPaymentEntry."Amount Tendered";

                            end;

                        end;
                    until LSCTransPaymentEntry.Next() = 0;
                end;
            end;

            trigger OnPreDataItem()
            begin
                // if store = '' then
                //     CurrReport.Run() else
                if store <> '' then
                    "LSC Transaction Header".SetRange("Store No.", store);
            end;

            // Clear(CGST_LSC);
            // Clear(IGST_LSC);
            // Clear(SGST_LSC);
            // Clear(CessAmt);
            // Clear(GSTAMOUNT);
            // Clear(GstgroupCodeRec);//PT FBTS Start(26/04/23 Start)
            // TransSalesEntry.Reset();
            // TransSalesEntry.SetCurrentKey("Line No.");
            // TransSalesEntry.SetRange("Receipt No.", "LSC Transaction Header"."Receipt No.");
            // if TransSalesEntry.Findset() then begin
            //     repeat
            //         GstgroupRec.Reset();
            //         GstgroupRec.SetRange(Code, TransSalesEntry."LSCIN GST Group Code");
            //         if GstgroupRec.FindFirst() then begin
            //             GstgroupCodeRec := GstgroupRec."GST Rate";
            //             CessAmt := GstgroupRec."Cess Tax Rate";
            //         end;
            //         if TransSalesEntry."LSCIN GST Amount" = 0 then begin

            //             GSTAMOUNT := TransSalesEntry."Net Amount" * GstgroupCodeRec / 100;
            //             CGST_LSC += -GSTAMOUNT / 2;
            //             SGST_LSC += -GSTAMOUNT / 2;
            //         end else
            //             if TransSalesEntry."LSCIN GST Jurisdiction Type" = TransSalesEntry."LSCIN GST Jurisdiction Type"::Interstate then
            //                 IGST_LSC := -"LSCIN GST Amount"
            //             else begin
            //                 CGST_LSC := -"LSCIN GST Amount" / 2;
            //                 SGST_LSC := -"LSCIN GST Amount" / 2;
            //             end;
            //     until TransSalesEntry.Next() = 0;
            //     //Message('%1..%2', CGST_LSC, SGST_LSC);\


            //end;
            ////PT FBTS Start(26/04/23 END)  
            //     Clear(ItemAmt);
            //     Clear(QtySales);
            //     Clear(Price);
            //     TransSalesEntry1.Reset();

            //     TransSalesEntry1.SetRange("Transaction No.", "LSC Transaction Header"."Transaction No.");
            //     TransSalesEntry1.SetRange("Store No.", "LSC Transaction Header"."Store No.");
            //     TransSalesEntry1.SetRange("POS Terminal No.", "LSC Transaction Header"."POS Terminal No.");
            //     if TransSalesEntry1.FindFirst() then begin
            //         repeat
            //             Price := TransSalesEntry1.Price;
            //             QtySales := TransSalesEntry1.Quantity
            //         until TransSalesEntry1.Next() = 0;

            //     end;


            // end;


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
                    field(store; store)
                    {
                        ApplicationArea = All;
                        Caption = 'Store No.';
                        //Editable = false;

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
        myInt: Integer;
        CustomerRec: Record Customer;
        GSTAMOUNT: Decimal;
        CustName: Text[100];
        TransSalesEntry: Record "LSC Trans. Sales Entry";
        TransSalesEntry1: Record "LSC Trans. Sales Entry";
        CessAmt: Decimal;
        Price: Decimal;
        ItemAmt: Decimal;
        QtySales: Decimal;
        LSCStore: Record "LSC Store";
        GstgroupRec: Record "GST Group";
        lscTransHeader: Record "LSC Transaction Header";
        lscTransHeader1: Record "LSC Transaction Header";
        SGST_LSC: Decimal;
        CGST_LSC: Decimal;

        IGST_LSC: Decimal;
        LSCTransPaymentEntry: Record "LSC Trans. Payment Entry";
        TenderTypeRec: Record "LSC Tender Type";
        TenderName: Text[20];
        TenderName1: Text[20];
        TenderName2: Text[20];
        TenderName3: Text[20];
        TenderAmt: Decimal;
        TenderAmt3: Decimal;
        TenderAmt1: Decimal;
        TenderAmt2: Decimal;

        TenderType: Code[20];
        BILLTYPE: Code[20];
        SalesTypes: Code[20];
        GstgroupCodeRec: Decimal;
        RetailUser: Record "LSC Retail User";
        store: Code[30];
        BookingNo: Code[40];
        OrderBookingNoi: Code[40];





    trigger OnInitReport()
    var
        lFilterGroup: Integer;
    begin
        //lFilterGroup := "LSC Transaction Header".FilterGroup;//PT FBTS
        // "LSC Transaction Header".FilterGroup(10);
        // if RetailUser.Get(UserId) then
        //     if RetailUser."Store No." <> '' then
        //         store := RetailUser."Store No.";
        //  Message('%1', store);
        //     "LSC Transaction Header".SetRange("Store No.", RetailUser."Store No.")
        // else
        //     "LSC Transaction Header".SetRange("Store No.");
        // "LSC Transaction Header".FilterGroup(lFilterGroup);

    end;



}