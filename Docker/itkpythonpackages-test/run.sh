#!/bin/bash

docker run --rm -v $1:/pythonpackages --name itkpythonpackages-test insighttoolkit/itkpythonpackages-test
