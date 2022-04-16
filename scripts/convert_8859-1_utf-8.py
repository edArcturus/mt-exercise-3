import sys

filename = sys.argv[1]
outfilename = filename.replace('.txt', '_utf8.txt')
with open(filename, 'r', encoding='iso-8859-1') as infile, \
     open(outfilename, 'w', encoding='utf-8') as outfile:
    for line in infile:
        outfile.write(line)

