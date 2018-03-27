#!/bin/bash

export WORKON_HOME=/venv
mkdir ${WORKON_HOME}

source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

for p in 2.7 3.5 3.6;
do
  cd /pythonpackages
  python${p} /tmp/get-pip.py
  mkvirtualenv -p python${p} test_itk
  python${p} -m pip install numpy
  minor="${p##*.}"
  major="${p%.*}"
  if [[ ${major} == 2 ]]; then
    mu='mu'
  else
    mu='m'
  fi
  python${p} -m pip install --no-index itk-4.13.0-cp${major}${minor}-cp${major}${minor}${mu}-manylinux1_x86_64.whl itk_numerics-4.13.0-cp${major}${minor}-cp${major}${minor}${mu}-manylinux1_x86_64.whl itk_core-4.13.0-cp${major}${minor}-cp${major}${minor}${mu}-manylinux1_x86_64.whl itk_registration-4.13.0-cp${major}${minor}-cp${major}${minor}${mu}-manylinux1_x86_64.whl itk_filtering-4.13.0-cp${major}${minor}-cp${major}${minor}${mu}-manylinux1_x86_64.whl itk_segmentation-4.13.0-cp${major}${minor}-cp${major}${minor}${mu}-manylinux1_x86_64.whl itk_io-4.13.0-cp${major}${minor}-cp${major}${minor}${mu}-manylinux1_x86_64.whl

  cd /work/ITKExamples-build/ITKEx-build
  cmake -DPYTHON_EXECUTABLE:FILEPATH=${WORKON_HOME}/test_itk/bin/python -DBUILD_TESTING:BOOL=ON .
  ctest -R Python
  
  rmvirtualenv test_itk 
done

