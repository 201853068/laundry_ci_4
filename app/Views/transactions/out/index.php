<?= $this->extend('layouts/master'); ?>

<?= $this->section('css-libraries'); ?>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/izitoast@1.4.0/dist/css/iziToast.min.css" integrity="sha256-f6fW47QDm1m01HIep+UjpCpNwLVkBYKd+fhpb4VQ+gE=" crossorigin="anonymous">
<?= $this->endSection(); ?>

<?= $this->section('body'); ?>
<div class="row justify-content-between">
    <div class="col-lg-4 my-1">
        <a href="/transactions/transaksi-pengambilan/create" class="btn btn-primary"><i class="fas fa-plus"></i> Tambah Data</a>
    </div>
    <?php if (isset($_GET['keyword'])) : ?>
        <div class="col-lg-4 my-1">
            <a href="/transactions/transaksi-pengambilan" class="btn btn-warning">Reset Pencarian</a>
        </div>
    <?php endif ?>
    <div class="col-lg-4 my-1">
        <form action="" method="get">
            <div class="input-group">
                <input type="text" class="form-control" name="keyword" placeholder="Ketik nama atau no. transaksi" autocomplete="off">
                <div class="input-group-append">
                    <button class="btn btn-secondary" type="submit">Cari</button>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="row mt-3">
    <div class="col-lg-12">
        <div class="card shadow">
            <div class="card-body">
                <?php if (!$pengambilan) : ?>
                    <h6 class="text-center m-0">Tidak ada data</h6>
                <?php else : ?>
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr class="text-center">
                                    <th>#</th>
                                    <th>Tgl. Ambil</th>
                                    <th>Nama</th>
                                    <th>No. Transaksi</th>
                                    <th>Operator</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $no = 1 + ($perPage * ($currentPage - 1));
                                foreach ($pengambilan as $data) : ?>
                                    <tr>
                                        <td class="text-center"><?= $no++; ?></td>
                                        <td class="text-center"><?= date('d-m-Y', strtotime($data['tgl_ambil'])); ?></td>
                                        <td><?= $data['nama']; ?></td>
                                        <td class="text-center"><?= $data['transaksi_masuk_id']; ?></td>
                                        <td class="text-center"><?= $data['user_creator']; ?></td>
                                        <td class="text-center">
                                            <a href="/transactions/transaksi-masuk/detail/<?= $data['transaksi_masuk_id']; ?>" class="my-1 btn btn-info">Detail Transaksi</a>
                                            <button type="button" class="my-1 btn btn-danger" id="delete-<?= $data['transaksi_masuk_id'] ?>">Delete</button>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>
                    </div>
                    <div class="d-sm-flex justify-content-between align-items-center">
                        <?= $pager->links('default', 'custom_pagination') ?>
                        <div>Total data : <?= $totalRows; ?></div>
                    </div>
                <?php endif ?>
            </div>
        </div>
    </div>
</div>
<?= $this->endSection(); ?>

<?= $this->section('js-libraries'); ?>
<!-- Toastr JS -->
<script src="https://cdn.jsdelivr.net/npm/izitoast@1.4.0/dist/js/iziToast.min.js" integrity="sha256-321PxS+POvbvWcIVoRZeRmf32q7fTFQJ21bXwTNWREY=" crossorigin="anonymous"></script>
<script>
    <?php if (session()->getFlashdata('success')) : ?>
        iziToast.success({
            message: "<?= session()->getFlashdata('success'); ?>",
            position: 'topRight',
            timeout: 10000,
        });
    <?php endif ?>
</script>
<?= $this->endSection(); ?>

<?= $this->section('custom-script'); ?>
<script>
    <?php foreach ($pengambilan as $data) : ?>
        $('#delete-<?= $data['transaksi_masuk_id'] ?>').fireModal({
            title: 'Delete Confirmation',
            body: `
        <div>
            Yakin ingin menghapus transaksi ?
            <div class="text-right mt-4">
                <button type="button" class="btn btn-secondary mr-1" data-dismiss="modal">Cancel</button>
                <form action="/transactions/transaksi-pengambilan/delete/<?= $data['transaksi_masuk_id'] ?>" method="post" class="d-inline">
                    <input type="hidden" name="_method" value="DELETE">
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </div>
        </div>
        `
        });
    <?php endforeach ?>
</script>
<?= $this->endSection(); ?>