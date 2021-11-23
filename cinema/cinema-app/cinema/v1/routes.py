# -*- coding: utf-8 -*-

###
### DO NOT CHANGE THIS FILE
### 
### The code is auto generated, your change will be overwritten by 
### code generating.
###
from __future__ import absolute_import

from .api.cinemas import Cinemas
from .api.cinemas_cinema_id import CinemasCinemaId
from .api.cinemas_cinema_id_snacks import CinemasCinemaIdSnacks
from .api.cinemas_cinema_id_movies import CinemasCinemaIdMovies
from .api.cinemas_cinema_id_movies_movie_id import CinemasCinemaIdMoviesMovieId
from .api.cinemas_cinema_id_movies_movie_id_timeslots import CinemasCinemaIdMoviesMovieIdTimeslots
from .api.cinemas_cinema_id_movies_movie_id_timeslots_timeslot_id import CinemasCinemaIdMoviesMovieIdTimeslotsTimeslotId


routes = [
    dict(resource=Cinemas, urls=['/cinemas'], endpoint='cinemas'),
    dict(resource=CinemasCinemaId, urls=['/cinemas/<int:cinema_id>'], endpoint='cinemas_cinema_id'),
    dict(resource=CinemasCinemaIdSnacks, urls=['/cinemas/<int:cinema_id>/snacks'], endpoint='cinemas_cinema_id_snacks'),
    dict(resource=CinemasCinemaIdMovies, urls=['/cinemas/<int:cinema_id>/movies'], endpoint='cinemas_cinema_id_movies'),
    dict(resource=CinemasCinemaIdMoviesMovieId, urls=['/cinemas/<int:cinema_id>/movies/<int:movie_id>'], endpoint='cinemas_cinema_id_movies_movie_id'),
    dict(resource=CinemasCinemaIdMoviesMovieIdTimeslots, urls=['/cinemas/<int:cinema_id>/movies/<int:movie_id>/timeslots'], endpoint='cinemas_cinema_id_movies_movie_id_timeslots'),
    dict(resource=CinemasCinemaIdMoviesMovieIdTimeslotsTimeslotId, urls=['/cinemas/<int:cinema_id>/movies/<int:movie_id>/timeslots/<int:timeslot_id>'], endpoint='cinemas_cinema_id_movies_movie_id_timeslots_timeslot_id'),
]