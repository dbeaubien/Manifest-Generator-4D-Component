//%attributes = {"invisible":true,"preemptive":"capable"}
/* Folder_GetHostComponentFolder () : componentFolderPath
   Returns the path to the host database's component folder.
*/
C_TEXT:C284($0;$componentsFolderPath)
ASSERT:C1129(Count parameters:C259=0)

C_TEXT:C284($resourcesFolderPath)
$resourcesFolderPath:=Get 4D folder:C485(Current resources folder:K5:16;*)  // we know resources and components are side by side

C_COLLECTION:C1488($filePathParts)
$filePathParts:=Split string:C1554($resourcesFolderPath;Folder separator:K24:12;sk ignore empty strings:K86:1+sk diacritical:K86:3)

$filePathParts[$filePathParts.length-1]:="Components"

$componentsFolderPath:=$filePathParts.join(Folder separator:K24:12)+Folder separator:K24:12

$0:=$componentsFolderPath