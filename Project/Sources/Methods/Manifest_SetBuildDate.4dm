//%attributes = {"invisible":true,"shared":true,"preemptive":"incapable"}
/* Manifest_SetBuildDate (buildDate{;forceMethodListRefresh})
   Loads the manifest for the current structure
   and sets the buildDate to the specified date without presenting any UI.
   If forceMethodListRefresh is provided and set to true
   then the shared method list is updated as well.
*/
C_DATE:C307($1;$buildDate)
C_BOOLEAN:C305($2;$forceMethodListRefresh)

ASSERT:C1129(Count parameters:C259>=1)
ASSERT:C1129(Count parameters:C259<=2)
$buildDate:=$1
If (Count parameters:C259=2)
	$forceMethodListRefresh:=$2
End if 

C_OBJECT:C1216($manifestObj)
$manifestObj:=File_LoadFromCurrentResource 
Refresh_TransientAttributes ($manifestObj)

$manifestObj.buildDate:=$buildDate

If ($forceMethodListRefresh)
	Refresh_MethodList ($manifestObj)
End if 

File_SaveToCurrentResource ($manifestObj)
