import mysql.connector

class producto:
    def abrir(self):
        conexion = mysql.connector.connect(host="localhost",
                                        database="ujcv_iii_progra1",
                                        user="root",
                                        passwd=""   
                                            )
        return conexion


    def guardar(self,datos):

        cone = self.abrir()
        cursor= cone.cursor()
        sql="insert into productos(Procodigo,ProDescripcion,ProPrecio,Unidad) values(%s,%s,%s,%s)"
        cursor.execute(sql,datos)
        cone.commit()
        cone.close()

    def editar (self, datos):
        cone=self.abrir()
        cursor=cone.cursor()
        sql="update productos set ProDescripcion=%s,ProPrecio=%s, Unidad=%s where Procodigo=%s "
        cursor.execute(sql,datos)
        cone.commit()
        cone.close()

    def eliminar (self, codigo):
        cone=self.abrir()
        cursor=cone.cursor()
        sql="delete from productos where ProCodigo=%s"
        cursor.execute(sql,codigo)
        cone.commit()
        cone.close()
    
    def consultar_uno (self, datos):
        cone=self.abrir()
        cursor=cone.cursor()
        sql="select * from productos where ProCodigo=%s"
        cursor.execute(sql,datos)
        cone.close()
        return cursor.fetchall()

    def consultar_todos (self):
        cone=self.abrir()
        cursor=cone.cursor()
        sql="select * from productos"
        cursor.execute(sql)
        datos=cursor.fetchall()
        cone.close()
        return datos
