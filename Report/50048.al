// report 50152 "Party Ledger"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = 'Report/Rep50048.rdl';
//     PreviewMode = PrintLayout;
//     UsageCategory = Administration;
//     ApplicationArea = all;
//     dataset
//     {
//         dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
//         {
//             column(PostingDate_GLEntry; FORMAT("Cust. Ledger Entry"."Posting Date"))
//             {
//             }
//             column(SourceCode_GLEntry; "Cust. Ledger Entry"."Source Code")
//             {
//             }
//             column(DocumentNo_GLEntry; "Cust. Ledger Entry"."Document No.")
//             {
//             }
//             column(DebitAmount_GLEntry; "Cust. Ledger Entry"."Debit Amount")
//             {
//             }
//             column(CreditAmount_GLEntry; "Cust. Ledger Entry"."Credit Amount")
//             {
//             }
//             column(CustomerNo_CustLedgerEntry; "Cust. Ledger Entry"."Customer No.")
//             {
//             }
//             column(CompName; CompanyInformation.Name)
//             {
//             }
//             column(CompAdd; CompanyInformation.Address + ' ' + CompanyInformation."Address 2")
//             {
//             }
//             column(CompCity; CompanyInformation.City)
//             {
//             }
//             column(CompPostCode; CompanyInformation."Post Code")
//             {
//             }
//             column(CompState; CompanyInformation."State Code")
//             {
//             }
//             column(CompCuntry; CompanyInformation.County)
//             {
//             }
//             column(CompPH; CompanyInformation."Phone No.")
//             {
//             }
//             column(CompCin; '')
//             {
//             }
//             column(CustName; CustomerRec.Name)
//             {
//             }
//             column(CustAddress; CustomerRec.Address)
//             {
//             }
//             column(EndDate; EndDate)
//             {
//             }
//             column(StartDate; StartDate)
//             {
//             }
//             column(Document_Type; "Cust. Ledger Entry"."Document Type")
//             {
//             }
//             column(Document_No; "Cust. Ledger Entry"."Document No.")
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 CustomerRec.GET("Cust. Ledger Entry"."Customer No.");
//             end;

//             trigger OnPreDataItem()
//             begin
//                 CompanyInformation.GET;
//                 SETRANGE("Cust. Ledger Entry"."Posting Date", StartDate, EndDate);
//             end;
//         }
//     }

//     requestpage
//     {
//         SaveValues = true;

//         layout
//         {
//             area(content)
//             {
//                 field(StartDate; StartDate)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field(EndDate; EndDate)
//                 {
//                     ApplicationArea = all;
//                 }
//             }
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//     }

//     var
//         CompanyInformation: Record "Company Information";
//         CustomerRec: Record "Customer";
//         StartDate: Date;
//         EndDate: Date;
// }

