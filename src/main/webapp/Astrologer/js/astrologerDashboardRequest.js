$(document).ready(function() {
    $.ajax({
        method: "GET",
        url: "request/getAll",
        success: function(result) {
            // Iterate over the first 5 records
            for (let i = 0; i < 5 && i < result.length; i++) {
                let x = result[i]; // Get the current record

                // Append the current record to the table
                $('#user-request-table').append(
                    `<tr class="${isDeadlinePassed(x.deadline) ? 'deadline-passed' : ''}">
                        <td>${x.startDate}</td>
                        <td>${x.deadline}</td>
                        <td>${x.firstName} ${x.lastName}</td>
                        <td>${x.userType}</td>
                        <td>
                            ${x.feedback}
                            <i class="view-icon fas fa-eye" onClick='viewDocument("${x.id}", "${x.feedbackImage}")'></i>
                        </td>
                        <td>
                            <span id="payment-received-${x.id}" style="display: none;">
                                 Received
                            </span>
                            <span id="payment-not-received-${x.id}" style="display: none;">
                                 Not Received
                            </span>
                        </td>
                        <td>
                            ${x.status}
                            <!-- Status icons -->
                        </td>
                    </tr>`
                );

                // Show appropriate status icons based on the status
                showStatusIcons(x);
            }
        },
        error: function(error) {
            console.log(error);
        }
    });
});

// Function to show appropriate status icons based on the status
function showStatusIcons(x) {
    if (x.status === 'PENDING' || x.status === 'DONE') {
        $(`#payment-received-${x.id}`).show();
    } else {
        $(`#payment-not-received-${x.id}`).show();
    }

    if (x.status === 'NEW') {
        $(`#status-icons-dashboard-${x.id}`).show();
    } else if (x.status === 'PAYMENT_PENDING') {
        $(`#payment-icon-dashboard-${x.id}`).show();
    } else if (x.status === 'DONE') {
        $(`#all-status-icon-dashboard-${x.id}`).show();
    } else if (x.status === 'PENDING') {
        $(`#pending-icons-dashboard-${x.id}`).show();
    }
}

function isDeadlinePassed(deadline) {
    // Convert the deadline string to a Date object
    const deadlineDate = new Date(deadline);

    // Get the current date
    const currentDate = new Date();

    // Compare the deadline date with the current date
    return deadlineDate < currentDate;
}

function updateStatus(id, status) {
    console.log('Updating status for ID: ' + id);
    $(`#status-icons-dashboard-${id}`).empty();

    const NEW = "NEW";
    const ACCEPT = "ACCEPT";
    const DECLINE = "DECLINE";
    const PAYMENT_PENDING = "PAYMENT_PENDING";
    const PENDING = "PENDING";
    const DONE = "DONE";

    Swal.fire("This task was already completed!", "", "info");
}

function viewDocument(id, feedbackImage) {
    console.log(feedbackImage);

    // Check if feedbackImage is a string
    if(feedbackImage != 'undefined'){
        if (typeof feedbackImage === 'string' && feedbackImage.length > 0) {
            // Split the string by commas and convert each value to a number
            const imageData = feedbackImage.split(',').map(Number);

            // Convert the array of numbers to a Uint8Array
            const uint8Array = new Uint8Array(imageData);

            // Create a Blob from the Uint8Array
            const blob = new Blob([uint8Array], { type: 'image/*' });

            // Display the image
            displayImage(blob);
        } else {
            Swal.fire("Invalid feedback image!");
        }
    } else {
        Swal.fire("Invalid feedback image!");
    }
}

function displayImage(blob) {
    const reader = new FileReader();
    reader.onload = (e) => {
        Swal.fire({
            title: "Your uploaded feedback",
            imageUrl: e.target.result,
            imageAlt: "The uploaded picture"
        });
    };
    reader.readAsDataURL(blob);
}

function acceptRequest(id) {
    console.log('Accepting request for ID: ' + id);
    Swal.fire({
        title: "Are you accepting this user request?",
        showDenyButton: false,
        showCancelButton: true,
        confirmButtonText: "Accept",
        cancelButtonText: "Cancel",
        confirmButtonColor: "#008CBA",
    }).then((result) => {
        if (result.isConfirmed) {
            //PAYMENT_PENDING
            $.ajax({
                method: 'POST',
                url: 'astrologer/update/pending/status',
                data: {
                    status: "PAYMENT_PENDING",
                    requestId: id
                },
                success: function(result) {
                    if (result == "1") {
                        Swal.fire({
                            title: "Saved!",
                            text: '',
                            icon: "success",
                            confirmButtonColor: "#008CBA"
                        });
                        setTimeout(function() {
                            location.reload(); // Reload the page
                        }, 3000);
                    } else {
                        Swal.fire({
                            title: "Not Saved!",
                            text: '',
                            icon: "error",
                            confirmButtonColor: "#008CBA"
                        });
                    }
                },
                error: function(error) {
                    Swal.fire({
                        title: "Not Saved!",
                        text: '',
                        icon: "error",
                        confirmButtonColor: "#008CBA"
                    });
                }
            });

        } else {
            Swal.fire({
                title: "Changes are not saved!",
                text: '',
                icon: "error",
                confirmButtonColor: "#008CBA"
            });
        }
    });
}

function declineRequest(id) {
    console.log('Declining request for ID: ' + id);

    Swal.fire({
        title: "Are you decline this user request?",
        showDenyButton: false,
        showCancelButton: true,
        confirmButtonText: "Decline",
        cancelButtonText: "Cancel",
        confirmButtonColor: "#008CBA",
    }).then((result) => {
        if (result.isConfirmed) {
            //PAYMENT_PENDING
            $.ajax({
                method: 'POST',
                url: 'astrologer/update/pending/status',
                data: {
                    status: "DECLINE",
                    requestId: id
                },
                success: function(result) {
                    if (result == "1") {
                        Swal.fire("Saved!", "", "success");
                        setTimeout(function() {
                            location.reload(); // Reload the page
                        }, 3000);
                    } else {
                        Swal.fire('Not Saved!', '', 'error');
                    }
                },
                error: function(error) {
                    Swal.fire('Not Saved!', '', 'error');
                }
            });

        } else {
            Swal.fire("Changes are not saved", "", "info");
        }
    });
}

function pendingRequest(id) {
    console.log('Pending status to done: ' + id);

    Swal.fire({
        title: "Are you completed this request?",
        showDenyButton: false,
        showCancelButton: true,
        confirmButtonText: "Done",
        cancelButtonText: "Cancel",
        confirmButtonColor: "#008CBA",
    }).then((result) => {
        if (result.isConfirmed) {
            //PAYMENT_PENDING
            $.ajax({
                method: 'POST',
                url: 'astrologer/update/pending/status',
                data: {
                    status: "DONE",
                    requestId: id
                },
                success: function(result) {
                    if (result == "1") {
                        Swal.fire("Saved!", "", "success");
                        setTimeout(function() {
                            location.reload(); // Reload the page
                        }, 3000);
                    } else {
                        Swal.fire('Not Saved!', '', 'error');
                    }
                },
                error: function(error) {
                    Swal.fire('Not Saved!', '', 'error');
                }
            });

        } else {
            Swal.fire("Changes are not saved", "", "info");
        }
    });
}

function makePayment(id) {
    console.log('Making payment for ID: ' + id);
    window.location.href = "astrologerPayment";

    setTimeout(function() {
        location.reload(); // Reload the page
    }, 3000);
}