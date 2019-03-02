local a,b = 1,"Bob" -- Variables can be here

function anotherFunction(a,b) -- 
	return a,b
end

-- Do NOT edit below for proper functionality with provided test cases

function main(input) -- The function called in the test case
	--Do stuff
	anotherFunction(a,b)
	return --Output should be returned here
end

return {
	Main = main
}