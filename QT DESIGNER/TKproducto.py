
import tkinter as tk
from tkinter import ttk
from tkinter import messagebox as mb
from tkinter import scrolledtext as st
from producto import producto


class FrmProductos:
    def __init__(self):
        self.ventana1 = tk.Tk()
        self.ventana1.title("Mantenimiento de productos")
        self.cuaderno1 = ttk.Notebook(self.ventana1)
        self.cuaderno1.grid(column=0, row=0, padx=10, pady=10)
        self.cuaderno2 = ttk.Notebook(self.ventana1)
        self.cuaderno2.grid(column=1, row=0, padx=10, pady=10)
        self.guardar_producto()
        self.ventana1.mainloop()
    
    def guardar_producto(self):
        self.pagina1 = ttk.Frame(self.cuaderno1)
        self.cuaderno1.add(self.pagina1, text="Nuevo Producto")
        self.lblframe1 = ttk.LabelFrame(self.pagina1, text="Producto")
        self.lblframe1.grid(column=0, row=0, padx=5, pady=5)
        
        self.lblcodigo = ttk.Label(self.lblframe1, text="Codigo: ")
        self.lblcodigo.grid(column=0, row=0, padx=5, pady=5)
        self.vcodigo = tk.StringVar()
        self.txtcodigo = ttk.Entry(self.lblframe1, textvariable=self.vcodigo)
        self.txtcodigo.grid(column=1, row=0, padx=5, pady=5)

        self.lbldescripcion = ttk.Label(self.lblframe1, text="Descripción: ")
        self.lbldescripcion.grid(column=0, row=1, padx=5, pady=5)
        self.vdescripcion = tk.StringVar()
        self.txtdescripcion = ttk.Entry(self.lblframe1, textvariable=self.vdescripcion)
        self.txtdescripcion.grid(column=1, row=1, padx=5, pady=5)

        self.lblprecio = ttk.Label(self.lblframe1, text="Precio: ")
        self.lblprecio.grid(column=0, row=2, padx=5, pady=5)
        self.vprecio = tk.StringVar()
        self.txtprecio = ttk.Entry(self.lblframe1, textvariable=self.vprecio)
        self.txtprecio.grid(column=1, row=2, padx=5, pady=5)

        self.lblunidad = ttk.Label(self.lblframe1, text="Unidad: ")
        self.lblunidad.grid(column=0, row=3, padx=5, pady=5)
        self.vunidad = tk.StringVar()
        self.txtunidad = ttk.Entry(self.lblframe1, textvariable=self.vunidad)
        self.txtunidad.grid(column=1, row=3, padx=5, pady=5)

        self.boton1 = ttk.Button(self.lblframe1, text="Confirmar", command=self.agregar)
        self.boton1.grid(column=1, row=4, padx=4, pady=4)
    
    def agregar(self):
        datos = [self.vcodigo.get(), self.vdescripcion.get(), self.vprecio.get(), self.vunidad.get()]
        p1 = producto()
        p1.guardar(datos)
        mb.showinfo("Información", "Los datos fueron cargados.")
    
    def listado_completo(self):
        self.pagina2 = ttk.Frame(self.cuaderno2)
        self.cuaderno2.add(self.pagina1, text="Listado de Productos")


prod1 = FrmProductos()
