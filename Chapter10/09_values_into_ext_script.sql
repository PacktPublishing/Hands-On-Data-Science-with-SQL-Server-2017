declare @x int = 1, @y int = 1
exec sp_execute_external_script
    @language = N'R'
    , @script = N'
        print(a + b)
    '
    , @params = N'@a int, @b int'
    , @a = @x
    , @b = @y