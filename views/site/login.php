<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

$this->title = Yii::t('app','login');
?>

<div class="row" style="margin-top:30px">

    <div class="col-md-4 col-md-offset-4">

		<?php if (Yii::$app->session->hasFlash('registerSuccess')): ?>

			<div class="alert alert-success alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  <br>คุณได้ลงทะเบียนเข้าใช้งานระบบเรียบร้อยแล้ว <br>คุณสามารถ Login เข้าสู่ระบบได้ทันที
			</div>

		<?php endif; ?>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="glyphicon glyphicon-lock"></i> <?=Yii::t('app','login')?></h3>
            </div>
            <div class="panel-body">
                <?php $form = ActiveForm::begin() ?>

                <?= $form->field($model, 'username')->label(Yii::t('app','username')) ?>

                <?= $form->field($model, 'password')->passwordInput()->label(Yii::t('app','password')) ?>

                <?= Html::submitButton(Yii::t('app','login'), ['class' => 'btn btn-primary btn-block', 'tabindex' => '3']) ?>

                <?php ActiveForm::end(); ?>
            </div>
        </div>


    </div>
</div>
