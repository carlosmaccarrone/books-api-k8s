-- Description:
-- Returns all books by a specific author.
-- Parameter:
-- 		p_author_id (BIGINT) -> ID of the author whose books we want to retrieve.
-- Returns:
-- 		A table with columns:
-- 		isbn -> ISBN of the book
-- 		title -> Title of the book
CREATE OR REPLACE FUNCTION get_books_by_author(p_author_id BIGINT)
RETURNS TABLE(isbn TEXT, title TEXT) AS $$
BEGIN
    RETURN QUERY
    SELECT b.isbn, b.title
    FROM Books b
    JOIN Book_Author ba ON b.isbn = ba.isbn
    WHERE ba.author_id = p_author_id;
END;
$$ LANGUAGE plpgsql;