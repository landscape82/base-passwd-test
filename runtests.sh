#!/bin/sh

program=../base-passwd/update-passwd

for t in test-*; do
    echo ">>>> RUNNING: $t"
    mkdir -p testrun
    rm -rf testrun/*
    cp -f "$t"/* testrun/
    "$program" -P testrun/passwd -p testrun/passwd.master -G testrun/group -g testrun/group.master -S testrun/shadow -L "$@"
    failed=0
    diff -u testrun/passwd.expected testrun/passwd || failed=1
    diff -u testrun/group.expected testrun/group || failed=1
    diff -u testrun/shadow.expected testrun/shadow || failed=1
    [ "$failed" != 0 ] && exit 1
done

echo SUCCESS.

