  Game = {}





  function Game:init()
    self.g1 = Ground:new(W*0.05,H*0.5,2);
    self.pl = Player:new(W*0.05,H*0.4,self)
    Generation:init(self.pl,self.g1);
    ShangeBG:init(self.pl);
  end







  function Game:draw()
    ShangeBG:draw();
    Info:draw()
    Camera:draw();
    self.pl:draw();
    self.g1:draw()
  end




  function Game:update(dt)
  ShangeBG:update(dt);
  world:update(dt)
  Camera:update(dt,self.pl:getX(),self.pl:getY())
  self.pl:update(dt);
  Generation:update(dt);
  if love.keyboard.isDown("escape") then
  love.event.quit()
  end
  Info:update(dt)
  end



  return Game
