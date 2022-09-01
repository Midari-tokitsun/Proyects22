package com.example.proyecto

import android.graphics.Color
import android.view.View
import android.widget.ImageView
import android.widget.Switch
import android.widget.TextView
import androidx.appcompat.view.menu.MenuView
import androidx.recyclerview.widget.RecyclerView
import com.example.proyecto.model.PeliculaUIModel
import com.example.proyecto.model.genero

class PeliculaViewHolder(itemView: View,
                         private val imageLoader: ImageLoader
) : RecyclerView.ViewHolder(itemView) {
    private val txtNombre: TextView by lazy { itemView.findViewById(R.id.txtNombre)}
    private val txtGenero: TextView by lazy { itemView.findViewById(R.id.txtGenero)}
    private val txtDuracion: TextView by lazy { itemView.findViewById(R.id.txtDuracion)}
    private val txtFecha: TextView by lazy { itemView.findViewById(R.id.txtFecha)}
    private val txtDescripcion : TextView by lazy { itemView.findViewById(R.id.txtDescripcion)}
    private val txtTitulo_Original : TextView by lazy { itemView.findViewById(R.id.txtTitulo_Original)}
    private val imvImagen: ImageView by lazy { itemView.findViewById(R.id.imvPelicula)}
    private val txtDirector: TextView by lazy { itemView.findViewById(R.id.txtDirector)}

    fun enlazarDatos(datos: PeliculaUIModel){
        imageLoader.ImageLoader(datos.urlImagen, imvImagen)
        txtNombre.text = datos.titulo
        txtDescripcion.text = datos.descripcion
        txtGenero.text = when(datos.genero){
            genero.Accion -> "Accion"
            genero.Aventura -> "Aventura"
            genero.CienciaFiccion -> "Ciencia Ficcion"
            genero.Crimen -> "Crimen"
            genero.Drama -> "Drama"
            genero.Fantasia -> "Fantasia"
            genero.Misterio -> "Misterio"
            genero.Suspenso -> "Suspenso"
            genero.Animacion -> "Animación"
            genero.Belica -> "Belica"
            genero.Comedia -> "Comedia"
            genero.Romance -> "Romance"
            genero.Terror -> "Terror"
        }
        txtDuracion.text = datos.duracion
        txtFecha.text = datos.fecha
        txtTitulo_Original.text = datos.titulo_original
        txtDirector.text = datos.director

    }
}
