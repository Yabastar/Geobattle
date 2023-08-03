print("Welcome to Geobattle 001")

sleep(1)

function clearScreen()
  term.clear()
  term.setCursorPos(1, 1)
end

function displayMenu(options)
  clearScreen()
  print("Select an option:")

  for i, option in ipairs(options) do
    print(i .. ". " .. option)
  end

  local choice = nil

  while true do
    write("Choice: ")
    choice = tonumber(read())

    if choice and choice >= 1 and choice <= #options then
      break
    else
      print("Invalid choice. Please try again.")
    end
  end

  return choice
end

freeland = math.random(10,100)
freeleft = freeland
troops = 90
land = 6

function generateRandomCombinations(list1, list2, numCombinations)
  local combinations = {}

  for _ = 1, numCombinations do
    local combination = {}

    for i = 1, math.max(#list1, #list2) do
      local element1 = list1[math.random(#list1)]
      local element2 = list2[math.random(#list2)]

      table.insert(combination, element1 .. " " .. element2)
    end

    table.insert(combinations, combination)
  end

  return combinations
end

-- Example usage:
local list1 = {"Qing", "Arama", "Selic", "Yuguhion", "Mbunda", "Helvetic", "Bukhara", "Sokoto", "Bugunda", "Ptolemaic", "Khamag", "Laur", "Abbasid", "Songhi", "Johor"}
local list2 = {"Dynasty", "Kingdom", "Republic", "Union", "Empire", "Caliphate", ""}
local numCombinations = 5

local randomCombinations = generateRandomCombinations(list1, list2, numCombinations)

-- Map combinations to variables
local Enemy1, Enemy2, Enemy3, Enemy4, Enemy5 = unpack(randomCombinations)

function start()
  local menuOptions = {"Next round", "Stats", "Battle"}
  local chosenOption = displayMenu(menuOptions)
  local chose = menuOptions[chosenOption]
  if chose == "Next round" then
    if land * 15 < troops then
      print("gained 0 troops (max)")
    else
      print("gained " .. (land * 5) .. " troops")
      troops = troops + (land * 5)
    end
    sleep(1)
  elseif chose == "Stats" then
    print("Troop count: " .. troops)
    print("Square miles of land: " .. land)
    print("Max troops (estimate): " .. land * 15)
    print("Empty land left: " .. freeleft)
    sleep(2)
  elseif chose == "Battle" then
    if freeleft > 0 then
      print("Attacking empty land.")
      oldland = land
      oldfree = freeleft
      freeleft = freeleft - (troops / 4)
      if freeleft < 0 then
        land = land + oldfree
        freeleft = 0
      else
        land = land + (oldfree - freeleft) -- dont you love reverse subtraction?
      end
      print("Gained " .. math.abs(oldland - land) .. " square miles of land.") -- could have probably simplified this
      sleep(2)
    else
      print("Enemy1:", Enemy1[1])
      print("Enemy2:", Enemy2[1])
      print("Enemy3:", Enemy3[1])
      print("Enemy4:", Enemy4[1])
      print("Enemy5:", Enemy5[1])
      sleep(4)
    end
  end
end

while true do
  start()
end
