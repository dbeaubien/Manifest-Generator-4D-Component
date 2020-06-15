//%attributes = {"invisible":true,"preemptive":"capable"}
/* File_SaveToCurrentResource (manifestObj)
   Loads the manifest object from the current structure's
   Resource folder. If there is no manifest file yet, a
   new manifest object is created and returned.
*/
ASSERT:C1129(Count parameters:C259=1\
;"Expecting only a manifest object as the parameter.")

C_OBJECT:C1216($1;$manifestObj)
$manifestObj:=$1

C_TEXT:C284($manifestFilePath)
$manifestFilePath:=Get 4D folder:C485(Current resources folder:K5:16;*)+"componentManifest.json"

TEXT TO DOCUMENT:C1237($manifestFilePath;JSON Stringify:C1217($manifestObj;*);"utf-8";Document unchanged:K24:18)

$0:=$manifestObj