If (FORM Event:C1606.code=On Clicked:K2:4)
	// Open a custom colorpicker while waiting for bug ACI0104355 on picture popup menu to be fixed
	GET MOUSE:C468($x; $y; $bt; *)
	CONVERT COORDINATES:C1365($x; $y; XY Screen:K27:7; XY Main window:K27:8)
	$win:=Open form window:C675("ColorPicker"; Pop up form window:K39:11; $x; $y)
	$form:={index: Form:C1466.textColor}
	DIALOG:C40("ColorPicker"; $form)
	CLOSE WINDOW:C154
	
	Form:C1466.textColor:=$form.index
	var $colorList:=cs:C1710.ColorList.new()
	Form:C1466.labelPicture:=cs:C1710.SVGCreator.new().rectangle(Form:C1466.currentLabel.name; $colorList.getHexa(Form:C1466.backgroundColor); $colorList.getHexa(Form:C1466.textColor))
	Form:C1466.textColorPicture:=cs:C1710.SVGCreator.new().icon($colorList.getHexa(Form:C1466.textColor); $colorList.getHexa(Form:C1466.textColor))
End if 