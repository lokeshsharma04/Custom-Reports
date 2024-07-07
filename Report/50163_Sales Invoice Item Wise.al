report 50163 SalesInvoiceItemWise
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Sales Invoice Item Wise';
    ApplicationArea = All;
    RDLCLayout = 'Report/Sales Invoice Item Wise.rdl';

    dataset
#pragma warning disable
    {
        dataitem("Sales Invoice Line"; "Sales Invoice Line")
        {
            RequestFilterFields = "Posting Date", "Location Code";

            column(Posting_Date; "Posting Date")
            {

            }
            column(sdate; "Sales Invoice Line"."Posting Date")
            {

            }
            column(edate; "Sales Invoice Line"."Posting Date")
            {

            }
            column(Document_No_; "Document No.")
            {

            }
            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {

            }
            column(No_; "No.")
            {

            }
            column(Description; Description)
            {

            }
            column(HSN_SAC_Code; "HSN/SAC Code")

            {

            }
            column(Quantity2; Quantity)
            {

            }
            column(Unit_of_Measure2; "Unit of Measure")
            {

            }
            column(Unit_Price; "Unit Price")
            {

            }
            column(Line_Discount_Amount; "Line Discount Amount")
            {

            }
            column(Line_Amount; "Line Amount")
            {

            }
            column(GST_Group_Code; "GST Group Code")
            {

            }
            column(IGSTAmtTol; IGSTAmtTol)
            {

            }
            column(SGSTAmtTol; SGSTAmtTol)
            {
            }
            column(CGSTAmtTol; CGSTAmtTol)
            {
            }
            column(CustGST; Cust."GST Registration No.")
            {
            }
            column(Cust; Cust.Name)
            {

            }
            column(Location_Code; "Location Code")
            {

            }
            trigger OnPreDataItem()
            var
            begin
                SetRange("Posting Date", StartDate, EndDate);
                SetFilter("Location Code", StoreNo);
                ComInfo.get();
            end;

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin


                // If Quantity > 0 then CurrReport.Skip();    Rohit chaudhary



                CGSTAmtTol := 0;
                DetailedLedgerEntry.RESET;
                DetailedLedgerEntry.SETRANGE("Transaction Type", DetailedLedgerEntry."Transaction Type"::Sales);
                DetailedLedgerEntry.SetRange("Entry Type", DetailedLedgerEntry."Entry Type"::"Initial Entry");
                DetailedLedgerEntry.SETRANGE(DetailedLedgerEntry."Document No.", "Document No.");
                DetailedLedgerEntry.SetRange("Document Line No.", "Sales Invoice Line"."Line No.");
                DetailedLedgerEntry.SETRANGE(DetailedLedgerEntry."GST Component Code", 'CGST');
                DetailedLedgerEntry.CALCSUMS(DetailedLedgerEntry."GST Amount");
                CGSTAmtTol := ABS(DetailedLedgerEntry."GST Amount");

                IGSTAmtTol := 0;
                DetailedLedgerEntry.RESET;
                DetailedLedgerEntry.SETRANGE("Transaction Type", DetailedLedgerEntry."Transaction Type"::Sales);
                DetailedLedgerEntry.SetRange("Entry Type", DetailedLedgerEntry."Entry Type"::"Initial Entry");
                DetailedLedgerEntry.SETRANGE(DetailedLedgerEntry."Document No.", "Document No.");
                DetailedLedgerEntry.SetRange("Document Line No.", "Sales Invoice Line"."Line No.");

                DetailedLedgerEntry.SETRANGE(DetailedLedgerEntry."GST Component Code", 'IGST');
                DetailedLedgerEntry.CALCSUMS(DetailedLedgerEntry."GST Amount");
                IGSTAmtTol := ABS(DetailedLedgerEntry."GST Amount");

                SGSTAmtTol := 0;
                DetailedLedgerEntry.RESET;
                DetailedLedgerEntry.SETRANGE("Transaction Type", DetailedLedgerEntry."Transaction Type"::Sales);
                DetailedLedgerEntry.SetRange("Entry Type", DetailedLedgerEntry."Entry Type"::"Initial Entry");

                DetailedLedgerEntry.SETRANGE(DetailedLedgerEntry."Document No.", "Document No.");
                DetailedLedgerEntry.SetRange("Document Line No.", "Sales Invoice Line"."Line No.");

                DetailedLedgerEntry.SETRANGE(DetailedLedgerEntry."GST Component Code", 'SGST');
                DetailedLedgerEntry.CALCSUMS(DetailedLedgerEntry."GST Amount");
                SGSTAmtTol := ABS(DetailedLedgerEntry."GST Amount");

                Cust.Reset();
                Cust.SetRange("No.", "Sales Invoice Line"."Sell-to Customer No.");
                if Cust.FindFirst() then;
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
                    field(StartDate; StartDate)
                    {
                        ApplicationArea = All;

                    }
                    field(EndDate; EndDate)
                    {
                        ApplicationArea = all;
                    }
                    field(StoreNo; StoreNo)
                    {
                        ApplicationArea = all;
                        TableRelation = Location;
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


    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = RDLC;
    //         LayoutFile = 'mylayout.rdl';
    //     }
    // }

    // local procedure MyProcedure(localGST : Code[15]) : Code[10]
    //  var
    //     myInt: Integer;
    //  begin
    //     EXIT(COPYSTR(localGST,3,10));
    //  end;
    var
        DetailedLedgerEntry: Record "Detailed GST Ledger Entry";
        Transacton_Hedaer_rec: Record "LSC Trans. Payment Entry";
        TH_rec: Record "LSC Transaction Header";
        IGST_LSC: Decimal;
        CGST_LSC: Decimal;
        SGST_LSC: Decimal;
        Cess_LSC: Decimal;
        CessAmtTot: Decimal;
        CGSTAmtTol: Decimal;
        SGSTAmtTol: Decimal;
        IGSTAmtTol: Decimal;
        StoreNo: Code[20];
        Cust: Record Customer;
        CustName: Text[100];
        CustGstRegistrationNo: Text[20];
        LscPosTransHeader: Record "LSC Transaction Header";
        ComInfo: Record "Company Information";
        item: Record Item;
        TTS: Record "LSC Tender Type Setup";
        LSCTransPosCompress: Record 10044506;//"LSC POS Trans. Line";
        TENDERNAME: TEXT;
        GstgroupCodeRec: Decimal;
        GSTAMOUNT: Decimal;
        GstgroupRec: Record "GST Group";

        StartDate: Date;
        EndDate: Date;
    //dhd: Record "LSCIN Tax Transaction Value"

}