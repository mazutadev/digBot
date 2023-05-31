local check = require("utils.check")
local sort = require("utils.sort")

local function dig_and_check()
    turtle.dig()
    check.sand_blocks()
    sort.start()
end

-- RETURN
return {
    forward = dig_and_check
}