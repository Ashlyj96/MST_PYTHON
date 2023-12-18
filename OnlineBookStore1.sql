CREATE DATABASE OnlineBookStore ;
USE OnlineBookStore ;
CREATE TABLE authors (
author_id INT,
author_name VARCHAR(30),
country VARCHAR(15),
PRIMARY KEY (author_id)
);

SELECT * FROM authors ;

 INSERT INTO authors VALUES
(1,'William Shakespeare','England'),
(2,'Lewis Carrol','England'),
(3,'Manu S Pillai','India'),
(4,'Leo Tolstoy','England'),
(5,'Rabindra Nath Tagore','India');

SELECT * FROM authors ;

USE OnlineBookStore ;
CREATE TABLE books (
book_id VARCHAR(11) PRIMARY KEY,
title VARCHAR(50) ,
author_id INT,
FOREIGN KEY (author_id) REFERENCES authors(author_id),
price DECIMAL(10,2),
publication_year INT
);

 INSERT INTO books VALUES
 ('s1','Macbeth',1,1000.00,1623) ,
 ('s2','Alice In Wonderland',2,400.00,1865) ,
 ('s3','The Ivory Throne',3,900.00,2016) ,
 ('s4','War And Peace',4,500.00,1867) ,
 ('s5','Geethanjali',5,750.00,1910) ;
 
 SELECT * FROM books ;
 
USE OnlineBookStore ;
CREATE TABLE orders (
order_id VARCHAR(11) PRIMARY KEY,
book_id VARCHAR(11),
FOREIGN KEY (book_id) REFERENCES books(book_id),
customer_name VARCHAR(20) ,
order_date DATE
);

 INSERT INTO orders VALUES
 ('a1','s1','abi','2024-10-15'),
 ('a2','s2','manu','2024-11-25'),
 ('a3','s3','vinu','2024-05-10'),
 ('a4','s4','anu','2024-02-05'),
 ('a5','s5','ani','2024-01-01');

 SELECT * FROM orders ;
 
 
 
 SELECT * FROM authors ;
 
 SELECT * FROM books ; 
 
 SELECT * FROM orders ;


USE OnlineBookStore ;
SELECT * FROM books;
ALTER TABLE books
ADD genre VARCHAR(15);
SELECT * FROM books;

 
USE OnlineBookStore ;
SELECT * FROM orders;
ALTER TABLE orders
ADD quantity VARCHAR(10);
SELECT * FROM orders;

USE OnlineBookStore ;
SELECT b.title,b.price,
b.publication_year,b.genre,
a.author_name,a.country
FROM books b
JOIN authors a ON b.author_id=
a.author_id;


SELECT o.order_id,b.title,
o.customer_name,o.order_date,o.quantity
FROM orders o
JOIN books b ON
      o.book_id=b.book_id;

