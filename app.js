const express = require('express');
const session = require("express-session");
const path = require('path');
const app = express();
// Captura os valores
const bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

const mysql = require("mysql"); 
const { resolveSoa } = require('dns');

app.use(session({
    secret: "lftbmrnbw",
    resave: true,
    saveUninitialized: true}));
app.use(express.static('public'));
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, '/public'));


// Conectando database
function conectiondb(){
    var con = mysql.createConnection({
        host: 'containers-us-west-88.railway.app', 
        user: 'root', 
        password: 'rXw0fZ0g4nicY3Ie9PQw', 
        database: 'railway'
    });

    con.connect((err) => {
        if (err) {
            console.log('Erro durante conexão do banco de dados', err)
            return
        }
        console.log('Conexão bem sucedida!')
    });

    return con;
}

// Definição de rotas 

app.get('/', (req, res) => {
    var message = ' ';
    req.session.destroy();
    res.render('views/home', { message: message });
});

app.get("/views/login", function(req, res){
    var message = ' ';
    res.render('views/login', {message:message});
});

app.get("/views/cadastro", function(req, res){
    var message = ' ';
    res.render('views/cadastro', {message:message});
});

app.get('/views/cadastro', (req, res)=>{
    res.redirect('cadastro');
});

app.get("/views/pagini", function (req, res){
    if (req.session.user){
        var con = conectiondb();
        var query2 = 'SELECT * FROM usuarios WHERE email LIKE ?';
        con.query(query2, [req.session.user], function (err, results){
            res.render('views/pagini', {message:results});
            
        });
        
    }else{
        res.redirect("/");
    }
    
});


app.post('/register', function (req, res){
    var nome = req.body.nome;
    var senha = req.body.senha;
    var email = req.body.email;
    var con = conectiondb();
    var queryConsulta = 'SELECT * FROM usuarios WHERE email LIKE ?';
    con.query(queryConsulta, [email], function (err, results){
        if (results.length > 0){            
            var message = 'Esse e-mail já está em uso.';
            res.render('views/cadastro', { message: message });
        }else{
            var query = 'INSERT INTO railway.usuarios (nome, email, senha) VALUES(?, ?, ?)';

            con.query(query, [nome, email, senha], function (err, results){
                if (err){
                    throw err;
                }else{
                    console.log ("Cadastro realizado com o email: " + email);
                    var message = "ok";
                    res.render('views/cadastro', { message: message });
                }        
            });
        }
    });
});

app.post('/log', function (req, res){
    var email = req.body.email;
    var senha = req.body.senha;
    var con = conectiondb();
    var query = 'SELECT * FROM usuarios WHERE senha = ? AND email LIKE ?';
    
    con.query(query, [senha, email], function (err, results){
        if (results.length > 0){
            req.session.user = email;             
            console.log("Logado com sucesso!");
            res.render('views/pagini', {message:results});
        }else{
            var message = 'Usuário ou senha incorretos!';
            res.render('views/login', { message: message });
        }
    });
});

app.listen(5439);
