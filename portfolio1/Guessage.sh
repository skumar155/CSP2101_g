#!/bin/bash

# Kumar Sandesh (10484820)


# Generating a random number between 20 to 70 to store in age variable
(( age = RANDOM % 20 + 50 ))

echo "Age successfully generated!"
echo "let's start"
echo "Now it's your turn to guess the age of person"

#Using while loop end for user to guess the correct age
while (( age != GuessAge )); do
    
    read -p "Please enter the age here: " GuessAge
        if (( "$GuessAge" > "$age" )); then
                echo "Too high.."
        elif (( "$GuessAge" < "$age" )); then
                echo "Too low.."
        fi
done

#User need to guess the correct age to get the below echos statements
echo "Correct ! Weldone, You guess the correct age"
echo "and that's comes to end of the game."
echo "Thankyou for playing"
echo "Game Over !" 