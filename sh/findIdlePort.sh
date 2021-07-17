#!/usr/bin/env bash
cd $(dirname $0)

function random_range {
    shuf -i $1-$2 -n1
}

function get_random_port {
    start_port=8000
    end_port=20000
    port=$(random_range $start_port $end_port)
    while [[ $(netstat -ntl | grep $port) != "" ]];do
        port=$(random_range $start_port $end_port)
    done
    echo $port
}
