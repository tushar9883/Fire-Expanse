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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey[300],
          title: Text(
            "New Transaction",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          leading: InkWell(
            highlightColor: Colors.grey[300],
            onTap: () {
              controller.transactionType = 3;
              controller.update();
              Get.back();
            },
            child: Container(
              margin: EdgeInsets.all(8.r),
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.w,
                      color: Colors.grey.shade400,
                    )
                  ]),
              child: Icon(
                Icons.close,
                color: Colors.grey[500],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          decoration: controller.transactionType == 0
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: Colors.red[400]
                                  // : Colors.grey[300],
                                  )
                              : BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(
                                      color: const Color(0xffE0E0E0),
                                      width: 2)),
                          child: Text(
                            "Expense",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: controller.transactionType == 0
                                  ? Colors.white
                                  : Colors.black,
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
                          decoration: controller.transactionType == 1
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: Colors.green[400]
                                  // : Colors.grey[300],
                                  )
                              : BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(
                                      color: const Color(0xffE0E0E0),
                                      width: 2)),
                          child: Text(
                            "Income",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: controller.transactionType == 1
                                  ? Colors.white
                                  : Colors.black,
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
                            color: controller.transactionType == 1
                                ? Colors.green[400]
                                : controller.transactionType == 0
                                    ? Colors.red[400]
                                    : Colors.black,
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
