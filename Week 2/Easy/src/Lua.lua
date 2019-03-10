return {
  Main = function(Input)
    local Str = ""
    for Char in Input:gmatch("%d+") do
      Str = Str .. string.char(Char)
    end
    return Str
  end
}