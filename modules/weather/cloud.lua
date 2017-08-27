  local cloud = {}


  function cloud:new()
  local public = {}
  local private = {}

  private.x = W*1.1
  private.y = RandomGenerator:random(0,H)
  private.w = RandomGenerator:random(W*0.02,W*0.05)
  private.h = RandomGenerator:random(H*0.02,H*0.05)



  function cloud:draw()
   love.graphics.setColor(RandomGenerator:random(0,30), RandomGenerator:random(0,30), RandomGenerator:random(0,30), RandomGenerator:random(0,255))
   love.graphics.polygon("fill",private.x,private.y)
  end

  function cloud:update(dt)

  end

  setmetatable(public,self)
  self.__index = self
  return public
  end










  return cloud
