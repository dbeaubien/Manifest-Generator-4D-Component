
Case of 
	: (FORM Event:C1606.code=On Load:K2:1)
		Form:C1466.cancelled:=False:C215
		
	: (FORM Event:C1606.code=On Close Box:K2:21)
		Form:C1466.cancelled:=True:C214
		CANCEL:C270
		
End case 