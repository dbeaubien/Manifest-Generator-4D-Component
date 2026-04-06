//%attributes = {"invisible":true,"preemptive":"capable"}
/* File_SaveToCurrentResource (manifestObj)
   Loads the manifest object from the current structure's
   Resource folder.
*/
#DECLARE($manifestObj : Object)

ASSERT:C1129(Count parameters:C259=1\
; "Expecting only a manifest object as the parameter.")

var $manifestFilePath : Text
$manifestFilePath:=Get 4D folder:C485(Current resources folder:K5:16; *)+"componentManifest.json"

TEXT TO DOCUMENT:C1237($manifestFilePath; JSON Stringify:C1217($manifestObj; *); "utf-8"; Document unchanged:K24:18)
