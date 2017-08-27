
  local Generation = {}



  function Generation:init(player,ground)
  Generation.player = player
  Generation.ground = ground
  end

  function Generation:update(dt)

  if  self.ground:getLastPlusX() -  self.player:getX()  < W*0.45  then
   self.ground:addPlus(5);
  elseif self.player:getX() - self.ground:getLastMinusX() < W*0.45 then
   self.ground:addMinus(5);
  end

  end




  function Generation:draw()

  end








  return Generation
