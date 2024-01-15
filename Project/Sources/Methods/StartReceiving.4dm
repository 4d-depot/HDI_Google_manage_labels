//%attributes = {}
// Start receiving of the label detail according to the lable selected by the user
var $listID : Integer
var $param : Object

ARRAY LONGINT:C221($arr; 0)

If (Is a list:C621(Form:C1466.labels.listRef))
	// search the selected list item
	$listID:=Selected list items:C379(Form:C1466.labels.listRef; $arr; *)
	
	// Search the label information of the selected label
	var $currentItem:=Form:C1466.labels.search($listID)
	
	If ($currentItem#Null:C1517)
		
		OBJECT SET VISIBLE:C603(*; "Spinner"; True:C214)
		
		// Gets the label info of the selected item.
		Form:C1466.currentLabel:=cs:C1710.NetKit.Google.new(Form:C1466.OAuth2Provider).mail.getLabel($currentItem.id)
		// display the modification mode
		If (Form:C1466.currentLabel#Null:C1517)
			var $colorList:=cs:C1710.ColorList.new()
			Form:C1466.textColor:=$colorList.getIndex(String:C10(Form:C1466.currentLabel.color.textColor))
			Form:C1466.backgroundColor:=$colorList.getIndex(String:C10(Form:C1466.currentLabel.color.backgroundColor))
			
			Form:C1466.currentLabel.messageListVisible:=String:C10(Form:C1466.currentLabel.messageListVisibility)="hide" ? False:C215 : True:C214
			
			UpdateMode(True:C214)
			// if it is a system label, the modification is forbidden
			If (Form:C1466.currentLabel.type="system")
				CreationObjectsState(False:C215)
				Form:C1466.labelPicture:=Null:C1517
			Else 
				CreationObjectsState(True:C214)
				
				var $svg:=cs:C1710.SVGCreator.new()
				Form:C1466.labelPicture:=$svg.rectangle(Form:C1466.currentLabel.name; $colorList.getHexa(Form:C1466.backgroundColor); $colorList.getHexa(Form:C1466.textColor))
				Form:C1466.textColorPicture:=$svg.icon($colorList.getHexa(Form:C1466.textColor); $colorList.getHexa(Form:C1466.textColor))
				Form:C1466.backgroundColorPicture:=$svg.icon($colorList.getHexa(Form:C1466.backgroundColor); $colorList.getHexa(Form:C1466.backgroundColor))
			End if 
		Else 
			// if the label is not found, display creation mode
			NewLabelInit
			CreationObjectsState(True:C214)
			UpdateMode(False:C215)
		End if 
		
	Else 
		Form:C1466.currentLabel:=Null:C1517
	End if 
End if 