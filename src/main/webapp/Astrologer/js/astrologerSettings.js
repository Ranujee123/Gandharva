function updatePassword(event) {
    event.preventDefault();

    var astrologerPassword = $("#astrologerPassword").val();

    console.log(astrologerPassword);

    let currentPassword = $('#current-password').val().trim();
    let newPassword = $('#new-password').val().trim();
    let confirmPassword = $('#confirm-password').val().trim();
    $('.error-message').remove();

    if (newPassword !== confirmPassword) {
        $('#confirm-password').after('<div class="error-message">Passwords do not match</div>');
        $('#new-password, #confirm-password').addClass('error');
    } else {
        $('#confirm-password + .error-message').remove();
        $('#new-password, #confirm-password').removeClass('error');

        console.log("Passwords match. Proceed with form submission.");

        let hashedPassword = obtainSHA(currentPassword);

        console.log(hashedPassword);

        if(astrologerPassword === hashedPassword){
            $.ajax({
                method: "POST",
                url: "astrologer/update/password",
                data: {
                    password: currentPassword,
                    newPassword: newPassword
                },
                success: function(result) {
                    Swal.fire("Password update successfully!", "", "success");

                    $('#change-password-form')[0].reset();
                },
                error: function(error) {
                    console.log(error);
                }
            });
        } else {
            Swal.fire("Current Password is incorrect!", "", "error");
        }
    }
}

function obtainSHA(s) {
    var msgDigest = new jsSHA("SHA-256", "TEXT");
    msgDigest.update(s);
    var hash = msgDigest.getHash("HEX");

    if (hash.charAt(0) === '0') {
        hash = hash.slice(1);
    }

    return hash;
}

function deactivateAccount(event) {
        event.preventDefault();

        Swal.fire({
          title: "Do you want to deactivate your account?",
          showDenyButton: true,
          showCancelButton: true,
          confirmButtonText: "Yes!",
          denyButtonText: `Cancel`
        }).then((result) => {
          if (result.isConfirmed) {
                $.ajax({
                    method: 'POST',
                    url: 'user/update/status',
                    data: {
                        isActivated: false
                    },
                    success: function(result) {
                        if (result == "1") {
                            Swal.fire("Your account is successfully deactivated!", "", "success");
                                        $.ajax({
                                            method: "GET",
                                            url: "logout",
                                            // dataType: "json",
                                            // contentType: "application/json",
                                            success: function(result) {
                                                window.location.href = "HomePage.jsp";
                                            },
                                            error: function(error) {
                                                console.log(error);
                                            }
                                        });
                        } else {
                            Swal.fire({
                                title: "User Deactivated Unsuccessful!",
                                text: 'Please contact the administrator',
                                icon: "error",
                                confirmButtonColor: "#008CBA"
                            });
                        }
                    },
                    error: function(error) {
                        Swal.fire("Can't deactivate the account!", "Please contact the administrator", "error");
                    }
                });
          } else if (result.isDenied) {
            Swal.fire("Account deactivation cancel!", "", "info");
          }
        });
}