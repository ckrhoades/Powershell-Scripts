#Chris's basic script for simple expression matching.

#This is the expression to be matched, currently it's format is XXXX-XXXX-XXXX-XXXX
#This can be changed to easily do social security numbers or othe items with similiar formats or anything really
$var_match_exp = "[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]"
#This takes the contents of the current directory and adds them to the list
#Adding -recurse and -file to this makes it go through recursivly and adding only files.

$var_group = (get-childitem -file).Name


#The foreach statement below runs through the list and checks the files for the expression.  If there's a match to the expression it will return a true.
#the process grbs the itme and pushes it into a variable, then expression matches that against the varaible.
foreach($item in $var_group) {
 $var_filetest = get-content $item
 $var_result = $var_filetest.ToUpper() -match $var_match_exp
    if ($var_result)
        {write-host $item "contains possbile data" }
}
