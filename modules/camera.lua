  local camera = {}


  camera.speed = 200
  camera.scale = 1
  camera.screenW,camera.screenH = W / camera.scale,H / camera.scale
  function camera:update(dt,x,y)
  camera.x , camera.y = -math.floor(x - camera.screenW/2),-math.floor(y  - camera.screenH/2)
  end


  function camera:draw()
   love.graphics.scale(self.scale)
   love.graphics.translate(camera.x,camera.y)
  end


  return camera
