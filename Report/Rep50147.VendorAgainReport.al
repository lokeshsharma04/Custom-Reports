// Report 60111 "Vendor Ageing Report New"
// {
//     DefaultLayout = RDLC;
//     Caption = 'Vendor Ageing Report';
//     ApplicationArea = all;
//     UsageCategory = ReportsAndAnalysis;

//     RDLCLayout = 'Layout/Vendor Ageing Report New.rdl';

//     dataset
//     {
//         dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
//         {

//             RequestFilterFields = "No.";
//             DataItemTableView = where(Type = filter('Item' | 'Fixed Asset' | 'G/L Account'), Description = filter(<> 'Round Off'));
//             // DataItemTableView = where(Description = filter(<> 'Round Off'), Type = filter(<> 'Comment'));


//             column(Currency_Code; '')//"Currency Code")
//             {


//             }
//             column(CompanyInfo_Name; CompanyInfo.Name)
//             {
//             }
//             column(CompanyInfo_Address; CompanyInfo.Address)
//             {
//             }
//             column(CompanyInfo_Address2; CompanyInfo."Address 2")
//             {
//             }
//             column(CompanyInfo_City; CompanyInfo.City)
//             {
//             }
//             column(CompanyInfo_Picture; CompanyInfo.Picture)
//             {
//             }
//             column(CompanyInfo_PostCode; CompanyInfo."Post Code")
//             {
//             }
//             column(CompanyInfo_County; CompanyInfo.County)
//             {
//             }
//             column(CompanyInfo_State; CompanyInfo."State Code")
//             {
//             }

//             column(Customer_Posting_Group; "Item Category Code") //"Vendor Posting Group")
//             {

//             }
//             column(Unit_of_Measure_Code; "Unit of Measure Code")//"State Code")
//             {

//             }
//             column(Location_Code; "Location Code")
//             {

//             }

//             column(Global_Dimension_1_Code; '')//"Global Dimension 1 Code")
//             {

//             }
//             column(Global_Dimension_2_Code; '')// "Global Dimension 2 Code")
//             {

//             }


//             column(DateFilter; DateFilter)
//             {
//             }
//             column(No_Customer; "No.")
//             {
//             }
//             column(Name_Customer; Description)
//             {
//             }
//             column(Amt0_30; Amt0_30)
//             {

//             }
//             column(Amt31_60; Amt31_60)
//             {

//             }
//             column(Amt91_180; Amt91_180)
//             {

//             }
//             column(Amt181_360; Amt181_360)
//             {

//             }
//             column(AmtAbove361_540; AmtAbove361_540)
//             {

//             }
//             column(AmtAbove541_720; AmtAbove541_720)
//             {

//             }
//             column(AmtAbove721_900; AmtAbove721_900)
//             {

//             }
//             column(AmtAbove900_1080; AmtAbove900_1080)
//             {

//             }
//             column(AmtAbove1080; AmtAbove1080)
//             {

//             }



//             trigger OnAfterGetRecord()
//             var
//             begin
//                 Clear(Amt0_30);
//                 Clear(Amt31_90);
//                 Clear(Amt91_180);
//                 Clear(Amt181_360);
//                 Clear(AmtAbove361_540);
//                 Clear(AmtAbove541_720);
//                 Clear(AmtAbove721_900);
//                 Clear(AmtAbove900_1080);
//                 Clear(AmtAbove1080);

//                 //Lessthan 1 Month
//                 PurInvLine_Rec.Reset;
//                 PurInvLine_Rec.SetRange("Document No.", "Purch. Inv. Line"."Document No.");
//                 PurInvLine_Rec.SetRange("Line No.", "Purch. Inv. Line"."Line No.");
//                 PurInvLine_Rec.SetRange("No.", "Purch. Inv. Line"."No.");
//                 PurInvLine_Rec.SetRange("Posting Date", DateFilter30, DateFilter);
//                 //PurInvLine_Rec.SetRange(Open, true);//12/18/23- 30Days
//                 if PurInvLine_Rec.FindFirst() then
//                     // repeat
//                     PurInvLine_Rec.CalcSums(Amount);
//                 Amt0_30 := PurInvLine_Rec.Amount;
//                 //  until PurInvLine_Rec.Next = 0;

