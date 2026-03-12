-- ==============================================================================
-- E-COMMERCE OPERATIONS & INVENTORY REPORTING SCRIPT
-- ==============================================================================

-- 1. Database Integrity Audit: Validate record counts across all primary entities
SELECT 'department' AS Entity, COUNT(*) AS Record_Count FROM department
UNION ALL
SELECT 'category', COUNT(*) FROM category
UNION ALL
SELECT 'customer', COUNT(*) FROM customer
UNION ALL
SELECT 'product', COUNT(*) FROM product
UNION ALL
SELECT 'order_line', COUNT(*) FROM order_line
UNION ALL
SELECT 'orders', COUNT(*) FROM orders;

-- 2. Premium Inventory Extraction: Identify high-yield assets for targeted marketing
SELECT product_name, product_price
FROM product
WHERE product_price > 100.00;

-- 3. Geographic Sales Segmentation: Extract customer details for regional (FL) campaigns
SELECT c.first_name, c.last_name, c.city, c.segment, o.order_id, o.order_date
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
WHERE c.state = 'FL';

-- 4. Product Category Auditing: Isolate core retail categories for inventory planning
SELECT p.product_name, c.category_name, d.department_name, p.product_price
FROM product p
JOIN category c ON p.category_id = c.category_id
JOIN department d ON p.department_id = d.department_id
WHERE c.category_name IN ('Computers', 'Toys', 'Tennis & Racquet');

-- 5. Dead-Stock Identification: Isolate products with zero sales velocity for potential reduction
SELECT p.product_name, c.category_name, d.department_name
FROM product p
JOIN category c ON p.category_id = c.category_id
JOIN department d ON p.department_id = d.department_id
LEFT JOIN order_line ol ON p.product_id = ol.product_id
WHERE ol.product_id IS NULL;
