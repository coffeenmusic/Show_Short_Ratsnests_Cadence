;--------------------------------------------------------------------
;This script will turn off all ratsnests greater than user input value
;This script is for Cadence Allegro software. Tested with Allegro 17.4
;Created by Stephen Thompson
;
;--------------------------------------------------------------------

;Location of this file
;If your Cadence installation directory is c:\Cadence\SPB_17.4\
;then copy this file into: c:\Cadence\SPB_17.4\share\local\pcb\skill\

;How to run the script
;1) Run following command in Cadence Allegro command line:
;get_short_rats

;Documentation
;Documentation which you may need to create your own scripts or understand the commands and features used here:
;Note: The absolute PATH depends on your Cadence installation.
;Allegro skill documentation directory: c:\Cadence\SPB_17.4\doc\algroskill\
;Content of all Functions: file:///C:/Cadence/SPB_17.4/doc/algroskill/algroskillTOC.html
;Form Interface Functions: file:///C:/Cadence/SPB_17.4/doc/algroskill/11frmint.html
;SKILL Commands: Search on Internet for "Skill Language User Guide", e.g.: http://pwp.gatech.edu/wp-content/uploads/sites/367/2016/03/Intro_to_skill_prog.pdf

;NOTE
;If you would like to automatically load this script by your Allegro when it starts, do following:
;1) Go to: c:\Cadence\SPB_17.4\share\local\pcb\skill\
;2) Copy "example.ilinit" into "allegro.ilinit"
;3) Copy "get_short_rats.il" to c:\Cadence\SPB_17.4\share\local\pcb\skill\

;----------------------------- THE SCRIPT ---------------------------------------

print "Loading get_short_rats." 

;register this command, so we can start it from Allegro command line
axlCmdRegister( "get_short_rats" `get_short_rats)

;-------------------------------------
;Definition of get_short_rats command
;-------------------------------------
procedure( get_short_rats()

	MAX_RAT_LEN = atof(axlUIPrompt( "Please enter max rat length (mil)" "1000" ))
	
	axlUIWPrint(nil "Starting get_short_rats script.")
	
	; 1. Change Filter Selection Set to only ratsnests, then select all
	axlClearSelSet()
	axlSetFindFilter(?enabled list("all"), ?onButtons list("noall" "ratsnests")) ; All enabled, only ratsnests checked
	axlAddSelectAll()

	; 2. Get selected object list
	ratsList = axlGetSelSet() ; Gets the list of object dbids in the select set.

	; 3. Iterate objects and filter on length
	foreach( rat ratsList
		ratLen = axlDBGetLength(rat) ; Calculates the length of the given object which may be a NET, CLINE, SEGMENT, or RATSNEST. If RATSNEST returns the Manhattan length. If a net is partially routed, includes sum of all ratsnest Manhattan lengths.

		if(ratLen > MAX_RAT_LEN then 
			axlRatsnestBlank(rat->net)
		)
	)

)