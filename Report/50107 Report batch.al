report 50107 "Purchase Order Batch"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'Purchase Order Batch';

    DefaultLayout = RDLC;
    ProcessingOnly = true;
    dataset
    {
        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            //RequestFilterFields = "No.";

            trigger OnAfterGetRecord()
            var
            //myInt:
            begin
                DeleteAll();
                //  LSCPodtedStatement.Reset();
                //  LSCPodtedStatement.SetRange();
            end;
        }
        dataitem("Detailed Vendor Ledg. Entry"; "Detailed Vendor Ledg. Entry")
        {
            //RequestFilterFields = "No.";

            trigger OnAfterGetRecord()
            var
            //myInt:
            begin
                DeleteAll();
                //  LSCPodtedStatement.Reset();
                //  LSCPodtedStatement.SetRange();
            end;
        }

        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            //RequestFilterFields = "No.";

            trigger OnAfterGetRecord()
            var
            //myInt:
            begin
                DeleteAll();
                //  LSCPodtedStatement.Reset();
                //  LSCPodtedStatement.SetRange();
            end;
        }
        dataitem("Detailed Cust. Ledg. Entry"; "Detailed Cust. Ledg. Entry")
        {
            //RequestFilterFields = "No.";

            trigger OnAfterGetRecord()
            var
            //myInt:
            begin
                DeleteAll();
                //  LSCPodtedStatement.Reset();
                //  LSCPodtedStatement.SetRange();
            end;
        }
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            //RequestFilterFields = "No.";

            trigger OnAfterGetRecord()
            var
            //myInt:
            begin
                DeleteAll();
                //  LSCPodtedStatement.Reset();
                //  LSCPodtedStatement.SetRange();
            end;
        }
        dataitem("Value Entry"; "Value Entry")
        {
            //RequestFilterFields = "No.";

            trigger OnAfterGetRecord()
            var
            //myInt:
            begin
                DeleteAll();
                //  LSCPodtedStatement.Reset();
                //  LSCPodtedStatement.SetRange();
            end;
        }
        dataitem("GST Ledger Entry"; "GST Ledger Entry")
        {
            //RequestFilterFields = "No.";

            trigger OnAfterGetRecord()
            var
            //myInt:
            begin
                DeleteAll();
                //  LSCPodtedStatement.Reset();
                //  LSCPodtedStatement.SetRange();
            end;
        }
        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
        {
            //RequestFilterFields = "No.";

            trigger OnAfterGetRecord()
            var
            //myInt:
            begin
                DeleteAll();
                //  LSCPodtedStatement.Reset();
                //  LSCPodtedStatement.SetRange();
            end;
        }
        dataitem("TDS Entry"; "TDS Entry")
        {
            //RequestFilterFields = "No.";

            trigger OnAfterGetRecord()
            var
            //myInt:
            begin
                DeleteAll();
                //  LSCPodtedStatement.Reset();
                //  LSCPodtedStatement.SetRange();
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;
                }
            }
        }
    }


    var
        myInt: Integer;
        LSCPodtedStatement: Record 99001485;

}