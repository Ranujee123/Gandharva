$(document).ready(function() {
    let totalAmount = 0;
    const currentDate = new Date();
//    const currentMonth = (currentDate.getMonth() + 1).toString().padStart(2, '0');
    const currentMonthAbbreviation = currentDate.toLocaleString('default', { month: 'short' });

    $.ajax({
        method: "GET",
        url: "payment/getAll/requestId",
        success: function(result) {
            $.each(result, function(index, x) {
                console.log(x);
                console.log(index);
//                const paymentMonth = x.paymentDate.split('-')[1];
                const paymentMonthAbbreviation = x.paymentDate.split(' ')[0];
                console.log(paymentMonthAbbreviation);
                if (paymentMonthAbbreviation === currentMonthAbbreviation) {
                    totalAmount += x.paymentAmount;
                }

                if(index === 0){
                    $('#payment--card--text-last').append(
                        `<h3>Date </h3>
                        <h4>${x.paymentDate}</h4>
                        <div class="month">Last payment done</div>`
                    );
                }

                $('#payment-details-table').append(
                    `<tr>
                        <td>${x.paymentDate}</td>
                        <td>${x.paymentTime}</td>
                        <td>${x.cusFirstName} ${x.cusLastName}</td>
                        <td>
                            LKR ${x.paymentAmount}
                        </td>
                        <td>
                            <button class="transaction--statement" onClick='viewPDF("${x.statement}")'>
                                View
                            </button>
                        </td>
                    </tr>`
                );
            })

           $('#payment--card--text').append(
                `<h3>Total Amount </h3>
                <h4> Rs. ${totalAmount}</h4>
                <div class="month"> For the Month of ${currentMonthAbbreviation}</div>`
           );
        },
        error: function(error) {
            console.log(error);
        }
    });
});

function viewPDF(blobData) {
    // Split the string by commas and convert each substring to a number
    const byteNumbers = blobData.split(',').map(Number);

    // Create a Uint8Array from the array of numbers
    const uint8Array = new Uint8Array(byteNumbers);

    // Create a Blob from the Uint8Array
    const blob = new Blob([uint8Array], { type: 'application/pdf' });

    // Open the PDF in a new window
    window.open(URL.createObjectURL(blob));
}