/*********************************************************/ 
function:SQL MSSQL TECHNOLOGY ARTICLE 
file :SQL-MSSQL.TXT 
author :chinayaosir QQ:44633197 
Tools :MSSQL QUERY ANALYSIS 
date :4/01/2010 
blog :http://blog.csdn.net/chinayaosir 
note :��ֹ������վת�ش����� 
/*********************************************************/ 
Ŀ¼�嵥CONTEXT LIST 
/*********************************************************/ 
1.���ݿ�DataBase 
1.1���ݿ⽨��/ɾ��create/drop database 
1.2���ݿⱸ����ָ�backup/restore database 
/*********************************************************/ 
2.���ݲ�ѯDATA QUERY LANGUAGE 
2.1ѡ���ѯSelect Query 
2.2�ۼ���ѯAggregate Query 
2.3�Ӳ�ѯ Sub Query 
2.4���Ӳ�ѯTable Joins 
2.5���ܲ�ѯGroup Query 
/*********************************************************/ 
3.�����޸�DATA MODIFY LANGUAGE 
3.1��������Insert 
3.2�޸�����Update 
3.3ɾ������Delete 
/*********************************************************/ 
4.���ݶ���DATA DEFINE LANGUAGE 
4.1��Table 
4.2��Column 
4.3����Identity 
4.4Լ��Constraints 
4.5����Index 
4.6��ͼview 
4.7Ȩ��Privilege 
/*********************************************************/ 
5.���ݿ⺯��Functions 
5.1ת������Data Convert Functions 
5.2�ۼ�����Aggregate Functions 
5.3�ַ�����char Functions 
5.4���ں���Date Functions 
5.5��ѧ����Math Functions 
5.6��������Analytical Functions 
/*********************************************************/ 
6.���ݿ�ű�Script 
6.1��������Data Types 
6.2�ű��﷨Statements 
6.3�ű��α�Cursor 
6.4�洢����Procedure 
6.5�洢����Function 
6.6������Trigger 
6.7����Transaction 
6.8����Other 
/*********************************************************/ 

SQL��ϸ SQL DETAIL 
/**********************************************************/ 
1.���ݿ�DataBase 
1.1���ݿ⽨��/ɾ��create/drop database 
1.2������ָ�backup/restore database 
/**********************************************************/ 
1.1���ݿ⽨��/ɾ��create/drop database 
1.1.1.�������ݿ� 
�﷨:create database <���ݿ���> ������������ 
����: 
//�������ݿ� hr 
create database hr 

1.1.2.ɾ�����ݿ⡣ 
�﷨:drop database <���ݿ���> 
����: 
//ɾ�����ݿ�hr 
drop database hr 
//�������hr���ݿ�,��ɾ�����ݿ�hr 
IF DB_ID('hr') IS NOT NULL 
DROP DATABASE TestDB 
----------------------------------------------------------- 
1.2������ָ�backup/restore database 
1.2.1.��ӱ����豸 
�﷨:sp_addumpdevice <keyword> <devicename> <devicepath> 

����: 
//��ӱ����豸Ϊ����Ӳ�� 
sp_addumpdevice 'disk', 'localbackup', 'e:\database\backup\localbak.bak' 
//���ݵ�����Ӳ�� 
sp_addumpdevice 'disk', 'netbackup', '\\computer1\database\backup\netbak.bak' 
//���ݵ��Ŵ� 
sp_addumpdevice 'tape', 'tapebackup', '\\.\tape1bak' 
//���ݵ������ܵ� 
sp_addumpdevice 'pipe', 'pipebackup', 'e:\database\backup\pipebak' 

1.2.2.�������ݿ� 
�﷨:backup database <databasename> to <devicename>| disk=<backupnamepath> 

����: 
//�������ݿ⵽�����豸 
backup database pubs to localbackup 
//�������ݿ⵽ָ��·�������ָ���ļ� 
backup database pubs to disk='e:\database\backup\pubsbak.bak' 

1.2.3.�ָ����ݿ� 
�﷨:restore database <databasename> from <devicename>| disk=<backupnamepath> 
����: 
//�ӱ����豸�лָ����ݿ� 
restore database pubs from localbackup 
//�ӱ����ļ��лָ����ݿ� 

/**********************************************************/ 
2.���ݲ�ѯDATA QUERY LANGUAGE 
2.1ѡ���ѯSelect Query 
2.2�Ӳ�ѯ Sub Query 
2.3���Ӳ�ѯTable Joins 
2.4���ܲ�ѯGroup Query 
----------------------------------------------------------- 
2.1ѡ���ѯSelect Query 
�﷨: 
select [top n][/all]/[distinct] [*] / [columnlist...] [<columnlist as alias...] [const/sql/function expression] 
from (<tablelist,>...) [as alias] 
[where search expression...] 
[group by groupnamelist ....] 
[having search-expression...] 
[order by sort-expression...] 

//selectѡ��˵��: 
top n:ֻ��ʾ��һ����n����¼ 
//�ظ��벻�ظ���¼ 
all:��ʾ�����ظ��ļ�¼ 
distinct:��ʾȥ���ظ��ļ�¼ 
//�����ֶ���ѡ���ֶκ��ֶα��� 
*:��ʾ���е����� 
columnlist:��ʾ�ֶ��б� 
columnlist as alias:��ʾ�ֶεı��� 

//�����ֶ� 
const-expression:�������ʽ(������/�ַ���/����/ʱ�䳣��) 
sql-expression:������sql���ļӼ��˳����ʽ�����ֶ� 
function expression:���ݿ⺯�����Զ��庯���ֶ� 

//�������� 
�Ƚϲ�������(=,<>,>,<,>=,<=) 
��Χ��������(betweeen ����ֵ and ����ֵ) 
��Ա��������(in,not in) 
���ڲ�������(exists,not exists) 
ƥ���������(like) 
�޶���������(any,all) 
��ֵ��������(is null) 

//������������(and, or,not,()) 
and:�߼������� 
and:�߼������� 
not:�߼������� 
():�ɸı����ȼ�������� 

//�Ӿ�˵�� 
select�Ӿ�:ָ�������������� 
from �Ӿ�:ָ�����������ݱ� 
where �Ӿ�:ָ���������������� 
group by�Ӿ�:ָ�����������ݽ��л��� 
having�Ӿ�:ָ�����������ݽ��л���֮ǰ������ 
order by�Ӿ�:ָ������������������������ 
����: 
//�����ֶη�ʽ��ʾordersȫ����¼ 
select * from orders 
//���ֶ���ʾȫ����¼ 
select order_num,order_date,amount from orders 
//���ֶ���ʾȫ����¼,�������ظ��ļ�¼ 
select order_num,order_date,amount from orders 
//��sql-expression����������� 
select amount,amount*0.08 as discount_amt from orders 
//���Զ��庯������ָ���� 
select order_num,order_date,amount,f_amt_to_chn(amount) as ��� from orders 

