#!/bin/bash
#
# WordPress 用データベース作成スクリプト
#
# - データベース名とユーザーとパスワードは同一
# - MySQL データベース名にハイフンは NG
#
DB_NAME="$1"

if [ -z "${DB_NAME}" ]; then
  echo "DB_NAME is empty."
  exit 1
fi

mysql -u root <<EOF
create database ${DB_NAME};
grant all privileges on ${DB_NAME}.* to "${DB_NAME}"@"localhost" identified by "${DB_NAME}";
flush privileges;
show databases;
EOF
