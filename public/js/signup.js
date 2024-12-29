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
    // Get values from both inputs
    let citizenId = document.getElementById("citizenId").value;
    let memberCard = document.getElementById("memberCard").value;
    let valid = true;

    // Check Citizen Nation ID length
    if (citizenId.length !== 10) {
        valid = false;
        document.getElementById("citizenId").setCustomValidity("Invalid Citizen ID.");
        document.getElementById("citizenId").reportValidity();
    } else {
        document.getElementById("citizenId").setCustomValidity("");
    }

    // Check Member Card length
    // if (memberCard.length !== 10) { // Adjust the required length as needed
    //     valid = false;
    //     document.getElementById("memberCard").setCustomValidity("Invalid Member Card.");
    //     document.getElementById("memberCard").reportValidity();
    // } else {
    //     document.getElementById("memberCard").setCustomValidity("");
    // }

    // return valid; // Return the result
}


function process(e) {
    e.preventDefault();
    window.alert("Thank you for submission!");
    return false;
}