<div class="container-fluid">
  <div class="card shadow mb-4">
   <div class="card-body">
     <div class="table-responsive">
       <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
         <thead class="thead-dark">
           <tr>
              <th class="text-center">No</th>
              <th class="text-center">ID Pegawai</th>
              <th class="text-center">Nama Pegawai</th>
              <th class="text-center">Username</th>
              <th class="text-center">Password Dulu</th>
              <th class="text-center">Password Baru</th>
           </tr>
         </thead>
         <tbody>
           <?php $no=1; foreach($log as $p) : ?>
            <tr>
              <td class="text-center"><?php echo $no++ ?></td>
              <td class="text-center"><?php echo $p->id_pegawai ?></td>
              <td class="text-center"><?php echo $p->nama_pegawai ?></td>
              <td class="text-center"><?php echo $p->username ?></td>
              <td class="text-center"><?php echo $p->password_dulu ?></td>
              <td class="text-center"><?php echo $p->password_baru ?></td>
              <?php if($p->log_ganti_pass) { ?>
                <?php } else { ?>
                <?php } ?>
              
            </tr>
          <?php endforeach; ?>
         </tbody>
       </table>
     </div>
   </div>
  </div>
</div>