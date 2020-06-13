//%attributes = {"invisible":true,"shared":true}
/* Manifest_ShowAttributeEditor ()
   Displays the manifest editor and lets the user modify
   the details for the current structure.

  NOTE: This method will always spawn itself into a new process
*/

Case of 
	: (Current process name:C1392=Current method name:C684)
		C_OBJECT:C1216($manifestObj)
		$manifestObj:=File_LoadFromCurrentResource 
		Refresh_MethodList ($manifestObj)
		Refresh_TransientAttributes ($manifestObj)
		
		C_LONGINT:C283($winRef)
		$winRef:=Open form window:C675("Manifest_ShowAttributeEditor";Plain form window:K39:10)
		SET WINDOW TITLE:C213("Manifest Attribute Editor";$winRef)
		
		C_OBJECT:C1216($formData)
		$formData:=New object:C1471
		$formData.manifest:=$manifestObj
		$formData.cancelled:=False:C215
		DIALOG:C40("Manifest_ShowAttributeEditor";$formData)
		CLOSE WINDOW:C154($winRef)
		
		If (Not:C34($formData.cancelled))
			File_SaveToCurrentResource ($manifestObj)
		End if 
		
		
	: (Process number:C372(Current method name:C684)#0)
		BRING TO FRONT:C326(Process number:C372(Current method name:C684))
		
	Else 
		C_LONGINT:C283($procId)
		$procId:=New process:C317(Current method name:C684;0;Current method name:C684)
End case 