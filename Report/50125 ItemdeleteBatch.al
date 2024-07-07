report 50125 ItemDeleteBatch
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    Permissions =
    tabledata "Sales Cr.Memo Header" = RIMD;
    dataset
    {
        // dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        // {
        //     RequestFilterFields = "No.";
        //     trigger OnAfterGetRecord()
        //     var
        //         myInt: Integer;
        //     begin
        //         "Sales Cr.Memo Header"."Bill-to Customer No." := BilltoCustomeNo;
        //         "Sales Cr.Memo Header".Modify();
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
                    field(BilltoCustomeNo; BilltoCustomeNo)
                    {
                        ApplicationArea = all;
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
        EntryNo: integer;
        CostAmountActual: Decimal;
        BilltoCustomeNo: Text;
        No: Code[20];
}