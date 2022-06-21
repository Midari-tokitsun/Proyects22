package com.example.AdivColor

import AdivColor.R
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button

class Instrucciones : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.instrucciones)
        var regresar= findViewById<Button>(R.id.btnRegresar)

        regresar.setOnClickListener {
        var intent = Intent(this,MainActivity::class.java)
        startActivity(intent)
        }

    }

}