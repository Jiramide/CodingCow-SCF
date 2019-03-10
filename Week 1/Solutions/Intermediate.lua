function main(input)
	local max = {}
	for i,v in pairs(input) do
		if max[1] == nil then
			-- If the max is nil, set the current index to be max
			max[1] = i
		end

		if max[1] and v > input[max[1]] then
			-- If the value is greater than the current max, replace max with the current index
			max[] = {} -- Must reset first in case there are multiple names in there
			max[1] = i
		end
	end
	return unpack(max)
end

return {
	Main = main
}

--[[ Solution description 
	
	Iterate through the dictionary and replace max with the value if the value is higher than the current max. After all iterations, return the max value.