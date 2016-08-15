+++
categories = ["celery", "distributed systems"]
date = "2016-08-16T00:40:22+05:30"
keywords = []
title = "celery"

+++

Recently I came across this distributed task queue 'Celery', which we started using for some our heavy lifting jobs. 
Celery does the job well, if you get your head around it. 
Configuring celery is really simple (caveat doc's are sparse). 
Celery works using broker and backend, the broker keeps track of the tasks in the backend. 
Broker can be RabbitMQ or Redis or which ever you prefer. 

I'll organise my thoughts about celery and post a detailed note about it soon.