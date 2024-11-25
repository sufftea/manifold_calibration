#! /bin/bash

flutter build web --web-renderer canvaskit --base-href "/manifold_calibration/"
rm docs/* -rf
cp build/web/* docs/ -rf
