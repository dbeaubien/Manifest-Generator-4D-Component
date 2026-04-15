//%attributes = {"shared":true}
/* Manifest_ShowAttributeEditor ()
   Displays the manifest editor and lets the user modify
   the details for the current structure.

  NOTE: This method will always spawn itself into a new process
*/

Case of 
	: (Current process name:C1392=Current method name:C684)
		var $manifestObj : Object
		$manifestObj:=File_LoadFromCurrentResource
		Refresh_MethodList($manifestObj)
		Refresh_TransientAttributes($manifestObj)
		
		var $winRef : Integer
		$winRef:=Open form window:C675("Manifest_ShowAttributeEditor"; Plain form window:K39:10)
		SET WINDOW TITLE:C213("Manifest Attribute Editor"; $winRef)
		
		var $formData : Object
		$formData:=New object:C1471
		$formData.manifest:=$manifestObj
		$formData.cancelled:=False:C215
		DIALOG:C40("Manifest_ShowAttributeEditor"; $formData)
		CLOSE WINDOW:C154($winRef)
		
		If (Not:C34($formData.cancelled))
			File_SaveToCurrentResource($manifestObj)
		End if 
		
		
	: (Process number:C372(Current method name:C684)#0)
		BRING TO FRONT:C326(Process number:C372(Current method name:C684))
		
	Else 
		var $procId : Integer
		$procId:=New process:C317(Current method name:C684; 0; Current method name:C684)
End case 