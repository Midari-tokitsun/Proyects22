package com.example.proyecto

import android.content.Context
import android.widget.ImageView
import com.bumptech.glide.Glide

class GladeImageLoader(private val context: Context) : ImageLoader{
    override fun ImageLoader(imgeUrl: String, imageview: ImageView) {
        Glide.with(context)
            .load(imgeUrl)
            .centerCrop()
            .into(imageview)


    }

}