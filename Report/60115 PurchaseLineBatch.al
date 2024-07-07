report 60115 PurchaseLineBatch
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            RequestFilterFields = "Document No.";
            trigger OnAfterGetRecord()
            var
                DirectUnitCost: decimal;
            begin
                Clear(DirectUnitCost);
                DirectUnitCost := "Purchase Line"."Direct Unit Cost";
                "Purchase Line".Validate("No.");
                "Purchase Line".Validate("Direct Unit Cost", DirectUnitCost);
                "Purchase Line".Modify();
            end;
        }
    }

}