#Below builds an array based on file dates year, this builds the list for the loop.

$var_year = (Get-ChildItem).LastWriteTime.Year |  select -uniq

#This is the variable for the current year, if files are in this year, it won't move those files.

$var_current_year = (Get-Date).Year

#The Loop is here, this is what moves the files.

foreach($y in $var_year){

#If statement below byapasses the current year, making sure only old files get moved.

  if ($y -ne $var_current_year){  

#Check to see if directory exists, based on year, if not create it.

    if(!(Test-Path -Path "_$y" -PathType Container))
    {
        mkdir "_$y"
    }    

#Create the array, ie list of files to be moved.  

    $var_child = get-childitem | where-object{$_.LastWriteTime.Year -eq "$y" -and $_.name -notlike "_*"}

#Move the files

    foreach($i in $var_child){
    Move-Item -Path $i -Destination "_$y"   
    }
  }
}

