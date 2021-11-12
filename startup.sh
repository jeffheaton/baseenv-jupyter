#!/bin/bash

if [[ -z "${PASSWORD}" ]]; then
  /root/miniconda/bin/jupyter lab --allow-root --no-browser --ip 0.0.0.0 
else
  /root/miniconda/bin/jupyter lab --allow-root --no-browser --ip 0.0.0.0 --ServerApp.password=$PASSWORD 
fi
