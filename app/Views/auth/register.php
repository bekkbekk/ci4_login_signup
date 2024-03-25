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

    <?php endif; ?>
</style>
<?= $this->endSection() ?>



<?= $this->section('content') ?>
<div class="form_wrapper">
    <div class="form_container">
        <div class="title_container">
            <img class="logo" src="/assets/images/RL_Logo.png">
            <h2 class="fw-semibold"><span class="text-blue">Register</span> Form</h2>
        </div>
        <div class="row clearfix">
            <div>
                <form id="login-form" method="POST" action="<?= base_url('auth/do-register') ?>">

                    <label for="firstname">First Name <span class="text-danger fw-semibold">*</span></label>
                    <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>
                        <input type="text" id="firstname" name="firstname" placeholder="First Name" autofocus />
                    </div>

                    <label for="lastname">Last Name <span class="text-danger fw-semibold">*</span></label>
                    <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>
                        <input type="text" id="lastname" name="lastname" placeholder="Last Name" />
                    </div>

                    <label for="marital_status">Marital Status </label>
                    <div class="input_field">
                        <span><i class="fa-solid fa-person"></i></span>
                        <select id="marital_status" name="marital_status">
                            <option value="">Prefer not to say</option>
                            <?php foreach ($parameters as $param) : ?>
                                <?php if ($param['category'] === 'marital_status') : ?>
                                    <option value="<?= $param['id'] ?>"><?= $param['parameter_name'] ?></option>
                                <?php endif; ?>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <label for="job_title">Job Title </label>
                    <div class="input_field">
                        <span><i class="fa-solid fa-user-doctor"></i></span>
                        <select id="job_title" name="job_title">
                            <option value="">Prefer not to say</option>
                            <?php foreach ($parameters as $param) : ?>
                                <?php if ($param['category'] === 'job_title') : ?>
                                    <option value="<?= $param['id'] ?>"><?= $param['parameter_name'] ?></option>
                                <?php endif; ?>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <label for="gender">Gender </label>
                    <div class="input_field">
                        <span><i class="fa-solid fa-venus-mars"></i></span>
                        <select id="gender" name="gender">
                            <option value="">Prefer not to say</option>
                            <?php foreach ($parameters as $param) : ?>
                                <?php if ($param['category'] === 'gender') : ?>
                                    <option value="<?= $param['id'] ?>"><?= $param['parameter_name'] ?></option>
                                <?php endif; ?>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <label for="religion">Religion </label>
                    <div class="input_field">
                        <span><i class="fa-solid fa-church"></i></span>
                        <select id="religion" name="religion">
                            <option value="">Prefer not to say</option>
                            <?php foreach ($parameters as $param) : ?>
                                <?php if ($param['category'] === 'religion') : ?>
                                    <option value="<?= $param['id'] ?>"><?= $param['parameter_name'] ?></option>
                                <?php endif; ?>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <label for="email">Email <span class="text-danger fw-semibold">*</span></label>
                    <div class="input_field"> <span><i aria-hidden="true" class="fa fa-envelope"></i></span>
                        <input type="email" id="email" name="email" placeholder="Email" />
                    </div>

                    <label for="password">Password <span class="text-danger fw-semibold">*</span></label>
                    <div class="input_field"> <span><i aria-hidden="true" class="fa fa-lock"></i></span>
                        <input type="password" id="password" name="password" placeholder="Password" />
                    </div>

                    <input class="button" type="submit" value="Register" />
                </form>

            </div>
        </div>
    </div>
    <div class="login mt-4">
        <p class="text-center">
            Already have an account? <a href="<?= base_url('auth/login') ?>">Login</a>
        </p>
    </div>
</div>
<?= $this->endSection() ?>



<?= $this->section('scripts') ?>
<!-- <script src="/assets/js/register-validation.js"></script> -->

<?php if (session()->getFlashdata('notif')) : ?>
    <script>
        alertify.set('notifier', 'position', 'top-right');
        alertify.error('<?= session()->getFlashdata('notif')['message'] ?>');
    </script>
<?php endif; ?>

<?= $this->endSection() ?>