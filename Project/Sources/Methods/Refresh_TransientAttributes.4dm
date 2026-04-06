//%attributes = {"invisible":true,"preemptive":"capable"}
/* Refresh_TransientAttributes (manifestObj)
   Refreshes the attributes that are tied to 4D or the current structure
*/
#DECLARE($manifestObj : Object)

ASSERT:C1129(Count parameters:C259=1\
; "Expecting only a manifest object as the parameter.")

$manifestObj.buildWith4DVersion:=Utility_Get4DLongVersion
$manifestObj.manifestFormatVersion:="1.0"
