report 50137 "Indent Transfer Report"
{
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/Indent Transfer Report.rdl';
    ApplicationArea = All;

    dataset
    {
        dataitem(Indent; Indent)
        {
            RequestFilterFields = "Form Store", "To Store", "Posting Date";
            DataItemTableView = where(Status = filter('Approved'));
            column(No; No)
            {
            }
            column(Form_Location; "Form Location")
            { }
            column(To_Location; "To Location")
            { }
            column(Posting_Date; "Posting Date")
            { }
            column(Referance_No; "Referance No")
            { }

            dataitem(IndentLine; IndentLine)
            {
                DataItemLink = "Document No." = field(No);
                DataItemTableView = where(No = filter(<> ''));
                column(Document_No_; "Document No.")
                {

                }
                column(No_; No)
                {

                }
                column(Descrption; Descrption)
                {

                }
                column(QTY; QTY)
                {

                }
                column(QTY_Ship; "QTY Ship")
                {
                }
                column(QTY_Shiped; "QTY Shiped")
                {

                }
                column(UOM; UOM)
                { }
                column(HSNHAC; HSNHAC)
                {

                }

                column(ProductgroupCode; ProductgroupCode)
                { }
                column(ProductgroupType; ProductgroupType)
                {

                }
                column(SubProductType; SubProductType)
                { }
                column(unit_Price; "unit Price")
                { }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    Clear(HSNHAC);
                    Clear(ProductgroupCode);
                    Clear(ProductgroupType);
                    Clear(UnitCost);
                    Clear(SubProductType);
                    Item_Rec.Get(IndentLine.No);
                    HSNHAC := Item_Rec."HSN/SAC Code";
                    ProductgroupCode := Item_Rec."LSC Division Code";
                    ProductgroupType := Item_Rec."Item Category Code";
                    SubProductType := Item_Rec."LSC Retail Product Code";
                    UnitCost := Item_Rec."Unit Cost";

                end;
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
        Item_Rec: Record Item;
        bjugd: Report 18049;
        HSNHAC: Code[20];
        ProductgroupCode: Code[20];
        ProductgroupType: Code[20];
        SubProductType: Code[20];
        UnitCost: Decimal;
}