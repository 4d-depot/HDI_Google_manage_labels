If (FORM Event:C1606.code=On Load:K2:1)
	var $picture : Picture
	READ PICTURE FILE:C678(Folder:C1567(fk resources folder:K87:11).file("colors.png").platformPath; $picture)
	Form:C1466.picture:=$picture
	
	Form:C1466.width:=180
	Form:C1466.height:=240
	Form:C1466.columnNumber:=9
	Form:C1466.rowNumber:=12
	Form:C1466.columnWidth:=Form:C1466.width/Form:C1466.columnNumber
	Form:C1466.rowHeigh:=Form:C1466.height/Form:C1466.rowNumber
	
	var $index:=Num:C11(Form:C1466.index)-1>0 ? Num:C11(Form:C1466.index)-1 : 0
	
	var $row:=Int:C8($index/Form:C1466.columnNumber)
	var $column : Integer:=$index-($row*Form:C1466.columnNumber)
	
	
	OBJECT SET COORDINATES:C1248(*; "HoverRectangle"; $column*Form:C1466.columnWidth; $row*Form:C1466.rowHeigh)
	OBJECT SET COORDINATES:C1248(*; "SelectionRectangle"; $column*Form:C1466.columnWidth; $row*Form:C1466.rowHeigh)
End if 