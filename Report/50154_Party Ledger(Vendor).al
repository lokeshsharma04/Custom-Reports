report 50154 "Party Ledger(Vendor)"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/Rep50051.rdl';
    PreviewMode = PrintLayout;
    UsageCategory = Administration;
    ApplicationArea = all;

    dataset
    {
        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            column(PostingDate_GLEntry; FORMAT("Vendor Ledger Entry"."Posting Date"))
            {
            }
            column(SourceCode_GLEntry; VoucherType)
            {
            }
            column(DocumentNo_GLEntry; "Vendor Ledger Entry"."Document No.")
            {
            }
            column(DebitAmount_GLEntry; "Vendor Ledger Entry"."Debit Amount")
            {
            }
            column(CreditAmount_GLEntry; "Vendor Ledger Entry"."Credit Amount")
            {
            }
            column(CustomerNo_CustLedgerEntry; "Vendor Ledger Entry"."Vendor No.")
            {
            }
            column(CompName; CompanyInformation.Name)
            {
            }
            column(CompAdd; CompanyInformation.Address + ' ' + CompanyInformation."Address 2")
            {
            }
            column(CompCity; CompanyInformation.City)
            {
            }
            column(CompPostCode; CompanyInformation."Post Code")
            {
            }
            column(CompState; CompanyInformation."State Code")
            {
            }
            column(CompCuntry; CompanyInformation.County)
            {
            }
            column(CompPH; CompanyInformation."Phone No.")
            {
            }
            column(CompCin; '')
            {
            }
            column(CustName; CustomerRec.Name)
            {
            }
            column(CustAddress; CustomerRec.Address)
            {
            }
            column(EndDate; EndDate)
            {
            }
            column(StartDate; StartDate)
            {
            }
            column(VendorName; vendorname)
            {
            }
            column(DocumentType; "Vendor Ledger Entry"."Document Type")
            {
            }
            column(DocumentNo; "Vendor Ledger Entry"."Document No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                CustomerRec.GET("Vendor Ledger Entry"."Vendor No.");

                Vendorrec.RESET;
                Vendorrec.SETRANGE("No.", "Vendor Ledger Entry"."Vendor No.");
                IF Vendorrec.FINDFIRST THEN
                    vendorname := Vendorrec.Name;

                //DocN := "Vendor Ledger Entry"."Document No.";
                VoucherType := '';
                IF COPYSTR("Vendor Ledger Entry"."Document No.", 1, 6) = 'GT/PPI' THEN
                    VoucherType := 'Purchase';
                IF COPYSTR("Vendor Ledger Entry"."Document No.", 1, 6) = 'GT/PDN' THEN
                    VoucherType := 'Debit Note';
                IF COPYSTR("Vendor Ledger Entry"."Document No.", 1, 5) = 'GT/BP' THEN
                    VoucherType := 'Payment';
                //MESSAGE(VoucherType);
                /*
                VoucherType := '';
                "Vendor Ledger Entry".SETFILTER("Vendor Ledger Entry"."Document No.",'%1','@*GT/PPI/1920/*');
                IF "Vendor Ledger Entry".FINDFIRST THEN REPEAT
                  VoucherType := 'Purchase';
                UNTIL "Vendor Ledger Entry".NEXT=0;
                "Vendor Ledger Entry".SETFILTER("Vendor Ledger Entry"."Document No.",'%1','@*GT/PDN/1920/*');
                IF "Vendor Ledger Entry".FINDFIRST THEN REPEAT
                  VoucherType := 'Debit Note';
                UNTIL "Vendor Ledger Entry".NEXT=0;
                "Vendor Ledger Entry".SETFILTER("Vendor Ledger Entry"."Document No.",'%1','@*GT/BP/1920/*');
                IF "Vendor Ledger Entry".FINDFIRST THEN REPEAT
                  VoucherType :='Payment';
                UNTIL "Vendor Ledger Entry".NEXT=0;
                */

            end;

            trigger OnPreDataItem()
            begin
                CompanyInformation.GET;
                IF (StartDate <> 0D) AND (EndDate <> 0D) THEN
                    SETRANGE("Vendor Ledger Entry"."Posting Date", StartDate, EndDate);
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                field(StartDate; StartDate)
                {
                }
                field(EndDate; EndDate)
                {
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
        CompanyInformation: Record "Company Information";
        CustomerRec: Record "vendor";
        StartDate: Date;
        EndDate: Date;
        Vendorrec: Record "Vendor";
        vendorname: Text;
        VoucherType: Text;
        DocN: Code[15];
}

