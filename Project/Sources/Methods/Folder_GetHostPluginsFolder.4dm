//%attributes = {"invisible":true,"preemptive":"capable"}
/* Folder_GetHostPluginsFolder () : componentFolderPath
   Returns the path to the host database's plugins folder.
   An empty path is returned if the plugin folder doesn't exist.
*/
#DECLARE()->$componentsFolderPath : Text
ASSERT:C1129(Count parameters:C259=0)

var $resourcesFolderPath : Text
$resourcesFolderPath:=Get 4D folder:C485(Current resources folder:K5:16; *)  // we know resources and components are side by side

var $filePathParts : Collection
$filePathParts:=Split string:C1554($resourcesFolderPath; Folder separator:K24:12; sk ignore empty strings:K86:1+_o_sk diacritical:K86:3)

$filePathParts[$filePathParts.length-1]:="Plugins"

$componentsFolderPath:=$filePathParts.join(Folder separator:K24:12)+Folder separator:K24:12

If (Test path name:C476($componentsFolderPath)#Is a document:K24:1)
	$componentsFolderPath:=""
End if 
