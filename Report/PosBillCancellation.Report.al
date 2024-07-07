// report 50112 "Pos Bill Cancellation"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './PosBillCancellation.rdlc';

//     dataset
//     {
//         // dataitem(DataItem1000000011; Table79)
//         // {
//         //     column(Name_CompanyInformation; "Company Information".Name)
//         //     {
//         //     }
//         //     column(StartDate; FORMAT(StartDate))
//         //     {
//         //     }
//         //     column(EndDate; FORMAT(EndDate))
//         //     {
//         //     }
//         //     column(Picture_CompanyInformation; "Company Information".Picture)
//         //     {
//         //     }
//         // }
//         dataitem(DataItem1000000000; Table99001472)
//         {
//             column(ReceiptNo_TransactionHeader; "Transaction Header"."POS Receipt No")
//             {
//             }
//             column(Refunded_Amt; Refunded_Amt)
//             {
//             }
//             column(NetAmount_TransactionHeader; "Transaction Header".Payment)
//             {
//             }
//             column(Bill_No; Bill_No)
//             {
//             }
//             column(Store_Name; Store_Name)
//             {
//             }
//             column(Bill_Type; Bill_Type)
//             {
//             }
//             column(Refunded_Date; FORMAT(Refunded_Date))
//             {
//             }
//             column(Date_TransactionHeader; FORMAT("Transaction Header".Date))
//             {
//             }
//             column(First_Name; First_Name)
//             {
//             }
//             column(Refunded_First_Name; Refunded_First_Name)
//             {
//             }
//             column(Tendor_Name; Tendor_Name)
//             {
//             }
//             column(Reufund_bill_type; Reufund_bill_type)
//             {
//             }
//             column(ReasonCode_TransactionHeader; ReasonCode)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 Refunded_Amt := 0;
//                 Bill_No := '';
//                 Refunded_Date := 0D;
//                 ReasonCode := '';
//                 Refunded_First_Name := '';
//                 Reufund_bill_type := '';
//                 TransactionHeader.RESET;
//                 TransactionHeader.SETRANGE("Receipt No.", "Transaction Header"."Refund Receipt No.");
//                 IF StoreNo <> '' THEN
//                     TransactionHeader.SETRANGE("Store No.", StoreNo);
//                 IF TransactionHeader.FINDFIRST THEN BEGIN
//                     Refunded_Amt := TransactionHeader.Payment;
//                     Bill_No := TransactionHeader."POS Receipt No";
//                     Refunded_Date := TransactionHeader.Date;
//                     ReasonCode := TransactionHeader."Reason Code";
//                     CLEAR(Staff);
//                     IF Staff.GET(TransactionHeader."Staff ID") THEN
//                         Refunded_First_Name := Staff.ID + '-' + Staff."First Name";
//                     //Kartik
//                     TransPaymentEntry.RESET;
//                     TransPaymentEntry.SETRANGE("Receipt No.", TransactionHeader."Receipt No.");
//                     IF StoreNo <> '' THEN
//                         TransPaymentEntry.SETRANGE("Store No.", StoreNo);
//                     IF TransPaymentEntry.FINDFIRST THEN BEGIN
//                         Tendor_type.RESET;
//                         Tendor_type.SETRANGE(Code, TransPaymentEntry."Tender Type");
//                         Tendor_type.SETRANGE("Store No.", TransPaymentEntry."Store No.");
//                         IF Tendor_type.FINDFIRST THEN BEGIN
//                             Reufund_bill_type := Tendor_type.Description;
//                         END;
//                     END;
//                     //Kartik
//                 END;
//                 Store_Name := '';
//                 CLEAR(Store);
//                 IF Store.GET("Transaction Header"."Store No.") THEN
//                     Store_Name := Store.Name;
//                 TransPaymentEntry.RESET;
//                 TransPaymentEntry.SETRANGE("Receipt No.", "Transaction Header"."Receipt No.");
//                 IF StoreNo <> '' THEN
//                     TransPaymentEntry.SETRANGE("Store No.", StoreNo);
//                 IF TransPaymentEntry.FINDFIRST THEN BEGIN
//                     Tendor_type.RESET;
//                     Tendor_type.SETRANGE(Code, TransPaymentEntry."Tender Type");
//                     Tendor_type.SETRANGE("Store No.", TransPaymentEntry."Store No.");
//                     IF Tendor_type.FINDFIRST THEN BEGIN
//                         Bill_Type := Tendor_type.Description;
//                     END;
//                 END;
//                 First_Name := '';
//                 CLEAR(Staff);
//                 IF Staff.GET("Transaction Header"."Staff ID") THEN
//                     First_Name := Staff.ID + '-' + Staff."First Name";
//                 TransPaymentEntry.RESET;
//                 TransPaymentEntry.SETRANGE("Receipt No.", "Transaction Header"."Receipt No.");
//                 TransPaymentEntry.SETRANGE("Tender Type", '16');
//                 IF TransPaymentEntry.FINDFIRST THEN BEGIN
//                     TransactionHeader2.RESET;
//                     TransactionHeader2.SETRANGE("Receipt No.", TransPaymentEntry."Receipt No.");
//                     IF TransactionHeader2.FINDFIRST THEN BEGIN
//                         IF "Company Information".Name = 'LOVELY SWEETS' THEN BEGIN
//                             CLEAR(Customer);
//                             IF (TransactionHeader2."Customer No." = 'CUST-0000314') OR (TransactionHeader2."Customer No." = 'CUST-0000317') THEN BEGIN
//                                 IF Customer.GET(TransactionHeader2."Customer No.") THEN
//                                     Tendor_Name := Customer."Search Name";
//                             END;
//                         END;
//                         IF "Company Information".Name = 'Lovely Bake Studio' THEN BEGIN
//                             CLEAR(Customer);
//                             IF (TransactionHeader2."Customer No." = 'CUST-0000198') OR (TransactionHeader2."Customer No." = 'CUST-0000201') THEN BEGIN
//                                 IF Customer.GET(TransactionHeader2."Customer No.") THEN
//                                     Tendor_Name := Customer."Search Name";
//                             END;
//                         END;
//                         //    IF Customer.GET('CUST-0000314') THEN
//                         //      Tendor_Name:=Customer."Search Name";
//                         //       IF Customer.GET('CUST-0000317') THEN
//                         //      Tendor_Name:=Customer."Search Name";
//                     END;
//                 END;
//             end;

