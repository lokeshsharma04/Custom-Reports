report 50161 "Item Sales Prices"
{
    Caption = 'Item Sales Prices';
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/ItemSalesPrices.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
#pragma warning disable
    dataset
    {
        dataitem("Sales Price "; "Sales Price")
        {
            DataItemTableView = where("Sales Code" = filter('<>INC'));

            column(Item_No_; "Item No.")
            {

            }
            column(Sales_Code; "Sales Code")
            {

            }
            column(Unit_Price; "Unit Price")
            {

            }
            column(Unit_of_Measure_Code; "Unit of Measure Code")
            {

            }
            column(ItemDes; ItemDes)
            {

            }
            column(Item_HSN; Item_HSN)
            {

            }
            column(Item_GSTCode; Item_GSTCode)
            {

            }
            column(ItemCategayCode; ItemCategayCode)
            {

            }
            column(ItemRetailProdCode; ItemRetailProdCode)
            {

            }
            column(Price_Includes_VAT; "Price Includes VAT")
            {

            }
            column(OutletPrice; OutletPrice)
            {

            }
            column(OnlinePrice; OnlinePrice)
            {

            }
            column(ItemBlock; ItemBlock)
            {

            }

            trigger OnAfterGetRecord()
            begin
                ItemRec.Reset();
                Clear(ItemDes);
                Clear(OnlinePrice);
                Clear(OutletPrice)
                ;
                if ItemRec.Get("Item No.") then begin
                    ItemDes := ItemRec.Description;
                    Item_HSN := ItemRec."HSN/SAC Code";
                    Item_GSTCode := ItemRec."GST Group Code";
                    ItemRetailProdCode := ItemRec."LSC Retail Product Code";
                    ItemCategayCode := ItemRec."Item Category Code";
                    ItemBlock := ItemRec.Blocked;
                end;

                // SalesPriceRec.Reset();
                // SalesPriceRec.SetRange("Item No.", "Item No.");
                // if SalesPriceRec.FindFirst() then begin
                //     if SalesPriceRec."Sales Code" = 'ONLINE' then
                //         OnlinePrice := "Unit Price";
                // end;
                // // SalesPriceRec.Reset();
                // SalesPriceRec.SetRange("Item No.", "Item No.");
                // if SalesPriceRec.FindFirst() then begin

                //     if SalesPriceRec."Sales Code" = 'ONLINE' then
                //         OnlinePrice := "Unit Price";
                // end;

                // if "Sales Code" = ' EXC' then begin
                //     OutletPrice := "Unit Price";
                //     Message('hello');
                //     if "Sales Code" = 'INC' then
                //         OnlinePrice := "Unit Price";
                // end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
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
            }
        }
    }
    var
        ItemDes: Text[100];
        Item_GSTCode: Code[30];
        Item_HSN: CODE[30];
        ItemRetailProdCode: Code[30];
        ItemRec: Record Item;
        ItemCategayCode: Code[30];
        OutletPrice: Decimal;
        OnlinePrice: Decimal;
        SalesPriceRec: Record 7002;
        ItemBlock: Boolean;

}
