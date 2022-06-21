package com.example.AdivColor

import AdivColor.R
import android.content.Intent
import android.graphics.Color
import android.graphics.Typeface
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView
import androidx.core.content.ContextCompat
import kotlinx.android.synthetic.main.activity_question.*


class Preguntas : AppCompatActivity() {


    private var puntos:Int=0

    private var posicion:Int=1
    private var listasDepreguntas:ArrayList<DatosPreguntas> ? = null
    private var opcionelegida:Int=0
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_question)




        listasDepreguntas=preguntasyrespuestas.preguntar()

        setQuestion()

        opt_1.setOnClickListener{

            opciones(opt_1,1)
            pregunta.setBackgroundColor(Color.parseColor("#FB0000"))

        }
        opt_2.setOnClickListener{

            opciones(opt_2,2)
            pregunta.setBackgroundColor(Color.parseColor("#7200FD"))

        }
        opt_3.setOnClickListener{

            opciones(opt_3,3)
            pregunta.setBackgroundColor(Color.parseColor("#FF000000"))
        }
        opt_4.setOnClickListener{

            opciones(opt_4,4)
            pregunta.setBackgroundColor(Color.parseColor("#00FF00"))
        }

        enviar.setOnClickListener {
            if(opcionelegida!=0)
            {
                val question=listasDepreguntas!![posicion-1]
                if(opcionelegida!=question.respuesta)
                {

                }else{

                    puntos++
               }
               (posicion==listasDepreguntas!!.size)


            }else{
                posicion++
                when{
                    posicion<=listasDepreguntas!!.size->{
                        setQuestion()
                    }
                    else->{
                       var intent= Intent(this,Resultados::class.java)

                        intent.putExtra(preguntasyrespuestas.score,puntos.toString())
                        intent.putExtra("total size",listasDepreguntas!!.size.toString())

                        startActivity(intent)
                        finish()
                    }
                }
            }
            opcionelegida=0
        }

    }




    fun setQuestion(){

        val question = listasDepreguntas!![posicion-1]
        setOptionStyle()



        preguntatxt.setBackgroundColor(Color.parseColor(question.pregunta))
        preguntatxt.text=question.question
        opt_1.text=question.opcion1
        opt_2.text=question.opcion2
        opt_3.text=question.opcion3
        opt_4.text=question.opcion4


    }

    fun setOptionStyle(){
        var optionList:ArrayList<TextView> = arrayListOf()
        optionList.add(0,opt_1)
        optionList.add(1,opt_2)
        optionList.add(2,opt_3)
        optionList.add(3,opt_4)

        for(op in optionList)
        {
           op.setTextColor(Color.parseColor("#555151"))

           op.background=ContextCompat.getDrawable(this,R.drawable.question_option)
            op.typeface= Typeface.DEFAULT
        }

    }

   fun opciones(view:TextView,opt:Int){

       setOptionStyle()
        opcionelegida=opt
       view.background=ContextCompat.getDrawable(this, R.drawable.selected_question_option)
        view.typeface= Typeface.DEFAULT_BOLD
        view.setTextColor(Color.parseColor("#FF6200EE"))

    }
}