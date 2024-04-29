const pageSize = 6; // Maximum rows per page
let currentPage = 1;
let totalRows = 0;

$(document).ready(function() {
    $.ajax({
        method: "GET",
        url: "request/getAll",
        // dataType: "json",
        // contentType: "application/json",
        success: function(result) {
            $.each(result, function(index, x) {
                let downloadButtonDisabled = x.status !== "PENDING";
                let viewButtonDisabled = !(x.status === "DONE" || x.status === "PENDING");
                let buttonStyle = (downloadButtonDisabled) ? 'style="background-color: #ddd; color: #aaa; border-color: #ddd;"' : '';
                let buttonStyleView = (viewButtonDisabled) ? 'style="background-color: #ddd; color: #aaa; border-color: #ddd;"' : '';

                console.log(x);

                $('#user-request-table-pending').append(
                    `<tr class="${isDeadlinePassed(x.deadline) ? 'deadline-passed' : ''}">
                        <td>${x.startDate}</td>
                        <td>${x.firstName} ${x.lastName}</td>
                        <td>${x.userType}</td>
                        <td>
                            <div class="pdf-buttons-container">
                                <button id="downloadButton1" class="pdf-buttons" onclick='downloadPDF("${x.horoscope}")' ${downloadButtonDisabled ? 'disabled' : ''} ${buttonStyle}>Download PDF 1</button>
                                <button id="downloadButton" class="pdf-buttons" onclick='downloadPDF("${x.horoscopeSecond}")' ${downloadButtonDisabled ? 'disabled' : ''} ${buttonStyle}>Download PDF 2</button>
                                <div class="pdf-buttons-separator"></div>
                                <button id="viewButton1" class="pdf-buttons" onclick='viewPDF("${x.horoscope}")' ${viewButtonDisabled ? 'disabled' : ''} ${buttonStyleView}>View PDF 1</button>
                                <button id="viewButton" class="pdf-buttons" onclick='viewPDF("${x.horoscopeSecond}")' ${viewButtonDisabled ? 'disabled' : ''} ${buttonStyleView}>View PDF 2</button>
                            </div>
                        </td>
                        <td>${x.deadline}</td>
                        <td>
                            ${x.status}

                            <span id="all-status-icon-${x.id}" style="display: none;">
                                <i class="status-icon fas fa-check-circle" onClick='updateStatus("${x.id}", "${x.status}")'></i>
                            </span>
                            <span id="payment-icon-${x.id}" style="display: none;">
                                <i class="payment-icon fas fa-money-bill-alt" onClick='makePayment("${x.id}")'></i>
                            </span>
                            <span id="status-icons-${x.id}" style="display: none;">
                                <i class="accept-icon fas fa-check-circle" onClick='acceptRequest("${x.id}")'></i>
                                <i class="decline-icon fas fa-times-circle" onClick='declineRequest("${x.id}")'></i>
                            </span>
                            <span id="pending-icons-${x.id}" style="display: none;">
                                <i class="pending-icon fas fa-clock" onClick='pendingRequest("${x.id}")'></i>
                            </span>
                        </td>
                        <td>
                            ${x.feedback}
                            <i class="menu-icon fas fa-comment feedback-icon" onClick='provideFeedback("${x.id}")'></i>
                            <i class="upload-icon fas fa-upload" onClick='uploadDocument("${x.id}")'></i>
                            <i class="view-icon fas fa-eye" onClick='viewDocument("${x.id}", "${x.feedbackImage}")'></i>
                        </td>
                        <td>
                            <input type="text" placeholder="Not displayed to anyone else" value="${x.comments}" class="user-request-comment">
                            <i class="fas fa-pencil-alt comment-icon" onClick='updateComment(this, "${x.id}")'></i>
                        </td>
                    </tr>`
                );
                totalRows++;

                if (x.status === 'NEW') {
                    $(`#status-icons-${x.id}`).show();
                } else if (x.status === 'PAYMENT_PENDING') {
                    //console.log("Pending payment, User has to be change the status.");
                    $(`#payment-icon-${x.id}`).show();
                } else if (x.status === 'DONE') {
                    $(`#all-status-icon-${x.id}`).show();
                } else if (x.status === 'PENDING') {
                    $(`#pending-icons-${x.id}`).show();
                }
                initPagination();
            });
        },
        error: function(error) {
            console.log(error);
        }
    });

    $('#statusFilterPending').change(function() {
        filterTable($(this).val());
    });


});

