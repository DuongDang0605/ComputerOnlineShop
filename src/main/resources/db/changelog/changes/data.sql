-- changeset quocdk:011
-- Thêm dữ liệu cho bảng role
INSERT INTO "role" (id, role_name, created_at, updated_at, created_by, updated_by, status)
VALUES (1, 'ROLE_ADMIN', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system', 1),
       (2, 'ROLE_CUSTOMER', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system', 1);

-- changeset quocdk:012
-- Thêm dữ liệu cho bảng user
INSERT INTO "users" (id, user_name, email, password, created_at, updated_at, created_by, updated_by, role_id, status)
VALUES (1, 'admin', 'admin@computeronlineshop.com', '123', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
        'system', 'system', 1, 1),
       (2, 'quocdk_user', 'quocdk@example.com', '123', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system',
        'system', 2, 1),
       (3, 'khachhang01', 'khachhang01@gmail.com', '123', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
        'system', 'system', 2, 1);

-- changeset quocdk:013
-- Thêm dữ liệu cho bảng customer
INSERT INTO "customer" (id, user_id, phone, full_name, address, image, created_at, updated_at, created_by, updated_by,
                        status)
VALUES (1, 2, '0987654321', 'Đinh Khắc Quốc', 'Hà Nội, Việt Nam', 'avatar_quoc.png', CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP, 'system', 'system', 1),
       (2, 3, '0901234567', 'Nguyễn Văn A', 'Hồ Chí Minh, Việt Nam', 'avatar_nva.png', CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP, 'system', 'system', 1);

-- changeset quocdk:014
-- Thêm dữ liệu cho bảng brand (Thương hiệu)
INSERT INTO "brand" (id, brand_name, created_at, updated_at, created_by, updated_by, status)
VALUES (1, 'Asus', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system', 1),
       (2, 'Dell', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system', 1),
       (3, 'Intel', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system', 1),
       (4, 'NVIDIA', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system', 1),
       (5, 'Logitech', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system', 1);

-- changeset quocdk:015
-- Thêm dữ liệu cho bảng component (Loại linh kiện)
INSERT INTO "component" (id, component_name, created_at, updated_at, created_by, updated_by, status)
VALUES (1, 'Laptop', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system', 1),
       (2, 'CPU', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system', 1),
       (3, 'VGA - Card màn hình', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system', 1),
       (4, 'Chuột máy tính', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system', 1);

-- changeset quocdk:016
-- Thêm dữ liệu cho bảng category (Category là sự kết hợp giữa Brand và Component)
INSERT INTO "category" (id, brand_id, component_id, created_at, updated_at, created_by, updated_by, status)
VALUES (1, 1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system', 1), -- Asus Laptop
       (2, 2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system', 1), -- Dell Laptop
       (3, 3, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system', 1), -- Intel CPU
       (4, 4, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system', 1), -- NVIDIA VGA
       (5, 5, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system', 1);
-- Logitech Mouse

-- changeset quocdk:017
-- Thêm dữ liệu cho bảng product
INSERT INTO "product" (id, name, category_id, quantity, price, image, created_at, updated_at, created_by, updated_by,
                       status)
VALUES (1, 'Laptop Asus ROG Strix G15', 1, 10, 1500.0, 'asus_rog_g15.png', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
        'system', 'system', 1),
       (2, 'Laptop Dell XPS 13', 2, 15, 1200.0, 'dell_xps13.png', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system',
        'system', 1),
       (3, 'CPU Intel Core i9-13900K', 3, 30, 550.0, 'intel_i9_13900k.png', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
        'system', 'system', 1),
       (4, 'VGA NVIDIA RTX 4090', 4, 5, 1800.0, 'rtx_4090.png', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system',
        'system', 1),
       (5, 'Chuột Logitech G502 HERO', 5, 100, 45.0, 'logitech_g502.png', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
        'system', 'system', 1);

-- changeset quocdk:018
INSERT INTO "orders" (id, user_id, total_price, order_code, created_at, updated_at, created_by, updated_by, status)
VALUES (1, 2, 1545.0, 'ORD-20240101-0001', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'quocdk_user', 'quocdk_user', 1),
       (2, 3, 1800.0, 'ORD-20240102-0002', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'khachhang01', 'khachhang01', 1);

-- changeset quocdk:019
-- Thêm dữ liệu cho bảng order_detail
INSERT INTO "order_detail" (id, order_id, product_id, quantity, price)
VALUES (1, 1, 1, 1, 1500.0),
       (2, 1, 5, 1, 45.0),   -
       (3, 2, 4, 1, 1800.0);
-- Đơn 2 mua RTX 4090

-- changeset quocdk:020
-- Thêm dữ liệu cho bảng cart (Giỏ hàng đang chờ thanh toán)
INSERT INTO "cart" (id, user_id, product_id, quantity)
VALUES (1, 2, 3, 1),
       (2, 3, 2, 2);
-- Khách hàng 1 đang để 2 cái Laptop Dell XPS trong giỏ

-- changeset quocdk:021
SELECT setval('role_id_seq', (SELECT MAX(id) FROM "role"));
SELECT setval('users_id_seq', (SELECT MAX(id) FROM "users"));
SELECT setval('customer_id_seq', (SELECT MAX(id) FROM "customer"));
SELECT setval('brand_id_seq', (SELECT MAX(id) FROM "brand"));
SELECT setval('component_id_seq', (SELECT MAX(id) FROM "component"));
SELECT setval('category_id_seq', (SELECT MAX(id) FROM "category"));
SELECT setval('product_id_seq', (SELECT MAX(id) FROM "product"));
SELECT setval('orders_id_seq', (SELECT MAX(id) FROM "orders"));
SELECT setval('order_detail_id_seq', (SELECT MAX(id) FROM "order_detail"));
SELECT setval('cart_id_seq', (SELECT MAX(id) FROM "cart"));