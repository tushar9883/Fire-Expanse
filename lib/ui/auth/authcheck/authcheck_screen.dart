import 'dart:async';
import 'package:data_expanse/base/base_controller.dart';
import 'package:data_expanse/router/router_name.dart';
import 'package:data_expanse/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      const Duration(seconds: 3),
      () {
        if (isLoggedIn == '1') {
          Get.offNamed(RouterName.home);
        } else {
          Get.offNamed(RouterName.login);
        }
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: REdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width,
          child: Text(
            "Expanse Manage",
            style: TextStyle(
              fontSize: 26.sp,
              color: Colors.lightGreen,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
