# -*- coding: utf-8 -*-
from __future__ import absolute_import, print_function

from flask import request, g

from . import Resource
from .. import schemas


class CinemasCinemaId(Resource):

    def get(self, cinema_id):
        mydb = mysql.connector.connect(
            host="chatbotdb",
            user="root",
            password="secret",
            database="chatbotdb"
        )
        cursor = mydb.cursor()
        cursor.execute("SELECT * FROM cinema WHERE cinema.id='%d';" % cinema_id)
        row_headers=[x[0] for x in cursor.description] #this will extract row headers
        results = cursor.fetchall()
        json_data=[]
        for result in results:
            json_data.append(dict(zip(row_headers,result)))
        cursor.close()
        return make_response(json.dumps(json_data))