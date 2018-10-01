-- Title: MovingObjects
-- Name: Sascha Motz
-- Course: ICS2O
-- This program moves a beetleship across the screen and then makes it fade out.

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--global variables
scrollSpeed = 3

-- background image with width and height
local beetleship = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

--set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

--Function: MoveShip
-- Input: this function accepts and event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip (event)
	--add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	-- change the transparency of the ship every time it moves so that it fades out
	beetleship.alpha = beetleship.alpha + 0.01
end

--MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

--------------------------------------------------------------------------------------------

-- character image with width and height
local star = display.newImageRect("Images/star.png", 500, 500)

-- set the image to be transparent
star.alpha = 0

--set the initial x and y position of star
star.x = 400
star.y = display.contentHeight/3

--Function: MoveStar
-- Input: this function accepts and event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the star
local function MoveStar (event)
	--add the scroll speed to the x-value of the star
	star.x = star.x + scrollSpeed + 5
	-- change the transparency of the star every time it moves so that it fades out
	star.alpha = star.alpha + 0.01
end

--MoveStar will be called over and over again
Runtime:addEventListener("enterFrame", MoveStar)

---------------------------------------------------------------------------------
