SELECT CHECKSUM('hello')      -- 533340124
  , CHECKSUM('Hello')         -- 533340124
  , CHECKSUM('olleh')         -- 1600790340
  , CHECKSUM('hloel')         -- 1606885152