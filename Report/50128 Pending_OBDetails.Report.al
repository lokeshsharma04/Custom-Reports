Report 50128 Pending_OBDetails
{
    RDLCLayout = 'Report/Pending_OBDetails.rdl';
    DefaultLayout = RDLC;
    UsageCategory = Administration;
    ApplicationArea = all;

    dataset
#pragma warning disable
    {
        dataitem("POS Transaction"; 99008980)
        {
            // CalcFields = "Order Packing Instruction";
            RequestFilterFields = "Store No.", "Trans. Date";
            column(ReportForNavId_1120174000; 1120174000) { } // Autogenerated by ForNav - Do not delete
                                                              //column(ReportForNav_Table99008980; ReportForNavWriteDataItem('Table99008980',99008980)) {}
            column(CompName; CompanyInformation.Name)
            {
            }
            column(Staff; "POS Transaction"."Staff ID")
            {
            }
            column(RcptNo; "POS Transaction"."Receipt No.")
            {

            }
            column(OrderDt; Format("POS Transaction"."Trans. Date"))
            {
            }
            column(Ordertime; Format("POS Transaction"."Trans Time"))
            {
            }
            column(netAmt; "POS Transaction"."Net Amount")
            {
            }
            column(GrossAmt; "POS Transaction"."Gross Amount")
            {
            }
            column(LineDisc; "POS Transaction"."Line Discount")
            {
            }
            column(TotDisc; "POS Transaction"."Total Discount")
            {
            }
            column(GSTAmt; "POS Transaction"."LSCIN GST Amount")
            {
            }//PT
            column(DeliveryDate; Format("POS Transaction"."Order Delivery Date"))
            {
            }
            column(DeliveryType; Format("POS Transaction"."Order Delivery Type"))
            {
            }
            column(DeliveryTime; Format("POS Transaction"."Order Delivery Time"))
            {
            }
            column(Instr; "POS Transaction"."Order Packing Instruction")
            {
            }
            column(Filters; "POS Transaction".GetFilters)
            {
            }
            dataitem("POS Trans. Line"; 99008981)
            {
                DataItemLink = "Receipt No." = field("Receipt No.");
                DataItemTableView = sorting("Receipt No.", "Line No.");
                // column(ReportForNavId_1120174001; 1120174001) {} // Autogenerated by ForNav - Do not delete
                // column(ReportForNav_Table99008981; ReportForNavWriteDataItem('Table99008981',99008981)) {}
                column(ItemNo; "POS Trans. Line".Number)
                {
                }
                column(StoreNo; "Store No.")
                {

                }
                column(SName; Store.Name)
                {

                }
                column(Desc; "POS Trans. Line".Description)
                {
                }
                column(Price; "POS Trans. Line".Price)
                {
                }
                column(Qty; ROUND("POS Trans. Line".Quantity, 0.01))
                {
                }
                column(Amt; "POS Trans. Line".Amount)
                {
                }
                column(EntryStatus; "POS Trans. Line"."Entry Status")
                {
                }
                trigger OnPreDataItem();
                begin
                    //	ReportForNav.OnPreDataItem('Table99008981',99008981);
                    Clear(SGST);
                    Clear(CGST);
                    //Clear(SubTotal);
                    Clear(GstRate);
                    Clear(GSTAmount);
                    Clear(IGSTamount);
                    Clear(SGSTAmount);
                    Clear(CGSTamount);
                    GSTSetup.Get();
                    TaxTransValue.SetRange("Tax Type", GSTSetup."GST Tax Type");
                    TaxTransValue.SetRange("Tax Record ID", "POS Transaction".RecordId());
                    TaxTransValue.SetRange("Value Type", TaxTransValue."Value Type"::COMPONENT);
                    TaxTransValue.SetFilter(Percent, '<>%1', 0);
                    if TaxTransValue.FindSet() then
                        repeat
                            TaxComponentName := TaxTransValue.GetAttributeColumName();
                            case TaxComponentName of
                                'IGST':
                                    begin
                                        IGST := TaxTransValue.Percent;
                                        evaluate(IGSTAmount, TaxTransValue."Column Value");
                                    end;
                                'CGST':
                                    begin
                                        evaluate(CGSTAmount, TaxTransValue."Column Value");
                                        CGST := TaxTransValue.Percent;
                                    end;
                                'SGST':
                                    begin
                                        evaluate(SGSTAmount, TaxTransValue."Column Value");
                                        SGST := TaxTransValue.Percent;
                                    end;

                            end;
                            Message('%1', SGSTAmount);


                        until TaxTransValue.Next() = 0;
                    // GstRate := CGST + SGST + IGST;
                    GSTAmount := SGSTAmount + CGSTAmount + IGSTAmount;

                end;

                trigger OnAfterGetRecord();
                begin
                    if Store.Get("POS Transaction"."Store No.") then;

                end;

            }
            trigger OnPreDataItem();
            begin
                //	ReportForNav.OnPreDataItem('Table99008980',99008980);
            end;

            trigger OnAfterGetRecord();
            begin

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
                    // field(ForNavOpenDesigner;ReportForNavOpenDesigner)
                    // {
                    // 	ApplicationArea = Basic;
                    // 	Caption = 'Design';
                    // 	Visible = ReportForNavAllowDesign;
                    // }
                }
            }
        }

        actions
        {
        }
    }

    trigger OnPreReport()
    begin
        CompanyInformation.Get;
        //;ReportsForNavPre;

    end;

    var
        Store: Record 99001470;
        CompanyInformation: Record "Company Information";
        TaxTransValue: Record "LSCIN Tax Transaction Value";//PT
        GSTSetup: Record "GST Setup";//PT
        TaxComponentName: Text;//PT
        SGSTAmount: Decimal;//PT
        CGSTAmount: Decimal;//PT
        IGSTAmount: Decimal;//PT
        CGST: Decimal;//PT
        SGST: Decimal;//PT
        IGST: Decimal;//PT
        GstRate: Decimal;//PT
        GSTAmount: Decimal;


    trigger OnInitReport();
    begin
        //;ReportsForNavInit;
    end;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
    // 	ReportForNav: Codeunit "ForNAV Report Management";
    // 	ReportForNavTotalsCausedBy: Integer;
    // 	ReportForNavInitialized: Boolean;
    // 	ReportForNavShowOutput: Boolean;
    // 	ReportForNavOpenDesigner: Boolean;
    // 	[InDataSet]
    // 	ReportForNavAllowDesign: Boolean;

    // local procedure ReportsForNavInit() var id: Integer; begin Evaluate(id, CopyStr(CurrReport.ObjectId(false), StrPos(CurrReport.ObjectId(false), ' ') + 1)); ReportForNav.OnInit(id, ReportForNavAllowDesign); end;
    // local procedure ReportsForNavPre() begin if ReportForNav.LaunchDesigner(ReportForNavOpenDesigner) then CurrReport.Quit(); end;
    // local procedure ReportForNavSetTotalsCausedBy(value : Integer) begin ReportForNavTotalsCausedBy := value; end;
    // local procedure ReportForNavSetShowOutput(value : Boolean) begin ReportForNavShowOutput := value; end;
    // local procedure ReportForNavInit(jsonObject : JsonObject) begin ReportForNav.Init(jsonObject, CurrReport.ObjectId); end;
    // local procedure ReportForNavWriteDataItem(dataItemId: Text; rec : Variant) : Text
    // var
    // 	values: Text;
    // 	jsonObject: JsonObject;
    // 	currLanguage: Integer;
    // begin
    // 	if not ReportForNavInitialized then begin
    // 		ReportForNavInit(jsonObject);
    // 		ReportForNavInitialized := true;
    // 	end;

    // 	case (dataItemId) of
    // 		'Table99008980':
    // 			begin                                                                                                                       //.CurrentKey//
    // 				currLanguage := GlobalLanguage; GlobalLanguage := 1033; jsonObject.Add('DataItem$Table99008980$CurrentKey$Text',99008980); GlobalLanguage := currLanguage;
    // 			end;
    // 	end;
    // 	ReportForNav.AddDataItemValues(jsonObject,dataItemId,rec);
    // 	jsonObject.WriteTo(values);
    // 	exit(values);
    // end;
    // // Reports ForNAV Autogenerated code - do not delete or modify -->
}
