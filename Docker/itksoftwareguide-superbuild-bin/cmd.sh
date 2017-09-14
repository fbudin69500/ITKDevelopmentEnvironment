#!/bin/sh

cd /home/itk/bin
mkdir -p ITKSoftwareGuide
cd ITKSoftwareGuide
cmake \
  -DITKSoftwareGuide_SUPERBUILD:BOOL=ON \
  -DDRAFT_WATERMARK:BOOL=OFF \
  /home/itk/src/ITKSoftwareGuide
make
