report 50139 WastageReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'WastageReprort';
    RDLCLayout = 'Layout/WastageReprort.rdl';

    dataset
    {
        dataitem("Wastage Entry"; "Wastage Entry")
        {
            RequestFilterFields = No, "Posting Date";


            column(No; No)
            {
            }
            column(Posting_Date; "Posting Date")
            { }
            column(Document_Date; "Document Date")
            { }
            column(Location_Code; "Location Code")
            { }
            column(Cost_Center; "Cost Center")
            { }
            column(Create_User_Id; "Create User Id")
            { }
            column(Gen__Bus__Posting_Group; "Gen. Bus. Posting Group")
            { }
            column(State; State)
            { }
            dataitem("wastage Entry line"; "wastage Entry line")
            {
                DataItemLink = "Document No." = field(No);
                DataItemLinkReference = "Wastage Entry";
                //  CalcFields = "Current Stock";
                column(Document_No_;
                "Document No.")
                { }
                column(Item_No; " Item No")
                { }
                column(Description; Description)
                { }
                column(UOM; UOM)
                { }
                column(Quantity; Quantity)
                { }
                column(unit_Price; "unit Price")
                { }
                column(Reason_Code; "Reason Code")
                { }
                column(Remarks; Remarks)
                { }
                // column(Current_Stock; "Current Stock")
                // { }
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



    var
        myInt: Integer;
}