selectѡ��̫�࣬�������Ӿ�ʡ��... 
----------------------------------------------------------- 
2.2�Ӳ�ѯ Sub Query 
�﷨:select ... 
from <tablename> 
where / having column �������� (Sub Query) 
//�������� 
�Ƚϲ�������(=,<>,>,<,>=,<=) 
��Χ��������(betweeen ����ֵ and ����ֵ) 
��Ա��������(in,not in) 
���ڲ�������(exists,not exists) 
ƥ���������(like) 
�޶���������(any,all) 
��ֵ��������(is null) 

����: 
//�г�û���������Ŀ��10%��������Ա�嵥[<����] 
select name from salesreps where quota < (0.1 * select sum(target) from offices)) 
//�г���˾������Ŀ�곬������������Ա�����ܺ͵����۵�[>����] 
select city from offices where target > (select sum(quota) from salesreps where rep_office=office) 
//�г���������Ŀ������۵��ҵ����Ա[in����] 
select name from salesreps where office in (select office from offies where sales > target) 
//�г���������2500Ԫ�Ĳ�Ʒ����[exists����] 
select description from products where exists ( 
select * from orders where product=prodct_id and amount > 2500.00 
) 
//�г��������Ŀ��10%��������Ա�嵥[any����] 
select name from salesreps where (0.1* quota) < any(select amount from orders where rep=empl_num) 

----------------------------------------------------------- 
2.3���Ӳ�ѯTable Joins 
����������Ϳɷ�Ϊ����(��/��/��������) 
���ӱ���߸��ӱ���ж�����Ӷ���������������й��� 
Outer joins(LEFT OUTER, RIGHT OUTER, and FULL OUTER joins) 
left outer join:��ѯ�Ľ������߱�����Ϊ׼ 
right outer join:��ѯ�Ľ�����ұ߱�����Ϊ׼ 

2.3.1.������inner join 
����: 
�﷨: 
SELECT select_list 
FROM table_1 
[INNER] JOIN table_2 
ON join_condition_1 
[[INNER] JOIN table_3 
ON join_condition_2]... 
����: 
//û��where�Ӿ�������� 
SELECT * 
FROM Products 
INNER JOIN Suppliers 
ON Products.SupplierID = Suppliers.SupplierID 

//��where�Ӿ�������� 
SELECT p.ProductID, s.SupplierID, p.ProductName, s.CompanyName 
FROM Products p 
INNER JOIN Suppliers s 
ON p.SupplierID = s.SupplierID 
WHERE p.ProductID < 4 

----------------------------------------------------------- 
2.3.2.������outer join 
����:������������LEFT OUTER, RIGHT OUTER, and FULL OUTER joins 
left outer :��ѯ�Ľ������߱�����Ϊ׼ 
right outer :��ѯ�Ľ�����ұ߱�����Ϊ׼ 
�﷨:select ... from table1 [left/right/full outer join ]table2 where ... 
����: 
//��Customers������Ϊ��׼ȥ����Orders�� 
SELECT c.CustomerID, CompanyName 
FROM Customers c 
LEFT OUTER JOIN Orders o 
ON c.CustomerID = o.CustomerID 
WHERE o.CustomerID IS NULL 

----------------------------------------------------------- 
2.3.3.��������cross join 
����:�����ӱ���߸��ӱ�֮��������������ӣ������Եѿ����˻�����Ľ�� 
�﷨:select ... from table1 cross join table2 where ... 

����: 
//��ʾ����Ա�1����*��2���� 
����DepartmentsΪ4�м�¼ 
����JobsΪ3�м�¼ 
�������ʾ���Ϊ4*3=12�м�¼ 
SELECT deptname,jobdesc FROM Departments CROSS JOIN Jobs 
//�ùؼ���ƥ��Ľ������� 
oc_head/oc_detail�����ӱ� 
oc_head(����oc_number) 
oc_detail(����oc_number,item_number,ship_date) 

SELECT h.customerid,d.item_number,d.ship_date 
from oc_head as h CROSS JOIN oc_detail as d 
where h.oc_number=d.oc_number 
----------------------------------------------------------- 
2.4���ܲ�ѯGroup Query 
//���ܲ�ѯ�൱�ڻ�Ʊ����е�С�ƻ��ܵĹ��� 

�﷨: select ... 
from <tablename> 
group by <column-name > 
[having search expression] 

����: 
//���ÿ��������Ա�����۽�� 
select rep,sum(amount) from orders group by rep 
//ÿ�����۵�����˶���������Ա 
select rep_office,count(*) from salesreps group by rep_office 
//����ÿ��������Ա��ÿ���ͻ��Ͷ������ 
select cust,rep,sum(amount) from orders group by cust,rep 
//Having�Ӿ�Ӧ�� 
select rep,avg(amount) from orders having sum(quota) > 3000.00 

/**********************************************************/ 
3.�����޸�DATA MODIFY LANGUAGE 
3.1��������Insert 
3.2�޸�����Update 
3.3ɾ������Delete 
----------------------------------------------------------- 
3.1��������Insert 
3.1.1.���в��� 
�﷨:insert into <tablename>[<columnlist,>...] values(<valuelist,>...); 

����: 
//��ʡ���ֶ��嵥 
insert into salesreps(name,age,empl_no,sales,title,hire_date,rep_office) 
values('jack toms',36,111,0.00,'sales mgr','10-05-2010',13) 
//ʡ���ֶ��嵥 
insert into salesreps 
values('jack toms',36,111,0.00,'sales mgr','10-05-2010',13) 
3.1.2.���в��� 
�﷨:insert into <tablename>[(<columnlist,>...)] values(<valuelist,>...) <select Query>; 

����: 
//��һ�������������뵽һ�����ݱ��� 
insert into history_order(order_num,order_date,amount) 
select order_num,order_date,amount 
from orders where order_date < '01/01/2000' 
----------------------------------------------------------- 
3.2�޸�����Update 
�﷨:update <tablename> set (cloumn=expression...) [where ...] [SubQuery..] 

����: 
//�������м�¼ 
update salesreps set quota=1.05 * quota 
//���������±��¼ 
update salesreps set quota=1.08 * quota where area='china' 
//���Ӳ�ѯ���±��¼ 
update customers set cust_rep=105 
where cust_rep in ( 
selct empl_num from salesreps where sales < (0.8 * quota) 
) 

----------------------------------------------------------- 
3.3ɾ������Delete 
�﷨1:delete from <tablename> [where ...] 
����: 
//����ɾ����¼ 
delete from orders 

�﷨2:truncate table <tablename> 
����2: 
//����ɾ����¼ 
truncate table orders 

//������ɾ����¼ 
delete from orders where order_date < '01/01/2000' 

/**********************************************************/ 
4.���ݶ���DATA DEFINE LANGUAGE 
4.1��Table 
4.2��Column 
4.3����Indentity 
4.4Լ��Constraints 
4.5����Index 
4.6��ͼview 
4.7Ȩ��Privilege 
/**********************************************************/ 
4.1��Table 
4.1.1.������ 
�﷨: 
create table <����>( 
<����> <��������> [����] <,> 
<����...> 
) 

