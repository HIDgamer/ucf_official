/datum/computer_file/program/notepad
	filename = "notepad"
	filedesc = "Notepad"
	extended_desc = "Jot down your work-safe thoughts and what not."
	tgui_id = "NtosNotepad"
	program_icon = "book"
	program_open_overlay = "generic"

	var/written_note = ""

/datum/computer_file/program/notepad/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	switch(action)
		if("UpdateNote")
			written_note = copytext(params["newnote"], 1, 4096)
			return TRUE

/datum/computer_file/program/notepad/ui_data(mob/user)
	var/list/data = list()
	data["note"] = written_note
	return data
