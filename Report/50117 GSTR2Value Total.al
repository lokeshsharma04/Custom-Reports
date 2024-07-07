report 50117 "GSTR All Reports"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    Caption = 'GSTR 2 Value';

    dataset
    {
        dataitem("Sales Invoice Line"; "Sales Invoice Line")
        {
            DataItemTableView = SORTING("Document No.", "Line No.") ORDER(Ascending) where("GST Group Code" = filter('0%'));
            trigger OnPreDataItem()
            begin
                // Customer.SetAutoCalcFields(Balance);
                SetRange("Posting date", StartDate, EndDate);
                MakeExcelDataHeaderGSTRB2B_lFnc();
            end;

            trigger OnAfterGetRecord()
            var
                Detailed: Record "Sales Invoice Line";
                SalCrmemoLine: Record "Sales Cr.Memo Line";
            begin
                Clear(SIH);
                Clear(SalCrmemoLine);

                SIH.Get("Sales Invoice Line"."Document No.");
                clear(Totalvalue);
                Detailed.reset;
                Detailed.SetRange("GST Group Code", "GST Group Code");
                Detailed.CalcSums(Amount);
                Totalvalue := Detailed.Amount;
                IF GSTGroup <> "GST Group Code" then begin
                    GSTGroup := "GST Group Code";
                    MakeExcelDataBodyGSTRB2B_lFnc();
                end;

            end;

            trigger OnPostDataItem()
            begin
                CreateExcelSheet('GST B2B', true);
            end;



        }
        dataitem("LSC Trans. Sales Entry"; "LSC Trans. Sales Entry")
        {
            DataItemTableView = sorting("Transaction No.", "Line No.") ORDER(Ascending) where("LSCIN GST Group Code" = filter('0%'));
            trigger OnPreDataItem()
            begin
                // Customer.SetAutoCalcFields(Balance);
                SetRange(Date, StartDate, EndDate);
                MakeExcelDataHeaderGSTRB2C_lFnc();
            end;

            trigger OnAfterGetRecord()
            var
                Detailed: Record "LSC Trans. Sales Entry";
                GSTGroup1: Code[20];


            begin
                clear(Totalvalue1);
                Detailed.reset;
                Detailed.SetRange("LSCIN GST Group Code", "LSCIN GST Group Code");
                Detailed.CalcSums("LSCIN GST Amount");
                Totalvalue1 := Detailed."LSCIN GST Amount";



                IF GSTGroup1 <> "LSC Trans. Sales Entry"."LSCIN GST Group Code" then begin
                    GSTGroup1 := "LSC Trans. Sales Entry"."LSCIN GST Group Code";
                    MakeExcelDataBodyGSTRB2C_lFnc();
                end;

            end;

            trigger OnPostDataItem()
            begin
                CreateExcelSheet('GST B2C', false);
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
                    ApplicationArea = Basic;
                }
                field(EndDate; EndDate)
                {
                    ApplicationArea = All;
                }
            }
        }

        actions
        {
        }
    }

    trigger OnInitReport()
    begin
        TempExcelBuffer.DeleteAll();
    end;



    trigger OnPostReport()
    begin
        CreateExcelBook();
    end;


    local procedure CreateExcelBook()
    var
        TempBlob_lCdu: Codeunit "Temp Blob";
    begin
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename(StrSubstNo('GSTR1_%1_%2%3', GSTRegNo_gCod, Month_gInt, Year_gInt));
        TempExcelBuffer.OpenExcel();
    end;

    procedure CreateExcelBook_Zip(var ExcelOutstream: OutStream)
    begin
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SaveToStream(ExcelOutstream, true)
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


    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        Month_gInt: Integer;
        Year_gInt: Integer;
        GSTRegNo_gCod: Text;
        GSTRCount_gInt: Integer;
        StartDate: Date;
        EndDate: Date;
        SalCrmemoLine: Record "Sales Cr.Memo Line";


    local procedure MakeExcelDataHeaderGSTRB2B_lFnc()
    begin
        TempExcelBuffer.NewRow;
        TempExcelBuffer.AddColumn('Gst Group Code', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn('Total Values', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn('Inter state supplier', false, '', true, false, true, '', TempExcelBuffer."cell type"::text);
        TempExcelBuffer.AddColumn('Description', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
    end;

    local procedure MakeExcelDataHeaderGSTRB2C_lFnc()
    begin
        TempExcelBuffer.NewRow;
        TempExcelBuffer.AddColumn('Gst Group Code', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn('Total Values', false, '', true, false, true, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn('Intera state supplier', false, '', true, false, true, '', TempExcelBuffer."cell type"::text);
    end;



    local procedure MakeExcelDataBodyGSTRB2B_lFnc()
    begin
        TempExcelBuffer.NewRow;
        TempExcelBuffer.AddColumn("Sales Invoice Line"."GST Group Code", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn(Totalvalue, false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn("Sales Invoice Line"."GST Jurisdiction Type", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn(SIH."GST Customer Type", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);

    end;

    local procedure MakeExcelDataBodyGSTRB2C_lFnc()
    begin
        TempExcelBuffer.NewRow;
        TempExcelBuffer.AddColumn("LSC Trans. Sales Entry"."LSCIN GST Group Code", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn(Totalvalue1, false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
        TempExcelBuffer.AddColumn("LSC Trans. Sales Entry"."LSCIN GST Jurisdiction Type", false, '', false, false, false, '', TempExcelBuffer."cell type"::Text);
    end;


    var
        Totalvalue: Decimal;
        GSTGroup: Code[20];
        SIH: Record "Sales Invoice Header";
        Totalvalue1: Decimal;




}

