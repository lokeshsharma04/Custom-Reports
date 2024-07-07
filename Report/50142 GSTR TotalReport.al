report 50142 "GSTR Total"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        // dataitem("Sales Invoice Header"; "Sales Invoice Header")
        // {
        //     DataItemTableView = where("GST Customer Type" = filter(Registered));
        dataitem("Sales Invoice Line"; "Sales Invoice Line")
        {
            //DataItemLink = "Document No." = field("No.");
            DataItemTableView = SORTING("Document No.", "Line No.") ORDER(Ascending) where("GST Group Code" = filter('0%'));

            trigger OnPreDataItem()
            begin
                // Customer.SetAutoCalcFields(Balance);

                SetRange("Posting date", StartDate, EndDate);
                MakeExcelDataHeaderGSTRB2B_lFnc();
                // Message('%1', "Sales Invoice Line".Count);
                i := 1;
            end;

            trigger OnAfterGetRecord()
            var
                Detailed: Record "Sales Invoice Line";
            begin
                Clear(SIH);
                SIH.Get("Sales Invoice Line"."Document No.");

                clear(Totalvalue);

                Detailed.CalcFields("GSt Customer Type");
                //  Detailed.SetRange("GSt Customer Type", "GSt Customer Type"::Registered); 
                Detailed.SetRange("Posting date", StartDate, EndDate);
                Detailed.SetRange("GST Group Code", "GST Group Code");
                Detailed.CalcSums(Amount);
                // Detailed.reset;
                // Detailed.SetRange("GST Group Code", "GST Group Code");
                // Detailed.SetRange("GST Jurisdiction Type", Detailed."GST Jurisdiction Type"::Interstate);
                // Detailed.CalcSums(Amount);
                Totalvalue += Detailed.Amount;
                // IF GSTGroup <> "GST Group Code" then begin
                //     GSTGroup := "GST Group Code";
                //     MakeExcelDataBodyGSTRB2B_lFnc();
                // end;
                IF i = 1 Then begin
                    TempExcelBuffer.NewRow;
                    TempExcelBuffer.AddColumn("Sales Invoice Line"."GST Group Code", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
                    TempExcelBuffer.AddColumn(Totalvalue, false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
                    TempExcelBuffer.AddColumn("Sales Invoice Line"."GST Jurisdiction Type", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
                    TempExcelBuffer.AddColumn(SIH."GST Customer Type", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
                    // TempExcelBuffer.AddColumn("sales invoice line"."Net amaount",false,'',false,false,false,'',TempExcelBuffer."cell type"::text);
                    i += 1;
                end;

                // clear(Totalvalue1);
                // Detailed.reset;
                // Detailed.SetRange("GST Group Code", "GST Group Code");
                // Detailed.SetRange("GST Jurisdiction Type", Detailed."GST Jurisdiction Type"::Intrastate);
                // Detailed.CalcSums(Amount);
                // Totalvalue1 := Detailed.Amount;
                // IF GSTGroup1 <> "GST Group Code" then begin
                //     GSTGroup1 := "GST Group Code";
                //     MakeExcelDataBodyGSTRB2B1_lFnc();
                // end;

            end;

            trigger OnPostDataItem()
            begin
                CreateExcelSheet('GST B2B', true);
            end;

            // }

        }
        dataitem("LSC Trans. Sales Entry"; "LSC Trans. Sales Entry")
        {
            DataItemTableView = sorting("Transaction No.", "Line No.") ORDER(Ascending) where("LSCIN GST Group Code" = filter('0%'));
            trigger OnPreDataItem()
            begin
                // Customer.SetAutoCalcFields(Balance);
                SetRange("date", StartDate, EndDate);
                MakeExcelDataHeaderGSTRB2C_lFnc();
                i := 1;

            end;

            trigger OnAfterGetRecord()
            var
                Detailed: Record "LSC Trans. Sales Entry";
                GroupLsc: Code[20];

            begin
                clear(Totalvalue);
                Detailed.reset;
                Detailed.SetRange("LSCIN GST Group Code", "LSCIN GST Group Code");
                Detailed.SetRange(Date, StartDate, EndDate);
                // Detailed.SetRange("LSCIN GST Jurisdiction Type", Detailed."LSCIN GST Jurisdiction Type"::Interstate);
                Detailed.CalcSums("Net Amount");
                Totalvalue += Detailed."Net Amount";




                //  MakeExcelDataBodyGSTRB2C_lFnc();
                IF i = 1 Then begin
                    TempExcelBuffer.NewRow;
                    TempExcelBuffer.AddColumn("LSC Trans. Sales Entry"."LSCIN GST Group Code", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
                    TempExcelBuffer.AddColumn(Totalvalue, false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
                    TempExcelBuffer.AddColumn("LSC Trans. Sales Entry"."LSCIN GST Jurisdiction Type", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
                    TempExcelBuffer.AddColumn('UnRegister', false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
                    //  Message('%1', "LSC Trans. Sales Entry"."LSCIN GST Group Code");
                    i += 1;
                end;
            End;

            // clear(Totalvalue1);
            // Detailed.reset;
            // Detailed.SetRange("LSCIN GST Group Code", "LSCIN GST Group Code");
            // Detailed.SetRange("LSCIN GST Jurisdiction Type", Detailed."LSCIN GST Jurisdiction Type"::Intrastate);
            // Detailed.CalcSums("Net Amount");
            // Totalvalue1 := Detailed."Net Amount";
            // IF GSTGroup1 <> "LSCIN GST Group Code" then begin
            //     GSTGroup1 := "LSCIN GST Group Code";
            //     MakeExcelDataBodyGSTRB2C1_lFnc();
            // end;
            // end;

            trigger OnPostDataItem()
            begin
                CreateExcelSheet1('GST B2C', false);
            end;



        }
        // dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
        // {
        //     DataItemTableView = ORDER(Ascending) where("GST Group Code" = filter('GST00'));
        //     trigger OnPreDataItem()
        //     begin
        //         // Customer.SetAutoCalcFields(Balance);
        //         SetRange("Posting date", StartDate, EndDate);
        //         MakeExcelDataHeaderGSTRB2C_lFnc();
        //     end;

        //     trigger OnAfterGetRecord()
        //     var
        //         Detailed: Record "Detailed GST Ledger Entry";
        //     begin
        //         clear(Totalvalue);
        //         Detailed.reset;
        //         Detailed.SetRange("GST Group Code", "GST Group Code");
        //         Detailed.CalcSums("GST Amount");
        //         Totalvalue := Detailed."GST Amount";
        //         IF GSTGroup <> "GST Group Code" then begin
        //             GSTGroup := "GST Group Code";
        //             MakeExcelDataBodyGSTRB2C_lFnc();
        //         end;
        //         "Detailed GST Ledger Entry".SetFilter("GST Customer Type", '%1', "GST Customer Type"::Unregistered);


        //     end;

        //     trigger OnPostDataItem()
        //     begin
        //         CreateExcelSheet1('GST B2C', true);
        //     end;



        // }


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
                    ApplicationArea = All;
                    Caption = 'Start Date';
                }
                field(EndDate; EndDate)
                {
                    ApplicationArea = All;
                    Caption = 'End Date';
                }
            }
        }

        actions
        {
        }
    }
    trigger OnPostReport()
    begin
        CreateExcelBook();
    end;

    local procedure MakeExcelDataHeaderGSTRB2B_lFnc()
    begin
        TempExcelBuffer.NewRow;
        TempExcelBuffer.AddColumn('Gst Group Code', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn('Net Amaunt', false, '', true, false, true, '', TempExcelBuffer."cell type"::text);
        TempExcelBuffer.AddColumn('Total Values', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn('Inter state supplier', false, '', true, false, true, '', TempExcelBuffer."cell type"::text);
        TempExcelBuffer.AddColumn('Description', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);

        // TempExcelBuffer.AddColumn('registered',false,'',true,false,true,'',TempExcelBuffer."cell type"::text);
        // TempExcelBuffer.AddColumn('un-');
    end;

    local procedure MakeExcelDataHeaderGSTRB2C_lFnc()
    begin
        TempExcelBuffer.NewRow;
        TempExcelBuffer.AddColumn('Gst Group Code', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn('Net Amaunt', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn('Total Values', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn('Inter state supplier', false, '', true, false, true, '', TempExcelBuffer."cell type"::text);
        TempExcelBuffer.AddColumn('Description', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);

        // TempExcelBuffer.AddColumn('registered',false,'',true,false,true,'',TempExcelBuffer."cell type"::text);
        // TempExcelBuffer.AddColumn('un-');
    end;

    local procedure MakeExcelDataBodyGSTRB2C_lFnc()

    var
        BankAcc_lRec: Record "Bank Account";
        Vendor_lRec: Record Vendor;
        Customer_lRec: Record Customer;
        FixedAsset_lRec: Record "Fixed Asset";
        AmtDrLCY_lDec: Decimal;
        AmtCrLCY_lDec: Decimal;
    begin
        TempExcelBuffer.NewRow;
        TempExcelBuffer.AddColumn("LSC Trans. Sales Entry"."LSCIN GST Group Code", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn("LSC Trans. Sales Entry"."Net Amount", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn("LSC Trans. Sales Entry"."LSCIN GST Jurisdiction Type", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn('UnRegister', false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
        //  Message('%1', "LSC Trans. Sales Entry"."LSCIN GST Group Code");
    end;

    local procedure MakeExcelDataBodyGSTRB2C1_lFnc()

    var
        BankAcc_lRec: Record "Bank Account";
        Vendor_lRec: Record Vendor;
        Customer_lRec: Record Customer;
        FixedAsset_lRec: Record "Fixed Asset";
        AmtDrLCY_lDec: Decimal;
        AmtCrLCY_lDec: Decimal;
    begin
        TempExcelBuffer.NewRow;
        TempExcelBuffer.AddColumn("LSC Trans. Sales Entry"."LSCIN GST Group Code", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn(Totalvalue1, false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn("LSC Trans. Sales Entry"."LSCIN GST Jurisdiction Type", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn('UnRegister', false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
    end;

    local procedure MakeExcelDataBodyGSTRB2B_lFnc()

    var
        BankAcc_lRec: Record "Bank Account";
        Vendor_lRec: Record Vendor;
        Customer_lRec: Record Customer;
        FixedAsset_lRec: Record "Fixed Asset";
        AmtDrLCY_lDec: Decimal;
        AmtCrLCY_lDec: Decimal;
    begin
        TempExcelBuffer.NewRow;
        TempExcelBuffer.AddColumn("Sales Invoice Line"."GST Group Code", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn(Totalvalue, false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn("Sales Invoice Line"."GST Jurisdiction Type", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn(SIH."GST Customer Type", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
        // // TempExcelBuffer.AddColumn("sales invoice line"."Net amaount",false,'',false,false,false,'',TempExcelBuffer."cell type"::text);

    end;

    local procedure MakeExcelDataBodyGSTRB2B1_lFnc()

    var
        BankAcc_lRec: Record "Bank Account";
        Vendor_lRec: Record Vendor;
        Customer_lRec: Record Customer;
        FixedAsset_lRec: Record "Fixed Asset";
        AmtDrLCY_lDec: Decimal;
        AmtCrLCY_lDec: Decimal;
    begin
        TempExcelBuffer.NewRow;
        TempExcelBuffer.AddColumn("Sales Invoice Line"."GST Group Code", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn(Totalvalue1, false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn("Sales Invoice Line"."GST Jurisdiction Type", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn(SIH."GST Customer Type", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
        // TempExcelBuffer.AddColumn("sales invoice line"."Net amaount",false,'',false,false,false,'',TempExcelBuffer."cell type"::text);

    end;

    local procedure CreateExcelSheet(SheetName: Text[250]; NewBook: Boolean)
    begin
        if NewBook then
            TempExcelBuffer.CreateNewBook(SheetName)
        else
            TempExcelBuffer.SelectOrAddSheet(SheetName);
        TempExcelBuffer.WriteSheet(SheetName, CompanyName, UserId);
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.ClearNewRow();
    end;

    local procedure CreateExcelSheet1(SheetName: Text[250]; NewBook: Boolean)
    begin
        if NewBook then
            TempExcelBuffer.CreateNewBook(SheetName)
        else
            TempExcelBuffer.SelectOrAddSheet(SheetName);
        TempExcelBuffer.WriteSheet(SheetName, CompanyName, UserId);
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.ClearNewRow();
    end;

    local procedure CreateExcelBook()
    var
        TempBlob_lCdu: Codeunit "Temp Blob";
    begin
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename(StrSubstNo('GSTR1_%1_%2%3', GSTRegNo_gCod, Month_gInt, Year_gInt));
        TempExcelBuffer.OpenExcel();
    end;

    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        Month_gInt: Integer;
        Year_gInt: Integer;
        GSTRegNo_gCod: Text;
        i: Integer;
        GSTRCount_gInt: Integer;
        Totalvalue: Decimal;
        StartDate: Date;
        EndDate: Date;
        GSTGroup: Code[20];
        GSTGroup1: Code[20];
        SIH: Record "Sales Invoice Header";

        Totalvalue1: Decimal;

    procedure SetJustFillData_gFnc(Month_iInt: Date; Year_iInt: Date)
    begin
        StartDate := Month_iInt;
        EndDate := Year_iInt;
    end;

    procedure CreateExcelBook_Zip(var ExcelOutstream: OutStream)
    begin
        TempExcelBuffer.CloseBook();
        // TempExcelBuffer.SetFriendlyFilename(StrSubstNo('GSTR1_%1_%2%3', GSTRegNo_gCod, Month_gInt, Year_gInt));

        // TempBlob_lCdu.CreateOutStream(ExcelOutstream);
        TempExcelBuffer.SaveToStream(ExcelOutstream, true)

    end;

}
