table 123456718 "CSD Posted Seminar Reg. Header"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 6 - Lab 1-3 & Lab 1-4
    //     - Created new table
    Caption = 'Posted Seminar Registration Header';


    Fields
    {
        Field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        Field(2; "Starting Date"; Date)
        {

        }
        Field(3; "Seminar No."; Code[20])
        {
            Caption = 'Seminar No.';
            TableRelation = "CSD Seminar";
        }
        Field(4; "Seminar Name"; Text[50])
        {
            Caption = 'Seminar Name';
        }
        Field(5; "Instructor Resource No."; Code[20])
        {
            Caption = 'Instructor Resource No.';
            TableRelation = Resource where (Type = const (Person));
        }
        Field(6; "Instructor Name"; Text[50])
        {
            Caption = 'Instructor Name';
            CalcFormula = Lookup (Resource.Name where ("No." = Field ("Instructor Resource No."),
                                                      Type = const (Person)));
            Editable = false;
            FieldClass = FlowField;
        }
        Field(7; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Planning,Registration,Closed,Canceled';
            OptionMembers = Planning, Registration, Closed, Canceled;
        }
        Field(8; Duration; Decimal)
        {
            Caption = 'Duration';
            DecimalPlaces = 0 : 1;
        }
        Field(9; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';
        }
        Field(10; "Minimum Participants"; Integer)
        {
            Caption = 'Minimum Participants';
        }
        Field(11; "Room Resource No."; Code[20])
        {
            Caption = 'Room Resource No.';
            TableRelation = Resource where (Type = const (Machine));
        }
        Field(12; "Room Name"; Text[30])
        {
            Caption = 'Room Name';
        }
        Field(13; "Room Address"; Text[30])
        {
            Caption = 'Room Address';
        }
        Field(14; "Room Address 2"; Text[30])
        {
            Caption = 'Room Address 2';
        }
        Field(15; "Room Post Code"; Code[20])
        {
            Caption = 'Room Post Code';
            TableRelation = "Post Code".Code;
            ValidateTableRelation = false;
        }
        Field(16; "Room City"; Text[30])
        {
            Caption = 'Room City';
        }
        Field(17; "Room Country/Reg. Code"; Code[10])
        {
            Caption = 'Room Country/Reg. Code';
            TableRelation = "Country/Region";
        }
        Field(18; "Room County"; Text[30])
        {
            Caption = 'Room County';
        }
        Field(19; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Price';
            AutoFormatType = 1;
        }
        Field(20; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group".Code;
        }
        Field(21; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group".Code;
        }
        Field(22; Comment; Boolean)
        {
            Caption = 'Comment';
            CalcFormula = Exist ("CSD Seminar Comment Line" where 
                ("Table Name" = const ("Posted Seminar Registration"), "No." = Field ("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        Field(23; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        Field(24; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        Field(25; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code".Code;
        }
        Field(26; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series".Code;
        }
        Field(27; "Posting No. Series"; Code[10])
        {
            Caption = 'Posting No. Series';
            TableRelation = "No. Series".Code;
        }

        field(29;"User Id";Code[50]) 
        { 
            Caption='User Id'; 
            TableRelation=User; 
            ValidateTableRelation=false; 

            trigger OnLookup();
            var
                myInt : Integer;
                UserMgt : Codeunit "User Management";
            begin
                
            end;
        }

        field(30;"Source Code";Code[10]) 
        { 
            Caption='Source Code'; 
            TableRelation="Source Code";
        }
    }

    keys
    {
        key(PK; "No.")
        {
        }
        key(Key2; "Room Resource No.")
        {
            SumIndexFields = Duration;
        }
    }

    var
        PostCode: Record "Post Code";
        Seminar: Record "CSD Seminar";
        SeminarCommentLine: Record "CSD Seminar Comment Line";
        SeminarCharge: Record "CSD Seminar Charge";
        SeminarRegHeader: Record "CSD Seminar Reg. Header";
        SeminarRegLine: Record "CSD Seminar Registration Line";
        SeminarRoom: Record Resource;
        SeminarSetup: Record "CSD Seminar Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Text001 : Label 'You cannot delete the Seminar Registration, because there is at least one %1 where %2=%3.';
        Text002 : Label 'You cannot change the %1, because there is at least one %2 with %3=%4.';
        Text004: Label 'This Seminar is for %1 participants. \The selected Room has a maximum of %2 participants \Do you want to change %3 for the Seminar from %4 to %5?';
        Text005: Label 'Should the new %1 be copied to all %2 that are not yet invoiced?';
        Text006: Label 'You cannot delete the Seminar Registration, because there is at least one %1.';

}

