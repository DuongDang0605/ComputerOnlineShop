-- liquibase formatted sql

-- changeset quocdk:001
CREATE TABLE "role"(
    id bigserial PRIMARY KEY,
    role_name varchar(255),
    created_at timestamp(6),
    updated_at timestamp(6),
    created_by varchar(255),
    updated_by varchar(255),
    status int8
);

-- changeset quocdk:002
CREATE TABLE "user" (
    id bigserial PRIMARY KEY,
    user_name varchar(255),
    email varchar(255),
    password varchar(255),
    created_at timestamp(6),
    updated_at timestamp(6),
    created_by varchar(255),
    updated_by varchar(255),
    role_id int8,
    status int8,
    CONSTRAINT fk_user_role FOREIGN KEY (role_id) REFERENCES "role"(id)
);

-- changeset quocdk:003
CREATE TABLE "customer"(
    id bigserial PRIMARY KEY,
    user_id int8,
    phone varchar(255),
    full_name varchar(255),
    address varchar(255),
    image varchar(255), 
    created_at timestamp(6),
    updated_at timestamp(6),
    created_by varchar(255),
    updated_by varchar(255),
    status int8,
    CONSTRAINT fk_customer_user FOREIGN KEY (user_id) REFERENCES "user"(id)
);

-- changeset quocdk:004
CREATE TABLE "brand"(
    id bigserial PRIMARY KEY,
    brand_name varchar(255),
    created_at timestamp(6),
    updated_at timestamp(6),
    created_by varchar(255),
    updated_by varchar(255),
    status int8
);

-- changeset quocdk:005
CREATE TABLE "component"(
    id bigserial PRIMARY KEY,
    component_name varchar(255),
    created_at timestamp(6),
    updated_at timestamp(6),
    created_by varchar(255),
    updated_by varchar(255),
    status int8
);

-- changeset quocdk:006
CREATE TABLE "category"(
    id bigserial PRIMARY KEY,
    brand_id int8,
    component_id int8,
    created_at timestamp(6),
    updated_at timestamp(6),
    created_by varchar(255),
    updated_by varchar(255),
    status int8,
    CONSTRAINT fk_category_brand FOREIGN KEY (brand_id) REFERENCES "brand"(id),
    CONSTRAINT fk_category_component FOREIGN KEY (component_id) REFERENCES "component"(id)
);

-- changeset quocdk:007
CREATE TABLE "product"(
    id bigserial PRIMARY KEY,
    name varchar(255),
    category_id int8,
    quantity int,
    price float8,
    image varchar(255),
    created_at timestamp(6),
    updated_at timestamp(6),
    created_by varchar(255),
    updated_by varchar(255),
    status int8,
    CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES "category"(id)
);

-- changeset quocdk:008
CREATE TABLE "orders"(
    id bigserial PRIMARY KEY,
    user_id int8,
    total_price float8, 
    order_code varchar(255),
    created_at timestamp(6),
    updated_at timestamp(6),
    created_by varchar(255),
    updated_by varchar(255),
    status int8,
    CONSTRAINT fk_order_user FOREIGN KEY (user_id) REFERENCES "user"(id)
);

-- changeset quocdk:009
CREATE TABLE "order_detail"(
    id bigserial PRIMARY KEY,
    order_id int8,
    product_id int8,
    quantity int,
    price float8,
    CONSTRAINT fk_detail_order FOREIGN KEY (order_id) REFERENCES "orders"(id),
    CONSTRAINT fk_detail_product FOREIGN KEY (product_id) REFERENCES "product"(id)
);

-- changeset quocdk:010
CREATE TABLE "cart"(
    id bigserial PRIMARY KEY,
    user_id int8,
    product_id int8,
    quantity int,
    CONSTRAINT fk_cart_user FOREIGN KEY (user_id) REFERENCES "user"(id),
    CONSTRAINT fk_cart_product FOREIGN KEY (product_id) REFERENCES "product"(id)
);