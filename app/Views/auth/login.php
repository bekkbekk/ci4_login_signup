<?= $this->extend('/layouts/main') ?>

<?= $this->section('css') ?>
<link rel="stylesheet" href="/assets/css/auth.css">

<style>
    body {
        padding-top: 10% !important;
    }

    <?php if (session()->getFlashdata('notif') && session()->getFlashdata('notif')['status'] === 'error') : ?>.ajs-message {
        background-color: #D37281 !important;
        color: #fff;
    }

    <?php else : ?>.ajs-message {
        background-color: #7DCFB6 !important;
        color: #fff;
    }

    <?php endif; ?>
</style>
<?= $this->endSection() ?>



<?= $this->section('content') ?>
<div class="form_wrapper">
    <div class="form_container">
        <div class="title_container">
            <img class="logo" src="/assets/images/RL_Logo.png">
            <h2 class="fw-semibold"><span class="text-blue">Login</span> Form</h2>
        </div>
        <div class="row clearfix">
            <div>
                <form id="login-form" method="POST" action="<?= base_url('auth/do-login') ?>">

                    <label for="email">Email Address</label>
                    <div class="input_field"> <span><i aria-hidden="true" class="fa fa-envelope"></i></span>
                        <input type="text" id="email" name="email" placeholder="Email" required />
                    </div>

                    <label for="password">Password</label>
                    <div class="input_field"> <span><i aria-hidden="true" class="fa fa-lock"></i></span>
                        <input type="password" id="password" name="password" placeholder="Password" required />
                    </div>

                    <input class="button" type="submit" value="Login" />
                </form>

            </div>
        </div>
    </div>
    <div class="signup mt-4">
        <p class="text-center">
            Don't have an account? <a href="<?= base_url('auth/register') ?>">Register</a>
        </p>
    </div>
</div>
<?= $this->endSection() ?>



<?= $this->section('scripts') ?>
<script src="/assets/js/login-validation.js"></script>

<?php if (session()->getFlashdata('notif')) : ?>
    <script>
        alertify.set('notifier', 'position', 'top-right');
        alertify.error('<?= session()->getFlashdata('notif')['message'] ?>');
    </script>
<?php endif; ?>

<?= $this->endSection() ?>