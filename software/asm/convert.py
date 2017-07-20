#! /usr/bin/env python

import sys
import re


class Compile(object):
    def __init__(self, filename, data_label, got):
        self.label = {}
        self.instructions = []
        self.filename = filename
        self.data_label = data_label
        self.got = got
        self.counter = 0
        self.def_instruction = {
            "lw": self.itype,
            "sw": self.itype,
            "add": self.rtype,
            "addi": self.itype,
            "j": self.jtype,
            "addiu": self.itype,
            "move": self.inst_move,
            "li": self.inst_li,
            "lui": self.itype,
            "or": self.rtype,
            "ori": self.itype,
            "addu": self.rtype,
            "bne": self.itype,
            "nop": self.inst_nop,
            "sll": self.rtype,
            "b": self.inst_b,
            "beq": self.itype,
            "movz": self.rtype,
            "slt": self.rtype,
            "slti": self.itype,
            "sltiu": self.itype,
            "and": self.rtype,
            "sltu": self.rtype,
            "jr": self.rtype,
            "bltz": self.itype,
            "blez": self.itype,
            "bgez": self.itype,
        }

        self.opcode_table = {
            "lw": {"opcode": 0b100011},
            "sw": {"opcode": 0b101011},
            "add": {"opcode": 0b000000, "func": 0b100000, "sa": 0b00000},
            "addu": {"opcode": 0b000000, "func": 0b100000, "sa": 0b00000},
            "addi": {"opcode": 0b001000},
            "addiu": {"opcode": 0b001000},
            "or": {"opcode": 0b000000, "func": 0b100101, "sa": 0b00000},
            "ori": {"opcode": 0b001101},
            "sll": {"opcode": 0b000000, "func": 0b000000, "rs": 0b00000},
            "beq": {"opcode": 0b000100},
            "bne": {"opcode": 0b000101},
            "bltz": {"opcode": 0b000001, "rt": 0b00000},
            "blez": {"opcode": 0b000110, "rt": 0b00000},
            "bgez": {"opcode": 0b000001, "rt": 0b00001},
            "j": {"opcode": 0b000010},
            "move": {"opcode": 0b000000, "func": 0b000110, "sa": 0b00000},
            "movz": {"opcode": 0b000000, "func": 0b001010, "sa": 0b00000},
            "lui": {"opcode": 0b001111},
            "slt": {"opcode": 0b000000, "func": 0b101010, "sa": 0b00000},
            "sltu": {"opcode": 0b000000, "func": 0b101011, "sa": 0b00000},
            "slti": {"opcode": 0b001010},
            "sltiu": {"opcode": 0b001011},
            "and": {"opcode": 0b000000, "func": 0b100100, "sa": 0b00000},
            "jr": {"opcode": 0b000000, "func": 0b001000, "sa": 0b00000, "rt": 0b00000, "rd": 0b00000},
        }

        self.reg = {"${}".format(i): i for i in range(32)}
        self.reg["$sp"] = 29
        self.reg["$fp"] = 30

    def parse(self, filename):
        inst_l = []
        with open(filename) as f:
            while True:
                r = f.readline()
                if r:
                    inst_l.append([x for x in re.split(
                        '[\t, \n]*', r) if len(x) > 0])
                else:
                    break
        return inst_l

    def insert_instruction(self, b_inst):
        print("{0:x}: {1}".format(self.counter, b_inst))
        self.instructions.append(b_inst)
        self.counter += 4

    def conv_ngative(self, num, length):
        if num >= 0:
            return num
        else:
            return (1 << length) + num

    def rtype(self, inst):
        opcode, rs, rt, rd, sa, func = self.decode_rtype(inst)
        print("R-Type: {}".format(inst))
        print("opcode: {}, rs: {}, rt: {}, rd: {}, sa: {}, func: {}".format(opcode, rs, rt, rd, sa, func))
        b_inst = int("{0:06b}{1:05b}{2:05b}{3:05b}{4:05b}{5:06b}".format(opcode, rs, rt, rd, sa, func), 2)
        self.insert_instruction("{0:08x}".format(b_inst))

    def decode_rtype(self, inst):
        inst_info = self.opcode_table[inst[0]]
        opcode = inst_info["opcode"]
        func = inst_info["func"]

        if "jr" == inst[0]:
            rt = inst_info["rt"]
            rd = inst_info["rd"]
            sa = inst_info["sa"]
            rs = inst[1]
        elif "sltu" == inst[0] or "slt" == inst[0]:
            sa = inst_info["sa"]
            rd = self.reg[inst[1]]
            rs = self.reg[inst[2]]
            rt = self.reg[inst[3]]
        elif "rs" in inst_info:
            rs = inst_info["rs"]
            rd = self.reg[inst[1]]
            rt = self.reg[inst[2]]
            sa = int(inst[3])
        elif "sa" in inst_info:
            sa = inst_info["sa"]
            rd = self.reg[inst[1]]
            rs = self.reg[inst[2]]
            rt = self.reg[inst[3]]
        else:
            print(inst)
            raise ValueError("Unknown instruction")

        return opcode, rs, rt, rd, sa, func

    def itype(self, inst):
        inst_info = self.opcode_table[inst[0]]
        opcode = inst_info["opcode"]
        rt, rs, offset = self.decode_itype(inst)

        print("I-Type: {}".format(inst))
        print("rs: {}, rt: {}, offset: {}".format(rs, rt, offset))
        b_inst = int("{0:06b}{1:05b}{2:05b}{3:016b}".format(opcode, rs, rt, offset), 2)
        self.insert_instruction("{0:08x}".format(b_inst))

    def decode_itype(self, inst):
        if inst[0] == "lw" or inst[0] == "sw":
            target = [x for x in re.split('[()]', inst[2]) if len(x) > 0]
            if target[0] == "%got":
                imm = self.data_label[target[1]][1]
                return (self.reg[inst[1]], self.reg[target[2]], imm)
            else:
                imm = self.conv_ngative(int(target[0]), 16)
                return (self.reg[inst[1]], self.reg[target[1]], imm)
        elif inst[0] == "lui":
            rs = 0
            rt = self.reg[inst[1]]
            imm = int(inst[2])
        elif inst[0] == "beq" or inst[0] == "bne":
            rs = self.reg[inst[1]]
            rt = self.reg[inst[2]]
            offset = self.label[inst[3]] - self.counter - 1
            offset /= 4
            print("target address: {0:x}, current address: {1:x}".format(self.label[inst[3]], self.counter))
            imm = self.conv_ngative(offset, 16)
        elif inst[0] == "blez" or inst[0] == "bltz" or inst[0] == "bgez":
            inst_info = self.opcode_table[inst[0]]
            rt = inst_info["rt"]
            rs = self.reg[inst[1]]
            offset = self.label[inst[2]] - self.counter - 1
            offset /= 4
            print("target address: {0:x}, current address: {1:x}".format(self.label[inst[2]], self.counter))
            imm = self.conv_ngative(offset, 16)
        else:
            rt = self.reg[inst[1]]
            rs = self.reg[inst[2]]
            imm = self.conv_ngative(int(inst[3]), 16)
        return rt, rs, imm

    def jtype(self, inst):
        inst_info = self.opcode_table[inst[0]]
        opcode = inst_info["opcode"]
        instr_index = self.label[inst[1]] / 4
        print("J-Type: {}".format(inst))
        print("opcode: {}, instr_index: {}".format(opcode, instr_index))
        b_inst = int("{0:06b}{1:026b}".format(opcode, instr_index), 2)
        self.insert_instruction("{0:08x}".format(b_inst))

    def inst_move(self, inst):
        replace_inst = ["addi", inst[1], inst[2], "0"]
        self.def_instruction[replace_inst[0]](replace_inst)

    def inst_li(self, inst):
        imm = self.conv_ngative(int(inst[2], 10), 32)
        imm_high = (imm & (0xFFFF << 16)) >> 16
        imm_low = imm & 0xFFFF
        print("value: {}, {}".format(int(inst[2]), hex(imm)))
        print("high: {}, {}".format(hex(imm_high), imm_high))
        print("low: {}, {}".format(hex(imm_low), imm_low))
        replace_inst = ["lui", inst[1], str(imm_high)]
        self.def_instruction[replace_inst[0]](replace_inst)
        replace_inst = ["ori", inst[1], inst[1], str(imm_low)]
        self.def_instruction[replace_inst[0]](replace_inst)

    def inst_nop(self, inst):
        self.insert_instruction("{0:08x}".format(0x0))

    def inst_b(self, inst):
        replace_inst = ["beq", "$0", "$0", inst[1]]
        self.def_instruction[replace_inst[0]](replace_inst)

    def run(self):
        self.counter = 0
        instruction_list = self.parse(self.filename)
        for instruction in instruction_list:
            if len(instruction) == 0:
                continue
            if ":" in instruction[0]:
                self.label[instruction[0][:-1]] = self.counter
            else:
                self.counter += 4
                if instruction[0] == "li":
                    self.counter += 4

        for x in self.label:
            print("{} {}".format(x, self.label[x]))

        self.counter = 0
        for instruction in instruction_list:
            if len(instruction) == 0:
                continue
            if ":" in instruction[0]:
                continue
            else:
                self.def_instruction[instruction[0]](instruction)

        for instruction in self.instructions:
            print(instruction)

        with open("imem.dat", "w") as f:
            for instruction in self.instructions:
                    f.write(instruction + '\n')


