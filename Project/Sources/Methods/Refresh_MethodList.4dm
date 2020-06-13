//%attributes = {"invisible":true}
/* Refresh_MethodList (manifestObj)
   Refreshes the attributes that are tied to 4D or the current structure
*/
ASSERT:C1129(Count parameters:C259=1\
;"Expecting only a manifest object as the parameter.")

C_OBJECT:C1216($1;$manifestObj)
$manifestObj:=$1

If ($manifestObj.methodList=Null:C1517)
	$manifestObj.methodList:=New collection:C1472
Else 
	$manifestObj.methodList.clear()
End if 

ARRAY TEXT:C222($methodPaths;0)
ARRAY OBJECT:C1221($methodAttributes;0)
METHOD GET PATHS:C1163(Path project method:K72:1;$methodPaths)
METHOD GET ATTRIBUTES:C1334($methodPaths;$methodAttributes)

C_LONGINT:C283($i)
For ($i;1;Size of array:C274($methodPaths))
	If ($methodAttributes{$i}.shared)
		$manifestObj.methodList.push($methodPaths{$i})
	End if 
End for 
$manifestObj.methodList:=$manifestObj.methodList.orderBy(ck ascending:K85:9)