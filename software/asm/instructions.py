#! /usr/bin/env python
import operator
import re


def read_instructions():
    opcode_str = re.compile("\t[a-z]*[\t\n]")
    with open('instruction_list.txt') as f:
        text = f.read()
        return opcode_str.finditer(text)
    return None


if __name__ == '__main__':
    instruction_freq = {}
    for insn in read_instructions():
        insn_str = insn.group(0)[1:-1]
        if insn_str in instruction_freq:
            instruction_freq[insn_str] += 1
        else:
            instruction_freq[insn_str] = 1
    r = sorted(instruction_freq.items(), key=operator.itemgetter(1))

    for x in r:
        print("| {} | {} | |".format(x[0], x[1]))
