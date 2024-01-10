//%attributes = {}
#DECLARE($visible : Boolean)
// if true, displays graphic objects for the update 
// if false, displays graphic objects for creation

OBJECT SET VISIBLE:C603(*; "Input1"; $visible)
OBJECT SET VISIBLE:C603(*; "Input2"; $visible)
OBJECT SET VISIBLE:C603(*; "Input3"; $visible)
OBJECT SET VISIBLE:C603(*; "Text3"; $visible)
OBJECT SET VISIBLE:C603(*; "Text6"; $visible)
OBJECT SET VISIBLE:C603(*; "Text7"; $visible)
OBJECT SET VISIBLE:C603(*; "Button"; $visible)

OBJECT SET VISIBLE:C603(*; "Button2"; Not:C34($visible))