����: 
//������˾���ű� 
create table tb_basic_dept( 
id int not null, 
name varchar(20) , 
chair varchar(20) 
) 

4.1.2.ɾ���� 
�﷨: 
drop table <����> 
����: 
//ɾ�����ű� 
drop table tb_basic_dept 
----------------------------------------------------------- 
4.2��Column 
4.2.1.����� 
�﷨: 
alter table <����> add 
<����> <��������> [����] <,> 
<����...> 

����: 
alter table tb_basic_dept add 
remark varchar(50) 
4.2.2.��ɾ�� 
�﷨:alter table <����> drop column <����> 
����: 
alter table tb_basic_dept drop column remark 

4.2.3.���޸� 
�﷨:alter table <����> alter column 
<����> <��������> [����] [null | not null] 

����: 
//�޸Ĺ�����Ϊdec(8,2) 
alter table tb_hr_gz alter column gz dec(8,2) null 
----------------------------------------------------------- 
4.3����Identity 
//�ر�Ҫ�� 
IDENTITY�ֶ���������ֻ����(int, bigint, smallint, tinyint, decimal, or numeric(x,0)) 
IDENTITY�ֶα�����not nullԼ�� 

4.3.1Identity 
�﷨: 
IDENTITY(<data_type> [, <seed>, <increment>]) AS column_name, 

����: 
//ʹ��Identity 
CREATE TABLE MyTable ( 
key_col int NOT NULL IDENTITY (1,1), 
abc char(1) NOT NULL 
) 
INSERT INTO MyTable VALUES ('a') 
INSERT INTO MyTable VALUES ('b') 
INSERT INTO MyTable VALUES ('c') 

----------------------------------------------------------- 
4.4Լ��Constraints 
4.4.1ȱʡԼ��(default) 
4.4.2�ǿ�Լ��(not null) 
4.4.3����Լ��(rule) 
4.4.4���Լ��(check) 
4.4.5ΨһԼ��(unique) 
4.4.6����Լ��(primary key) 
4.4.7���Լ��(foreign key) 
4.4.8��ҵ����(business rule) 

������������Ϊ��������ʾ 
create table tb_hr_bm( 
bm varchar(20) not null , 
remark varchar(100) default '' 
) 
create table tb_hr_gz( 
id int not null, 
name varchar(30) not null, 
hrid char(18) null, 
workage int null , 
bm varchar(20) null, 
gz real null, 
remark varchar(100) null 
) 
hrid=���֤���� 
workage=�������� 
gz=���ʽ�� 
----------------------------------------------------------- 
4.4.1ȱʡԼ��(default) 
�﷨:CREATE DEFAULT default_name AS expression 
����:CREATE DEFAULT zip_default AS 94710 
----------------------------------------------------------- 
4.4.2�ǿ�Լ��(not null) 
//������������������ֶα���Ϊnot null. 
�﷨:create table (column-name datatype not null... ) 
����:create table tb_hr_gz(id int not null,...) 
----------------------------------------------------------- 
4.4.3����Լ��(rule) 
�﷨:CREATE RULE rulename AS condition 
����: 
//�ʱ����6λ100000-999999 
//����һ���Զ���zip���� 
CREATE TYPE zip FROM CHAR(6) NOT NULL 
//����һ������Լ�� 
CREATE RULE zip_rule AS @number >100000 and @number < 999999 
//�󶨹���Լ����zip���� 
EXEC sp_bindrule zip_rule, 'zip' 
//Ӧ���Զ���zip���� 
2> CREATE TABLE address( 
city CHAR(25) NOT NULL, 
zip_code ZIP, 
street CHAR(30) NULL 
) 

----------------------------------------------------------- 

4.4.4���Լ��(����/ɾ��) 
//���Լ������ 
�﷨: 
alter table name 
add constraint <���Լ����> check<ȡֵ��Χ���ʽ> 

����: 
//�������ȡֵ��Χ0 ~ 1000000 
����1: 
create table tb_hr_gz( 
gz real default 0.0 check(gz >=0 and gz <=1000000), 
... 
) 
����2: 
alter table tb_hr_gz 
add constraint tb_hr_gz_ck check(gz >=0 and gz <=1000000) 

//���Լ��ɾ�� 
�﷨: 
alter table name drop constraint <���Լ����> 
����: 
//ɾ�����ʵļ��Լ�� 
alter table tb_hr_gz drop constraint tb_hr_gz_ck 
----------------------------------------------------------- 
4.4.5ΨһԼ�� 
4.4.5.1.ΨһԼ����� 
�﷨: 
alter table name add constraint <ΨһԼ����> unique<����> 
����: 
//�������֤������Ψһ��! 
alter table tb_hr_gz Add constraint tb_hr_gz_uk unique(hrid) 

4.4.5.2.ΨһԼ��ɾ�� 
�﷨: 
alter table name drop constraint <ΨһԼ����> 
����: 
alter table tb_hr_gz drop constraint tb_hr_gz_uk 

----------------------------------------------------------- 
4.4.6����Լ�� 
4.4.6.1����Լ����� 
�﷨: 
alter table table_name 
add constraint <��������> Primary Key <����> 
����: 
create table tb_hr_bm( 
bm varchar(20) not null , 
remark varchar(100) default '' 
) 
alter table tb_hr_bm 
add constraint tb_hr_bm_pk Primary Key (bm) 

4.4.6.2����Լ��ɾ�� 
�﷨: 
alter table table_name 
drop constraint <��������> 
����: 
alter table table_name 
drop constraint tb_hr_bm_pk 

----------------------------------------------------------- 
4.4.7���Լ�� 
4.4.7.1���Լ����� 
�﷨: 
alter table <����> 
add constraint <�����> 
foreign key(����) 
references <�ο�����><����> 
<ON UPDATE|ON DELETE(RESTRICT|CASCADE|SET NULL|SET DEFAULT)> 

//����˵�� 
����ѡ��������3��: 
ON UPDATE SET NULL //�������� 
ON DELETE CASCADE //����ɾ�� 
ON DELETE SET NULL //�����ÿ� 

ON UPDATE(RESTRICT|CASCADE|SET NULL|SET DEFAULT) ��ʾ������º�,�ӱ����Ϊ 
ON DELETE(RESTRICT|CASCADE|SET NULL|SET DEFAULT) ��ʾ����ɾ����,�ӱ����Ϊ 
RESTRICT ���ƹ���:����һ�м�¼���ܸ���/ɾ�������ӱ���һ����¼����ʱ 
CASCADE ��������:����һ�м�¼��¼����/ɾ��ɾ��,�ӱ��Ӧ���еļ�¼�Զ�����/ɾ�� 
SET NULL �ÿչ���:����һ�м�¼��¼����/ɾ��ɾ��,�ӱ��Ӧ���еļ�¼�Զ�Ϊ�� 
SET DEFAULT Ĭ��ֵ����:����һ�м�¼��¼����/ɾ��ɾ��,�ӱ��Ӧ���еļ�¼�Զ�д��Ĭ��ֵ 


