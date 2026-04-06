//%attributes = {"invisible":true,"preemptive":"capable"}
/* File_LoadFromCurrentResource () : manifestObj
   Loads the manifest object from the current structure's
   Resource folder. If there is no manifest file yet, a
   new manifest object is created and returned.
*/
#DECLARE()->$manifestObj : Object
ASSERT:C1129(Count parameters:C259=0)

var $rawJsonText : Text
var $manifestFilePath : Text
$manifestFilePath:=Get 4D folder:C485(Current resources folder:K5:16; *)+"componentManifest.json"

// Attempt to load from disk
If (Test path name:C476($manifestFilePath)=Is a document:K24:1)
	OnErr_ClearError
	ON ERR CALL:C155("OnErr_Generic")
	$rawJsonText:=Document to text:C1236($manifestFilePath; "utf-8"; Document unchanged:K24:18)
	If (OnErr_LastError=0) && ($rawJsonText="{@}")
		$manifestObj:=JSON Parse:C1218($rawJsonText)
	End if 
	ON ERR CALL:C155("")
End if 

If ($manifestObj=Null:C1517)  // revert to a new object if any issue
	$manifestObj:=Manifest__NewObject
End if 
