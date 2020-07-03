io.stdout:setvbuf('no')
if arg[#arg] == '-debug' then require('mobdebug').start() end
--love.graphics.setDefaultFilter('nearest')

math.randomseed(love.timer.getTime())

love.window.setTitle('Flanker Task')
love.window.setMode(1024,768)

height = love.graphics.getHeight()
width = love.graphics.getWidth()
c = 0 -- compteur temps
i = 0 -- compteur tour
iLoop = 0
n = 1
rT = 0 -- temps de réponse
startTask = false
addition = false
goodAnswer = false
wrongAnswer = true

if goodAnswer == true then
  wrongAnswer = false
end
if wrongAnswer == true then
  goodAnswer = false
end


-- t1 = apparition de l'image, t2 = appui sur la touche
t1 = 0
t2 = 0
--files = {}

file = io.open("saves/savedFile.txt", "a")
file:write("New Session", "\n")

function love.load()
  whitescreen = love.graphics.setBackgroundColor(255,255,255)
  love.graphics.setColor(0,0,0)
  Font = love.graphics.newFont("richela_kids/Richela Kids Font by Keithzo (7NTypes).otf",20)
  love.graphics.setFont(Font)
  mid = math.random(1,2)
  elem = {}
  elem[0] = math.random(1,2)
  elem[1] = math.random(1,2)
  elem[2] = math.random(1,2)
  elem[3] = math.random(1,2)
  arrow = love.graphics.newImage("images/black-arrow.png")
  redcross = love.graphics.newImage("images/red_cross.png")
  blackcross = love.graphics.newImage("images/black_cross.png")
  greencross = love.graphics.newImage("images/green_cross.png")
end
function love.update(dt)
  
  if startTask == true then
  -- compteur 1 sec
    
   --[[ if addition == true then
      if iLoop < 2 then
        c1 = love.timer.getTime()
        
      end
      c2 = love.timer.getTime()
      if dt > 0.033 then
        if c2 >= c1 + 2 then
          addition = false
          iLoop = 0
        end
      else
        if c2 >= c1 + 1 then
          addition = false
          iLoop = 0
        end
      end
    end
    if addition == false then
      if iLoop < 1 then
        c1 = love.timer.getTime()
      end
      c2 = love.timer.getTime()
      if dt > 0.033 then
        if c2 >= c1 + 4 then
          addition = true
          mid = math.random(1,2)
          local n 
          for n = 0, #elem do
            elem[n] = math.random(1,2)
          end
          iLoop = 0
          i = i + 1
        end
      else  
        if c2 >= c1 + 2 then
          addition = true
          mid = math.random(1,2)
          local n 
          for n = 0, #elem do
            elem[n] = math.random(1,2)
          end
          iLoop = 0
          i = i + 1
        end
      end
    end
    iLoop = iLoop + 1
    ]]
    if addition == true then
      if dt > 0.033 then  
        if c < (60*dt) * 2 then
          c = c + dt
        elseif c >= (60*dt) *2 then
          c = 0
          addition = false
          t1 = love.timer.getTime()
        end
      else
        if c < (60*dt) then
          c = c + dt
        elseif c >= (60*dt) then
          c = 0
          addition = false
          t1 = love.timer.getTime()
        end
      end
    end
    -- compteur 2 sec
    if addition == false then
      if dt > 0.033 then
        if c < (120*dt) *2 then
          c = c + dt
        elseif c >= (120*dt) *2 then
          c = 0
          addition = true
          mid = math.random(1,2)
          local n 
          for n = 0, #elem do
            elem[n] = math.random(1,2)
          end
          i = i + 1
        end
      else
        if c < (120*dt) then
          c = c + dt
        elseif c >= (120*dt) then
          c = 0
          addition = true
          mid = math.random(1,2)
          local n 
          for n = 0, #elem do
            elem[n] = math.random(1,2)
          end
          i = i + 1
        end
      end
    end
    
  end
  return t1, i, iLoop, c1, c2
end
function love.draw()
  if startTask == true then
    
    if addition == false then
    
      -- AFFICHAGE DES FLECHES 
      if elem[0] == 1 then
        love.graphics.draw(arrow, (width/2) - 50, height/2 ,0,0.1,0.1,arrow:getWidth()/2,arrow:getHeight()/2)
      elseif elem[0] == 2 then
        love.graphics.draw(arrow, (width/2) - 50, height/2 ,3.14,0.1,0.1,arrow:getWidth()/2,arrow:getHeight()/2)
      end
      if elem[1] == 1 then
        love.graphics.draw(arrow, (width/2) - 100, height/2 ,0,0.1,0.1,arrow:getWidth()/2,arrow:getHeight()/2)
      elseif elem[1] == 2 then
        love.graphics.draw(arrow, (width/2) - 100, height/2 ,3.14,0.1,0.1,arrow:getWidth()/2,arrow:getHeight()/2)
      end
      if elem[2] == 1 then
        love.graphics.draw(arrow, (width/2) + 50, height/2 ,0,0.1,0.1,arrow:getWidth()/2,arrow:getHeight()/2)
      elseif elem[2] == 2 then
        love.graphics.draw(arrow, (width/2) + 50, height/2 ,3.14,0.1,0.1,arrow:getWidth()/2,arrow:getHeight()/2)
      end
      if elem[3] == 1 then
        love.graphics.draw(arrow, (width/2) + 100, height/2 ,0,0.1,0.1,arrow:getWidth()/2,arrow:getHeight()/2)
      elseif elem[3] == 2 then
        love.graphics.draw(arrow, (width/2) + 100, height/2 ,3.14,0.1,0.1,arrow:getWidth()/2,arrow:getHeight()/2)
      end      
      
      if mid == 1 then
        love.graphics.draw(arrow, width/2  , height/2 ,0,0.1,0.1,arrow:getWidth()/2,arrow:getHeight()/2)
      elseif mid == 2 then
        love.graphics.draw(arrow, width/2  , height/2 ,3.14,0.1,0.1,arrow:getWidth()/2,arrow:getHeight()/2)
      end
    elseif addition == true then 
      if goodAnswer == true then
        love.graphics.setColor(255,255,255)
        love.graphics.draw(greencross, width/2 , height/2 + 50,0,0.1,0.1,blackcross:getWidth()/2,blackcross:getHeight()/2)

      elseif wrongAnswer == true then
        love.graphics.setColor(255,255,255)
        love.graphics.draw(redcross, width/2 , height/2 + 50,0,0.1,0.1,blackcross:getWidth()/2,blackcross:getHeight()/2)

      end
    end
  else
    love.graphics.print("Appuyer sur espace pour débuter le test", width/2 - 210, height/2,0,1.25,1.25)
  end
end
function love.keypressed(key)
  if key == ('space') then
    print(key)
    startTask = true
  end
  if startTask == true then
    local compteur = 0
    if key == ('left') and addition == false then
      --if c >= 1 then
        t2 = love.timer.getTime()
        rT = t2 - t1
        c = 2
        if mid == 1 then
          wrongAnswer = true
          goodAnswer = false
          if i > 0 then
            file:write(i," left ", rT, " Wrong ", "\n") -- "left", responseTime, tour n°x , "\n"
          end
        elseif mid == 2 then
          goodAnswer = true
          wrongAnswer = false
          if i > 0 then
            file:write(i," left ", rT, " Right ", "\n") -- "left", responseTime, tour n°x , "\n"
          end
        end
      --end
    elseif key == ('right') and addition == false then
      
      t2 = love.timer.getTime()
      rT = t2 - t1
      c = 2
      if mid == 1 then
        goodAnswer = true
        wrongAnswer = false
        if i > 0 then
          
          file:write(i," right ", rT, " Right ", "\n") -- "left", responseTime, tour n°x , "\n"        
        end  
      elseif mid == 2 then
        wrongAnswer = true
        goodAnswer = false 
        if i > 0 then
          
          file:write(i," right ", rT, " Wrong ", "\n") -- "left", responseTime, tour n°x , "\n"
        end
      end
    
    end
    
    if key == ('escape') then
      file:close()
      love.event.quit()
    end
  end
  
  return t2,rT
end