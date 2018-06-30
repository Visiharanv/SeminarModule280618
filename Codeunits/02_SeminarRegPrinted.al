codeunit 123456702 "CSD SeminarRegPrinted"
// Chapter 9 - Lab 1-2 
// - Added Codeunit
{
    TableNo = "CSD Seminar Reg. Header";

    trigger OnRun();
    begin
        Find;
        "No. Printed" += 1;
        Modify;
        Commit;
    end;
    
    var
        myInt : Integer;
}