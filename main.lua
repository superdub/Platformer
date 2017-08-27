
  function love.load()
    W,H = love.graphics.getWidth(),love.graphics.getHeight()
    love.physics.setMeter(W*0.05)
    world = love.physics.newWorld(0, 9.8 * 30)
    world:setCallbacks(beginContact, endContact, preSolve, postSolve)
    RandomGenerator = love.math.newRandomGenerator(os.time())
    --флаг коллизии с игроком
    COLLISIONPLAYER = false
    Info =               require "modules.info"
    Ground =           require "modules.ground"
    Camera =           require "modules.camera"
    Player =           require "modules.player"
    Generation =   require "modules.generation"
    ShangeBG =       require "modules.shangeBG"
    GameState =         require "lib.gamestate"
    Game =            require "gamestates.game"
    Menu =            require "gamestates.menu"

    GameState.registerEvents();
    GameState.switch(Game)
  end



  --начало физического контакта
  function beginContact(a,b,coll)
    if a:getUserData() == "player" or b:getUserData() == "player" then
     COLLISIONPLAYER = true
    end
  end

  --конец физического контакта
  function endContact (a,b,coll)
    COLLISIONPLAYER = false
  end
