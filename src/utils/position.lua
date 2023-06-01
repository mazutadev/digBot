
local check = require("utils.check")

local function record_position_y(width_position, height_position, input_width, current_y)

    if check.even(input_width) then
        if check.even(width_position) then
            return current_y - 1
        else
            return current_y + 1
        end
    else
        if check.even(height_position) then
            if check.even(width_position) then
                return current_y + 1
            else
                return current_y - 1
            end
        else
            if check.even(width_position) then
                return current_y - 1
            else
                return current_y + 1
            end
        end
    end
end

local function record_position_x(current_z)
    return check.even(current_z) and - 1 or 1
end

local function record_position_z(height_position, input_height)
    if height_position == input_height then
        return height_position
    else
        return height_position + 1
    end
end

return {
    record_y = record_position_y,
    record_x = record_position_x,
    record_z = record_position_z
}