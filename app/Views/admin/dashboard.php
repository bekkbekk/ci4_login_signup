<?= $this->extend('layouts/main'); ?>

<?= $this->section('css') ?>
<!-- STYLES HERE -->
<?= $this->endSection() ?>




<?= $this->section('content') ?>
<!-- CONTENT HERE -->
<div class="container">
    <div class="text-center py-5">
        <h1>ADMIN DASHBOARD</h1>
        <p>Welcome to the admin dashboard.</p>
    </div>

    <div class="admin-info">
        <h2 class="text-center">Admin Information</h2>
        <div class="row">
            <div class="col-md-6">
                <p><strong>Name:</strong> <?= $admin['firstname'] . ' ' . $admin['lastname'] ?></p>
                <p><strong>Email:</strong> <?= $admin['email_address'] ?></p>
            </div>
            <div class="col-md-6">
                <p><strong>Created At:</strong> <?= ($admin['created_at'] === NULL) ? 'N/A' : date('F j, Y', strtotime($admin['created_at'])) ?></p>
                <p><strong>Updated At:</strong> <?= ($admin['updated_at'] === NULL) ? 'N/A' : date('F j, Y', strtotime($admin['updated_at'])) ?></p>
            </div>
        </div>
    </div>

    <div class="content my-5 text-center">
        <h3>Content stil in progress ...</h3>
    </div>

    <div class="logout text-center">
        <a href="<?= base_url('auth/logout') ?>" class="btn btn-danger">Logout</a>
    </div>
</div>

<?= $this->endSection() ?>





<?= $this->section('scripts') ?>
<!-- SCRIPTS HERE -->

<?= $this->endSection() ?>