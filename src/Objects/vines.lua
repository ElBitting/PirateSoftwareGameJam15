Joints = {}

function latch(collider)
    for i, instance in ipairs(vines) do
        if instance == collider then
            table.insert(Joints, world:addJoint('PrismaticJoint', player, instance, player:getX(), player:getY(), instance:getX(), instance:getY(), true))
        end
    end
end

function delatch()
    while #Joints > 0 do
        world:removeJoint(Joints[1])
        table.remove(Joints, 1)
    end
end

