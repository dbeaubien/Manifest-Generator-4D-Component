//%attributes = {}
C_OBJECT:C1216($manifest)

If (True:C214)  // test author setting code
	Manifest_SetAuthor ("TEST Author")
	$manifest:=File_LoadFromCurrentResource 
	ASSERT:C1129($manifest.author="TEST Author")
	
	Manifest_SetAuthor ("Dani Beaubien")
	$manifest:=File_LoadFromCurrentResource 
	ASSERT:C1129($manifest.author="Dani Beaubien")
End if 

If (True:C214)  // test author setting code
	Manifest_SetCopyright ("TEST Copyrights")
	$manifest:=File_LoadFromCurrentResource 
	ASSERT:C1129($manifest.copyrights="TEST Copyrights")
	
	Manifest_SetCopyright ("Copyright 2020, Open Road Development Inc. All rights reserved.")
	$manifest:=File_LoadFromCurrentResource 
	ASSERT:C1129($manifest.copyrights="Copyright 2020, Open Road Development Inc. All rights reserved.")
End if 

If (True:C214)  // test url setting code
	Manifest_SetURL ("TEST url")
	$manifest:=File_LoadFromCurrentResource 
	ASSERT:C1129($manifest.url="TEST url")
	
	Manifest_SetURL ("http://openroaddevelopment.com")
	$manifest:=File_LoadFromCurrentResource 
	ASSERT:C1129($manifest.url="http://openroaddevelopment.com")
End if 

If (True:C214)  // test version setting code
	Manifest_SetVersion ("TEST Version")
	$manifest:=File_LoadFromCurrentResource 
	ASSERT:C1129($manifest.version="TEST Version")
	
	Manifest_SetVersion ("01.00.00")
	$manifest:=File_LoadFromCurrentResource 
	ASSERT:C1129($manifest.version="01.00.00")
End if 

If (True:C214)  // test build date setting code
	Manifest_SetBuildDate (!2001-06-25!)
	$manifest:=File_LoadFromCurrentResource 
	ASSERT:C1129($manifest.buildDate=!2001-06-25!)
	
	Manifest_SetBuildDate (Current date:C33)
	$manifest:=File_LoadFromCurrentResource 
	ASSERT:C1129($manifest.buildDate=Current date:C33)
End if 
