$var_year = (Get-ChildItem).LastWriteTime.Year |  select -unique
$var_current_year = (Get-Date).Year

foreach($y in $var_year){

#If statement below byapasses the current year, making sure only old files get moved.

  if ($y -ne $var_current_year){  

    if(!(Test-Path -Path "_$y" -PathType Container))
    {
        mkdir "_$y"
    }    

    $var_child = get-childitem | where-object{$_.LastWriteTime.Year -eq "$y" -and $_.name -notlike "_*"}

    foreach($i in $var_child){
    Move-Item -Path $i -Destination "_$y"   
    }
  }
}
