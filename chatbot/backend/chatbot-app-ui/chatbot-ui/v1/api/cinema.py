import requests

def showCinemas():
  result = requests.get('http://127.0.0.1:5001/v1/cinemas')
  resultJson = result.json()
  return resultJson

def showCinemaDetails(cinema):
  result = requests.get(f'http://127.0.0.1:5001/v1/cinemas?cinema={cinema}')
  resultJson = result.json()
  return resultJson[0] if len(resultJson) > 0 else []

def showCinemaSnacks(cinema, cinemaId):
  result = []
  if (cinemaId != ''):
    result = requests.get(f'http://127.0.0.1:5001/v1/cinemas/{cinemaId}/snacks')
  else:
    cinemaDetails = showCinemaDetails(cinema)
    if len(cinemaDetails) > 0:
      cid = cinemaDetails['cinemaId']
      result = requests.get(f'http://127.0.0.1:5001/v1/cinemas/{cid}/snacks')
  resultJson = result.json()
  return resultJson if len(resultJson) > 0 else "No Cinema found, please try with other name"

def showCinemaMovies(cinema, cinemaId):
  result = []
  if (cinemaId != ''):
    result = requests.get(f'http://127.0.0.1:5001/v1/cinemas/{cinemaId}/movies')
  else:
    cinemaDetails = showCinemaDetails(cinema)
    if len(cinemaDetails) > 0:
      cid = cinemaDetails['cinemaId']
      result = requests.get(f'http://127.0.0.1:5001/v1/cinemas/{cid}/movies')
  resultJson = result.json()
  return resultJson if len(resultJson) > 0 else "No Cinema found, please try with other name"