  local player = {}


  function player:new(x,y,game)
  local public = {}
  local private = {}


  private.x = x or 0;
  private.y = y or 0;



  private.w = W*0.03
  private.h = W*0.03


  private.body = love.physics.newBody(world, private.x, private.y, "dynamic")
  private.shape = love.physics.newRectangleShape(private.w, private.h)
  private.fixture = love.physics.newFixture(private.body, private.shape)
  private.body:setFixedRotation(true)
  private.fixture:setUserData("player")
  function public:update(dt)
    --определение инерции
    private.vx, private.vy = private.body:getLinearVelocityFromWorldPoint(private.body:getX(),private.body:getY())
    --управление героем
    if love.keyboard.isDown("left") and private.vx > -W*0.23 or love.keyboard.isDown("a") and private.vx > -W*0.23 then
    private.body:applyLinearImpulse(-W*0.015,0)
    end
    if love.keyboard.isDown("right") and private.vx < W*0.23 or love.keyboard.isDown("d") and private.vx < W*0.23 then
    private.body:applyLinearImpulse(W*0.015,0)
    end
    if love.keyboard.isDown("up") and COLLISIONPLAYER and private.vy > -W*0.23 or love.keyboard.isDown("w") and COLLISIONPLAYER and private.vy > -W*0.23 then
    private.body:applyLinearImpulse(-0,-W*0.05)
    end
    if love.keyboard.isDown("down") and COLLISIONPLAYER and private.vy < W*0.13 or love.keyboard.isDown("s") and COLLISIONPLAYER and private.vy < W*0.13 then
    private.body:applyLinearImpulse(-0,W*0.05)
    end

     --проверка на падение
    if private.body:getY() > H*2 then
       private.body:setY(-H*0.5)
    end
  end





  function public:draw()
    love.graphics.setColor(255, 0, 0, 255)
    love.graphics.polygon("fill",private.body:getWorldPoints(private.shape:getPoints()))
  end



  function public:getX ()
    return private.body:getX()
  end

  function public:getY ()
    return private.body:getY()
  end

  function public:getUserData()
    return private.body:getUserData()
  end

  setmetatable(public,self);
  self.__index = self;
  return public
  end





  return player
