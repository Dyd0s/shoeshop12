-- 4 этап
SELECT u.id, u.name, u.surname, u.patronymic, r.name AS role
FROM users u
JOIN roles r ON r.id = u.role_id
WHERE u.login = '94d5ous@gmail.com' AND u.password = 'uzWC67';

-- 5 этап
SELECT p.id, p.article, p.name, p.unit, p.price, p.discount, p.stock_qty,
 p.description, p.photo,
 c.name AS category, m.name AS manufacturer, s.name AS supplier
FROM products p
JOIN categories c ON c.id = p.category_id
JOIN manufacturers m ON m.id = p.manufacturer_id
JOIN suppliers s ON s.id = p.supplier_id;


-- 6 этап
SELECT p.id, p.article, p.name, p.unit, p.price, p.discount, p.stock_qty,
       p.description, p.photo,
       c.name AS category, m.name AS manufacturer, s.name AS supplier
FROM products p
JOIN categories c ON c.id = p.category_id
JOIN manufacturers m ON m.id = p.manufacturer_id
JOIN suppliers s ON s.id = p.supplier_id
WHERE p.name LIKE CONCAT('%', 'Туфли', '%') AND p.supplier_id = 1
ORDER BY p.stock_qty DESC;

-- 7 этап
-- справочники для выпадающих списков в форме
SELECT id, name FROM categories;
SELECT id, name FROM manufacturers;
SELECT id, name FROM suppliers;

-- добавление товара
INSERT INTO products
    (article, name, unit, price, discount, stock_qty, description, photo, category_id, manufacturer_id, supplier_id)
VALUES
    ('S901K2', 'Кроссовки', 'шт.', 4200.00, 5, 12, 'Кроссовки мужские повседневные, размер 42', '31.jpg', 2, 1, 1);

-- открыть товар для редактирования — заполнить все поля сразу
SELECT * FROM products WHERE id = 1;

-- сохранить изменения
UPDATE products
SET article = 'S901K2',
    name = 'Кроссовки',
    unit = 'шт.',
    price = 3990.00,
    discount = 10,
    stock_qty = 10,
    description = 'Кроссовки мужские повседневные, размер 42, цвет чёрный',
    photo = '31.jpg',
    category_id = 2,
    manufacturer_id = 1,
    supplier_id = 1
WHERE id = 1;

-- 8 этап
SELECT COUNT(*) AS used_in_orders FROM prodorders WHERE product_id = 5;
DELETE FROM products WHERE id = 5;