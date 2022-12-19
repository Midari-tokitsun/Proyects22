import sys
from PyQt5 import uic
from PyQt5 import QtWidgets
from PyQt5.QtWidgets import QMainWindow,QApplication,QMessageBox
from producto import producto

class pyqt5(QMainWindow):
    def __init__(self):
        super().__init__()
        uic.loadUi("ejemplopyqt5.ui", self)
        self.BtnGuardar.clicked.connect(self.guardar)
        self.BtnEditar.clicked.connect(self.editar)
        self.BtnEliminar.clicked.connect(self.eliminar)
        self.llenar_tabla()



    def guardar(self):
        datos=[self.Txtcodigo.text(),self.TxtDescripcion.text(),self.TxtPrecio.text(),self.TxtUnidad.text()]# 
        p1=producto()
        p1.guardar(datos)
        self.llenar_tabla()
        msg=QMessageBox()
        msg.setIcon(QMessageBox.Information)
        msg.setText("Datos Guardados Correctamente")
        msg.exec()


    def eliminar(self):
        codigo=[self.Txtcodigo.text()]#
        p1= producto()
        p1.eliminar(codigo)
        self.llenar_tabla()
        msg=QMessageBox()
        msg.setIcon(QMessageBox.Information)
        msg.setText("Datos Eliminado Correctamente")
        msg.exec()


    def editar(self):
        datos=[self.TxtDescripcion.text(),self.TxtPrecio.text(),self.TxtUnidad.text(),self.Txtcodigo.text()]
        p1=producto()
        p1.editar(datos)
        self.llenar_tabla()
        msg = QMessageBox()
        msg.setIcon(QMessageBox.Information)
        msg.setText("datos Editado correctamente")
        msg.exec()


    def llenar_tabla(self):
        p1= producto()
        datos=p1.consultar_todos()
        fila=0
        
        self.Tbl_productos.setRowCount(0)        
        for registro in datos:
            self.Tbl_productos.insertRow(fila)
            self.Tbl_productos.setItem(fila,0,QtWidgets.QTableWidgetItem(str(registro[0])))
            self.Tbl_productos.setItem(fila,1,QtWidgets.QTableWidgetItem((registro[1])))
            self.Tbl_productos.setItem(fila,2,QtWidgets.QTableWidgetItem(str(registro[2])))
            self.Tbl_productos.setItem(fila,3,QtWidgets.QTableWidgetItem((registro[3])))
            fila+=1

if __name__=='__main__':
    app=QApplication(sys.argv)
    GUI=pyqt5()
    GUI.show()
    sys.exit(app.exec_())
