report 50143 "TransferReceipt registerReport"
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Transfer Receipt register Report';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/Transfer Receipt register Report.rdl';

    dataset
    {
        dataitem("Transfer Receipt Header"; "Transfer Receipt Header")
        {
            column(No_; "No.")
            {

            }
            column(LSC_Store_from; "LSC Store-from")
            { }
            column(Transfer_from_Code; "Transfer-from Code")
            { }
            column(Transfer_from_Name; "Transfer-from Name")
            { }
            column(Transfer_to_Code; "Transfer-to Code")
            { }
            column(Transfer_to_Name; "Transfer-to Name")
            { }
            column(Posting_Date; "Posting Date")
            { }
            column(Receipt_Date; "Receipt Date")
            { }

            column(Vendor_Invoice_No_; "Vendor Invoice No.")
            { }

            dataitem("Transfer Receipt Line"; "Transfer Receipt Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = "Transfer Receipt Header";

                column(Document_No_; "Document No.")
                {
                }
                column(Item_No_; "Item No.")
                { }
                column(Description; Description)
                { }
                column(Quantity; Quantity)
                { }
                column(HSN_SAC_Code; "HSN/SAC Code")
                { }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                { }
                column(Transfer_Order_No_; "Transfer Order No.")
                { }
                column(Unit_Price; "Unit Price")
                { }
                column(Amount; Amount)
                { }
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