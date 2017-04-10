#Copy file content to other file
$from_folder_path = Read-Host "Enter the path of sender"#From which folder we should copy
$from_folder = Test-Path $from_folder_path #Validate the presence of Sender folder
if($from_folder -ne $true -or $from_file -ne $true){# Validate the presence of from file and folder
$from_file_path = Read-Host "Enter the file path to be copied "#Which file to be copied
$from_file = Test-Path $from_file_path #Validate the presence of file to be copied
if($from_folder -ne $true){#if folder does not exist
Write-Host "Oops!!The sender folder does not exist"
exit
}
ElseIf ($from_file -ne $true) {#if file doesnot exist
Write-Host "Oops!!file to be copied does not exist"
exit
}
}

$to_folder_path = Read-Host "Enter the folder of Receiver" #From which folder we should copy
$to_file_path = Read-Host "Enter the file path to which Content will be copied" #To which file content will be copied
$to_folder = Test-Path $to_folder_path #Validate the presence of Receiver folder
$to_file = Test-Path $to_file_path #Validate the presence of file to which content will be copied
if($to_file -eq $true){#if the file exists then ask the permission to copy
$exist = Read-Host "This file already exist with some content, That content will be replaced . Please type 1 to copy or 0 to create a new file"
if($exist -eq 1){#copy content if user want to continue
$content = Get-Content $from_file_path
Add-Content $to_file_path $content
Write-Host "File content is copied succussfully"
}Else {#create a new file
$to_file_path = Read-Host "Please enter the new file path"
New-Item $to_file_path -ItemType file #create file to copy the content
Write-Host "New file created in $to_file_path "
$to_file = Test-Path $to_file_path
$content = Get-Content $from_file_path
Add-Content $to_file_path $content
Write-Host "File content is copied succussfully"
}}
ElseIf ($to_folder -ne $true -or $to_file -ne $true){ #if the receiver folder or file does not exist create them
if($to_folder -ne $true){
New-Item $to_folder_path -ItemType directory #Create the receiver folder if not existed
$to_folder = Test-Path $to_folder_path
}
New-Item $to_file_path -ItemType file #create file to copy the content
$to_file = Test-Path $to_file_path
}