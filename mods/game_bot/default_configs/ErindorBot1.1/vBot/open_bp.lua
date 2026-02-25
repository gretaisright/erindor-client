openBackpacks = function()
    -- Close ONLY backpack-like containers
    for _, container in pairs(g_game.getContainers()) do
        local citem = nil

        -- Try to get the container "source item" in a few common ways
        if container.getContainerItem then
            citem = container:getContainerItem()
        elseif container.getItem then
            citem = container:getItem()
        end

        -- If we found a source item and it's a container item, treat it as a backpack window
        if citem and citem.isContainer and citem:isContainer() then
            g_game.close(container)
        end
    end
    schedule(1000, function()
        bpItem = getBack()
        if bpItem ~= nil then g_game.open(bpItem) end
    end)

    schedule(2000, function()
        local nextContainers = {}
        containers = getContainers()
        for i, container in pairs(g_game.getContainers()) do
            for i, item in ipairs(container:getItems()) do
                 if item:isContainer() then
                     table.insert(nextContainers, item)
                 end
            end
            if #nextContainers == 0 then return end
            local delay = 1
            for i = 1, #nextContainers do
                schedule(delay, function()
                    g_game.open(nextContainers[i], nil)
                end)
                delay = delay + 250
            end
        end
    end)
end

setDefaultTab("Tools")
UI.Button("Open all Backpacks", function()
    openBackpacks()
end)