# -*- coding: utf-8 -*-
from __future__ import absolute_import, print_function

from flask import request, g, make_response
import mysql.connector
import json

from . import Resource
from .. import schemas


class Cinemas(Resource):
    def get(self):
        movie = g.args['movie']
        cinema = g.args['cinema']
        mydb = mysql.connector.connect(
            host="chatbotdb",
            user="root",
            password="secret",
            database="chatbotdb"
        )
        cursor = mydb.cursor()
        if (cinema != ''):
            cursor.execute("SELECT * FROM cinema WHERE cinema.name like '%s';" % cinema)
        elif (movie != ''):
            cursor.execute("SELECT DISTINCT(c.cinemaId), c.name, c.address, c.phone FROM cinema c, studio s, timeslot t, movie m WHERE c.cinemaId = s.cinema and t.studio = s.studioId and t.movie = m.movieId and m.title like '%s' ORDER BY c.cinemaId ASC;" % movie)
        else:
            cursor.execute("SELECT * from cinema;")
        row_headers=[x[0] for x in cursor.description] #this will extract row headers
        results = cursor.fetchall()
        json_data=[]
        for result in results:
            json_data.append(dict(zip(row_headers,result)))
        cursor.close()
        return make_response(json.dumps(json_data))