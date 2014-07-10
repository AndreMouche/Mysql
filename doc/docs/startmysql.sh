

#!/bin/bash

DATADIR=$1
PORT=$2

if [ "`ls -A $DATADIR`" = "" ]; then
    ./scripts/mysql_install_db --datadir=$DATADIR --basedir=. --user=mysql
fi 

./bin/mysqld --basedir=. \
  --datadir=./$DATADIR \
  --sock=./mysql.sock \
  --pid-file=./$DATADIR/mysqld.pid  \
  --port=$PORT \
  --lc-messages-dir=./share \
  --user=mysql \
  --binlog-format=ROW \
  --log-bin=master-bin \
  --enforce-gtid-consistency=true \
  --gtid-mode=ON \
  --log-slave-updates=true \
  --relay-log=mysqld-relay-bin
  --server-id=$2


