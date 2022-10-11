#!/bin/bash
rm -fv logs/*
bin/zookeeper-server-start.sh config/zookeeper.properties