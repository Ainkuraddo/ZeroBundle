#!/bin/bash
cd "$(dirname "$0")/../../../"
if [ -d "Ainkuraddo" ]; then
    cd Ainkuraddo
    bash ../Python/python start.py
else
    ./Python/python -m zerobundle.run "https://github.com/Ainkuraddo/Ainkuraddo;https://gitlab.com/Ainkuraddo/Ainkuraddo;https://try.gogs.io/Ainkuraddo/Ainkuraddo" $SCRIPT "$@"
fi
exit 0
