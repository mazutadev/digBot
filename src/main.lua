local args = {...}

local utils = require("utils.utils")

local length
local width
local height

local debug = false

-- DEFINE FUNCTIONS

local function refuel_turtle()
    turtle.select(16)
    turtle.refuel()
    turtle.select(1)
end

-- PROGRAM CODE

if #args == 0 then
    length, width, height = utils.input.size_area()
else
    length = tonumber(args[1])
    width = tonumber(args[2])
    height = tonumber(args[3])
end

refuel_turtle()
turtle.digDown()
turtle.down()

local current_x, current_y, current_z = 1, 1, 1

term.clear()
-- BEGIN DIG TURTLE HEIGHT
for i = 1, height do

    -- BEGIN DIG TURTLE WIDTH
    for j = 1, width do

        -- BEGIN DIG TURTLE LENGTH

        for k = 1, length -1 do
            utils.dig.forward()
            turtle.forward()
            current_y = current_y + utils.position.record_y(current_x, current_y)
            utils.output.current_position(current_y, current_x, current_z)
        end
        -- END DIG TURTLE LENGTH

        if width_position == width then -- TODO: Change to current_x stop logic
            break
        end
        utils.move.set_direction(current_x)
        current_x = current_x + utils.position.record_x(current_z)

    -- END DIG TURTLE WIDTH
    end

    if current_z == height then -- TODO: Change to current_y stop logic
        break
    else
        turtle.digDown()
        turtle.down()
        turtle.turnRight()
        turtle.turnRight()

        current_z = current_z + 1
    end

-- END DIG TURTLE HEIGHT
end

utils.move.start_point(current_y, current_x, current_z)

