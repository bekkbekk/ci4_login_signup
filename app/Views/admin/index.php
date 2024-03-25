<?= $this->extend('layouts/main') ?>


<?= $this->section('css') ?>
<link rel="stylesheet" href="/assets/css/dashboard.css">
<?= $this->endSection() ?>

<?= $this->section('content') ?>

<?= $this->include('inc/navbar') ?>

<div class="container-fluid">
  <div class="row">
    <?= $this->include('inc/sidebar') ?>
    <main class="col-md-10 ms-sm-auto col-lg-10 pt-3 px-4">

      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
        <h1 class="h2"><i class="fa fa-tachometer"></i> Dashboard</h1>
        <!-- <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
            <button class="btn btn-sm btn-primary">Share</button>
            <button class="btn btn-sm btn-primary">Export</button>
          </div>
          <button class="btn btn-sm btn-primary dropdown-toggle">
            <i class="fa fa-calendar"></i>
            This week
          </button>
        </div> -->
      </div>

      <div class="row">
        <div class="col-lg-3 col-md-3 col-sm-12 pe-0 mb-3">
          <div class="card text-white bg-primary h-100">
            <div class="card-header"><i class="fa fa-shopping-bag"></i> New Users</div>
            <div class="card-body">
              <h3 class="card-title"><?= $count['newUsers'] ?></h3>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-12 pe-0 mb-3">
          <div class="card text-white bg-success h-100">
            <div class="card-header"><i class="fa fa-bar-chart"></i> Active</div>
            <div class="card-body">
              <h3 class="card-title"><?= $count['activeUsers'] ?></h3>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-12 pe-0 mb-3">
          <div class="card text-white bg-warning h-100">
            <div class="card-header"><i class="fa fa-user-plus"></i> User Registrations</div>
            <div class="card-body">
              <h3 class="card-title"><?= $count['allUsers'] ?></h3>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-12 pe-0 mb-3">
          <div class="card text-white bg-danger h-100">
            <div class="card-header"><i class="fa fa-pie-chart"></i> Deleted Users</div>
            <div class="card-body">
              <h3 class="card-title"><?= $count['deletedUsers'] ?></h3>
            </div>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-lg-6 col-md-6 col-sm-12 pe-0 mb-3">
          <div class="card-collapsible card">
            <div class="card-header">
              User Roles <i class="fa fa-caret-down caret"></i>
            </div>
            <div class="card-body d-flex justify-content-around">
              <canvas class="chart w-100" id="pieChart"></canvas>
            </div>
          </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 pe-0 mb-3">
          <div class="card-collapsible card">
            <div class="card-header">
              EWAN PA <i class="fa fa-caret-down caret"></i>
            </div>
            <div class="card-body d-flex justify-content-around">
              <canvas class="chart w-100" id="barChart"></canvas>
            </div>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="pe-0 mb-3">
          <div class="card-collapsible card">
            <div class="card-header">
            <span><i class="fa-solid fa-users"></i> Users</span> <i class="fa fa-caret-down caret"></i>
            </div>
            <div class="card-body table-responsive">
              <table class="table">
                <thead class="thead bg-blue text-white">
                  <tr>
                    <th scope="col">First Name</th>
                    <th scope="col">Last Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Created At</th>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($allUsers as $user) : ?>
                    <tr>
                      <td><?= $user['firstname'] ?></td>
                      <td><?= $user['lastname'] ?></td>
                      <td><?= $user['email_address'] ?></td>
                      <td><?= date('F j, Y g:i A', strtotime($user['created_at'])) ?></td>
                    </tr>
                  <?php endforeach; ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <!-- <div class="col-lg-6 col-md-6 col-sm-12 pe-0 mb-3">
          <div class="card-collapsible card">
            <div class="card-header">
              Quick Form <i class="fa fa-caret-down caret"></i>
            </div>
            <div class="card-body">
              <form>

                <div class="input-group mb-2">
                  <input type="email" class="form-control" placeholder="Assignee's email">
                </div>

                <div class="form-group mb-2">
                  <input type="text" class="form-control" placeholder="Ticket title">
                </div>

                <div class="form-group mb-2">
                  <textarea class="form-control" placeholder="Ticket description" cols="30" rows="5"></textarea>
                </div>

                <div class="form-group row">
                  <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">
                      <i class="fa fa-send"></i>
                      Submit Ticket
                    </button>
                  </div>
                </div>

              </form>
            </div>
          </div>
        </div> -->
      </div>

    </main>
  </div>
</div>

<?= $this->endSection() ?>

<?= $this->section('scripts') ?>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>
<script>
  var chartData = <?= json_encode($chartData) ?>;
</script>
<script src="/assets/js/dashboard.js"></script>
<script src="/assets/js/chart.js"></script>

<?= $this->endSection() ?>
</body>

</html>