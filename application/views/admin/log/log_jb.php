<div class="container-fluid">
  <div class="card shadow mb-4">
   <div class="card-body">
     <div class="table-responsive">
       <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
         <thead class="thead-dark">
           <tr>
              <th class="text-center">No</th>
              <th class="text-center">ID jabatan</th>
              <th class="text-center">Nama Jabatan Baru</th>
              <th class="text-center">Gaji Baru</th>
              <th class="text-center">Tunjangan Baru</th>
              <th class="text-center">Uang Makan Baru</th>
           </tr>
         </thead>
         <tbody>
           <?php $no=1; foreach($jabatan as $p) : ?>
            <tr>
              <td class="text-center"><?php echo $no++ ?></td>
              <td class="text-center"><?php echo $p->id_jabatan ?></td>
              <td class="text-center"><?php echo $p->nama_jabatan_update ?></td>
              <td class="text-center"><?php echo $p->gaji_update ?></td>
              <td class="text-center"><?php echo $p->tj_transport_update ?></td>
              <td class="text-center"><?php echo $p->uang_makan_update ?></td>
             
              
            </tr>
          <?php endforeach; ?>
         </tbody>
       </table>
     </div>
   </div>
  </div>
</div>