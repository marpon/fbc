# include "fbcu.bi"

#define FALSE 0
#define TRUE -1

const FALSE_STRING = "false"
const TRUE_STRING = "true"

namespace fbc_tests.boolean_.file_

	'' RTLIB - PRINTBOOL
	''       - WRITEBOOL
	''       - INPUTBOOL

	sub io_test_ascii cdecl ( )

		dim h as integer = freefile
		dim b as boolean
		dim f as boolean = cbool(FALSE)
		dim t as boolean = cbool(TRUE)
		dim x as string

		open "boolean/data-ascii.txt" for input as #h
			input #h, b: CU_ASSERT_EQUAL( b, FALSE )
			input #h, b: CU_ASSERT_EQUAL( b, TRUE  )
			input #h, b: CU_ASSERT_EQUAL( b, FALSE )
			input #h, b: CU_ASSERT_EQUAL( b, TRUE  )

			input #h, b: CU_ASSERT_EQUAL( b, FALSE )
			input #h, b: CU_ASSERT_EQUAL( b, TRUE  )
			input #h, b: CU_ASSERT_EQUAL( b, FALSE )
			input #h, b: CU_ASSERT_EQUAL( b, TRUE  )

			input #h, b: CU_ASSERT_EQUAL( b, FALSE )
			input #h, b: CU_ASSERT_EQUAL( b, TRUE  )
			input #h, b: CU_ASSERT_EQUAL( b, FALSE )
			input #h, b: CU_ASSERT_EQUAL( b, TRUE  )

		close #h

		open "boolean/data-ascii-test.txt" for output as #h
			write #h, cbool(FALSE), cbool(TRUE),f,t
			print #h, cbool(FALSE), cbool(TRUE),f,t
			print #h, 0,0,0,0
		close #h

		open "boolean/data-ascii-test.txt" for input as #h
			line input #h, x
			CU_ASSERT_EQUAL( x, "false,true,false,true" )
			line input #h, x
			CU_ASSERT_EQUAL( x, "false"+space(9)+"true"+space(10)+"false"+space(9)+"true" )
		close #h

		open "boolean/data-ascii-test.txt" for input as #h
			input #h, b: CU_ASSERT_EQUAL( b, FALSE )
			input #h, b: CU_ASSERT_EQUAL( b, TRUE  )
			input #h, b: CU_ASSERT_EQUAL( b, FALSE )
			input #h, b: CU_ASSERT_EQUAL( b, TRUE  )
		close #h

		'' kill "boolean/data-ascii-test.txt"

	end sub

	sub io_test_utf16le cdecl ( )

		dim h as integer = freefile
		dim b as boolean
		dim f as boolean = cbool(FALSE)
		dim t as boolean = cbool(TRUE)
		dim x as wstring * 80

		open "boolean/data-utf16le.txt" for input encoding "utf16" as #h
			input #h, b: CU_ASSERT_EQUAL( b, FALSE )
			input #h, b: CU_ASSERT_EQUAL( b, TRUE  )
			input #h, b: CU_ASSERT_EQUAL( b, FALSE )
			input #h, b: CU_ASSERT_EQUAL( b, TRUE  )

			input #h, b: CU_ASSERT_EQUAL( b, FALSE )
			input #h, b: CU_ASSERT_EQUAL( b, TRUE  )
			input #h, b: CU_ASSERT_EQUAL( b, FALSE )
			input #h, b: CU_ASSERT_EQUAL( b, TRUE  )

			input #h, b: CU_ASSERT_EQUAL( b, FALSE )
			input #h, b: CU_ASSERT_EQUAL( b, TRUE  )
			input #h, b: CU_ASSERT_EQUAL( b, FALSE )
			input #h, b: CU_ASSERT_EQUAL( b, TRUE  )

		close #h

		open "boolean/data-utf16le-test.txt" for output encoding "utf16" as #h
			write #h, cbool(FALSE), cbool(TRUE),f,t
			print #h, cbool(FALSE), cbool(TRUE),f,t
			print #h, 0,0,0,0
		close #h

		open "boolean/data-utf16le-test.txt" for input encoding "utf16" as #h
			line input #h, x
			CU_ASSERT_EQUAL( x, wstr("false,true,false,true") )
			line input #h, x
			CU_ASSERT_EQUAL( x, wstr("false"+space(9)+"true"+space(10)+"false"+space(9)+"true")  )
		close #h

		open "boolean/data-utf16le-test.txt" for input encoding "utf16" as #h
			input #h, b: CU_ASSERT_EQUAL( b, FALSE )
			input #h, b: CU_ASSERT_EQUAL( b, TRUE  )
			input #h, b: CU_ASSERT_EQUAL( b, FALSE )
			input #h, b: CU_ASSERT_EQUAL( b, TRUE  )
		close #h

		kill "boolean/data-utf16le-test.txt"

	end sub

	sub io_test_binary cdecl ( )

		dim h as integer = freefile
		dim b as boolean
		dim c as byte
		dim f as boolean = cbool(FALSE)
		dim t as boolean = cbool(TRUE)
		dim x as wstring * 80

		open "boolean/data-binary-test.dat" for output as #h
		close #h

		open "boolean/data-binary-test.dat" for binary as #h
			b = FALSE: put #h,,b
			b = TRUE : put #h,,b
			b = FALSE: put #h,,b
			b = TRUE : put #h,,b
			c = 0: put #h,,c
			c = 1: put #h,,c
			c = 0: put #h,,c
			c = 1: put #h,,c
			b = FALSE: put #h,,b
			b = TRUE : put #h,,b
			b = FALSE: put #h,,b
			b = TRUE : put #h,,b
		close #h

		open "boolean/data-binary-test.dat" for binary as #h
			get #h,,b: CU_ASSERT_EQUAL( b, FALSE )
			get #h,,b: CU_ASSERT_EQUAL( b, TRUE )
			get #h,,b: CU_ASSERT_EQUAL( b, FALSE )
			get #h,,b: CU_ASSERT_EQUAL( b, TRUE )
			get #h,,b: CU_ASSERT_EQUAL( b, FALSE )
			get #h,,b: CU_ASSERT_EQUAL( b, TRUE )
			get #h,,b: CU_ASSERT_EQUAL( b, FALSE )
			get #h,,b: CU_ASSERT_EQUAL( b, TRUE )
			get #h,,c: CU_ASSERT_EQUAL( c, 0 )
			get #h,,c: CU_ASSERT_EQUAL( c, 1 )
			get #h,,c: CU_ASSERT_EQUAL( c, 0 )
			get #h,,c: CU_ASSERT_EQUAL( c, 1 )
		close #h

		kill "boolean/data-binary.dat"

	end sub

	private sub ctor () constructor
		fbcu.add_suite("fbc_tests.boolean_.file_")
		fbcu.add_test("io_test_utf16le", @io_test_ascii)
		fbcu.add_test("io_test_utf16le", @io_test_utf16le)
		fbcu.add_test("io_test_binary", @io_test_binary)
	end sub

end namespace
