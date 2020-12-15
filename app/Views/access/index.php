<?= $this->extend('layouts/master'); ?>

<?= $this->section('css-libraries'); ?>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/izitoast@1.4.0/dist/css/iziToast.min.css" integrity="sha256-f6fW47QDm1m01HIep+UjpCpNwLVkBYKd+fhpb4VQ+gE=" crossorigin="anonymous">
<?= $this->endSection(); ?>

<?= $this->section('body'); ?>
<?php helper('menuaccess'); ?>
<div class="row mt-3">
    <div class="col-lg-12">
        <div class="card shadow">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr class="text-center">
                                <th>#</th>
                                <th>Role</th>
                                <th>Menu</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 1;
                            foreach ($roles as $role) : ?>
                                <tr>
                                    <td class="text-center"><?= $no++; ?></td>
                                    <td><?= $role['display_name']; ?></td>
                                    <td class="d-flex align-items-center justify-content-center">
                                        <?php foreach ($all_menu as $menu) : ?>
                                            <div class="form-check mr-3">
                                                <input class="form-check-input" type="checkbox" name="menu_id[]" disabled <?= (checkAccess($menu['id'], $role['id']) != false) ? 'checked' : ''; ?>>
                                                <label class="form-check-label"><?= $menu['display_name']; ?></label>
                                            </div>
                                        <?php endforeach ?>
                                    </td>
                                    <td class="text-center">
                                        <a href="/tools/access/edit/<?= $role['id']; ?>" class="btn btn-warning">Edit</a>
                                    </td>
                                </tr>
                            <?php endforeach ?>
                        </tbody>
                    </table>
                </div>
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