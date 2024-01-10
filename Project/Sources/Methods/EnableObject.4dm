//%attributes = {}
#DECLARE($enable : Boolean)
// Enables the object according to the type of the label
// if type="system" -> $enable must be false
// if type="user" -> $enable must be true

OBJECT SET ENABLED:C1123(*; "LabelName"; $enable)
OBJECT SET ENABLED:C1123(*; "TextColor"; $enable)
OBJECT SET ENABLED:C1123(*; "BackgroundColor"; $enable)
OBJECT SET ENABLED:C1123(*; "labelPicture"; $enable)
OBJECT SET ENABLED:C1123(*; "MessageListVisible"; $enable)

OBJECT SET VISIBLE:C603(*; "Button"; $enable)  // update button