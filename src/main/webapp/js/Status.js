function Saveprofile() {
    // Perform save operation
    Swal.fire({
        title: "Profile details saved successfully",
        icon: "success"
    }).then((result) => {
        if (result.isConfirmed) {
            document.getElementById('save').submit(); // Submit the form programmatically if confirmed
        }
    });
}

// DeactivateAccount.js


    function Logout() {
    Swal.fire({
        title: "Are you sure you want to log out?",
        showDenyButton: true,
        confirmButtonText: "Yes",
        denyButtonText: "No",
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire("Successfully Logged out!", "", "success").then((result) => {
                if (result.isConfirmed) {
                    // Redirect to login page or perform server-side logout
                    window.location.href = "logoutbutton.jsp"; // Change this to your logout URL
                }
            });
        } else if (result.isDenied) {
            Swal.fire("Logout cancelled", "", "info");
        }
    });
}

function SendHoroscope() {
    // Perform save operation
    Swal.fire({
        title: "Sent Request successfully",
        icon: "success"
    }).then((result) => {
        if (result.isConfirmed) {
            document.getElementById('save').submit(); // Submit the form programmatically if confirmed
        }
    });
}
