-- Book with Authors view
CREATE OR REPLACE VIEW BookWithAuthors AS
SELECT b.isbn, b.title, a.author_name
FROM Books b
JOIN Book_Author ba ON b.isbn = ba.isbn
JOIN Authors a ON ba.author_id = a.author_id;

-- Book full details view
CREATE OR REPLACE VIEW BookFullDetails AS
SELECT b.isbn, b.title, a.author_name, g.genre_name
FROM Books b
JOIN Book_Author ba ON b.isbn = ba.isbn
JOIN Authors a ON ba.author_id = a.author_id
JOIN Book_Genre bg ON b.isbn = bg.isbn
JOIN Genres g ON bg.genre_id = g.genre_id;