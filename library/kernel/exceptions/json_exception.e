note
	description: "Ancestor class for all json exception."
	author: "Victorien Elvinger"
	date: "$Date$"
	revision: "$Revision$"

class
	JSON_EXCEPTION

inherit

	DEVELOPER_EXCEPTION
		redefine
			tag
		end

feature -- Access

	frozen tag: IMMUTABLE_STRING_32
			-- <Precursor>
		once
			Result := "eJSON exception."
		end

end
