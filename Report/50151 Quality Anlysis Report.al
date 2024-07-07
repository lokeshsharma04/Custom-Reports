report 50151 "Quaility Analysis"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report/Quaility Analysis.rdl';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem("Quality Header"; "Quality Header")
        {
            column(No_; "No.")
            {
            }
            column(QC_Done_By; "QC Done By")
            { }
            column(PO_No_; "PO No.")
            { }
            column(Quality_Date; "Quality Date")
            { }
            column(Reason_For_Rejeection; "Reason For Rejeection")
            { }
            column(Remarks; Remarks)
            { }
            column(PODateRec; PODateRec)
            { }
            dataitem("Quality Line"; "Quality Line")
            {
                DataItemLink = "No." = field("No.");
                DataItemLinkReference = "Quality Header";
                DataItemTableView = where("QTY to be Received " = filter(<> 0));
                column(DocNo_; "No.")
                { }
                column(Item_No_; "Item No.")
                { }
                column(Item_Description; "Item Description")
                { }
                column(QTY_in_PO; "QTY in PO")
                { }
                column(QTY_to_be_Received_; "QTY to be Received ")
                { }
                column(Quality_Remarks; "Quality Remarks")
                { }
                column(Rejected; Rejected)
                { }
                column(Accepted; Accepted)
                { }
                column(Parameter; Parameter)
                { }
                column(ParameterDescription; ParameterDescription)
                { }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    /////// Item Parameters
                    Clear(Parameter);
                    Clear(ParameterDescription);
                    ItemParameterRec.Reset();
                    ItemParameterRec.SetRange("item No.", "Quality Line"."Item No.");
                    //ItemParameterRec.SetCurrentKey("Line No.",ItemParameterRec."Line No.");
                    if ItemParameterRec.FindSet() then begin
                        repeat
                            Parameter += ItemParameterRec.Parameter + '' + ',';
                            ParameterDescription += ItemParameterRec.Description + '' + ',';
                        until ItemParameterRec.Next() = 0;

                    end;
                    //Message('%1..%2', ParameterDescription, Parameter);
                end;

            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                Clear(PurchaseHeaderRec);
                Clear(PODateRec);
                PurchaseHeaderRec.Reset();
                PurchaseHeaderRec.SetRange("No.", "Quality Header"."PO No.");
                if PurchaseHeaderRec.FindFirst() then
                    PODateRec := PurchaseHeaderRec."Posting Date";
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
                    // field(Name; SourceExpression)
                    // {
                    //     ApplicationArea = All;

                    // }
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
        PurchaseHeaderRec: Record "Purchase Header";
        PODateRec: Date;
        ItemParameterRec: Record "Item Peramiter";
        QCStandred: Text[250];
        Parameter: Text[250];
        ParameterDescription: Text[250];
}