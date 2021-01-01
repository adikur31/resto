<?php 
	$this->load->view('templates/header');
	$this->load->view('templates/sidebar');
	$this->load->view('templates/topbar');
 ?>
<!-- Begin Page Content -->
<div class="container-fluid">
	<?php
		if (form_error('latitude') || form_error('longtitude')) {
			echo '<div class="alert alert-danger" role="alert">Gagal simpan, Pilih Lokasi Sekolah</div>';
		} 	 
	?>
	<div class="row">
		<div class="col-lg">
			<div class="card shadow mb-4">
			    <div class="card-header py-3">
			      <h6 class="m-0 font-weight-bold text-primary">Pilih Lokasi Sekolah</h6>
			    </div>
			    <div class="card-body">
			    	<div id="map" style="height: 350px;">
			    	</div>
			    </div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg">
			<div class="card shadow mb-4">
			    <div class="card-header py-3">
			      <h6 class="m-0 font-weight-bold text-primary">Form Edit Sekolah</h6>
			    </div>
			    <div class="card-body">
					<form action="<?= base_url('admin/sekolah/update/'.$sekolah_data['id_sekolah']) ?>" method="post">
						<div class="col-lg-10 offset-lg-1">
							<div class="row">
								<div class="col-lg">
									<div class="form-group">
									    <label for="nama_sekolah">Nama Sekolah</label>
									    <input type="text" class="form-control" id="nama_sekolah" name="nama_sekolah" placeholder="Masukkan Nama Sekolah" value="<?= $sekolah_data['nama_sekolah'] ?>">
									    <?= form_error('nama_sekolah', '<small class="text-danger">', '</small>') ?>
								 	</div>
								</div>
								<div class="col-lg">
									 <div class="form-group">
									    <label for="nama_kepala_sekolah">Nama Kepala Sekolah</label>
									    <input type="text" class="form-control" id="nama_kepala_sekolah" name="nama_kepala_sekolah" placeholder="Masukkan Nama Kepala Sekolah" value="<?= $sekolah_data['nama_kepala_sekolah'] ?>">
									    <?= form_error('nama_kepala_sekolah', '<small class="text-danger">', '</small>') ?>
								  	</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg">
									<div class="form-group">
									    <label for="alamat_sekolah">Alamat Sekolah</label>
									    <input type="text" class="form-control" id="alamat_sekolah" name="alamat_sekolah" placeholder="Masukkan Alamat Sekolah" value="<?= $sekolah_data['alamat_sekolah'] ?>">
									    <?= form_error('alamat_sekolah', '<small class="text-danger">', '</small>') ?>
								  	</div>	
								</div>
								<div class="col">
									<div class="form-group">
									    <label for="nomor_telepon">Nomor Telepon</label>
									    <input type="text" class="form-control" id="nomor_telepon" name="nomor_telepon" placeholder="Masukkan Nomor Telepon" value="<?= $sekolah_data['no_telepon'] ?>">
									    <?= form_error('nomor_telepon', '<small class="text-danger">', '</small>') ?>
								  	</div>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<div class="form-group">
									    <label for="latitude">Latitude</label>
									    <input readonly type="text" class="form-control" id="latitude" name="latitude" placeholder="Masukkan Latitude" value="<?= $sekolah_data['latitude'] ?>">
									    <?= form_error('latitude', '<small class="text-danger">', '</small>') ?>
								  	</div>		
								</div>
								<div class="col">
									<div class="form-group">
									    <label for="longtitude">Longtitude</label>
									    <input readonly type="text" class="form-control" id="longtitude" name="longtitude" placeholder="Masukkan Longtitude" value="<?= $sekolah_data['longtitude'] ?>">
									    <?= form_error('longtitude', '<small class="text-danger">', '</small>') ?>
								  	</div>		
								</div>
							</div>

						 	<hr>
						 	<div class="form-group text-right">
						 		<label></label>
								<button class="btn btn-success">Simpan</button>
								<a href="<?= base_url('admin/sekolah'); ?>" class="btn btn-secondary">Batal</a>
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

<script type="text/javascript">
	
	var map = L.map('map').setView([-7.25, 112.73], 13);
	var base_url = window.location.origin + '/' + window.location.pathname.split ('/') [1] + '/';
	var datasekolah = <?php echo json_encode($sekolah_data) ?>;
	console.log(datasekolah.latitude);

	// add map
	L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
	    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
	}).addTo(map);

	// add marker
	var sekolah = L.marker([datasekolah.latitude, datasekolah.longtitude], {draggable: 'true', autoPan: 'true'}).addTo(map);
	sekolah.bindPopup('Drag ke lokasi sekolah <br>'+ sekolah.getLatLng()).openPopup();
	
	// set drag marker
	sekolah.on("drag", function(e) {
		$('#latitude').val(sekolah.getLatLng().lat);
		$('#longtitude').val(sekolah.getLatLng().lng);
		sekolah.bindPopup('Drag ke lokasi anda <br>'+ sekolah.getLatLng()).openPopup();
	});

	
</script>