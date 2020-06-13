//%attributes = {"invisible":true,"preemptive":"capable"}
/* Utility_Get4DLongVersion () : longVersionStr
    Returns a string that has the long version of 4D.
*/
ASSERT:C1129(Count parameters:C259=0)

C_TEXT:C284($0;$longVersionStr)
$longVersionStr:=""

C_LONGINT:C283($vl_buildNo)
C_TEXT:C284($versionString)
$versionString:=Application version:C493($vl_buildNo;*)

C_TEXT:C284($versionKind)
$versionKind:=Substring:C12($versionString;1;1)

  // String off the front part
$versionString:=Substring:C12($versionString;5)+"00000000"  // make sure that the string is not blank

C_TEXT:C284($major)
$major:=$versionString[[1]]+$versionString[[2]]  //version number, e.g. 14

C_TEXT:C284($minor;$release)
If ($major="13")
	$minor:=$versionString[[3]]  //.x
	$release:="0"
Else 
	$release:=$versionString[[3]]  //Rx
	$minor:=$versionString[[4]]  //.x
End if 


  // Start building the string
$longVersionStr:="v"+$major
Case of 
	: ($release="0")  //4D v14.x
		$longVersionStr:=$longVersionStr+Choose:C955($minor#"0";"."+$minor;"")
		
	Else   //4D v14 Rx
		$longVersionStr:=$longVersionStr+" R"+$release
End case 

Case of 
	: ($versionKind="F")
		$longVersionStr:=$longVersionStr+" final"
		
	: ($versionKind="B")
		$longVersionStr:=$longVersionStr+" beta"
		
	Else 
		$longVersionStr:=$longVersionStr+" "+$versionKind
		
End case 

$longVersionStr:=$longVersionStr+" (build "+String:C10($vl_buildNo)+")"

$0:=$longVersionStr
