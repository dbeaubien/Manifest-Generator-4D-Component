//%attributes = {"invisible":true,"shared":true,"preemptive":"incapable"}
/* Manifest_RefreshLocalFile ()
   Loads the manifest for the current structure
   and updates the method list.
*/

C_OBJECT:C1216($manifestObj)
$manifestObj:=File_LoadFromCurrentResource 

Refresh_MethodList ($manifestObj)
Refresh_TransientAttributes ($manifestObj)

File_SaveToCurrentResource ($manifestObj)