����: 
�����������Ҫ���� 
alter table tb_hr_personl_info 
add constraint tb_hr_personl_info__bm_fk 
foreign key(bm) 
references tb_hr_bm (bm) 
on update cascade 
on delete cascade 


//�����ο����� 
create table tb_hr_bm 
( 
bm varchar(20) not null , 
remark varchar(100) default '' 
) 
alter table tb_hr_bm 
add constraint tb_hr_bm_pk Primary Key (bm) 
//����������Ϣ�� 
use hr 
create table tb_hr_personl_info 
( 
userid int not null , 
username varchar(20) null, 
bm varchar(20) null 
) 
/*Ϊ�˱��������Լ��*/ 
alter table tb_hr_personl_info 
add constraint tb_hr_personl_info_pk Primary Key (userid) 
/*Ϊ������Ϣ��������Լ��*/ 
alter table tb_hr_personl_info 
add constraint tb_hr_personl_info__bm_fk 
foreign key(bm) 
references tb_hr_bm (bm) 
on update cascade 
on delete cascade 
----------------------------------------------------------- 

4.4.7.2���Լ��ɾ�� 
�﷨: 
alter table <����> 
drop constraint <�����> 
����: 
//ɾ��tb_hr_personl_info������ 
alter table tb_hr_personl_info drop constraint tb_hr_personl_info__bm_fk; 
----------------------------------------------------------- 
4.4.8��ҵ����(business rule) 
//�ô��������ߴ洢������ʵ�� 

----------------------------------------------------------- 
4.5����Index 
//4.5.1�������� 
�﷨: 
create index <������> 
on <����> <�������> 
����: 
create index tb_hr_personl_info_ix 
on tb_hr_personl_info (userid) 

//4.5.2ɾ������ 
�﷨: 
drop index <����><.><������> 
����: 
//ɾ��������tb_hr_personl_info_ix 
drop index tb_hr_personl_info.tb_hr_personl_info_ix 
----------------------------------------------------------- 
4.6��ͼview 
4.6.1��ͼview�ĸ�� 
��ͼ���Ǳ�Ҳ���Ǳ����ݵı��ݣ������ݿ�ģʽ��ֻ��select���ļ���! 

----------------------------------------------------------- 
4.6.2������ͼCreate View 
�﷨: 
CREATE VIEW <view name> 
AS 
<SELECT statement> 
WITH CHECK OPTION 

����: 
CREATE VIEW vw_customerlist 
AS 
SELECT * 
FROM Customers 
----------------------------------------------------------- 
4.6.3��ѯ��ͼQuery view 
�﷨:select * from viewname 
����:select * from vw_customerlist 
----------------------------------------------------------- 
4.6.4�޸���ͼALTER VIEW 
�﷨:select * from viewname 
����:select * from vw_customerlist 
----------------------------------------------------------- 
4.6.5��ͼɾ��DROP VIEW 
//4.6.2��ͼɾ�� 
�﷨: 
drop view <��ͼ��> 
����: 
//��ͼɾ��v_hr_personl_info 
drop view v_hr_personl_info 

----------------------------------------------------------- 
4.6.6.������ͼFilter view 
�﷨: 
select * from viewname where/having expressions 
����: 
CREATE VIEW BankersMin 
AS 
SELECT BankerName, BankerState 
FROM Bankers 
where BankerID < 5 

SELECT * FROM BankersMin 
WHERE BankerState = 'CA' 
ORDER BY BankerName 

----------------------------------------------------------- 
4.6.7.�ɸ��µ���ͼUpdatable View 
�﷨: 
CREATE VIEW <view name> 
AS 
SELECT statement 
WITH CHECK OPTION 
����: 
CREATE VIEW OregonShippers_vw 
AS 
SELECT ShipperID, 
CompanyName, 
Phone 
FROM Shippers 
WITH CHECK OPTION 

//����ͼ�ļ�¼���Խ���delete/update/insert 
insert into <view name> values(values....) 
delete from <view name> where/having expressions 
update <view name> set column =values... where/having expressions 

----------------------------------------------------------- 
4.7Ȩ��Privilege 
4.7.1���ݿ��û���� 
�﷨: 
sp_addlogin [ @loginame = ] 'login' 
[ , [ @passwd = ] 'password' ] 
[ , [ @defdb = ] 'database' ] 
[ , [ @deflanguage = ] 'language' ] 
[ , [ @sid = ] sid ] 
[ , [ @encryptopt= ] 'encryption_option' ] 

����: 
���ݿ�testdb�������һ����½�û�test,����Ϊtt 
EXEC sp_addlogin 'test', 'tt', 'testdb', 'us_english' 
EXEC sp_addlogin 'yao', 'it', 'mtyjxc', 'us_english' 
----------------------------------------------------------- 
4.7.2���ݿ��û�ɾ�� 
�﷨:DROP LOGIN <��½����> 
����:DROP LOGIN test 

----------------------------------------------------------- 
4.7.3�û�Ȩ������grant 
grant�﷨: 
GRANT privilege [, ...] ON object [, ...] 
TO { PUBLIC | GROUP group | username } 

privilegeȡֵ��Χ����: 
SELECT:���������ı�/��ͼ��������/�ֶΣ� 
INSERT:�������ı��в����������ֶΣ� 
UPDATE:���������ı�������/�ֶΣ� 
DELETE:�������ı���ɾ�������У� 
RULE:�ڱ�/��ͼ�϶������ ���μ� CREATE RULE ��䣩�� 
ALL:��������Ȩ�ޣ� 

objectȡֵ��Χ����: 
table 
view 
sequence 

PUBLIC:�����������û��ļ�д. 
GROUP:��Ҫ����Ȩ�޵��� group 
username:��Ҫ����Ȩ�޵��û����� 
����ɹ����������CHANGE��Ϣ�� 
����: 
GRANT all on mtyjxc to 'yao' 

----------------------------------------------------------- 
7.7.4�û�Ȩ�޽��REVOKE 
REVOKE { ALL | statement [ ,...n ] } 
FROM security_account [ ,...n ] 
ALL: 
ָ����ɾ���������õ�Ȩ�ޡ� 
�������Ȩ�ޣ�ֻ�� sysadmin �̶���������ɫ��Ա����ʹ�� ALL�� 
���ڶ���Ȩ�ޣ�sysadmin �̶���������ɫ��Ա��db_owne �̶����ݿ��ɫ��Ա�����ݿ���������߶�����ʹ�� ALL�� 
statement: 
��Ҫɾ����Ȩ�޵���Ȩ��䡣����б���԰���: 
* CREATE DATABASE 
* CREATE DEFAULT 
* CREATE FUNCTION 
* CREATE PROCEDURE 
* CREATE RULE 
* CREATE TABLE 
* CREATE VIEW 
* BACKUP DATABASE 
* BACKUP LOG 

