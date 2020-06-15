//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
/* Manifest_GetComponentManifests () : componentManifests
   Returns an object that contains a property for each
   component on the host database where the component's
   "componentManifest.json" file will be loaded as an
   object as the contents.
   If the componet doesn't have a "componentManifest.json"
   file then the value will be null.
*/
C_OBJECT:C1216($0;$componentManifests)
ASSERT:C1129(Count parameters:C259=0)

C_TEXT:C284($componentsFolderPath)
$componentsFolderPath:=Folder_GetHostComponentFolder 

C_TEXT:C284($json;$manifestFilePath;$friendlyComponentName)
C_LONGINT:C283($i)
ARRAY TEXT:C222($componentsInFolder;0)
FOLDER LIST:C473($componentsFolderPath;$componentsInFolder)
$componentManifests:=New object:C1471
For ($i;1;Size of array:C274($componentsInFolder))
	$json:=""
	$manifestFilePath:=$componentsFolderPath\
		+$componentsInFolder{$i}+Folder separator:K24:12\
		+"Resources"+Folder separator:K24:12\
		+"componentManifest.json"
	
	$friendlyComponentName:=$componentsInFolder{$i}
	If ($friendlyComponentName="@.4dbase")
		$friendlyComponentName:=Substring:C12($friendlyComponentName;1;Length:C16($friendlyComponentName)-7)
	End if 
	$friendlyComponentName:=Replace string:C233($friendlyComponentName;".";"_")
	
	If (Test path name:C476($manifestFilePath)=Is a document:K24:1)
		$json:=Document to text:C1236($manifestFilePath;"utf-8";Document unchanged:K24:18)
	End if 
	
	If ($json="{@}")
		OnErr_ClearError 
		ON ERR CALL:C155("OnErr_Generic")
		$componentManifests[$friendlyComponentName]:=JSON Parse:C1218($json)
		If (OnErr_LastError #0)  // something went wrong, force to null
			$json:=""
		End if 
		ON ERR CALL:C155("")
	End if 
	
	If ($json="")
		OB SET NULL:C1233($componentManifests;$friendlyComponentName)
	End if 
End for 

$0:=$componentManifests