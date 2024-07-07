report 50162 "Sales Cr.M Header Addr update"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    Permissions = tabledata "Item Ledger Entry" = RIMD;

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                SalesCaditMeme.Reset();
                // SalesCaditMeme.SetRange("Item No.", "Item Ledger Entry"."Item No.");
                SalesCaditMeme.SetRange("Document Type", "Document Type"::"Transfer Receipt");
                SalesCaditMeme.SetRange("Entry Type", "Entry Type"::Transfer);
                SalesCaditMeme.CalcFields("Cost Amount (Actual)");
                if SalesCaditMeme.FindFirst() then begin
                    "Item Ledger Entry"."Document No." := Docno;
                    "Item Ledger Entry"."Item No." := ItemNo;
                    "Item Ledger Entry"."Cost Amount (Actual)" := costActt;
                    "Item Ledger Entry".Modify();

                    // "Sales Cr.Memo Header"."Ship-to Address" := SalesCaditMeme."Bill-to Address";
                    // "Sales Cr.Memo Header"."Ship-to Address 2" := SalesCaditMeme."Bill-to Address 2";
                    // "Sales Cr.Memo Header".Modify();

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
                    field(costActt; costActt)
                    {
                        ApplicationArea = All;
                    }
                    field(Docno; Docno)
                    {
                        ApplicationArea = All;
                    }
                    field(ItemNo; ItemNo)
                    {
                        ApplicationArea = All;
                        TableRelation = Item;
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
        costActt: Decimal;
        Docno: Code[20];
        ItemNo: Code[20];
        SalesCaditMeme: Record "Item Ledger Entry";
}