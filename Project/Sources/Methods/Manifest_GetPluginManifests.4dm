//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
/* Manifest_GetPluginManifests () : pluginManifests
   Returns an object that contains a property for each plugin
   in the host database and 4D application

   Each plugin's "manifest.json" file will be loaded as
   the content for each property.

   If the plugin doesn't have a "manifest.json"
   file then the value will be null.

   Potential Plugin folder locations documented here:
   https://doc.4d.com/4Dv18/4D/18/Installing-plugins-or-components.300-4575696.en.html
*/
C_OBJECT:C1216($0;$pluginManifests)
ASSERT:C1129(Count parameters:C259=0)

C_COLLECTION:C1488($folderPathCollection)
$folderPathCollection:=New collection:C1472
If (Folder_Get4DPluginsFolder #"")
	$folderPathCollection.push(Folder_Get4DPluginsFolder )
End if 
If (Folder_GetHostPluginsFolder #"")
	$folderPathCollection.push(Folder_GetHostPluginsFolder )
End if 

C_TEXT:C284($pluginsFolderPath)
$pluginManifests:=New object:C1471
For each ($pluginsFolderPath;$folderPathCollection)
	
	C_LONGINT:C283($i)
	C_TEXT:C284($json;$manifestFilePath;$friendlyPluginName)
	C_OBJECT:C1216($jsonObj)
	ARRAY TEXT:C222($pluginsInFolder;0)
	FOLDER LIST:C473($pluginsFolderPath;$pluginsInFolder)
	For ($i;1;Size of array:C274($pluginsInFolder))
		$json:=""
		
		$manifestFilePath:=$pluginsFolderPath\
			+$pluginsInFolder{$i}+Folder separator:K24:12\
			+"Contents"+Folder separator:K24:12\
			+"Resources"+Folder separator:K24:12\
			+"manifest.json"
		If (Test path name:C476($manifestFilePath)=Is a document:K24:1)
			$json:=Document to text:C1236($manifestFilePath;"utf-8";Document unchanged:K24:18)
		End if 
		
		If ($json="")
			$manifestFilePath:=$pluginsFolderPath\
				+$pluginsInFolder{$i}+Folder separator:K24:12\
				+"Contents"+Folder separator:K24:12\
				+"manifest.json"
			If (Test path name:C476($manifestFilePath)=Is a document:K24:1)
				$json:=Document to text:C1236($manifestFilePath;"utf-8";Document unchanged:K24:18)
			End if 
		End if 
		
		If ($json#"")
			OnErr_ClearError 
			ON ERR CALL:C155("OnErr_Generic")
			$jsonObj:=JSON Parse:C1218($json)
			If (OnErr_LastError #0)  // something went wrong, force to null
				$json:=""
			End if 
			ON ERR CALL:C155("")
		End if 
		
		If ($json#"")
			$friendlyPluginName:=String:C10($jsonObj.name)
			If ($friendlyPluginName="")
				$friendlyPluginName:=$pluginsInFolder{$i}
			End if 
			$friendlyPluginName:=Replace string:C233($friendlyPluginName;".";"_")
			
			$pluginManifests[$friendlyPluginName]:=$jsonObj
			
		Else 
			$friendlyPluginName:=Replace string:C233($pluginsInFolder{$i};".";"_")
			OB SET NULL:C1233($pluginManifests;$friendlyPluginName)
		End if 
	End for 
End for each 

$0:=$pluginManifests