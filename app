from flask import Flask, render_template, url_for, request, redirect

app= Flask(__name__)  

@app.route('/')
def index():
    return render_template("log.html")

@app.route('/log', methods=["POST", "GET"])
def log():
    if request.method == "POST":

        données = request.form
        nom= données.get('nom')
     

        if 'nom':

            return render_template("trait.html", user=nom)
        else:
            return render_template("trait.html")
    else:
        return redirect(url_for('index'))
   
if __name__ =='__main__':
    app.run(debug=True)



 <title>Mon appli</title>
</head>
<body>

 <form action="{{ url_for('log')}}" method="post">

    <p>
      <label for="nom">nom : </label>
      <input type="text" name="nom" >
    </p>  

    <input type="submit" value="envoyer" >

</form>
</body>
</html>




<title>Mon appli</title>
</head>
<body>
   
    {% if user %}
    <p>Bonjour {{user}}, vs etes connecté.</p>
        {% else %}
        <p> un problème </p>
        {% endif %}
</body>
</html>


