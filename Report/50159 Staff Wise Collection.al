report 50159 "Staff Wise Collection Report"
{
    DefaultLayout = RDLC;
    UsageCategory = Administration;
    ApplicationArea = all;

    RDLCLayout = 'Report/Staff Wise Report.rdl';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("LSC Trans. Payment Entry"; "LSC Trans. Payment Entry")
        {
            RequestFilterFields = "Store No.", Date;
            column(Card_No_; "Card No.")
            {
            }
            column(tenderName; tenderName)
            { }
            column(storename; storename)
            { }
            column(Tender_Type; "Tender Type")
            { }
            column(TenderAmount_1; TenderAmount_1)
            { }

            column(Staff_ID; "Staff ID")
            { }
            column(Amount_Tendered; "Amount Tendered")
            {
            }
            column(Date; Date)
            { }
            column(AmountTenderDeclar; AmountTenderDeclar)
            { }
            column(startDate; start)
            {

            }
            column(EndDate; EndDate)
            {

            }
            // dataitem("LSC Trans. Tender Declar. Entr"; "LSC Trans. Tender Declar. Entr")
            // {
            //     DataItemLink = "Staff ID" = field("Staff ID");

            //     column(AmountTendered; "Amount Tendered")
            //     { }
            //     trigger OnAfterGetRecord()
            //     var
            //         myInt: Integer;
            //     begin

            //     end;

            // }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                Clear(tenderName);
                LSCStore.Reset();
                LSCStore.SetRange("No.", "LSC Trans. Payment Entry"."Store No.");
                if LSCStore.FindFirst() then
                    storename := LSCStore.Name;
                TenderTypeRec.Reset();
                TenderTypeRec.SetRange(Code, "LSC Trans. Payment Entry"."Tender Type");
                if TenderTypeRec.FindFirst() then
                    tenderName := TenderTypeRec.Description;
                ////////////////////////////////////////////
                Clear(TenderAmount_1);
                if "LSC Trans. Payment Entry"."Tender Type" = '1' then
                    TenderAmount_1 := "LSC Trans. Payment Entry"."Amount Tendered";
                Clear(AmountTenderDeclar);
                LSCTenderDeclarRec.Reset();
                LSCTenderDeclarRec.SetRange("Store No.", "LSC Trans. Payment Entry"."Store No.");
                LSCTenderDeclarRec.SetRange("Staff ID", "LSC Trans. Payment Entry"."Staff ID");
                LSCTenderDeclarRec.SetRange(Date, "LSC Trans. Payment Entry".Date);
                // LSCTenderDeclarRec.SetRange("POS Terminal No.", "LSC Trans. Payment Entry"."POS Terminal No.");
                if LSCTenderDeclarRec.FindFirst() then
                    repeat
                        AmountTenderDeclar += LSCTenderDeclarRec."Amount Tendered";
                    until LSCTenderDeclarRec.Next() = 0;

            end;

            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                "LSC Trans. Payment Entry".SetRange(Date, start, EndDate);
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
                    field(start; start)
                    {
                        ApplicationArea = All;
                        Caption = 'Start Date';
                    }
                    field(EndDate; EndDate)
                    {
                        ApplicationArea = All;
                        Caption = 'End date';

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
        LSCStore: Record "LSC Store";
        storename: Text[50];
        TenderTypeRec: Record "LSC Tender Type";
        LSCTenderDeclarRec: Record "LSC Trans. Tender Declar. Entr";
        AmountTenderDeclar: Decimal;
        tenderName: Text[50];
        TenderAmount_1: Decimal;
        start: Date;
        EndDate: date;
}