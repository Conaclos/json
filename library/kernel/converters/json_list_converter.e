note
	description: "A JSON converter for LIST [ANY]"
	author: "Paul Cohen"
	date: "$Date$"
	revision: "$Revision$"
	file: "$HeadURL: $"

deferred class
	JSON_LIST_CONVERTER

inherit

	JSON_CONVERTER

feature -- Conversion

	from_json (j: attached like to_json): detachable like new_object
			-- <Precursor>
		do
			Result := new_object (j.count)
			across
				j as it
			loop
				Result.extend (json.object (it.item, Void))
			end
		end

	to_json (o: like new_object): JSON_ARRAY
			-- <Precursor>
		do
			create Result
            across
				o as it
            loop
                Result.extend (json.value (it.item))
            end
		end

feature -- Factory

	new_object (nb: INTEGER): LIST [detachable ANY]
	        -- Freshly created list.
		deferred end

end -- class JSON_ARRAYED_LIST_CONVERTER
