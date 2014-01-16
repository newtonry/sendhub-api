#!/bin/bash
echo "Should respond with two routes"
curl -H "Accept: application/json" -X "Content-type: application/json" -X POST -d '{ "message":"SendHubRocks", "recipients":["5555555556","5555555555","5555555554","5555555553", "5555555552","5555555551"]}' http://sendhub-rvkn.herokuapp.com/messages

echo "Should respond with 3 routes"
curl -H "Accept: application/json" -X "Content-type: application/json" -X POST -d '{ "message":"SendHubRocks", "recipients":["5555555556","5555555555","5555555554","5555555553", "5555555552","5555555551","5555555556","5555555555","5555555554","5555555553", "5555555552","5555555551","5555555556","5555555555","5555555554","5555555553"]}' http://sendhub-rvkn.herokuapp.com/messages

echo "Should respond with a phone number error"
curl -H "Accept: application/json" -X "Content-type: application/json" -X POST -d '{ "message":"SendHubRocks", "recipients":["555555556","5555555555","5555555554","5555555553", "5555555552","5555555551"]}' http://sendhub-rvkn.herokuapp.com/messages

echo "Should respond with no message error"
curl -H "Accept: application/json" -X "Content-type: application/json" -X POST -d '{"recipients":["5555555556","5555555555","5555555554","5555555553", "5555555552","5555555551"]}' http://sendhub-rvkn.herokuapp.com/messages
