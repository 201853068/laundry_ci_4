<?= $this->extend('layouts/master'); ?>

<?= $this->section('css-libraries'); ?>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/izitoast@1.4.0/dist/css/iziToast.min.css" integrity="sha256-f6fW47QDm1m01HIep+UjpCpNwLVkBYKd+fhpb4VQ+gE=" crossorigin="anonymous">
<?= $this->endSection(); ?>

<?= $this->section('body'); ?>
<div class="row mt-4">
    <div class="col-lg-6">
        <div class="card shadow">
            <div class="card-header bg-primary m-0 p-0 rounded-top" style="min-height: 10px;"></div>
            <div class="card-body">
                <?php if (session()->getFlashdata('error')) : ?>
                    <div class="alert alert-danger d-flex justify-content-between align-items-center"><?= session()->getFlashdata('error'); ?> <i class="fas fa-times"></i></div>
                <?php endif ?>
                <form action="/profile/changepass/<?= $user['id']; ?>" method="POST">
                    <input type="hidden" name="_method" value="PATCH">
                    <div class="form-group">
                        <label for="current">Current Password</label>
                        <input class="form-control form-control-sm <?= $validation->hasError('current') ? 'is-invalid' : '' ?>" type="password" name="current" id="current">
                        <div class="invalid-feedback">
                            <?= $validation->getError('current'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password">New Password</label>
                        <input class="form-control form-control-sm <?= $validation->hasError('password') ? 'is-invalid' : '' ?>" type="password" name="password" id="password">
                        <div class="invalid-feedback">
                            <?= $validation->getError('password'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="confirmation">Confirm Password</label>
                        <input class="form-control form-control-sm <?= $validation->hasError('confirmation') ? 'is-invalid' : '' ?>" type="password" name="confirmation" id="confirmation">
                        <div class="invalid-feedback">
                            <?= $validation->getError('confirmation'); ?>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Change Password</button>
                </form>
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