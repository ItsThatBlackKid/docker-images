#!/bin/bash

# Set Jupyter password using the provided environment variable
if [ -n "$JUPYTER_PASSWORD" ]; then
    echo "Setting Jupyter password..."
    jupyter notebook password <<EOF
$JUPYTER_PASSWORD
$JUPYTER_PASSWORD
EOF
else
    echo "No JUPYTER_PASSWORD environment variable set. Using default password."
fi