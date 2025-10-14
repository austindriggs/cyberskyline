import gmpy2

e = 43
p = 83    # add p here
q = 13    # add q here
n = p*q

c= [
996,
894,
379,
631,
894,
82,
379,
852,
631,
677,
677,
194,
893
]
phi=(p-1)*(q-1)

d= gmpy2.invert(e, phi)
print(d)

for i in c:
	m=pow(i, d, n)
	print(chr(m))

print("")
