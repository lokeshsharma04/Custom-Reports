report 50112 "Daily  Total sales Report"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'Daily  Total sales Report';
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/Daily Total sales Report.rdl';
    dataset
    {

        //  DataItemTableView = SORTING(Number) WHERE(Number = filter(1));
        dataitem("LSC Transaction Header"; "LSC Transaction Header")
        {
            //DataItemTableView = where( = filter(" "));
            RequestFilterFields = Date;

            column(Store_No_; "Store No.")
            {

            }
            column(AmountD; AmountD)
            {

            }
            column(COUNTROWS; COUNTROWS)
            {

            }
            column(Payment_; Payment)
            {

            }
            column(Transaction_No_; "Transaction No.")
            {

            }
            column(Discount_Amount; "Discount Amount")
            {

            }

            column(StoreName; StoreName)
            {

            }
            column(discAmt; discAmt)
            {

            }
            column(Date; Date)
            {

            }
            // column(StDate; StDate)
            // {

            // }
            // column(EdDate; EdDate)
            // {

            // }
            column(DateRange; DateRange)
            {

            }
            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                DateRange := "LSC Transaction Header".GetFilter("LSC Transaction Header".Date);
            end;


            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                Clear(COUNTROWS);
                TransactionHeader.Reset();
                TransactionHeader.SetRange("Receipt No.", "Receipt No.");
                TransactionHeader.SetRange("Transaction Type", "Transaction Type"::Sales);
                TransactionHeader.SetRange("Entry Status", "Entry Status"::Voided);
                if TransactionHeader.FindFirst() then
                    COUNTROWS := TransactionHeader."Transaction No.";
                Clear(discAmt);
                TransactionHeader1.Reset();
                TransactionHeader1.SetRange("Receipt No.", "LSC Transaction Header"."Receipt No.");
                TransactionHeader1.SetRange("Store No.", "Store No.");
                if TransactionHeader1.FindFirst() then begin
                    if TransactionHeader1.Payment = 0 then
                        discAmt := TransactionHeader1."Discount Amount";
                end;
                Clear(AmountD);
                AmountD := 0;
                TransactionHeader.RESET;
                TransactionHeader.SETRANGE("Receipt No.", "LSC Transaction Header"."Refund Receipt No.");
                TransactionHeader.SETRANGE("Store No.", "Store No.");
                IF TransactionHeader.FINDFIRST THEN BEGIN
                    AmountD := TransactionHeader.Payment;


                End;


            end;

        }

    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                group(Filters)
                {
                    // field(StDate; StDate)
                    // {
                    //     Caption = 'Start Date';
                    //     ApplicationArea = all;
                    // }
                    // field(EdDate; EdDate)
                    // {
                    //     Caption = 'End Date';
                    //     ApplicationArea = all;
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
    // trigger OnInitReport()
    // var
    // begin


    //     Message('%1', "LSC Transaction Header".Date);
    //     DateRange := "LSC Transaction Header".GetFilter("LSC Transaction Header".Date);
    //     Message('%1', DateRange);
    // end;

    var

        LSCTenderType: Record "LSC Tender Type";
        TenderTypeDesc: Text;
        TransactionHeader: Record "LSC Transaction Header";
        TransactionHeader1: Record "LSC Transaction Header";
        LSCStoreList: Record "LSC Store";
        LSCTransSalesEntry: Record "LSC Trans. Sales Entry";
        StoreName: Text[100];
        AmountD: Decimal;
        discAmt: Decimal;
        totalDiscount: Decimal;
        COUNTROWS: Integer;
        StDate: Date;
        EdDate: Date;
        DateRange: Text;


}