import 'package:data_expanse/base/base_view_view_model.dart';
import 'package:data_expanse/ui/newtransaction/newtransaction_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewTransactionScreen extends BaseView<NewTransactionController> {
  const NewTransactionScreen({super.key});

  @override
  Widget vBuilder(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.transactionType = 3;
        controller.update();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 46.h,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "New Transaction",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            controller.transactionType = 3;
                            controller.update();
                            Get.back();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 2.h,
                            ),
                            child: Icon(
                              Icons.close,
                              size: 22.r,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: const Color(0xffE4E4E4),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "Select Transaction type:",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff858585),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.transactionType = 0;
                          controller.update();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: controller.transactionType == 0 ? Colors.red[400] : Colors.grey[300],
                          ),

                          child: Text(
                            "Expanse",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: controller.transactionType == 0 ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      InkWell(
                        onTap: () {
                          controller.transactionType = 1;
                          controller.update();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: controller.transactionType == 1 ? Colors.green[400] : Colors.grey[300],
                          ),
                          child: Text(
                            "Income",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                             color: controller.transactionType == 1 ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20.w),
                //   child: Row(
                //     children: [
                //       InkWell(
                //         onTap: () {
                //           controller.transactionType = 0;
                //           controller.update();
                //         },
                //         child: Container(
                //           padding: EdgeInsets.symmetric(
                //             horizontal: 12.w,
                //             vertical: 8.h,
                //           ),
                //           decoration: controller.transactionType == 0
                //               ? BoxDecoration(
                //             color: const Color(0xffFFD7D7),
                //                   // color: const Color(0xffFFD7D7),
                //                   borderRadius: BorderRadius.circular(6.r),
                //                 )
                //               : BoxDecoration(
                //                   border: Border.all(
                //                     color: Colors.red,
                //                     // color: const Color(0xffFFD7D7),
                //                     width: 2.r,
                //                   ),
                //                   borderRadius: BorderRadius.circular(6.r),
                //                 ),
                //           child: Text(
                //             "Expanse",
                //             style: TextStyle(
                //               fontSize: 14.sp,
                //               fontWeight: FontWeight.w500,
                //               color: const Color(0xff903030),
                //             ),
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 15.w,
                //       ),
                //       InkWell(
                //         onTap: () {
                //           controller.transactionType = 1;
                //           controller.update();
                //         },
                //         child: Container(
                //           padding: EdgeInsets.symmetric(
                //             horizontal: 12.w,
                //             vertical: 8.h,
                //           ),
                //           decoration: controller.transactionType == 1
                //               ? BoxDecoration(
                //                   color: const Color(0xffA6E0A6),
                //                   borderRadius: BorderRadius.circular(6.r),
                //                 )
                //               : BoxDecoration(
                //                   border: Border.all(
                //                     color: Colors.green,
                //                     width: 2.r,
                //                   ),
                //                   borderRadius: BorderRadius.circular(6.r),
                //                 ),
                //           child: Text(
                //             "Income",
                //             style: TextStyle(
                //               fontSize: 14.sp,
                //               fontWeight: FontWeight.w500,
                //               color: const Color(0xff30903F),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  height: 1,
                  width: double.infinity,
                  color: const Color(0xffE4E4E4),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "Amount:",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff858585),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  width: double.infinity,
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: const Color(0xfff5f5f5),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 30.w,
                        height: 30.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x19000000),
                              blurRadius: 8.r,
                              offset: const Offset(0, 0),
                            ),
                          ],
                          color: Colors.grey[300],
                        ),
                        child: Text(
                          "₹",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Flexible(
                        child: TextField(
                          controller: controller.amountController,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff858585),
                          ),
                          cursorColor: Colors.grey[500],
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          maxLines: 1,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            hintText: "0",
                            hintStyle: TextStyle(
                              fontSize: 11.sp,
                              color: const Color(0xff858585),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  height: 1,
                  width: double.infinity,
                  color: const Color(0xffE4E4E4),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "For what?",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff858585),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  padding: EdgeInsets.symmetric(
                    vertical: 11.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: const Color(0xfff5f5f5),
                  ),
                  child: TextField(
                    controller: controller.textController,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xff858585),
                      fontWeight: FontWeight.w500,
                    ),
                    cursorColor: Colors.grey[500],
                    keyboardType: TextInputType.text,
                    maxLines: 3,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 11.w),
                      hintText: "write description here...",
                      hintStyle: TextStyle(
                        fontSize: 11.sp,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 33.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        if (controller.transactionModel != null) {
                          controller.updateTransaction();
                        } else {
                          controller.addNewTransaction();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 42.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          controller.transactionModel != null
                              ? "Update"
                              : "Enter",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
