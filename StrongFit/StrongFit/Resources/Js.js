

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
    // Array of image sources
    const images = [
        'Resources/images/homeImg1.jpg',
        'Resources/images/homeImg4.jpg',
        'Resources/images/homeImg3.jpeg',
        'Resources/images/homeImg5.jpg',
        'Resources/images/homeImg2.jpg',
        
    ];

    let currentIndex = 0;

    function changeImage() {
        const imgElement = document.getElementById('mainImage');
        currentIndex = (currentIndex + 1) % images.length;
        imgElement.src = images[currentIndex];
    }

    // Change image every 5 seconds
    setInterval(changeImage, 3000);
