note
	description: "A JSON converter for HASH_TABLE [ANY, HASHABLE]"
	author: "Paul Cohen"
	date: "$Date: 2014-01-30 15:27:41 +0100 (jeu., 30 janv. 2014) $"
	revision: "$Revision: 94128 $"
	file: "$HeadURL: $"

class
	JSON_HASH_TABLE_CONVERTER

inherit

	JSON_CONVERTER

create
	default_create

feature -- Conversion

	from_json (j: attached like to_json): detachable HASH_TABLE [detachable ANY, HASHABLE]
			-- <Precursor>
		do
			create Result.make (j.count)
			across
				j as ic
			until
				Result = Void
			loop
				if attached json.object (ic.item, Void) as l_object then
					if attached {HASHABLE} json.object (ic.key, Void) as h then
						Result.put (l_object, h)
					else
						Result := Void
							-- Failed
					end
				else
					Result := Void
						-- Failed
				end
			end
		end

	to_json (o: attached like from_json): JSON_OBJECT
			-- <Precursor>
		local
			js: JSON_STRING
			l_value: JSON_VALUE
		do
			create Result
			across
				o as it
			loop
				l_value := json.value (it.key)
				if attached {JSON_STRING} l_value as l_key then
					js := l_key
				else
					create js.make_json (l_value.representation)
				end
				Result.put (json.value (it.item), js)
			end
		end

end -- class JSON_HASH_TABLE_CONVERTER
