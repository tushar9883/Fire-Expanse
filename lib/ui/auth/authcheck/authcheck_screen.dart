import 'dart:async';

import 'package:data_expanse/base/base_controller.dart';
import 'package:data_expanse/router/router_name.dart';
import 'package:data_expanse/ui/home/home_binding.dart';
import 'package:data_expanse/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AuthCheckScreen extends StatefulWidget {
  const AuthCheckScreen({Key? key}) : super(key: key);

  @override
  State<AuthCheckScreen> createState() => _AuthCheckScreenState();
}

class _AuthCheckScreenState extends State<AuthCheckScreen> {
  @override
  void initState() {
    super.initState();
    getUid();
  }

  getUid() async {
    String isLoggedIn = await SecureStorage.readSecureData("userid");

    Timer(
      const Duration(seconds: 5),
      () async {
        if (isLoggedIn == '1') {
          /// Find Controller
          HomeController? homeController = Get.isRegistered<HomeController>()
              ? Get.find<HomeController>()
              : null;
          homeController?.getAllTransaction();

          WidgetsBinding.instance.addPostFrameCallback((_) {
            var sata = Get.find<HomeController>();
            sata.getAllTransaction();
          });
          await Get.offNamed(RouterName.home);
        } else {
          await Get.offNamed(RouterName.login);
        }
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset('assets/json/animation.json'),
      ),
    );
  }
}
