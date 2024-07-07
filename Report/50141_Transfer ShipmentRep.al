report 50141 "Ternsfer Shipment Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'Branch Transfer Details';
    RDLCLayout = 'Report/Ternsfer Shipment Report.rdl';


    dataset
    {
        dataitem("Transfer Shipment Header"; "Transfer Shipment Header")
        {
            RequestFilterFields = "Posting Date", "Transfer-from Code", "Transfer-to Code";

            column(No_; "No.")
            {

            }
            column(Transfer_from_Code; "Transfer-from Code") { }
            column(Transfer_to_Code; "Transfer-to Code") { }
            column(Transfer_from_Name; "Transfer-from Name")
            { }
            column(Transfer_to_Name; "Transfer-to Name")
            { }
            column(Text_; Text_)
            { }
            column(Transfer_from_Address; "Transfer-from Address") { }
            column(Posting_Date; FORMAT("Transfer Shipment Header"."Posting Date", 0, '<Day,2>/<Month,2>/<Year4>'))
            { }
            dataitem("Transfer Shipment Line"; "Transfer Shipment Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = "Transfer Shipment Header";
                column(Item_No_; "Item No.")
                { }
                column(Description; Description) { }
                column(Unit_of_Measure; "Unit of Measure Code")
                { }
                column(Quantity; Quantity) { }
                column(Amount; Amount)
                { }
                column(RecevidQty; ReceivedQty)
                { }
                column(HSN_SAC_Code; "HSN/SAC Code")
                { }
                column(Unit_Price; "Unit Price")
                { }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    Clear(ReceivedQty);
                    ItemLedEntry.Reset();//Pratham FBTS
                    ItemLedEntry.SetRange("Document No.", "Transfer Shipment Line"."Document No.");
                    ItemLedEntry.SetRange("Document Line No.", "Transfer Shipment Line"."Line No.");
                    ItemLedEntry.SetRange("Location Code", 'IN-TRANSIT');
                    if ItemLedEntry.FindFirst() then
                        ReceivedQty := ItemLedEntry."Remaining Quantity";
                    ///////////



                end;


            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                Clear(Text_);
                TransferHeader.Reset();
                TransferHeader.SetRange("No.", "Transfer Shipment Header"."Transfer Order No.");
                if TransferHeader.FindFirst() then begin
                    Text_ := 'Not Received'
                end else
                    Text_ := ' Completely Received';

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
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }



    var
        ItemLedEntry: Record "Item Ledger Entry";
        ReceivedQty: Decimal;
        TransferHeader: Record "Transfer Header";
        Text_: Text;
}