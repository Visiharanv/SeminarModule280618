page 123456722 "CSD Seminar Registers"
{
    PageType = List;
    SourceTable = "CSD Seminar Register";
    Caption ='CSD Seminar Registers';
    Editable = false;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.") 
                {}
                field("Creation Date";"Creation Date") 
                {}
                field("User ID";"User ID") 
                {}
                field("Source Code";"Source Code") 
                {}
                field("Journal Batch Name";"Journal Batch Name")
                {}
            }
        }
        area(factboxes)
        {
            systempart("Links"; Links)
            {
            }
            
            systempart("Notes"; Notes)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }

        area(Navigation)
        {
            action("Seminar Ledgers")
            {
                Image=WarrantyLedger;
                RunObject=codeunit "CSD Seminar Reg.-Show Ledger";
            }
        }
    }
}