var $column; $Row : Real

Case of 
	: (FORM Event:C1606.code=On Clicked:K2:4)
		$column:=Int:C8(MouseX/Form:C1466.columnWidth)
		$row:=Int:C8(MouseY/Form:C1466.rowHeigh)
		
		Form:C1466.index:=$row*Form:C1466.columnNumber+$column+1
		ACCEPT:C269
		
	: (FORM Event:C1606.code=On Mouse Move:K2:35)
		$column:=Int:C8(MouseX/Form:C1466.columnWidth)
		$row:=Int:C8(MouseY/Form:C1466.rowHeigh)
		
		OBJECT SET COORDINATES:C1248(*; "HoverRectangle"; $column*Form:C1466.columnWidth; $row*Form:C1466.rowHeigh)
End case 
