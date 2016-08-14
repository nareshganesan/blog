+++
categories = ["Tornado", "Server"]
date = "2016-01-23T05:34:27-08:00"
keywords = []
title = "Tornado"

+++

Tornado is a asynchronous non blocking network I/O web framework / library. Tornado is really useful for applications which require a long-lived connection to each user.
It can easily serve upto Ten's of thousands of open connection at a time. It can also comes bundled with a HTTP server which makes it perfect for a web server which could 
easily serve tens of thousands of connections. This really a huge deal, if you have dealt with synchronous blocking servers. In a typical synchrous web servers, the 
client has to wait for the request to complete and the server is blocked until the response is sent back to client. 

As the number of request to synchronous servers increase, the number of blocked requests waiting for a response increases. This makes the web servers 
overloaded with requests and eventually making them crash. In traditional web application using synchronous web servers, companies make another 
load balancing layer to route the request to different servers based on the servers traffic. The crucial point to note here is the architecture of the 
web application is made to accomodate more traffic by adding more web servers coupled with load balancers. Here, the traditional synchronous servers have some serious 
bottleneck with handling huge traffic.

With the advent of Web 3.0, data is exploding in higher order polynomial terms which I can't imagine. The need to handle more web traffic would be a basic requirement.
Tornado is a next gen networking library to test and play. 
 
