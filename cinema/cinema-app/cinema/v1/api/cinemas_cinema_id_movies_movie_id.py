# -*- coding: utf-8 -*-
from __future__ import absolute_import, print_function

from flask import request, g

from . import Resource
from .. import schemas


class CinemasCinemaIdMoviesMovieId(Resource):

    def get(self, cinema_id, movie_id):

        return [], 200, None