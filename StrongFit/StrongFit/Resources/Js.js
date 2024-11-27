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

<<<<<<< HEAD
function changeImage() {
    const image = document.getElementById('mainImage');
    image.style.backgroundImage = "url('" + images[currentIndex] + "')";
    currentIndex = (currentIndex+1) % images.length;
}

const images = [
    'Resources/images/homeImg1.jpg',
    'Resources/images/homeImg4.jpg',
    'Resources/images/homeImg3.jpeg',
    'Resources/images/homeImg5.jpg',
    'Resources/images/homeImg2.jpg',
];//image to be transitioned t

let currentIndex = 0;

window.setInterval(() => changeImage(), 10000)


=======
var image = new Image();
image.onload = function () {
    $(".element").css("background-image", "url('" + image.src + "')");
}

image.src = [
    'Resources/images/homeImg1.jpg',
    'Resources/images/homeImg4.jpg',
    'Resources/images/homeImg3.jpeg',
    'Resources/images/homeImg5.jpg',
    'Resources/images/homeImg2.jpg',

];//image to be transitioned t
>>>>>>> 724d10b3adeae9dae970688f2069674acc7a9d2b
