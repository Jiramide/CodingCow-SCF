return {
  Main = function(Input)
    local Str = ""
    for Idx = 1, #Input, 2 do
      Str = Str .. string.char(tonumber(Input:sub(Idx, Idx + 1), 16))
    end
    return Str
  end
}
