local a,b = 1,"Bob" -- Variables can be here

function anotherFunction(a,b) -- 
	return a,b
end

-- Do NOT remove the main function, but you can change what is in the function.

function main(input) -- The function called in the test case
	--Do stuff
	anotherFunction(a,b)
	return --Output should be returned here
end

return {
	Main = main
}
