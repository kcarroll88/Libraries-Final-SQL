USE libraries_final
GO

CREATE DATABASE libraries_final;

DROP TABLE book_author;
DROP TABLE book_loans;
DROP TABLE book_copies;
DROP TABLE tbl_books;
DROP TABLE book_borrower;
DROP TABLE publisher;
DROP TABLE library_branch


CREATE TABLE library_branch (
	branch_id INT PRIMARY KEY NOT NULL,
	branch_name VARCHAR(50) NOT NULL,
	branch_address VARCHAR(50) NOT NULL
);

CREATE TABLE publisher (
	publisher_name VARCHAR(50) PRIMARY KEY NOT NULL,
	publisher_address VARCHAR(50) NOT NULL,
	publisher_phone VARCHAR(50) NOT NULL
);

CREATE TABLE book_borrower (
	card_no INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	borrower_name VARCHAR(50) NOT NULL,
	borrower_address VARCHAR(50) NOT NULL,
	borrower_phone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_books (
	book_id INT PRIMARY KEY,
	book_title VARCHAR(50) NOT NULL,
	publisher_name VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE book_copies (
	book_id INT NOT NULL FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL FOREIGN KEY REFERENCES library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	number_of_copies INT NOT NULL
);

CREATE TABLE book_loans (
	book_id INT NOT NULL FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT FOREIGN KEY REFERENCES library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	card_no INT FOREIGN KEY REFERENCES book_borrower(card_no) ON UPDATE CASCADE ON DELETE CASCADE,
	date_out VARCHAR(50),
	date_due VARCHAR(50)
);

CREATE TABLE book_author (
	book_id INT NOT NULL FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	author_name VARCHAR(50) NOT NULL
);

/*---------------------------------------------------------------------------
							INESERT CONTENT
-----------------------------------------------------------------------------*/

INSERT INTO library_branch
	(branch_id, branch_name, branch_address)
	VALUES 
	(100, 'Sharpstown', '12 Mo St'),
	(101, 'Central', '1 Danger Ave'),
	(102, 'Boston', '66 Boston Rd'),
	(103, 'Jerrytown', '43 Justin St')
;

INSERT INTO publisher
	(publisher_name, publisher_address, publisher_phone)
	VALUES
	('Epic Publishing', '200 Harvey Dr', '432-765-3453'),
	('Amazing Books', '1 Jason Ave', '245-088-1298')
;

INSERT INTO book_borrower
	(borrower_name, borrower_address, borrower_phone)
	VALUES
	('Jerry', '3 Ferry Rd', '342-453-1341'),
	('Chris', '763 Commonwealth Ave', '647-345-2342'),
	('Daisy', '98 Jonathan St', '222-555-2342'),
	('Sandy', '45 Stellar Rd', '555-878-2983'),
	('Tony', '2 Tony St', '323-564-9872'),
	('Johnson', '45 Magic Ave', '832-190-7492'),
	('Sally', '45 Flower St', '666-897-3423'),
	('Lisa', '66 Wild Dr', '444-233-1111'),
	('Jonathan', '33 Brave St', '767-767-6767')
;

INSERT INTO tbl_books
	(book_id, book_title, publisher_name)
	VALUES
	(1200, 'The Lost Tribe', 'Epic Publishing'),
	(1201, 'The Ruby Knight', 'Epic Publishing'),
	(1202, 'It Comes at Night', 'Amazing Books'),
	(1203, 'IT', 'Amazing Books'),
	(1204, 'She Walks', 'Epic Publishing'),
	(1205, 'Jerry was a Racecar Driver', 'Amazing Books'),
	(1206, 'The Shinning', 'Amazing Books'),
	(1207, 'Yearly', 'Epic Publishing'),
	(1208, 'Murder', 'Epic Publishing'),
	(1209, 'The Sword', 'Amazing Books'),
	(1210, 'Jonathan', 'Epic Publishing'),
	(1211, 'The Road', 'Amazing Books'),
	(1212, 'Star Ave', 'Amazing Books'),
	(1213, 'Oceans Wide', 'Epic Publishing'),
	(1214, 'Miller Time', 'Epic Publishing'),
	(1215, 'El Diablo', 'Epic Publishing'),
	(1216, 'Frozen Solid', 'Epic Publishing'),
	(1217, 'Bad Johnson', 'Epic Publishing'),
	(1218, 'The Last Stand', 'Amazing Books'),
	(1219, 'Treehouse', 'Amazing Books'),
	(1220, '1 Shade of Green', 'Amazing Books'),
	(1221, 'Diamond Throne', 'Epic Publishing'),
	(1222, 'Crimson', 'Epic Publishing'),
	(1223, 'Mist Walk', 'Amazing Books'),
	(1224, 'Vampire', 'Amazing Books'),
	(1225, 'Jerry Tries', 'Epic Publishing'),
	(1226, 'Sports', 'Amazing Books'),
	(1227, 'Light Bulb', 'Amazing Books'),
	(1228, 'Monthly', 'Epic Publishing'),
	(1229, 'Alive', 'Epic Publishing'),
	(1230, 'The Staff', 'Amazing Books'),
	(1231, 'Jason', 'Epic Publishing'),
	(1232, 'Dirt Road', 'Amazing Books'),
	(1233, 'Space and Beyond', 'Amazing Books'),
	(1234, 'Oceans Deep', 'Epic Publishing'),
	(1235, 'Bud Time', 'Epic Publishing'),
	(1236, 'Angels', 'Epic Publishing'),
	(1237, 'Melted', 'Epic Publishing'),
	(1238, 'Good Friday', 'Epic Publishing'),
	(1239, 'At the Wall', 'Amazing Books'),
	(1240, 'Bunker', 'Amazing Books')
;

INSERT INTO book_copies
	(number_of_copies, book_id, branch_id)
	VALUES
	(2, 1200, 100),
	(2, 1201, 100),
	(2, 1202, 100),
	(2, 1203, 101),
	(2, 1204, 100),
	(2, 1205, 100),
	(2, 1206, 101),
	(2, 1207, 100),
	(2, 1208, 100),
	(2, 1209, 100),
	(2, 1210, 100),
	(2, 1211, 100),
	(2, 1212, 101),
	(2, 1213, 101),
	(2, 1214, 101),
	(2, 1215, 101),
	(2, 1216, 101),
	(2, 1217, 101),
	(2, 1218, 101),
	(2, 1219, 101),
	(2, 1220, 102),
	(2, 1221, 102),
	(2, 1222, 102),
	(2, 1223, 102),
	(2, 1224, 102),
	(2, 1225, 102),
	(2, 1226, 102),
	(2, 1227, 102),
	(2, 1228, 102),
	(2, 1229, 102),
	(2, 1230, 103),
	(2, 1231, 103),
	(2, 1232, 103),
	(2, 1233, 103),
	(2, 1234, 103),
	(2, 1235, 103),
	(2, 1236, 103),
	(2, 1237, 103),
	(2, 1238, 103),
	(2, 1239, 103),
	(2, 1240, 103)
;

INSERT INTO book_loans
	(book_id, branch_id, card_no, date_out, date_due)
	VALUES
	(1200, 100, 1, '7/13/18', '7/25/18'),
	(1200, 100, 2, '7/14/18', '7/26/18'),
	(1201, 100, 1, '7/16/18', '7/28/18'),
	(1201, 100, 6, '2/13/18', '2/25/18'),
	(1202, 100, 1, '4/13/18', '4/25/18'),
	(1203, 101, 4, '7/2/18', '7/9/18'),
	(1203, 101, 7, '7/8/18', '7/15/18'),
	(1204, 100, 1, '7/9/18', '7/16/18'),
	(1204, 100, 6, '12/13/18', '12/25/18'),
	(1205, 100, 1, '11/13/18', '11/25/18'),
	(1205, 100, 5, '1/13/18', '1/25/18'),
	(1206, 101, 4, '1/24/18', '2/1/18'),
	(1206, 101, 6, '7/22/18', '8/1/18'),
	(1207, 100, 1, '7/23/18', '8/2/18'),
	(1207, 100, 7, '5/21/18', '5/30/18'),
	(1208, 100, 1, '3/16/18', '3/23/18'),
	(1208, 100, 8, '2/19/18', '2/26/18'),
	(1209, 100, 1, '2/23/18', '3/1/18'),
	(1209, 100, 6, '3/13/18', '3/25/18'),
	(1210, 100, 2, '3/3/18', '3/10/18'),
	(1210, 100, 6, '3/5/18', '3/13/18'),
	(1211, 100, 2, '4/6/18', '4/13/18'),
	(1211, 100, 1, '6/23/18', '7/1/18'),
	(1212, 101, 3, '1/15/18', '1/25/18'),
	(1212, 101, 7, '6/7/18', '6/13/18'),
	(1213, 101, 3, '7/19/18', '7/26/18'),
	(1213, 101, 6, '7/4/18', '7/13/18'),
	(1214, 101, 3, '1/3/18', '1/10/18'),
	(1215, 101, 3, '8/5/18', '8/13/18'),
	(1215, 101, 2, '9/13/18', '9/26/18'),
	(1216, 101, 3, '9/1/18', '9/13/18'),
	(1216, 101, 2, '10/13/18', '10/25/18'),
	(1217, 101, 3, '10/3/18', '10/13/18'),
	(1218, 101, 3, '11/13/18', '11/25/18'),
	(1218, 101, 4, '11/3/18', '11/13/18'),
	(1219, 101, 5, '5/5/18', '5/13/18'),
	(1219, 101, 8, '5/3/18', '5/9/18'),
	(1220, 102, 5, '5/1/18', '5/10/18'),
	(1220, 102, 6, '8/13/18', '8/26/18'),
	(1221, 102, 5, '8/1/18', '8/10/18'),
	(1221, 102, 8, '9/3/18', '9/13/18'),
	(1222, 102, 8, '9/23/18', '10/1/18'),
	(1223, 102, 7, '1/13/18', '1/23/18'),
	(1224, 102, 7, '1/1/18', '1/10/18'),
	(1225, 102, 5, '2/13/18', '2/25/18'),
	(1226, 102, 6, '2/1/18', '2/13/18'),
	(1227, 102, 8, '7/13/18', '7/25/18'),
	(1228, 103, NULL, NULL, NULL),
	(1229, 103, NULL, NULL, NULL),
	(1230, 103, NULL, NULL, NULL),
	(1231, 103, NULL, NULL, NULL),
	(1232, 103, NULL, NULL, NULL),
	(1233, 103, NULL, NULL, NULL),
	(1234, 103, NULL, NULL, NULL),
	(1235, 103, NULL, NULL, NULL),
	(1236, 103, NULL, NULL, NULL),
	(1237, 103, NULL, NULL, NULL),
	(1238, 103, NULL, NULL, NULL),
	(1239, 103, NULL, NULL, NULL),
	(1240, 103, NULL, NULL, NULL)
;

INSERT INTO book_author
	(book_id, author_name)
	VALUES
	(1200, 'Jerry Stevens'),
	(1201, 'David Eddings'),
	(1202, 'Jonathan Derry'),
	(1203, 'Stephen King'),
	(1204, 'Jerry Stevens'),
	(1205, 'Christopher Allen'),
	(1206, 'Stephen King'),
	(1207, 'George Gregory'),
	(1208, 'Cindy Stella'),
	(1209, 'Sarah Mizork'),
	(1210, 'Shelby Givens'),
	(1211, 'Daniel Hop'),
	(1212, 'Allana Kritz'),
	(1213, 'Bob Evans'),
	(1214, 'Hillary Smith'),
	(1215, 'Joe Cary'),
	(1216, 'Boggie Bob'),
	(1217, 'Sam Willgoose'),
	(1218, 'Phill Gelinas'),
	(1219, 'Chris Narainen'),
	(1220, 'Beefy Bob'),
	(1221, 'Steven Johnson'),
	(1222, 'Cary Rein'),
	(1223, 'Crystal War'),
	(1224, 'Jenny Penny'),
	(1225, 'Stella Hanz'),
	(1226, 'Jerry Freed'),
	(1227, 'Melissa Christ'),
	(1228, 'Paula Freedman'),
	(1229, 'Tom Clancy'),
	(1230, 'Alan Sherry'),
	(1231, 'Yonky Jonky'),
	(1232, 'Rachel McGibbens'),
	(1233, 'Terry Merry'),
	(1234, 'Larry Jeff'),
	(1235, 'Alan Poe'),
	(1236, 'Stoney Heish'),
	(1237, 'Marissa Barber'),
	(1238, 'Noelle Carroll'),
	(1239, 'Justin Mimz'),
	(1240, 'Max Jeffers')
;

/*-------------------------------------------------------------------------------------
									QUERIES
---------------------------------------------------------------------------------------*/

SELECT book_copies.number_of_copies, tbl_books.book_title, library_branch.branch_name
	FROM book_copies 
	INNER JOIN tbl_books ON book_copies.book_id = tbl_books.book_id
	INNER JOIN library_branch ON library_branch.branch_id = book_copies.branch_id
	WHERE library_branch.branch_name = 'Sharpstown' AND tbl_books.book_title = 'The Lost Tribe'
;

SELECT book_copies.number_of_copies, tbl_books.book_title, library_branch.branch_name
	FROM book_copies
	INNER JOIN tbl_books ON book_copies.book_id = tbl_books.book_id
	INNER JOIN library_branch ON library_branch.branch_id = book_copies.branch_id
	WHERE tbl_books.book_title = 'The Lost Tribe'
;

 SELECT book_borrower.borrower_name 
	FROM book_borrower 
	LEFT JOIN book_loans ON book_borrower.card_no = book_loans.card_no 
	WHERE book_loans.book_id IS NULL
;

SELECT book_borrower.borrower_name, book_borrower.borrower_address, tbl_books.book_title
	FROM library_branch
	INNER JOIN book_loans ON library_branch.branch_id = book_loans.branch_id
	INNER JOIN book_borrower ON book_borrower.card_no = book_loans.card_no
	INNER JOIN tbl_books ON tbl_books.book_id = book_loans.book_id
	WHERE book_loans.date_due = CONVERT(DATE, getdate()) AND library_branch.branch_name = 'Sharpstown'
;

SELECT library_branch.branch_name, COUNT(book_loans.book_id) 
	FROM library_branch 
	LEFT JOIN book_loans ON library_branch.branch_id = book_loans.branch_id 
	GROUP BY library_branch.branch_id, library_branch.branch_name
;

SELECT book_borrower.borrower_name, book_borrower.borrower_address, COUNT(book_id) AS BooksCheckedOut
	FROM book_borrower INNER JOIN book_loans ON book_borrower.card_no = book_loans.card_no 
	GROUP BY book_borrower.card_no, book_borrower.borrower_name, book_borrower.borrower_address
	HAVING COUNT(book_id) > 5
;

SELECT tbl_books.book_title, book_copies.number_of_copies
	FROM library_branch
	INNER JOIN book_copies ON library_branch.branch_id = book_copies.branch_id
	INNER JOIN book_author ON book_author.book_id = book_copies.book_id
	INNER JOIN tbl_books ON book_author.book_id = tbl_books.book_id
	WHERE library_branch.branch_name = 'Central' AND book_author.author_name = 'Stephen King'
;
