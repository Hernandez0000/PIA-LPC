from tkinter import *
from tkinter.ttk import *
from time import strftime

root = Tk()
root.title('Reloj')

def hora():
    datos = strftime('%I:%M:%S %p')
    label.config(text = datos)
    label.after(1000, hora)

label = Label(root, font = ('Arial', 60), padding = '50', background = 'green', foreground = 'black' )

label.pack(expand = True)
hora()
mainloop()
