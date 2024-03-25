window.addEventListener('load', function() {

    var form = document.getElementById('login-form');

    form.addEventListener('submit', function(event) {

        var email = document.getElementById('email');
        var password = document.getElementById('password');

        email.addEventListener('animationend', function() {
            this.classList.remove('vibrate');
        });

        password.addEventListener('animationend', function() {
            this.classList.remove('vibrate');
        });

        if (email.value === '') {
            email.classList.add('vibrate');
            email.focus();
            event.preventDefault();
            return;
        }

        // check if valid email
        var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (!emailPattern.test(email.value)) {
            email.classList.add('vibrate');
            email.focus();
            event.preventDefault();
            return;
        }

        if (password.value === '') {
            password.classList.add('vibrate');
            password.focus();
            event.preventDefault();
            return;
        }

    });

});