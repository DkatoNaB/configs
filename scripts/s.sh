cd /cygdrive/e/stuffs/HELP/ticket_helpers/Entry_review/iGO_FC6_RADNAV_3.0/
file_asd=$1
if [[ $1 = "s" ]]; then
	/cygdrive/e/stuffs/Sublime_Text_3/sublime_text.exe proj_radnav_entry/$2
else
	/cygdrive/e/stuffs/Sublime_Text_3/sublime_text.exe $file_asd
fi