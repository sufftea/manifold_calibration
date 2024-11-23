#! /bin/bash

flutter build web --web-renderer canvaskit --base-href "/manifold_calibration/"
cp build/web/* docs/ -r
