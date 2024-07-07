// report 50157 "Test Report "
// {
//     DefaultLayout = RDLC;
//     PreviewMode = PrintLayout;
//     ProcessingOnly = true;
//     UsageCategory = ReportsAndAnalysis;
//     Caption = 'Vendor GST Update Batch';
//     ApplicationArea = all;


//     RDLCLayout = './Layouts/Ven. Inv. Update Batch.rdlc';
//     Permissions =
//                   TableData 18005 = rimD,
//                   TableData 18001 = rimD;
//     dataset
//     {
//         dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
//         {
//             dataitem("GST Ledger Entry"; "GST Ledger Entry")
//             {
//                 trigger OnPreDataItem()
//                 begin
//                     SetRange("Document No.", DocumentNo);

//                 end;

//                 trigger OnAfterGetRecord()
//                 var
//                     myInt: Integer;
//                 begin
//                     "GST Ledger Entry"."External Document No." := VenInvNo;
//                     "GST Ledger Entry".Modify;
//                     //  Message('%1', "Detailed GST Ledger Entry"."External Document No.");
//                 end;
//             }

//             trigger OnPreDataItem()
//             begin
//                 SetRange("Document No.", DocumentNo);

//             end;

//             trigger OnAfterGetRecord()
//             var
//                 myInt: Integer;
//             begin
//                 "Detailed GST Ledger Entry"."External Document No." := VenInvNo;
//                 "Detailed GST Ledger Entry".Modify;
//                 //  Message('%1', "Detailed GST Ledger Entry"."External Document No.");
//             end;



//         }
//     }
//     requestpage
//     {

//         layout
//         {
//             area(content)
//             {
//                 field("Document No."; DocumentNo)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Ven. Inv. No."; VenInvNo)
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//         }

//         actions
//         {
//         }
//     }

//     var
//         DocumentNo: Code[20];
//         VenInvNo: Code[20];
// }
