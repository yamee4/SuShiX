function showPasswords(checked) {
    let password = document.getElementById("password");
    let confirmPassword = document.getElementById("confirmPassword");
    

    if (checked) {
        password.type = "text";
        confirmPassword.type = "text";
    } else {
        password.type = "password";
        confirmPassword.type = "password";
    }
}

function checkPassword(){
    let password = document.getElementById("password").value;
    let confirm = document.getElementById("confirmPassword").value;

    let confirmPassword = document.getElementById("confirmPassword");

    if(password !== confirm){
        confirmPassword.setCustomValidity("Passwords do not match");
        confirmPassword.reportValidity();
    }
    else{
        confirmPassword.setCustomValidity("");
    }
}


function checkContentLength() {
    let cccd = document.getElementById("citizenId").value;
    let valid = true;

    if (cccd.length !== 10) {
        valid = false;
        document.getElementById("citizenId").setCustomValidity("Invalid Citizen ID");
        document.getElementById("citizenId").reportValidity();
    }
    else{
        document.getElementById("citizenId").setCustomValidity("");
    }
}

function process(e) {
    e.preventDefault();
    window.alert("Thank you for submission!");
    return false;
}