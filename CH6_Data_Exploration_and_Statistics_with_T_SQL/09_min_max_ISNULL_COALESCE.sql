SELECT ISNULL(1, 2) -- returns 1
  , ISNULL(NULL, 5) -- returns 5
  , ISNULL(NULL, NULL)-- must return NULL

SELECT COALESCE(NULL, 1, 2, 3) -- returns 1
  , COALESCE(1, NULL, NULL) -- returns also 1

SELECT COALESCE(NULL, NULL, NULL) -- Leads to an error, all constants are NULLs

DECLARE @a int, @b int, @c int
SELECT COALESCE(@a, @b, @c) -- Must return NULL

-- for to be sure that NOT NULL is returned
SELECT COALESCE(@a, @b, @c, 0) -- NOT NULL constant is added as extra parameter