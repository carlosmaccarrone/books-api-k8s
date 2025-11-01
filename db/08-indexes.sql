-- index to search for books by title
CREATE INDEX idx_books_title ON Books(title);

-- index to search for authors by name
CREATE INDEX idx_authors_name ON Authors(author_name);

-- Example benchmark (manual):
-- Before: EXPLAIN ANALYZE SELECT * FROM Books WHERE title = 'Zarathustra';
-- After: EXPLAIN ANALYZE SELECT * FROM Books WHERE title = 'Zarathustra';
-- Much shorter expected runtime thanks to the index.