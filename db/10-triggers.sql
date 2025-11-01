-- Trigger that fires before inserting into Book_Genre.
-- Verifies that a book has no more than 3 genres and throws an error if an attempt is made to exceed this number.
-- This ensures business integrity at the database level.
CREATE OR REPLACE FUNCTION check_book_genres()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT COUNT(*) FROM Book_Genre WHERE isbn = NEW.isbn) + 1 > 3 THEN
        RAISE EXCEPTION 'A book cannot have more than 3 genres';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_book_genres
BEFORE INSERT ON Book_Genre
FOR EACH ROW
EXECUTE FUNCTION check_book_genres();
