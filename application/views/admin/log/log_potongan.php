<div class="container-fluid">
  <div class="card shadow mb-4">
   <div class="card-body">
     <div class="table-responsive">
       <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
         <thead class="thead-dark">
           <tr>
              <th class="text-center">No</th>
              <th class="text-center">Nama Potongan Dulu</th>
              <th class="text-center">Nama Potongan Baru</th>
              <th class="text-center">Jumlah Potongan Dulu</th>
              <th class="text-center">Jumlah Potongan Baru</th>
           </tr>
         </thead>
         <tbody>
           <?php $no=1; foreach($log as $p) : ?>
            <tr>
              <td class="text-center"><?php echo $no++ ?></td>
              <td class="text-center"><?php echo $p->potongan_dulu ?></td>
              <td class="text-center"><?php echo $p->potongan_baru ?></td>
              <td class="text-center"><?php echo $p->jml_potongan_dulu ?></td>
              <td class="text-center"><?php echo $p->jml_potongan_baru ?></td>
              
            </tr>
          <?php endforeach; ?>
         </tbody>
       </table>
     </div>
   </div>
  </div>
</div>