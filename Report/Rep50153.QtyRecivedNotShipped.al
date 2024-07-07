Report 50153 "Qty shipped Not Invoiced"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Qty shipped Not Invoiced';
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/Qty Recvd Not Invoiced Custom.rdl';
    dataset
    {
        dataitem("Purch. Rcpt. Line"; "Return Shipment Line")
        {
            RequestFilterFields = "Quantity Invoiced";
            DataItemTableView = sorting("Document No.", "Line No.") order(ascending) where("Return Qty. Shipped Not Invd." = filter(<> 0));
            column(PostingDate_PurchRcptLine; "Purch. Rcpt. Line"."Posting Date")
            {
            }
            column(No_PurchRcptLine; "Purch. Rcpt. Line"."No.")
            {
            }
            column(Qty__Rcd__Not_Invoiced; "Return Qty. Shipped Not Invd.")
            { }
            column(Quantity; Quantity)
            { }
            column(Quantity_Invoiced; "Quantity Invoiced")
            { }
            column(Direct_Unit_Cost; "Direct Unit Cost")
            {

            }
            column(DocumentNo_PurchRcptLine; "Purch. Rcpt. Line"."Document No.")
            {
            }
            column(QtyRcdNotInvoiced_PurchRcptLine; "Purch. Rcpt. Line"."Return Qty. Shipped Not Invd.")
            {
            }
            column(Description_PurchRcptLine; "Purch. Rcpt. Line".Description)
            {
            }
            column(BuyfromVendorNo_PurchRcptLine; "Purch. Rcpt. Line"."Buy-from Vendor No.")
            {
            }
            column(BuyfromVendorName; PurchRcptHeader."Buy-from Vendor Name")
            {
            }
            column(BuyfromVendorship; PurchRcptHeader."Return Order No.")
            {

            }
            column(BuyfromVendordate; PurchRcptHeader."Document Date")
            {

            }
            column(LocationCode_PurchRcptLine; "Purch. Rcpt. Line"."Location Code")
            {
            }
            column(Posting_Date; "Posting Date")
            {
            }
            trigger OnAfterGetRecord()
            begin
                if PurchRcptHeader.Get("Purch. Rcpt. Line"."Document No.") then;
            end;

            trigger OnPreDataItem()
            begin
                "Purch. Rcpt. Line".SetRange("Quantity Invoiced", 0);
                "Purch. Rcpt. Line".SetRange(Type, "Purch. Rcpt. Line".Type::Item);
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        PurchRcptHeader: Record "Return Shipment Header";
}

