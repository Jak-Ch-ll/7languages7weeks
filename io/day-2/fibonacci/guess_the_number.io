tries := 10
min := 1
max := 100

getRandomNumber := method(min, max,
    date := Date now

    float := date asNumber - date asNumber floor

    ((max - min + 1) * float + min) floor
)

goal := getRandomNumber(min, max)
lastDiff := nil

"Guess the number between #{min} and #{max}" interpolate println
tries repeat(
    if(tries > 1,
        "You've got #{tries} tries left" interpolate println,
        "Your last try! You can do it!" println
    )
    guess := CLI lineReader readLine asNumber

    if(guess isNan,
        "Please guess only numbers" println
        continue
    )

    if(guess == goal, break)

    diff := (guess - goal) abs

    lastDiff ifNonNil(
        if(diff < lastDiff) then(
            "Hotter!" println
        ) elseif(diff > lastDiff) then(
            "Colder!" println
        )
    ) 

    lastDiff = diff
    tries = tries - 1
)

if(tries > 0,
    "Congratulations, you've found the number! It was #{goal}!" interpolate println,
    "Sorry, but you did not find #{goal} in time :(" interpolate println
)

