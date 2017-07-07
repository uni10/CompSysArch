#!/bin/bash

cat epuzzle.S | grep -v "\." | grep -v ":" > instruction_list.txt
python instructions.py
rm instruction_list.txt
