tableextension 50142 RetailWinterSportsStore extends Customer
{
    fields
    {
        field(50116; ShoeSize; Integer)
        {
            trigger OnValidate();
            begin
                if (rec.ShoeSize < 0) then begin
                    Message('Shoe size not valid: %1', rec.ShoeSize);
                end;
            end;
        }
    }
    procedure HasShoeSize(): Boolean;
    begin
        exit(ShoeSize <> 0);
    end;

    trigger OnBeforeInsert();
    begin
        if not HasShoeSize() then
            ShoeSize := Random(42);
    end;
}