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
// Ensure this function is called once on page load to set up the event listener
document.addEventListener('DOMContentLoaded', function () {
    const scrollDownArrow = document.getElementById('downArrow');
    const sections = document.querySelectorAll('section');  // Select all sections

    // Keep track of which section we are currently on
    let currentSectionIndex = 0;

    // Add event listener for clicking the "downArrow"
    scrollDownArrow.addEventListener('click', function () {
        scrollToNextSection();
    });

    // Function to scroll to the next section
    function scrollToNextSection() {
        // Move to the next section, but if we're at the last section, loop back to the first
        currentSectionIndex = (currentSectionIndex + 1) % sections.length;

        // Get the next section element
        const nextSection = sections[currentSectionIndex];

        // Scroll to the next section with smooth behavior
        window.scrollTo({
            top: nextSection.offsetTop - 50, // Adjust the offset to ensure no overlap
            behavior: 'smooth'
        });
    }
});

function toggleList() {
    var list = document.getElementById("optionsList");
    if (list.style.display === "none" || list.style.display === "") {
        list.style.display = "block"; // Show the list when the button is clicked
    } else {
        list.style.display = "none"; // Hide the list if clicked again
    }
}

function toggleList() {
    var list = document.getElementById("optionsList");
    if (list.style.display === "none" || list.style.display === "") {
        list.style.display = "block"; // Show the list when the button is clicked
    } else {
        list.style.display = "none"; // Hide the list if clicked again
    }
}

// Function to scroll to section 3
function scrollToSection3() {
    document.getElementById("section-3").scrollIntoView({ behavior: "smooth" });
}
