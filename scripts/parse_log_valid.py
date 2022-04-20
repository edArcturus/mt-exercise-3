import sys
import re

table = open(sys.argv[1], 'r')

print('epoch,time,valid loss,valid ppl')
for line in table:
    if line.startswith('| end of epoch'):
        numbers = re.findall(r'[\d\.]+', line)
        print(*numbers, sep=',')


