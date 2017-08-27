  local ground = {}




  function ground:new(x,y,count)
  local public  = {}
  local private = {}

  private.x = x or 0;
  private.y = y or 0
  private.count = count or 1

  --массив обЪектов
  private.objectsPlus = {}
  private.objectsMinus = {}

  --создание первого обЪекта
  local object = {}
  object.w = RandomGenerator:random(W*0.01,W*0.06)
  object.h = RandomGenerator:random(W*0.01,W*0.06)
  object.color = {math.random(0,255),math.random(0,255),math.random(0,255),math.random(0,255)}
  object.body = love.physics.newBody(world, private.x, private.y - object.h,"kinematic")
  object.shape = love.physics.newRectangleShape(object.w, object.h)
  object.fixture = love.physics.newFixture(object.body, object.shape,1)
  object.fixture:setUserData("groundPl 0")
  table.insert(private.objectsPlus,object)
  table.insert(private.objectsMinus,object)


  --получение X последнего положительного объекта
  function public:getLastPlusX()
  return private.objectsPlus[#private.objectsPlus].body:getX()
  end


  --получение X последнего отрицательного объекта
  function public:getLastMinusX()
  return private.objectsMinus[#private.objectsMinus].body:getX()
  end


  --функция создания блоков вправо
  function public:addPlus(count)
     for i=1,count do
       local ground = {}
       ground.y = RandomGenerator:random(private.y - RandomGenerator:random(0,W*0.4),private.y + RandomGenerator:random(0,W*0.4))
       ground.w = RandomGenerator:random(W*0.01,W*0.06)
       ground.h = RandomGenerator:random(W*0.01,W*0.06)
       ground.color = {RandomGenerator:random(0,255),RandomGenerator:random(0,255),RandomGenerator:random(0,255),RandomGenerator:random(20,255)}
       ground.body = love.physics.newBody(world, self:getLastPlusX() + ground.w*i, ground.y,"kinematic")
       ground.shape = love.physics.newRectangleShape(ground.w, ground.h)
       ground.fixture = love.physics.newFixture(ground.body, ground.shape,1)
       ground.fixture:setUserData("groundPl "..i)
       table.insert(private.objectsPlus,ground)
     end
  end


  --функция создания блоков влево
  function public:addMinus(count)
     for i=1,count do
       local ground = {}
       ground.y = RandomGenerator:random(private.y - RandomGenerator:random(0,W*0.4),private.y + RandomGenerator:random(0,W*0.4))
       ground.w = RandomGenerator:random(W*0.03,W*0.06)
       ground.h = RandomGenerator:random(W*0.03,W*0.06)
       ground.color = {RandomGenerator:random(0,255),RandomGenerator:random(0,255),RandomGenerator:random(0,255),RandomGenerator:random(20,255)}
       ground.body = love.physics.newBody(world, self:getLastMinusX() - ground.w*i, ground.y,"kinematic")
       ground.shape = love.physics.newRectangleShape(ground.w, ground.h)
       ground.fixture = love.physics.newFixture(ground.body, ground.shape,1)
       ground.fixture:setUserData("groundMi "..i);
       table.insert(private.objectsMinus,ground)
     end
  end


  public:addPlus(private.count)


  function public:update(dt)

  end

  function public:draw()
    for i,ground in ipairs(private.objectsMinus) do
       love.graphics.setColor(unpack(ground.color))
       love.graphics.polygon("fill",ground.body:getWorldPoints(ground.shape:getPoints()))
    end
    for i,ground in ipairs(private.objectsPlus) do
       love.graphics.setColor(unpack(ground.color))
       love.graphics.polygon("fill",ground.body:getWorldPoints(ground.shape:getPoints()))
    end
  end


  function public:getBeginX()
  return private.objectsMinus[#private.objectsMinus].body:getX()
  end





  setmetatable(public,self)
  self.__index = self;
  return public
  end






  return ground
