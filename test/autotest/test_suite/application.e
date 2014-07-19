note
	description: "test_suite application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit

	ARGUMENTS

	SHARED_EJSON

	EXCEPTION_MANAGER

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			retried: BOOLEAN
			l_text: detachable READABLE_STRING_GENERAL
		do
			if not retried then
				print ("Hello Eiffel World!%N")
				print (json.value (create {CELL [INTEGER]}.put (5)))
			else
				io.new_line
				print (l_text)
				io.new_line
				if attached last_exception as l then
					print (l.generator)
				end
			end
			io.read_integer
		rescue
			if attached {JSON_UNREGISTERED_CONVERTER_EXCEPTION} last_exception as l_exception then
				retried := True
				l_text := l_exception.description
				retry
			end
		end

end
