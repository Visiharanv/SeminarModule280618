pageextension 123456702 "CSD SourceCodeSetupExt" extends "Source Code Setup" 
// CSD1.00 - 2012-06-15 - D. E. Veloper 
// Chapter 7 - Lab 1-8
{
    layout
    {
        addafter("Cost Accounting")
        {
            group(CSDSeminarGroup)
            {
                Caption = 'Seminar';
            }
        }

        addfirst(CSDSeminarGroup)
        {
            field("CSD Seminar";"CSD Seminar")
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