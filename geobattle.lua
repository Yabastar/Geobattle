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

function start()
  freeland = math.random(10,100)
  freeleft = freeland
  troops = 90
  land = 6
  local menuOptions = {"Next round", "Stats", "Battle"}
  local chosenOption = displayMenu(menuOptions)
  local numchose = menuOptions[chosenOption]
  if numchose == 1 then
    if land * 15 < troops then
      -- nothing
    else
      troops = troops + (land * 5)
    end
  elseif numchose == 2 then
    print("Troop count: " .. troops)
    print("Square miles of land: " .. land)
    print("Max troops: " .. land * 15)
    print("Empty land left: " .. freeleft)
  elseif numchose == 3 then
    print("Attacking empty land.")
    oldfree = freeleft
    freeleft = freeleft / 2
    print("Gained " .. oldfree / 2 .. " square miles of land.")
  end
  sleep(2)
end

while true do
  start()
end
