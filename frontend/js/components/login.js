// login.js
document.getElementById('login-form').addEventListener('submit', async (event) => {
    event.preventDefault();
    
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
   
    try {
        const response = await axios.post('https://9c0a39ce-8d58-4d23-8bd6-5b180d54b691.mock.pstmn.io', { username, password });
        console.log(response.data); // Handle response from server
        console.log("Login successful");
        console.log(username, password);
    } catch (error) {
        console.error(error);
    }
});