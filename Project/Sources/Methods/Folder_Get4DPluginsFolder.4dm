//%attributes = {"invisible":true,"preemptive":"capable"}
/* Folder_Get4DPluginsFolder () : pluginFolderPath
   Returns the path to the 4D's plugins folder.
   An empty path is returned if the plugin folder doesn't exist.
*/
C_TEXT:C284($0;$pluginFolderPath)
ASSERT:C1129(Count parameters:C259=0)

If (Is macOS:C1572)
	$pluginFolderPath:=Application file:C491+Folder separator:K24:12+"Contents"+Folder separator:K24:12
Else 
	$pluginFolderPath:=Application file:C491
End if 

$pluginFolderPath:=$pluginFolderPath+"Plugins"+Folder separator:K24:12

If (Test path name:C476($pluginFolderPath)#Is a folder:K24:2)
	$pluginFolderPath:=""
End if 

$0:=$pluginFolderPath