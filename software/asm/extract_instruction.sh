#!/bin/bash

cat epuzzle_mips.S | grep -v "\." | grep -v ":" > instruction_list.txt
python instructions.py
rm instruction_list.txt
