codeunit 123456734 "CSD Seminar Reg.-Show Ledger"
//CSD1.00 - 2018-01-01 - D. E. Veloper 
// Chapter 7 - Lab 2-10
{
    TableNo = "CSD Seminar Register";

    trigger OnRun();
    begin
        SeminarLedgerEntry.SetRange("Entry No.","From Entry No.","To Entry No.");
        Page.Run(Page::"CSD Seminar Ledger Entries");
    end;
    
    var
        SeminarLedgerEntry : Record "CSD Seminar Ledger Entry";
}