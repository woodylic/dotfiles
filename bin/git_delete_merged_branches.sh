#!/bin/bash

git branch --merged | egrep -v "(^\*|master|develop)" | xargs -n 1 git branch -d