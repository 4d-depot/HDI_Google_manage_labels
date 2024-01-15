If (Form:C1466.OAuth2Provider=Null:C1517)
	ALERT:C41("You have to be connected to your Gmail account.")
	return 
End if 
If (String:C10(Form:C1466.currentLabel.name)="")
	ALERT:C41("The name is mandatory.")
	return 
End if 

// Add a color object to the Form.currentLabel object if necessary 
CreateColorObject()

Form:C1466.currentLabel.messageListVisibility:=Form:C1466.currentLabel.messageListVisible ? "show" : "hide"

// Creates the label
Form:C1466.status:=cs:C1710.NetKit.Google.new(Form:C1466.OAuth2Provider).mail.createLabel(Form:C1466.currentLabel)
If (Form:C1466.status.success)
	OBJECT SET VISIBLE:C603(*; "Spinner"; True:C214)
	// Start the creation of the label list
	CALL WORKER:C1389("myWorker"; Formula:C1597(GetLabels); Form:C1466.OAuth2Provider; Current form window:C827)
	
	ALERT:C41("Label created")
	
	NewLabelInit
Else 
	ALERT:C41("Error: "+String:C10(Form:C1466.status.statusText))
End if 
