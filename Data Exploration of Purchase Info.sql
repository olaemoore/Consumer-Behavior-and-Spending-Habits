use PortfolioProjects

 select * from PurchaseInfo
 -- ----------------------------------
 /* Data Exploration of Purchase Info Table
 related to Consumer Spending data
 to gain some insight for data analyst
 */
 -- ----------------------------------

--renamed some columns

exec sp_rename 'PurchaseInfo.Customer_Purchasse_ID', 'Cust_Purchase_ID'
exec sp_rename 'PurchaseInfo.LocationOfPurchase', 'Purchase_Location'



--What is the price range of for items purchased?
select 
MAX(purchase_amount_usd) as Highest_purchase_amount,
min(purchase_amount_usd) as Lowest_purchase_amount
from PurchaseInfo;

select
	distinct Item_Purchased
from PurchaseInfo;

select
	count(Item_Purchased) as itemsPurchased,
	Category
from PurchaseInfo
group by Category
order by itemsPurchased desc;

-- Which category had the highest amount of items purchased?
select
	count(Item_Purchased) as Num_Items_purchased,
	category
from PurchaseInfo
group by Category
order by Num_Items_purchased desc;

--What are the top bottom 5 states with regards to total amount spent?
select
top (5) Purchase_Location,
sum(purchase_amount_usd) as TotalAmtSpent
from 
	PurchaseInfo
group by Purchase_Location, Season
order by TotalAmtSpent desc;

--What are the overall bottom 5 states with regards to total amount spent?
select
top (5) Purchase_Location,
sum(purchase_amount_usd) as TotalAmtSpent
from 
	PurchaseInfo
group by Purchase_Location, Season
order by TotalAmtSpent;

--select top 10 locations with total amount sent by season

select
top (10) Purchase_Location,
season,
sum(purchase_amount_usd) as TotalAmtSpent
from 
	PurchaseInfo
group by Purchase_Location, Season
order by TotalAmtSpent desc;

--Which season has the most and least sales?

select
	season,
sum(purchase_amount_usd) as TotalAmtSpent
from
	PurchaseInfo
group by Season
order by TotalAmtSpent desc;


select
age, 
Gender,
count(item_purchased) as num_items
from
	ShopCustomer as sc
join PurchaseInfo as p
	on p.Cust_Purchase_ID = sc.Customer_ID
where Payment_Method_By_Cust = 'cash'
group by age, Gender;

select 
	count(Cust_Purchase_ID) as numCust,
	shipping_type
from PurchaseInfo
group by Shipping_Type

-- How many customers only used a discount code?
select 
	count(Cust_Purchase_ID) as numCust
from 
	PurchaseInfo
where Discount_Applied = 'yes' and Promo_Code_Used = 'no';

-- How many customers only used a promo code?
select 
	count(Cust_Purchase_ID) as numCust
from 
	PurchaseInfo
where Discount_Applied = 'no' and Promo_Code_Used = 'yes'

-- How many customers used both had a discount applied and promode code used
select 
	count(Cust_Purchase_ID) as numCust
from 
	PurchaseInfo
where Discount_Applied = 'yes' and Promo_Code_Used = 'yes'

-- How many customers did use neither discount code or promo code?

select 
	count(Cust_Purchase_ID) as numCust_
from 
	PurchaseInfo
where Discount_Applied = 'no' and Promo_Code_Used = 'no'
