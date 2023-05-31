check = require("utils.check")


local function input_size_area()
    print("Please, input LENGTH (positive number):")
    local length = check.number_type()

    print("Please, input WIDTH (positive number):")
    local width = check.number_type()

    print("Please, input HEIGHT (positive number):")
    local height = check.number_type()

    return length, width, height
end

-- RETURN
return {
    size_area = input_size_area
}