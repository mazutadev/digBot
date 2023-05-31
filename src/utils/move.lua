local dig = require("utils.dig")
local check = require("utils.check")

local function turn_around_turtle(direction)
    if direction == "left" then
        turtle.turnLeft()
        turtle.turnLeft()
    elseif direction == "right" or direction == nil then
        turtle.turnRight()
        turtle.turnRight()
    end
end

local function move_and_turn(direction)
    if direction == "left" then
        turtle.turnLeft()
    elseif direction == "right" then
        turtle.turnRight()
    end

    dig.forward()
    turtle.forward()

    if direction == "left" then
        turtle.turnLeft()
    elseif direction == "right" then
        turtle.turnRight()
    end
end

local function set_move_direction(width_position, height_position, input_width)

    if check.even(input_width) then
        if check.even(height_position) then
            if check.even(width_position) then
                move_and_turn("right")
            else
                move_and_turn("left")
            end
        else
            if check.even(width_position) then
                move_and_turn("left")
            else
                move_and_turn("right")
            end
        end
    else
        if check.even(width_position) then
            move_and_turn("left")
        else
            move_and_turn("right")
        end
    end
end

local function go_start_point(current_y,current_x,current_z)
    if check.even(current_z) then
        turn_around_turtle()
        for i = 1, current_z do
            turtle.digUp()
            turtle.up()
        end
    else
        if check.even(current_x) then
            turtle.turnRight()
            for i = 1, current_z do
                turtle.digUp()
                turtle.up()
            end
            for j = 1, current_x - 1 do
                dig.forward()
                turtle.forward()
            end
            turtle.turnRight()
        else
            turtle.turnLeft()
            for i = 1, current_z do
                turtle.digUp()
                turtle.up()
            end
            for j = 1, current_x - 1 do
                dig.forward()
                turtle.forward()
            end
            turtle.turnLeft()
            for k = 1, current_y  - 1 do
                dig.forward()
                turtle.forward()
            end
            turn_around_turtle()
        end
    end
end

-- RETURN

return {
    turn_around_turtle = turn_around_turtle,
    move_and_turn = move_and_turn,
    set_direction = set_move_direction,
    start_point = go_start_point
}