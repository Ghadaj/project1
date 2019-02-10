# myhubot

myhubot is a chat bot built on the [Hubot][hubot] framework. It check if you have a class today, give you weather info of the city, it even tell you a joke if you asked for it!. 

### Running myhubot Locally

You can test your hubot by running the following, however some plugins will not
behave as expected unless the [environment variables](#configuration) they rely
upon have been set.

You can start myhubot locally by running:

    % bin/hubot


Then you can interact with myhubot by typing `myhubot help`.

    myhubot> myhubot help
    myhubot animate me <query> - The same thing as `image me`, except adds [snip]
    myhubot help - Displays all of the help commands that myhubot knows about.
    ...


### Scripting

myhubot respond to three questions:

1- "what is the weather today in {city}" this will return a message with the weather information. If the city name spelled wrong it will ask you to enter the correct name. 
It uses openWeather map API to retrieve the weather information of the selected city.  


2- "do I have a class today" this will return the message "Yes you have a class today at 6 p.m" if it is Monday or Wednesday, else will return "No you don't have a class today".
It checks the day number of the week and return the correct response.

3- "tell me a joke" this message will return a random joke from an array of jokes. you have to mention the hubot in the message if you are in a room and not in a private chat.

## Deployment

    % heroku create --stack cedar
    % git push heroku master


