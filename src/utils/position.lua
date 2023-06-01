
local check = require("utils.check")

local function record_position_y(current_x, current_z)

    if check.even(current_z) then
        if check.even(current_x) then
            return 1
        else
            return - 1
        end
    else
        if check.even(current_x) then
            return - 1
        else
            return 1
        end
    end

    if check.even(input_width) then
        if check.even(current_x) then
            return current_y - 1
        else
            return current_y + 1
        end
    else
        if check.even(current_z) then
            if check.even(current_x) then
                return current_y + 1
            else
                return current_y - 1
            end
        else
            if check.even(current_x) then
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


return {
    record_y = record_position_y,
    record_x = record_position_x,
}