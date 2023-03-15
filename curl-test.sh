#!/bin/bash
curl --request GET http://127.0.0.1:5000/api/timeline_post
curl --request POST http://127.0.0.1:5000/api/timeline_post -d 
'name=Rachel&email=rachelxiao907@gmail.com&content=trying curl'
curl --request GET http://127.0.0.1:5000/api/timeline_post

