report 50104 "Delivery Challan Order_V01"
{
    DefaultLayout = RDLC;
    ApplicationArea = all;
    UsageCategory = Administration;
    RDLCLayout = 'Report/Delivery Challan Order_V011.rdl';
#pragma warning disable 
    dataset
    {
        dataitem("Transfer Shipment Header"; "Transfer Shipment Header")
        {
            RequestFilterFields = "No.";
            // dataitem(CopyLoop; "Integer")
            // {
            //     DataItemTableView = SORTING(Number);
            //     dataitem(PageLoop; "Integer")
            //     {
            //         DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));

            column(ReverseCharge; FORMAT(ReverseCharge))
            {
            }
            column(Outputno; OutputNo) { }//PT
            column(CopyText; CopyText) { }//PT

            column(ReceiptDate_TransferShipmentHeader; FORMAT("Transfer Shipment Header"."Receipt Date"))
            {
            }
            column(No_TransferShipmentHeader; "Transfer Shipment Header"."No.")
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
            column(Transfer_from_Name; "Transfer Shipment Header"."Transfer-from Name")
            { }
            column(Transfer_to_Name; "Transfer Shipment Header"."Transfer-to Name")
            { }
            column(TransferOrderDate_TransferShipmentHeader; FORMAT("Transfer Shipment Header"."Transfer Order Date"))
            {
            }
            column(PostingDate_TransferShipmentHeader; FORMAT("Transfer Shipment Header"."Posting Date"))
            {
            }
            column(VehicleNo_TransferShipmentHeader; "Transfer Shipment Header"."Vehicle No.")
            {
            }
            column(ShipmentDate_TransferShipmentHeader; FORMAT("Transfer Shipment Header"."Shipment Date"))
            {
            }
            column(TransfertoCity_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-to City")
            {
            }
            column(TransporterName_TransferShipmentHeader; '')//"Transfer Shipment Header"."Transporter Name")
            {
            }
            column(SealNo_TransferShipmentHeader; '')// "Transfer Shipment Header"."Seal No.")
            {
            }
            column(ModeofTransport_TransferShipmentHeader; "Transfer Shipment Header"."Mode of Transport")
            {
            }
            column(ReferenceNo_TransferShipmentHeader; '')// "Transfer Shipment Header"."Reference No.")
            {
            }
            column(fromState; RECLOC."State Code")
            {
            }
            column(FromEmail; CompanyInfo."E-Mail")
            {
            }
            column(FromPostCode; RECLOC."Post Code")
            {
            }
            column(fromPhone2; CompanyInfo."Phone No. 2")
            {
            }
            column(FromPhone; CompanyInfo."Phone No.")
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
            column(Fassai; Fassai)
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
            column(TransferOrderNo_TransferShipmentHeader; "Transfer Shipment Header"."Transfer Order No.")
            {
            }
            column(TransferfromCode_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-from Code")
            {
            }
            column(TransferfromName_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-from Name")
            {
            }
            column(TransferfromName2_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-from Name 2")
            {
            }
            column(TransferfromAddress_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-from Address")
            {
            }
            column(TransferfromAddress2_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-from Address 2")
            {
            }
            column(TransferfromPostCode_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-from Post Code")
            {
            }
            column(TransferfromCity_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-from City")
            {
            }
            column(TransferfromCounty_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-from County")
            {
            }
            column(TrsffromCountryRegionCode_TransferShipmentHeader; "Transfer Shipment Header"."Trsf.-from Country/Region Code")
            {
            }
            column(TransfertoCode_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-to Code")
            {
            }
            column(TransfertoName_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-to Name")
            {
            }
            column(TransfertoName2_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-to Name 2")
            {
            }
            column(TotalAmount; TotalAmount)
            {
            }
            column(TransfertoAddress_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-to Address")
            {
            }
            column(TransfertoAddress2_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-to Address 2")
            {
            }
            column(TransfertoPostCode; "Transfer Shipment Header"."Transfer-to Post Code")
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
            column(StateCodeTo; Location."State Code")
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
            column(StateCodeToM; Location."State Code")
            {
            }
            column(LocToGSTNoM; LocToGSTNoM)
            {
            }
            column(LocPanNoM; LocPanNoM)
            {
            }
            column(LocPanNo; LocPanNo)
            {
            }
            column(Srn; Srn)
            {
            }
            column(Today; FORMAT(TODAY))
            {
            }
            column(Structure_TransferShipmentHeader; '')//"Transfer Shipment Header".Structure)
            {
            }
            // column(Eway_1; "Transfer Shipment Header"."Eway Bill No.")
            // {
            // }PT
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
            dataitem("Transfer Shipment Line"; "Transfer Shipment Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = WHERE(Quantity = FILTER(<> 0));
                RequestFilterFields = "Document No.";

                column(TotalAmounttoTransfer_TransferShipmentLine; 0)// "Transfer Shipment Line"."Total Amount to Transfer")
                {
                }
                column(GST_Per; GST_Per)
                {
                }
                column(GST_Code; GST_Code)
                {
                }
                column(UnitofMeasureCode_TransferShipmentLine; "Transfer Shipment Line"."Unit of Measure Code")
                {
                }
                column(HSNSACCode_TransferShipmentLine; "Transfer Shipment Line"."HSN/SAC Code")
                {
                }
                column(TotalGSTAmount_TransferShipmentLine; 0)// "Transfer Shipment Line"."Total GST Amount")
                {
                }
                column(GST_PERC; "Transfer Shipment Line"."GST Group Code")
                {
                }
                column(GSTBaseAmount_TransferShipmentLine; 0)//"Transfer Shipment Line"."GST Base Amount")
                {
                }
                column(ItemCategoryCode_TransferShipmentLine; "Transfer Shipment Line"."Item Category Code")
                {
                }
                column(Amount_TransferShipmentLine; "Transfer Shipment Line".Amount)
                {
                }
                column(UnitPrice_TransferShipmentLine; "Transfer Shipment Line"."Unit Price")
                {
                }
                column(ShipmentDate_TransferShipmentLine; "Transfer Shipment Line"."Shipment Date")
                {
                }
                column(ItemNo_TransferShipmentLine; "Transfer Shipment Line"."Item No.")
                {
                }
                column(Quantity_TransferShipmentLine; "Transfer Shipment Line".Quantity)
                {
                }
                column(UnitofMeasure_TransferShipmentLine; "Transfer Shipment Line"."Unit of Measure")
                {
                }
                column(Description_TransferShipmentLine; "Transfer Shipment Line".Description)
                {
                }
                column(TotalAmtAfterTax; TotalAmtAfterTax)
                {
                }
                column(AmtInWord; AmtInWord)
                {
                }
                column(LineAmount; LineAmount)
                {
                }
                column(Amount; Amount)
                {

                }
                column(IGSTPer; IGSTPer)
                {
                }
                column(IGSTAmt; IGSTAmt)
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
                column(CGSTAmt; CGSTAmt)
                {
                }
                column(CGSTPer; CGSTPer)
                {
                }
                column(SGSTAmt; SGSTAmt)
                {
                }
                column(SGSTPer; SGSTPer)
                {
                }
                column(CessAmt; CessAmt)
                {
                }
                column(BarcodeNo; BarcodeNo)
                {
                }
                column(MRPPrice; MRPPrice)
                {
                }
                column(PackageCode_TransferShipmentLine; '')// "Transfer Shipment Line"."Package Code")
                {
                }

                trigger OnAfterGetRecord()
                var
                begin
                    CLEAR(BarcodeNo);
                    CLEAR(BatchNo); //TRI AS 210818 ADD
                                    /*RecItem.GET("Transfer Shipment Line"."Item No.");
                                    Barcodes.RESET;
                                    Barcodes.SETRANGE("Item No.","Transfer Shipment Line"."Item No.");
                                    IF Barcodes.FINDFIRST THEN
                                      BarcodeNo := Barcodes."Barcode No.";
                                    */
                                    //TRI AS 210818 START
                    ItemLedgerEntry.RESET;
                    ItemLedgerEntry.SETRANGE("Document No.", "Transfer Shipment Line"."Document No.");
                    ItemLedgerEntry.SETRANGE("Item No.", "Transfer Shipment Line"."Item No.");
                    IF ItemLedgerEntry.FINDFIRST THEN BEGIN
                        BatchNo := ItemLedgerEntry."Lot No.";

                        // ItemLedgerEntry2.RESET;
                        // ItemLedgerEntry2.SETRANGE("Lot No.", BatchNo);
                        // ItemLedgerEntry2.SETRANGE("Item No.", "Transfer Shipment Line"."Item No.");
                        // ItemLedgerEntry2.SETFILTER(Barcode, '<>%1', '');
                        // IF ItemLedgerEntry2.FINDFIRST THEN BEGIN
                        //     BarcodeNo := ItemLedgerEntry2.Barcode;
                        // END;
                    END;
                    //TRI AS 210818 STOP
                    CLEAR(MRPPrice);
                    SalesPrice.RESET;
                    SalesPrice.SETRANGE("Item No.", "Transfer Shipment Line"."Item No.");
                    IF SalesPrice.FINDLAST THEN
                        MRPPrice := SalesPrice."Unit Price";

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
                    DiscAmt := (TotalMRP - ("Unit Price" * Quantity));

                    //   IF "GST Base Amount" = 0 THEN
                    //       GSTBaseAmt := ("Unit Price" * Quantity)
                    //   ELSE
                    //       GSTBaseAmt := "GST Base Amount";




                    //   DetGSTLedEntry.RESET;
                    //   DetGSTLedEntry.SETRANGE("Document No.", "Transfer Shipment Header"."No.");
                    //   DetGSTLedEntry.SETRANGE("Original Doc. Type", DetGSTLedEntry."Original Doc. Type"::"Transfer Shipment");
                    //   DetGSTLedEntry.SETRANGE("Document Line No.", "Transfer Shipment Line"."Line No.");
                    //   IF DetGSTLedEntry.FINDFIRST THEN BEGIN
                    //       IF DetGSTLedEntry."GST Component Code" = 'IGST' THEN BEGIN
                    //           IGSTAmt := DetGSTLedEntry."GST Amount" * (-1);
                    //           IGSTPer := DetGSTLedEntry."GST %";
                    //           GST_Code := 'IGST';
                    //           GST_Per := DetGSTLedEntry."GST %";
                    //           //LineAmount:=GSTBaseAmt+IGSTAmt;
                    //           //AmtInWordDecimal +=GSTBaseAmt+IGSTAmt;
                    //       END;
                    /* IF DetGSTLedEntry."GST Component Code"='CESSINTE' THEN BEGIN
                       CessAmt:=DetGSTLedEntry."GST Amount"*(-1);
                       CessPer:=DetGSTLedEntry."GST %";
                     END;*/

                    //   END
                    //   ;

                    //   DetGSTLedEntry.RESET;
                    //   DetGSTLedEntry.SETRANGE("Document No.", "Transfer Shipment Header"."No.");
                    //   DetGSTLedEntry.SETRANGE("Original Doc. Type", DetGSTLedEntry."Original Doc. Type"::"Transfer Shipment");
                    //   DetGSTLedEntry.SETRANGE("Document Line No.", "Transfer Shipment Line"."Line No.");
                    //   IF DetGSTLedEntry.FINDSET THEN
                    //       REPEAT
                    //           IF DetGSTLedEntry."GST Component Code" = 'CESSINTE' THEN BEGIN
                    //               CessAmt := DetGSTLedEntry."GST Amount" * (-1);
                    //               CessPer := DetGSTLedEntry."GST %";
                    //           END;
                    //       UNTIL DetGSTLedEntry.NEXT = 0;
                    /*ELSE BEGIN
                    */

                    IF RecLocation1.GET("Transfer Shipment Line"."Transfer-to Code") THEN
                        GstStateCode := RecLocation1."State Code";

                    //   RecGstSetup.RESET;
                    //   RecGstSetup.SETRANGE("GST State Code", GstStateCode);
                    //   RecGstSetup.SETRANGE("GST Group Code", "Transfer Shipment Line"."GST Group Code");
                    //   RecGstSetup.SETFILTER("GST Component", '%1', 'CGST');
                    //   IF RecGstSetup.FINDFIRST THEN BEGIN
                    //       CGSTAmt := (GSTBaseAmt * RecGstSetup."GST Component %") / 100;
                    //       CGSTPer := RecGstSetup."GST Component %";
                    //       GST_Code := 'CGST+SGST';
                    //       GST_Per := RecGstSetup."GST Component %" * 2;
                    //   END;

                    //   RecGstSetup.RESET;
                    //   RecGstSetup.SETRANGE("GST State Code", GstStateCode);
                    //   RecGstSetup.SETRANGE("GST Group Code", "Transfer Shipment Line"."GST Group Code");
                    //   RecGstSetup.SETFILTER("GST Component", '%1', 'CESS');
                    //   IF RecGstSetup.FINDFIRST THEN BEGIN
                    //       CessAmt := (GSTBaseAmt * RecGstSetup."GST Component %") / 100;
                    //       CessPer := RecGstSetup."GST Component %";
                    //   END;
                    //END;


                    // AmtInWordDecimal += GSTBaseAmt + (CGSTAmt * 2) + IGSTAmt + CessAmt;
                    // LineAmount := GSTBaseAmt + (CGSTAmt * 2) + IGSTAmt + CessAmt;

                    AmtInWordDecimal += GSTBaseAmt + IGSTAmt;
                    LineAmount := GSTBaseAmt + IGSTAmt;

                    RecTransferShipLine.RESET;
                    RecTransferShipLine.SETRANGE(RecTransferShipLine."Document No.", "Transfer Shipment Header"."No.");
                    IF RecTransferShipLine.FINDSET THEN
                        REPEAT
                            //  IF "GST Base Amount" <> 0 THEN
                            //      TotalAmt += ROUND((RecTransferShipLine."Unit Price" * RecTransferShipLine.Quantity) + IGSTAmt)
                            //  ELSE
                            TotalAmt += ROUND((RecTransferShipLine."Unit Price" * RecTransferShipLine.Quantity));
                        UNTIL RecTransferShipLine.NEXT = 0;



                    //Akshat  --->issue
                    // RepCheck.InitTextVariable;
                    // RepCheck.FormatNoText(TextNo, ROUND(AmtInWordDecimal, 1));
                    // AmtInWord := TextNo[1];

                end;
            }

            trigger OnAfterGetRecord()
            begin
                //PT 
                // if Number > 1 then begin
                //     CopyText := FormatDocument.GetCOPYText;
                //     OutputNo += 1;
                // end;//PT

                //TRI MJ 220218
                TXT := '';
                timex := TIME;
                IF A THEN TXT := 'Original Copy';
                IF B THEN TXT := 'Duplicate Copy';
                IF C THEN TXT := 'Triplicate Copy';
                //TRI MJ 220218
                LocCode := '0';
                StateCode := '';
                StateDesc := '';
                StateCode1 := '';
                StateDesc1 := '';
                LocCode1 := '0';
                LocToGSTNo := '';
                LocPanNo := '';
                RECLOC.RESET;
                IF RECLOC.GET("Transfer Shipment Header"."Transfer-from Code") THEN;
                //  location.RESET;
                Clear(location);
                IF location.Get("Transfer Shipment Header"."Transfer-to Code") Then;
                //check kro 
                RecLocation.RESET;
                RecLocation.SETRANGE(RecLocation.Code, "Transfer Shipment Header"."Transfer-to Code");
                IF RecLocation.FINDFIRST THEN BEGIN
                    LocCode := RecLocation."State Code";
                    LocGSTRegNo := RecLocation."GST Registration No."
                END;

                RecState.RESET;
                RecState.SETRANGE(RecState.Code, LocCode);
                IF RecState.FINDFIRST THEN BEGIN
                    StateDesc := RecState.Description;
                    //    StateCode := RecState."State Code for TIN";
                    // MESSAGE(FORMAT(StateDesc));
                END;


                RecLocation.RESET;
                RecLocation.SETRANGE(RecLocation.Code, "Transfer Shipment Header"."Transfer-to Code");
                IF RecLocation.FINDFIRST THEN BEGIN
                    LocCode1 := RecLocation."State Code";
                    LocToGSTNo := RecLocation."GST Registration No.";
                    // LocPanNo := RecLocation."PAN No.";
                END;
                RecState.RESET;
                RecState.SETRANGE(RecState.Code, LocCode1);
                IF RecState.FINDFIRST THEN BEGIN
                    StateDesc1 := RecState.Description;
                    //   StateCode1 := RecState."State Code for TIN";
                    // MESSAGE(FORMAT(StateDesc));
                END;
                LocCodeM := '0';
                StateCodeM := '0';
                StateDescM := '';
                StateCode1M := '0';
                StateDesc1M := '';
                LocCode1M := '0';
                LocToGSTNoM := '';
                LocPanNoM := '';


                RecLocation.RESET;
                RecLocation.SETRANGE(RecLocation.Code, "Transfer Shipment Header"."Transfer-from Code");
                IF RecLocation.FINDFIRST THEN BEGIN
                    LocCodeM := RecLocation."State Code";
                    LocGSTRegNoM := RecLocation."GST Registration No.";
                    //   LocPanNoM := RecLocation."PAN No.";
                END;

                RecState.RESET;
                RecState.SETRANGE(RecState.Code, LocCodeM);
                IF RecState.FINDFIRST THEN BEGIN
                    StateDescM := RecState.Description;
                    //  StateCodeM := RecState."State Code for TIN";
                    // MESSAGE(FORMAT(StateDesc));
                END;


                RecLocation.RESET;
                RecLocation.SETRANGE(RecLocation.Code, "Transfer Shipment Header"."Transfer-from Code");
                IF RecLocation.FINDFIRST THEN BEGIN
                    LocCode1M := RecLocation."State Code";
                    LocToGSTNoM := RecLocation."GST Registration No.";
                    Fassai := RecLocation."Fassi Code";
                END;

                RecState.RESET;
                RecState.SETRANGE(RecState.Code, LocCode1M);
                IF RecState.FINDFIRST THEN BEGIN
                    StateDesc1M := RecState.Description;
                    //    StateCode1M := RecState."State Code for TIN";
                    // MESSAGE(FORMAT(StateDesc));
                END;

                //  ReverseCharge := FALSE;
                //  DetGSTLedEntry.RESET;
                //  DetGSTLedEntry.SETRANGE("Document No.", "Transfer Shipment Header"."No.");
                //  DetGSTLedEntry.SETRANGE("Original Doc. Type", DetGSTLedEntry."Original Doc. Type"::"Transfer Shipment");
                //  IF "Detailed GST Ledger Entry".FINDFIRST THEN
                //      ReverseCharge := "Detailed GST Ledger Entry"."Reverse Charge";
            end;

            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                // NoOfLoops := ABS(NoOfCopies) + 1;
                // CopyText := '';
                // SETRANGE(Number, 1, NoOfLoops);
                // OutputNo := 1;
                Srn := 0;

                //   Comanyinfo.Get();
            end;

            trigger OnPostDataItem()
            var

            begin
                //  Comanyinfo.Get();

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
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        IF B OR C THEN ERROR('You can Select One by One for every print option');

                    end;
                }
                field(B; B)
                {
                    Caption = 'Duplicate Copy';
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        IF A OR C THEN ERROR('You can Select One by One for every print option');
                    end;
                }
                field(C; C)
                {
                    Caption = 'Triplicate Copy';
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        IF A OR B THEN ERROR('You can Select One by One for every print option');
                    end;
                }
                field(NoOfCopies; NoOfCopies)
                {
                    ApplicationArea = all;
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

    trigger OnPostReport()
    var
        myInt: Integer;
    begin
        Srn := 0;
    end;

    var

        ShowUnitCost: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        OutputNo: Integer;
        FormatDocument: Codeunit "Format Document";
        CompanyInfo: Record "Company Information";
        TotalAmount: Decimal;
        DetailedGSTLedg: Record "Detailed GST Ledger Entry";
        Srn: Integer;
        AmtInWord: Text;
        TotalAmount1: Decimal;
        Fassai: Text[20];
        Location_g: Record Location;
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
        RecTransferShipLine: Record "Transfer Shipment Line";
        LocToGSTNo: Code[20];
        DetGSTLedEntry: Record "Detailed GST Ledger Entry";
        IGSTPer: Decimal;
        IGSTAmt: Decimal;
        LineAmount: Decimal;
        TotalMRP: Decimal;
        GSTBaseAmt: Decimal;
        TotalAmt: Decimal;
        DiscAmt: Decimal;
        RecStateM: Record "state";
        StateDescM: Text[20];
        StateCodeM: Code[10];
        LocCodeM: Code[10];
        RecLocationM: Record "Location";
        LocCode1M: Code[10];
        StateDesc1M: Text[20];
        StateCode1M: Code[10];
        LocGSTRegNoM: Code[20];
        location: record location;

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
        //   Barcodes: Record "99001451";
        Comanyinfo: Record "Company Information";
        SalesPrice: Record "Sales Price";
        MRPPrice: Decimal;
        ItemLedgerEntry: Record "Item Ledger Entry";
        ItemLedgerEntry2: Record "Item Ledger Entry";
        BatchNo: Code[20];
        LocPanNoM: Code[10];
        LocPanNo: Code[10];

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

