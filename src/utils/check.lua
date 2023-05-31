local output = require("utils.output")

local function check_block_list(blocks, data)

    if data == nil then
        return nil
    end

    for _, block_name in pairs(blocks) do
        if data.name == block_name then
            return block_name
        end
    end
    return nil
end

local function check_even(position)
    return position % 2 == 0
end

local function check_sand_blocks()

    local sand_blocks_list = {
        "minecraft:sand",
        "minecraft:gravel",
        "minecraft:red_sand"
    }

    local success, data = turtle.inspect()

    local current_block = check_block_list(sand_blocks_list, data)
    local quantity_blocks = 0


    if current_block then
        output.write_line(1, "Checking "..current_block.." blocks...")

        while success and current_block do
            quantity_blocks = quantity_blocks + 1

            output.write_line(2, "Found "..current_block..". All found blocks: "..quantity_blocks)

            turtle.dig()
            os.sleep(0.5)

            success, data = turtle.inspect()

            current_block = check_block_list(sand_blocks_list, data)

        end

        output.write_line(1, "No matching sand blocks found, exiting checking")

    else
        output.write_line(1, "No initial matching sand blocks found, exiting checking")
    end
end

local function check_blacklist_blocks()

    local number_of_slots = 16
    local filled_slot = 1

    local blacklist_block = {
        "minecraft:dirt",
        "minecraft:gravel",
        "minecraft:sand",
        "minecraft:cobblestone",
        "minecraft:andesite",
        "minecraft:calsite",
        "minecraft:granite",
        "minecraft:tuff",
        "minecraft:deorite",
        "minecraft:basalt",
        "minecraft:sandstone",
    }

    for i = filled_slot, number_of_slots do
        local item = turtle.getItemDetail(i)
        local current_block = check_block_list(blacklist_block, item)

        if current_block then
            turtle.select(i)
            turtle.dropDown()
        end
    end

end


local function checking_number_type()
    local number = tonumber(io.read())

    if type(number) == "number" and number >= 0 then
        return number
    else
        write_line(1, "Input is not a positive number. Please input a positive number")
        checking_number_type()
    end

end


-- RETURN

return {
    block_list = check_block_list,
    sand_blocks = check_sand_blocks,
    blacklist_block = check_blacklist_blocks,
    number_type = checking_number_type,
    even = check_even
}