function initPagination() {
    const totalPages = Math.ceil(totalRows / pageSize);
    let paginationHtml = '';

    for (let i = 1; i <= totalPages; i++) {
        paginationHtml += `<button class="page-btn" data-page="${i}">${i}</button>`;
    }

    $('#pagination').html(paginationHtml);

    $('.page-btn').click(function() {
        const page = parseInt($(this).attr('data-page'));
        showPage(page);
    });

    showPage(1);
}

function showPage(page) {
    const startIndex = (page - 1) * pageSize;
    const endIndex = startIndex + pageSize;

    $('#user-request-table-pending-id tbody tr').hide();

    $('#user-request-table-pending-id tbody tr').slice(startIndex, endIndex).show();

    currentPage = page;
}

function filterTable(status) {
    $('#user-request-table-pending-id tbody tr').each(function() {
        const rowStatus = $(this).find('td:nth-child(6)').text().trim();
        if (status === '' || rowStatus === status) {
            $(this).show();
        } else {
            $(this).hide();
        }
    });
}

function isDeadlinePassed(deadline) {
    // Convert the deadline string to a Date object
    const deadlineDate = new Date(deadline);

    // Get the current date
    const currentDate = new Date();

    // Compare the deadline date with the current date
    return deadlineDate < currentDate;
}

function downloadPDF(blobData) {
    // Split the string by commas and convert each substring to a number
    const byteNumbers = blobData.split(',').map(Number);

    // Create a Uint8Array from the array of numbers
    const uint8Array = new Uint8Array(byteNumbers);

    // Create a Blob from the Uint8Array
    const blob = new Blob([uint8Array], { type: 'application/pdf' });

    // Create a download link element
    const downloadLink = document.createElement('a');
    downloadLink.href = URL.createObjectURL(blob);
    downloadLink.download = 'file.pdf';
    downloadLink.textContent = 'Download PDF';

    // Check if the browser is Chrome
    if (window.navigator.userAgent.indexOf('Chrome') !== -1) {
        // Chrome may require a new tab for reliable download
        downloadLink.target = '_blank';
    }

    // Append the download link to the document body
    document.body.appendChild(downloadLink);

    // Programmatically trigger the click event on the download link
    downloadLink.click();

    // Remove the download link from the document body
    document.body.removeChild(downloadLink);
}

function viewPDF(blobData) {
    const byteNumbers = blobData.split(',').map(Number);
    const uint8Array = new Uint8Array(byteNumbers);

    const blob = new Blob([uint8Array], { type: 'application/pdf' });
    window.open(URL.createObjectURL(blob));
}

function updateStatus(id, status) {
    console.log('Updating status for ID: ' + id);
    $(`#status-icons-${id}`).empty();

    const NEW = "NEW";
    const ACCEPT = "ACCEPT";
    const DECLINE = "DECLINE";
    const PAYMENT_PENDING = "PAYMENT_PENDING";
    const PENDING = "PENDING";
    const DONE = "DONE";

    Swal.fire("This task was already completed!", "", "info");
}

function provideFeedback(id) {
    console.log('Providing feedback for ID: ' + id);
    Swal.fire({
        title: 'Feedback',
        input: 'textarea',
        showCancelButton: true,
        confirmButtonText: 'Submit',
        cancelButtonText: 'Cancel',
        inputValidator: (value) => {
            if (!value) {
                return 'Please enter your feedback!';
            }
        }
    }).then((result) => {
        if (result.isConfirmed) {
            let feedback = result.value;

            $.ajax({
                method: 'POST',
                url: 'astrologer/update/pending/feedback',
                data: {
                    feedback: feedback,
                    requestId: id
                },
                success: function(result) {
                    if (result == "1") {
                        Swal.fire({
                            title: "Feedback Submitted!",
                            text: '',
                            icon: "success",
                            confirmButtonColor: "#008CBA"
                        });
                        setTimeout(function() {
                            location.reload(); // Reload the page
                        }, 3000);
                    } else {
                        Swal.fire({
                            title: "Feedback is not Submitted!",
                            text: '',
                            icon: "error",
                            confirmButtonColor: "#008CBA"
                        });
                    }
                },
                error: function(error) {
                    Swal.fire({
                        title: "Feedback is not Submitted!",
                        text: '',
                        icon: "error",
                        confirmButtonColor: "#008CBA"
                    });
                }
            });
        }
    });
}

