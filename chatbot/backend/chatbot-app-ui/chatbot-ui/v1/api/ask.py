# -*- coding: utf-8 -*-
from __future__ import absolute_import, print_function

from flask import request, g, make_response
import json

from . import Resource
from .. import schemas
from .wit import ask_wit


class Ask(Resource):

    def get(self):
        expression = g.args['expression']
        print(expression)
        response = ask_wit(expression)
        return make_response(json.dumps(response))