FROM: 
ָ����ȫ�ʻ��б� 
security_account: 
�ǵ�ǰ���ݿ��ڽ�Ҫ��ɾ��Ȩ�޵İ�ȫ�ʻ��� 
��ȫ�ʻ�������:SQL Server�û�,SQL Server��ɫ�� 
����: 
REVOKE all ON mtyjxc.* TO yao 
REVOKE all ON mtyjxc TO yao 

/**********************************************************/ 
5.���ݿ⺯��Functions 
5.1ת������Data Convert Functions 
5.2�ۼ�����Aggregate Functions 
5.3�ַ�����char Functions 
5.4���ں���Date Functions 
5.5��ѧ����Math Functions 
5.6��������Analytical Functions 
----------------------------------------------------------- 
5.1ת������Data Convert Functions 
5.1.1 CAST() 
����:��������ת�� 
�﷨:CAST(expression AS data_type) 
����: 
SELECT BillingDate, 
BillingTotal, 
CAST(BillingDate AS varchar) AS varcharDate, 
CAST(BillingTotal AS int) AS integerTotal, 
CAST(BillingTotal AS varchar) AS varcharTotal 
FROM Billings 
----------------------------------------------------------- 
5.1.2 COALESCE() 
����:���ر��ʽ�б��е�һ���ǿ�ֵ���ʽ��ֵ 
�﷨:COALESCE(expression1, expression2, ... expressionN) 
����: 
SELECT BankerName, 
COALESCE(CAST(BillingTotal AS varchar), 'No Billings') AS BillingTotal 
FROM Bankers LEFT JOIN Billings 
ON Bankers.BankerID = Billings.BankerID 
ORDER BY BankerName 

----------------------------------------------------------- 
5.1.3 CONVERT() 
����:�ѱ��ʽֵת��Ϊָ��sytle���������� 
�﷨:CONVERT(data_ type(<length>), expression, <style>) 
����: 
//���ڷ��ת�� 
datetimeתָ�����ڸ�ʽstyle number�嵥 
Number Style Number Output Type Style 
- 0 or 100 Default mon dd yyyy hh:miAM (or PM) 
1 101 USA mm/dd/yyyy 
2 102 ANSI yyyy.mm.dd 
3 103 British/French dd/mm/yyyy 
4 104 German dd.mm.yyyy 
5 105 Italian dd-mm-yyyy 
6 106 - dd mon yyyy 
7 107 - mon dd, yyyy 
10 110 USA mm-dd-yy 
11 111 JAPAN yy/mm/dd 
12 112 ISO yymmdd 
14 114 - hh:mi:ss:mmm (24h) 

//�ַ���ת���� 
CONVERT (INTEGER , '12345') 
//�ַ�ת���� 
CONVERT(datetime, '20000704') 

CREATE TABLE my_date (Col1 datetime) 
GO 
INSERT INTO my_date VALUES (CONVERT(char(10), GETDATE(), 112)) 
GO 
drop table my_date; 
GO 

----------------------------------------------------------- 
5.1.4 ISNULL() 
����:���check_expression�ǿ�ֵ������replacement_value��� 
�﷨:ISNULL(check_expression, replacement_value) 

����: 
SELECT BillingDate, 
ISNULL(BillingDate, '1900-01-01') AS NewDate 
FROM Billings 

----------------------------------------------------------- 
5.1.5 NULLIF() 
����:�������ʽ��ȣ�����null,���򷵻ص�1�����ʽ 
�﷨:ISNULL(expression1, expression2) 

����: 
DECLARE @Value1 int 
DECLARE @Value2 int 
SET @Value1 = 55 
SET @Value2 = 955 
SELECT NULLIF(@Value1, @Value2) 
GO 
��� 
55 
DECLARE @Value1 int 
DECLARE @Value2 int 
SET @Value1 = 55 
SET @Value2 = 55 
SELECT NULLIF(@Value1, @Value2) 
GO 
��� 
NULL 

----------------------------------------------------------- 
5.2�ۼ�����Aggregate Functions 
�﷨:select AggregateFunctions(column-name) 
sum(column-name):�����ֶ��ܺ� 
avg(column-name):�����ֶ�ƽ��ֵ 
min(column-name):�����ֶ���Сֵ 
max(column-name):�����ֶ����ֵ 
count(column-name):�����ֶηǿ�ֵ�ĸ��� 
count(*):�����ѯ����ļ�¼���� 

����: 
//use pubs 
select sum(qty) as sum_qty, 
avg(qty) as avg_qty, 
min(qty) as min_qty, 
max(qty) as max_qty, 
count(qty) as count_qty, 
count(*) as total_qty 
from sales 

----------------------------------------------------------- 
5.3�ַ�����char Functions 
1. ASCII() 
//���������ַ����ʽ������ַ���ASCII ��ֵ 
2. Char() 
//�������ڽ�ASCII ��ת��Ϊ�ַ�--���û������0 ~ 255 ֮���ASCII ��ֵCHAR �����᷵��һ��NULL 
3. CHARINDEX() 
//���������ַ�����ĳ��ָ�����Ӵ����ֵĿ�ʼλ�� 
4. DIFFERENCE() 
5. FORMATMESSAGE() 
6. LEFT() 
7. LEN() 
8. LOWER() 
//�������ַ���ȫ��ת��ΪСд 
9. LTRIM() 
//�������ַ���ͷ���Ŀո�ȥ�� 
10.nchar() 
11.PATINDEX() 
12.QUOTENAME() 
13.REPLACE() 
//�������ر��滻��ָ���Ӵ����ַ��� 
14.REPLICATE() 
/��������һ���ظ�ָ���������ַ��� 
15.REVERSE() 
//������ָ�����ַ������ַ�����˳��ߵ� 
16.Right() 
17.RTRIM() 
/�������ַ���β���Ŀո�ȥ�� 
18.SOUNDEX() 
19.SPACE() 
//��������һ����ָ�����ȵĿհ��ַ��� 
20.STR() 
//��������ֵ������ת��Ϊ�ַ������� 
21.STUFF() 
//��������һ�Ӵ��滻�ַ���ָ��λ�ó��ȵ��Ӵ� 
22.SUBSTRING() 
//�����������ַ��� 
23.UNICODE() 
24.UPPER() 
//�������ַ���ȫ��ת��Ϊ��д 

----------------------------------------------------------- 

5.4���ں���Date Functions 
5.4.1. CURRENT_TIMESTAMP 
����: 
�õ���ǰ���ݿ������ 
����: 
//ֱ�ӵõ���ǰ���� 
SELECT CURRENT_TIMESTAMP 
go 

