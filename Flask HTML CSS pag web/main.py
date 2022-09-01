from flask import Flask,render_template

app=Flask(__name__,template_folder='template')


@app.route("/")
def home():
    

    data= {
        'titulo': 'Home',
        'h1':'Sala de Inicio',
        'p1':'Midari'

    }
    return render_template('home.html', data=data)



@app.route("/about")
def about():

    return render_template('about.html')




@app.route("/contenido")
def contenido():
    return render_template('contenido.html')



if __name__=="__main__":
    app.run(debug=True)

