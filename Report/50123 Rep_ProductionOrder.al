report 50123 "Prod. Order- Mat. Requisition"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/ProdOrderMatRequisition.rdl';
    ApplicationArea = Manufacturing;
    Caption = 'Prod. OrderMat.Requisition';
    UsageCategory = ReportsAndAnalysis;
    //Layout me lgai h field nahi wha 
    dataset
    {
        dataitem("Production Order"; "Production Order")
        {
            DataItemTableView = SORTING(Status, "No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = Status, "No.", "Source Type", "Source No.";
            column(TodayFormatted; Format(Today, 0, 4))
            {
            }
            column(CompanyName; COMPANYPROPERTY.DisplayName)
            {
            }
            column(ProdOrderTableCaptionFilter; TableCaption + ':' + ProdOrderFilter)
            {
            }
            column(No_ProdOrder; "No.")
            {
            }
            column(Desc_ProdOrder; Description)
            {
            }
            column(SourceNo_ProdOrder; "Source No.")
            {
                IncludeCaption = true;
            }
            column(Status_ProdOrder; Status)
            {
            }
            column(Qty_ProdOrder; Quantity)
            {
                IncludeCaption = true;
            }
            column(Filter_ProdOrder; ProdOrderFilter)
            {
            }
            column(ProdOrderMaterialRqstnCapt; ProdOrderMaterialRqstnCaptLbl)
            {
            }
            column(CurrReportPageNoCapt; CurrReportPageNoCaptLbl)
            {
            }
            dataitem("Prod. Order Component"; "Prod. Order Component")
            {
                DataItemLink = Status = FIELD(Status), "Prod. Order No." = FIELD("No.");
                DataItemTableView = SORTING(Status, "Prod. Order No.", "Prod. Order Line No.", "Line No.");
                column(ItemNo_ProdOrderComp; "Item No.")
                {
                    IncludeCaption = true;
                }
                column(Desc_ProdOrderComp; Description)
                {
                    IncludeCaption = true;
                }
                column(Qtyper_ProdOrderComp; "Quantity per")
                {
                    IncludeCaption = true;
                }
                column(UOMCode_ProdOrderComp; "Unit of Measure Code")
                {
                    IncludeCaption = true;
                }
                column(RemainingQty_ProdOrderComp; "Remaining Quantity")
                {
                    IncludeCaption = true;
                }
                column(CurrentQty; CurrentQty)
                { }
                column(BaseUOM; BaseUOM)
                {

                }
                column(Scrap_ProdOrderComp; "Scrap %")
                {
                    IncludeCaption = true;
                }
                column(DueDate_ProdOrderComp; Format("Due Date"))
                {
                    IncludeCaption = false;
                }
                column(LocationCode_ProdOrderComp; "Location Code")
                {
                    IncludeCaption = true;
                }

                trigger OnAfterGetRecord()
                begin
                    with ReservationEntry do begin
                        SetCurrentKey("Source ID", "Source Ref. No.", "Source Type", "Source Subtype");

                        SetRange("Source Type", DATABASE::"Prod. Order Component");
                        SetRange("Source ID", "Production Order"."No.");
                        SetRange("Source Ref. No.", "Line No.");
                        SetRange("Source Subtype", Status);
                        SetRange("Source Batch Name", '');
                        SetRange("Source Prod. Order Line", "Prod. Order Line No.");

                        if FindSet() then begin
                            RemainingQtyReserved := 0;
                            repeat
                                if ReservationEntry2.Get("Entry No.", not Positive) then
                                    if (ReservationEntry2."Source Type" = DATABASE::"Prod. Order Line") and
                                       (ReservationEntry2."Source ID" = "Prod. Order Component"."Prod. Order No.")
                                    then
                                        RemainingQtyReserved += ReservationEntry2."Quantity (Base)";
                            until Next() = 0;
                            if "Prod. Order Component"."Remaining Qty. (Base)" = RemainingQtyReserved then
                                CurrReport.Skip();
                        end;
                    end;
                    //Lga theek pr wha grouping hui hai
                    Clear(CurrentQty);//Pratham fbts
                    ItemLedgerEntry_gRec.Reset();
                    ItemLedgerEntry_gRec.SetRange("Item No.", "Prod. Order Component"."Item No.");
                    ItemLedgerEntry_gRec.SetRange("Location Code", "Prod. Order Component"."Location Code");
                    ItemLedgerEntry_gRec.CalcSums(Quantity);
                    CurrentQty += ItemLedgerEntry_gRec.Quantity;
                    Clear(BaseUOM);
                    ItemRec.Get("Item No.");
                    BaseUOM := ItemRec."Base Unit of Measure";


                end;

                trigger OnPreDataItem()
                begin
                    SetFilter("Remaining Quantity", '<>0');
                end;
            }

            trigger OnPreDataItem()
            begin
                ProdOrderFilter := GetFilters;
                // Locationfilter:=GetFilter(item.)
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
        ProdOrderCompDueDateCapt = 'Due Date';
    }

    var
        ReservationEntry: Record "Reservation Entry";
        ReservationEntry2: Record "Reservation Entry";
        ItemRec: Record Item;
        ProdOrderFilter: Text;
        CurrentQty: Decimal;

        ItemLedgerEntry_gRec: Record "Item Ledger Entry";
        Locationfilter: Text;
        BaseUOM: Code[20];
        RemainingQtyReserved: Decimal;
        ProdOrderMaterialRqstnCaptLbl: Label 'Prod. Order - Material Requisition';
        CurrReportPageNoCaptLbl: Label 'Page';
}

