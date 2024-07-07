report 50100 "Purchase Order Report"
{
#pragma warning disable
    // FB_Pratham-AShish- New Report created for Purchase Order.
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/Purchase Order Report.rdl';


    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            RequestFilterFields = "No.";

            column(GSTCompAmount2; GSTCompAmount[2])
            {
            }
            column(Comments_l; Comments_l)
            {
            }
            column(Expiry_Date; "Expiry Date")
            { }
            column(GSTCompAmount3; GSTCompAmount[3])
            {
            }
            column(GSTCompAmount4; GSTCompAmount[4])
            {
            }
            column(GSTCompPer; GSTCompPer[2])
            {
            }
            column(GSTCompPer2; GstPer)
            {
            }
            column(GSTCompPer3; GSTCompPer[3])
            {

            }
            column(GSTCompPer4; GSTCompPer[4])
            {

            }
            column(PatTremCode; PatTremCode)
            {
            }
            column(Locadd1; Locadd1)
            {
            }
            column(VenCon; Vendorrec.Contact)
            {
            }
            column(BuyerID_PurchaseHeader; '')// "Purchase Header"."Buyer ID")
            {
            }
            column(AppID; AppID)
            {
            }
            column(GstVendotType; GstVendotType)
            {
            }
            column(LocAdd; LocAdd)
            {
            }
            column(FassaiNo; FassaiNo)
            {

            }
            column(LocAdd2; LocAdd2)
            {
            }
            column(PostCode; PostCode)
            {
            }
            column(LocCity; LocCity)
            {
            }
            column(LocEmail; LocEmail)
            { }
            column(LocationName; LocationName)
            {
            }
            column(LocationAddress; LocationAddress)
            { }
            column(LocationCity; LocationCity)
            { }
            column(LocationPhone; LocationPhone)
            { }
            column(LocationEmail; LocationEmail)
            { }
            column(LocationGstRegNo; LocationGstRegNo)
            { }

            column(LocHoPhone2; LocHoPhone2)
            {
            }
            column(LocHOPhone; LocHOPhone)
            {
            }
            column(LocStateCode; LocStateCode)
            {
            }
            column(PaymentMethodCode_PurchaseHeader; "Purchase Header"."Payment Method Code")
            {
            }
            column(PaymentTermsCode_PurchaseHeader; "Purchase Header"."Payment Terms Code")
            {
            }
            column(Frieght; Frieght)
            {
            }
            column(total; Total)
            {
            }
            column(RevText; RevText)
            {
            }
            column(No_PurchaseHeader; "Purchase Header"."No.")
            {
            }
            column(OrderDate_PurchaseHeader; FORMAT("Purchase Header"."Order Date", 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }
            column(PostingDate_PurchaseHeader; Tdate)
            {
            }
            column(GSTREGNo; tgCompInfo."GST Registration No.")
            {
            }
            column(tgCompInfo_Name; tgCompInfo.Name)
            {
            }
            column(tgCompInfo_Address; tgCompInfo.Address + '  ' + tgCompInfo."Address 2")
            {
            }
            column(CompInfo_City_Pstcode; tgCompInfo.City + tgCompInfo."Post Code")//+ ', ' + tgCompInfo.State + ' - '
            {
            }
            column(CompInfo_Ph; ComIn."Phone No.")
            {
            }
            column(CompInfo_Email; tgCompInfo."E-Mail")
            {
            }
            column(companyPic; tgCompInfo.Picture)
            {
            }
            column(companyGstNo; tgCompInfo."GST Registration No.")
            {
            }
            column(tgCompInfo_Email; '')// tgCompInfo."Purchase E-Mail")
            {
            }
            column(locaName; RecLocation.Name)
            { }
            column(LocAddress; tgCompInfo.Address + ', ' + Loc."Address 2")
            {
            }
            column(LocName; Loc.Name)
            { }
            column(LocCityPinCode; RecLocation.City + ', ' + RecLocation."Post Code" + ',' + RecLocation."State Code")
            {
            }
            column(LocPhoneNo; RecLocation."Phone No." + ', ' + RecLocation."Phone No. 2")
            {
            }
            column(LocWebsite; RecLocation."Home Page")
            { }

            column(LocGSTsTATE; LocGSTsTATE)
            {
            }
            column(EmailLocation; RecLocation."E-Mail")
            {
            }
            column(LocGstIN; LocGstIN)
            {
            }
            column(LOcState; LocState)
            {
            }
            column(VendorTin; VendorTin)
            {
            }
            column(VendState; VendState)
            {
            }
            column(VenState; VenState)
            {
            }
            column(VendPAN; VendPAN)
            {
            }
            column(Vendor_No; "Purchase Header"."Buy-from Vendor No.")
            {
            }
            column(RequestedReceiptDate_PurchaseHeader; "Purchase Header"."Requested Receipt Date")
            {
            }
            column(BuyfromVendorName_PurchaseHeader; "Purchase Header"."Buy-from Vendor Name")
            {
            }
            column(BuyfromAddress_PurchaseHeader; "Purchase Header"."Buy-from Address")
            {
            }
            column(BuyfromAddress2_PurchaseHeader; "Purchase Header"."Buy-from Address 2")
            {
            }
            column(BuyfromCity_PurchaseHeader; "Purchase Header"."Buy-from City")
            {
            }
            column(CurrencyCode_PurchaseHeader; "Purchase Header"."Currency Code")
            {
            }
            column(ShiptoPostCode_PurchaseHeader; "Purchase Header"."Ship-to Post Code")
            {
            }
            column(ShiptoCounty_PurchaseHeader; "Purchase Header"."Ship-to County")
            {
            }
            column(tgCompInfoRegistrationNo; tgCompInfo."Registration No.")
            {
            }
            column(tgCompInfoTINNo; '')// tgCompInfo."T.I.N. No.")
            {
            }
            column(VendorOrderNo_PurchaseHeader; "Purchase Header"."Vendor Order No.")
            {
            }
            column(tgCompInfoCERegistrationNo; '')// tgCompInfo."E.C.C. No.")
            {
            }
            column(tgCompInfoCERange; '')// tgCompInfo."C.E. Range")
            {
            }
            column(tgCompInfoCECommissionerate; '')// tgCompInfo."C.E. Commissionerate")
            {
            }
            column(tgCompInfoCEDivision; '')// tgCompInfo."C.E. Division")
            {
            }
            column(FormCStatus; FormCStatus)
            {
            }
            column(ComHomepage; tgCompInfo."Home Page")
            {
            }
            column(tgCompInfoLogo1; tgCompInfo.Picture)
            {
            }
            column(PaymentTerms; PaymentTerms)
            {
            }
            column(tgCompInfoCity; tgCompInfo.City)
            {
            }
            column(tgCompInfoPostCode; tgCompInfo."Post Code")
            {
            }
            column(tgCompInfoPhoneNo; tgCompInfo."Phone No.")
            {
            }
            column(email; tgCompInfo."E-Mail")
            {
            }
            column(CinNo; '')// tgCompInfo."Company Registration  No.")
            {
            }
            column(tgPhoneNo; tgCompInfo."Phone No.")
            {
            }
            column(tgPhone2; tgCompInfo."Phone No. 2")
            {
            }
            column(tgCountry; tgCompInfo.County)
            {
            }
            column(gstnoCompany; tgCompInfo."GST Registration No.")
            {
            }
            column(tgCompInfoPANNo; tgCompInfo."P.A.N. No.")
            {
            }
            column(tgCompInfoServiceTaxRegistrationNo; '')// tgCompInfo."Service Tax Registration No.")
            {
            }
            column(Address; Address)
            {
            }
            column(City; City)
            {
            }
            column(Country; Country)
            {
            }
            column(TransportDetails; TransportDetails)
            {
            }
            column(DeliveryTerms_PurchaseHeader; '')
            {
            }
            column(BuyfromPostCode_PurchaseHeader; "Purchase Header"."Buy-from Post Code")
            {
            }
            column(BuyfromCounty_PurchaseHeader; "Purchase Header"."Buy-from County")
            {
            }
            column(BuyfromCountryRegionCode_PurchaseHeader; "Purchase Header"."Buy-from Country/Region Code")
            {
            }
            column(BuyfromVendorName2_PurchaseHeader; "Purchase Header"."Buy-from Vendor Name 2")
            {
            }
            column(BuyfromContact_PurchaseHeader; "Purchase Header"."Buy-from Contact")
            {
            }
            column(ShiptoName_PurchaseHeader; "Purchase Header"."Ship-to Name")
            {
            }
            column(ShiptoName2_PurchaseHeader; "Purchase Header"."Ship-to Name 2")
            {
            }
            column(ShiptoAddress_PurchaseHeader; "Purchase Header"."Ship-to Address")
            {
            }
            column(ShiptoAddress2_PurchaseHeader; "Purchase Header"."Ship-to Address 2")
            {
            }
            column(ShiptoCity_PurchaseHeader; "Purchase Header"."Ship-to City")
            {
            }
            column(Comments; Comments)
            {
            }
            column(ExpectedReceiptDate_PurchaseHeader; FORMAT("Purchase Header"."Expected Receipt Date", 0, 1))
            {
            }
            column(FreightName; FreightName)
            {
            }
            column(InvoiceDiscountAmount_PurchaseHeader; "Purchase Header"."Invoice Discount Amount")
            {
            }
            column(Import; Import)
            {
            }
            column(Domestic; Domestic)
            {
            }
            column(Consignor; Consignor)
            {
            }
            column(CurrencyCode; tgCurrCode)
            {
            }
            column(NumberLineAmount; NumberLineAmount[1])
            {
            }
            column(BlanketOrderNo_PurchaseHeader; '')// "Purchase Header"."Blanket Order No.")
            {
            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.")
                                    WHERE(Quantity = FILTER(> 0));
                column(FreightNew; 0)// "Purchase Line"."FA Freight Charges")
                {
                }
                column(Othercharges; 0)//"Purchase Line"."FA Other Charges")
                {
                }
                column(Insurance; 0)// "Purchase Line"."FA Insurance")
                {
                }
                column(Type; "Purchase Line".Type)
                {
                }
                column(HSNSACCode_PurchaseLine; "Purchase Line"."HSN/SAC Code")
                {
                }
                column(GstRate; GstRate)
                { }
                column(No_PurchaseLine; "Purchase Line"."No.")
                {
                }
                column(GST_Group_Code; "GST Group Code")
                { }
                column(Description_PurchaseLine; "Purchase Line".Description + ' ' + Desc2)
                {
                }
                column(Description2_PurchaseLine; "Purchase Line"."Description 2")
                {
                }
                column(Quantity_PurchaseLine; "Purchase Line".Quantity)
                {
                }
                column(DirectUnitCost_PurchaseLine; "Purchase Line"."Direct Unit Cost")
                {
                }
                column(LineAmount_PurchaseLine; "Purchase Line".Amount)
                {
                }
                column(LineDiscount_PurchaseLine; "Purchase Line"."Line Discount Amount")
                {
                }
                column(MRP; 0)//"Purchase Line".LRP)
                {
                }
                column(Comment_PurchaseLine; '')// "Purchase Line".Comment)
                {
                }
                column(Brand; '')//RecItem."Brand Code")
                {
                }
                column(EAN_Code; "Barcode No.")
                {
                }
                column(CGSTAmount; CGSTAmount)
                { }
                column(SGSTAmount; SGSTAmount)
                { }
                column(CGST; CGST)
                { }
                column(SGST; SGST)
                { }
                column(TotalTax; TotalTax)
                { }
                column(BlDate; BlDate)
                {
                }
                column(TotGstAmt; TotGstAmt)
                {
                }
                column(ChargesAmount; ChargesAmount)
                {
                }
                column(TotGstCode; GstCode1)
                {
                }
                column(TotGstPercent; GstPercent)
                {
                }
                column(GstPercentSGST1; GstPercent1)
                {
                }
                column(TotGstAmtSGST1; TotGstAmt1)
                {
                }
                column(TotGstAmtIGST2; TotGstAmt2)
                {
                }
                column(GstPercentIGST2; GstPercent2)
                {
                }
                column(SerialNo; "SerialNo.")
                {
                }
                column(UnitPriceLCY_PurchaseLine; "Purchase Line"."Unit Price (LCY)")
                {
                }
                column(Tax_PurchaseLine; 0)// "Purchase Line"."Tax %")
                {
                }
                column(TaxBaseAmount_PurchaseLine; 0)// "Purchase Line"."Tax Base Amount")
                {
                }
                column(UnitofMeasureCode_PurchaseLine; "Purchase Line"."Unit of Measure Code")
                {
                }
                column(Warranty; Warranty)
                {
                }
                column(CustomerName; CustomerName)
                {
                }
                column(CustomerPONo; CustomerPONo)
                {
                }
                column(BlanketOrderNo_PurchaseLine; "Purchase Line"."Blanket Order No.")
                {
                }
                column(DeliveryDate_PurchaseLine; 0)// "Purchase Line"."QC Remarks")
                {
                }
                column(LineDiscountAmount_PurchaseLine; "Purchase Line"."Line Discount Amount")
                {
                }
                column(ecess; CessPer)
                {
                }
                column(shecess; "shecess%")
                {
                }
                column(ExciseDuty; ExciseDuty)
                {
                }
                column(GST_PurchaseLine; 0)// ROUND("Purchase Line"."GST %", 1))
                {
                }
                column(BEDAmount_PurchaseLine; 0)// "Purchase Line"."BED Amount")
                {
                }
                column(eCessAmount_PurchaseLine; 0)// "Purchase Line"."eCess Amount")
                {
                }
                column(SHECessAmount_PurchaseLine; CESSAMT)//"Purchase Line"."SHE Cess Amount")
                {
                }
                column(ADCVATAmount_PurchaseLine; 0)// "Purchase Line"."ADC VAT Amount")
                {
                }
                column(TaxAmount_PurchaseLine; 0)// "Purchase Line"."Tax Amount")
                {
                }
                column(PageNoCap; 'Page No.: ')
                {
                }
                column(ServiceTaxAmount_PurchaseLine; 0)// "Service Tax Amount" + "Service Tax eCess Amount" + "Service Tax SHE Cess Amount")
                {
                }
                column(ADCVAT; ADCVAT)
                {
                }
                column(SGSTPer; SGSTPer)
                {
                }
                column(SGSTAmt; SGSTAmt)
                {
                }
                column(CGSTPer; CGSTPer)
                {
                }
                column(CGSTAmt; CGSTAmt)
                {
                }
                column(IGSTPer; IGSTPer)
                {
                }
                column(IGSTAmt; IGSTAmt)
                {
                }
                // dataitem("<Purch. Comment Line1>"; "Purch. Comment Line")
                // {
                //     DataItemLink = "No." = FIELD("Document No."),
                //                    "Document Line No." = FIELD("Line No.");
                //     DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.")
                //                         WHERE(
                //                               Comment = FILTER(<> ''));//("Document Line No." = FILTER(<> 0),
                //     column(Comment_PurchCommentLine1; "<Purch. Comment Line1>".Comment)
                //     {
                //     }
                // }
                dataitem(RoundLoop; Integer)
                {
                    column(IGSTAmt_; Purchasetemporary.Amount)
                    {

                    }
                    column(IGSTPer_; Purchasetemporary."Line Discount %")
                    {

                    }

                    trigger OnPreDataItem()
                    var
                        myInt: Integer;
                    begin
                        SetRange(number, 1, Purchasetemporary.Count);
                    end;

                    trigger OnAfterGetRecord()
                    var
                        myInt: Integer;
                    begin
                        if Number = 1 then
                            Purchasetemporary.Find('-')
                        else
                            Purchasetemporary.Next();
                    end;

                }
                trigger OnAfterGetRecord()
                var
                    SL_lRec: Record "Purchase Line";
                    SubTotal_lDec: Decimal;
                    j: Integer;
                    DecValueEval_lDec: Decimal;
                    CLE_lRec: Record "Vendor Ledger Entry";
                    TotalAmtInWords_lTxt: Text;
                    DocumentGSTAmt_lDec: Decimal;
                    NoText: array[2] of Text[500];
                    TaxTrnasactionValue: Record "Tax Transaction Value";
                    TaxTrnasactionValue1: Record "Tax Transaction Value";
                    LineDiscAmt_lDec: Decimal;
                    GSTCompNo: Integer;
                    TotalAMt: Decimal;
                begin
                    CLEAR("Barcode No.");
                    IF RecItem.GET("Purchase Line"."No.") THEN;
                    IF FixedAsset.GET("Purchase Line"."No.") THEN;


                    GST := 0;// ROUND("Purchase Line"."GST %");
                    IF "No." <> '' THEN
                        "SerialNo." += 1;

                    ///////////////////////////////////Pratham
                    Clear(IGST);
                    Clear(SGST);
                    Clear(CGST);
                    Clear(CESSAMT);
                    Clear(GstRate);
                    Clear(TotalTax);
                    Clear(IGSTamount);
                    Clear(SGSTAmount);
                    Clear(CGSTamount);
                    GSTSetup.Get();
                    TaxTransValue.SetRange("Tax Type", GSTSetup."GST Tax Type");
                    TaxTransValue.SetRange("Tax Record ID", "Purchase Line".RecordId());
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
                        until TaxTransValue.Next() = 0;
                    TaxTransValue.SetRange("Tax Type", GSTSetup."Cess Tax Type");
                    TaxTransValue.SetRange("Tax Record ID", "Purchase Line".RecordId());
                    TaxTransValue.SetRange("Value Type", TaxTransValue."Value Type"::COMPONENT);
                    TaxTransValue.SetFilter(Percent, '<>%1', 0);
                    if TaxTransValue.FindSet() then
                        repeat
                            TaxComponentName := TaxTransValue.GetAttributeColumName();
                            case TaxComponentName of
                                'CESS':
                                    begin
                                        evaluate(CESSAMT, TaxTransValue."Column Value");
                                        CessPer := TaxTransValue.Percent;
                                    end;
                            end;
                        until TaxTransValue.Next() = 0;


                    GstRate := CGST + SGST + IGST;
                    TotalTax := CGSTAmount + SGSTAmount + IGSTAmount;



                    //Ashish -->Start
                    Purchasetemporary.Reset();
                    Purchasetemporary.DeleteAll();
                    Clear(GSTComponentCodeName);
                    Clear(GSTCompAmount);
                    Clear(GSTCompPer);
                    Clear(GSTComponentCode);
                    Clear(GSTCode_gCodArr);
                    // SL_lRec.Reset;
                    // SL_lRec.SetRange("Document Type", "Purchase Header"."Document Type");
                    // SL_lRec.SetRange("Document No.", "Purchase Header"."No.");
                    // SL_lRec.SetRange("System-Created Entry", false);
                    // SL_lRec.SetFilter(Amount, '<>%1', 0);
                    // if SL_lRec.FindSet then begin
                    //     repeat
                    GSTCompNo := 1;
                    TaxTrnasactionValue.Reset();
                    TaxTrnasactionValue.SetRange("Tax Record ID", "Purchase Line".RecordId);
                    TaxTrnasactionValue.SetRange("Tax Type", 'GST');
                    TaxTrnasactionValue.SetRange("Value Type", TaxTrnasactionValue."Value Type"::COMPONENT);
                    TaxTrnasactionValue.SetFilter(Amount, '<>%1', 0);
                    if TaxTrnasactionValue.FindSet() then
                        repeat
                            GSTCompNo := TaxTrnasactionValue."Value ID";
                            GSTComponentCode[GSTCompNo] := TaxTrnasactionValue."Value ID";
                            TaxTrnasactionValue1.Reset();
                            TaxTrnasactionValue1.SetRange("Tax Record ID", "Purchase Line".RecordId);
                            TaxTrnasactionValue1.SetRange("Tax Type", 'GST');
                            TaxTrnasactionValue1.SetRange("Value Type", TaxTrnasactionValue1."Value Type"::COMPONENT);
                            TaxTrnasactionValue1.SetRange("Value ID", GSTComponentCode[GSTCompNo]);
                            if TaxTrnasactionValue1.FindSet() then begin
                                repeat
                                    GSTCompAmount[GSTCompNo] += TaxTrnasactionValue1."Amount";
                                    GSTCompPer[GSTCompNo] += TaxTrnasactionValue1.Percent;
                                until TaxTrnasactionValue1.Next() = 0;
                                GSTCompNo += 1;
                            end;
                        until TaxTrnasactionValue.Next() = 0;



                    Purchasetemporary.Init();
                    Purchasetemporary."Document Type" := SL_lRec."Document Type";
                    Purchasetemporary."Document No." := SL_lRec."Document No.";
                    Purchasetemporary."Line No." := SL_lRec."Line No.";
                    Purchasetemporary.Amount := GSTCompAmount[3];
                    Purchasetemporary."Line Discount %" := GSTCompPer[3];
                    Purchasetemporary.Insert();
                    //   until SL_lRec.Next = 0;
                    //      end;

                    //Ashish<--END

                    GSTFunction;
                    "Purchase Header".CalcFields("Amount Including VAT");
                    Total := ROUND("Purchase Header"."Amount Including VAT" + GSTCompAmount[2] + GSTCompAmount[2] + GSTCompAmount[3], 1, '=');
                    //PT   // inWord.InitTextVariable;
                    //PT   // inWord.FormatNoText(NumberLineAmount, ABS(Total), "Purchase Header"."Currency Code");
                    /*
                    RecItem.RESET;
                    RecSalesHeader.RESET;
                    IF RecItem.GET("No.") THEN;
                    //  Warranty := RecItem."MAX Quantity";
                    
                    RecSalesHeader.SETRANGE(RecSalesHeader."No.","Project Code Without Dimension");
                    IF RecSalesHeader.FINDFIRST THEN BEGIN
                      CustomerName := RecSalesHeader."Sell-to Customer Name";
                      CustomerPONo := RecSalesHeader."Current Net Total";
                    END;
                    */
                    /* //BNB
                    recExcise.SETRANGE(recExcise."Excise Bus. Posting Group","Purchase Line"."Excise Bus. Posting Group");
                    recExcise.SETRANGE(recExcise."Excise Prod. Posting Group","Purchase Line"."Excise Prod. Posting Group");
                    recExcise.SETFILTER("From Date",'<=%1',"Purchase Header"."Posting Date");
                    IF recExcise.FINDFIRST THEN BEGIN
                      "ecess%" := recExcise."eCess %";
                      "shecess%" := recExcise."SHE Cess %";
                      ExciseDuty := recExcise."BED %";
                      ADCVAT  := recExcise."ADC VAT %"
                    END;
                    */ // BNB
                       ///
                    Desc2 := '';
                    IF PrintforSpareParts THEN
                        Desc2 := "Purchase Line"."Description 2"
                    ELSE
                        Desc2 := '';
                    ///
                    /*
                    TgItem.RESET;
                    IF Type = Type::Item THEN
                    TgItem.GET("No.");
                     //MJ
                      IF PurchHD.GET(PurchHD."Document Type"::"Blanket Order","Purchase Line"."Blanket Order No.") THEN
                       BlDate:=PurchHD."Document Date";
                       */

                    //MJ GST

                    /* //TRI HG CODE BLOCK START
                    DetGstEntryBuffer.RESET;
                    DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."Document No.","Document No." );
                    //DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."Line No.","Purchase Line"."Line No.");
                    DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."GST Component Code",'CGST');
                    IF DetGstEntryBuffer.FINDSET THEN BEGIN
                       CLEAR(TotGstAmt);
                       CLEAR(GstPercent);
                       CLEAR(GstCode1);
                     REPEAT
                     TotGstAmt+=DetGstEntryBuffer."GST Amount";
                     GstCode1:=DetGstEntryBuffer."GST Component Code";
                     GstPercent:=DetGstEntryBuffer."GST %";
                     UNTIL DetGstEntryBuffer.NEXT=0;
                    // MESSAGE('%1', GstPercent);
                    // MESSAGE('%1',  TotGstAmt);
                    END;
                    
                    
                    
                    DetGstEntryBuffer.RESET;
                    DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."Document No.","Document No." );
                    //DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."Line No.","Purchase Line"."Line No.");
                    DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."GST Component Code",'SGST');
                    IF DetGstEntryBuffer.FINDSET THEN BEGIN
                       CLEAR(TotGstAmt1);
                       CLEAR(GstPercent1);
                       CLEAR(GstCode2);
                     REPEAT
                     TotGstAmt1+=DetGstEntryBuffer."GST Amount";
                     GstCode2:=DetGstEntryBuffer."GST Component Code";
                     GstPercent1:=DetGstEntryBuffer."GST %";
                     UNTIL DetGstEntryBuffer.NEXT=0;
                    END;
                    
                    DetGstEntryBuffer.RESET;
                    DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."Document No.","Document No." );
                    //DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."Line No.","Purchase Line"."Line No.");
                    DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."GST Component Code",'IGST');
                    IF DetGstEntryBuffer.FINDSET THEN BEGIN
                       CLEAR(TotGstAmt2);
                       CLEAR(GstPercent2);
                       CLEAR(GstCode3);
                     REPEAT
                     TotGstAmt2+=DetGstEntryBuffer."GST Amount";
                     GstCode3:=DetGstEntryBuffer."GST Component Code";
                     GstPercent2:=DetGstEntryBuffer."GST %";
                     UNTIL DetGstEntryBuffer.NEXT=0;
                    END;
                    */ //TRI HG END CODE BLOCK

                    //END;
                    //InvoiceLineType := Type;

                    /*
                    //mj
                    ChargesAmount := 0;
                    //OtherTaxesAmount := 0;
                    IF "No." <> '' THEN BEGIN
                    StructureLineDetails.RESET;
                    StructureLineDetails.SETRANGE(Type,StructureLineDetails.Type::Sale);
                    StructureLineDetails.SETRANGE("Document Type",StructureLineDetails."Document Type"::Invoice);
                    //StructureLineDetails.SETRANGE("Invoice No.","Document No.");
                    //StructureLineDetails.SETRANGE("Item No.","No.");
                    //StructureLineDetails.SETRANGE("Line No.","Line No.");
                    IF StructureLineDetails.FIND('-') THEN
                      REPEAT
                        IF NOT StructureLineDetails."Payable to Third Party" THEN BEGIN
                          IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::Charges THEN
                            ChargesAmount := ChargesAmount + ABS(StructureLineDetails."Calculation Value");
                          //IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"Other Taxes" THEN
                            //OtherTaxesAmount := OtherTaxesAmount + ABS(StructureLineDetails.Amount);
                        END;
                      UNTIL StructureLineDetails.NEXT = 0;
                     END;
                    //InvoiceLineType := Type;
                       */

                    //TRI HG 260718
                    CLEAR(IGSTAmt);
                    CLEAR(IGSTPer);
                    CLEAR(SGSTAmt);
                    CLEAR(SGSTPer);
                    CLEAR(CGSTAmt);
                    CLEAR(CGSTPer);
                    DetGstEntryBuffer.RESET;
                    DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."Document No.", "Document No.");
                    DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."No.", "Purchase Line"."No.");
                    IF DetGstEntryBuffer.FINDFIRST THEN
                        REPEAT
                            IF DetGstEntryBuffer."GST Component Code" = 'IGST' THEN BEGIN
                                IGSTAmt := DetGstEntryBuffer."GST Amount";
                                IGSTPer := DetGstEntryBuffer."GST %";
                            END;
                            IF DetGstEntryBuffer."GST Component Code" = 'SGST' THEN BEGIN
                                SGSTAmt := DetGstEntryBuffer."GST Amount";
                                SGSTPer := DetGstEntryBuffer."GST %";
                            END;
                            IF DetGstEntryBuffer."GST Component Code" = 'CGST' THEN BEGIN
                                CGSTAmt := DetGstEntryBuffer."GST Amount";
                                CGSTPer := DetGstEntryBuffer."GST %";
                            END;
                        UNTIL DetGstEntryBuffer.NEXT = 0;

                    //TRI YM 31122018
                    // Ashish Start
                    // FreightNew += "Purchase Line"."FA Freight Charges";
                    // Insurance += "Purchase Line"."FA Insurance";
                    // Othercharges += "Purchase Line"."FA Other Charges";
                    // Ashish END
                    //TRI YM 31122018

                end;

                trigger OnPreDataItem()
                begin
                    //    CurrReport.CREATETOTALS("Purchase Line"."FA Freight Charges", "Purchase Line"."FA Insurance", "Purchase Line"."FA Other Charges");
                end;
                //   }

            }
            dataitem("Purch. Comment Line"; "Purch. Comment Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"),
                               "No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.")
                                    WHERE("Document Line No." = FILTER(0),
                                          Comment = FILTER(<> ''));
                column(Comment_PurchCommentLine; "Purch. Comment Line".Comment)
                {
                }
                column(Slc; Slc)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Slc += 1;
                end;
            }

            trigger OnAfterGetRecord()
            var
                SalesCommentLine: Record "Purch. Comment Line";
            begin
                location_g.Reset();
                location_g.SetRange(Code, "Location Code");
                if location_g.FindFirst() then begin
                    FassaiNo := location_g."Fassi Code";
                    LocationName := location_g.Name;
                    LocationCity := location_g.City;
                    LocationAddress := location_g.Address;
                    LocationEmail := location_g."E-Mail";
                    LocationPhone := location_g."Phone No.";
                    LocationGstRegNo := location_g."GST Registration No.";
                end;




                Comments_l := '';
                SalesCommentLine.Reset();
                SalesCommentLine.SetRange("No.", "No.");
                IF SalesCommentLine.FindFirst() then
                    repeat
                        Comments_l += '<br>' + SalesCommentLine.Comment;
                    until SalesCommentLine.Next() = 0;


                CLEAR(LocAdd);
                CLEAR(LocAdd2);
                CLEAR(LocationCode);
                CLEAR(LocStateCode);
                CLEAR(PostCode);
                CLEAR(City);
                CLEAR(LocHoPhone2);
                CLEAR(LocHOPhone);
                CLEAR(Vendorrec);
                IF Vendorrec.GET("Purchase Header"."Buy-from Vendor No.") THEN;
                RecLocation.RESET;
                // RecLocation.SETRANGE(Code,"Purchase Header"."Location Code");  //TRI.HIM 22.06.18
                IF RecLocation.FINDFIRST THEN BEGIN
                    LocAdd := RecLocation.Address;
                    LocationName := RecLocation.Name;
                    LocAdd2 := RecLocation."Address 2";
                    LocCity := RecLocation.City;
                    PostCode := RecLocation."Post Code";
                    LocStateCode := RecLocation."State Code";
                    LocHOPhone := RecLocation."Phone No.";
                    LocHoPhone2 := RecLocation."Phone No. 2";
                    //  LocEmail:=RecLocation."E-Mail";

                END;
                //TRI MK

                IF Recstate.GET(RecLocation."State Code") THEN LocStateCode := Recstate.Description;

                //MJTRI
                IF Original THEN TextA := 'For Consignee';
                IF Duplicate THEN TextA := 'For Transporter';
                IF Triplicate THEN TextA := 'For Consigner';
                //MJTRI
                Frieght := '';
                /*IF "Purchase Header"."Short Closed" THEN Frieght:= 'Inclusive'
                ELSE Frieght:='Exclusive';*/ //TRI AS 130818 BLOCKED

                //Ashish Start 
                // IF "Purchase Header"."Order Type" = "Purchase Header"."Order Type"::FA THEN
                //     Frieght := 'Exclusive'
                // ELSE
                //Ashish END
                Frieght := 'Inclusive'; //TRI AS 130818 ADD
                Locadd1 := '';
                Loc.RESET;
                //Ashish Loc.SETRANGE(Code, "Location Code");
                IF Loc.FINDFIRST THEN BEGIN
                    LocGstIN := Loc."GST Registration No.";
                    LocGSTsTATE := Loc."State Code";
                    Locadd1 := Loc.Address;
                    StateRec.RESET;
                    //Ashish  StateRec.SETRANGE(Code, Loc."State Code");
                    IF StateRec.FINDFIRST THEN
                        LocState := StateRec."State Code (GST Reg. No.)";
                END;
                // TRI MK for terms & cindition print
                Purchcomment.RESET;
                Purchcomment.SETRANGE(Purchcomment."Document Type", Purchcomment."Document Type"::Order);
                Purchcomment.SETRANGE(Purchcomment."No.", "No.");
                IF Purchcomment.FINDSET THEN BEGIN
                END;

                RecVendor.RESET;
                IF RecVendor.GET("Buy-from Vendor No.") THEN BEGIN
                    VendorTin := RecVendor."GST Registration No.";
                    VendNo := RecVendor."No.";
                    VendState := RecVendor."State Code";
                    VendPAN := RecVendor."P.A.N. No.";
                    PatTremCode := RecVendor."Payment Terms Code";

                    // StateRec.RESET;
                    // //Ashish StateRec.SETRANGE(Code, RecVendor."State Code");
                    // IF StateRec.FINDFIRST THEN
                    //     VenState := StateRec."State Code (GST Reg. No.)";
                END;


                //Ashish // IF "Purchase Header"."C Form" = TRUE THEN
                //     FormCStatus := 'Yes'
                // ELSE
                FormCStatus := 'No';

                IF RecPaymentTerms.GET("Payment Terms Code") THEN
                    PaymentTerms := RecPaymentTerms.Description;

                RecOrderAddress.RESET;
                IF RecOrderAddress.GET(RecOrderAddress.Code) THEN BEGIN
                    Address := RecOrderAddress.Address + RecOrderAddress."Address 2";
                    City := RecOrderAddress.City;
                    Country := RecOrderAddress."Country/Region Code";
                END;

                IF RecTransportMethod.GET("Purchase Header"."Transport Method") THEN
                    TransportDetails := RecTransportMethod.Description;
                RecComments.Reset();
                RecComments.SETRANGE(RecComments."Document Type", "Purchase Header"."Document Type");
                RecComments.SETRANGE(RecComments."No.", "Purchase Header"."No.");
                IF RecComments.FINDFIRST THEN
                    Comments := RecComments.Comment;


                ChargesAmount := 0;
                //OtherTaxesAmount := 0;
                //Ashish
                // IF "No." <> '' THEN BEGIN
                //     StructureLineDetails.RESET;
                //     StructureLineDetails.SETRANGE(Type, StructureLineDetails.Type::Purchase);
                //     StructureLineDetails.SETRANGE("Document Type", StructureLineDetails."Document Type"::Order);
                //     StructureLineDetails.SETRANGE("Document No.", "No.");
                //     //StructureLineDetails.SETRANGE("Item No.","No.");
                //     //StructureLineDetails.SETRANGE("Line No.","Line No.");
                //     IF StructureLineDetails.FINDSET THEN
                //         REPEAT
                //             IF NOT StructureLineDetails."Payable to Third Party" THEN BEGIN
                //                 IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::Charges THEN
                //                     ChargesAmount += ABS(StructureLineDetails."Calculation Value");
                //                 //MESSAGE('%1',ChargesAmount);
                //                 //IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"Other Taxes" THEN
                //                 //OtherTaxesAmount := OtherTaxesAmount + ABS(StructureLineDetails.Amount);
                //             END;
                //         UNTIL StructureLineDetails.NEXT = 0;
                // END;
                //MESSAGE('%1',ChargesAmount);
                IF "Purchase Header"."Currency Code" = '' THEN
                    tgCurrCode := 'INR'
                ELSE
                    tgCurrCode := "Purchase Header"."Currency Code";
                //Ashish Start
                // tgPL.RESET;
                // tgPL.SETCURRENTKEY("Document Type", "Document No.", "Line No.");
                // tgPL.SETRANGE("Document No.", "No.");
                // tgPL.FINDSET;
                // REPEAT
                //     Total += tgPL."Line Amount" + tgPL."BED Amount" + tgPL."eCess Amount" + tgPL."SHE Cess Amount" + tgPL."ADC VAT Amount" + tgPL."Tax Amount"
                //              + tgPL."Service Tax Amount" + tgPL."Service Tax eCess Amount" + tgPL."Service Tax SHE Cess Amount" + tgPL."Total GST Amount";
                // UNTIL tgPL.NEXT = 0;
                //Ashish End
                // Total -= "Purchase Header"."Invoice Discount Amount";
                // Total += ChargesAmount;

                //   IF "Purchase Header"."GST Vendor Type" = "Purchase Header"."GST Vendor Type"::Unregistered THEN
                // "Purchase Header".CalcFields("Amount Including VAT");
                // Total := ROUND("Purchase Header"."Amount Including VAT" + GSTCompAmount[2] + GSTCompAmount[3], 1, '=');

                // inWord.InitTextVariable;
                // inWord.FormatNoText(NumberLineAmount, ABS(Total), "Purchase Header"."Currency Code");

                IF "Purchase Header"."GST Vendor Type" <> "Purchase Header"."GST Vendor Type"::" " THEN
                    GstVendotType := "Purchase Header"."GST Vendor Type"
                ELSE
                    GstVendotType := GstVendotType::Unregistered;




                AppID := '';
                PostedApprovalEntry.RESET;
                //Ashish PostedApprovalEntry.SETRANGE("Document No.", "Purchase Header"."No.");
                PostedApprovalEntry.SETRANGE(Status, PostedApprovalEntry.Status::Approved);
                IF PostedApprovalEntry.FINDLAST THEN
                    AppID := PostedApprovalEntry."Approver ID";
                //Ashish Start
                // ELSE BEGIN
                //     IF UserSetup.GET("Purchase Header"."Buyer ID") THEN
                //         AppID := UserSetup."Approver ID";
                // END;
                //Ashish End

                //TRI HG 260718 START
                DetGstEntryBuffer.RESET;
                DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."Document No.", "Purchase Header"."No.");
                DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."GST Component Code", 'SGST');
                IF DetGstEntryBuffer.FINDSET THEN BEGIN
                    CLEAR(TotGstAmt1);
                    CLEAR(GstPercent1);
                    CLEAR(GstCode2);
                    REPEAT
                        TotGstAmt1 += DetGstEntryBuffer."GST Amount";
                        GstCode2 := DetGstEntryBuffer."GST Component Code";
                        GstPercent1 := DetGstEntryBuffer."GST %";
                    UNTIL DetGstEntryBuffer.NEXT = 0;
                END;

                DetGstEntryBuffer.RESET;
                DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."Document No.", "Purchase Header"."No.");
                DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."GST Component Code", 'IGST');
                IF DetGstEntryBuffer.FINDSET THEN BEGIN
                    CLEAR(TotGstAmt2);
                    CLEAR(GstPercent2);
                    CLEAR(GstCode3);
                    REPEAT
                        TotGstAmt2 += DetGstEntryBuffer."GST Amount";
                        GstCode3 := DetGstEntryBuffer."GST Component Code";
                        GstPercent2 := DetGstEntryBuffer."GST %";
                    UNTIL DetGstEntryBuffer.NEXT = 0;
                END;

                DetGstEntryBuffer.RESET;
                DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."Document No.", "Purchase Header"."No.");
                DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."GST Component Code", 'CGST');
                IF DetGstEntryBuffer.FINDSET THEN BEGIN
                    CLEAR(TotGstAmt);
                    CLEAR(GstPercent);
                    CLEAR(GstCode1);
                    REPEAT
                        TotGstAmt += DetGstEntryBuffer."GST Amount";
                        GstCode1 := DetGstEntryBuffer."GST Component Code";
                        GstPercent := DetGstEntryBuffer."GST %";
                    UNTIL DetGstEntryBuffer.NEXT = 0;
                END;
                //TRI HG 260718 END

            end;

            trigger OnPreDataItem()
            begin
                IF gDoc <> '' THEN
                    "Purchase Header".SETRANGE("Purchase Header"."No.", gDoc);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        "SerialNo." := 0;
        tgCompInfo.GET;
        tgCompInfo.CALCFIELDS(tgCompInfo.Picture);
        //tgCompInfo.CALCFIELDS(tgCompInfo.Logo);
        CLEAR(ComIn);
        ComIn.GET;
        CLEAR(BlDate);
        CLEAR(Slc);
    end;

    var
        Tdate: Date;
        tgCompInfo: Record "Company Information";
        "SerialNo.": Integer;
        Purchasetemporary: Record "Purchase Line" temporary;
        RecVendor: Record "Vendor";
        VendorTin: Code[20];
        // inWord: Report "Check_Custom";
        NumberLineAmount: array[2] of Text;
        tgCountry: Record "Country/Region";
        Total: Decimal;
        RecItem: Record Item;
        TaxTransValue: Record "Tax Transaction Value";//PT
        CESSAMT: Decimal;
        CessPer: Decimal;


        GSTSetup: Record "GST Setup";//PT
        TaxComponentName: Text;//PT
        SGSTAmount: Decimal;//PT
        CGSTAmount: Decimal;//PT
        IGSTAmount: Decimal;//PT
        CGST: Decimal;//PT
        SGST: Decimal;//PT
        IGST: Decimal;//PT
        GstRate: Decimal;//PT
        Warranty: DateFormula;
        FormCStatus: Text;
        RecSalesHeader: Record "Sales Header";
        CustomerName: Text;
        CustomerPONo: Code[100];
        RecPaymentTerms: Record "Payment Terms";
        PaymentTerms: Text[100];
        "ecess%": Decimal;
        "shecess%": Decimal;
        Comments_l: Text;
        ExciseDuty: Decimal;
        ADCVAT: Decimal;
        RecOrderAddress: Record "Order Address";
        Address: Text[600];
        City: Text;
        Country: Code[10];
        RecTransportMethod: Record "Transport Method";
        TransportDetails: Text;
        RecComments: Record "Purch. Comment Line";
        Comments: Text[300];
        FreightName: Text[200];
        Import: Boolean;
        Domestic: Boolean;
        VendNo: Code[20];
        Admin: Boolean;
        Consignor: Text;
        tgCurrCode: Code[10];
        // dkjcncd: Record "Transfer Line"
        tgPL: Record "Purchase Line";
        Desc2: Text[100];
        PrintforSpareParts: Boolean;
        RevText: Text;
        TgItem: Record "Item";
        "..mj...gst..": Integer;
        CompInfo: Record "Company Information";
        Original: Boolean;
        Duplicate: Boolean;
        Triplicate: Boolean;
        TextA: Text[100];
        DetGstEntryBuffer: Record "Detailed GST Entry Buffer";
        TotGstAmt: Decimal;
        GstCode1: Code[100];
        GstPercent: Decimal;
        TotGstCode: Code[10];
        GstCode2: Code[100];
        GstPercent1: Decimal;
        TotGstAmt1: Decimal;
        GstCode3: Code[100];
        FassaiNo: Text[20];
        GstPercent2: Decimal;
        TotGstAmt2: Decimal;
        VendState: Code[10];
        Loc: Record "Location";
        LocGstIN: Code[20];
        LocGSTsTATE: Code[10];
        ChargesAmount: Decimal;
        StateRec: Record "State";
        LocState: Code[10];
        VenState: Code[10];
        BlDate: Date;
        TotalTax: Decimal;
        location_g: Record Location;
        PurchHD: Record "Purchase Header";
        GST: Decimal;
        Frieght: Text[100];
        RecLocation: Record "Location";
        LocAdd: Text;
        LocAdd2: Text;
        PostCode: Code[20];
        LocCity: Text;
        LocEmail: Code[50];
        LocationName: Text[100];
        LocationAddress: Text[100];
        LocationCity: Text[100];
        LocationPhone: code[10];
        LocationEmail: Text[50];
        LocationGstRegNo: Code[20];

        LocationCode: Code[20];
        LocStateCode: Code[20];
        Recstate: Record "State";
        Purchcomment: Record "Purch. Comment Line";
        Slc: Integer;
        LocHOPhone: Text[20];
        LocHoPhone2: Text[20];
        GstVendotType: Option " ",Registered,Composite,Unregistered,Import,Exempted,SEZ;
        PostedApprovalEntry: Record "Posted Approval Entry";
        AppID: Code[100];
        UserSetup: Record "User Setup";
        "Barcode No.": Code[20];
        SGSTPer: Decimal;
        SGSTAmt: Decimal;
        CGSTPer: Decimal;
        CGSTAmt: Decimal;
        IGSTPer: Decimal;
        IGSTAmt: Decimal;
        FixedAsset: Record "Fixed Asset";
        FreightNew: Decimal;
        Othercharges: Decimal;
        Insurance: Decimal;
        gDoc: Code[20];
        VendPAN: Code[20];
        Vendorrec: Record "Vendor";
        ComIn: Record "Company Information";
        Locadd1: Text[100];
        PatTremCode: Code[10];
        GSTComponentCodeName: array[10] of Text;
        GSTCompAmount: array[10] of Decimal;
        GSTCompPer: array[10] of Decimal;
        GSTComponentCode: array[10] of Decimal;
        GSTCode_gCodArr: Decimal;

    procedure InitDocument(xDoc: Code[20])
    begin
        gDoc := xDoc;
    end;

    procedure GSTFunction()
    var
        SL_lRec: Record "Purchase Line";
        SubTotal_lDec: Decimal;
        j: Integer;
        DecValueEval_lDec: Decimal;
        CLE_lRec: Record "Vendor Ledger Entry";
        TotalAmtInWords_lTxt: Text;
        DocumentGSTAmt_lDec: Decimal;
        NoText: array[2] of Text[500];
        TaxTrnasactionValue: Record "Tax Transaction Value";
        TaxTrnasactionValue1: Record "Tax Transaction Value";
        LineDiscAmt_lDec: Decimal;
        GSTCompNo: Integer;
    begin

        Clear(GSTComponentCodeName);
        Clear(GSTCompAmount);
        Clear(GSTCompPer);
        Clear(GSTComponentCode);
        Clear(GSTCode_gCodArr);
        SL_lRec.Reset;
        SL_lRec.SetRange("Document Type", "Purchase Header"."Document Type");
        SL_lRec.SetRange("Document No.", "Purchase Header"."No.");
        SL_lRec.SetRange("System-Created Entry", false);
        SL_lRec.SetFilter(Amount, '<>%1', 0);
        if SL_lRec.FindSet then begin
            repeat
                GSTCompNo := 1;
                TaxTrnasactionValue.Reset();
                TaxTrnasactionValue.SetRange("Tax Record ID", SL_lRec.RecordId);
                TaxTrnasactionValue.SetRange("Tax Type", 'GST');
                TaxTrnasactionValue.SetRange("Value Type", TaxTrnasactionValue."Value Type"::COMPONENT);
                TaxTrnasactionValue.SetFilter(Amount, '<>%1', 0);
                if TaxTrnasactionValue.FindSet() then
                    repeat
                        GSTCompNo := TaxTrnasactionValue."Value ID";
                        GSTComponentCode[GSTCompNo] := TaxTrnasactionValue."Value ID";
                        TaxTrnasactionValue1.Reset();
                        TaxTrnasactionValue1.SetRange("Tax Record ID", SL_lRec.RecordId);
                        TaxTrnasactionValue1.SetRange("Tax Type", 'GST');
                        TaxTrnasactionValue1.SetRange("Value Type", TaxTrnasactionValue1."Value Type"::COMPONENT);
                        TaxTrnasactionValue1.SetRange("Value ID", GSTComponentCode[GSTCompNo]);
                        if TaxTrnasactionValue1.FindSet() then begin
                            repeat
                                GSTCompAmount[GSTCompNo] += TaxTrnasactionValue1."Amount";
                                GSTCompPer[GSTCompNo] += TaxTrnasactionValue1.Percent;
                            until TaxTrnasactionValue1.Next() = 0;
                            GSTCompNo += 1;
                        end;

                    until TaxTrnasactionValue.Next() = 0;
                // Message('%1..%2..%3', GSTCompPer[1], GSTCompPer[2], GSTCompPer[3]);


                TaxTrnasactionValue.Reset();
                TaxTrnasactionValue.SetRange("Tax Record ID", SL_lRec.RecordId);
                TaxTrnasactionValue.SetRange("Tax Type", 'GST');
                TaxTrnasactionValue.SetRange("Value Type", TaxTrnasactionValue."Value Type"::COMPONENT);
                TaxTrnasactionValue.SetFilter(Amount, '<>%1', 0);
                if TaxTrnasactionValue.FindSet() then
                    repeat
                        j := TaxTrnasactionValue."Value ID";
                        case TaxTrnasactionValue."Value ID" of
                            6:
                                GSTComponentCodeName[j] := 'SGST';
                            2:
                                GSTComponentCodeName[j] := 'CGST';
                            3:
                                GSTComponentCodeName[j] := 'IGST';
                            5:
                                GSTComponentCodeName[j] := 'UTGST';
                        end;
                        j += 1;
                    until TaxTrnasactionValue.Next() = 0;
            until SL_lRec.Next = 0;
        end;
        //  Message('%1..%2..%3..%4..%5..%6', GSTCompAmount[1], GSTCompAmount[2], GSTCompAmount[3], GSTCompAmount[4], GSTCompAmount[5], GSTCompAmount[6]);
        IF (GSTCompPer[2] = 5) OR (GSTCompPer[2] = 2.5) then
            GstPer := 2.5
        else
            GstPer := GSTCompPer[2];
    end;

    var
        GstPer: Decimal;
}

