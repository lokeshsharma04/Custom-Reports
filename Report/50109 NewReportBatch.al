report 50109 NewReportBatch
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    trigger OnPreReport()
    begin

        if Confirm('Do you want to DELETE ALL DATA ?', true) then begin
            POB.DeleteAll();
            POBL.DeleteAll();

            GLEntry.DeleteAll();
            PH.DeleteAll();
            PL.DeleteAll();

            SH.DeleteAll();
            SL.DeleteAll();
            TE.DeleteAll();
            GSTLedger.DeleteAll();
            DetGST.DeleteAll();
            CapcityLedEntry.DeleteAll();
            VE.DeleteAll();
            BankAccount.DeleteAll();
            CheckLedger.DeleteAll();
            VLE.DeleteAll();
            CLE.DeleteAll();
            FALedger.DeleteAll();
            ProductionOrder.DeleteAll();
            ProdorderLine.DeleteAll();
            ProdOrder.DeleteAll();
            ProdComline.DeleteAll();
            PostedPurchase.DeleteAll();
            PostedPurchaseLine.DeleteAll();
            pih.DeleteAll();
            piLine.DeleteAll();
            SalesShip.DeleteAll();
            SalesShipLine.DeleteAll();
            SIH.DeleteAll();
            SILINE.DeleteAll();
            TRAREc.DeleteAll();
            TRARELine.DeleteAll();
            TraSHip.DeleteAll();
            TraSHipLine.DeleteAll();

            APPEntry.DeleteAll();
        End;

    end;



    var
        POB: Record "Production BOM Header";
        POBL: Record "Production BOM Line";

        GLEntry: Record "G/L Entry";
        PH: Record "Purchase Header";
        PL: Record "Purchase Line";

        SH: record "Sales Header";
        SL: Record "Sales Line";
        TE: record "TDS Entry";
        GSTLedger: Record "GST Ledger Entry";
        DetGST: Record "Detailed GST Ledger Entry";
        CapcityLedEntry: record "Capacity Ledger Entry";
        VE: record "VAT Entry";
        BankAccount: record "Bank Account Ledger Entry";
        CheckLedger: record "Check Ledger Entry";
        VLE: record "Vendor Ledger Entry";
        CLE: record "Cust. Ledger Entry";
        FALedger: record "FA Ledger Entry";
        ProductionOrder: record "Production Order";
        ProdorderLine: record "Prod. Order Line";
        ProdOrder: record "Prod. Order Component";
        ProdComline: record "Prod. Order Routing Line";
        PostedPurchase: Record "Purch. Rcpt. Header";
        PostedPurchaseLine: Record "Purch. Rcpt. Line";
        pih: Record "Purch. Inv. Header";
        piLine: Record "Purch. Inv. Line";
        SalesShip: Record "Sales Shipment Header";
        SalesShipLine: Record "Sales Shipment Line";
        SIH: Record "Sales Invoice Header";
        SILINE: Record "Sales Invoice Line";
        TRAREc: Record "Transfer Receipt Header";
        TRARELine: Record "Transfer Receipt Line";
        TraSHip: Record "Transfer Shipment Header";
        TraSHipLine: Record "Transfer Shipment Line";
        APPEntry: Record "Approval Entry";





}