//                 //!-3 month
//                 PurInvLine_Rec1.Reset;
//                 PurInvLine_Rec1.SetRange("Document No.", "Purch. Inv. Line"."Document No.");
//                 PurInvLine_Rec1.SetRange("Line No.", "Purch. Inv. Line"."Line No.");
//                 PurInvLine_Rec1.SetRange("Posting Date", DateFilter60, DateFilter30 - 1);
//                 // PurInvLine_Rec1.SetRange(Open, true);
//                 if PurInvLine_Rec1.FindFirst() then
//                     //     repeat
//                     //         PurInvLine_Rec1.CalcFields("Remaining Amt. (LCY)");
//                     PurInvLine_Rec1.CalcSums(Amount);
//                 Amt31_60 += PurInvLine_Rec1.Amount;
//                 //     until PurInvLine_Rec1.Next = 0;



//                 // //3-6Month
//                 // CLERec3.Reset;
//                 // CLERec3.SetCurrentkey("Vendor No.", "Posting Date");
//                 // CLERec3.SetLoadFields("Vendor No.", "Posting Date", "Remaining Amt. (LCY)");
//                 // CLERec3.SetRange("Vendor No.", Customer."No.");
//                 // CLERec3.SetRange("Posting Date", DateFilter120, DateFilter90 - 1);
//                 // CLERec3.SetRange(Open, true);
//                 // if CLERec3.FindSet then
//                 //     repeat
//                 //         CLERec3.CalcFields("Remaining Amt. (LCY)");
//                 //         Amt91_180 += CLERec3."Remaining Amt. (LCY)"
//                 //       until CLERec3.Next = 0;

//                 // //6-12Month
//                 // CLERec4.Reset;
//                 // CLERec4.SetCurrentkey("Vendor No.", "Posting Date");
//                 // CLERec4.SetLoadFields("Vendor No.", "Posting Date", "Remaining Amt. (LCY)");
//                 // CLERec4.SetRange("Vendor No.", Customer."No.");
//                 // CLERec4.SetRange("Posting Date", DateFilter360, DateFilter120 - 1);
//                 // CLERec4.SetRange(Open, true);
//                 // if CLERec4.FindSet then
//                 //     repeat
//                 //         CLERec4.CalcFields("Remaining Amt. (LCY)");
//                 //         Amt181_360 += CLERec4."Remaining Amt. (LCY)"
//                 //       until CLERec4.Next = 0;

//                 // //12-18Month
//                 // CLERec5.Reset;
//                 // CLERec5.SetCurrentkey("Vendor No.", "Posting Date");
//                 // CLERec5.SetLoadFields("Vendor No.", "Posting Date", "Remaining Amt. (LCY)");
//                 // CLERec5.SetRange("Vendor No.", Customer."No.");
//                 // CLERec5.SetRange("Posting Date", DateFilter540, DateFilter360 - 1);
//                 // CLERec5.SetRange(Open, true);
//                 // if CLERec5.FindSet then
//                 //     repeat
//                 //         CLERec5.CalcFields("Remaining Amt. (LCY)");
//                 //         AmtAbove361_540 += CLERec5."Remaining Amt. (LCY)"
//                 //       until CLERec5.Next = 0;

//                 // //18-24Month
//                 // CLERec5.Reset;
//                 // CLERec5.SetCurrentkey("Vendor No.", "Posting Date");
//                 // CLERec5.SetLoadFields("Vendor No.", "Posting Date", "Remaining Amt. (LCY)");
//                 // CLERec5.SetRange("Vendor No.", Customer."No.");
//                 // CLERec5.SetRange("Posting Date", DateFilter720, DateFilter540 - 1);
//                 // CLERec5.SetRange(Open, true);
//                 // if CLERec5.FindSet then
//                 //     repeat
//                 //         CLERec5.CalcFields("Remaining Amt. (LCY)");
//                 //         AmtAbove541_720 += CLERec5."Remaining Amt. (LCY)"
//                 //       until CLERec5.Next = 0;

//                 // //24-30Month
//                 // CLERec5.Reset;
//                 // CLERec5.SetCurrentkey("Vendor No.", "Posting Date");
//                 // CLERec5.SetLoadFields("Vendor No.", "Posting Date", "Remaining Amt. (LCY)");
//                 // CLERec5.SetRange("Vendor No.", Customer."No.");
//                 // CLERec5.SetRange("Posting Date", DateFilter900, DateFilter720 - 1);
//                 // CLERec5.SetRange(Open, true);
//                 // if CLERec5.FindSet then
//                 //     repeat
//                 //         CLERec5.CalcFields("Remaining Amt. (LCY)");
//                 //         AmtAbove721_900 += CLERec5."Remaining Amt. (LCY)"
//                 //       until CLERec5.Next = 0;

