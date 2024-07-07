// report 50108 AccountingBatch
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     ProcessingOnly = true;
//     DefaultLayout = RDLC;
//     // RDLCLayout = 'Report/item.rdl';
//     dataset
//     {

//         dataitem("Sales Price"; "Sales Price")
//         {
//             trigger OnAfterGetRecord()
//             var
//                 myInt: Integer;
//             begin
//                 DeleteAll();
//             end;
//         }
//         dataitem(Item; Item)
//         {
//             trigger OnAfterGetRecord()
//             var
//                 myInt: Integer;
//             begin
//                 DeleteAll();
//             end;
//         }
//         dataitem(Location; Location)
//         {
//             trigger OnAfterGetRecord()
//             var
//                 myInt: Integer;
//             begin
//                 DeleteAll();
//             end;
//         }
//         dataitem(Customer; Customer)
//         {
//             trigger OnAfterGetRecord()
//             var
//                 myInt: Integer;
//             begin
//                 DeleteAll();
//             end;
//         }
//         dataitem("LSC Store"; "LSC Store")
//         {
//             trigger OnAfterGetRecord()
//             var
//                 myInt: Integer;
//             begin
//                 DeleteAll();
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




//     var
//         myInt: Integer;
//         Item_: Record Item;
// }