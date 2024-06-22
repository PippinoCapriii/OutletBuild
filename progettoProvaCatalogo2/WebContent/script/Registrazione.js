/**
 * Funzione per validare il formato del nome e cognome
 */
function checkNomeCognome(inputtxt) {
    var nomeCognomePattern = /^[A-Za-z]+$/;
    return inputtxt.value.match(nomeCognomePattern);
}

/**
 * Funzione per validare il formato dell'email
 */
function checkEmail(inputtxt) {
    var emailPattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    return inputtxt.value.match(emailPattern);
}

/**
 * Funzione per validare il formato della data (dd-mm-yyyy)
 */
function checkData(inputtxt) {
    var dataPattern = /^\d{1,2}-\d{1,2}-\d{4}$/;
    return inputtxt.value.match(dataPattern);
}

/**
 * Funzione per validare il formato dell'username
 */
function checkUserName(inputtxt) {
    var userNamePattern = /^[A-Za-z0-9]+$/;
    return inputtxt.value.match(userNamePattern);
}

/**
 * Funzione per validare il formato della password:
 * - Almeno 8 caratteri
 * - Almeno una lettera minuscola
 * - Almeno una lettera maiuscola
 * - Almeno un numero
 */
function checkPassword(inputtxt) {
    var passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
    return inputtxt.value.match(passwordPattern);
}

/**
 * Funzione per validare tutti i campi del form prima della sottomissione
 */
function validate(obj) {
    var valid = true;

    var nome = document.getElementsByName("nome")[0];
    if (!checkNomeCognome(nome)) {
        valid = false;
        document.getElementById("errNome").innerHTML = "Nome non valido";
        errNome.style.color = "red";
    } else {
        document.getElementById("errNome").innerHTML = "";
    }

    var cognome = document.getElementsByName("cognome")[0];
    if (!checkNomeCognome(cognome)) {
        valid = false;
        document.getElementById("errCognome").innerHTML = "Cognome non valido";
        errCognome.style.color = "red";
    } else {
        document.getElementById("errCognome").innerHTML = "";
    }

    var email = document.getElementsByName("email")[0];
    if (!checkEmail(email)) {
        valid = false;
        document.getElementById("errEmail").innerHTML = "Email non valida";
        errEmail.style.color = "red";
    } else {
        document.getElementById("errEmail").innerHTML = "";
    }

    var data = document.getElementsByName("nascita")[0];
    if (!checkData(data)) {
        valid = false;
        document.getElementById("errNascita").innerHTML = "Data non valida (formato richiesto: dd-mm-yyyy)";
        errNascita.style.color = "red";
    } else {
        document.getElementById("errNascita").innerHTML = "";
    }

    var user = document.getElementsByName("us")[0];
    if (!checkUserName(user)) {
        valid = false;
        document.getElementById("errUser").innerHTML = "Username non valido";
        errUser.style.color = "red";
    } else {
        document.getElementById("errUser").innerHTML = "";
    }

    var pw = document.getElementsByName("pw")[0];
    if (!checkPassword(pw)) {
        valid = false;
        document.getElementById("errPass").innerHTML = "Password non valida (minimo 8 caratteri, una lettera maiuscola, una lettera minuscola e un numero)";
        errPass.style.color = "red";
    } else {
        document.getElementById("errPass").innerHTML = "";
    }

    if (valid) {
        obj.submit();
    }
}

/**
 * Funzione per cambiare lo sfondo dell'elemento in giallo quando riceve il focus
 */
function myFunction(x) {
    x.style.background = "yellow";
}
