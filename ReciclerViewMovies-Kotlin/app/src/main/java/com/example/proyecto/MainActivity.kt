package com.example.proyecto

import android.app.UiModeManager.MODE_NIGHT_YES
import android.app.UiModeManager.MODE_NIGHT_NO
import android.content.Context
import android.content.SharedPreferences
import android.graphics.Color
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.ImageView
import android.widget.Switch
import android.widget.TextView
import androidx.appcompat.app.AppCompatDelegate
import androidx.constraintlayout.widget.ConstraintLayout
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.proyecto.model.PeliculaUIModel
import com.example.proyecto.model.genero

class MainActivity : AppCompatActivity() {
    private val recyclerView : RecyclerView by lazy { findViewById(R.id.rcvPelicula)}
    private val adaptador : PeliculaAdapter by lazy { PeliculaAdapter(layoutInflater, GladeImageLoader(this)) }
    //Agregados para cambiar a modo Dark
    val swtModo : Switch by lazy { findViewById(R.id.swtModo)}



    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        recyclerView.adapter = adaptador
        recyclerView.layoutManager = LinearLayoutManager(
            this, LinearLayoutManager.VERTICAL, false
        )
        adaptador.enlazarDato(
            listOf<PeliculaUIModel>(
                PeliculaUIModel(
                    "My Neighbor Totoro",
                    genero.Animacion,
                    "Min: 86",
                    "Año: 1988",
                    "Descripcion: Dos hermanas se mudan al campo con su padre para estar más cerca de su madre hospitalizada, y descubren que los árboles de los alrededores están habitados por Totoros, espíritus mágicos del bosque. Cuando la menor se escapa de casa, la hermana mayor busca la ayuda de los espíritus para encontrarla.",
                    "Titulo Original: となりのトトロ",
                    "Director: Hayao Miyazaki",
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/rtGDOeG9LzoerkDGZF9dnVeLppL.jpg"
                ),
                PeliculaUIModel(
                    "Grave of the Fireflies",
                    genero.Animacion,
                    "Min: 89",
                    "Año: 1988",
                    "Descripcion: En la última parte de la Segunda Guerra Mundial, un niño y su hermana, que quedaron huérfanos cuando su madre murió en el bombardeo de Tokio, deben sobrevivir solos en lo que queda de la vida civil en Japón. sobrevivir en el campo japonés, luchando contra el hambre, los prejuicios y el orgullo en su propia batalla personal y tranquila.",
                    "Titulo Original: 火垂るの墓",
                    "Director: Hayao Miyazaki",
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/qG3RYlIVpTYclR9TYIsy8p7m7AT.jpg"
                ),
                PeliculaUIModel(
                    "Castle in the Sky",
                    genero.Animacion,
                    "Min: 124",
                    "Año: 1986",
                    "Descripcion: La huérfana Sheeta heredó un cristal misterioso que la vincula con el mítico reino celestial de Laputa. Con la ayuda del ingenioso Pazu y una alegre banda de piratas del cielo, se abre camino hacia las ruinas de la otrora gran civilización. Sheeta y Pazu debe burlar al malvado Muska, quien planea usar la ciencia de Laputa para convertirse en el gobernante del mundo.",
                    "Titulo Original: 天空の城ラピュタ",
                    "Director: Hayao Miyazaki",
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpg"
                ),
                PeliculaUIModel(
                    "Kiki's Delivery Service",
                    genero.Animacion,
                    "Min: 102",
                    "Año: 1989",
                    "Descripcion: A una joven bruja, en su año obligatorio de vida independiente, le resulta difícil adaptarse a una nueva comunidad mientras se mantiene a sí misma administrando un servicio de mensajería aérea.",
                    "Titulo Original: 魔女の宅急便",
                    "Director: Hayao Miyazaki",
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/7nO5DUMnGUuXrA4r2h6ESOKQRrx.jpg"
                ),
                PeliculaUIModel(
                    "Only Yesterday",
                    genero.Animacion,
                    "Min: 118",
                    "Año: 1991",
                    "Descripcion: La huérfana Sheeta heredó un cristal misterioso que la vincula con el mítico reino celestial de Laputa. Con la ayuda del ingenioso Pazu y una alegre banda de piratas del cielo, se abre camino hacia las ruinas de la otrora gran civilización. Sheeta y Pazu debe burlar al malvado Muska, quien planea usar la ciencia de Laputa para convertirse en el gobernante del mundo.",
                    "Titulo Original: おもひでぽろぽろ",
                    "Director: Isao Takahata",
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/xjJU6rwzLX7Jk8HFQfVW6H5guMC.jpg"

                ),
                PeliculaUIModel(
                    "Porco Rosso",
                    genero.Animacion,
                    "Min: 93",
                    "Año: 1992",
                    "Descripcion: Porco Rosso, conocido en Japón como Crimson Pig (Kurenai no Buta), es la sexta película animada de Hayao Miyazaki y se estrenó en 1992. Te presentan a un as de combate italiano de la Primera Guerra Mundial, que ahora vive como un cazarrecompensas independiente persiguiendo el aire. piratas' en el mar Adriático. Le han dado una maldición que cambió su cabeza por la de un cerdo. Una vez llamado Marco Pagot, ahora es conocido en el mundo como 'Porco Rosso', en italiano para 'Red Pig'.",
                    "Titulo Original: 紅の豚",
                    "Director: Hayao Miyazaki",
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/byKAndF6KQSDpGxp1mTr23jPbYp.jpg"
                ),
                PeliculaUIModel(
                    "Pom Poko",
                    genero.Animacion,
                    "Min: 119",
                    "Año: 1994",
                    "Descripcion: A medida que el desarrollo de la ciudad humana invade el bosque y el hábitat de la pradera de la población de mapaches, los mapaches se enfrentan a la posibilidad muy real de extinción. En respuesta, los mapaches se involucran en una lucha desesperada para detener la construcción y preservar su hogar.",
                    "Titulo Original: 平成狸合戦ぽんぽこ",
                    "Director: Isao Takahata",
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/kowo9E1e1JcWLXj9cCvAOFZcy5n.jpg"
                ),
                PeliculaUIModel(
                    "Whisper of the Heart",
                    genero.Animacion,
                    "Min: 1995",
                    "Año: 111",
                    "Descripcion: Shizuku vive una vida sencilla, dominada por su amor por las historias y la escritura. Un día se da cuenta de que todos los libros de la biblioteca que tiene han sido retirados previamente por la misma persona: 'Seiji Amasawa'. Con curiosidad por saber quién es, Shizuku conoce a un chico de su edad a quien encuentra exasperante, pero descubre para su sorpresa que él es su 'Príncipe de los libros'. A medida que se acerca a él, se da cuenta de que él simplemente leyó todos esos libros para acercarse a ella. El niño Seiji aspira a ser fabricante de violines en Italia, y son sus sueños los que hacen que Shizuku se dé cuenta de que no tiene un camino claro para su vida. Sabiendo que su fuerza reside en la escritura, pone a prueba su talento escribiendo una historia sobre Baron, una estatuilla de gato que pertenece al abuelo de Seiji.",
                    "Titulo Original: 耳をすませば",
                    "Director: Yoshifumi Kondō",
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/5E3Hvbu0bg38ouYf6chGftVGqZ7.jpg"
                ),
                PeliculaUIModel(
                    "Princess Mononoke",
                    genero.Animacion,
                    "Min: 134",
                    "Año: 1997",
                    "Descripcion: Ashitaka, un príncipe de la tribu ainu que desaparece, es maldecido por un dios jabalí demonizado y debe viajar al oeste para encontrar una cura. En el camino, se encuentra con San, una joven humana que lucha por proteger el bosque, y con Lady Eboshi, que intenta destruirlo. Ashitaka debe encontrar la forma de equilibrar este conflicto.",
                    "Titulo Original: もののけ姫",
                    "Director: Hayao Miyazaki",
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/jHWmNr7m544fJ8eItsfNk8fs2Ed.jpg"
                ),
                PeliculaUIModel(
                    "My Neighbors the Yamadas",
                    genero.Animacion,
                    "Min: 104",
                    "Año: 1999",
                    "Descripcion: Los Yamada son una típica familia japonesa de clase media en el Tokio urbano y esta película nos muestra una variedad de episodios de sus vidas. Con historias que van desde lo humorístico hasta lo desgarrador, vemos a esta familia hacer frente a los pequeños conflictos, problemas y alegrías de la vida a su manera.",
                    "Titulo Original: ホーホケキョ となりの山田くん",
                    "Director: Isao Takahata",
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/wTGuHmMIBBgKakY80J1D52VvQKI.jpg"
                ),
                PeliculaUIModel(
                    "Spirited Away",
                    genero.Animacion,
                    "Min: 124",
                    "Año: 2001",
                    "Descripcion: Spirited Away es una película de animación japonesa ganadora de un Oscar sobre una niña de diez años que se aleja de sus padres por un camino que conduce a un mundo gobernado por extraños e inusuales animales parecidos a monstruos. Sus padres se han convertido en cerdos junto con otros dentro de una casa de baños llena de estas criaturas. ¿Alguna vez verá el mundo como era antes?",
                    "Titulo Original: 千と千尋の神隠し",
                    "Director: Hayao Miyazaki",
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/39wmItIWsg5sZMyRUHLkWBcuVCM.jpg"
                ),
                PeliculaUIModel(
                    "The Cat Returns",
                    genero.Animacion,
                    "Min: 102",
                    "Año: 1989",
                    "Descripcion: Haru, una colegiala aburrida de su rutina ordinaria, salva la vida de un gato inusual y, de repente, su mundo se transforma más allá de lo que jamás hubiera imaginado. ¡El Rey Gato recompensa su buena acción con una serie de regalos, incluida una propuesta de matrimonio muy impactante para su hijo! Haru se embarca en un viaje inesperado al Reino de los Gatos donde sus ojos se abren a un mundo completamente diferente.",
                    "Titulo Original: 猫の恩返し",
                    "Director: Hayao Miyazaki",
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/avPMO5cnaGHgLaNiAIhy33WoQLm.jpg"

                ),
                PeliculaUIModel(
                    "Howl's Moving Castle",
                    genero.Animacion,
                    "Min: 119",
                    "Año: 2004",
                    "Descripcion: Cuando Sophie, una joven tímida, es maldecida con un cuerpo viejo por una bruja rencorosa, su única oportunidad de romper el hechizo está en manos de un joven mago autoindulgente pero inseguro y sus compañeros en sus piernas, que regresan a casa.",
                    "Titulo Original: 魔女の宅急便",
                    "Director: Hayao Miyazaki",
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/TkTPELv4kC3u1lkloush8skOjE.jpg"
                ),
                PeliculaUIModel(
                    "Tales from Earthsea",
                    genero.Animacion,
                    "Min: 116",
                    "Año: 2006",
                    "Descripcion: Algo extraño se ha apoderado de la tierra. El reino se está deteriorando. La gente está empezando a actuar de forma extraña... Lo que es aún más extraño es que la gente está empezando a ver dragones, que no deberían entrar en el mundo de los humanos. Debido a todos estos extraños eventos, Ged, un mago errante, está investigando la causa. Durante su viaje, conoce al Príncipe Arren, un joven adolescente angustiado. Si bien Arren puede parecer un joven adolescente tímido, tiene un lado oscuro severo, que le otorga fuerza, odio, crueldad y no tiene piedad, especialmente cuando se trata de proteger a Teru. Para la bruja Kumo esta es una oportunidad perfecta. Ella puede usar los 'miedos' del niño contra el mismo que lo ayudaría, Ged.",
                    "Titulo Original: ゲド戦記",
                    "Director: Gorō Miyazaki",
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/7nO5DUMnGUuXrA4r2h6ESOKQRrx.jpg"
                ),
                PeliculaUIModel(
                    "Ponyo",
                    genero.Animacion,
                    "Min: 100",
                    "Año: 2008",
                    "Descripcion: Hijo de un marinero, Sosuke, de 5 años, vive una vida tranquila en un acantilado junto al mar con su madre Lisa. Un fatídico día, encuentra un hermoso pez dorado atrapado en una botella en la playa y, al rescatarla, la llama Ponyo. Pero ella no es un pez dorado ordinario. Hija de un mago magistral y una diosa del mar, Ponyo usa la magia de su padre para transformarse en una niña y rápidamente se enamora de Sosuke, pero el uso de una hechicería tan poderosa provoca un peligroso desequilibrio en el mundo. A medida que la luna se acerca cada vez más a la tierra y el padre de Ponyo envía las poderosas olas del océano para encontrar a su hija, los dos niños se embarcan en la aventura de su vida para salvar el mundo y cumplir los sueños de Ponyo de convertirse en humanos.",
                    "Titulo Original: 崖の上のポニョ",
                    "Director: Hayao Miyazaki",
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/mikKSEdk5kLhflWXbp4S5mmHsDo.jpg"
                ),
                PeliculaUIModel(
                    "Arrietty",
                    genero.Animacion,
                    "Min: 94",
                    "Año: 2010",
                    "Descripcion: Arrietty, de 14 años, y el resto de la familia Clock viven en un apacible anonimato mientras construyen su propia casa con elementos 'prestados' de los habitantes humanos de la casa. Sin embargo, la vida cambia para los Clocks cuando un niño humano descubre a Arrietty.",
                    "Titulo Original: 借りぐらしのアリエッティ",
                    "Director: Hiromasa Yonebayashi",
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/oc2OB2KDmSRDMelKEAA1n4YRQL0.jpg"
                ),
                PeliculaUIModel(
                    "From Up on Poppy Hill",
                    genero.Animacion,
                    "Min: 91",
                    "Año: 2011",
                    "Descripcion: La historia está ambientada en 1963 en Yokohama. Kokuriko Manor se asienta sobre una colina con vistas al puerto. En esa casa vive una niña de 16 años, Umi. Cada mañana iza una bandera de señales frente al mar. La bandera significa \"Rezo por viajes seguros\". Shun, un chico de 17 años, siempre ve esta bandera desde el mar mientras viaja en un remolcador a la escuela. Poco a poco, la pareja se atrae el uno al otro, pero se enfrentan a una prueba repentina. Aun así, siguen adelante sin huir de enfrentarse a las penurias de la realidad.",
                    "Titulo Original: コクリコ坂から",
                    "Director: Gorō Miyazaki",
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/rRLYX4RZIyloHSJwvZKAhphAjiB.jpg"

                ),
                PeliculaUIModel(
                    "The Wind Rises",
                    genero.Animacion,
                    "Min: 126",
                    "Año: 2013",
                    "Descripcion: Un amor de toda la vida por volar inspira al ingeniero de aviación japonés Jiro Horikoshi, cuya carrera histórica incluye la creación del avión de combate A-6M de la Segunda Guerra Mundial.",
                    "Titulo Original: 風立ちぬ",
                    "Director: Hayao Miyazaki",
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/jfwSexzlIzaOgxP9A8bTA6t8YYb.jpg"

                ),
                 PeliculaUIModel(
                    "Earwig and the Witch",
                    genero.Animacion,
                    "Min: 82",
                    "Año: 2021",
                    "Descripcion: Una niña huérfana, Earwig, es adoptada por una bruja y regresa a una casa espeluznante llena de misterio y magia.",
                    "Titulo Original: アーヤと魔女",
                    "Director: Gorō Miyazaki",
                    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/sJhFtY3eHuvvACaPpxpzdCLQqpQ.jpg"
                 ),
                PeliculaUIModel(
                    "The Tale of the Princess Kaguya",
                    genero.Animacion,
                    "Min: 137",
                    "Año: 2013",
                    "Descripcion: Un cortador de bambú llamado Sanuki no Miyatsuko descubre a una niña en miniatura dentro de un brote de bambú que brilla intensamente. Creyendo que ella es una presencia divina, él y su esposa deciden criarla como propia, llamándola 'princesa'.",
                    "Titulo Original: かぐや姫の物語",
                    "Director: Isao Takahata",
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/mWRQNlWXYYfd2z4FRm99MsgHgiA.jpg"
                ),
                PeliculaUIModel(
                    "When Marnie Was There",
                    genero.Animacion,
                    "Min: 103",
                    "Año: 2014",
                    "Descripcion: La película sigue a Anna Sasaki viviendo con sus familiares en la ciudad costera. Anna se encuentra con una mansión abandonada cercana, donde conoce a Marnie, una chica misteriosa que le pide que prometa ocultar sus secretos a todos. A medida que avanza el verano, Anna pasa más tiempo con Marnie y, finalmente, descubre la verdad sobre su familia y el cuidado de crianza.",
                    "Titulo Original: 思い出のマーニー",
                    "Director: Hiromasa Yonebayashi",
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/vug1dvDI1tSa60Z8qjCuUE7ntkO.jpg"
                ),
                PeliculaUIModel(
                    "The Red Turtle",
                    genero.Animacion,
                    "Min: 80",
                    "Año: 2016",
                    "Descripcion: Un hombre a la deriva por una tormenta se despierta en una playa. Descubre que está en una isla desierta con abundante agua dulce, frutas y un denso bosque de bambú. Construye una balsa de bambú e intenta zarpar, pero su balsa es destruida por un monstruo invisible en el mar, lo que lo obliga a regresar a la isla. Lo intenta de nuevo con otra balsa más grande, pero la criatura lo frustra nuevamente. Un tercer intento nuevamente termina con la balsa destruida, pero esta vez se enfrenta a una tortuga roja gigante, que lo mira fijamente y lo obliga a regresar a la isla.",
                    "Titulo Original: レッドタートル ある島の物語",
                    "Director: Michaël Dudok de Wit",
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/wOBU3SLjQ9358Km9YWYasPZyebp.jpg"


                )

        )
)
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
}


