package com.example.p3dispomov

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.ImageView
import com.bumptech.glide.Glide
import com.example.p3dispomov.databinding.ActivitySuperHeroDetailBinding
import kotlinx.android.synthetic.main.activity_main.view.*
import kotlinx.android.synthetic.main.activity_super_hero_detail.*
import kotlinx.android.synthetic.main.activity_super_hero_detail.view.*
import kotlinx.android.synthetic.main.item_superhero.view.*

class SuperHeroDetail : AppCompatActivity() {

    lateinit var binding: ActivitySuperHeroDetailBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_super_hero_detail)



        RealNameDetails.text = getIntent().getStringExtra("RealName")


        SuperHeroDetail.text = getIntent().getStringExtra("descripcion")

     //   val photo = getIntent().getIntExtra("photo")

   // AvatarDetail.setImageResource(photo)


        //AvatarDetail.setImageResource(getIntent().getStringExtra("photo").toInt())

//val AvatarDetail : ImageView = findViewById(R.id.AvatarDetail)
//val foto = intent.getIntExtra("photo")

  //      AvatarDetail.setImageResource(foto)




    }
}

