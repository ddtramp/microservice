#!/bin/bash
# test into dood
docker run --rm -w /mnt -v /opt/jenkins_slave_home/workspace/composite-service/event-composite-service:/mnt:rw gradle/java gradle clean test
