//Ashish_fbts
report 60140 SalesOrderCreate
{
    //UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Sales Invoice Process"; "Sales Invoice Process")
        {

            trigger OnAfterGetRecord()
            begin
                Clear(SalesRecSetup);
                SalesRecSetup.Get();
                Clear(LineNo);

                SalesHeader_lRec.Init();
                SalesHeader_lRec."Document Type" := SalesHeader_lRec."Document Type"::Order;
                sonum := NoSeriesManagement.GetNextNo(SalesRecSetup."Order Nos.", Today, True);
                SalesHeader_lRec."No." := sonum;
                SalesHeader_lRec.Insert(true);
                SalesHeader_lRec.Validate(SalesHeader_lRec."Sell-to Customer No.", "Sales Invoice Process"."Request To");
                SalesHeader_lRec.Validate(SalesHeader_lRec."Bill-to Customer No.", "Sales Invoice Process"."Request To");
                SalesHeader_lRec.Validate("LSC Store No.", "Sales Invoice Process"."Request from");
                SalesHeader_lRec.Validate("Location Code", "Sales Invoice Process"."Request from");
                SalesHeader_lRec.Validate("Posting Date", "Sales Invoice Process"."Request Date");
                SalesHeader_lRec.Validate("Stock Req. No.", "Sales Invoice Process"."Stock Req. No.");
                SalesHeader_lRec.Modify(true);

                SalesInvoiceProcessLine.Reset();
                SalesInvoiceProcessLine.SetRange("Stock Req. No.", "Sales Invoice Process"."Stock Req. No.");
                IF SalesInvoiceProcessLine.FindSet() then
                    repeat
                        SalesLine_lRec.Init();
                        SalesLine_lRec."Document Type" := SalesHeader_lRec."Document Type"::Order;
                        SalesLine_lRec."Document No." := sonum;
                        SalesLine_lRec."Line No." := SalesInvoiceProcessLine."Line No.";
                        SalesLine_lRec.Insert(true);
                        SalesLine_lRec.Validate(Type, SalesLine_lRec.Type::Item);
                        SalesLine_lRec.Validate("No.", SalesInvoiceProcessLine."Item No.");
                        SalesLine_lRec.Validate("Bill-to Customer No.", SalesHeader_lRec."Bill-to Customer No.");
                        SalesLine_lRec.Validate("Sell-to Customer No.", SalesHeader_lRec."Sell-to Customer No.");
                        SalesLine_lRec.Validate(Quantity, SalesInvoiceProcessLine.Quantity);
                        SalesLine_lRec.Validate("Location Code", SalesHeader_lRec."Location Code");
                        SalesLine_lRec.Validate("Request No.", SalesInvoiceProcessLine."Stock Req. No.");
                        Hsn_lCod := '';
                        Description := '';
                        IF Item_lRec.Get(SalesLine_lRec."No.") then
                            Hsn_lCod := Item_lRec."HSN/SAC Code";
                        Description := Item_lRec.Description;
                        SalesLine_lRec.validate("HSN/SAC Code", Hsn_lCod);
                        SalesLine_lRec.validate(Description, Description);

                        SalesLine_lRec.Modify(true);
                    until SalesInvoiceProcessLine.Next() = 0;
                "Sales Invoice Process"."Sales Order No." := sonum;
                "Sales Invoice Process"."Sales Order Created" := true;
                "Sales Invoice Process".Modify()
            end;


            trigger OnPostDataItem()
            begin
                Message('Sales Order Created Succeffuly.');
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

        Description: Text[150];
        SalesHeader_lRec: Record "Sales Header";
        NoSeriesManagement: codeunit NoSeriesManagement;
        SalesRecSetup: record "Sales & Receivables Setup";
        SalesLine_lRec: Record "Sales Line";
        SalesLine1_lRec: Record "Sales Line";
        LineNo: Integer;
        SalesInvoiceProcess: Record "Sales Invoice Process";
        SalesInvoiceProcessLine: Record "Sales Invoice Process Line";
        LocationCode, CheckPoNo, sonum : code[20];
        LineAmt_lDec: Decimal;
        LDPer: Decimal;
        Hsn_lCod: Code[20];
        Item_lRec: Record Item;
        CalculateTax: Codeunit "Calculate Tax";
        Customer_lRec: Record Customer;
}