//���ñ����еĵ�ǰ���� 
DECLARE @today datetime 
SELECT @today = current_timestamp 
select @today 
go 
----------------------------------------------------------- 
5.4.2. ���ڼ���Date calculation 
����:���ڼ��� 
����: 
DECLARE @MonthChar VarChar(2), @DayChar VarChar(2), @DateOut Char(8) 
SET @MonthChar = CAST(MONTH(GETDATE()) AS VarChar(2)) 
SET @DayChar = CAST(DAY(GETDATE()) AS VarChar(2)) 
--�Զ������·ݵ�2λ 
IF LEN(@MonthChar) = 1 
SET @MonthChar = '0'+@MonthChar 
IF LEN(@DayChar) = 1 
SET @DayChar = '0' + @DayChar 
--���������ַ��� 
SET @DateOut = @MonthChar + @DayChar + CAST(YEAR(GETDATE()) AS Char(4)) 
SELECT @DateOut 
GO 
���н����mmddyyyy��ʽ���ַ��� 
----------------------------------------------------------- 
5.4.3. DATEADD() 
����:������ӻ������n�������� 
�﷨:DATEADD(what_to_add,number_to_add,date_to_add_it_to) 
����: 
//4-29-2009��90�죬���浽day 
SELECT DATEADD(DY, 90,'4-29-2009') 
GO 
//4-29-2009��60�죬���浽day 
SELECT DATEADD(DY, -60,'4-29-2009') 
GO 
----------------------------------------------------------- 
5.4.4. DATEDIFF() 
����:������ӻ������n�������� 
�﷨:DATEDIFF ( datepart , startdate , enddate ) 
datepart�б�: 
day:��λ=�� 
month:��λ=�� 
year:��λ=�� 
hour:��λ=Сʱ 
minute:��λ=�� 
second:��λ=�� 
week:��λ=�� 
����: 
//10/01/2009���쵽��������� 
SELECT DATEDIFF(day,'10/1/2009',CURRENT_TIMESTAMP) 
GO 
//10/01/2009���쵽��������� 
SELECT DATEDIFF(month,'10/1/2009',CURRENT_TIMESTAMP) 
GO 
//10/01/2009���쵽��������� 
SELECT DATEDIFF(year,'10/1/2009',CURRENT_TIMESTAMP) 
GO 
//10/01/2009���쵽��������� 
SELECT DATEDIFF(week,'10/1/2009',CURRENT_TIMESTAMP) 
GO 

----------------------------------------------------------- 
5.4.5. DATEFIRST() 
����:���û��߲�ѯһ�ܵĵ�һ�� 
SELECT @@DATEFIRST 'First Day of the Week' 
GO 
value is 7 
SELECT DATEPART(weekday, CAST('20091001' AS DATETIME) + @@DATEFIRST); 
GO 
value is 3 
----------------------------------------------------------- 
6. DATEFORMAT() 
����:�������ڸ�ʽ 
�﷨:SET DATEFORMAT <format> 
format(ymd,mdy,dmy) 
����:set dataformat mdy 
----------------------------------------------------------- 
7. DATENAME() 
����:����date��datepart���֮�����ַ��� 
�﷨:DATENAME (datepart,date) 
datepart�б�(day,month,year,hour,minute,second,week,weekday) 
����: 
select datename(day,CURRENT_TIMESTAMP) 
select datename(month,CURRENT_TIMESTAMP) 
select datename(year,CURRENT_TIMESTAMP) 
select datename(hour,CURRENT_TIMESTAMP) 
select datename(minute,CURRENT_TIMESTAMP) 
select datename(week,CURRENT_TIMESTAMP) 
select datename(weekday,CURRENT_TIMESTAMP) 
----------------------------------------------------------- 
8. DATEPART() 
����:����date��datepart���֮�����ַ��� 
�﷨:DATENAME (datepart,date) 
datepart�б�(day,month,year,hour,minute,second,week,weekday) 
����: 
----------------------------------------------------------- 
9. Day() 
����:�����ڵ��� 
�﷨:day(date) 
����:select day(CURRENT_TIMESTAMP) 
----------------------------------------------------------- 
10. GETDATE() 
����:��ǰ���ں�ʱ�� 
�﷨:GETDATE() 
����:select GETDATE() ��select CURRENT_TIMESTAMP��ͬ 
----------------------------------------------------------- 
11. GETUTCDATE() 

----------------------------------------------------------- 
12. ISDATE() 

----------------------------------------------------------- 
13. MONTH() 
����:�����ڵ��� 
�﷨:MONTH(date) 
����:select month(CURRENT_TIMESTAMP) 
----------------------------------------------------------- 
14. Year() 
����:�����ڵ��� 
�﷨:Year(date) 
����:select Year(CURRENT_TIMESTAMP) 
----------------------------------------------------------- 
5.5��ѧ����Math Functions 
1. ABS() 
2. ACOS() 
3. ASIN() 
4. ATAN() 
5. CEILING() 
6. COS() 
7. COT() 
8. DEGREES() 
9. EXP() 
10. FLOOR() 
11. ISNUMERIC() 
12. LOG() 
13. LOG10() 
14. PI() 
15. Power() 
16. RADIANS() 
11. 17. RAND() 
18. ROUND() 
19. SIGN() 
20. Sin() 
21. SQRT() 
22. SQUARE() 
23. TAN() 
----------------------------------------------------------- 
5.6��������Analytical Functions 
1. COMPUTE() 
2. CUBE() 
3. DENSE_RANK() 
4. GROUPING() 
5. NTILE() 
6. PARTITION() 
7. PIVOT() 
8. ROLLUP() 
9. ROW_NUMBER() 
10. STDEV() 
11. STDEVP() 
12. VAR() 
13. VARP() 
/**********************************************************/ 
6.Transact SQL 
6.1��������Data Types 
6.2�ű��﷨sytanx 
6.3�ű��α�Cursor 
6.4�洢����Procedure 
6.5�洢����Function 
6.6������Trigger 
6.7����Transaction 
6.8����other 
/**********************************************************/ 
6.1��������Data Types 
1. bigint 
2. bit 
3. bitwise operators 
4. Char 
5. collate 
6. Create Type 
7. Data type 
8. Date Type 
9. datetime 
10. decimal 
11. Float 
12. FULLTEXT 
13. integer 
14. Large Text 
15. money 
16. nchar 
17. nVarChar 
18. OPENROWSET 
19. READTEXT 
20. smalldatetime 
21. Smallint 
22. SQL_VARIANT 
23. text 
24. TEXTPTR 
25. timestamp 
26. VARBINARY 
27. VARCHAR 
28. WRITETEXT 
29. Unicode 

----------------------------------------------------------- 
6.2�ű��﷨syntax 

6.2.0�ֲ�/ȫ�ֱ������� 
�ֲ����� (��@��ͷ) 
��ʽ:declare @������ �������� 
����:declare @x int 

ȫ�ֱ��� (������@@��ͷ) 
��ʽ:declare @@������ ���� 
����:select @@id = '10010001' 

