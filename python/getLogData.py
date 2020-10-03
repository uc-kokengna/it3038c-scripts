import os

filename = "C:\it3038c-scripts\testfile"

while open(filename) as f:
    lines = set(f.read().splitlines())
    for l in lines:
        print(l)