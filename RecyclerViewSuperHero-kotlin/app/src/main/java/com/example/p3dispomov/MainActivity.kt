package com.example.p3dispomov

import androidx.appcompat.app.AppCompatDelegate.MODE_NIGHT_NO
import android.content.Intent
import android.content.SharedPreferences
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.RelativeLayout
import android.widget.Switch
import android.widget.Toast
import androidx.appcompat.app.AppCompatDelegate
import androidx.appcompat.app.AppCompatDelegate.MODE_NIGHT_YES
import androidx.core.view.ViewCompat.setBackground
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.p3dispomov.databinding.ActivityMainBinding
import com.google.android.material.floatingactionbutton.FloatingActionButton
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.item_superhero.*

class MainActivity : AppCompatActivity() {

private var superheromutablelst:MutableList<SuperHero> = SuperHeroProvider.superheroList.toMutableList()
private lateinit var binding:ActivityMainBinding
private lateinit var adapter : SuperHeroAdapter







    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
            initRecyclerview()

val swtModo : Switch by lazy { findViewById(R.id.switch1) }


        val appSettingPrefs : SharedPreferences = getSharedPreferences("AppSettingPrefs",0)
    val SharedPrefedit : SharedPreferences.Editor = appSettingPrefs.edit()
        val IsNightModeOn: Boolean = appSettingPrefs.getBoolean("NightMode" , false)


        if (IsNightModeOn){

            AppCompatDelegate.setDefaultNightMode(MODE_NIGHT_YES)

        }else{
            AppCompatDelegate.setDefaultNightMode(MODE_NIGHT_NO)
        }



        swtModo.setOnClickListener {
            if(IsNightModeOn){

                AppCompatDelegate.setDefaultNightMode(MODE_NIGHT_NO)
                SharedPrefedit.putBoolean("NightMode" , false)
                SharedPrefedit.apply()
            }else{

                AppCompatDelegate.setDefaultNightMode(MODE_NIGHT_YES)
                SharedPrefedit.putBoolean("NightMode",true)
                SharedPrefedit.apply()
            }


        }

    }

    fun initRecyclerview(){
        val recyclerView = findViewById<RecyclerView>(R.id.recyclerSuperHero)

        adapter = SuperHeroAdapter(superheromutablelst , onClickListener = { position ->

            onItemSelected(position)
        } , onClickDeleted = {position -> ondeletedItem(position) }
            )

        val manager = LinearLayoutManager(this)
        binding.recyclerSuperHero.layoutManager = manager
        binding.recyclerSuperHero.adapter = adapter

    



    }

    fun onItemSelected(superHero: SuperHero){
        Toast.makeText(this,superHero.realName,Toast.LENGTH_SHORT).show()

        val intent = Intent(this,SuperHeroDetail::class.java)


        intent.putExtra("RealName",superHero.superhero )
        intent.putExtra("descripcion", superHero.descripcion)



        //FALTA FOTOGRAFIA
        intent.putExtra("photo" , superHero.photo)


        startActivity(intent)

    }



    fun ondeletedItem(position:Int){
        superheromutablelst.removeAt(position)
        adapter.notifyItemRemoved(position)
    }




    }





