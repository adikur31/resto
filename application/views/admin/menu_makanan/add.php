<?php 
	$this->load->view('templates/header');
	$this->load->view('templates/sidebar');
	$this->load->view('templates/topbar');
 ?>
<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="row">
		<div class="col-lg">
			<div class="card shadow mb-4">
			    <div class="card-header py-3">
			      <h6 class="m-0 font-weight-bold text-primary">Form Tambah Makanan</h6>
			    </div>
			    <div class="card-body">
					<form action="<?= base_url('admin/menu_makanan/create') ?>" method="post" enctype="multipart/form-data">
						<div class="col-lg-10 offset-lg-1">
							<div class="row">
								<div class="col-lg-6">
									<div class="form-group">
									    <label for="nama">ID RESTORAN</label>
									    <input type="text" class="form-control" id="nama" name="id_restoran" placeholder="Masukkan id restoran" value="<?= set_value('nama') ?>">
									    <?= form_error('nama', '<small class="text-danger">', '</small>') ?>
								 	</div>			
								</div>

								<div class="col-lg-6">
									<div class="form-group">
									    <label for="nama">ID MENU</label>
									    <input type="text" class="form-control" id="nama" name="id_menu" placeholder="Masukkan id menu" value="<?= set_value('nama') ?>">
									    <?= form_error('nama', '<small class="text-danger">', '</small>') ?>
								 	</div>			
								</div>

								<div class="col-lg-6">
									<div class="form-group">
									    <label for="nama">NAMA MAKANAN</label>
									    <input type="text" class="form-control" id="nama" name="nama_makanan" placeholder="Masukkan nama makanan" value="<?= set_value('nama') ?>">
									    <?= form_error('nama', '<small class="text-danger">', '</small>') ?>
								 	</div>			
								</div>
									<div class="col-lg-6">
									<div class="form-group">
									    <label for="nama">HARGA</label>
									    <input type="text" class="form-control" id="nama" name="id_menu" placeholder="Masukkan harga" value="<?= set_value('nama') ?>">
									    <?= form_error('nama', '<small class="text-danger">', '</small>') ?>
								 	</div>			
								</div>

								<div class="col-lg-6">
									<div class="form-group">
									    <label for="nama">BAHAN</label>
									    <input type="text" class="form-control" id="nama" name="id_menu" placeholder="Masukkan nama bahan" value="<?= set_value('nama') ?>">
									    <?= form_error('nama', '<small class="text-danger">', '</small>') ?>
								 	</div>			
								</div>


								<div class="col-lg-6">
									<div class="form-group">
									    <label for="nama">JUMLAH</label>
									    <input type="text" class="form-control" id="nama" name="id_menu" placeholder="Masukkan jumlah bahan" value="<?= set_value('nama') ?>">
									    <?= form_error('nama', '<small class="text-danger">', '</small>') ?>
								 	</div>			
								</div>

								<div class="col-lg-6">
									<div class="form-group">
									  <button class="btn btn-primary">tambah bahan</button>
								 	</div>			
								</div>


					  		<div class="form-group">
							    <label for="exampleFormControlFile1">Foto MAKANAN<small class="text-muted">(boleh kosong)</small></label>
							    <div class="custom-file">
								  <input type="file" class="custom-file-input" id="foto" name="foto">
								  <label class="custom-file-label" for="customFile">Pilih file</label>
								  <?php if ($this->session->flashdata('message')): ?>
								  	<small class="text-danger"><?= $this->session->flashdata('message') ?></small>
								  <?php endif ?>
								</div>
						  	</div>
						  	<hr>
						  	<div class="col-lg-6">
						 	<div class="form-group text-left">
						 		<label></label>
								<button class="btn btn-success">Simpan</button>
								<a href="<?= base_url('admin/user'); ?>" class="btn btn-secondary">Batal</a>
							</div>
						</div>
						</div>
					</form>
			    </div>
			</div>
		</div>
	</div>
</div>

<?php 
	$this->load->view('templates/footer');
 ?>