class CompileDmem(object):
    def __init__(self, filename):
        self.label = {}
        self.filename = filename

    def parse(self, filename):
        var_list = []
        with open(filename) as f:
            while True:
                r = f.readline()
                if r:
                    var_list.append([x for x in re.split(
                        '[\t \n]*', r) if len(x) > 0])
                else:
                    break
        return var_list

    def number(self, val):
        if val >= 0:
            return "{0:08x}".format(val)
        else:
            return "{0:08x}".format((1 << 32) + val)

    def run(self):
        address = 0
        var_list = self.parse(self.filename)

        with open("dmem.dat", "w") as f:
            for var in var_list:
                if len(var) == 0:
                    continue
                if ":" in var[0]:
                    self.label[var[0][:-1]] = [address, 0]
                else:
                    if var[0] == ".space":
                        address += int(var[1])
                        for i in range(int(var[1]) / 4):
                            f.write("0" * 8 + '\n')
                    elif var[0] == ".word":
                        f.write(self.number(int(var[1])) + '\n')
                        address += 4
            got = address
            for key in self.label:
                f.write(self.number(self.label[key][0]) + '\n')
                self.label[key][1] = address
                address += 4

        for key, value in sorted(self.label.iteritems(), key=lambda (k,v): (v,k)):
            print("{} {}".format(key, value))
        return self.label, got


if __name__ == '__main__':
    if len(sys.argv) < 3:
        raise ValueError('The number of arguments must be grater than 2.')

    data_label, got = CompileDmem(sys.argv[2]).run()
    Compile(sys.argv[1], data_label, got).run()
