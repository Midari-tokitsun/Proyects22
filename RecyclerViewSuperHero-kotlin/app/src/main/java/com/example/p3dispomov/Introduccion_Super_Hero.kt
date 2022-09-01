package com.example.p3dispomov

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button

class Introduccion_Super_Hero : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_introduccion_superhero)
        val BtnInicio = findViewById<Button>(R.id.empezar)


        BtnInicio.setOnClickListener{
            intent = Intent(this,MainActivity::class.java)
            startActivity(intent)

        }



    }
}