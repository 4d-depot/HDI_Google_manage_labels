If (Form:C1466.OAuth2Provider=Null:C1517)
	ALERT:C41("You have to be connected to your Gmail account.")
	return 
End if 

NewLabelInit()

CreationObjectsState(True:C214)
UpdateMode(False:C215)
