report 50103 "Transfer Receipt Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/Transfer Receipt Report.rdl';
#pragma warning disable 
    dataset
    {
        dataitem("Transfer Receipt Header"; "Transfer Receipt Header")
        {
            RequestFilterFields = "No.";
            column(ReverseCharge; FORMAT(ReverseCharge))
            {
            }
            column(ReceiptDate_TransferShipmentHeader; FORMAT("Transfer Receipt Header"."Receipt Date"))
            {
            }
            column(No_TransferShipmentHeader; "Transfer Receipt Header"."No.")
            {
            }
            column(CreatedBy_TransferShipmentHeader; '')
            {
            }
            column(timex; timex)
            {
            }
            column(TXT; TXT)
            {
            }
            column(PrintCopyName; '')
            {
            }
            column(TransferOrderDate_TransferShipmentHeader; FORMAT("Transfer Receipt Header"."Transfer Order Date"))
            {
            }
            column(PostingDate_TransferShipmentHeader; FORMAT("Transfer Receipt Header"."Posting Date"))
            {
            }
            column(VehicleNo_TransferShipmentHeader; '')
            {
            }
            column(ShipmentDate_TransferShipmentHeader; FORMAT("Transfer Receipt Header"."Receipt Date"))
            {
            }
            column(TransfertoCity_TransferShipmentHeader; "Transfer Receipt Header"."Transfer-to City")
            {
            }
            column(fromState; RECLOC."State Code")
            {
            }
            column(FromEmail; RECLOC."E-Mail")
            {
            }
            column(FromPostCode; RECLOC."Post Code")
            {
            }
            column(fromPhone2; RECLOC."Phone No. 2")
            {
            }
            column(FromPhone; RECLOC."Phone No.")
            {
            }
            column(FromCity; RECLOC.City)
            {
            }
            column(FromLocAdd2; RECLOC."Address 2")
            {
            }
            column(FromLocAdd; RECLOC.Address)
            {
            }
            column(CName; CompanyInfo.Name)
            {
            }
            column(CName2; CompanyInfo."Name 2")
            {
            }
            column(CAddress; CompanyInfo.Address)
            {
            }
            column(CAddress2; CompanyInfo."Address 2")
            {
            }
            column(CGST_Reg; CompanyInfo."GST Registration No.")
            {
            }
            column(CPost_Code; CompanyInfo."Post Code")
            {
            }
            column(CState; '')//CompanyInfo.State)
            {
            }
            column(CPANone; CompanyInfo."P.A.N. No.")
            {
            }
            column(CCity; CompanyInfo.City)
            {
            }
            column(CPhone2; CompanyInfo."Phone No. 2")
            {
            }
            column(HomePAge; CompanyInfo."Home Page")
            {
            }
            column(Cin; '')// CompanyInfo."Company Registration  No.")
            {
            }
            column(CPhone; CompanyInfo."Phone No.")
            {
            }
            column(CompanyPicture; CompanyInfo.Picture)
            {
            }
            column(TransferOrderNo_TransferShipmentHeader; "Transfer Receipt Header"."Transfer Order No.")
            {
            }
            column(TransferfromCode_TransferShipmentHeader; "Transfer Receipt Header"."Transfer-from Code")
            {
            }
            column(TransferfromName_TransferShipmentHeader; "Transfer Receipt Header"."Transfer-from Name")
            {
            }
            column(TransferfromName2_TransferShipmentHeader; "Transfer Receipt Header"."Transfer-from Name 2")
            {
            }
            column(TransferfromAddress_TransferShipmentHeader; "Transfer Receipt Header"."Transfer-from Address")
            {
            }
            column(TransferfromAddress2_TransferShipmentHeader; "Transfer Receipt Header"."Transfer-from Address 2")
            {
            }
            column(TransferfromPostCode_TransferShipmentHeader; "Transfer Receipt Header"."Transfer-from Post Code")
            {
            }
            column(TransferfromCity_TransferShipmentHeader; "Transfer Receipt Header"."Transfer-from City")
            {
            }
            column(TransferfromCounty_TransferShipmentHeader; "Transfer Receipt Header"."Transfer-from County")
            {
            }
            column(TrsffromCountryRegionCode_TransferShipmentHeader; "Transfer Receipt Header"."Trsf.-from Country/Region Code")
            {
            }
            column(TransfertoCode_TransferShipmentHeader; "Transfer Receipt Header"."Transfer-to Code")
            {
            }
            column(TransfertoName_TransferShipmentHeader; "Transfer Receipt Header"."Transfer-to Name")
            {
            }
            column(TransfertoName2_TransferShipmentHeader; "Transfer Receipt Header"."Transfer-to Name 2")
            {
            }
            column(TotalAmount; TotalAmount)
            {
            }
            column(TransfertoAddress_TransferShipmentHeader; "Transfer Receipt Header"."Transfer-to Address")
            {
            }
            column(TransfertoAddress2_TransferShipmentHeader; "Transfer Receipt Header"."Transfer-to Address 2")
            {
            }
            column(TransfertoPostCode; "Transfer Receipt Header"."Transfer-to Post Code")
            {
            }
            column(StateCode; StateCode)
            {
            }
            column(StateDesc; StateDesc)
            {
            }
            column(StateDescTo; StateDesc1)
            {
            }
            column(LocGSTRegNo; LocGSTRegNo)
            {
            }
            column(StateCodeTo; StateCode1)
            {
            }
            column(LocToGSTNo; LocToGSTNo)
            {
            }
            column(StateCodeM; StateCodeM)
            {
            }
            column(StateDescM; StateDescM)
            {
            }
            column(StateDescToM; StateDesc1M)
            {
            }
            column(LocGSTRegNoM; LocGSTRegNoM)
            {
            }
            column(StateCodeToM; StateCode1M)
            {
            }
            column(LocToGSTNoM; LocToGSTNoM)
            {
            }
            column(Today; FORMAT(TODAY))
            {
            }
            column(Structure_TransferShipmentHeader; '')// "Transfer Receipt Header".Structure)
            {
            }
            dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
            {
                DataItemLink = "Document No." = FIELD("No.");
                column(GST_Code1; "Detailed GST Ledger Entry"."GST Component Code")
                {
                }
                column(GST_Amt; ABS("Detailed GST Ledger Entry"."GST Amount"))
                {
                }
                column(GST_Per1; "Detailed GST Ledger Entry"."GST %")
                {
                }
                column(GSTBaseAmount; ABS("Detailed GST Ledger Entry"."GST Base Amount"))
                {
                }
            }
            dataitem("Transfer Receipt Line"; "Transfer Receipt Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = WHERE(Quantity = FILTER(<> 0));
                RequestFilterFields = "Document No.";
                column(Srn; Srn)
                {
                }
                column(TotalAmounttoTransfer_TransferShipmentLine; 0)// "Transfer Receipt Line"."Total Amount to Transfer")
                {
                }
                column(GST_Per; GST_Per)
                {
                }
                column(GST_Code; GST_Code)
                {
                }
                column(UnitofMeasureCode_TransferShipmentLine; "Transfer Receipt Line"."Unit of Measure Code")
                {
                }
                column(HSNSACCode_TransferShipmentLine; "Transfer Receipt Line"."HSN/SAC Code")
                {
                }
                column(TotalGSTAmount_TransferShipmentLine; 0)// "Transfer Receipt Line"."Total GST Amount")
                {
                }
                column(GST_PERC; "Transfer Receipt Line"."GST Group Code")
                {
                }
                column(GSTBaseAmount_TransferShipmentLine; 0)// "Transfer Receipt Line"."GST Base Amount")
                {
                }
                column(ItemCategoryCode_TransferShipmentLine; "Transfer Receipt Line"."Item Category Code")
                {
                }
                column(Amount_TransferShipmentLine; "Transfer Receipt Line".Amount)
                {
                }
                column(UnitPrice_TransferShipmentLine; "Transfer Receipt Line"."Unit Price")
                {
                }
                column(ShipmentDate_TransferShipmentLine; "Transfer Receipt Line"."Receipt Date")
                {
                }
                column(ItemNo_TransferShipmentLine; "Transfer Receipt Line"."Item No.")
                {
                }
                column(Quantity_TransferShipmentLine; "Transfer Receipt Line".Quantity)
                {
                }
                column(UnitofMeasure_TransferShipmentLine; "Transfer Receipt Line"."Unit of Measure")
                {
                }
                column(Description_TransferShipmentLine; "Transfer Receipt Line".Description)
                {
                }
                column(TotalAmtAfterTax; TotalAmtAfterTax)
                {
                }
                column(AmtInWord; AmtInWord)
                {
                }
                column(TotalAmt; "Transfer Receipt Line".Amount)
                {
                }
                column(IGSTPer; IGSTPer)
                {
                }
                column(IGSTAmt; IGSTAmt * -1)
                {
                }
                column(GSTBaseAmt; GSTBaseAmt)
                {
                }
                column(TotalMRP; TotalMRP)
                {
                }
                column(DiscAmt; DiscAmt)
                {
                }
                column(ActualPrice_TransferShipmentLine; 0)
                {
                }
                column(CGSTAmt; CGSTAmt * -1)
                {
                }
                column(CGSTPer; CGSTPer)
                {
                }
                column(SGSTAmt; SGSTAmt * -1)
                {
                }
                column(SGSTPer; SGSTPer)
                {
                }
                column(CessAmt; CessAmt * -1)
                {
                }
                column(BarcodeNo; BarcodeNo)
                {
                }
                column(MRPPrice; MRPPrice)
                {
                }
                column(PackageCode_TransferShipmentLine; "Transfer Receipt Line"."Item No.")// "Transfer Receipt Line"."Package Code")
                {
                }
                column(ShortQuantity_TransferReceiptLine; 0)// "Transfer Receipt Line"."Short Quantity")
                {
                }
                column(ExcessQuantity_TransferReceiptLine; 0)// "Transfer Receipt Line"."Excess Quantity")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    CLEAR(BarcodeNo);
                    CLEAR(BatchNo); //TRI AS 210818 ADD
                                    /*RecItem.GET("Transfer Receipt Line"."Item No.");
                                    Barcodes.RESET;
                                    Barcodes.SETRANGE("Item No.","Transfer Receipt Line"."Item No.");
                                    IF Barcodes.FINDFIRST THEN
                                      BarcodeNo := Barcodes."Barcode No.";
                                    */
                                    //TRI AS 210818 START
                                    //   ItemLedgerEntry.RESET;
                                    //   ItemLedgerEntry.SETRANGE("Document No.", "Transfer Receipt Line"."Document No.");
                                    //   ItemLedgerEntry.SETRANGE("Item No.", "Transfer Receipt Line"."Item No.");
                                    //   IF ItemLedgerEntry.FINDFIRST THEN BEGIN
                                    //       BatchNo := ItemLedgerEntry."Lot No.";

                    // ItemLedgerEntry2.RESET;
                    // ItemLedgerEntry2.SETRANGE("Lot No.", BatchNo);
                    // ItemLedgerEntry2.SETRANGE("Item No.", "Transfer Receipt Line"."Item No.");
                    // ItemLedgerEntry2.SETFILTER(Barcode, '<>%1', '');
                    // IF ItemLedgerEntry2.FINDFIRST THEN BEGIN
                    //     BarcodeNo := ItemLedgerEntry2.Barcode;
                    // END;
                    //     END;
                    //TRI AS 210818 STOP
                    //   CLEAR(MRPPrice);
                    //   SalesPrice.RESET;
                    //   SalesPrice.SETRANGE("Item No.", "Transfer Receipt Line"."Item No.");
                    //   IF SalesPrice.FINDLAST THEN
                    //       MRPPrice := SalesPrice."Unit Price";

                    Srn += 1;
                    TotalAmtAfterTax := 0;
                    AmtInWord := '';
                    LineAmount := 0;
                    TotalAmtAfterTax := 0;
                    GSTBaseAmt := 0;
                    TotalMRP := 0;
                    TotalAmt := 0;
                    DiscAmt := 0;
                    CLEAR(GST_Code);
                    CLEAR(GST_Per);

                    CLEAR(CessPer);
                    CLEAR(CessAmt);
                    CLEAR(IGSTAmt);
                    CLEAR(IGSTPer);
                    CLEAR(CGSTAmt);
                    CLEAR(CGSTPer);


                    //TotalMRP:=("Actual Price"*Quantity);
                    //   DiscAmt := (TotalMRP - ("Unit Price" * Quantity));

                    //   IF "GST Base Amount" = 0 THEN
                    //       GSTBaseAmt := ("Unit Price" * Quantity)
                    //   ELSE
                    //       GSTBaseAmt := "GST Base Amount";




                    //   DetGSTLedEntry.RESET;
                    //   DetGSTLedEntry.SETRANGE("Document No.", "Transfer Receipt Header"."No.");
                    //   DetGSTLedEntry.SETRANGE("Original Doc. Type", DetGSTLedEntry."Original Doc. Type"::"Transfer Receipt");
                    //   DetGSTLedEntry.SETRANGE("Document Line No.", "Transfer Receipt Line"."Line No.");
                    //   IF DetGSTLedEntry.FINDFIRST THEN BEGIN
                    //       IF DetGSTLedEntry."GST Component Code" = 'IGST' THEN BEGIN
                    //           IGSTAmt := DetGSTLedEntry."GST Amount" * (-1);
                    //           IGSTPer := DetGSTLedEntry."GST %";
                    //           GST_Code := 'IGST';
                    //           GST_Per := DetGSTLedEntry."GST %";
                    //           //LineAmount:=GSTBaseAmt+IGSTAmt;
                    //           //AmtInWordDecimal +=GSTBaseAmt+IGSTAmt;
                    //       END;
                    IF DetGSTLedEntry."GST Component Code" = 'CESS' THEN BEGIN
                        CessAmt := DetGSTLedEntry."GST Amount" * (-1);
                        CessPer := DetGSTLedEntry."GST %";
                    END;

                    //  END
                    //   ELSE BEGIN


                    //       // IF RecLocation1.GET("Transfer Receipt Line"."Transfer-to Code") THEN
                    //       //     GstStateCode := RecLocation1."State Code";

                    //       // RecGstSetup.RESET;
                    //       // RecGstSetup.SETRANGE("GST State Code", GstStateCode);
                    //       // RecGstSetup.SETRANGE("GST Group Code", "Transfer Receipt Line"."GST Group Code");
                    //       // RecGstSetup.SETFILTER("GST Component", '%1', 'CGST');
                    //       // IF RecGstSetup.FINDFIRST THEN BEGIN
                    //       //     CGSTAmt := (GSTBaseAmt * RecGstSetup."GST Component %") / 100;
                    //       //     CGSTPer := RecGstSetup."GST Component %";
                    //       //     GST_Code := 'CGST+SGST';
                    //       //     GST_Per := RecGstSetup."GST Component %" * 2;
                    //       // END;

                    //       // RecGstSetup.RESET;
                    //       // RecGstSetup.SETRANGE("GST State Code", GstStateCode);
                    //       // RecGstSetup.SETRANGE("GST Group Code", "Transfer Receipt Line"."GST Group Code");
                    //       // RecGstSetup.SETFILTER("GST Component", '%1', 'CESS');
                    //       // IF RecGstSetup.FINDFIRST THEN BEGIN
                    //       //     CessAmt := (GSTBaseAmt * RecGstSetup."GST Component %") / 100;
                    //       //     CessPer := RecGstSetup."GST Component %";
                    //       // END;
                    //   END;

                    AmtInWordDecimal += GSTBaseAmt + ((CGSTAmt * -1) * 2) + (IGSTAmt * -1) + (CessAmt * -1);
                    LineAmount := GSTBaseAmt + ((CGSTAmt * -1) * 2) + (IGSTAmt * -1) + (CessAmt * -1);




                    RecTransferShipLine.RESET;
                    RecTransferShipLine.SETRANGE(RecTransferShipLine."Document No.", "Transfer Receipt Header"."No.");
                    IF RecTransferShipLine.FINDSET THEN
                        REPEAT
                            //  IF "GST Base Amount" <> 0 THEN
                            //      TotalAmt += ROUND((RecTransferShipLine."Unit Price" * RecTransferShipLine.Quantity) + IGSTAmt)
                            //  ELSE
                            TotalAmt += ROUND((RecTransferShipLine."Unit Price" * RecTransferShipLine.Quantity));
                        UNTIL RecTransferShipLine.NEXT = 0;




                    RepCheck.InitTextVariable;
                    RepCheck.FormatNoText(TextNo, ROUND(TotalAmt, 1), '');
                    AmtInWord := TextNo[1];
                    //Message('%1', AmtInWordDecimal);

                end;
            }

            trigger OnAfterGetRecord()
            begin
                //TRI MJ 220218
                Srn += 1;
                TXT := '';
                timex := TIME;
                IF A THEN TXT := 'Original Copy';
                IF B THEN TXT := 'Duplicate Copy';
                IF C THEN TXT := 'Triplicate Copy';
                //TRI MJ 220218
                LocCode := '0';
                StateCode := '0';
                StateDesc := '';
                StateCode1 := '0';
                StateDesc1 := '';
                LocCode1 := '0';
                LocToGSTNo := '';

                RECLOC.RESET;
                IF RECLOC.GET("Transfer Receipt Header"."Transfer-from Code") THEN;


                RecLocation.RESET;
                RecLocation.SETRANGE(RecLocation.Code, "Transfer Receipt Header"."Transfer-to Code");
                IF RecLocation.FINDFIRST THEN BEGIN
                    LocCode := RecLocation."State Code";
                    LocGSTRegNo := RecLocation."GST Registration No."
                END;

                RecState.RESET;
                RecState.SETRANGE(RecState.Code, LocCode);
                IF RecState.FINDFIRST THEN BEGIN
                    StateDesc := RecState.Description;
                    //  StateCode := RecState."State Code for TIN";
                    // MESSAGE(FORMAT(StateDesc));
                END;


                RecLocation.RESET;
                RecLocation.SETRANGE(RecLocation.Code, "Transfer Receipt Header"."Transfer-to Code");
                IF RecLocation.FINDFIRST THEN BEGIN
                    LocCode1 := RecLocation."State Code";
                    LocToGSTNo := RecLocation."GST Registration No.";
                END;
                RecState.RESET;
                RecState.SETRANGE(RecState.Code, LocCode1);
                IF RecState.FINDFIRST THEN BEGIN
                    StateDesc1 := RecState.Description;
                    // StateCode1 := RecState."State Code for TIN";
                    // MESSAGE(FORMAT(StateDesc));
                END;
                LocCodeM := '0';
                StateCodeM := '0';
                StateDescM := '';
                StateCode1M := '0';
                StateDesc1M := '';
                LocCode1M := '0';
                LocToGSTNoM := '';


                RecLocation.RESET;
                RecLocation.SETRANGE(RecLocation.Code, "Transfer Receipt Header"."Transfer-from Code");
                IF RecLocation.FINDFIRST THEN BEGIN
                    LocCodeM := RecLocation."State Code";
                    LocGSTRegNoM := RecLocation."GST Registration No."
                END;

                RecState.RESET;
                RecState.SETRANGE(RecState.Code, LocCodeM);
                IF RecState.FINDFIRST THEN BEGIN
                    StateDescM := RecState.Description;
                    //  StateCodeM := RecState."State Code for TIN";
                    // MESSAGE(FORMAT(StateDesc));
                END;


                RecLocation.RESET;
                RecLocation.SETRANGE(RecLocation.Code, "Transfer Receipt Header"."Transfer-from Code");
                IF RecLocation.FINDFIRST THEN BEGIN
                    LocCode1M := RecLocation."State Code";
                    LocToGSTNoM := RecLocation."GST Registration No.";
                END;

                RecState.RESET;
                RecState.SETRANGE(RecState.Code, LocCode1M);
                IF RecState.FINDFIRST THEN BEGIN
                    StateDesc1M := RecState.Description;
                    //   StateCode1M := RecState."State Code for TIN";
                    // MESSAGE(FORMAT(StateDesc));
                END;

                ReverseCharge := FALSE;
                //  DetGSTLedEntry.RESET;
                //  DetGSTLedEntry.SETRANGE("Document No.", "Transfer Receipt Header"."No.");
                //  DetGSTLedEntry.SETRANGE("Original Doc. Type", DetGSTLedEntry."Original Doc. Type"::"Transfer Shipment");
                //  IF "Detailed GST Ledger Entry".FINDFIRST THEN
                //      ReverseCharge := "Detailed GST Ledger Entry"."Reverse Charge";
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                field(A; A)
                {
                    Caption = 'Original Copy';

                    trigger OnValidate()
                    begin
                        IF B OR C THEN ERROR('You can Select One by One for every print option');
                    end;
                }
                field(B; B)
                {
                    Caption = 'Duplicate Copy';

                    trigger OnValidate()
                    begin
                        IF A OR C THEN ERROR('You can Select One by One for every print option');
                    end;
                }
                field(C; C)
                {
                    Caption = 'Triplicate Copy';

                    trigger OnValidate()
                    begin
                        IF A OR B THEN ERROR('You can Select One by One for every print option');
                    end;
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

    trigger OnPreReport()
    begin
        Srn := 0;
        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(Picture);
        TotalAmtAfterTax := 0;
        //AmtInWord:='';

    end;

    var
        CompanyInfo: Record "Company Information";
        TotalAmount: Decimal;
        DetailedGSTLedg: Record "Detailed GST Ledger Entry";
        Srn: Integer;
        AmtInWord: Text;
        TotalAmount1: Decimal;
        RecState: Record "State";
        StateDesc: Text[20];
        StateCode: Code[10];
        LocCode: Code[10];
        RecLocation: Record "Location";
        LocCode1: Code[10];
        StateDesc1: Text[20];
        StateCode1: Code[10];
        LocGSTRegNo: Code[20];
        TotalAmtAfterTax: Decimal;
        InvoiceNo: Code[20];
        RecTransferShipLine: Record "Transfer Receipt Line";
        LocToGSTNo: Code[20];
        DetGSTLedEntry: Record "Detailed GST Ledger Entry";
        IGSTPer: Decimal;
        IGSTAmt: Decimal;
        LineAmount: Decimal;
        TotalMRP: Decimal;
        GSTBaseAmt: Decimal;
        TotalAmt: Decimal;
        DiscAmt: Decimal;
        RecStateM: Record "State";
        StateDescM: Text[20];
        StateCodeM: Code[10];
        LocCodeM: Code[10];
        RecLocationM: Record "Location";
        LocCode1M: Code[10];
        StateDesc1M: Text[20];
        StateCode1M: Code[10];
        LocGSTRegNoM: Code[20];
        LocToGSTNoM: Code[20];
        A: Boolean;
        B: Boolean;
        C: Boolean;
        TXT: Text[50];
        timex: Time;
        CGSTAmt: Decimal;
        CGSTPer: Decimal;
        SGSTAmt: Decimal;
        SGSTPer: Decimal;
        RECLOC: Record "Location";
        ReverseCharge: Boolean;
        RepCheck: Report "Check";
        TextNo: array[2] of Text;
        RecLocation1: Record "Location";
        GstStateCode: Code[10];
        RecGstSetup: Record "GST Setup";
        CessAmt: Decimal;
        CessPer: Decimal;
        GST_Code: Code[20];
        GST_Per: Decimal;
        AmtInWordDecimal: Decimal;
        BarcodeNo: Text;
        RecItem: Record "Item";
        SalesPrice: Record "Sales Price";
        MRPPrice: Decimal;
        ItemLedgerEntry: Record "Item Ledger Entry";
        ItemLedgerEntry2: Record "Item Ledger Entry";
        BatchNo: Code[20];

    procedure Inwords(MAMOUNT: Decimal): Text[250]
    var
        INTAMOUNT: Integer;
        PAISE: Integer;
        CRORE: Integer;
        LAKH: Integer;
        THOUSAND: Integer;
        HUNDRED: Integer;
        RUPEE: Integer;
        AMTTEXT: Text[200];
    begin
        INTAMOUNT := ABS(ROUND(MAMOUNT, 1, '<'));

        PAISE := ROUND(ROUND(ROUND(MAMOUNT) - INTAMOUNT) * 100);

        CRORE := ROUND(MAMOUNT / 10000000, 1, '<');
        MAMOUNT := MAMOUNT MOD 10000000;

        LAKH := ROUND(MAMOUNT / 100000, 1, '<');
        MAMOUNT := MAMOUNT MOD 100000;

        THOUSAND := ROUND(MAMOUNT / 1000, 1, '<');
        MAMOUNT := MAMOUNT MOD 1000;

        HUNDRED := ROUND(MAMOUNT / 100, 1, '<');

        RUPEE := ROUND((MAMOUNT MOD 100), 1, '<');
        AMTTEXT += 'Rupees ';
        IF CRORE <> 0 THEN
            AMTTEXT += RNO(CRORE) + ' Crore ';
        IF LAKH <> 0 THEN
            AMTTEXT += RNO(LAKH) + ' Lakh ';
        IF THOUSAND <> 0 THEN
            AMTTEXT += RNO(THOUSAND) + ' Thousand ';
        IF HUNDRED <> 0 THEN
            AMTTEXT += RNO(HUNDRED) + ' Hundred ';
        IF RUPEE <> 0 THEN
            AMTTEXT += RNO(RUPEE) + ' ';

        IF PAISE <> 0 THEN
            AMTTEXT += 'and Paise ' + RNO(PAISE) + '' + 'Only'
        ELSE
            AMTTEXT += 'Only';

        EXIT(AMTTEXT);
    end;

    procedure RNO(NO: Integer): Text[50]
    begin
        IF NO = 1 THEN
            EXIT('One');
        IF NO = 2 THEN
            EXIT('Two');
        IF NO = 3 THEN
            EXIT('Three');
        IF NO = 4 THEN
            EXIT('Four');
        IF NO = 5 THEN
            EXIT('Five');
        IF NO = 6 THEN
            EXIT('Six');
        IF NO = 7 THEN
            EXIT('Seven');
        IF NO = 8 THEN
            EXIT('Eight');
        IF NO = 9 THEN
            EXIT('Nine');
        IF NO = 10 THEN
            EXIT('Ten');
        IF NO = 11 THEN
            EXIT('Eleven');
        IF NO = 12 THEN
            EXIT('Twelve');
        IF NO = 13 THEN
            EXIT('Thirteen');
        IF NO = 14 THEN
            EXIT('Fourteen');
        IF NO = 15 THEN
            EXIT('Fifteen');
        IF NO = 16 THEN
            EXIT('Sixteen');
        IF NO = 17 THEN
            EXIT('Seventeen');
        IF NO = 18 THEN
            EXIT('Eighteen');
        IF NO = 19 THEN
            EXIT('Nineteen');
        IF NO = 20 THEN
            EXIT('Twenty');
        IF NO = 21 THEN
            EXIT('Twenty One');
        IF NO = 22 THEN
            EXIT('Twenty Two');
        IF NO = 23 THEN
            EXIT('Twenty Three');
        IF NO = 24 THEN
            EXIT('Twenty Four');
        IF NO = 25 THEN
            EXIT('Twenty Five');
        IF NO = 26 THEN
            EXIT('Twenty Six');
        IF NO = 27 THEN
            EXIT('Twenty Seven');
        IF NO = 28 THEN
            EXIT('Twenty Eight');
        IF NO = 29 THEN
            EXIT('Twenty Nine');
        IF NO = 30 THEN
            EXIT('Thirty');
        IF NO = 31 THEN
            EXIT('Thirty One');
        IF NO = 32 THEN
            EXIT('Thirty Two');
        IF NO = 33 THEN
            EXIT('Thirty Three');
        IF NO = 34 THEN
            EXIT('Thirty Four');
        IF NO = 35 THEN
            EXIT('Thirty Five');
        IF NO = 36 THEN
            EXIT('Thirty Six');
        IF NO = 37 THEN
            EXIT('Thirty Seven');
        IF NO = 38 THEN
            EXIT('Thirty Eight');
        IF NO = 39 THEN
            EXIT('Thirty Nine');
        IF NO = 40 THEN
            EXIT('Fourty');
        IF NO = 41 THEN
            EXIT('Fourty One');
        IF NO = 42 THEN
            EXIT('Fourty Two');
        IF NO = 43 THEN
            EXIT('Fourty Three');
        IF NO = 44 THEN
            EXIT('Fourty Four');
        IF NO = 45 THEN
            EXIT('Fourty Five');
        IF NO = 46 THEN
            EXIT('Fourty Six');
        IF NO = 47 THEN
            EXIT('Fourty Seven');
        IF NO = 48 THEN
            EXIT('Fourty Eight');
        IF NO = 49 THEN
            EXIT('Fourty Nine');
        IF NO = 50 THEN
            EXIT('Fifty');
        IF NO = 51 THEN
            EXIT('Fifty One');
        IF NO = 52 THEN
            EXIT('Fifty Two');
        IF NO = 53 THEN
            EXIT('Fifty Three');
        IF NO = 54 THEN
            EXIT('Fifty Four');
        IF NO = 55 THEN
            EXIT('Fifty Five');
        IF NO = 56 THEN
            EXIT('Fifty Six');
        IF NO = 57 THEN
            EXIT('Fifty Seven');
        IF NO = 58 THEN
            EXIT('Fifty Eight');
        IF NO = 59 THEN
            EXIT('Fifty Nine');
        IF NO = 60 THEN
            EXIT('Sixty');
        IF NO = 61 THEN
            EXIT('Sixty One');
        IF NO = 62 THEN
            EXIT('Sixty Two');
        IF NO = 63 THEN
            EXIT('Sixty Three');
        IF NO = 64 THEN
            EXIT('Sixty Four');
        IF NO = 65 THEN
            EXIT('Sixty Five');
        IF NO = 66 THEN
            EXIT('Sixty Six');
        IF NO = 67 THEN
            EXIT('Sixty Seven');
        IF NO = 68 THEN
            EXIT('Sixty Eight');
        IF NO = 69 THEN
            EXIT('Sixty Nine');
        IF NO = 70 THEN
            EXIT('Seventy');
        IF NO = 71 THEN
            EXIT('Seventy One');
        IF NO = 72 THEN
            EXIT('Seventy Two');
        IF NO = 73 THEN
            EXIT('Seventy Three');
        IF NO = 74 THEN
            EXIT('Seventy Four');
        IF NO = 75 THEN
            EXIT('Seventy Five');
        IF NO = 76 THEN
            EXIT('Seventy Six');
        IF NO = 77 THEN
            EXIT('Seventy Seven');
        IF NO = 78 THEN
            EXIT('Seventy Eight');
        IF NO = 79 THEN
            EXIT('Seventy Nine');
        IF NO = 80 THEN
            EXIT('Eighty');
        IF NO = 81 THEN
            EXIT('Eighty One');
        IF NO = 82 THEN
            EXIT('Eighty Two');
        IF NO = 83 THEN
            EXIT('Eighty Three');
        IF NO = 84 THEN
            EXIT('Eighty Four');
        IF NO = 85 THEN
            EXIT('Eighty Five');
        IF NO = 86 THEN
            EXIT('Eighty Six');
        IF NO = 87 THEN
            EXIT('Eighty Seven');
        IF NO = 88 THEN
            EXIT('Eighty Eight');
        IF NO = 89 THEN
            EXIT('Eighty Nine');
        IF NO = 90 THEN
            EXIT('Ninety');
        IF NO = 91 THEN
            EXIT('Ninety One');
        IF NO = 92 THEN
            EXIT('Ninety Two');
        IF NO = 93 THEN
            EXIT('Ninety Three');
        IF NO = 94 THEN
            EXIT('Ninety Four');
        IF NO = 95 THEN
            EXIT('Ninety Five');
        IF NO = 96 THEN
            EXIT('Ninety Six');
        IF NO = 97 THEN
            EXIT('Ninety Seven');
        IF NO = 98 THEN
            EXIT('Ninety Eight');
        IF NO = 99 THEN
            EXIT('Ninety Nine');
    end;
}

