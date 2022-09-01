package com.example.p3dispomov

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView

class SuperHeroAdapter(private val superheroList: List<SuperHero>,private val onClickListener:(superHero: SuperHero)->Unit ,private val onClickDeleted:(Int)->Unit): RecyclerView.Adapter<SuperHeroViewHolder>() {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): SuperHeroViewHolder {


        val layoutInflater = LayoutInflater.from(parent.context)
        return SuperHeroViewHolder(layoutInflater.inflate(R.layout.item_superhero, parent, false))



    }

    override fun onBindViewHolder(holder: SuperHeroViewHolder, position: Int) {
        val item = superheroList[position]
        holder.render(item, onClickListener, onClickDeleted)

    }




    override fun getItemCount(): Int {


        return superheroList.size
    }
  //  inner class ViewHolder(binding: ItemSuperheroBinding): RecyclerView.ViewHolder(binding.root),
   //     View.OnClickListener{
    //        val idView : TextView = binding.tvSuperHeroName
     //   val contentView : TextView = binding.tvRealName

     //   override fun toString(): String         {
       //     return super.toString() +"a"+contentView.text+ "s"
      //  }

        //override fun onClick(v: View?) {
          //  TODO("Not yet implemented")
        //}
    }

