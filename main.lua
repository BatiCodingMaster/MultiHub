function love.load()
    love.window.setTitle("But is it possible with accurate hitboxes!?")
    love.window.setMode(800, 600, {resizable=true, vsync=0, minwidth=400, minheight=300})
    player = {}
    player.x = 400
    player.y = 200
    player.sprite = love.graphics.newImage("Sprites/Player.png")
    geo = love.graphics.newImage("Sprites/geo.png")
    background = {}
    background.sprite = love.graphics.newImage("Sprites/Background.png")
    camera = require "Libraries/camera"
    cam = camera()
    background.width = background.sprite:getWidth()
    background.height = background.sprite:getHeight()

    sounds = {}
    sounds.bgmusic = love.audio.newSource("Audio/09-Lancer.wav", "stream")
    sounds.bgmusic:setLooping(true)
    sounds.bgmusic:setVolume(0.3)
    sounds.bgmusic:play()
    font = love.graphics.newFont(14)
    love.graphics.setFont(font)
end

function love.update(dt)
    if love.keyboard.isDown("right") then
        player.x = player.x + 1
    end
    if love.keyboard.isDown("left") then
        player.x = player.x - 1
    end
    if love.keyboard.isDown("up") then
        player.y = player.y - 1
    end
    if love.keyboard.isDown("down") then
        player.y = player.y + 1
    end
    cam:lookAt(player.x, player.y)

    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()

    if cam.x < w/2 then
        cam.x = w/2
    end
    if cam.y < h/2 then
        cam.y = h/2
    end

    local mapW = background.width
    local mapH = background.height

    if cam.x > (mapW - w/2) then
        cam.x = (mapW - w/2)
    end
    if cam.y > mapH - h/2 then
        cam.y = (mapH - h/2)
    end
end

function love.draw()
    cam:attach()
        love.graphics.draw(background.sprite, 0, 0)
        love.graphics.draw(geo, 100, 300)
        love.graphics.print("İs it possible with accurate hitboxes!?", 100, 300)
        love.graphics.draw(player.sprite, player.x, player.y)
    cam:detach()

end