//             trigger OnPreDataItem()
//             begin
//                 SETFILTER("Transaction Header"."Refund Receipt No.", '<>%1', '');
//                 SETRANGE("Transaction Header".Date, StartDate, EndDate);
//                 IF StoreNo <> '' THEN
//                     SETRANGE("Transaction Header"."Store No.", StoreNo);
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//             area(content)
//             {
//                 field(StartDate; StartDate)
//                 {
//                     Caption = 'Start Date';
//                 }
//                 field(EndDate; EndDate)
//                 {
//                     Caption = 'End Date';
//                 }
//                 field(StoreNo; StoreNo)
//                 {
//                     Caption = 'StoreNo';
//                     TableRelation = Store.No.;
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

//     trigger OnInitReport()
//     begin
//         StartDate:=TODAY-1;
//         EndDate:=TODAY-1;
//     end;

//     var
//         StartDate: Date;
//         EndDate: Date;
//         TransactionHeader: Record "99001472";
//         Refunded_Amt: Decimal;
//         Bill_No: Code[20];
//         Store: Record "99001470";
//         Store_Name: Text;
//         TransPaymentEntry: Record "99001474";
//         Bill_Type: Code[20];
//         Tendor_type: Record "99001462";
//         Refunded_Date: Date;
//         Staff: Record "99001461";
//         First_Name: Text;
//         Refunded_First_Name: Text;
//         Tendor_Name: Text;
//         TransactionHeader2: Record "99001472";
//         Customer: Record "18";
//         StoreNo: Code[20];
//         Reufund_bill_type: Text;
//         ReasonCode: Text;
// }