async function uploadDocument(id) {
    const { value: file } = await Swal.fire({
        title: "Select image",
        input: "file",
        inputAttributes: {
            "accept": "image/*",
            "aria-label": "Upload your feedback as an image"
        }
    });
    if (file) {
        console.log(file);
        const reader = new FileReader();
        reader.onload = (e) => {
            Swal.fire({
                title: "Your uploaded picture",
                imageUrl: e.target.result,
                imageAlt: "The uploaded picture"
            });
        };
        reader.readAsDataURL(file);

        uploadImageToServer(file, id);
    }
}

function uploadImageToServer(file, id) {
    let formData = new FormData();
    formData.append('feedbackImage', file);
    formData.append('requestId', id);

    $.ajax({
        method: 'POST',
        url: 'request/feedback/image',
        data: formData,
        contentType: false, // Necessary for sending FormData
        processData: false, // Necessary for sending FormData
        success: function(result) {
            if (result === "1") {
                Swal.fire({
                    icon: 'success',
                    title: 'Feedback image update Success',
                    text: 'Astrologer feedback image update success!',
                    confirmButtonText: 'Ok',
                    confirmButtonColor: '#0E2C4B'
                }).then(() => {
                    // Reset file input field
                    $('input[type="file"]').val('');
                    // Close the modal if open
                    Swal.close();
                });
                setTimeout(function() {
                    location.reload(); // Reload the page
                }, 3000);
            } else {
                handleError();
            }
        },
        error: function(error) {
            handleError();
        }
    });
}

