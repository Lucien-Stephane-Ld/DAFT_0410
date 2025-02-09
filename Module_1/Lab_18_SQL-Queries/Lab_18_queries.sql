
# 1. What are the different genres?
select distinct prime_genre
from lab_18.app_store
order by prime_genre asc;

# 1.5 How many genres are there?
select count( distinct prime_genre) as 'Number of Genres'
from lab_18.app_store
order by prime_genre asc;


# 2. Which is the genre with the most apps rated?
select prime_genre, user_rating
from lab_18.app_store
order by user_rating desc;

# 3. Which is the genre with most apps?
select prime_genre, count(track_id) as Count
from lab_18.app_store
group by prime_genre
order by count(track_id) desc;

# 4. Which is the one with least?
select count(track_id), prime_genre
from lab_18.app_store
group by prime_genre
order by count(track_id) asc;

# 5. Find the top 10 apps most rated.
select track_name, rating_count_tot, prime_genre
from lab_18.app_store
order by rating_count_tot desc
limit 10;

# 6. Find the top 10 apps best rated by user
select track_name, prime_genre, user_rating, rating_count_tot
from lab_18.app_store
where user_rating = 5
order by rating_count_tot desc
limit 10;

# 7. Take a look at the data you retrieved in question 5. Give some insights.
-- The top #1 most rated app belongs to Social Networking category, which composes 2/3 or the top 3.
-- The top #1 most rated app is downloaded almost 3 times more than the top #2 app.
-- Amongst the top 10 most rated apps, games type of app compose 2/5 of the top 10 most rated.

# 8. Take a look at the data you retrieved in question 6. Give some insights.
-- Best user rating = collusion of n° of rating and rating value.
-- 60% of top user rated apps are games.
-- Next are utility (business) apps, and health & fitness apps respectively.
-- The app 'Plants vs Zombies' occupies two slots in the top 3, for it has an HD versionwhich is approx 2.4x less popular.
-- Top rated apps are a game and a fast food chain app. Proving that the mass of obese has a preference for that which kills it.

# 9. Now compare the data from questions 5 and 6. What do you see?
-- Results are completely different in matter of which app is at the top.
-- The most rated apps are games in both categories.
-- Althought other apps have been rated millions of times, they do not necessarly reach the top rating score. Top user rated app has 400k+ reviews, while most reviewed app has 2.9M+ reviews.

# 10. How could you take the top 3 regarding both user ratings and number of votes?
-- See question #6.

# 11. Do people care about the price of an app?
-- Comparing the top 10 most and best rated apps, with the top 10 most expensive app, we do acknowledge a gap between the two regarding the amount of ratings and the score of ratings.
-- It seems people tend to prefer cheaper apps.
-- It is noticable that the more expensive apps are mostly in the fields that are NOT games (with one exception).

-- Determining the price of the top 10 most expensive app and their number of downloads.
select track_name, prime_genre, user_rating, rating_count_tot, price
from lab_18.app_store
order by price desc
limit 10;

-- Determining the price of the top 10 apps.
select track_name, prime_genre, user_rating, rating_count_tot, price
from lab_18.app_store
where user_rating = 5
order by rating_count_tot desc
limit 10;