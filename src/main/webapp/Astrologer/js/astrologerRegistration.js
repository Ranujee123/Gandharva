$(document).ready(function() {
    $('#registration-form').submit(function(e) {
        e.preventDefault();

        let firstName = $('#first_name').val().trim();
        let lastName = $('#last_name').val().trim();
        let email = $('#email').val().trim();
        let password = $('#password').val().trim();
        let userType = 'ASTROLOGER';
        let countryOfResidence = "Sri Lanka";
        let district = $('#district').val().trim();
        let numberOfCasesHandled = 0;
        let yearsOfExperience = parseInt($('#experience').val().trim());
        let astrologerPayment = parseInt($('#astrologerPayment').val().trim());

        let formData = new FormData();
        formData.append('firstName', firstName);
        formData.append('lastName', lastName);
        formData.append('email', email);
        formData.append('password', password);
        formData.append('userType', userType);
        formData.append('countryOfResidence', countryOfResidence);
        formData.append('district', district);
        formData.append('numberOfCasesHandled', numberOfCasesHandled);
        formData.append('yearsOfExperience', yearsOfExperience);
        formData.append('astrologerPayment', astrologerPayment);

        let certificateFileUpload = $('#certificates').prop('files');
        if (certificateFileUpload.length > 0) {
            for (const file of certificateFileUpload) {
                formData.append('certificateFileUpload', file);
            }
        }

        certificateFileUpload = formData.get("certificateFileUpload");

        $.ajax({
            method: 'POST',
            url: 'registration',
            data: formData,
            processData: false,
            contentType: false,
            success: function(result) {
                // Handle successful registration
                Swal.fire({
                    icon: 'success',
                    title: 'Registration Success',
                    text: 'You are registered as an Astrologer!',
                    confirmButtonText: 'Ok',
                    confirmButtonColor: '#0E2C4B'
                });
                window.location.href = "login";
            },
            error: function(error) {
                // Handle registration errors
                Swal.fire({
                    icon: 'error',
                    title: 'Registration unsuccessful!',
                    text: 'Please try again!',
                    confirmButtonText: 'Ok',
                    confirmButtonColor: '#932828'
                });
            }
        });
    });
    $('#certificates').change(function() {
        const files = $(this).prop('files');
        for (const file of files) {
            console.log('File name:', file.name);
            console.log('File size:', file.size);
            console.log('File type:', file.type);
        }
    });
});