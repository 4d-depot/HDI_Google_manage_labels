// Add a color object to the Form.currentLabel object if necessary 
CreateColorObject()

Form:C1466.currentLabel.messageListVisibility:=Form:C1466.currentLabel.messageListVisible ? "show" : "hide"

// update the label
Form:C1466.status:=cs:C1710.NetKit.Google.new(Form:C1466.OAuth2Provider).mail.updateLabel(Form:C1466.currentLabel.id; Form:C1466.currentLabel)
If (Form:C1466.status.success)
	OBJECT SET VISIBLE:C603(*; "Spinner"; True:C214)
	
	// Start the creation of the label list
	CALL WORKER:C1389("myWorker"; Formula:C1597(GetLabels); Form:C1466.OAuth2Provider; Current form window:C827)
	
	ALERT:C41("Label udpated")
Else 
	ALERT:C41("Error: "+String:C10(Form:C1466.status.statusText))
End if 