# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific aliases and functions

# Oracle env
export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=$ORACLE_BASE/product/11.2.0/client
export NLS_LANG=Japanese_Japan.JA16EUC
export PATH=$PATH:$ORACLE_HOME/bin
export LD_LIBRARY_PATH=$ORACLE_HOME/lib
export LANG=ja_JP.eucJP

export NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS'
export NLS_TIMESTAMP_FORMAT='YYYY-MM-DD HH24:MI:SSXFF'
export NLS_TIMESTAMP_TZ_FORMAT='YYYY-MM-DD HH24:MI:SSXFF TZR'
