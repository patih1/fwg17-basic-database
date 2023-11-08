create table "product"(
	"product_id" serial primary key,
	"name" varchar(50),
	"price" int
);

alter table product 
add column "ice" boolean;

insert into product ("name", "price", "ice")
values ('latte', 15000, false), ('latte', 17000, true);

alter table "product" drop column "ice";

update "product" set "name" = 'americano'
where "product_id" = 2;

select * from product;

-----------------------------------------------------------------------------------------------------------------

create table "promo"(
	"code" varchar(20) unique,
	"min" int not null,
	"max" int not null,
	"discount" float not null
);

insert into "promo" ("code", "min", "max", "discount")
values('FAZZFOOD', 50000, 50000, 0.5),
('DITRAKTIR60', 25000, 30000, 0.6);

insert into "promo" ("code", "min", "max", "discount")
values('FAKEDISCOUNT100', 0, 1000000, 1);

select code from "promo"
where code = 'FAKEDISCOUNT100';

update "promo" set "max" = 60000
where "discount" = 0.5;

delete from "promo"
where "discount" = 1;

-----------------------------------------------------------------------------------------------------------------

create table "order" (
	"product_name" varchar(50),
	"customer_name" varchar(50),
	"product_id" int,
	"customer_id" int
);

alter table "order"
add column "price" int;

select * from "order";

insert into "order"
values ('latte', 'Patrick Star', 1, 2, 15000),
('americano', 'Squidward Tentacles', 2, 3, 17000),
('americano', 'Spongebob Squarepants', 2, 1, 17000);

update "order" set "customer_name" = 'Sandy Cheeks', "customer_id" = 4
where "customer_id" = 1;

delete from "order" where "customer_id" = 3;

-------------------------------------------------------------------------------------------------------------------------

create table "user"(
	"customer_id" serial primary key,
	"first_name" varchar(50) not null,
	"last_name" varchar(50)
);

insert into "user" ("first_name", "last_name")
values ('Spongebob', 'Squarepants'),
('Patrick', 'Star'),
('Squidward', 'Tentacles'),
('Sandy', 'Cheeks'),
('Sheldon', 'Plankton'),
('Larry', 'Lobster');

select "first_name" from "user";

update "user" set "first_name" = 'Eugine', "last_name" = 'Crab'
where "customer_id" = 6;

---------------------------------------------------------------------------------------------------------

alter table "product"
rename to "products";

alter table "user"
rename to "users";

alter table "order"
rename to "orders";

----------------------------------------------------------------------------------------------------------------------

alter table "products"
add column "quantity" int,
add column "available" bool,
add column "description" text,
add column "createdAt" timestamp default now(),
add column "updatedAt" timestamp,
alter column "name" set not null,
rename column "product_id" to "id",
ALTER COLUMN "price" TYPE numeric(12, 2);

-----------------------------------------------------------------------------------------------------------------------

alter table "promo"
add column "id" serial primary key
add column "createdAt" timestamp default now(),
add column "updatedAt" timestamp,
ALTER COLUMN "min" TYPE numeric(12, 2),
ALTER COLUMN "max" TYPE numeric(12, 2);

-----------------------------------------------------------------------------------------------------------------------

alter table "orders"
add column "total" numeric(12,2),
add column "id" serial primary key,
add column "createdAt" timestamp default now(),
add column "updatedAt" timestamp;
-----------------------------------------------------------------------------------------------------------------------

alter table "users"
rename "customer_id" to "id",
add column "createdAt" timestamp default now(),
add column "updatedAt" timestamp;

-----------------------------------------------------------------------------------------------------------------------

create table "categories"(
	"id" serial primary key,
	"name" varchar(30) not null,
	"description" text,
	"promoId" int references "promo" ("id"),
	"createdAt" timestamp default now(),
	"updatedAt" timestamp
);

-----------------------------------------------------------------------------------------------------------------------

create table "product_categories"(
	"id" serial primary key,
	"product_id" int references "products" ("id"),
	"category_id" int references "categories" ("id"),
	"createdAt" timestamp default now(),
	"updatedAt" timestamp
);

-----------------------------------------------------------------------------------------------------------------------

alter table "orders"
add constraint "product_id" foreign key ("id") references "products" ("id"),
add constraint "customer_id" foreign key ("id") references "users" ("id");

-----------------------------------------------------------------------------------------------------------------------

update "products" set "description" = 'random words goes brrrrr';

----------------------------------------------------------------------------------------------------------------------- 

insert into "categories" ("name", "description") values ('coffe', 'random words goes brrr');

insert into "product_categories" ("product_id", "category_id") values (1, 1), (2, 1);

select "p"."name", "price", "c"."name" as "category_name" from "products" "p"
join "product_categories" "pc" on "pc"."product_id" = "p"."id"
join "categories" "c" on "c"."id" = "pc"."category_id";



begin;
	insert into "products" ("name", "price", "quantity", "available", "description")
	values ('manggo', 20000, null, true, 'one must imagine manggo happy');
	insert into "categories" ("name", "description") values ('juice', 'manggo must happy imagine one');
	insert into "product_categories" ("product_id", "category_id") values (3, 2);
end;

