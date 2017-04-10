#to create a environmental variable and assign a value to it
$env_name = Read-Host "Please give the Env Variable name"#Enter environmental variable name
$env_value = Read-Host "Please enter the value of the variable(please end the value with ';')"#enter the value 
if($env_value -contains ';'){
if(Test-Path $env_value){#check wheather the enter input is path or not
#Here we have to check wheather the environmental name existing or we have to create a new variable
if((Get-ChildItem Env:).Name -eq $env_name){#if the environmental variable name alredy existing
$count = Read-Host "This environment name already exists. If you want to append the value press 1 other wise press 0"
#if count is 1 then append with the existing environment variable's value
if($count -eq 1){#if count is 1 then append the existing environment variable's value
$env_value1 = (Env:$env_name) + $env_value
[Environment]::SetEnvironmentVariable($env_name, $env_value1 , "User")
Write-Host "The value of $env_name is succussfully appended to $env_value"
}
elseif($count -eq 0){#if count is 0 then dont append the existing environment variable's value
[Environment]::SetEnvironmentVariable($env_name, $env_value , "User")
Write-Host "The value of $env_name is doesn't change"
}
else{#If wrong input is entered
Write-Host "Please try again. You entered wrong input"
}
}
else{#if the Environmental name doesn't exist then create the environmental variable and assign a value
[Environment]::SetEnvironmentVariable($env_name, $env_value , "User")
Write-Host "The Environmental variable name--> $env_name ,
with value--> $env_value , is succussfully created"
}
else{Write-Host "Please enter a valid value it should be path existed"#if the entered input is not a path , displaying the same as message
}
}
}
else{#if the path doesn't consists of ; symbol
Write-Host "Value should end with ';' "
}