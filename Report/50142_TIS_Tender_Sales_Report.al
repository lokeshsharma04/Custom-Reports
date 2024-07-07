//chetan_Fbts 
report 50170 "Tender_Sales Report"
{

    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'Tender Sales Report';

    RDLCLayout = 'Layout/50142_Tender_Sales.rdl';

    dataset
    {
        dataitem(LSCStore; "LSC Store")
        {
            RequestFilterFields = "No.";
            column(Store_Name; Name) { }

            column(FromDate; FORMAT(FromDate)) { }
            column(ToDate; FORMAT(ToDate)) { }
            column(Date_Month; "Date Month") { }
            dataitem(LSCTransactionHeader; "LSC Transaction Header")
            {
                DataItemLink = "Store No." = field("No.");
                column(Staff_ID; "Staff ID")
                {

                }
                column(Income_Exp__Amount; Incom_PyamnAmout) { }
                column(Date; FORMAT(Date)) { }
                column(Rounded; Rounded_Amount) { }


                dataitem("LSC Trans. Sales Entry"; "LSC Trans. Sales Entry")
                {
                    DataItemLink = "Store No." = field("Store No."),
                    "POS Terminal No." = field("POS Terminal No."),
                    "Transaction No." = field("Transaction No.");

                    column(Net_Amount; "Net Amount") { }
                    column(LSCIN_GST_Amount; "LSCIN GST Amount") { }

                    trigger OnPreDataItem()
                    var
                        myInt: Integer;
                    begin
                        if (FromDate <> 0D) and (ToDate <> 0D) then
                            SetRange(Date, FromDate, ToDate);
                    end;

                }

                dataitem("LSC Trans. Payment Entry"; "LSC Trans. Payment Entry")
                {
                    DataItemLink = "Store No." = field("Store No."),
                    "POS Terminal No." = field("POS Terminal No."),
                    "Transaction No." = field("Transaction No.");

                    column(Amount_Tendered; "Amount Tendered") { }
                    column(TenderName; TenderName) { }

                    trigger OnPreDataItem()
                    var
                        myInt: Integer;
                    begin
                        if (FromDate <> 0D) and (ToDate <> 0D) then
                            SetRange(Date, FromDate, ToDate);
                    end;

                    trigger OnAfterGetRecord()
                    var
                        myInt: Integer;
                    begin
                        TenderName := '';
                        LSCTenderType.Get("LSC Trans. Payment Entry"."Store No.", "LSC Trans. Payment Entry"."Tender Type");
                        TenderName := LSCTenderType.Description;
                    end;
                }

                trigger OnPreDataItem()
                var
                    myInt: Integer;
                begin
                    if (FromDate <> 0D) and (ToDate <> 0D) then
                        SetRange(Date, FromDate, ToDate);
                end;

                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    "Date Month" := '';
                    "Date Month" := FORMAT(Date, 0, '<WeekDay Text>');

                    Incom_PyamnAmout := 0;
                    Rounded_Amount := 0;
                    Trans_Header.Reset();
                    Trans_Header.SetRange(Date, LSCTransactionHeader.Date);
                    Trans_Header.SetRange("Store No.", LSCTransactionHeader."Store No.");
                    Trans_Header.SetRange("POS Terminal No.", LSCTransactionHeader."POS Terminal No.");
                    if Trans_Header.FindSet() then begin
                        repeat
                            // Rounded_Amount += Trans_Header_Rec.Rounded;
                            if Trans_Header."Sales Type" = 'PREPAYMENT' then
                                Incom_PyamnAmout += Trans_Header."Income/Exp. Amount";
                        until Trans_Header.Next() = 0;
                    end;
                end;


            }

            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                // SetRange("Responsibility Center", REtial_Responsible);
            end;

        }
    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group("Date Filter")
                {
                    field(FromDate; FromDate)
                    {
                        ApplicationArea = All;
                    }
                    field(ToDate; ToDate)
                    {
                        ApplicationArea = All;
                    }

                }
            }
        }
    }
    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        // RetialUserSetup.Get(UserId);
        // REtial_Responsible := RetialUserSetup."Sales Resp. Ctr. Filter";
    end;

    var
        "Date Month": Text[50];
        RetialUserSetup: Record "LSC Retail User";
        REtial_Responsible: Code[20];
        FromDate: Date;
        ToDate: Date;
        LSCTenderType: Record "LSC Tender Type";
        TenderName: Text[50];
        Trans_Header: Record "LSC Transaction Header";
        Trans_Header_Rec: Record "LSC Transaction Header";
        Incom_PyamnAmout: Decimal;
        Rounded_Amount: Decimal;
}
