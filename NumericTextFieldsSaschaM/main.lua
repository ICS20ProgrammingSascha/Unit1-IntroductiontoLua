-- Title: NumericTextFields
-- Name: Sascha Motz
-- Course: ICS2O
-- This program displays a math question and asks the user to answer in a numeric textfield.
-- terminal.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets the background colour
display.setDefault("background", 255/255, 153/255, 255/255)

--------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
--------------------------------------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local correctSounds
local score = 0
local scoreObject

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

local function AskQuestion()

	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(10,20)
	randomNumber2 = math.random(10,20)
	randomOperator = math.random(1,3)

	-- Set the 1st random operator to addition
	if ( randomOperator == 1) then

		correctAnswer = randomNumber1 + randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1.. " + " ..  randomNumber2 .. " = "

	-- Set the 2nd random operator to subtraction
	elseif ( randomOperator == 2) then

		correctAnswer = randomNumber1 - randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1.. " - " ..  randomNumber2 .. " = "

	-- Set the 3rd random operator to multiplication
	elseif ( randomOperator == 3) then

		correctAnswer = randomNumber1 * randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1.. " * " ..  randomNumber2 .. " = "
	end
	
end

-- function to display/hide correct object
local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

-- function to display/hide incorrect object
local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

-----------------------------------------------------------------
-- SOUNDS
----------------------------------------------------------------

-- Correct sound
local correctSound = audio.loadSound("Sounds/correctSound.mp3" ) 
-- Setting a variable to an mp3 file
local correctSoundChannel

-- Incorrect sound
local incorrectSound = audio.loadSound("Sounds/incorrectSound.mp3" ) 
-- Setting a variable to an mp3 file
local incorrectSoundChannel


local function NumericFieldListener(event)

	-- User begins editing "numericField"
	if ( event.phase == "began" ) then

		-- clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then

		--when the answer is submitted (eneter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

			-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			correctSoundChannel = audio.play(correctSound)
			timer.performWithDelay(2000, HideCorrect)
			score = score + 1

			-- Display the score
			scoreObject.text = "Score:" .. score
			
		else
			incorrectObject.isVisible = true
			incorrectSoundChannel = audio.play(incorrectSound)
			timer.performWithDelay(2000, HideIncorrect)
		end

		--clear text field
		event.target.text = ""
	end
end


--------------------------------------------------------------------------------------------
-- OBJECT CREATION
--------------------------------------------------------------------------------------------

-- display a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 55 )
questionObject:setTextColor(0,255, 0,255, 0,255)

-- display the score and sets the colour
scoreObject = display.newText( "Score:" .. score , display.contentWidth/2, display.contentHeight/3, nil, 60 )
scoreObject:setTextColor(0,255, 0,255, 255,255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(0,255, 255,255, 0,255)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible
incorrectObject = display.newText( "Incorrect! Nice Try!", display.contentWidth/2, display.contentHeight*2/3, nil, 110)
incorrectObject:setTextColor(255,255, 0,255, 0,255)
incorrectObject.isVisible = false

-- Create the numeric field
numericField = native.newTextField( display.contentWidth/1.7, display.contentHeight/2, 200, 110 )
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

--------------------------------------------------------------------------------------------
-- FUNCTION CALLS
--------------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()