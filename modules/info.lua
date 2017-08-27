   local Info = {}


   Info.countBodies = 0;
   Info.fps = 0;
   function Info:draw()
   Info.countBodies = world:getBodyCount()
   love.graphics.setColor(255, 255, 255, 255)
   love.graphics.print("objects: "..self.countBodies + 1,0,0,0,1.5,1.5)
   love.graphics.print("fps: "..self.fps,0,15,0,1.5,1.5)
   end


   function Info:update(dt)
    self.fps = love.timer.getFPS()
   end

   return Info
