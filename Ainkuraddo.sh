#!/bin/bash
cd "$(dirname "$0")"
if [ x$DISPLAY != x ] || [[ "$OSTYPE" == "darwin"* ]]; then
    # Has gui, open browser
    SCRIPT="start.py"
else
    # No gui
    SCRIPT="ainkuraddo.py"
fi

if [ -d "Ainkuraddo" ]; then
    cd "$(dirname "$0")/Ainkuraddo"
    ../Python/python $SCRIPT "$@"
else
    ./Python/python -m zerobundle.run "https://github.com/Ainkuraddo/Ainkuraddo;https://gitlab.com/Ainkuraddo/Ainkuraddo;https://try.gogs.io/Ainkuraddo/Ainkuraddo" $SCRIPT "$@"
fi
