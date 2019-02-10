module.exports = (robot) ->

  robot.hear /Do I have a class today/i, (res) ->
    todayDate = new Date()
    if todayDate.getDay() is 1 or todayDate.getDay() is 3
      res.reply "Yes you have JS class at 6 p.m"
    else 
      res.reply "No you don't have class today"
    
#################################################################

  robot.hear /what is the weather today in (.*)/i,(res) ->
    city = res.match[1]
    robot.http("https://api.openweathermap.org/data/2.5/weather?q=#{city},sa&appid=d984ed8edfa31a7d6343c8f202b9f676")
        .header('Accept', 'application/json')
        .get() (err, resp, body) ->
          # error checking code here
          
          data = JSON.parse body
          if data.cod == '404'
            res.reply "Please make sure the city name is spelled correctly "
            return
          tem = data.main.temp - 273.15
          minTem = data.main.temp_min - 273.15
          maxTem = data.main.temp_max - 273.15
          humidity = data.main.humidity

          res.reply "The weather in #{city}: \n Temperature: #{tem} C \n Minimum Temperature: #{minTem} C \n Maximum Temperature: #{maxTem} C \n Humedity: #{humidity} "
         
 #################################################################
 
  jokes = ['There was once a young man who, in his youth, professed a desire to become a "great" writer. When asked to define "great" he said "I want to write stuff that the whole world will read, stuff that people will react to on a truly emotional level, stuff that will make them scream, cry, howl in pain, desperation, and anger!" He now works for Microsoft writing error messages.' , 'What does an air conditioner have in common with a computer? They both lose efficiency as soon as you open windows.' , 'Why use Linux: No Windows, no Gates, no Bill to pay.' , 'There are 10 types of people in the world: those who understand binary, and thos who dose not']
  robot.respond /tell me a joke/i, (res) ->
   res.reply res.random jokes