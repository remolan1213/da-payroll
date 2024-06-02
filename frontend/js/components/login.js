// login.js
document.getElementById('login-form').addEventListener('submit', async (event) => {
    event.preventDefault();
    
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
   
    try {
        const response = await axios.post('/', { username, password });
        console.log(response.data); // Handle response from server
        console.log("Login successful");
        console.log(username, password);
    } catch (error) {
        console.error(error);
    }
});