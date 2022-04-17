import sys

filename = sys.argv[1]
with open(filename, 'r', encoding='iso-8859-1') as infile:
    for line in infile:
        line = line.replace('\n', ' ')
        sys.stdout.write(line)

