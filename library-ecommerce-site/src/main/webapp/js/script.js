/**
 * Just Vanilla JavaScript Code
 */
const rating = document.querySelector('.rating');


function toggleText(element) {
  element.classList.toggle("expanded-text");
}


function toggleTexts(element) {
  element.classList.toggle('expanded'); 
}


rating.addEventListener("click", ()=>{
	const fields = document.getElementById("fields");
	      fields.classList.toggle("hidden-fields");
})

function rateStars(starCount) {
    const stars = document.querySelectorAll('.star');
    const ratingValue = document.getElementById('ratingValue');

    stars.forEach((star, index) => {
        if (index < starCount) {
            star.textContent = '★'; 
            star.classList.add('selected');
        } else {
            star.textContent = '☆'; 
            star.classList.remove('selected');
        }
    });

    ratingValue.value = starCount; 
}

function hoverStars(starCount) {
    const stars = document.querySelectorAll('.star');

    stars.forEach((star, index) => {
        if (index < starCount) {
            star.classList.add('hovered'); 
        } else {
            star.classList.remove('hovered'); 
        }
    });
}

function resetHover() {
    const stars = document.querySelectorAll('.star');
    stars.forEach(star => star.classList.remove('hovered'));
}


function checkPasswordMatch() {
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;
    const errorElement = document.getElementById("passwordError");

    if (password !== confirmPassword) {
        errorElement.textContent = "Passwords do not match!";
    } else {
        errorElement.textContent = ""; 
    }
}

function validateForm() {
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;
    
    if (password !== confirmPassword) {
        document.getElementById("passwordError").textContent = "Passwords do not match!";
        return false;
    }
    return true; 
}

function fetchSuggestions(query) { 
    if (query.length === 0) {
        document.getElementById('suggestions').style.display = 'none';
        return;
    }

    const xhr = new XMLHttpRequest();
    xhr.open("GET", `/library-ecommerce-site/SearchSuggestions?query=${encodeURIComponent(query)}`, true);

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            const suggestions = JSON.parse(xhr.responseText);
            displaySuggestions(suggestions);
        }
    };
    xhr.send();
}

function fetchSuggestions(query) { 
    if (query.length === 0) {
        document.getElementById('suggestions').style.display = 'none';
        return;
    }

    const xhr = new XMLHttpRequest();
    xhr.open("GET", `/library-ecommerce-site/SearchSuggestions?query=${encodeURIComponent(query)}`, true);

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            const suggestions = JSON.parse(xhr.responseText);
            displaySuggestions(suggestions);
        }
    };
    xhr.send();
}

function displaySuggestions(suggestions) {
    console.log(suggestions);  
    const suggestionsDiv = document.getElementById('suggestions');
    suggestionsDiv.innerHTML = ''; 
    if (!suggestions || suggestions.length === 0) {
        suggestionsDiv.style.display = 'none';
        return;
    }
    suggestions.forEach(suggestion => {
        const itemDiv = document.createElement('div');
        itemDiv.textContent = `${suggestion.book_name}`;
        itemDiv.onclick = () => {
            document.getElementById('search-input').value = suggestion.book_name;
            document.getElementById('book-id').value = suggestion.id; 
            suggestionsDiv.style.display = 'none';
        };
        suggestionsDiv.appendChild(itemDiv);
    });
    suggestionsDiv.style.display = 'block';
}

function searchBook() {
    const bookId = document.getElementById('book-id').value; 
    
    if (bookId) {
 
        window.location.href = `book.jsp?id=${bookId}`;
    } else {
        alert("Please select a book from the suggestions.");
    }
}
