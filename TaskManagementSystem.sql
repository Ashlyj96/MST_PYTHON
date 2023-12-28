CREATE DATABASE TaskManagementSystem;
USE TaskManagementSystem;

 CREATE TABLE users(
  user_id  INT PRIMARY KEY ,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(15) NOT NULL
  );
  
  INSERT INTO users (user_id,username,password)
  VALUES(1,'abhi','abcd');
  INSERT INTO users (user_id,username,password)
  VALUES(2,'manu','hijk');
  INSERT INTO users (user_id,username,password)
  VALUES(3,'anu','wxyz');
  INSERT INTO users (user_id,username,password)
  VALUES(4,'zevin','mnop');
  INSERT INTO users (user_id,username,password)
  VALUES(5,'ravi','happy');


SELECT * FROM users;



CREATE TABLE tasks (
   task_id INT PRIMARY KEY,
   user_id INT,
   title VARCHAR(100) NOT NULL,
   description TEXT,
   due_date DATE,
   status ENUM('incomplete','completed')
   DEFAULT 'incomplete',
   FOREIGN KEY (user_id) REFERENCES users(user_id)
   );
  
  
   
INSERT INTO tasks (task_id,user_id,title,description,due_date)
VALUES
(101,1,'Task 1','description for Task 1 ','2024-02-01');  
INSERT INTO tasks (task_id,user_id,title,description,due_date)
VALUES
(102,2,'Task 2','description for Task 2 ','2024-03-01');  
INSERT INTO tasks (task_id,user_id,title,description,due_date)
VALUES
(103,3,'Task 3','description for Task 3 ','2024-04-01');  
INSERT INTO tasks (task_id,user_id,title,description,due_date)
VALUES
(104,4,'Task 4','description for Task 4 ','2024-05-01');  
INSERT INTO tasks (task_id,user_id,title,description,due_date)
VALUES
(105,5,'Task 5','description for Task 5 ','2024-05-01');  


SELECT * FROM tasks;

SELECT * FROM tasks WHERE task_id =103;

SELECT  user_id,task_id,title,due_date,status
FROM tasks;
 
UPDATE tasks SET status='completed'
WHERE task_id=101;
UPDATE tasks SET status='completed'
WHERE task_id=102;
UPDATE tasks SET status='completed'
WHERE task_id=103;
UPDATE tasks SET status='completed'
WHERE task_id=104;
UPDATE tasks SET status='completed'
WHERE task_id=105;

SELECT * FROM tasks;

CREATE TABLE categories(
  category_id INT  PRIMARY KEY,
  category_name VARCHAR(50) NOT NULL
  );
INSERT INTO categories(category_id,category_name)
VALUES(101,'name 1');
INSERT INTO categories(category_id,category_name)
VALUES(102,'name 2');
INSERT INTO categories(category_id,category_name)
VALUES(103,'name 3');
INSERT INTO categories(category_id,category_name)
VALUES(104,'name 4');
INSERT INTO categories(category_id,category_name)
VALUES(105,'name 5');

SELECT * FROM categories;


 CREATE TABLE task_categories(
  task_id INT ,
  category_id INT,
  PRIMARY KEY (task_id,category_id),
  FOREIGN KEY (task_id) REFERENCES tasks(task_id),
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
  ); 
INSERT INTO task_categories(task_id,category_id)
VALUES(101,101);
INSERT INTO task_categories(task_id,category_id)
VALUES(102,102);
INSERT INTO task_categories(task_id,category_id)
VALUES(103,103);
INSERT INTO task_categories(task_id,category_id)
VALUES(104,104);
INSERT INTO task_categories(task_id,category_id)
VALUES(105,105);


SELECT * FROM task_categories;
 

 SELECT  tasks.* FROM tasks
 JOIN task_categories ON tasks.task_id =
 task_categories.task_id
 WHERE task_categories.category_id= 101;
 
 
USE TaskManagementSystem;
SELECT b. task_id,b.title,b.due_date,b.status
FROM tasks b
INNER JOIN users a ON b.user_id=a.user_id;

SELECT * FROM 
users INNER JOIN tasks
WHERE users.user_id=tasks.user_id;


SELECT users.user_id,users.username,
tasks.task_id,tasks.title,
tasks.due_date,tasks.status
FROM users
INNER JOIN tasks ON users.user_id=
tasks.user_id;

