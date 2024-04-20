function updateGenderAndAgeFromNIC(inputElementId, genderOutputId, dobOutputId, proceedButtonId, errorDivId) {
    const nic = document.getElementById(inputElementId).value.trim();
    let birthYear, gender, dayOfYear;
    let dob;

    if (nic.length === 10) { // Old NIC format
        birthYear = "19" + nic.substring(0, 2);
        dayOfYear = parseInt(nic.substring(2, 5), 10);
        gender = dayOfYear > 500 ? "Female" : "Male";
        dayOfYear = dayOfYear > 500 ? dayOfYear - 500 : dayOfYear;
    } else if (nic.length === 12) { // New NIC format
        birthYear = nic.substring(0, 4);
        dayOfYear = parseInt(nic.substring(4, 7), 10);
        gender = dayOfYear > 500 ? "Female" : "Male";
        dayOfYear = dayOfYear > 500 ? dayOfYear - 500 : dayOfYear;
    } else {
        alert("Invalid NIC number format.");
        return;
    }

    dob = convertDayOfYearToDate(birthYear, dayOfYear);
    if (!dob) {
        alert("Invalid Date. Please check the NIC number.");
        return;
    }

    // Update hidden inputs for gender and DOB
    document.getElementById(genderOutputId).value = gender;
    document.getElementById(dobOutputId).value = dob;

    const age = calculateAgeFromDOB(dob);
    if (age < 18) {
        alert("You must be 18 years or older to register.");
    } else {
        document.getElementById('age').value = age; // Only set the age if valid (18 or older)
    }
}

function convertDayOfYearToDate(year, dayOfYear) {
    const date = new Date(year, 0); // Start at Jan 1st
    date.setDate(dayOfYear); // Add the days
    if (!isValidDate(date)) {
        return null;
    }
    return date.toISOString().split('T')[0]; // Format as YYYY-MM-DD
}

function calculateAgeFromDOB(dob) {
    const dobDate = new Date(dob);
    const today = new Date();
    let age = today.getFullYear() - dobDate.getFullYear();
    const m = today.getMonth() - dobDate.getMonth();
    if (m < 0 || (m === 0 && today.getDate() < dobDate.getDate())) {
        age--;
    }
    return age;
}

function isValidDate(date) {
    return date instanceof Date && !isNaN(date.getTime());
}
