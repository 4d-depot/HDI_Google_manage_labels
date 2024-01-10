If (FORM Event:C1606.code=On Clicked:K2:4)
	var $colorList:=cs:C1710.ColorList.new()
	Form:C1466.labelPicture:=CreateLabelPicture(Form:C1466.currentLabel.name; $colorList.getHexa(Form:C1466.backgroundColor); $colorList.getHexa(Form:C1466.textColor))
End if 