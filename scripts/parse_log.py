import sys 
import re

table = open(sys.argv[1])
print('epoch,batch,from,lr,ms/batch,loss,perplexity')
line_num = 1
for line in table:

    if line.startswith('| epoch'):
        line_num += 1
        # cells = line.split('|')[1:]
        # for i in range(len(cells)):
        #     cells[i] = cells[i].strip()
        #     cells[i] = cells[i].split()
        # print(cells)
        if line_num % 3 == 0:
            numbers = re.findall(r'[\d\.]+', line)  
            print(*numbers, sep=',')

        

