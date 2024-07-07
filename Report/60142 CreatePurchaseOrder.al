//Ashish_fbts
report 60142 CreatePurchaseOrder

{
    // UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    //DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem("Stock Transfer Temp Table"; "Stock Transfer Temp Table")
        {
            trigger OnAfterGetRecord()
            begin
                Clear(PurchPaSetup);
                PurchPaSetup.Get();
                Clear(LineNo);

                PurchaseHeaderRec.Reset();
                PurchaseHeaderRec.SetRange("Posting Date", Today);
                PurchaseHeaderRec.SetRange("Sales Order No.", "Stock Transfer Temp Table"."Sales Order No.");
                if not PurchaseHeaderRec.FindFirst() then begin

                    PurchaseHeaderRec.Init();
                    PurchaseHeaderRec."Document Type" := PurchaseHeaderRec."Document Type"::Order;
                    sonum := NoSeriesManagement.GetNextNo(PurchPaSetup."Order Nos.", Today, True);
                    PurchaseHeaderRec."No." := sonum;
                    PurchaseHeaderRec.Insert(true);
                    PurchaseHeaderRec.Validate(PurchaseHeaderRec."Sell-to Customer No.", "Stock Transfer Temp Table".Customer);
                    PurchaseHeaderRec.Validate(PurchaseHeaderRec."Buy-from Vendor No.", "Stock Transfer Temp Table".Vendor);
                    PurchaseHeaderRec.Validate(PurchaseHeaderRec."Pay-to Vendor No.", "Stock Transfer Temp Table".Vendor);
                    PurchaseHeaderRec.Validate("LSC Store No.", "Stock Transfer Temp Table"."Vendor Location");
                    PurchaseHeaderRec.Validate("Location Code", "Stock Transfer Temp Table"."Vendor Location");
                    PurchaseHeaderRec.Validate("Posting Date", "Stock Transfer Temp Table"."Posting Date");
                    PurchaseHeaderRec.Validate("Stock Req. No.", "Stock Transfer Temp Table"."Request No.");
                    PurchaseHeaderRec.Validate("Sales Order No.", "Stock Transfer Temp Table"."Sales Order No.");
                    PurchaseHeaderRec.Modify(true);
                    StockTransTemTableRec.Reset();
                    StockTransTemTableRec.SetRange("Request No.", "Stock Transfer Temp Table"."Request No.");
                    // StockTransTemTableRec.SetRange("Sales Order No.", "Stock Transfer Temp Table"."Sales Order No.");
                    if StockTransTemTableRec.FindSet() then
                        repeat
                            PurchaseLineRec.Init();
                            PurchaseLineRec."Document Type" := PurchaseHeaderRec."Document Type"::Order;
                            PurchaseLineRec."Document No." := sonum;
                            PurchaseLineRec."Line No." := StockTransTemTableRec."Line No.";
                            PurchaseLineRec.Insert(true);
                            PurchaseLineRec.Validate(Type, PurchaseLineRec.Type::Item);
                            PurchaseLineRec.Validate("No.", StockTransTemTableRec."Item No.");
                            PurchaseLineRec.Validate("Pay-to Vendor No.", "Stock Transfer Temp Table".Vendor);
                            PurchaseLineRec.Validate("Pay-to Vendor No.", PurchaseHeaderRec."Pay-to Vendor No.");
                            PurchaseLineRec.Validate(Quantity, "Stock Transfer Temp Table".Quantity);
                            PurchaseLineRec.Validate("Location Code", PurchaseHeaderRec."Location Code");
                            PurchaseLineRec.Validate("Request No.", "Stock Transfer Temp Table"."Request No.");
                            Hsn_lCod := '';
                            Description := '';
                            IF Item_lRec.Get(PurchaseLineRec."No.") then
                                Hsn_lCod := Item_lRec."HSN/SAC Code";
                            Description := Item_lRec.Description;
                            PurchaseLineRec.validate("HSN/SAC Code", Hsn_lCod);
                            PurchaseLineRec.validate(Description, Description);
                            PurchaseLineRec.Modify(true);
                        until StockTransTemTableRec.Next() = 0;
                    "Stock Transfer Temp Table"."PO No." := sonum;
                    "Stock Transfer Temp Table"."PO Created" := true;
                    "Stock Transfer Temp Table".Modify();
                end;
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
    trigger OnPostReport()
    begin


        Message('Purchase Order Created Succesffuly.');

    end;



    var
        myInt: Integer;
        PurchaseHeaderRec: Record "Purchase Header";
        PurchaseLineRec: Record "Purchase Line";
        Lineno: Integer;
        PurchPaSetup: Record "Purchases & Payables Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        sonum: code[50];
        Hsn_lCod: code[50];
        Description: Code[150];
        Item_lRec: Record Item;
        StockTransTemTableRec: Record "Stock Transfer Temp Table";


}