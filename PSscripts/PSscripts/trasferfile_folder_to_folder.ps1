#Trasfer file from one folder to other folder in one system
$from_folder_path = Read-Host "Enter the path of sender"#From which folder we should transfer
$from_file_path = Read-Host "Enter the file path to be transfered "#Which file to be transfered
$to_folder_path = Read-Host "Enter the path of Receiver" #To which folder we should transfer
$from_folder = Test-Path $from_folder_path #Validate the presence of Sender folder
$from_file = Test-Path $from_file_path #Validate the presence of file to be transfered
$to_folder = Test-Path $to_folder_path #Validate the presence of Receiver folder
if($to_folder -eq $False) #if the receiver folder is not existing create a folder
{
New-Item $to_folder_path
$to_folder = Test-Path $to_folder_path
}
if($from_folder -eq $True -And $from_file -eq $True -And $to_folder -eq $True){ #if Sender, Receiver folder and file exists then transfer the file
Move-Item $from_file_path $to_folder_path
Write-Host "The file is transfered"
}
elseif($from_folder -eq $True -and $from_file -ne $True){#if Sender folder is present and the file is absent
Write-Host "OOps!! We are not able to find the file in the Sender folder."
}
elseif($from_folder -ne $True){# if Sender folder is absent 
Write-Host "OOps!! We are not able find Sender folder"
}