#bhap-1 | the Bad Hashing Algorithm in Python
#Pipe UTF-8 encoded text to STDIN to see the calculated bhap-1 hash sum
import sys
import math
def s1(t):
	t = int(t)
	n = 1
	x = 0
	y = 1
	while n <= t:
		n = n+1
		d = x+y
		x = y
		y = d
	return x
def s2(n):
    s = 0
    y = 0
    l = s1(50)
    for i in n:
        x = int(s1(ord(i)))
        y = y + x
        l = int(math.log10(x)+1)
        while l < 14:
       		x = x * 10
        	l = int(math.log10(x)+1)
    return y
def s0():
	n = 0
	g = int(100000000000000)
	y0 = y1 = y2 = y3 = y4 = int(0)
	l = s1(51)
	for i in sys.stdin:
		n = (n+1) % 5
		if n == 0:
			x0 = s2(i)
			y0 = (y0 + x0) % g
		elif n == 1:
			x1 = s2(i)
			y1 = (y1 + x1) % g
		elif n == 2:
			x2 = s2(i)
			y2 = (y2 + x2) % g
		elif n == 3:
			x3 = s2(i)
			y3 = (y3 + x3) % g
		elif n == 4:
			x4 = s2(i)
			y4 = (y4 + x4) % g
	if y1 == 0:
		print('Please input some data')
		exit(233)
	if y2 == 0:
		y2 = y1 * 2 % g
	if y3 == 0: 
		y3 = y2 * 3 % g
	if y4 == 0:
		y4 = y3	* 5 % g
	if y0 == 0:
		y0 = y4 * 8 % g
	y0 = y0 ^ y1 ^ y2 ^ y3 * y4 % g
	y1 = y1 ^ y2 ^ y3 ^ y4 * y0 % g
	y2 = y2 ^ y3 ^ y4 ^ y0 * y1 % g
	y3 = y3 ^ y4 ^ y0 ^ y1 * y2 % g
	y4 = y4 ^ y0 ^ y1 ^ y2 * y3 % g
	print(hex((((y0*g+y1)*g+y2)*g+y3)*g+y4))
s0()