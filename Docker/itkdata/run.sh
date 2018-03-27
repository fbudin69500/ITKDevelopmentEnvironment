#!/bin/bash

docker run --rm -v $1:/tmp/data --name itkdata insighttoolkit/itkdata

