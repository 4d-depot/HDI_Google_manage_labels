//%attributes = {}
#DECLARE : Object
// Creates the color object waiting by gmail according to the colors entered by the user and add it to the Form.currentLabel object
var $colorList:=cs:C1710.ColorList.new()

// If no color object defined, gmail use its default colors during the creation
If (((Form:C1466.textColor>0) || (Form:C1466.backgroundColor>0)) && (String:C10(Form:C1466.currentLabel.type)#"system"))
	
	Form:C1466.currentLabel.color:={}
	
	// Creates the texColor attribute
	If ((Form:C1466.textColor>0) && (Form:C1466.textColor<=$colorList.colors.length))
		Form:C1466.currentLabel.color.textColor:=$colorList.getHexa(Form:C1466.textColor)
	Else 
		// Creates a default textcolor if user doesn't define it because this attribute is needed
		Form:C1466.currentLabel.color.textColor:=$colorList.colors.first()
	End if 
	
	// Creates the backgroundColor attribute
	If ((Form:C1466.backgroundColor>0) && (Form:C1466.backgroundColor<=$colorList.colors.length))
		Form:C1466.currentLabel.color.backgroundColor:=$colorList.getHexa(Form:C1466.backgroundColor)
	Else 
		// Creates a default backgroundColor if user doesn't define it because this attribute is needed
		Form:C1466.currentLabel.color.backgroundColor:=$colorList.colors.last()
	End if 
	
End if 