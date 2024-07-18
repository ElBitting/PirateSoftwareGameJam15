apple = {}
apple[1] = world:newCircleCollider(270, 200, 8)
apple[2] = world:newCircleCollider(220, 200, 8)
apple[1]:setCollisionClass("Apples")
apple[2]:setCollisionClass("Apples")