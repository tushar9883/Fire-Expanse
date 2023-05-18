import 'package:data_expanse/base/base_controller.dart';
import 'package:data_expanse/router/router_name.dart';
import 'package:data_expanse/utils/secure_storage.dart';
import 'package:data_expanse/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), fenix: true);
  }
}

class LoginController extends BaseController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  login() async {

    if (email.text.isEmpty) {
      toastbar("Email is required");
    } else if (password.text.isEmpty) {
      toastbar("Password is required");
    } else {
      try {
        showLoadingDialog();
        update();
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text, password: password.text);
        await SecureStorage.writeSecureData('userid', '1');
        hideDialog();
        Get.toNamed(RouterName.home);
        email.clear();
        password.clear();
        update();
      } on FirebaseAuthException catch (e) {
        hideDialog();
        update();
        if (e.code == 'user-not-found') {
          toastbar('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          toastbar('Wrong password');
        } else if (e.code == 'network-request-failed') {
          toastbar('Check Internet Connection');
        } else {
          toastbar('Something went wrong');
        }
      }
    }
  }
}
