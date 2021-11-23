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
        else:
            cursor.execute("SELECT * from cinema;")
        row_headers=[x[0] for x in cursor.description] #this will extract row headers
        results = cursor.fetchall()
        json_data=[]
        for result in results:
            json_data.append(dict(zip(row_headers,result)))
        cursor.close()
        return make_response(json.dumps(json_data))