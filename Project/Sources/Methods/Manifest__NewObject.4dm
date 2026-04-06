//%attributes = {"invisible":true,"preemptive":"capable"}
/* Manifest__NewObject () : manifestObj
    Returns a newly initialized manifest object.   
*/
#DECLARE()->$manifestObj : Object
ASSERT:C1129(Count parameters:C259=0)

$manifestObj:={}
$manifestObj.author:=""
$manifestObj.copyrights:=""
$manifestObj.version:="0.00.00"
$manifestObj.buildDate:=Current date:C33
$manifestObj.url:=""

$manifestObj.manifestFormatVersion:=""
$manifestObj.buildWith4DVersion:=""
Refresh_TransientAttributes($manifestObj)

$manifestObj.methodList:=New collection:C1472