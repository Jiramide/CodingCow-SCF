return {
  Main = function(Inputs)
    for Idx = 1, #Inputs[1] do
      if Inputs[1][Idx] == Inputs[2] then
        return Idx
      end
    end

    return -1
  end
}
