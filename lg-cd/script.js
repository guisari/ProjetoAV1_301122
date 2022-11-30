function logar() {

    var login = document.getElementById('login').value;
    var senha = document.getElementById('senha').value;

    if (login == "teste@teste.com.br" && senha == "uninove") {
        alert("Sucesso")
        location.href = "home.html";
    }else{
        alert("Usuario ou senha invalida!")
    }
}
