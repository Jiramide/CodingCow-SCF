local src = require(workspace.ModuleScript) -- Put source here

local tests = {
	{"4a6f73682069732061207265616c6c7920636f6f6c20677579", "Josh is a really cool guy"},
	{"436f777320617265207072657474792065706963", "Cows are pretty epic"},
	{"5275727564752069732074686520636f77206b696e67", "Rurudu is the cow king"},
	{"534346206973207468652062657374207365727665722c206e6f20646562617465206e6563657373617279", "SCF is the best server, no debate necessary"}
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