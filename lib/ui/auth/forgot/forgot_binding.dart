
import 'package:data_expanse/base/base_controller.dart';
import 'package:data_expanse/router/router_name.dart';
import 'package:data_expanse/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotController(), fenix: true);
  }
}

class ForgotController extends BaseController {
  TextEditingController email = TextEditingController();

  @override
  void onInit() {
    setScreenState = screenStateOk;
    update();
    super.onInit();
  }

  forgot() async {
    showLoadingDialog();
    if (email.text.isEmpty) {
      toastbar("User name is required");
      hideDialog();
    } else {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: email.text.trim());
        toastbar('Password Reset Email Send');
        hideDialog();
        Get.back();
        Get.offNamed(RouterName.login);
        update();
      } on FirebaseAuthException catch (e) {
        hideDialog();
        update();
        toastbar('Something went wrong');
      }
    }
  }
}
