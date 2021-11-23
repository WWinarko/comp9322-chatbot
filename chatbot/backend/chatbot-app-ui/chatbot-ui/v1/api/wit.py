import requests
from .cinema import showCinemas, showCinemaDetails, showCinemaSnacks, showCinemaMovies
TOKEN = "Bearer DTQYCX4JMTZ4KYADWBDA2Y4MLZWDW5QD"

def ask_wit(expression):
  result = requests.get('https://api.wit.ai/message?v=20211122&q={}'.format(expression),
            headers={'Authorization': TOKEN})
  resultJson = result.json()
  print(resultJson)
  try:
    intent = resultJson['intents'][0]['name']
    if (intent == 'showCinemas'):
      movie = resultJson['entities']['movie:movie'][0]['value'] if 'movie:movie' in resultJson['entities'] else ''
      return {"type": intent, "message": showCinemas(movie)}
    elif (intent == 'showGreetings'):
      return {"type": intent, "message": "Hi there, Welcome to Cinema Booking Chatbot"}
    elif (intent == 'showCinemaDetails'):
      cinema = resultJson['entities']['cinema:cinema'][0]['value']
      return {"type": intent, "message": showCinemaDetails(cinema) if len(showCinemaDetails(cinema)) > 0 else "No Cinema found, please try with other name"}
    elif (intent == 'showCinemaSnacks'):
      cinema = resultJson['entities']['cinema:cinema'][0]['value'] if 'cinema:cinema' in resultJson['entities'] else ''
      cinemaId = resultJson['entities']['cinemaId:cinemaId'][0]['value'] if 'cinemaId:cinemaId' in resultJson['entities'] else ''
      return {"type": intent, "message": showCinemaSnacks(cinema, cinemaId)}
    elif (intent == 'showCinemaMovies'):
      cinema = resultJson['entities']['cinema:cinema'][0]['value'] if 'cinema:cinema' in resultJson['entities'] else ''
      cinemaId = resultJson['entities']['cinemaId:cinemaId'][0]['value'] if 'cinemaId:cinemaId' in resultJson['entities'] else ''
      return {"type": intent, "message": showCinemaMovies(cinema, cinemaId)}
        
  except Exception as e:
    return {"type":"unknown","message": "Sorry, I don't understand"}