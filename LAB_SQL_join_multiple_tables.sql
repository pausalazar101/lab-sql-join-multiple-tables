USE sakila;
##Write a query to display for each store its store ID, city, and country.

SELECT s.store_id, c.city, co.country
FROM sakila.store s
JOIN sakila.address a ON s.address_id = a.address_id
JOIN sakila.city c ON a.city_id = c.city_id
JOIN sakila.country co ON c.country_id = co.country_id;

SELECT s.store_id, SUM(p.amount) AS total_business_USD
FROM sakila.store s
JOIN sakila.staff st ON s.store_id = st.store_id
JOIN sakila.payment p ON st.staff_id = p.staff_id
GROUP BY s.store_id;

SELECT c.category_id, c.name, AVG(f.length) AS average_running_time
FROM sakila.category c
JOIN sakila.film_category fc ON c.category_id = fc.category_id
JOIN sakila.film f ON fc.film_id = f.film_id
GROUP BY c.category_id, c.name;

SELECT c.name AS category_name, AVG(f.length) AS average_length
FROM sakila.category c
JOIN sakila.film_category fc ON c.category_id = fc.category_id
JOIN sakila.film f ON fc.film_id = f.film_id
GROUP BY c.name
ORDER BY average_length DESC;

SELECT f.film_id, f.title, COUNT(r.rental_id) AS rental_count
FROM sakila.film f
JOIN sakila.inventory i ON f.film_id = i.film_id
JOIN sakila.rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
ORDER BY rental_count DESC;

SELECT c.name AS genre, SUM(p.amount) AS gross_revenue
FROM sakila.category c
JOIN sakila.film_category fc ON c.category_id = fc.category_id
JOIN sakila.film f ON fc.film_id = f.film_id
JOIN sakila.inventory i ON f.film_id = i.film_id
JOIN sakila.rental r ON i.inventory_id = r.inventory_id
JOIN sakila.payment p ON r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY gross_revenue DESC
LIMIT 5;

SELECT f.title, s.store_id
FROM sakila.film f
JOIN sakila.inventory i ON f.film_id = i.film_id
JOIN sakila.store s ON i.store_id = s.store_id
WHERE f.title = 'Academy Dinosaur' AND s.store_id = 1;


