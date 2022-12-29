local M = {}

-- search in a `map` if it contains the `element`.
-- @param map list
-- @param element any
-- @return boolean
function M.contains(map, element)
    for _, v in pairs(map) do
        if v == element then
            return true
        end
    end

    return false
end

-- determines if the given `map` contains every `elements`.
-- @param map list
-- @param element any...
-- @return boolean
function M.every(map, ...)
    local nbElements = M.tsize(...)
    local count = 0

    for _, v in pairs(map) do
        for _, el in pairs(...) do
            if v == el then
                count = count + 1
                break
            end
        end
    end

    return count == nbElements
end

-- returns the size of a given `map`.
-- @param map list
-- @return int
function M.tsize(map)
    local count = 0

    for _ in pairs(map) do
        count = count + 1
    end

    return count
end

return M
