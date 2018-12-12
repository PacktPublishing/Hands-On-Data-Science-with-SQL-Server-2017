-- computing aggregates over preceeding query shows the difference
SELECT COUNT(*) AS RecordCount -- 71
  , COUNT(MiddleName) AS ValueCount -- the 71st value is ignored, it's NULL
FROM (SELECT DISTINCT MiddleName FROM Person.Person) AS x