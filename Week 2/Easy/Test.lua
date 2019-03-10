local src = require("Week 2.Easy.src.Lua") -- Put source here

local tests = {
	{"74 111 115 104 32 105 115 32 97 32 114 101 97 108 108 121 32 99 111 111 108 32 103 117 121", "Josh is a really cool guy"},
	{"67 111 119 115 32 97 114 101 32 112 114 101 116 116 121 32 101 112 105 99", "Cows are pretty epic"},
	{"82 117 114 117 100 117 32 105 115 32 116 104 101 32 99 111 119 32 107 105 110 103 ", "Rurudu is the cow king"},
	{"83 67 70 32 105 115 32 116 104 101 32 98 101 115 116 32 115 101 114 118 101 114 44 32 110 111 32 100 101 98 97 116 101 32 110 101 99 101 115 115 97 114 121", "SCF is the best server, no debate necessary"}
}

function tableToString(tbl)
	local s = ""
	for i,v in pairs(tbl) do
		if type(v) == "table" then
			s = s..tableToString(v)
		else
			s = s..i.."\t"..v.."\n"
		end
	end
	return s
end

function tableEquals(a, b)
	for i,v in pairs(a) do
		if b[i] and v == b[i] then
		else
			return false
		end
	end
	for i,v in pairs(b) do
		if (a[i] and v == a[i]) then
		else
			return false
		end
	end
	return true
end

function RunTest(input, expectedOutput)
	local result = src.Main(input)
	local pass =tableEquals({result}, {expectedOutput})
	if not pass then
		error("Failed test\n"..
			"Input: \n"..(type(input) == "table" and tableToString(input) or input)..
			"\n\nExpected output: \n"..expectedOutput..
			"\n\nGot: \n"..(type(result) == "table" and tableToString(result) or result))
	end
	return true
end

for i,v in pairs(tests) do
	local input = v[1]
	local expectedOutput = v[2]
	local numInputs = #input
	if type(expectedOutput) == "table" then
		for i,v in pairs(expectedOutput) do
			if RunTest(input, expectedOutput[i]) then
				print("Passed case #"..i)
			end
		end
	else
		if RunTest(input, expectedOutput) then
			print("Passed case #"..i)
		end
	end
end