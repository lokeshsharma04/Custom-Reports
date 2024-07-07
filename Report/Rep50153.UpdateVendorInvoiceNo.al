Report 50194 "Ven. Inv. Update Batch"
{
    DefaultLayout = RDLC;
    PreviewMode = PrintLayout;
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Vendor Invoice Update Batch';
    ApplicationArea = all;


    RDLCLayout = './Layouts/Ven. Inv. Update Batch.rdlc';
    Permissions = TableData 17 = rimd,
                  TableData 25 = rim,
                  TableData 32 = rimd,
                  TableData 120 = rim,
                  TableData 122 = rim,
                  TableData 5802 = rim,
               tabledata "Detailed GST Ledger Entry" = rimd,
               tabledata "GST Ledger Entry" = rimd;

    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {


            column(ReportForNavId_1120174000; 1120174000)
            {
            }
            dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
            {
                column(ReportForNavId_1120174001; 1120174001)
                {
                }
                dataitem("G/L Entry"; "G/L Entry")
                {
                    column(ReportForNavId_1120174002; 1120174002)
                    {
                    }
                    dataitem("Value Entry"; "Value Entry")
                    {
                        column(ReportForNavId_1120174003; 1120174003)
                        {
                        }
                        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
                        {
                            column(ReportForNavId_1120174004; 1120174004)
                            {
                            }
                            dataitem("Item Ledger Entry"; "Item Ledger Entry")
                            {
                                column(ReportForNavId_1120174005; 1120174005)
                                {
                                }
                                trigger OnAfterGetRecord()
                                begin
                                    "Item Ledger Entry"."External Document No." := VenInvNo;
                                    "Item Ledger Entry".Modify;
                                end;

                                trigger OnPreDataItem()
                                begin
                                    SetRange("Document No.", DocumentNo);
                                    // IF NOT FINDFIRST
                                    //  THEN CurrReport.SKIP;
                                end;
                            }

                            trigger OnAfterGetRecord()
                            begin
                                "Purch. Rcpt. Header"."Vendor Shipment No." := VenInvNo;
                                "Purch. Rcpt. Header".Modify;
                            end;

                            trigger OnPreDataItem()
                            begin
                                SetRange("No.", DocumentNo);
                                // IF NOT FINDFIRST
                                //  THEN CurrReport.SKIP;
                            end;
                        }
                        dataitem("GST Ledger Entry"; "GST Ledger Entry")
                        {
                            column(Document_No_; "Document No.")
                            {

                            }
                            trigger OnAfterGetRecord()
                            begin
                                "GST Ledger Entry"."External Document No." := VenInvNo;
                                "GST Ledger Entry".Modify;
                                //  Message('%1', "GST Ledger Entry"."External Document No.");
                            end;

                            trigger OnPreDataItem()
                            begin
                                SetRange("Document No.", DocumentNo);
                            end;

                        }
                        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
                        {
                            column(Document_No_1; "Document No.")
                            {

                            }

                            trigger OnAfterGetRecord()
                            begin
                                "Detailed GST Ledger Entry"."External Document No." := VenInvNo;
                                "Detailed GST Ledger Entry".Modify;
                                //  Message('%1', "Detailed GST Ledger Entry"."External Document No.");
                            end;

                            trigger OnPreDataItem()
                            begin
                                SetRange("Document No.", DocumentNo);
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            "Value Entry"."External Document No." := VenInvNo;
                            "Value Entry".Modify;
                        end;

                        trigger OnPreDataItem()
                        begin
                            SetRange("Document No.", DocumentNo);
                            // IF NOT FINDFIRST
                            //  THEN CurrReport.SKIP;
                        end;
                    }

                    trigger OnAfterGetRecord()
                    begin
                        "G/L Entry"."External Document No." := VenInvNo;
                        "G/L Entry".Modify;
                    end;

                    trigger OnPreDataItem()
                    begin
                        SetRange("Document No.", DocumentNo);
                        // IF NOT FINDFIRST
                        //  THEN CurrReport.SKIP;
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    "Vendor Ledger Entry"."External Document No." := VenInvNo;
                    "Vendor Ledger Entry".Modify;
                end;

                trigger OnPreDataItem()
                begin
                    SetRange("Document No.", DocumentNo);
                    // IF NOT FINDFIRST
                    //  THEN CurrReport.SKIP;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                "Purch. Inv. Header"."Vendor Invoice No." := VenInvNo;
                "Purch. Inv. Header".Modify;
            end;

            trigger OnPreDataItem()
            begin
                SetRange("No.", DocumentNo);
                // IF NOT FINDFIRST
                //  THEN CurrReport.SKIP;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Document No."; DocumentNo)
                {
                    ApplicationArea = Basic;
                }
                field("Ven. Inv. No."; VenInvNo)
                {
                    ApplicationArea = Basic;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        UserSetRec.Reset();
        UserSetRec.Get(UserId);
        if UserSetRec.UpdateDocNo = false then
            Error('You do not have Permision to Run This Report');

    end;

    var
        DocumentNo: Code[20];
        VenInvNo: Code[20];
        UserSetRec: Record "User Setup";

}

