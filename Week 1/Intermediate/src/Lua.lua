return {
  Main = function(Inputs)
    local MaxIdx = nil
    local MaxVal = -math.huge

    for Idx, Val in pairs(Inputs) do
      if MaxVal < Val then
        MaxIdx = Idx
        MaxVal = Val
      end
    end

    return MaxIdx
  end
}
