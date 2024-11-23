// Function to toggle the login form visibility
function toggleLoginForm() {
    var loginForm = document.getElementById('form1');  // Get the login form by its ID

    // Check if the login form is currently visible (displayed as flex)
    if (loginForm.style.display === 'flex') {
        loginForm.style.display = 'none';  // Hide the login form
    } else {
        loginForm.style.display = 'flex';  // Show the login form
    }
}
