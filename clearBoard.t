function resetBoard (grid : array 1 .. 8, 1 .. 8 of int) : array 1 .. 8, 1 .. 8 of int
    var test : array 1 .. 8, 1 .. 8 of int
    for ii : 1 .. 8
	for hh : 1 .. 8
	    test (ii, hh) := 30
	end for
    end for

    test (8, 1) := 12
    test (8, 8) := 12
    test (8, 2) := 13
    test (8, 7) := 13
    test (8, 3) := 14
    test (8, 6) := 14
    test (8, 4) := 15
    test (8, 5) := 16

    for aaa : 1 .. 8
	test (7, aaa) := 11
    end for

    test (1, 1) := 22
    test (1, 8) := 22
    test (1, 2) := 23
    test (1, 7) := 23
    test (1, 3) := 24
    test (1, 6) := 24
    test (1, 4) := 25
    test (1, 5) := 26

    for bbb : 1 .. 8
	test (2, bbb) := 21
    end for
    result test
end resetBoard
