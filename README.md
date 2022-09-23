# Manifest Generator Component
A 4D component to assist component developers on creating a manifest json resource file that publishes the component's shared methods.

**The following are the shared methods that are used when developing a component:**

Shared Method | Description
------------- | ------------
**Manifest_ShowAttributeEditor** | Displays the manifest attribute editor windows and lets the user modify the details for the current structure.|
**Manifest_RefreshLocalFile** | Loads the manifest for the current structure and updates the shared method list in the manifest and saves it back to the current resource folder. This should be called prior to building the component.|
**Manifest_SetAuthor** | Loads the manifest for the current structure and sets the author to the specified string without presenting any UI.|
**Manifest_SetBuildDate** | Loads the manifest for the current structure and sets the build date to the specified date without presenting any UI.|
**Manifest_SetCopyrights** | Loads the manifest for the current structure and sets the copyright to the specified string without presenting any UI.|
**Manifest_SetURL** | Loads the manifest for the current structure and sets the url to the specified string without presenting any UI.|
**Manifest_SetVersion** | Loads the manifest for the current structure and sets the version to the specified string without presenting any UI.|

**The following are the shared methods that are used by the host component:**

Shared Method | Description
------------- | ------------
**Manifest_GetComponentManifests** | Returns an object that contains a property for each component on the host database and 4D where the component's "componentManifest.json" file will be loaded as an object as the contents. If the componet doesn't have a "componentManifest.json" file then the value will be null..|
**Manifest_GetPluginManifests** | Returns an object that contains a property for each plugins on the host database and 4D where the plugin's "manifest.json" file will be loaded as an object as the contents. If the plugin doesn't have a "manifest.json" file then the value will be null. |

Sample Code to put in the On Startup database method:
```4d
If (Not(Is compiled mode))
	ARRAY TEXT($at_components;0)
	COMPONENT LIST($at_components)
	If (Find in array($at_components;"Mainfest Generator")>0)
		EXECUTE METHOD("Manifest_SetAuthor";*;"Dani Beaubien")
		EXECUTE METHOD("Manifest_SetBuildDate";*;Current date)
		EXECUTE METHOD("Manifest_SetURL";*;"http://myurl.com")
		EXECUTE METHOD("Manifest_SetCopyright";*;"Copyright "+String(Year of(Current date)))
		EXECUTE METHOD("Manifest_SetVersion";*;SomeGetVersionMethod;True)
	End if
End if
```
Sample code to put in the On Exit database method:
```4d
// Keeps the list of shared methods accurate.
If (Not(Is compiled mode))
	ARRAY TEXT($at_components;0)
	COMPONENT LIST($at_components)
	If (Find in array($at_components;"Mainfest Generator")>0)
		EXECUTE METHOD("Manifest_RefreshLocalFile";*)
	End if
End if
```
