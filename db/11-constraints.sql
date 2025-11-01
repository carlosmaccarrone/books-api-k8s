-- Constaints are rules that SQL applies to columns/tables to maintain data integrity.

-- ISBN must be unique (already implemented as a PRIMARY KEY)
-- Do not allow duplicates in Book_Genre (already implemented as a composite PK)

-- author_name cannot be NULL
ALTER TABLE Authors ALTER COLUMN author_name SET NOT NULL;

-- Minimum title length constraint
ALTER TABLE Books ADD CONSTRAINT chk_title_length CHECK (char_length(title) > 2);