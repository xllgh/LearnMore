use awe;
delimiter &
drop procedure procedureName;

-- create
create procedure procedureName()
begin
	-- sql statement
	select * from ord;
    select * from goods;
    
end&

delimiter ;

-- show procedure 
show procedure status; 


-- invoke
call  procedureName();