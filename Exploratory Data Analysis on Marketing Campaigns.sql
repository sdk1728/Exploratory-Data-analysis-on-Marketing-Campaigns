create database marketing_data;
use marketing_data;
show tables;
select * from marketing_data.marketing_campaign;

describe marketing_campaign;
select count(*) from marketing_campaign;  # 2240
select count(ID) from marketing_campaign; # 2240
select count(distinct(ID)) from marketing_campaign; # 2240 -- no duplicates in datset.

select Kidhome,count(*) from marketing_campaign
group by Kidhome; # no of small children in house

select Teenhome,count(*) from marketing_campaign
group by Teenhome;

select Marital_Status, count(*) from marketing_campaign 
group by Marital_Status;

select Education, count(*) from marketing_campaign 
group by Education;


set sql_safe_updates=0;

# version control
create table marketing_campaign_v1
select *,
(case 
when Complain =0 then 'NO'
when Complain=1 then 'YES'
END)
as complain_new from marketing_campaign;

select * from marketing_campaign_v1;

alter table marketing_campaign_v1 drop column Complain;
select education,max(Income) from marketing_campaign
group by education;

select avg(Recency) FROM marketing_campaign;

select education,avg(Income) from marketing_campaign
group by education;

select  max(MntGoldProds),max(MntWines),max(MntFruits),max(MntMeatProducts),
max(MntFishProducts),max(MntSweetProducts)
 from marketing_campaign;   
 ## maxium amount was spent on meat products