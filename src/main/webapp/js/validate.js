
function validateFirstName() {
    var firstName = document.getElementById('firstName').value;
    var regex = /^[a-zA-Z]+$/; // Regular expression for checking letters only
    if (!regex.test(firstName)) {
        alert("First name should contain only letters.");
        return false;
    }
    return true;
}

function validateLastName() {
    var lastName = document.getElementById('lastName').value;
    var regex = /^[a-zA-Z]+$/; // Regular expression for checking letters only
    if (!regex.test(lastName)) {
        alert("Last name should contain only letters.");
        return false;
    }
    return true;
}

function validateEmail() {
    var email = document.getElementById('email').value;
    var regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

    if (!regex.test(email)) {
        alert("Please enter a valid email address.");
        return false;
    }

    // Perform AJAX request to check if email is already registered
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "CheckEmailServlet", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onload = function() {
        if (xhr.status == 200 && xhr.responseText === "true") {
            alert("This email is already registered in the system.");
        }
    };
    xhr.send("email=" + encodeURIComponent(email));
}

function validatePassword() {
    var password = document.getElementById('password').value;
    var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

    if (!regex.test(password)) {
        alert("Password must contain at least 8 characters, including at least one uppercase letter, one number, and one special character(@$!%*?&).");
        return false;
    }
    return true;
}

function validateConfirmPassword() {
    var password = document.getElementById('password').value; // Ensure password is fetched again in this function
    var confirmPassword = document.getElementById('confirmPassword').value;

    if (password !== confirmPassword) {
        alert("Passwords do not match.");
        return false;
    }
    return true;
}
