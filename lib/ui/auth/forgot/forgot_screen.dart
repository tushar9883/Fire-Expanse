import 'package:data_expanse/base/base_view_view_model.dart';
import 'package:data_expanse/router/router_name.dart';
import 'package:data_expanse/ui/auth/forgot/forgot_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ForgotScreen extends BaseView<ForgotController> {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.only(left: 30.w, right: 30.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Forgot\nPassword?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26.sp,
                    // fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextField(
                  cursorColor: const Color(0xff5566fd),
                  controller: controller.email,
                  textInputAction: TextInputAction.go,
                  style:TextStyle(
                    fontSize: 14.sp,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Registered Email Id',
                      hintStyle:TextStyle(
                        color: const Color(0xff111111),
                        fontSize: 12.sp,
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xff5566fd)),
                      )),
                ),
                SizedBox(
                  height: 42.h,
                ),
                InkWell(
                  onTap: () {
                    controller.forgot();
                  },
                  child: Container(
                    height: 50.h,
                    width: 277.w,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(-1.1, 2.349),
                        end: Alignment(1.151, -0.633),
                        colors: [Color(0xff4a00e0), Color(0xff8e2de2)],
                        stops: [0.0, 1.0],
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Send Magical Link",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(RouterName.login);
                      },
                      child: Text(
                        "Login",
                        style:TextStyle(
                          color: const Color(0xff4a00e0),
                          fontSize: 12.sp,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RouterName.signup);
                      },
                      child: Text(
                        "Signup",
                        style:TextStyle(
                          color: const Color(0xff4a00e0),
                          fontSize: 12.sp,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
