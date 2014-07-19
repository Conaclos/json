note
	description: "Json exception for unregistered json converter."
	author: "Victorien Elvinger"
	date: "$Date$"
	revision: "$Revision$"

class
	JSON_UNREGISTERED_CONVERTER_EXCEPTION

inherit

	DEVELOPER_EXCEPTION

inherit {NONE}

	REFLECTOR
		export
			{NONE} all
		undefine
			out
		end

create
	make

feature -- Creation

	make (a_type: like type; a_factory: like factory)
			-- Create an exception about unregistered converter for `a_type' into `a_factory'.
		do
			type := a_type
			factory := a_factory
			set_description ("Converter for `" + class_name_of_type (a_type.type_id) + "' is unregistered.")
		ensure
			type_set: type = a_type
			factory_set: factory = a_factory
		end

feature -- Access

	type: TYPE [detachable ANY]
			-- Type with unregistered converter into `factory'.

	factory: EJSON
			-- Json factory.

end
