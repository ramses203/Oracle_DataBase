/*회원 테이블(MEMBER)*/

create table member (
id varchar2(20) not null constraint pk_member_id primary key,
pwd varchar2(20),
name varchar2(50),
zipcode varchar2(7) constraint fk_member_zipcode references tb_zipcode,    
address varchar2(20),
tel varchar2(13),
indate date default sysdate);


/*우편주소 테이블(tb_zipcode)*/
create table tb_zipcode(
zipcode varchar2(7) not null constraint pk_tb_zipcode primary key,
sido varchar2(30),
gugun varchar2(30),
dong varchar2(30),
bunji varchar2(30)
);



/*상품 테이블(products)*/
create table products(
product_code varchar2(20) not null constraint pk_products_code primary key,
product_name varchar2(100),
product_kind char(1),
product_price1 varchar2(10),
product_price2 varchar2(10),
product_content varchar2(1000),
product_image varchar2(50),
sizeSt varchar2(5),
sizeEt varchar2(5),
product_quantity varchar2(5),
useyn char(1),
indate date 
);





/*주문 테이블(order)*/
create table orders(
o_seq number(10) not null constraint pk_order_seq primary key,
product_code varchar2(20) constraint fk_order_code references products,
id varchar2(16) constraint fk_order_id references member,
product_size varchar2(5),
quantity varchar2(5),
result char(1),
indate date);


select * from member;
select * from tb_zipcode;
select * from products;
select * from orders;







