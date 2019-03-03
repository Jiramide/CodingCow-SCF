local Corpus = "Week 1/Hard/Corpus/"
local English = assert(io.open(Corpus .. "english.corpus", "r"))
local French = assert(io.open(Corpus .. "french.corpus", "r"))
local HipHop = assert(io.open(Corpus .. "hiphop.corpus", "r"))
local Lisp = assert(io.open(Corpus .. "lisp.corpus", "r"))
local Spanish = assert(io.open(Corpus .. "spanish.corpus", "r"))

local function CreateMarkovRow(Content, Letter)
  local Row = {}
  local Count = 0

  -- Counting
  for Next in Content:gmatch(Letter .. "(.)") do
    Count = Count + 1
    Row[Next] = (Row[Next] or 0) + 1
  end

  -- Normalization
  for Next, Occurances in pairs(Row) do
    Row[Next] = Occurances/Count
  end

  return Row
end

local function CreateMarkovChain(Content)
  Content = Content:lower():gsub("%A+", "")

  local MarkovChain = {}

  for Idx = 1, #Content do
    local Letter = Content:sub(Idx, Idx)
    MarkovChain[Letter] = CreateMarkovRow(Content, Letter)
  end

  return MarkovChain
end

local function SafeIndex(Tab, Key, Def)
  return Tab and Tab[Key] or Def
end

local function WithMarkov(Chain, String)
  local Probability = 1

  for Idx = 1, #String - 1 do
    Probability = Probability
                * SafeIndex(SafeIndex(Chain, String:sub(Idx, Idx)), String:sub(Idx + 1, Idx + 1), 0.01)
  end

  return Probability
end

local EngChain = CreateMarkovChain(English:read("*a"))
local FreChain = CreateMarkovChain(French:read("*a"))
local HipChain = CreateMarkovChain(HipHop:read("*a"))
local LspChain = CreateMarkovChain(Lisp:read("*a"))
local SpaChain = CreateMarkovChain(Spanish:read("*a"))

English:close()
French:close()
HipHop:close()
Lisp:close()
Spanish:close()

local MaxKey = require("Week 1.Intermediate.src.Lua") -- lmao

return {
  Main = function(String)
    local Probabilities = {
      english = WithMarkov(EngChain, String),
      french = WithMarkov(FreChain, String),
      hiphop = WithMarkov(HipChain, String),
      lisp = WithMarkov(LspChain, String),
      spanish = WithMarkov(SpaChain, String)
    }

    return MaxKey.Main(Probabilities)
  end
}