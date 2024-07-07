report 50111 "Daily sales Report"
{
    UsageCategory = Administration;
    ApplicationArea = All;

    Caption = 'Daily sales Report';
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/Sales Type Pre.rdl';
    dataset
    {
        dataitem("LSC Trans. Payment Entry"; "LSC Trans. Payment Entry")
        {
            // DataItemLinkReference = "LSC Transaction Header";
            // DataItemLink = "Receipt No." = field("Receipt No.");
            RequestFilterFields = Date;

            column(Amount_Tendered; "Amount Tendered")
            {

            }
            column(Store_No_; "Store No.")
            {

            }
            column(AmountD; AmountD)
            {

            }
            column(TenderTypeDesc; TenderTypeDesc)
            {

            }
            column(StoreName; StoreName)
            {

            }
            column(DateRange1; DateRange1)
            {

            }
            column(NetAmount; NetAmount)
            { }
            column(StoreNo; StoreNo)
            { }
            // dataitem("LSC Trans. Inc./Exp. Entry"; "LSC Trans. Inc./Exp. Entry")
            // {
            //     DataItemLink = "POS Terminal No." = field("POS Terminal No.");
            //     DataItemTableView = sorting("POS Terminal No.", "Receipt  No.") where("Account Type" = filter(Expense));
            //     column(Net_Amount; "Net Amount")
            //     {

            //     }

            // }

            trigger OnPreDataItem()
            var
                usersetup: Record "User Setup";
                userName: Text[50];
                DSR: Report "Daily sales Report";
            begin
                DateRange1 := "LSC Trans. Payment Entry".GetFilter("LSC Trans. Payment Entry".Date);
                Clear(usersetup);
                IF usersetup.Get(UserId) then
                    if not usersetup.DSR then
                        Error('You do not have Permission this Report Please Contect Administrator');
            end;

            // end;

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                LSCTenderType.Reset();
                LSCTenderType.SetRange(Code, "LSC Trans. Payment Entry"."Tender Type");
                // LSCTenderType.SetFilter(Description, '<>%1', 'Tender Remove/Float');
                if LSCTenderType.FindFirst() then;
                TenderTypeDesc := LSCTenderType.Description;
                LSCStoreList.Reset();
                LSCStoreList.SetRange("No.", "Store No.");
                if LSCStoreList.FindFirst() then
                    StoreName := LSCStoreList.Name;
                //  Message('%1', "LSC Trans. Payment Entry"."Amount Tendered");
                Clear(NetAmount);
                LSCTransIncomeExp.Reset();
                LSCTransIncomeExp.SetRange("Receipt  No.", "LSC Trans. Payment Entry"."Receipt No.");
                LSCTransIncomeExp.SetRange("Account Type", LSCTransIncomeExp."Account Type"::Expense);
                If LSCTransIncomeExp.FindFirst() then begin
                    repeat
                        NetAmount += LSCTransIncomeExp."Net Amount";
                        StoreNo := LSCTransIncomeExp."Store No.";
                    until LSCTransIncomeExp.Next() = 0;
                    // Message('%1', NetAmount);
                end;



            end;
        }
        //     trigger OnAfterGetRecord()
        //     var
        //         myInt: Integer;
        //     begin


        //         Clear(AmountD);
        //         AmountD := 0;
        //         LSCTransSalesEntry.Reset();
        //         TransactionHeader.RESET;
        //         TransactionHeader.SETRANGE("Receipt No.", "LSC Transaction Header"."Refund Receipt No.");
        //         IF "Store No." <> '' THEN
        //             TransactionHeader.SETRANGE("Store No.", "Store No.");
        //         IF TransactionHeader.FINDFIRST THEN BEGIN
        //             AmountD := TransactionHeader.Payment;
        //         End;


        //     end;
        // }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    // field(Date_; Date_)
                    // {
                    //     ApplicationArea = all;
                    //     trigger OnValidate()
                    //     var
                    //         myInt: Integer;
                    //     begin
                    //         // Clear(Date_);
                    //         // "LSC Trans. Payment Entry".Reset();
                    //         // "LSC Trans. Payment Entry".SetRange(Date, "LSC Trans. Payment Entry".Date);
                    //         // if "LSC Trans. Payment Entry".FindFirst() then
                    //         //     Date_ := "LSC Trans. Payment Entry".Date;
                    //     end;
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

    procedure SetSendByEmail()
    begin
        SendByEmail_gBln := true;
    end;

    procedure GetExportExcelFileToBlob(var TempBlob: Codeunit "Temp Blob")
    var
        OutStr: OutStream;
    begin
        TempBlob.CreateOutStream(OutStr);
    end;

    var

        LSCTenderType: Record "LSC Tender Type";
        TenderTypeDesc: Text;
        TransactionHeader: Record "LSC Transaction Header";
        LSCStoreList: Record "LSC Store";
        LSCTransSalesEntry: Record "LSC Trans. Sales Entry";
        StoreName: Text[100];
        AmountD: Decimal;
        StoreNo: Code[20];
        Date_: Date;
        LSCTransIncomeExp: Record "LSC Trans. Inc./Exp. Entry";
        NetAmount: Decimal;
        NoofRow: Integer;
        DateRange1: Text;
        SendByEmail_gBln: Boolean;

}