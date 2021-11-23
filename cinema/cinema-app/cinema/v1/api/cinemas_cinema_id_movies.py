# -*- coding: utf-8 -*-
from __future__ import absolute_import, print_function

from flask import request, g, make_response
import mysql.connector
import json

from . import Resource
from .. import schemas


class CinemasCinemaIdMovies(Resource):

    def get(self, cinema_id):
        mydb = mysql.connector.connect(
            host="chatbotdb",
            user="root",
            password="secret",
            database="chatbotdb"
        )
        cursor = mydb.cursor()
        cursor.execute("SELECT distinct(m.title), s.studioId, m.movieId, m.description, s.type FROM cinema c, studio s, timeslot t, movie m WHERE c.cinemaId = s.cinema and t.studio = s.studioId and t.movie = m.movieId and c.cinemaId = '%d' ORDER BY m.title ASC;" % cinema_id)
        row_headers=[x[0] for x in cursor.description] #this will extract row headers
        results = cursor.fetchall()
        json_data=[]
        for result in results:
            json_data.append(dict(zip(row_headers,result)))
        cursor.close()
        return make_response(json.dumps(json_data))