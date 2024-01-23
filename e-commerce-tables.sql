-- Start writing code here
-- ให้สร้าง Database บน PostgreSQL ด้วย pgAdmin4 ชื่อว่า `ecommerce_app_db`
-- เมื่อสร้างฐานข้อมูลเสร็จแล้ว ให้เขียนโค้ดในการสร้างตารางตาม Schema ด้านล่างที่กำหนดให้

-- Table users
create table users (
	user_id int primary key generated always as identity,
	username varchar ( 255 ) unique not null,
	email varchar ( 255 ) unique not null,
	password varchar ( 255 ) not null,
	created_at timestamptz not null default current_timestamp
);

-- Table products 
create table products (
    product_id int primary key generated always as identity,
    name varchar ( 255 ) not null,
    description text,
    price numeric(10, 2) not null,
    created_at timestamptz not null default current_timestamp
);

-- Table categories
create table categories (
    category_id int primary key generated always as identity,
    name varchar ( 255 ) unique not null,
    created_at timestamptz not null default current_timestamp
);

-- Table product_categories
create table product_categories (
    product_category_id int primary key generated always as identity,
    product_id int references products(product_id) on delete cascade,
    category_id int references categories(category_id) on delete cascade,
);