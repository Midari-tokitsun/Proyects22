package com.example.proyecto

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.example.proyecto.model.PeliculaUIModel

class PeliculaAdapter(
    private val layoutInflater: LayoutInflater,
    private val imageLoader: ImageLoader
) : RecyclerView.Adapter<PeliculaViewHolder>() {

    private val datos = mutableListOf<PeliculaUIModel>()

    fun enlazarDato(datosNuevos : List<PeliculaUIModel>){
        datos.clear()
        datos.addAll(datosNuevos)
        notifyDataSetChanged()
    }



    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): PeliculaViewHolder {
        val view = layoutInflater.inflate(R.layout.item_pelicula,parent, false)
        return PeliculaViewHolder(view, imageLoader)
    }

    override fun onBindViewHolder(holder: PeliculaViewHolder, position: Int) {
        holder.enlazarDatos(datos[position])
    }

    override fun getItemCount(): Int {
        return datos.size
    }
}