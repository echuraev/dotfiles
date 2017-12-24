#!/bin/bash

MAIL_ARRAY=(e-mail1@mail.com e-mail2@mail.com e-mail3@mail.com)

OLD_IP=

FROM_MAIL=email-from@mail.com
USER_NAME=email-from
USER_PASSWD=12345678

while true
do
    IP=`curl -s icanhazip.com`
    for I in ${MAIL_ARRAY[*]}
    do
        if [[ $OLD_IP != $IP ]]
        then
            echo $I
            sendemail -f $FROM_MAIL -t $I -u New IP address on ichuraev server! -m New IP is: $IP -s smtp.yandex.ru:25 -xu $USER_NAME -xp $USER_PASSWD -o message-content-type=text
        fi
    done
    if [[ -z $OLD_IP || $OLD_IP != $IP ]]
    then
        OLD_IP=$IP
    fi
    echo $IP
    echo $OLD_IP
    sleep 15m
done
