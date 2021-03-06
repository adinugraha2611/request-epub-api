// get user's requests list
select books.id, count(user_request.user_id) as reqs_count, bool_or(user_request.user_id = 2) as req_by_me from books
join user_request on user_request.book_id = books.id
where books.id in (
  select book_id from user_request
  where user_id = 1
)
group by books.id;
// get a book 
select books.id, count(books.id) as reqs_count, bool_or(user_request.user_id = 2) as req_by_me from books
join user_request on user_request.book_id = books.id
where books.id = 2
group by books.id;
console.log(book)
return book
// get requestsFeed
select books.*, count(id) as reqs_count, bool_or(user_request.user_id = 10) as req_by_one from books          
join user_request on user_request.book_id = books.id                                                                    
group by books.id                                                                                                       
order by books.id;

/* add new foreign key column */
ALTER TABLE users
ADD book_id INTEGER REFERENCES books(id);

/* update TABLE */
UPDATE users
SET book_id = 37
WHERE id = 4;

/* innerJoin: join all records from  2 tables that have foreign keys (FK is not null) */
/* in this case, this shows users table dan diteruskan dengan book table yang menampilkan record dari book id */
SELECT username, title FROM users
JOIN books ON users.book_id = books.id;

/* left join: join table from the left to table on the right even if foreign key is null */
/* simply, innerJoin but include people without book */
SELECT username, title FROM users
LEFT JOIN books ON users.book_id = books.id
ORDER BY title;

SELECT username, title FROM users
LEFT JOIN books ON users.book_id = books.id
where books.title IS NULL;

select books.* from users
left join books on users.book_id = books.id
where users.id = 1;

/* count request_count for a book */
select book_id, count('book_id') from user_request
group by book_id
order by book_id;

/* add requests_count column to books table */
ALTER TABLE books
add column requests_count integer;

/* insert user_request */
insert into user_request (user_id, book_id)
values (61,11);

insert into user_request (user_id, book_id)
values (61,1);
insert into user_request (user_id, book_id)
values (61,18);
insert into user_request (user_id, book_id)
values (62,1);
insert into user_request (user_id, book_id)
values (62,2);

insert into user_request (user_id, book_id)
values (62,12);
insert into user_request (user_id, book_id)
values (63,2);
insert into user_request (user_id, book_id)
values (63,6);





ALTER TABLE books
ADD requests_count INTEGER; 
/* set requests_count column in books */

with book_totalreqs as (
  select book_id, count('book_id') as totalreqs
  from user_request
  group by book_id
)
update books
set requests_count = (
  select totalreqs from book_totalreqs
  where books.id in (book_totalreqs.book_id)
);

select user_id, book_id from user_request
where user_id = 61 and book_id = 1;

select *, user_request.user_id from books
join user_request on id = user_request.book_id
where user_request.user_id = 1;