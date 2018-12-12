declare @model table (model varbinary(max))
insert @model
exec sp_execute_external_script
    @language = N'R'
    , @script = N'
        formula <- YearlyIncome ~ MaritalStatus + Gender + TotalChildren;
        model <- rxLinMod(formula, data = InputDataSet);
        #summary(model);
        OutputDataSet <- as.data.frame(rxSerializeModel(model, realtimeScoringOnly = TRUE));
    '
    , @input_data_1 = N'select * from DemoData'

insert Models.ModelVersions (ModelTypesId, ModelStream)
select 3, model from @model