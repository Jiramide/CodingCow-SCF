function main(input)
	for i,v in pairs(input[1]) do
		if v == input[2] then
			return i
		end
	end
	return -1 -- Not necessary
end

return {
	Main = main
}

--[[ Solution description

	Traverse through (go through) the input dictionary and return the index when the value matches the name that is being searched for.
]]