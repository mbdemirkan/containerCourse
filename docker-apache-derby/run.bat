REM docker build . -t derbydb

winpty docker run -it -p 1527:1527 --rm derbydb
