pageextension 123456703 ResourceLedgerEntryExt extends "Resource Ledger Entries"
// CSD1.00 - 2018-01-01 - D. E. Veloper 
// Chapter 7 - Lab 4-3
{
    layout
    {
        addlast(Content)
        {
            field("Seminar No.";"CSD Seminar No.") 
            { 

            } 
            
            field("Seminar Registration No."; "CSD Seminar Registration No.") 
            {

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    
    var
        myInt : Integer;
}