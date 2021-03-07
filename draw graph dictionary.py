from tkinter import *
import json
import string
fp = open("dictionary.txt","r",encoding="utf-8")
result = json.load(fp)
fp.close()
window = Tk()
canvas = Canvas(window, width=600, height=500)
canvas.pack()
rects=[]
count={x.upper():0 for x in string.ascii_lowercase}
for k,v in result.items():
    if len(k)>0 and k[0] in count :
        count[k[0]] += 1

print (count)

l = list(count.keys())
print(l)

class Rectangle:
    def __init__(self, canvas, i):
        self.order = l.index(i)
        self.R = 0
        self.G = 0
        self.B = 255
        self.i = i
        self.height = count[i]/25
        self.name = i
        self.canvas=canvas
    def draw(self):
        x0=20 * self.order+15
        y0=500
        x1=20 * self.order+20
        y1=500-self.height
        self.canvas.create_rectangle(x0,y0,x1,y1,
            fill="#%02x%02x%02x" %(self.R, self.G,self.B), tag=self.name)
        self.canvas.create_text(x0, y1-20, text=str(i))
        self.canvas.create_text(x0, y1 - 10, text= str(count[i]))
for i in l:
    print(i)
    rects.append(Rectangle(canvas, i))
    rects[-1].draw()
    canvas.after(20)
    canvas.update()

window.mainloop()