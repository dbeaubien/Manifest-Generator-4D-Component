//%attributes = {"invisible":true,"preemptive":"capable"}
/* Folder_GetHostComponentFolder () : componentFolderPath
   Returns the path to the host database's component folder.
*/
#DECLARE()->$componentsFolderPath : Text
ASSERT:C1129(Count parameters:C259=0)

var $resourcesFolderPath : Text
$resourcesFolderPath:=Get 4D folder:C485(Current resources folder:K5:16; *)  // we know resources and components are side by side

var $filePathParts : Collection
$filePathParts:=Split string:C1554($resourcesFolderPath; Folder separator:K24:12; sk ignore empty strings:K86:1+sk trim spaces:K86:2)

$filePathParts[$filePathParts.length-1]:="Components"

$componentsFolderPath:=$filePathParts.join(Folder separator:K24:12)+Folder separator:K24:12

