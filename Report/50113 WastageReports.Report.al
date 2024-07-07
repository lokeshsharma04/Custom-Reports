Report 50113 "Wastage Reports"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/Wastage Reports.rdl';
    Caption = 'Wastage Reports';
    UsageCategory = Administration;
    ApplicationArea = all;

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            DataItemTableView = where("Entry Type" = filter("Negative Adjmt."));
            RequestFilterFields = "Location Code", "Posting Date";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(ItemNo_ItemLedgerEntry; "Item Ledger Entry"."Item No.")
            {
            }
            column(PostingDate_ItemLedgerEntry; Format("Item Ledger Entry"."Posting Date"))
            {
            }
            column(EntryType_ItemLedgerEntry; "Item Ledger Entry"."Entry Type"::"Negative Adjmt.")
            {
            }
            column(DocumentNo_ItemLedgerEntry; "Item Ledger Entry"."Document No.")
            {
            }
            column(LocationCode_ItemLedgerEntry; "Item Ledger Entry"."Location Code")
            {
            }
            column(Quantity_ItemLedgerEntry; "Item Ledger Entry".Quantity * -1)
            {
            }
            column(ReasonCode_ItemLedgerEntry; "Item Ledger Entry"."Reason Code")
            {
            }
            column(ItemRec_Description; ItemRec.Description)
            {
            }
            column(LocationRec_Name; LocationRec.Name)
            {
            }
            column(LocationRec_Address; LocationRec.Address + '  ' + LocationRec."Address 2" + '  City - ' + LocationRec.City)
            {
            }
            // column(Remarks_ItemLedgerEntry;"Item Ledger Entry".Remarks)
            // {
            // }
            column(Reason; Reason)
            {

            }
            column(UnitofMeasureCode_ItemLedgerEntry; "Item Ledger Entry"."Unit of Measure Code")
            {
            }
            column(CostAmountActual_ItemLedgerEntry; Abs("Item Ledger Entry"."Cost Amount (Actual)"))
            {
            }
            column(UnitCOst; Abs("Item Ledger Entry"."Cost Amount (Actual)" / Quantity))
            {
            }
            column(Base_Unit_of_Measure; ItemRec."Base Unit of Measure")
            {
            }
            column(AccountNov; AccountNo)
            {
            }
            column(Remarks; Remarks)
            { }
            column(AccountName; AccountName)
            {
            }
            column(StateCode; "Item Ledger Entry"."Global Dimension 2 Code")
            {
            }

            trigger OnAfterGetRecord()
            begin

                if ItemRec.Get("Item Ledger Entry"."Item No.") then;
                if LocationRec.Get("Item Ledger Entry"."Location Code") then;
                CalcFields("Cost Amount (Actual)");

                ValueEntry.Reset;
                ValueEntry.SetRange("Item Ledger Entry No.", "Item Ledger Entry"."Entry No.");
                ValueEntry.SetFilter("Cost Posted to G/L", '<>%1', 0);
                if ValueEntry.FindFirst then begin
                    // IF ILEDoc <> "Item Ledger Entry"."Document No." THEN BEGIN
                    GLEntry.Reset;
                    GLEntry.SetCurrentkey("Document No.", "Posting Date");
                    GLEntry.SetRange("Document No.", "Item Ledger Entry"."Document No.");
                    GLEntry.SetRange("Posting Date", "Item Ledger Entry"."Posting Date");
                    GLEntry.SetRange(Amount, -ValueEntry."Cost Posted to G/L");
                    if GLEntry.FindFirst then begin
                        AccountNo := GLEntry."G/L Account No.";
                        GLAccount.Get(AccountNo);
                        AccountName := GLAccount.Name;
                    end else begin
                        AccountNo := '';
                        AccountName := '';
                    end;
                end;

                ILEDoc := "Item Ledger Entry"."Document No.";
                Clear(Remarks);
                WastageEntrylineRcc.Reset();
                WastageEntrylineRcc.SetRange(" Item No", "Item Ledger Entry"."Item No.");
                WastageEntrylineRcc.SetRange("Document No.", "Item Ledger Entry"."Document No.");
                WastageEntrylineRcc.SetRange("Line No", "Item Ledger Entry"."Document Line No.");
                if WastageEntrylineRcc.FindFirst() then begin
                    Remarks := WastageEntrylineRcc.Remarks;
                end;
            end;

            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                //   SetRange("Reason Code", Reason);
            end;
        }
    }

    requestpage
    {


        layout
        {
            area(Content)
            {
                field(Reason; Reason)
                {
                    TableRelation = "Reason Code";
                    ApplicationArea = all;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        ItemRec: Record Item;
        LocationRec: Record Location;
        GLEntry: Record "G/L Entry";
        ILEDoc: Code[20];
        ValueEntry: Record "Value Entry";
        AccountNo: Code[20];
        GLAccount: Record "G/L Account";
        AccountName: Text;
        itemJouLine: Record "Item Ledger Entry";
        Reason: Text[50];
        WastageEntrylineRcc: Record "wastage Entry line";
        Remarks: Code[100];
}

