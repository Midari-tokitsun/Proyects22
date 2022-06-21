package com.example.AdivColor

import AdivColor.R
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button



class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val pinstrucciones = findViewById<Button>(R.id.button2)
        val jugar = findViewById<Button>(R.id.button)


        pinstrucciones.setOnClickListener {
            var intent = Intent(this,Instrucciones::class.java)

            startActivity(intent)
        }


        jugar.setOnClickListener {


                var intent = Intent(this,Preguntas::class.java)

                startActivity(intent)
                finish()
            }
        }
    }
