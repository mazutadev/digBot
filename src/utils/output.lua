
local function write_line(row, text)
    if debug then
        term.setCursorPos(1, row)
        term.clearLine()
        term.write(text)
    else
        return
    end
end

local function write_current_position(current_y, current_x, current_z)
    term.setCursorPos(1,1)
    term.clearLine()
    term.write("Y position "..current_y)
    term.setCursorPos(1,2)
    term.clearLine()
    term.write("X position "..current_x)
    term.setCursorPos(1,3)
    term.clearLine()
    term.write("Z position "..current_z)
end

-- RETURN
return {
    write_line = write_line,
    current_position = write_current_position
}