6.2.1����� 
��ʽ: 
begin 
... 
end 
----------------------------------------------------------- 
6.2.2��ֵ���set/select 
set @id = '10010001' 
select @id = '10010001' 

6.2.3�������(if/case) 
6.2.3.1 if��� 
declare @x int @y int @z int 
select @x = 1 @y = 2 @z=3 
if @x > @y 
print 'x > y' --��ӡ�ַ���'x > y' 
else if @y > @z 
print 'y > z' 
else print 'z > y' 

6.2.3.2 CASE��� 
--CASE 
���ƴ��� ��������:
use pangu 
update employee 
set e_wage = 
case 
when job_level = '1' then e_wage*1.08 
when job_level = '2' then e_wage*1.07 
when job_level = '3' then e_wage*1.06 
else 
e_wage*1.05 
end 

6.2.4ѭ�����(while) 
--WHILE 
���ƴ��� ��������:
declare @x int @y int @c int 
select @x = 1 @y=1 
while @x < 3 
begin 
print @x --��ӡ����x ��ֵ 
while @y < 3 
begin 
select @c = 100*@x + @y 
print @c --��ӡ����c ��ֵ 
select @y = @y + 1 
end 
select @x = @x + 1 
select @y = 1 
end 

6.2.5��ʱִ��(waitfor) 

--WAITFOR 
--�� �ȴ�1 Сʱ2 ����3 ����ִ��SELECT ��� 
waitfor delay '01:02:03' 
select * from employee 
--�� �ȵ�����11 ����8 �ֺ��ִ��SELECT ��� 
waitfor time '23:08:00' 
select * from employee 

----------------------------------------------------------- 
6.3�ű��α�Cursor 
//�α�Ӧ��˳�� 
1.DECLARE --Ϊ��ѯ�趨�α� 
2.OPEN --������ѯ�����һ���α� 
3.FETCH --����һ�в�ѯ��� 
4.CLOSE / DEALLOCATE--�ر��α�������·����α� 

�﷨: 
DECLARE <�α�����> CURSOR FOR(select sql) 
OPEN <�α�����> 
while @@fetch_status = 0 
begin 
FETCH NEXT FROM <�α�����> INTO <�������嵥> 
{�������봦��} 
end 
CLOSE <�α�����> 

����1: 
���ƴ��� ��������:
/*���α�Ĵ洢����*/ 
create procedure p_fill_remark_tb_hr_gz 
as 
declare @id1 int 
declare @name1 varchar(30) 
declare @bm1 varchar(20) 

begin 
declare cursor1 cursor for select id,name,bm from tb_hr_gz 
open cursor1 
fetch next from cursor1 into @id1,@name1,@bm1 

while @@fetch_status <> 0 
begin 
update tb_hr_gz set remark=@name1+'-'+@bm1 where id=@id1 
fetch next from cursor1 into @id1,@name1,@bm1 
end 
close cursor1 
end 

//���Դ��α�Ĵ洢���� 
EXEC dbo.p_fill_remark_tb_hr_gz 

----------------------------------------------------------- 
6.4�洢����Procedure 



//�洢���̽��� 
�﷨: 
create procedure <�洢������>( 
[��������б�],[���ز����б� output] 
) 
as 
[�ֲ���������] 
begin 
{�����} 
end 

����: 
create procedure p_update_name_tb_hr_gz(@id int,@newname varchar(30)) 
as 
begin 
if (exists(select * from tb_hr_gz where id=@id)) 
begin 
update tb_hr_gz set name=@newname where id=@id 
end 
end 

//���� 
EXEC dbo.p_update_name_tb_hr_gz '112','chenglei' 

//�洢����ɾ�� 
�﷨: 
drop procedure <�洢������> 
����: 
drop procedure p_update_name_tb_hr_gz 

----------------------------------------------------------- 
6.5�洢����Function 

//�洢�������� 
�﷨: 
CREATE FUNCTION <������>(���������б�) 
[����ֵRETURNS ��������] [WITH ENCRYPTION] 
AS 
BEGIN 
{����������....} 

END 

����: 
���ƴ��� ��������:
//����f_amt_to_eng()����:���ֽ��ת��ΪӢ����ĸ��� 
CREATE FUNCTION f_amt_to_eng(@num numeric(15,2)) 
RETURNS varchar(400) WITH ENCRYPTION 
AS 
BEGIN 

DECLARE @i int,@hundreds int,@tenth int,@one int 
DECLARE @thousand int,@million int,@billion int 
DECLARE @numbers varchar(400),@s varchar(15),@result varchar(400) 
SET @numbers='one two three four five ' 
+'six seven eight nine ten ' 
+'eleven twelve thirteen fourteen fifteen ' 
+'sixteen seventeen eighteen nineteen ' 
+'twenty thirty forty fifty ' 
+'sixty seventy eighty ninety ' 
SET @s=RIGHT('000000000000000'+CAST(@num AS varchar(15)),15) 
SET @billion=CAST(SUBSTRING(@s,1,3) AS int)--��12λ�����ֳ�4��:ʮ�ڡ�����ǧ����ʮ�� 
SET @million=CAST(SUBSTRING(@s,4,3) AS int) 
SET @thousand=CAST(SUBSTRING(@s,7,3) AS int) 
SET @result='' 
SET @i=0 
WHILE @i<=3 
BEGIN 
SET @hundreds=CAST(SUBSTRING(@s,@i*3+1,1) AS int)--��λ0-9 
SET @tenth=CAST(SUBSTRING(@s,@i*3+2,1) AS int) 
SET @one=(CASE @tenth WHEN 1 THEN 10 ELSE 0 END)+CAST(SUBSTRING(@s,@i*3+3,1) AS int)--��λ0-19 
SET @tenth=(CASE WHEN @tenth<=1 THEN 0 ELSE @tenth END)--ʮλ0��2-9 
IF (@i=1 and @billion>0 and (@million>0 or @thousand>0 or @hundreds>0)) or 
(@i=2 and (@billion>0 or @million>0) and (@thousand>0 or @hundreds>0)) or 
(@i=3 and (@billion>0 or @million>0 or @thousand>0) and (@hundreds>0)) 
SET @result=@result+', '--��λ����0��ÿ��֮������ӷ�, 
IF (@i=3 and (@billion>0 or @million>0 or @thousand>0) and (@hundreds=0 and (@tenth>0 or @one>0))) 
SET @result=@result+' and '--��λ��0������ӷ�AND 
IF @hundreds>0 
SET @result=@result+RTRIM(SUBSTRING(@numbers,@hundreds*10-9,10))+' hundred' 
IF @tenth>=2 and @tenth<=9 
BEGIN 
IF @hundreds>0 
SET @result=@result+' and ' 
SET @result=@result+RTRIM(SUBSTRING(@numbers,@tenth*10+171,10)) 
END 
IF @one>=1 and @one<=19 
BEGIN 
IF @tenth>0 
SET @result=@result+'-' 
ELSE 
IF @hundreds>0 
SET @result=@result+' and ' 
SET @result=@result+RTRIM(SUBSTRING(@numbers,@one*10-9,10)) 
END 
IF @i=0 and @billion>0 
SET @result=@result+' billion' 
IF @i=1 and @million>0 
SET @result=@result+' million' 
IF @i=2 and @thousand>0 
SET @result=@result+' thousand' 
SET @i=@i+1 
END 
IF SUBSTRING(@s,14,2)<>'00' 
BEGIN 
SET @result=@result+' AND ' 
IF SUBSTRING(@s,14,1)='0' 
SET @result=@result+'zero' 
ELSE 
SET @result=@result+RTRIM(SUBSTRING(@numbers,CAST(SUBSTRING(@s,14,1) AS int)*10-9,10)) 
IF SUBSTRING(@s,15,1)<>'0' 
SET @result=@result+' '+RTRIM(SUBSTRING(@numbers,CAST(SUBSTRING(@s,15,1) AS int)*10-9,10)) 
END 
RETURN(@result) 
END 


