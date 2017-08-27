  local ShangeBG = {}





  function ShangeBG:init(player)
    self.player = player
    self.x = 0;
    self.y = 0;
    self.timer = 0;
    self.countShaders = 0;
    self.time = 0;
    local text = love.filesystem.read("assets/shaders/shader1.glsl")
    self.shader = love.graphics.newShader(text);
    self.canvas = love.graphics.newCanvas(W,H);
    local text = love.filesystem.read("assets/shaders/shader1.glsl")
      self.shader = love.graphics.newShader(text);

    local text = love.filesystem.read("assets/shaders/shader2.glsl")
    self.shader1 = love.graphics.newShader(text);

    local text = love.filesystem.read("assets/shaders/shader3.glsl")
    self.shader2 = love.graphics.newShader(text);

    local text = love.filesystem.read("assets/shaders/shader4.glsl")
    self.shader3 = love.graphics.newShader(text);

    local text = love.filesystem.read("assets/shaders/shader5.glsl")
    self.shader4 = love.graphics.newShader(text);

    local text = love.filesystem.read("assets/shaders/shader6.glsl")
    self.shader5 = love.graphics.newShader(text);
  end


  function ShangeBG:draw()
  love.graphics.draw(self.canvas)
  end

  function ShangeBG:update(dt)
    self.timer = self.timer + 1;
    self.time = self.time + dt;
    if self.timer % 1000 == 0 then
      self.countShaders = self.countShaders + 1;
      love.graphics.setShader()
    end

    if self.countShaders > 5 then
      self.countShaders = 1;
    end

    if self.shader:getExternVariable("time") ~= nil then
     self.shader:send("time",self.time)
    end
    if self.shader:getExternVariable("resolution") ~= nil then
     self.shader:send("resolution",{love.graphics.getWidth(),love.graphics.getHeight()})
    end
    if self.shader1:getExternVariable("time") ~= nil then
     self.shader1:send("time",self.time)
    end
    if self.shader1:getExternVariable("resolution") ~= nil then
     self.shader1:send("resolution",{love.graphics.getWidth(),love.graphics.getHeight()})
    end
    if self.shader2:getExternVariable("time") ~= nil then
     self.shader2:send("time",self.time)
    end
    if self.shader2:getExternVariable("resolution") ~= nil then
     self.shader2:send("resolution",{love.graphics.getWidth(),love.graphics.getHeight()})
    end
    if self.shader3:getExternVariable("time") ~= nil then
     self.shader3:send("time",self.time)
    end
    if self.shader3:getExternVariable("resolution") ~= nil then
     self.shader3:send("resolution",{love.graphics.getWidth(),love.graphics.getHeight()})
    end
    if self.shader4:getExternVariable("time") ~= nil then
     self.shader4:send("time",self.time)
    end
    if self.shader4:getExternVariable("resolution") ~= nil then
     self.shader4:send("resolution",{love.graphics.getWidth(),love.graphics.getHeight()})
    end
    if self.shader5:getExternVariable("time") ~= nil then
     self.shader5:send("time",self.time)
    end
    if self.shader5:getExternVariable("resolution") ~= nil then
     self.shader5:send("resolution",{love.graphics.getWidth(),love.graphics.getHeight()})
    end



    love.graphics.setCanvas(self.canvas)

    love.graphics.setColor(255,255,255,255)
    if self.countShaders == 0 then   love.graphics.setShader(self.shader)
    elseif self.countShaders == 1 then   love.graphics.setShader(self.shader1)
    elseif self.countShaders == 2 then   love.graphics.setShader(self.shader2)
  elseif self.countShaders == 3 then   love.graphics.setShader(self.shader3)
  elseif self.countShaders == 4 then   love.graphics.setShader(self.shader4)
  elseif self.countShaders == 5 then   love.graphics.setShader(self.shader5)
    end
    love.graphics.rectangle("fill", self.player:getX() - W/2,self.player:getY() - H/2,W,H)
    love.graphics.setShader()
    love.graphics.setCanvas();


  end


  return ShangeBG
