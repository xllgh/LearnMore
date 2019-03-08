
#监控insert, 带控制语句的trigger
delimiter &
create trigger trigger_ord_update_condition
before insert on ord
for each row
begin
declare left_sum int;
select num into left_sum from goods where gid=new.gid;
if left_sum < new.much then
	set new.much = left_sum;
end if;
update goods set num = num - new.much where gid=new.gid;
end&
delimiter ;


#监控delete triggert
delimiter &
create trigger trigger_ord_delete
after delete on ord
for each row
begin
update goods set num = num + old.much where gid = old.gid;
end&
delimiter ;
delete from ord where gid=3;


#监控update trigger
delimiter &
create trigger trigger_ord_update
before update on ord
for each row
begin
update goods set num = num + old.much -new.much where gid=new.gid;
end&
delimiter ;
