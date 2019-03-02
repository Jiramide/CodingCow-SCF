local src = require(workspace.ModuleScript) -- Put source here

local tests = {
	{{{"Rurudu", "Kodran", "Josh"}, "Rurudu"}, "Rurudu"},
	{{{"Alex"}, "Alex"}, "Alex"},
	{{{"Kim", "Jimmy", "Catherine", "Nick", "Daniel", "David"}, "David"}, "David"}
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
				return false
			end
		end
	else
		if RunTest(input, expectedOutput) then
			print("Passed case #"..i)
		end
	end
end