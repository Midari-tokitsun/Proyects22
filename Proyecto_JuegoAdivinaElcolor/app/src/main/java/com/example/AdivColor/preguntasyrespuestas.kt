package com.example.AdivColor

object preguntasyrespuestas {


    const val score:String="score"

   fun preguntar():ArrayList<DatosPreguntas>{
       var lista:ArrayList<DatosPreguntas> = arrayListOf()

       var question1 = DatosPreguntas(
           1,
           "¿Qué Color es?",

           "Rojo",
           "Morado",
           "Negro",
           "Verde",
           1,
       "#FB0000"
       )
       var question2 = DatosPreguntas(
           2,
           "¿Qué Color es?",

           "Rojo",
           "Morado",
           "Negro",
           "Verde",
           2,
           "#7200FD"
       )
       var question3 = DatosPreguntas(
           3,
           "¿Qué Color es?",

           "Rojo",
           "Morado",
           "Negro",
           "Verde",
           4,
           "#00FF00"
       )
       var question4 = DatosPreguntas(
           4,
           "¿Qué Color es?",

           "Rojo",
           "Morado",
           "Negro",
           "Verde",
           1,
           "#FB0000"
       )

       var question5 = DatosPreguntas(
           5,
           "¿Qué Color es?",

           "Rojo",
           "Morado",
           "Negro",
           "Verde",
           2,
           "#7200FD"
       )

       var question6 = DatosPreguntas(
           6,
           "¿Qué Color es?",

           "Rojo",
           "Morado",
           "Negro",
           "Verde",
           4,
           "#00FF00"
       )

       var question7 = DatosPreguntas(
           7,
           "¿Qué Color es?",

           "Rojo",
           "Morado",
           "Negro",
           "Verde",
           3,
           "#FF000000"
       )

       var question8 = DatosPreguntas(
           8,
           "¿Qué Color es?",

           "Rojo",
           "Morado",
           "Negro",
           "Verde",
           2,
           "#7200FD"
       )

       var question9 = DatosPreguntas(
           9,
           "¿Qué Color es?",

           "Rojo",
           "Morado",
           "Negro",
           "Verde",
           3,
           "#FF000000"
       )

       var question10 = DatosPreguntas(
           10,
           "¿Qué Color es?",

           "Rojo",
           "Morado",
           "Negro",
           "Verde",
           4,
           "#00FF00"
       )



       lista.add(question1)
       lista.add(question2)
       lista.add(question3)
       lista.add(question4)
       lista.add(question5)
       lista.add(question6)
       lista.add(question7)
       lista.add(question8)
       lista.add(question9)
       lista.add(question10)

       return lista
   }
}