//%attributes = {"invisible":true,"preemptive":"capable"}
/* File_LoadFromCurrentResource () : manifestObj
   Loads the manifest object from the current structure's
   Resource folder. If there is no manifest file yet, a
   new manifest object is created and returned.
*/
ASSERT:C1129(Count parameters:C259=0)

C_OBJECT:C1216($0;$manifestObj)

C_TEXT:C284($manifestFilePath)
$manifestFilePath:=Get 4D folder:C485(Current resources folder:K5:16;*)+"componentManifest.json"

  // Attempt to load from disk
If (Test path name:C476($manifestFilePath)=Is a document:K24:1)
	OnErr_ClearError 
	ON ERR CALL:C155("OnErr_Generic")
	C_TEXT:C284($rawJsonText)
	$rawJsonText:=Document to text:C1236($manifestFilePath;"utf-8";Document unchanged:K24:18)
	If (OnErr_LastError =0)
		If ($rawJsonText="{@}")
			$manifestObj:=JSON Parse:C1218($rawJsonText)
		End if 
	End if 
	ON ERR CALL:C155("")
End if 

If ($manifestObj=Null:C1517)  // revert to a new object if any issue
	$manifestObj:=Manifest__NewObject 
End if 

$0:=$manifestObj