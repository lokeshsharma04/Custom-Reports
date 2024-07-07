report 50101 "Sales Order Report"
{
#pragma warning disable
    UsageCategory = Administration;
    ApplicationArea = all;
    // FB_Pratam - New Report created for Purchase Order.
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/Sales Order Report.rdl';
    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";

            column(GSTCompAmount2; GSTCompAmount[2])
            {

            }
            column(TotalGstAMt; TotalGstAMt)
            {

            }
            column(TotalAmt1; TotalAmt1)
            {

            }


            column(GSTCompAmount3; GSTCompAmount[3])
            {

            }
            column(GSTCompAmount4; GSTCompAmount[4])
            {

            }

            column(GSTCompPer2; GSTCompPer[2])
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
            column(BuyerID_PurchaseHeader; '')// "Sales Header"."Buyer ID")
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
            column(LocAdd2; LocAdd2)
            {
            }
            column(PostCode; PostCode)
            {
            }
            column(LocCity; LocCity)
            {
            }
            column(LocHoPhone2; LocHoPhone2)
            {
            }
            column(LocHOPhone; LocHOPhone)
            {
            }
            column(LocStateCode; LocStateCode)
            {
            }
            column(External_Document_No_; "External Document No.")
            { }
            column(PaymentMethodCode_PurchaseHeader; "Sales Header"."Payment Method Code")
            {
            }
            column(PaymentTermsCode_PurchaseHeader; "Sales Header"."Payment Terms Code")
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

            column(No_PurchaseHeader; "Sales Header"."No.")
            {
            }
            column(OrderDate_PurchaseHeader; FORMAT("Sales Header"."Order Date", 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }
            column(PostingDate_PurchaseHeader; Tdate)
            {
            }
            column(tgCompInfo_Name; tgCompInfo.Name + ' ' + tgCompInfo."Name 2")
            {
            }
            column(tgCompInfo_Address; tgCompInfo.Address + '  ' + tgCompInfo."Address 2")
            {
            }
            column(CompInfo_City_Pstcode; tgCompInfo.City + '-' + tgCompInfo."Post Code")//+ ', ' + tgCompInfo.State + ' - '
            {
            }
            column(GSTIN; tgCompInfo."GST Registration No.")
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
            column(tgCompInfo_Email; '')// tgCompInfo."Purchase E-Mail")
            {
            }
            column(LocAddress; Loc.Address + ', ' + Loc."Address 2")
            {
            }
            column(LocCityPinCode; Loc.City + ', ' + Loc."Post Code")
            {
            }
            column(LocPhoneNo; Loc."Phone No." + ', ' + Loc."Phone No. 2")
            {
            }
            column(LocGSTsTATE; LocGSTsTATE)
            {
            }
            column(EmailLocation; Loc."E-Mail")
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
            column(Vendor_No; "Sales Header"."Sell-to Customer No.")
            {
            }
            column(RequestedReceiptDate_PurchaseHeader; "Sales Header"."Posting Date")
            {
            }
            column(BuyfromVendorName_PurchaseHeader; "Sales Header"."Sell-to Customer Name")
            {
            }
            column(BuyfromAddress_PurchaseHeader; "Sales Header"."Sell-to Address")
            {
            }
            column(BuyfromAddress2_PurchaseHeader; "Sales Header"."Sell-to Address 2")
            {
            }
            column(BuyfromCity_PurchaseHeader; "Sales Header"."Sell-to City")
            {
            }
            column(CurrencyCode_PurchaseHeader; "Sales Header"."Currency Code")
            {
            }
            column(ShiptoPostCode_PurchaseHeader; "Sales Header"."Ship-to Post Code")
            {
            }
            column(ShiptoCounty_PurchaseHeader; "Sales Header"."Ship-to County")
            {
            }
            column(tgCompInfoRegistrationNo; tgCompInfo."Registration No.")
            {
            }
            column(tgCompInfoTINNo; '')// tgCompInfo."T.I.N. No.")
            {
            }
            column(VendorOrderNo_PurchaseHeader; '')// "Sales Header"."Vendor Order No.")
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
            column(BuyfromPostCode_PurchaseHeader; "Sales Header"."Sell-to Post Code")
            {
            }
            column(BuyfromCounty_PurchaseHeader; "Sales Header"."Sell-to County")
            {
            }
            column(BuyfromCountryRegionCode_PurchaseHeader; "Sales Header"."Sell-to Country/Region Code")
            {
            }
            column(BuyfromVendorName2_PurchaseHeader; "Sales Header"."Sell-to Customer Name 2")
            {
            }
            column(BuyfromContact_PurchaseHeader; "Sales Header"."Sell-to Contact")
            {
            }
            column(ShiptoName_PurchaseHeader; "Sales Header"."Ship-to Name")
            {
            }
            column(ShiptoName2_PurchaseHeader; "Sales Header"."Ship-to Name 2")
            {
            }
            column(ShiptoAddress_PurchaseHeader; "Sales Header"."Ship-to Address")
            {
            }
            column(ShiptoAddress2_PurchaseHeader; "Sales Header"."Ship-to Address 2")
            {
            }
            column(ShiptoCity_PurchaseHeader; "Sales Header"."Ship-to City")
            {
            }
            column(Comments; Comments)
            {
            }
            column(ExpectedReceiptDate_PurchaseHeader; FORMAT("Sales Header"."Posting Date", 0, 1))
            {
            }
            column(FreightName; FreightName)
            {
            }
            column(InvoiceDiscountAmount_PurchaseHeader; "Sales Header"."Invoice Discount Amount")
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
            column(BlanketOrderNo_PurchaseHeader; '')// "Sales Header"."Blanket Order No.")
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");
                // WHERE(Quantity = FILTER(> 0));
                column(FreightNew; 0)// "Sales Line"."FA Freight Charges")
                {
                }
                column(Othercharges; 0)//"Sales Line"."FA Other Charges")
                {
                }
                column(Insurance; 0)// "Sales Line"."FA Insurance")
                {
                }
                column(Type; "Sales Line".Type)
                {
                }
                column(HSNSACCode_PurchaseLine; "Sales Line"."HSN/SAC Code")
                {
                }
                column(No_PurchaseLine; "Sales Line"."No.")
                {
                }
                column(Description_PurchaseLine; "Sales Line".Description + ' ' + Desc2)
                {
                }
                column(Description2_PurchaseLine; "Sales Line"."Description 2")
                {
                }
                column(Quantity_PurchaseLine; "Sales Line".Quantity)
                {
                }
                column(DirectUnitCost_PurchaseLine; "Sales Line"."Unit Cost")
                {
                }
                column(LineAmount_PurchaseLine; "Sales Line"."Line Amount")
                {
                }
                column(LineDiscount_PurchaseLine; "Sales Line"."Line Discount %")
                {
                }
                column(MRP; 0)//"Sales Line".LRP)
                {
                }
                column(Comment_PurchaseLine; '')// "Sales Line".Comment)
                {
                }
                column(Brand; '')//RecItem."Brand Code")
                {
                }
                column(EAN_Code; "Barcode No.")
                {
                }
                column(Unit_Price; "Unit Price")
                {

                }
                column(Amount_Including_VAT; "Amount Including VAT")
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
                column(UnitPriceLCY_PurchaseLine; "Sales Line"."Unit Price")
                {
                }
                column(Tax_PurchaseLine; 0)// "Sales Line"."Tax %")
                {
                }
                column(TaxBaseAmount_PurchaseLine; 0)// "Sales Line"."Tax Base Amount")
                {
                }
                column(UnitofMeasureCode_PurchaseLine; "Sales Line"."Unit of Measure Code")
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
                column(BlanketOrderNo_PurchaseLine; "Sales Line"."Blanket Order No.")
                {
                }
                column(DeliveryDate_PurchaseLine; 0)// "Sales Line"."QC Remarks")
                {
                }
                column(LineDiscountAmount_PurchaseLine; "Sales Line"."Line Discount Amount")
                {
                }

                column(ecess; "ecess%")
                {
                }

                column(shecess; "shecess%")
                {
                }
                column(ExciseDuty; ExciseDuty)
                {
                }
                column(GST_PurchaseLine; 0)// ROUND("Sales Line"."GST %", 1))
                {
                }
                column(BEDAmount_PurchaseLine; 0)// "Sales Line"."BED Amount")
                {
                }
                column(eCessAmount_PurchaseLine; 0)// "Sales Line"."eCess Amount")
                {
                }
                column(SHECessAmount_PurchaseLine; 0)//"Sales Line"."SHE Cess Amount")
                {
                }
                column(ADCVATAmount_PurchaseLine; 0)// "Sales Line"."ADC VAT Amount")
                {
                }
                column(TaxAmount_PurchaseLine; 0)// "Sales Line"."Tax Amount")
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
                dataitem("<Purch. Comment Line1>"; "Purch. Comment Line")
                {
                    DataItemLink = "No." = FIELD("Document No."),
                                   "Document Line No." = FIELD("Line No.");
                    DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.")
                                        WHERE("Document Line No." = FILTER(<> 0),
                                              Comment = FILTER(<> ''));
                    column(Comment_PurchCommentLine1; "<Purch. Comment Line1>".Comment)
                    {
                    }
                }

                trigger OnAfterGetRecord()
                var
                    DecimalValue: Decimal;
                    Direction: Text;
                    Precision: Decimal;
                    Result: Decimal;
                    Text000: label 'Round(%1, %2, %3) return %4';
                    Amount1: Decimal;
                    Amount2: Decimal;
                begin
                    CLEAR("Barcode No.");
                    IF RecItem.GET("Sales Line"."No.") THEN;
                    IF FixedAsset.GET("Sales Line"."No.") THEN;


                    GST := 0;// ROUND("Sales Line"."GST %");
                    IF "No." <> '' THEN
                        "SerialNo." += 1;

                    Amount1 += GSTCompAmount[2];
                    Amount2 += GSTCompAmount[2];
                    //  IF "Sales Line".Type = "Sales Line".type::Item Then
                    GSTFunction;
                    // "Sales Header".CalcFields("Amount Including VAT");//GSTCompAmount[2] + GSTCompAmount[2]
                    // Total := ROUND("Sales Header"."Amount Including VAT" + GSTCompAmount[3], 1, '=');
                    // DecimalValue := Total;
                    // Direction := '>';
                    // Message('%1..%2..%3', DecimalValue,Amount1 , GSTCompAmount[2]);
                    // Precision := 0.01;
                    // Result := ROUND(DecimalValue, Precision, Direction);
                    // //   MESSAGE(Text000, FORMAT(DecimalValue, 0, 1), Precision, Direction, Result);



                    "Sales Header".CalcFields("Amount Including VAT");//GSTCompAmount[2] + GSTCompAmount[2]+
                    Result := ROUND("Sales Header"."Amount Including VAT" + TotalGstAMt + TotalGstAMt + GSTCompAmount[3]);
                    DecimalValue := Result;
                    Direction := '>';
                    Precision := 0.1;
                    Total := ROUND(DecimalValue, Precision, Direction);

                    // inWord.InitTextVariable;//PT
                    // inWord.FormatNoText(NumberLineAmount, ABS(Total), "Sales Header"."Currency Code");
                    //     Message();
                    // inWord.InitTextVariable;//PT
                    // inWord.FormatNoText(NumberLineAmount, ABS(Total), "Sales Header"."Currency Code");
                    /*
                    RecItem.RESET;
                    RecSalesHeader.RESET;
                    IF RecItem.GET("No.") THEN;
                    //  Warranty := RecItem."MAX Quantity";b
                    
                    RecSalesHeader.SETRANGE(RecSalesHeader."No.","Project Code Without Dimension");
                    IF RecSalesHeader.FINDFIRST THEN BEGIN
                      CustomerName := RecSalesHeader."Sell-to Customer Name";
                      CustomerPONo := RecSalesHeader."Current Net Total";
                    END;
                    */
                    /* //BNB
                    recExcise.SETRANGE(recExcise."Excise Bus. Posting Group","Sales Line"."Excise Bus. Posting Group");
                    recExcise.SETRANGE(recExcise."Excise Prod. Posting Group","Sales Line"."Excise Prod. Posting Group");
                    recExcise.SETFILTER("From Date",'<=%1',"Sales Header"."Posting Date");
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
                        Desc2 := "Sales Line"."Description 2"
                    ELSE
                        Desc2 := '';
                    ///
                    /*
                    TgItem.RESET;
                    IF Type = Type::Item THEN
                    TgItem.GET("No.");
                     //MJ
                      IF PurchHD.GET(PurchHD."Document Type"::"Blanket Order","Sales Line"."Blanket Order No.") THEN
                       BlDate:=PurchHD."Document Date";
                       */

                    //MJ GST

                    /* //TRI HG CODE BLOCK START
                    DetGstEntryBuffer.RESET;
                    DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."Document No.","Document No." );
                    //DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."Line No.","Sales Line"."Line No.");
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
                    //DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."Line No.","Sales Line"."Line No.");
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
                    //DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."Line No.","Sales Line"."Line No.");
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
                    DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."No.", "Sales Line"."No.");
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
                    // Message('%1', CGSTAmt);

                    //TRI YM 31122018
                    // Ashish Start
                    // FreightNew += "Sales Line"."FA Freight Charges";
                    // Insurance += "Sales Line"."FA Insurance";
                    // Othercharges += "Sales Line"."FA Other Charges";
                    // Ashish END
                    //TRI YM 31122018

                end;

                trigger OnPreDataItem()
                begin
                    //    CurrReport.CREATETOTALS("Sales Line"."FA Freight Charges", "Sales Line"."FA Insurance", "Sales Line"."FA Other Charges");
                end;
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
            begin
                CLEAR(LocAdd);
                CLEAR(LocAdd2);
                CLEAR(LocationCode);
                CLEAR(LocStateCode);
                CLEAR(PostCode);
                CLEAR(City);
                CLEAR(LocHoPhone2);
                CLEAR(LocHOPhone);
                CLEAR(Vendorrec);
                IF Vendorrec.GET("Sales Header"."Sell-to Customer No.") THEN;
                RecLocation.RESET;
                //RecLocation.SETRANGE(Code,'HO');  //TRI.HIM 22.06.18
                IF RecLocation.FINDFIRST THEN BEGIN
                    LocAdd := RecLocation.Address;
                    LocAdd2 := RecLocation."Address 2";
                    LocCity := RecLocation.City;
                    PostCode := RecLocation."Post Code";
                    LocStateCode := RecLocation."State Code";
                    LocHOPhone := RecLocation."Phone No.";
                    LocHoPhone2 := RecLocation."Phone No. 2";
                END;
                //TRI MK

                IF Recstate.GET(RecLocation."State Code") THEN LocStateCode := Recstate.Description;

                //MJTRI
                IF Original THEN TextA := 'For Consignee';
                IF Duplicate THEN TextA := 'For Transporter';
                IF Triplicate THEN TextA := 'For Consigner';
                //MJTRI
                Frieght := '';
                /*IF "Sales Header"."Short Closed" THEN Frieght:= 'Inclusive'
                ELSE Frieght:='Exclusive';*/ //TRI AS 130818 BLOCKED

                //Ashish Start 
                // IF "Sales Header"."Order Type" = "Sales Header"."Order Type"::FA THEN
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
                IF RecVendor.GET("Sell-to Customer No.") THEN BEGIN
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


                //Ashish // IF "Sales Header"."C Form" = TRUE THEN
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

                IF RecTransportMethod.GET("Sales Header"."Transport Method") THEN
                    TransportDetails := RecTransportMethod.Description;

                RecComments.SETRANGE(RecComments."Document Type", "Sales Header"."Document Type");
                RecComments.SETRANGE(RecComments."No.", "Sales Header"."No.");
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
                IF "Sales Header"."Currency Code" = '' THEN
                    tgCurrCode := 'INR'
                ELSE
                    tgCurrCode := "Sales Header"."Currency Code";
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
                // Total -= "Sales Header"."Invoice Discount Amount";
                // Total += ChargesAmount;

                //   IF "Sales Header"."GST Vendor Type" = "Sales Header"."GST Vendor Type"::Unregistered THEN
                // "Sales Header".CalcFields("Amount Including VAT");
                // Total := ROUND("Sales Header"."Amount Including VAT" + GSTCompAmount[2] + GSTCompAmount[3], 1, '=');

                // inWord.InitTextVariable;
                // inWord.FormatNoText(NumberLineAmount, ABS(Total), "Sales Header"."Currency Code");

                IF "Sales Header"."GST Customer Type" <> "Sales Header"."GST Customer Type"::" " THEN
                    GstVendotType := "Sales Header"."GST Customer Type"
                ELSE
                    GstVendotType := GstVendotType::Unregistered;




                AppID := '';
                PostedApprovalEntry.RESET;
                //Ashish PostedApprovalEntry.SETRANGE("Document No.", "Sales Header"."No.");
                PostedApprovalEntry.SETRANGE(Status, PostedApprovalEntry.Status::Approved);
                IF PostedApprovalEntry.FINDLAST THEN
                    AppID := PostedApprovalEntry."Approver ID";
                //Ashish Start
                // ELSE BEGIN
                //     IF UserSetup.GET("Sales Header"."Buyer ID") THEN
                //         AppID := UserSetup."Approver ID";
                // END;
                //Ashish End

                //TRI HG 260718 START
                DetGstEntryBuffer.RESET;
                DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."Document No.", "Sales Header"."No.");
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
                DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."Document No.", "Sales Header"."No.");
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
                DetGstEntryBuffer.SETRANGE(DetGstEntryBuffer."Document No.", "Sales Header"."No.");
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
                    "Sales Header".SETRANGE("Sales Header"."No.", gDoc);
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
        RecVendor: Record Customer;
        VendorTin: Code[20];
        // inWord: Report Check_Custom;
        NumberLineAmount: array[2] of Text;
        tgCountry: Record "Country/Region";
        Total: Decimal;
        RecItem: Record Item;
        Warranty: DateFormula;
        FormCStatus: Text;
        RecSalesHeader: Record "Sales Header";
        CustomerName: Text;
        CustomerPONo: Code[100];
        RecPaymentTerms: Record "Payment Terms";
        PaymentTerms: Text[100];
        "ecess%": Decimal;
        "shecess%": Decimal;
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
        tgPL: Record "Sales Line";
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
        PurchHD: Record "Sales Header";
        GST: Decimal;
        Frieght: Text[100];
        RecLocation: Record "Location";
        LocAdd: Text;
        LocAdd2: Text;
        PostCode: Code[20];
        LocCity: Text;
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
        Vendorrec: Record Customer;
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
        SL_lRec: Record "Sales Line";
        SubTotal_lDec: Decimal;
        j: Integer;
        DecValueEval_lDec: Decimal;
        CLE_lRec: Record "Vendor Ledger Entry";
        TotalAmtInWords_lTxt: Text;
        DocumentGSTAmt_lDec: Decimal;
        NoText: array[2] of Text[500];
        TaxTrnasactionValue: Record "Tax Transaction Value";
        TaxTrnasactionValue1: Record "Tax Transaction Value";
        TaxTrnasactionValue2: Record "Tax Transaction Value";
        LineDiscAmt_lDec: Decimal;
        GSTCompNo: Integer;
    begin

        Clear(GSTComponentCodeName);
        clear(GSTCompNo);
        Clear(GSTCompPer);
        Clear(GSTComponentCode);
        Clear(GSTCode_gCodArr);
        //FBTS YM Not in use
        // SL_lRec.Reset;
        // SL_lRec.SetRange("Document Type", "Sales Header"."Document Type");
        // SL_lRec.SetRange("Document No.", "Sales Header"."No.");
        // SL_lRec.SetRange("System-Created Entry", false);
        // SL_lRec.SetFilter(Amount, '<>%1', 0);
        // if SL_lRec.FindSet then begin
        //     repeat
        //FBTS YM Not in use
        Clear(GSTCompAmount);
        // Clear(TotalGstAMt);

        GSTCompNo := 1;
        TaxTrnasactionValue.Reset();
        TaxTrnasactionValue.SetRange("Tax Record ID", "Sales Line".RecordId);
        TaxTrnasactionValue.SetRange("Tax Type", 'GST');
        TaxTrnasactionValue.SetRange("Value Type", TaxTrnasactionValue."Value Type"::COMPONENT);
        TaxTrnasactionValue.SetFilter(Amount, '<>%1', 0);
        if TaxTrnasactionValue.FindSet() then
            repeat
                // clear(GSTCompAmount);//FBTS YM 220522
                GSTCompNo := TaxTrnasactionValue."Value ID";
                GSTComponentCode[GSTCompNo] := TaxTrnasactionValue."Value ID";
                // Message(Format(GSTComponentCode[GSTCompNo]) + '...' + Format(TaxTrnasactionValue."Tax Record ID"));
                // Message(Format(TaxTrnasactionValue.RecordId));
                // Message(Format(TaxTrnasactionValue."Column Name"));
                TaxTrnasactionValue1.Reset();
                TaxTrnasactionValue1.SetRange("Tax Record ID", "Sales Line".RecordId);
                TaxTrnasactionValue1.SetRange("Tax Type", 'GST');
                TaxTrnasactionValue1.SetRange("Value Type", TaxTrnasactionValue1."Value Type"::COMPONENT);
                TaxTrnasactionValue1.SetRange("Value ID", GSTComponentCode[GSTCompNo]);
                TaxTrnasactionValue1.SetFilter(Amount, '<>%1', 0);

                if TaxTrnasactionValue1.FindSet() then begin
                    repeat


                        GSTCompAmount[GSTCompNo] += TaxTrnasactionValue1."Amount";
                        GSTCompPer[GSTCompNo] += TaxTrnasactionValue1.Percent;
                        Clear(TotalAmt1);
                        TaxTrnasactionValue2.Reset();
                        TaxTrnasactionValue2.SetRange("Tax Record ID", "Sales Line".RecordId);
                        TaxTrnasactionValue2.SetRange("Tax Type", 'GST');
                        TaxTrnasactionValue2.SetRange("Value Type", TaxTrnasactionValue1."Value Type"::COMPONENT);
                        TaxTrnasactionValue2.SetRange("Value ID", GSTComponentCode[GSTCompNo]);
                        TaxTrnasactionValue2.SetFilter(Amount, '<>%1', 0);
                        TaxTrnasactionValue2.CalcSums(Amount);
                        TotalAmt1 += TaxTrnasactionValue2."Amount";
                    until TaxTrnasactionValue1.Next() = 0;
                    GSTCompNo += 1;
                end;

            until TaxTrnasactionValue.Next() = 0;
        TotalGstAMt += GSTCompAmount[2];

        //Message('%1', TotalGstAMt);
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
        //until SL_lRec.Next = 0; //FBTS YM
        //end;

        // Message('%1..%2..%3..%4..%5..%6', GSTCompAmount[1], GSTCompAmount[2], GSTCompAmount[3], GSTCompAmount[4], GSTCompAmount[5], GSTCompAmount[6]);
    end;

    var

        TotalGstAMt: Decimal;
        TotalAmt1:
        decimal;
        NewGstAmt: Decimal;
}

