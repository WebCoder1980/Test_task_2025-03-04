CREATE TABLE IF NOT EXISTS store_employee (
	id_ int8 NOT NULL,
	lastname varchar(100) NOT NULL,
	firstname varchar(100) NOT NULL,
	patronymic varchar(100) NOT NULL,
	birth_date timestamp NOT NULL,
	position_id int8 NOT NULL,
    shop_id int8 NOT NULL,
	gender bool NOT NULL,
	CONSTRAINT store_employee_pkey PRIMARY KEY (id_),
	CONSTRAINT fk_employee_position FOREIGN KEY (position_id) REFERENCES positions(id_),
    CONSTRAINT fk_employee_shop FOREIGN KEY (shop_id) REFERENCES stores(id_);
);

CREATE TABLE IF NOT EXISTS counter (
	"name" varchar(75) NOT NULL,
	currentid int8 NULL,
	CONSTRAINT counter_pkey PRIMARY KEY (name)
);

CREATE TABLE IF NOT EXISTS store_eshop (
    id_ int8 NOT NULL,
    name varchar(150) NOT NULL,
    type_id int8 NOT NULL,
    price numeric(10, 2) NOT NULL,
    quantity int4 NOT NULL,
    is_archived bool NOT NULL,
    description text,
    CONSTRAINT store_eshop_pkey PRIMARY KEY (id_),
    CONSTRAINT fk_store_eshop_type FOREIGN KEY (type_id) REFERENCES store_eshop_types(id_)
);

CREATE TABLE IF NOT EXISTS store_purchase (
    id_ int8 NOT NULL,
    store_eshop_id int8 NOT NULL,
    employee_id int8 NOT NULL,
    shop_id int8 NOT NULL,
    purchase_date timestamp NOT NULL,
    purchase_type_id int8 NOT NULL,
    CONSTRAINT store_purchase_pkey PRIMARY KEY (id_),
    CONSTRAINT fk_purchases_store_eshop FOREIGN KEY (store_eshop_id) REFERENCES store_eshop(id_),
    CONSTRAINT fk_purchases_employee FOREIGN KEY (employee_id) REFERENCES store_employee(id_),
    CONSTRAINT fk_purchases_shop FOREIGN KEY (shop_id) REFERENCES stores(id_),
    CONSTRAINT fk_purchases_purchase_type FOREIGN KEY (purchase_type_id) REFERENCES store_purchase_types(id_)
);

CREATE TABLE IF NOT EXISTS positions (
    id_ int8 NOT NULL,
    name varchar(150) NOT NULL,
    CONSTRAINT positions_pkey PRIMARY KEY (id_)
);

CREATE TABLE IF NOT EXISTS store_eshop_types (
    id_ int8 NOT NULL,
    name varchar(150) NOT NULL,
    CONSTRAINT store_eshop_types_pkey PRIMARY KEY (id_)
);

CREATE TABLE IF NOT EXISTS stores (
    id_ int8 NOT NULL,
    name varchar(150) NOT NULL,
    address text NOT NULL,
    CONSTRAINT stores_pkey PRIMARY KEY (id_)
);

CREATE TABLE IF NOT EXISTS store_purchase_types (
    id_ int8 NOT NULL,
    name varchar(150) NOT NULL,
    CONSTRAINT store_purchase_types_pkey PRIMARY KEY (id_)
);

CREATE TABLE IF NOT EXISTS store_eshop_type_employee (
    store_eshop_type_id int8 NOT NULL,
    employee_id int8 NOT NULL,
    CONSTRAINT store_eshop_type_employee_pkey PRIMARY KEY (store_eshop_type_id, employee_id),
    CONSTRAINT fk_store_eshop_type FOREIGN KEY (store_eshop_type_id) REFERENCES store_eshop_types(id_),
    CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES store_employee(id_)
);

CREATE TABLE IF NOT EXISTS store_eshop_shop (
    store_eshop_id int8 NOT NULL,
    shop_id int8 NOT NULL,
    quantity int4 NOT NULL,
    CONSTRAINT store_eshop_shop_pkey PRIMARY KEY (store_eshop_id, shop_id),
    CONSTRAINT fk_store_eshop FOREIGN KEY (store_eshop_id) REFERENCES store_eshop(id_),
    CONSTRAINT fk_shop FOREIGN KEY (shop_id) REFERENCES stores(id_)
);