function handleError() {
    Swal.fire({
        icon: 'error',
        title: 'Feedback image saved unsuccessful!',
        text: 'Astrologer feedback image update unsuccessful!',
        confirmButtonText: 'Ok',
        confirmButtonColor: '#932828'
    });
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


function updateComment(inputField, id) {
    let comments = $(inputField).prev('.user-request-comment').val();

    Swal.fire({
        title: "Do you want to save the changes?",
        showDenyButton: false,
        showCancelButton: true,
        confirmButtonText: "Save",
        confirmButtonColor: "#008CBA",
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                method: 'POST',
                url: 'astrologer/update/pending/comments',
                data: {
                    comments: comments,
                    requestId: id
                },
                success: function(result) {
                    if (result == "1") {
                        Swal.fire({
                            title: "Comment Updated!",
                            text: '',
                            icon: "success",
                            confirmButtonColor: "#008CBA"
                        });
                        setTimeout(function() {
                            location.reload(); // Reload the page
                        }, 3000);
                    } else {
                        Swal.fire({
                            title: "Comment update is not success!",
                            text: '',
                            icon: "error",
                            confirmButtonColor: "#008CBA"
                        });
                    }
                },
                error: function(error) {
                    Swal.fire({
                        title: "Comment update is not success!",
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
    Swal.fire("Payment still processing", "Payment made by the user!", "info");
//    window.location.href = "astrologerPayment";

//    setTimeout(function() {
//        location.reload(); // Reload the page
//    }, 3000);
    //    window.location.href = "astrologer";
    // after payment completed, Then we have to change tha status
    // PENDING

    // Payment completed. It can be a successful failure.

    // Show the payhere.js popup, when "PayHere Pay" is clicked
    //    document.getElementById('payhere-payment').onclick = function (e) {
    //        payhere.startPayment(payment);
    //    };
}

//function testPayherePayment {
//    payhere.onCompleted = function onCompleted(orderId) {
//        console.log("Payment completed. OrderID:" + orderId);
//        // Note: validate the payment and show success or failure page to the customer
//    };
//
//    // Payment window closed
//    payhere.onDismissed = function onDismissed() {
//        // Note: Prompt user to pay again or show an error page
//        console.log("Payment dismissed");
//    };
//
//    // Error occurred
//    payhere.onError = function onError(error) {
//        // Note: show an error page
//        console.log("Error:"  + error);
//    };
//
//    // Put the payment variables here
//    var payment = {
//        "sandbox": true,
//        "merchant_id": "1225999",    // Replace your Merchant ID
//        "return_url": "astrologerPayment",     // Important
//        "cancel_url": "astrologerPayment",     // Important
//        "notify_url": "http://sample.com/notify",
//        "order_id": "ItemNo12345",
//        "items": "Door bell wireles",
//        "amount": "1000.00",
//        "currency": "LKR",
//        "hash": "",
//        "first_name": "Saman",
//        "last_name": "Perera",
//        "email": "samanp@gmail.com",
//        "phone": "0771234567",
//        "address": "No.1, Galle Road",
//        "city": "Colombo",
//        "country": "Sri Lanka",
//        "delivery_address": "No. 46, Galle road, Kalutara South",
//        "delivery_city": "Kalutara",
//        "delivery_country": "Sri Lanka",
//        "custom_1": "",
//        "custom_2": ""
//    };
//
//    $.ajax({
//        method: 'POST',
//        url: 'astrologer/request/payment/hashValue',
//        data: {
//            order_id: payment["order_id"],
//            amount: payment["amount"],
//            currency: payment["currency"]
//        },
//        success: function (result) {
//            payment.hash = result;
//
//            console.log(payment);
//            payhere.startPayment(payment);
//        },
//        error: function (error) {
//            Swal.fire('Not Saved!', '', 'error');
//        }
//    });
//}

//function afterOnlinePayment(data,status,payment_method){
//    //alert("submit");
//    const date = new Date();
//    let fullDate = date.getFullYear()+"-"+(date.getMonth() + 1).toString().padStart(2, "0")+"-"+date.getDate().toString().padStart(2, "0");
//    data["current_date"] = fullDate;
//    // console.log(data);
//    let new_expire_date1 = parseInt(date.getFullYear())+1;
//    let new_expire_date = new_expire_date1 + "-" +(date.getMonth() + 1).toString().padStart(2, "0")+"-"+date.getDate().toString().padStart(2, "0");
//    data["new_expire_date"] = new_expire_date;
//
//    //console.log(data);
//    let payment_id = paymentId;
//    let payment_date = data.current_date;
//    // let payment_method = data.
//    let newExpireDate = data.expiry_day.split("-");
//    //console.log(newExpireDate);
//    let previous_expire_date = newExpireDate[0]+"-"+("0"+newExpireDate[1]).slice(-2)+"-"+("0"+newExpireDate[2]).slice(-2);
//    console.log(previous_expire_date);
//    // let previous_expire_date = data.expiry_day;
//    //previous_expire_date = x.appointment_date["year"]+"-"+("0" + x.appointment_date["month"]).slice(-2)+"-"+("0" + x.appointment_date["day"]).slice(-2);
//    let currency = data.currency;
//    let payment_amount = data.amount;
//    // let authorization_token
//    let payment_status = status; //newly added. Meken thama apita kiyanna puluwan cash payment ekakda online da kiyala
//    let cus_first_name = data.first_name;
//    let cus_last_name = data.last_name;
//    let cus_address = data.address;
//    let cus_city = data.city;
//    //let cus_city = "None";
//    // let new_expire_date = new_expire_date2;
//
//    $.ajax({
//        method:"POST",
//        url:"astrologer/request/payment/{id}",
//        data: {payment_id:payment_id, payment_date:payment_date, previous_expire_date:previous_expire_date, currency:currency, payment_amount:payment_amount,payment_status:payment_status, cus_first_name:cus_first_name, cus_last_name:cus_last_name, cus_address:cus_address, cus_city:cus_city, new_expire_date:new_expire_date,payment_method:payment_method},
//        // dataType:"json",
//        // contentType:"application/json",
//        success: function (result){
//            if(result.trim() == "1"){
//                //alert(result);
//
//                if(checkStatus == 0){
//                    Swal.fire({
//                        icon: 'success',
//                        title: 'Request Send to Manager!',
//                        // text: 'Physical Member!',
//                        confirmButtonText:"Ok",
//                        confirmButtonColor: '#0E2C4B',
//                    })
//                }else {
//                    Swal.fire({
//                        icon: 'success',
//                        //title: 'Paid Successfully',
//                        title: 'Payment Proceed',
//                        // text: 'Physical Member!',
//                        confirmButtonText:"Ok",
//                        confirmButtonColor: '#0E2C4B',
//                    })
//                }
//            }else if(result.trim() == "0"){
//                Swal.fire({
//                    icon: 'error',
//                    title: 'Paid Unsuccessfully!',
//                    text: 'Payment cannot completed!',
//                    confirmButtonText:"Ok",
//                    confirmButtonColor: '#932828',
//                })
//            }else {
//                // alert(result);
//                Swal.fire({
//                    icon: 'error',
//                    title: 'Paid Unsuccessfully!',
//                    text: 'Payment cannot completed!',
//                    confirmButtonText:"Ok",
//                    confirmButtonColor: '#932828',
//                })
//            }
//
//        },
//        error: function(error){
//            console.log(error);
//            Swal.fire({
//                icon: 'error',
//                title: 'Payment Unsuccessfully!',
//                text: 'Cannot resolve, System issue!!',
//                confirmButtonText:"Ok",
//                confirmButtonColor: '#932828',
//            })
//        }
//    });
//}