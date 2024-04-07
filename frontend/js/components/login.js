function submitForm(event) {
    event.preventDefault(); // Prevent the form from submitting normally
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;

    // Serialize form data into JSON
    var data = JSON.stringify({
        username: username,
        password: password
    });

    // Make a POST request to the Postman mock server
    fetch('https://a0a2add1-927f-4e47-a175-6c5a4e6e4c05.mock.pstmn.io/info', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: data
    })
    .then(response => response.json())
    .then(data => console.log(data))
    .catch(error => console.error('Error:', error));
}
