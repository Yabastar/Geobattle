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

function start()
  local menuOptions = {"Next round", "Stats", "Battle"}
  local chosenOption = displayMenu(menuOptions)
  local chose = menuOptions[chosenOption]
  if chose == "Next round" then
    if land * 15 < troops then
      print("gained 0 troops (max)")
    else
      print("gained " .. troops + (land * 5) .. " troops")
      troops = troops + (land * 5)
    end
    sleep(2)
  elseif chose == "Stats" then
    print("Troop count: " .. troops)
    print("Square miles of land: " .. land)
    print("Max troops (estimate): " .. land * 15)
    print("Empty land left: " .. freeleft)
    sleep(2)
  elseif chose == "Battle" then
    print("Attacking empty land.")
    oldland = land
    oldfree = freeleft
    freeleft = freeleft - (troops / 2)
    if freeleft < 0 then
      land = land + oldfree
      freeleft = 0
    else
      land = land + (oldfree - freeleft) -- dont you love reverse subtraction?
    end
    print("Gained " .. oldland - land .. " square miles of land.") -- same here
    sleep(2)
  end
end

while true do
  start()
end
