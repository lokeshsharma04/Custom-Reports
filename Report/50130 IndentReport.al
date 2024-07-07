// report 50130 indentReport
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = 'Report/Indent-Report.rdl';

//     dataset
//     {
//         dataitem("LSC InStore Stock Req. Header"; "LSC InStore Stock Req. Header")
//         {
//             //DataItemTableView = where("Document Type" = filter('Purchase Order'));
//             RequestFilterFields = "No.";
//             column(No_; "No.")
//             {
//             }
//             column(SRNo; SRNo)
//             {
//             }

//             column(Document_Date; "Document Date")
//             {
//             }
//             column(Vendor_No_; "Vendor No.")
//             {

//             }
//             column(VendName; VendName)
//             {
//             }

//             dataitem("LSC InStore Stock Req. Line"; "LSC InStore Stock Req. Line")
//             {
//                 DataItemLink = "Document No." = field("No.");
//                 DataItemLinkReference = "LSC InStore Stock Req. Header";
//                 column(Item_No_; "Item No.")
//                 {

//                 }
//                 column(Description; Description)
//                 {

//                 }
//                 column(Quantity; Quantity)
//                 {

//                 }
//                 column(Unit_of_Measure_Code; "Unit of Measure Code")
//                 {

//                 }
//                 column(Store_No_; "Store No.")
//                 {

//                 }

//                 trigger OnAfterGetRecord()
//                 var
//                     myInt: Integer;
//                 begin
//                     SRNo += 1;

//                 end;

//                 trigger OnPreDataItem()
//                 var
//                     myInt: Integer;
//                 begin
//                     // SRNo:=
//                 end;

//             }
//             trigger OnAfterGetRecord()
//             var
//                 myInt: Integer;
//             begin
//                 //SRNo := 0;
//                 Clear(VendName);
//                 StoreRec.Reset();
//                 StoreRec.SetRange("No.", "LSC InStore Stock Req. Header"."Store No.");
//                 if StoreRec.FindFirst() then
//                     VendName := StoreRec.Name;
//             end;


//         }

//     }

//     requestpage
//     {
//         layout
//         {
//             area(Content)
//             {
//                 group(GroupName)
//                 {
//                     // field(Name; SourceExpression)
//                     // {
//                     //     ApplicationArea = All;

//                     // }
//                 }

//             }
//         }

//         actions
//         {
//             area(processing)
//             {
//                 action(ActionName)
//                 {
//                     ApplicationArea = All;

//                 }
//             }
//         }

//     }
//     trigger OnPreReport()
//     var
//         myInt: Integer;
//     begin
//         SRNo := 0;
//     end;

//     var
//         myInt: Integer;
//         SRNo: Integer;
//         StoreRec: Record "LSC Store";
//         VendName: Text[50];
// }