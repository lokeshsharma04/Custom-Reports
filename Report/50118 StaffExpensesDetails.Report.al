Report 50118 "Petty Cash Expenses"
{
    RDLCLayout = 'Report/StaffExpensesDetails.rdl';
    DefaultLayout = RDLC;
    UsageCategory = Administration;
    ApplicationArea = All;


    dataset
    {
        dataitem("LSC Trans. Inc./Exp. Entry"; "LSC Trans. Inc./Exp. Entry")
        {
            DataItemTableView = sorting("Store No.", "POS Terminal No.", "Transaction No.", "Line No.") order(ascending) where("Account Type" = filter(Expense));
            RequestFilterFields = "Store No.", Date, "No.";
            //column(ReportForNavId_1000000000; 1000000000) {} // Autogenerated by ForNav - Do not delete
            // column(ReportForNav_Table99001475; ReportForNavWriteDataItem('Table99001475', "LSC Trans. Inc./Exp. Entry")) { }
            column(ReceiptNo_TransIncomeExpenseEntry; "LSC Trans. Inc./Exp. Entry"."Receipt  No.")
            {
            }
            column(Amount_TransIncomeExpenseEntry; "LSC Trans. Inc./Exp. Entry".Amount)
            {
            }
            column(Date_TransIncomeExpenseEntry; "LSC Trans. Inc./Exp. Entry".Date)
            {
            }
            column(StoreNo_TransIncomeExpenseEntry; "LSC Trans. Inc./Exp. Entry"."Store No.")
            {

            }
            column(StaffID_TransIncomeExpenseEntry; "LSC Trans. Inc./Exp. Entry"."Staff ID")
            { }
            column(StaffName; StaffName)
            { }
            column(compname; compinfo.Name)
            {
            }
            column(compadd; compinfo.Address)
            {
            }
            column(StoreName; StoreName)
            {

            }
            column(PettyCashLbl; PettyCashLbl)
            { }
            column(comppic; compinfo.Picture)
            {
            }
            column(compinfo_City; compinfo.City)
            {
            }
            column(C_PostCode; compinfo."Post Code")
            {
            }
            column(Comp_GST; compinfo."GST Registration No.")
            {
            }
            column(ExpenseDesc; ExpenDesc)
            {
            }
            column(Remarks; Remarks)
            {
            }
            trigger OnPreDataItem();
            begin
                compinfo.Get;
                compinfo.CalcFields(compinfo.Picture);
                StoreFilter := "LSC Trans. Inc./Exp. Entry".GetFilters();
                if gDate <> 0D then
                    "LSC Trans. Inc./Exp. Entry".SetRange(Date, gDate);
                //ReportForNav.OnPreDataItem('Table99001475',"LSC Trans. Inc./Exp. Entry");
            end;

            trigger OnAfterGetRecord();
            begin
                if Store.Get("LSC Trans. Inc./Exp. Entry"."Store No.") then;
                StoreName := Store.Name;
                if Staff.Get("LSC Trans. Inc./Exp. Entry"."Staff ID") then;
                StaffName := Staff."First Name";

                ExpenseAccount.Reset;
                Clear(ExpenDesc);
                ExpenseAccount.SetRange("Store No.", "LSC Trans. Inc./Exp. Entry"."Store No.");
                ExpenseAccount.SetRange("No.", "LSC Trans. Inc./Exp. Entry"."No.");
                if ExpenseAccount.FindFirst() then
                    ExpenDesc := ExpenseAccount.Description;
                RecInfocode.Reset;
                Clear(Remarks);
                RecInfocode.SetRange("Store No.", "Store No.");
                RecInfocode.SetRange("Transaction No.", "Transaction No.");
                RecInfocode.SetRange("Staff ID", "Staff ID");
                RecInfocode.SetRange("Line No.", "Line No.");
                RecInfocode.SetFilter(RecInfocode."Transaction Type", '%1', RecInfocode."transaction type"::"Income/Expense Entry");
                if RecInfocode.FindSet then
                    Remarks := RecInfocode.Information;
            end;

        }
    }

    requestpage
    {


        SaveValues = false;
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(ForNavOpenDesigner; ReportForNavOpenDesigner)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Design';
                        Visible = ReportForNavAllowDesign;
                    }
                }
            }
        }

        actions
        {
        }
    }
    var
        compinfo: Record "Company Information";
        ExpenseAccount: Record 99001476;
        ExpenDesc: Text[250];
        Remarks: Text[500];
        RecInfocode: Record 99001478;
        Get: Text[250];
        StoreFilter: Text[250];
        Store: Record 99001470;
        Staff: Record 99001461;
        gDate: Date;
        PettyCashLbl: Label 'Petty Cash Expenses';
        StaffName: Text[100];
        StoreName: Text[50];

    procedure GetDetails(lDate: Date)
    begin
        gDate := lDate;
    end;

    trigger OnInitReport();
    begin
        //;ReportsForNavInit;
    end;

    trigger OnPreReport();
    begin
        //;ReportsForNavPre;
    end;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //	ReportForNav: Codeunit "ForNAV Report Management";
        ReportForNavTotalsCausedBy: Integer;
        ReportForNavInitialized: Boolean;
        ReportForNavShowOutput: Boolean;
        ReportForNavOpenDesigner: Boolean;
        [InDataSet]
        ReportForNavAllowDesign: Boolean;

    //local procedure ReportsForNavInit() var id: Integer; begin Evaluate(id, CopyStr(CurrReport.ObjectId(false), StrPos(CurrReport.ObjectId(false), ' ') + 1)); ReportForNav.OnInit(id, ReportForNavAllowDesign); end;
    //local procedure ReportsForNavPre() begin if ReportForNav.LaunchDesigner(ReportForNavOpenDesigner) then CurrReport.Quit(); end;
    local procedure ReportForNavSetTotalsCausedBy(value: Integer)
    begin
        ReportForNavTotalsCausedBy := value;
    end;

    local procedure ReportForNavSetShowOutput(value: Boolean)
    begin
        ReportForNavShowOutput := value;
    end;
    //local procedure ReportForNavInit(jsonObject : JsonObject) begin ReportForNav.Init(jsonObject, CurrReport.ObjectId); end;
    local procedure ReportForNavWriteDataItem(dataItemId: Text; rec: Variant): Text
    var
        values: Text;
        jsonObject: JsonObject;
        currLanguage: Integer;
    begin
        if not ReportForNavInitialized then begin
            //	ReportForNavInit(jsonObject);
            ReportForNavInitialized := true;
        end;

        case (dataItemId) of
        end;
        //ReportForNav.AddDataItemValues(jsonObject,dataItemId,rec);
        jsonObject.WriteTo(values);
        exit(values);
    end;
    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
