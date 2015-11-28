#!/bin/sh

git reset HEAD
git ls-files -o | xargs rm -f
git checkout -- .

