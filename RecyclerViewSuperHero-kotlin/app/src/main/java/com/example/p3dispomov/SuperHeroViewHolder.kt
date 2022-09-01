package com.example.p3dispomov

import android.view.View
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import android.widget.Toast
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.example.p3dispomov.databinding.ItemSuperheroBinding

class SuperHeroViewHolder(view: View) :RecyclerView.ViewHolder(view){

val binding = ItemSuperheroBinding.bind(view)
    val superHero = view.findViewById<TextView>(R.id.tvSuperHeroName)
    val realName = view.findViewById<TextView>(R.id.tvRealName)
    val publisher = view.findViewById<TextView>(R.id.tvPublisher)
    val photo = view.findViewById<ImageView>(R.id.ivSuperHero)

    val btndeleted = view.findViewById<Button>(R.id.btnDelete)
    fun render (
        SuperHeroModel: SuperHero,
        onClickListener: (superHero: SuperHero) -> Unit,
        onClickDeleted: (Int) -> Unit,

        ) {
        superHero.text = SuperHeroModel.superhero
        realName.text = SuperHeroModel.realName
        publisher.text = SuperHeroModel.publisher
        binding.ivSuperHero.setOnClickListener { onClickListener(SuperHeroModel) }


        btndeleted.setOnClickListener { onClickDeleted(adapterPosition) }



        //binding.ivSuperHero.setOnClickListener{onSuperHeroClicked(absoluteAdapterPosition)}
        Glide.with(photo.context).load(SuperHeroModel.photo).into(photo)

    }


}