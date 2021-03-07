t = ([1, 2, 3],[4, 5, 6])
print (t)
t[1][2]=999
print(t) #member of tuple could be immutable

y = 2, 3, "hello"
m, n, o = y
print(m)
print(n)
print(o)

j = tuple(i for i in range(1, 11))
print (type(j))
print(j)