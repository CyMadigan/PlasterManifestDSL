PlasterManifest {
    Metadata {
        Title = "DC Custom Function Template"
        TemplateName = 'CustomFunction'
        Author = "David Christian"
        Description = "Plaster template to create an advanced function with tests"
        TemplateVersion = '0.0.1'
        ID = 'cbbb914c-6601-4530-92e5-91924660c6ce'
    }
    Parameters {
        TextParameter -Name "FunctionName" -Prompt "Name of your function"
        ChoiceParameter -Name "Help" -Prompt "Include Comment based Help?" -Default 0 {
            Choice -Label "Yes" -Help "Adds Comment Based" -Value "Yes"
            Choice -Label "No" -Help "Does not add comment based help" -Value "no"
        }
    }
    Content {
        Message "This is a simple Message" {
            $PLASTER_PARAM_FunctionFolders -contains "Public"
        }
        File -Source "functionTemplate.ps1" -Destination '${PLASTER_PARAM_FunctionName}.ps1' -Condition {
            $PLASTER_PARAM_Pester -eq $true
        }
        TemplateFile -Source 'testsTemplate.ps1' -Destination '${PLASTER_PARAM_FunctionName}.tests.ps1'
    }
}