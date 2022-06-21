package com.example.AdivColor

import AdivColor.R
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import kotlinx.android.synthetic.main.activity_result.*

class Resultados : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_result)

        val score=intent.getStringExtra(preguntasyrespuestas.score)
        val totalQuestion=intent.getStringExtra("total size")

        felicidades.text="Fin del Juego !!"
        Score.text="${score} / ${totalQuestion}"
        button.setOnClickListener {
            startActivity(Intent(this,MainActivity::class.java))
            finish()
        }

    }
}