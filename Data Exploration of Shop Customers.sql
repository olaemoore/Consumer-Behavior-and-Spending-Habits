use PortfolioProjects

 select * from ShopCustomer
 -- ----------------------------------
 -- Data Exploration of Shop Customers
 -- ----------------------------------
 select 
	AVG (age) as AverageCustAge,
	Max (age) as OldestCust,
	Min (age) as YoungestCust
 from ShopCustomer;

-- How many customers in genders with percentage?
select 
gender,
COUNT(gender) as Count_gender,
count(*) * 100 / (select count(*) from ShopCustomer) as Cust_Percentage
	from ShopCustomer
group by Gender

-- Customer Review Ratings Range
 select 
	Max (Review_Rating) as Highest_Rating,
	Min (Review_Rating) as Lowest_Rating
 from ShopCustomer;	
	
select
	subscription_status,
	count(subscription_status) CountOfStatus
from ShopCustomer
group by subscription_status

-- Previous Purchases by Customer

 select 
	max (Previous_Purchases_By_Customer) as MostPurchases,
	avg (Previous_Purchases_By_Customer) as AvgPurchases,
	Min (Previous_Purchases_By_Customer) as LowestPurcases
 from ShopCustomer;

 -- what are the ages that make the most purchases?
 select
 age,
 sum(Previous_Purchases_By_Customer) totalPurchases
 from ShopCustomer
 group by Age
 order by totalPurchases desc

 -- break down of above query by age and gender 
 select
 age,
 gender,
 sum(Previous_Purchases_By_Customer) totalPurchases
 from ShopCustomer
 group by Age, Gender
 order by totalPurchases desc