���ƴ��� ��������:
CREATE FUNCTION f_amt_to_chn (@num numeric(14,2)) 
RETURNS varchar(100) WITH ENCRYPTION 
AS 
BEGIN 
DECLARE @n_data VARCHAR(20),@c_data VARCHAR(100),@n_str VARCHAR(10),@i int 
SET @n_data=RIGHT(SPACE(14)+CAST(CAST(ABS(@num*100) AS bigint) AS varchar(20)),14) 
SET @c_data='' 
SET @i=1 
WHILE @i<=14 
BEGIN 
SET @n_str=SUBSTRING(@n_data,@i,1) 
IF @n_str<>' ' 
BEGIN 
IF not ((SUBSTRING(@n_data,@i,2)='00') or ((@n_str='0') and ((@i=4) or (@i=8) or (@i=12) or (@i=14)))) 
SET @c_data=@c_data+SUBSTRING('��Ҽ��������½��ƾ�',CAST(@n_str AS int)+1,1) 
IF not ((@n_str='0') and (@i<>4) and (@i<>8) and (@i<>12)) 
SET @c_data=@c_data+SUBSTRING('Ǫ��ʰ��Ǫ��ʰ��Ǫ��ʰԪ�Ƿ�',@i,1) 
IF SUBSTRING(@c_data,LEN(@c_data)-1,2)='����' 
SET @c_data=SUBSTRING(@c_data,1,LEN(@c_data)-1) 
END 
SET @i=@i+1 

END 

IF @num<0 
SET @c_data='��'+@c_data 

IF @num=0 
SET @c_data='��Ԫ' 

IF @n_str='0' 
SET @c_data=@c_data+'��' 

RETURN(@c_data) 

END 


//���Ժ��� 
select name, gz,dbo.f_amt_to_chn(gz) as ���Ľ��,dbo.f_amt_to_eng(gz) as Ӣ�Ľ�� from tb_hr_gz 

//ɾ������ 
�﷨: 
drop function <��������> 

����: 
drop function f_num_to_eng 
----------------------------------------------------------- 
6.6������Trigger 

22. 1. Trigger( 14 ) 22. 10. Trigger order( 2 ) 
22. 2. Alter Trigger( 4 ) 22. 11. Drop trigger( 2 ) 
22. 3. Trigger for after( 4 ) 22. 12. COLUMNS_UPDATED( 1 ) 
22. 4. Trigger for Delete( 4 ) 22. 13. Update function( 3 ) 
22. 5. Trigger for insert( 1 ) 22. 14. Deleted table( 2 ) 
22. 6. Trigger for update( 4 ) 22. 15. Inserted table( 5 ) 
22. 7. Trigger on database( 2 ) 22. 16. RECURSIVE_TRIGGERS( 1 ) 
22. 8. Trigger on server( 1 ) 22. 17. Utility trigger( 4 ) 
22. 9. Trigger on view( 3 ) 



//���������� 
�﷨: 
create trigger <����������> on <����> 
[for insert | update | delete] 
as 
[�������] 
begin 
{�����...} 
end 

����0: 
���ƴ��� ��������:
create trigger tg_tb_hr_bm on tb_hr_bm 
for insert,update,delete 
as 
declare @bm_d varchar(20) 
declare @bm_i varchar(20) 
begin 
set @bm_d=(select bm from deleted) 
set @bm_i=(select bm from inserted) 
if exists(select * from tb_hr_gz ,deleted where(tb_hr_gz.bm =deleted.bm )) 
begin 
update tb_hr_gz set bm='' where bm =@bm_d 
end 

if update(bm) 
begin 
update tb_hr_gz set bm=@bm_i where bm =@bm_i 
end 
end 

//ɾ�������� 
�﷨: 
drop trigger <����������> 
����: 
drop trigger tg_w_house_center 
----------------------------------------------------------- 
6.7����Transaction 
����(COMMIT/ROLLBACK) 
SET TRANSACTION --���嵱ǰ�������ݷ������� 
COMMIT --�ύ��ǰ���� 
ROLLBACK --ȡ����ǰ���� Tags��MSSQL ���ô��� 
 /*
 �� �� �� ��
sqlserver ǧ����������ҳ�洢���̴���SQLServer ȫ�ļ���(full-text)�﷨ɾ��Table���е��ظ��еķ���SQLѧϰ�ʼ��ߺ��� ���֣����ڣ�����ת����Sql Server����ĵ�ǰӵ���߸��ĳ�Ŀ���ڲ�ѯ��������һ�б�ʾ��¼��������sqSQL����ĳһ����¼�ķ���sql �����޸����ݿ��SQL �ϲ����м�¼�ķ����ܻ�sql�з��ز�����ֵ�� �� �� ��
SQL Server 2008ͼ�İ�װ�̳�SQL�����ȫ-��Ӣ�Ķ���SQL���ȥ���ظ���¼����ȡ�ظ���sql����Ż�֮��EXISTS���IN���÷ǳ������SQL���ѧϰ�ֲ�ʵ����SQLServer2005 ���������Զ�����SQL��似��:����ͳ������sql convert����ʹ��С������sql������õ�SQL��䣨ɾ���ظ���¼����
Js��CSS����
CSS����ѹ����ʽ��(����) css ��ʽ��������(Ӣ��) CSS���θ�ʽ�� JavaScript ��ʽ�������� jsbeautifier Js��ʽ��������(Ӣ��) php ��ʽ��������(Ӣ��) HTML/JS����ת������ javascript pack����ѹ������ JS Minifierѹ�� JS�������� ����JS�ű�У�������� JavaScript ������ʽ���߲��Թ��� ����ת������
Base64������� Escape�ӽ��� HTML/UBB����ת�� GB2312/BIG5������ת�� ����С���߼� ����ת�� HTML�๦�ܴ���ת���� Ѹ�׿쳵��/���� ����ת��ƴ�� 

 */
 