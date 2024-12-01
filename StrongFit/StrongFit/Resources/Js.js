// Function to toggle the login form visibility
function toggleLoginForm() {
    var loginForm = document.getElementById('form1');  // Get the login form by its ID

    // Check if the login form is currently visible (displayed as flex)
    if (loginForm.style.display === 'flex') {
        loginForm.style.display = 'none';  // Hide the login form
    } else {
        loginForm.style.display = 'flex';  // Show the login form
    }
} document.addEventListener('DOMContentLoaded', function () {
    const images = [
        'Resources/images/homeImg1.jpg',
        'Resources/images/homeImg4.jpg',
        'Resources/images/homeImg3.jpeg',
        'Resources/images/homeImg2.jpg',
        'Resources/images/homeImg5.jpg',
    ];

    let currentIndex = 0;
    const imgElement = document.getElementById('mainImage');

    // Function to change the image
    function changeImage() {
        // Fade out the current image and move it to the right
        imgElement.style.transition = 'opacity 1s, transform 1s'; // Set transition for both opacity and movement
        imgElement.style.opacity = '0';
        imgElement.style.transform = 'translateX(100%)'; // Move the image out to the right

        // After the transition is complete, change the image and reset styles
        setTimeout(() => {
            // Change the image source
            imgElement.src = images[currentIndex];
            // Move to the next image index
            currentIndex = (currentIndex + 1) % images.length;

            // Reset styles for the new image
            imgElement.style.transition = 'none'; // Disable transition for the reset
            imgElement.style.transform = 'translateX(-100%)'; // Position the new image off-screen to the left
            imgElement.style.opacity = '1'; // Set opacity back to 1

            // Force a reflow to apply the off-screen position
            imgElement.offsetHeight; // This triggers reflow

            // After forcing reflow, enable transition for the new image
            imgElement.style.transition = 'opacity 1s, transform 1s'; // Enable transition again

            // Slide the new image into view
            imgElement.style.transform = 'translateX(0)';
        }, 1000); // Wait for the fade-out and move-to-right transition to complete
    }

    // Initial setup: Set the first image and make it visible
    imgElement.src = images[currentIndex]; // Set the first image source
    imgElement.style.opacity = '1'; // Make the image visible
    imgElement.style.transform = 'translateX(0)'; // Ensure the image starts from the visible position

    // Start the image transition immediately
    setTimeout(() => {
        imgElement.style.transform = 'translateX(0)';
    }, 300); // Short delay to start sliding in

    // Set an interval to change the image every 10 seconds
    setInterval(changeImage, 10000); // Change image every 10 seconds
});
function dropArrow() {
    var scrollDownArrow = document.getElementById('downArrow');
    var nextSection = document.querySelector('.next-section');  // This is the target for scrolling

    // Remove any previously attached event listeners to avoid duplicates
    scrollDownArrow.removeEventListener('click', scrollToNextSection);

    // Add a click event listener to the scroll down arrow
    scrollDownArrow.addEventListener('click', scrollToNextSection);

    // Function to scroll to the next section
    function scrollToNextSection() {
        // Check if the next section exists
        if (nextSection) {
            nextSection.scrollIntoView({
                behavior: 'smooth',
                block: 'start'  // Ensures the next section aligns at the top of the viewport
            });
        }
    }
}