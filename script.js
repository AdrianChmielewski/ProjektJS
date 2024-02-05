let loggedUser = false;

function setCookie(name, value, days) {
    const expires = new Date();
    expires.setTime(expires.getTime() + days * 24 * 60 * 60 * 1000);
    document.cookie = `${name}=${value};expires=${expires.toUTCString()};path=/`;
}

function getCookie(name) {
    const cookies = document.cookie.split(';');
    for (const cookie of cookies) {
        const [cookieName, cookieValue] = cookie.trim().split('=');
        if (cookieName === name) {
            return cookieValue;
        }
    }
    return null;
}

function deleteCookie(name) {
    document.cookie = `${name}=;expires=Thu, 01 Jan 1970 00:00:00 UTC;path=/;`;
}


const usernameCookie = getCookie('username');
if (usernameCookie) {
    loggedUser = true;
}

let pogoda = {
    apiKey: "f228c3ab2541bb17a3aeca229ca3cdef",
    fetchWeather: function (miasto) {
        if (loggedUser) {
            fetch("https://api.openweathermap.org/data/2.5/weather?q=" + miasto + "&units=metric&appid=" + this.apiKey)
                .then((response) => response.json())
                .then((data) => this.displayWeather(data));
        } else {
            console.log('Musisz się zalogować, aby skorzystać z wyszukiwania pogody.');
        }
    },
    displayWeather: function (data) {
        const { name } = data;
        const { icon, description } = data.weather[0];
        const { temp, humidity } = data.main;
        const { speed } = data.wind;
        document.querySelector(".miasto").innerText = "Pogoda w " + name;
        document.querySelector(".icon").src = "https://openweathermap.org/img/wn/" + icon + ".png";
        document.querySelector(".opis").innerText = description;
        document.querySelector(".temp").innerText = temp + "°C";
        document.querySelector(".wilgotnosc").innerText = "Wilgotność: " + humidity + "%";
        document.querySelector(".wiatr").innerText = "Prędkość wiatru: " + speed + "km/h";
        document.querySelector(".pogoda").classList.remove("loading");
      
        showWeather();
    },
    search: function () {
        if (loggedUser) {
            this.fetchWeather(document.querySelector(".search-bar").value);
        } else {
            alert('Musisz się zalogować, aby skorzystać z wyszukiwania pogody.');
        }
    }
};

function showWeather() {
    document.querySelector(".pogoda").style.display = 'block';
}

document.querySelector("#search-btn").addEventListener("click", function () {
    pogoda.search();
});

document.querySelector(".search-bar").addEventListener("keyup", function (event) {
    if (event.key == "Enter") {
        pogoda.search();
    }
});

function validateForm(event) {
    event.preventDefault();

    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirmPassword').value;

    if (password !== confirmPassword || password.length < 4) {
        alert('Hasło musi mieć co najmniej 4 znaki i być identyczne.');
        return;
    }

    const formData = new FormData();
    formData.append('username', username); 
    formData.append('password', password);

    fetch('server.php', {
        method: 'POST',
        body: formData
    })
        .then(response => response.json())
        .then(data => {
            const loginMessage = document.getElementById('login-message');
            if (data.success) {
                loginMessage.innerText = 'Rejestracja udana!';
                loggedUser = true;
                document.getElementById('registrationForm').style.display = 'none';
               

                
                setCookie('username', username, 7);  
            } else {
                loginMessage.innerText = 'Błąd podczas rejestracji.';
            }
        })
        .catch(error => {
            console.error('Błąd podczas komunikacji z serwerem:', error);
        });
}

document.getElementById('registrationForm').addEventListener('submit', validateForm);

function login(event) {
    event.preventDefault();

    const loginUsername = document.getElementById('loginUsername').value;
    const loginPassword = document.getElementById('loginPassword').value;

    const loginData = new FormData();
    loginData.append('loginUsername', loginUsername);
    loginData.append('loginPassword', loginPassword);

    fetch('login.php', {
        method: 'POST',
        body: loginData
    })
        .then(response => response.json())
        .then(data => {
            const loginMessage = document.getElementById('login-message');
            if (data.success) {
                loginMessage.innerText = 'Logowanie udane!';
                loggedUser = true;
             
                document.getElementById('loginForm').style.display = 'none';
                document.getElementById('registrationForm').style.display = 'none';

                
                document.getElementById('logoutButton').style.display = 'block';
                pogoda.fetchWeather('Sopot');
                showWeather();
            } else {
                loginMessage.innerText = data.message || 'Błąd podczas logowania.';
            }
        })
        .catch(error => {
            console.error('Błąd podczas komunikacji z serwerem:', error);
        });
}

const logoutButton = document.getElementById('logoutButton');
logoutButton.addEventListener('click', () => {
    
    loggedUser = false;
 
    deleteCookie('username');
   
    document.getElementById('loginForm').style.display = 'block';
    document.getElementById('registrationForm').style.display = 'block';
    
    logoutButton.style.display = 'none';
    
    document.querySelector(".pogoda").style.display = 'none';
});
