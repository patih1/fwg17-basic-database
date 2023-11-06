create table "product"(
	"product_id" serial primary key,
	"name" varchar(50),
	"price" int
);

alter table "product"
rename column "product_name" to "name";

alter table product 
add column "ice" boolean;

insert into product ("name", "price", "ice")
values ('latte', 15000, false), ('latte', 17000, true)

alter table "product" drop column ice;

update "product" set "name" = 'americano'
where "product_id" = 2;

select * from product;



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