//%attributes = {"invisible":true,"preemptive":"capable"}
/* Folder_Get4DComponentFolder () : componentFolderPath
   Returns the path to the 4D's components folder.
   An empty path is returned if the component folder doesn't exist.
*/
C_TEXT:C284($0;$componentFolderPath)
ASSERT:C1129(Count parameters:C259=0)

If (Is macOS:C1572)
	$componentFolderPath:=Application file:C491+Folder separator:K24:12+"Contents"+Folder separator:K24:12
Else 
	$componentFolderPath:=Application file:C491
End if 

$componentFolderPath:=$componentFolderPath+"Components"+Folder separator:K24:12

If (Test path name:C476($componentFolderPath)#Is a folder:K24:2)
	$componentFolderPath:=""
End if 

$0:=$componentFolderPath