//                 // //30-36Month
//                 // CLERec5.Reset;
//                 // CLERec5.SetCurrentkey("Vendor No.", "Posting Date");
//                 // CLERec5.SetLoadFields("Vendor No.", "Posting Date", "Remaining Amt. (LCY)");
//                 // CLERec5.SetRange("Vendor No.", Customer."No.");
//                 // CLERec5.SetRange("Posting Date", DateFilter1080, DateFilter900 - 1);
//                 // CLERec5.SetRange(Open, true);
//                 // if CLERec5.FindSet then
//                 //     repeat
//                 //         CLERec5.CalcFields("Remaining Amt. (LCY)");
//                 //         AmtAbove900_1080 += CLERec5."Remaining Amt. (LCY)"
//                 //       until CLERec5.Next = 0;


//                 // //Morethan36Month
//                 // CLERec5.Reset;
//                 // CLERec5.SetCurrentkey("Vendor No.", "Posting Date");
//                 // CLERec5.SetLoadFields("Vendor No.", "Posting Date", "Remaining Amt. (LCY)");
//                 // CLERec5.SetRange("Vendor No.", Customer."No.");
//                 // CLERec5.SetRange("Posting Date", 0D, DateFilter1080 - 1);
//                 // CLERec5.SetRange(Open, true);
//                 // if CLERec5.FindSet then
//                 //     repeat
//                 //         CLERec5.CalcFields("Remaining Amt. (LCY)");
//                 //         AmtAbove1080 += CLERec5."Remaining Amt. (LCY)"
//                 //       until CLERec5.Next = 0;

//                 if (Amt0_30 + Amt31_90 + Amt91_180 + Amt181_360 + AmtAbove361_540 + AmtAbove541_720 + AmtAbove721_900 + AmtAbove900_1080 + AmtAbove1080) = 0 then
//                     CurrReport.Skip();

//             end;

//             trigger OnPreDataItem()
//             begin
//                 CompanyInfo.Get;
//                 CompanyInfo.CalcFields(Picture);
//                 // BranchFilter := Customer.GetFilter("Global Dimension 1 Filter");
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//             area(content)
//             {
//                 field(DateFilter; DateFilter)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'As On Date';
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

//     trigger OnPreReport()
//     begin
//         DateFilter30 := CalcDate('-30D', DateFilter);
//         DateFilter60 := CalcDate('-60D', DateFilter);
//         DateFilter120 := CalcDate('-180D', DateFilter);
//         DateFilter360 := CalcDate('-360D', DateFilter);
//         DateFilter540 := CalcDate('-540D', DateFilter);
//         DateFilter720 := CalcDate('-720D', DateFilter);
//         DateFilter900 := CalcDate('-900D', DateFilter);
//         DateFilter1080 := CalcDate('-1080D', DateFilter);

//     end;

//     var
//         amt1to3: Decimal;
//         amt1to36: Decimal;
//         Amt1to30: Decimal;
//         amt1to24: Decimal;
//         amt1to18: Decimal;
//         amt1to12: Decimal;
//         amt1to6: Decimal;
//         DateFilter1080Above: date;
//         Amt0_30: Decimal;
//         Amt31_90: Decimal;
//         Amt91_180: Decimal;
//         AmtAbove361_540: Decimal;
//         AmtAbove541_720: Decimal;
//         AmtAbove721_900: Decimal;
//         AmtAbove900_1080: Decimal;
//         AmtAbove1080: Decimal;
//         PurInvLine_Rec: Record "Purch. Inv. Line";
//         PurInvLine_Rec1: Record "Purch. Inv. Line";
//         CLERec3: Record "Vendor Ledger Entry";
//         CLERec4: Record "Vendor Ledger Entry";
//         CLERec5: Record "Vendor Ledger Entry";
//         DateFilter: Date;
//         DateFilter540: Date;
//         DateFilter30: Date;
//         DateFilter720: date;
//         DateFilter60: Date;
//         DateFilter900: date;
//         DateFilter1080: date;
//         DateFilter120: Date;
//         DateFilter180: Date;
//         DateFilter360: Date;
//         Amt31_60: Decimal;
//         Amt91_120: Decimal;
//         Amt121_180: Decimal;
//         Amt181_360: Decimal;
//         AmtAbove360: Decimal;
//         CompanyInfo: Record 79;
//         BranchFilter: Code[20];
// }

