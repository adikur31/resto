<?php 
  $this->load->view('templates/auth_header');
?>

<div class="container">

  <div class="card o-hidden border-0 shadow-lg my-5 col-lg-6 mx-auto">
    <div class="card-body p-0">
      <!-- Nested Row within Card Body -->
      <div class="row">
        <div class="col">
          <div class="p-5">
            <div class="text-center">
              <h1 class="h4 text-gray-900 mb-4">Buat Akun</h1>
            </div>
            <form class="user" method="post" action="<?=base_url('auth/register') ?>">
              <div class="form-group">
                <input type="text" class="form-control form-control-user" id="nama" name="nama" placeholder="Nama User" value="<?= set_value('nama') ?>">
                <?= form_error('nama', '<small class="text-danger pl-3">', '</small>') ?>
              </div>
              <div class="form-group">
                <input type="text" class="form-control form-control-user" id="username" name="username" placeholder="username" value="<?= set_value('username') ?>">
                <?= form_error('username', '<small class="text-danger pl-3">', '</small>') ?>
              </div>
              <div class="form-group row">
                <div class="col-sm-6 mb-3 mb-sm-0">
                  <input type="password" class="form-control form-control-user" id="password1" name="password1" placeholder="Password">
                  <?= form_error('password1', '<small class="text-danger pl-3">', '</small>') ?>
                </div>
                <div class="col-sm-6">
                  <input type="password" class="form-control form-control-user" id="password2" name="password2" placeholder="Ulangi Password">
                </div>
              </div>
              <div class="form-group">
                <input type="text" class="form-control form-control-user" id="nama_restoran" name="nama_restoran" placeholder="Nama Restoran" value="<?= set_value('nama_restoran') ?>">
                <?= form_error('nama_restoran', '<small class="text-danger pl-3">', '</small>') ?>
              </div>
              <div class="form-group">
                <input type="text" class="form-control form-control-user" id="alamat_restoran" name="alamat_restoran" placeholder="Alamat Restoran" value="<?= set_value('alamat_restoran') ?>">
                <?= form_error('alamat_restoran', '<small class="text-danger pl-3">', '</small>') ?>
              </div>
              <button type="submit" class="btn btn-primary btn-user btn-block">
                Daftar
              </button>
            </form>
            <hr>
            <div class="text-center">
              <a class="small" href="#">Lupa Password?</a>
            </div>
            <div class="text-center">
              <a class="small" href="<?= base_url('auth'); ?>">Sudah Punya Akun? Login!</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</div>

<?php 
  $this->load->view('templates/auth_footer');
?>