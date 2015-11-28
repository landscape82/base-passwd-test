#!/bin/sh

../base-passwd/update-passwd -P passwd -p passwd.master -G group -g group.master -S shadow -L "$@"

