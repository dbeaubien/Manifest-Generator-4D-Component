//%attributes = {"invisible":true,"shared":true,"preemptive":"incapable"}
/* Manifest_SetVersion (version{;forceMethodListRefresh})
   Loads the manifest for the current structure
   and sets the version to the specified string without presenting any UI.
   If forceMethodListRefresh is provided and set to true
   then the shared method list is updated as well.
*/
C_TEXT:C284($1;$version)
C_BOOLEAN:C305($2;$forceMethodListRefresh)

ASSERT:C1129(Count parameters:C259>=1)
ASSERT:C1129(Count parameters:C259<=2)
$version:=$1
If (Count parameters:C259=2)
	$forceMethodListRefresh:=$2
End if 

C_OBJECT:C1216($manifestObj)
$manifestObj:=File_LoadFromCurrentResource 
Refresh_TransientAttributes ($manifestObj)

$manifestObj.version:=$version

If ($forceMethodListRefresh)
	Refresh_MethodList ($manifestObj)
End if 

File_SaveToCurrentResource ($manifestObj)
