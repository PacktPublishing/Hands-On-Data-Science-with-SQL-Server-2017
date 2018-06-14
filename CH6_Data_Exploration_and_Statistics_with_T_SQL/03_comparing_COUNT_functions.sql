SELECT COUNT(*) AS RecordCount                    -- 19972
  , COUNT(MiddleName) AS PeopleUsingMiddleName    -- 11473
  , COUNT(DISTINCT MiddleName) AS MiddleNamesUsed --    70
FROM Person.Person