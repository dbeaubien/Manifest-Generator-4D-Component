//%attributes = {"invisible":true,"preemptive":"capable"}
/* Manifest__NewObject () : manifestObj
    Returns a newly initialized manifest object.   
*/
ASSERT:C1129(Count parameters:C259=0)

C_OBJECT:C1216($1;$manifestObj)
$manifestObj:=New object:C1471

$manifestObj.author:=""
$manifestObj.copyrights:=""
$manifestObj.version:="0.00.00"
$manifestObj.buildDate:=Current date:C33
$manifestObj.url:=""

$manifestObj.manifestFormatVersion:=""
$manifestObj.buildWith4DVersion:=""
Refresh_TransientAttributes ($manifestObj)

$manifestObj.methodList:=New collection:C1472

$0:=$manifestObj