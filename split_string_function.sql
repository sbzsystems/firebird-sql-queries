
/* 
Function: SPLIT_STRING
Description: Retrieves a specific field from delimited text.
Parameters:
  - AINPUT: Input string to be split (varchar(1000))
  - DELIMITER: Delimiter used to split the input string (varchar(10))
  - NUM: The part number to return (integer)
Returns: The NUM-th part of the split string (varchar(1000))
*/


CREATE OR ALTER function SPLIT_STRING (
    AINPUT varchar(1000),
    DELIMITER varchar(10),
    NUM integer)
returns varchar(1000)
as
declare variable NEXTPOS integer;
declare variable TEMPSTR varchar(1000);
declare variable LASTPOS integer;
declare variable COUNTNUM integer;
begin

  AINPUT = :AINPUT || :DELIMITER;
  LASTPOS = 1;
  COUNTNUM = 1;
  NEXTPOS = position(:DELIMITER, AINPUT);

  while (NEXTPOS > 0) do
  begin
    TEMPSTR = substring(AINPUT from LASTPOS for NEXTPOS - LASTPOS);
    LASTPOS = NEXTPOS + 1;
    NEXTPOS = position(:DELIMITER, AINPUT, LASTPOS);
    if (COUNTNUM = :NUM) then return TEMPSTR;
    COUNTNUM = COUNTNUM+1;
  end

end
