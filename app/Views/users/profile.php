<?= $this->extend('layouts/master'); ?>

<?= $this->section('css-libraries'); ?>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/izitoast@1.4.0/dist/css/iziToast.min.css" integrity="sha256-f6fW47QDm1m01HIep+UjpCpNwLVkBYKd+fhpb4VQ+gE=" crossorigin="anonymous">
<?= $this->endSection(); ?>

<?= $this->section('body'); ?>
<div class="row mt-4">
    <div class="col-lg-6">
        <div class="card shadow">
            <div class="card-header bg-primary m-0 p-0 rounded-top" style="min-height: 10px;"></div>
            <div class="card-body d-flex align-items-center">
                <img src="/assets/images/avatar.png" alt="profile picture" class="img-fluid w-25 rounded-circle mr-4">
                <div>
                    <div class="d-flex align-items-center">
                        <h5 class="d-inline-block m-0 mr-2"><?= $user['display_name']; ?></h5>
                        <span class="rounded-pill bg-success text-white px-2 py-1" style="font-size: 12px;"><?= $user['role_name']; ?></span>
                    </div>
                    <span class="d-block text-muted font-weight-bolder"><?= $user['username']; ?></span>
                    <span class="d-block mt-2"><i class="fas fa-envelope mr-1"></i> <?= $user['email'] ? $user['email'] : '(tidak ada)'; ?></span>
                    <span class="d-block mt-1"><i class="fas fa-phone mr-1"></i> <?= $user['phone'] ? $user['phone'] : '(tidak ada)'; ?></span>
                </div>
            </div>
            <div class="card-footer d-flex justify-content-between">
                <button class="mr-1 btn btn-secondary" disabled>Created at <?= date('d M Y', strtotime($user['created_at'])); ?></button>
                <?php if (session('id') === $user['id']) : ?>
                    <a href="/profile/edit/<?= $user['id']; ?>" class="ml-1 btn btn-info">Change Profile</a>
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