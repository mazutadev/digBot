local check = require("utils.check")

local function move_fullstack_items()
    local start_slot = 1

    -- moving fullstack items to starts slots inventory
    for i = 1, 16 do
        turtle.select(i)
        if turtle.getItemCount() ~= 64 then
            for j = start_slot, 16 do
                -- moving items to current slots
                if turtle.getItemCount(j) == 64 and turtle.getItemCount(16) == 0 then
                    turtle.transferTo(16)
                    turtle.select(j)
                    turtle.transferTo(i)
                    turtle.select(16)
                    turtle.transferTo(j)
                    if start_slot < 16 then
                        start_slot = start_slot + 1
                    end
                end
            end
        else
            if start_slot < 16 then
                start_slot = start_slot + 1
            end
        end
    end
end

local function pack_inventory()
    -- moving items from filled slots to empty slots
    for i = 1, 16 do
        if turtle.getItemSpace(i) == 64 then
            for j = 16, i, -1 do
                -- moving items to current slots
                if turtle.getItemCount(j) >= 1 then
                    turtle.select(j)
                    turtle.transferTo(i)
                    break
                end
            end
        end
    end
end

local function sort_items()
    -- sorting items in inventory
    for i = 1, 16 do
        if turtle.getItemSpace(i) ~= 0 and turtle.getItemCount(i) ~= 64 then
            for j = i, 16 do
                if turtle.getItemSpace(j) ~= 64 and turtle.getItemCount(j) ~= 64 then
                    turtle.select(i)
                    if turtle.compareTo(j) then
                        turtle.select(j)
                        turtle.transferTo(i)
                        if turtle.getItemCount(i) == 64 then
                            break
                        end
                    end
                end
            end
        end
    end
end

local function start_sorting()
    if turtle.getItemCount(16) ~= 0 then
        check.blacklist_block()
        sort_items()
        pack_inventory()
        move_fullstack_items()
        turtle.select(1)
    end
end


-- RETURN

return {
    fullstack_items = move_fullstack_items,
    pack_inventory = pack_inventory,
    start = start_sorting
}
