-- Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
-- Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age.
-- Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power.
-- If more than one wand has same power, sort the result in order of descending age.

with t as (
SELECT wands.id as id,wands_property.age as age,wands.coins_needed as coins,wands.power as p,
rank() over(partition by wands_property.age,wands.power order by wands.coins_needed) as rnk
FROM Wands
JOIN wands_property ON wands.code=wands_property.code
WHERE wands_property.is_evil=0
    )
SELECT id,age,coins,p
FROM t where rnk=1
ORDER BY p desc,age desc;