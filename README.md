# Description
This script will turn off all ratsnests greater than user input value [mils].
When run, it will pop up with user input GUI.

# Installation
If your Cadence installation directory is `c:\Cadence\SPB_17.4\` then copy this file into: `c:\Cadence\SPB_17.4\share\local\pcb\skill\`

# How to run the script
1) Run following command in Cadence Allegro command line: `get_short_rats`

# Automatically Loading Scripts in Cadence
If you would like to automatically load this script by your Allegro when it starts, do following:
1) Go to: `c:\Cadence\SPB_17.4\share\local\pcb\skill\`
2) Copy and rename "example.ilinit" to "allegro.ilinit" in to skill directory.
3) Copy "get_short_rats.il" to `c:\Cadence\SPB_17.4\share\local\pcb\skill\`

# References
https://github.com/FEDEVEL/allegro-script-add_layer_name

# Documentation
Documentation which you may need to create your own scripts or understand the commands and features used here:
Note: The absolute PATH depends on your Cadence installation.
- Allegro skill documentation directory: `c:\Cadence\SPB_17.4\doc\algroskill\`
- Content of all Functions: `C:/Cadence/SPB_17.4/doc/algroskill/algroskillTOC.html`
- Form Interface Functions: `C:/Cadence/SPB_17.4/doc/algroskill/11frmint.html`
- SKILL Commands: Search on Internet for "Skill Language User Guide", e.g.: http://pwp.gatech.edu/wp-content/uploads/sites/367/2016/03/Intro_to_skill_prog.pdf