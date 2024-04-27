document.addEventListener("DOMContentLoaded", function() {
    var submitBtn = document.getElementById("updateButton");
    var experienceInput = document.getElementById("yearsOfExperienceUpdate");
    var emailInput = document.getElementById("emailUpdate");
    var basePriceInput = document.getElementById("astrologerPaymentUpdate");

    submitBtn.addEventListener("click", function(event) {
        // Validate fields
        validateExperience();
        validateEmail();
        validateBasePrice();

        // Check if there are any validation errors
        var hasErrors = document.querySelectorAll('.error-message').length > 0;

        console.log(hasErrors);
        console.log(document.querySelectorAll('.error-message').length);

        // If there are no validation errors, submit the form
        if (!hasErrors) {
            console.log("Yohan");
            updateFormSubmit();
        } else {
            console.log("Yohan1");
//            event.preventDefault();
        }
    });

    experienceInput.addEventListener("input", function() {
        validateExperience();
    });

    emailInput.addEventListener("input", function() {
        validateEmail();
    });

    basePriceInput.addEventListener("input", function() {
        validateBasePrice();
    });

    function validateExperience() {
        var experience = parseInt(experienceInput.value);
        var errorMessage = "";

        if (isNaN(experience) || experience < 0 || experience > 50) {
            errorMessage = "Please enter a valid number between 0 and 50 for years of experience";
        }

        displayErrorMessage(experienceInput, errorMessage);
    }

    function validateEmail() {
        var isValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailInput.value); // Check if value is a valid email address

        var errorMessage = isValid ? "" : "Please enter a valid email address";

        displayErrorMessage(emailInput, errorMessage);
    }

    function validateBasePrice() {
        var basePrice = parseFloat(basePriceInput.value);
        var errorMessage = isNaN(basePrice) || basePrice < 0 ? "Please enter a valid positive number for base price" : "";

        displayErrorMessage(basePriceInput, errorMessage);
    }

    function displayErrorMessage(inputElement, message) {
        var errorContainer = inputElement.nextElementSibling;
        if (!errorContainer || !errorContainer.classList.contains('error-message')) {
            errorContainer = document.createElement('div');
            errorContainer.className = 'error-message';
            inputElement.parentNode.insertBefore(errorContainer, inputElement.nextSibling);
        }

        errorContainer.textContent = message;
    }

});

function updateFormSubmit() {
    var firstName = $('#firstNameUpdate').val().trim();
    var lastName = $('#lastNameUpdate').val().trim();
    var yearsOfExperience = $('#yearsOfExperienceUpdate').val().trim();
    var district = $('#districtUpdate').val().trim();
    var email = $('#emailUpdate').val().trim();
    var astrologerPayment = parseInt($('#astrologerPaymentUpdate').val().trim());

    $.ajax({
        method: 'POST',
        url: 'astrologer/update',
        data: {
            firstName: firstName,
            lastName: lastName,
            yearsOfExperience: yearsOfExperience,
            district: district,
            email: email,
            astrologerPayment: astrologerPayment
        },
        success: function(result) {
            Swal.fire({
                icon: 'success',
                title: 'Profile update Success',
                text: 'Astrologer profile update success!',
                confirmButtonText: 'Ok',
                confirmButtonColor: '#0E2C4B'
            });
            setTimeout(function() {
                location.reload(); // Reload the page
            }, 2000);
        },
        error: function(error) {
            Swal.fire({
                icon: 'error',
                title: 'Profile update unsuccessful!',
                text: 'Astrologer profile update unsuccessful!',
                confirmButtonText: 'Ok',
                confirmButtonColor: '#932828'
            });
        }
    });
}

function updateProfileImage() {
    let userImage = $('#profile-image').prop('files')[0]; // Access the first file from the FileList

    let formData = new FormData();
    formData.append('userImage', userImage);

    $.ajax({
        method: 'POST',
        url: 'astrologer/update/image',
        data: formData,
        contentType: false,
        processData: false,
        success: function(result) {
            Swal.fire({
                icon: 'success',
                title: 'Profile update Success',
                text: 'Astrologer profile image update success!',
                confirmButtonText: 'Ok',
                confirmButtonColor: '#0E2C4B'
            });

            setTimeout(function() {
                location.reload();
            }, 2000);
        },
        error: function(error) {
            Swal.fire({
                icon: 'error',
                title: 'Profile update unsuccessful!',
                text: 'Astrologer profile image update unsuccessful!',
                confirmButtonText: 'Ok',
                confirmButtonColor: '#932828'
            });
        }
    });
}
