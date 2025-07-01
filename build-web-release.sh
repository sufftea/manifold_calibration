#! /bin/bash

flutter build web --base-href "/manifold_calibration/"
rm docs/* -rf
cp build/web/* docs/ -rf
