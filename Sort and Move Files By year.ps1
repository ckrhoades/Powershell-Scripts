
$var_year = (Get-ChildItem -file).LastWriteTime.Year |  select -uniq
$var_current_year = (Get-Date).Year

foreach($y in $var_year){

  if ($y -ne $var_current_year){  

    if(!(Test-Path -Path "_$y" -PathType Container))
    {
        mkdir "_$y"
    }    


    $var_child = get-childitem -file | where-object{$_.LastWriteTime.Year -eq "$y"}

    foreach($i in $var_child){
    Move-Item -Path $i -Destination "_$y"   
    }
  }
}
