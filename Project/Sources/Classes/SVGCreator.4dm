// Creates a circle icon with $backgroundColor as background color
// Write a lettre in it if $char present with $textColor as text color
Function icon($backgroundColor : Text; $textColor : Text; $char : Text) : Picture
	var $picture : Picture
	
	If ($backgroundColor#"")
		var $svg; $objectRef : Text
		
		$svg:=SVG_New(16; 16)
		
		// Circle creation
		$objectRef:=SVG_New_circle($svg; 8; 8; 7; $backgroundColor; $backgroundColor)
		
		// Text writing
		If ($char#"")
			$objectRef:=SVG_New_text($svg; $char; 8; 2; "Arial"; 9; 0; Align center:K42:3; $textColor)
		End if 
		
		SVG EXPORT TO PICTURE:C1017($svg; $picture)
		
	End if 
	
	return $picture
	
Function rectangle($text : Text; $backgroundColor : Text; $textColor : Text)->$picture : Picture
	// Creation of an example picture of the displaying of 
	var $svg; $objectRef : Text
	var $fontSize:=10
	var $letterWidth:=6
	var $padding:=2
	var $width:=0
	
	$length:=Length:C16($text)
	If (($length=0) || ($backgroundColor=$textColor))
		return 
	End if 
	// calculation of the svg width
	$width:=$length*$letterWidth+($padding*2)
	
	// svg creation
	$svg:=SVG_New($width; 16)
	
	// Rectangle creation
	$objectRef:=SVG_New_rect($svg; 0; 0; $length*$letterWidth+($padding*2); 16; 0; 2; $backgroundColor; $backgroundColor)
	
	// Text writing
	$objectRef:=SVG_New_text($svg; $text; $padding; 2; "Courier New"; $fontSize; 0; Align left:K42:2; $textColor)
	
	// transform the svg in picture
	SVG EXPORT TO PICTURE:C1017($svg; $picture)