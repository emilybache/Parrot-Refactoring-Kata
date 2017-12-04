unit Math;

interface

function Min(A: Double; B: Double): Double;

function Max(A: Double; B: Double): Double;

implementation

function Min(A: Double; B: Double): Double;
begin
    if A <= B then
    begin
        Min := A;
    end
    else
    begin
        Min := B;
    end;
end;

function Max(A: Double; B: Double): Double;
begin
    if A >= B then
    begin
        Max := A;
    end
    else
    begin
        Max := B;
    end;
end;

end.
