import 'package:data_expanse/base/base_view_view_model.dart';
import 'package:data_expanse/db/db_helper.dart';
import 'package:data_expanse/router/router_name.dart';
import 'package:data_expanse/ui/home/home_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class HomeScreen extends BaseView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[500],
        onPressed: () => Get.toNamed(RouterName.newTransaction),
        // onPressed: () => newTransaction(),
        child: const Icon(Icons.add),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(25.r),
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),

                /// Top Card
                Padding(
                  padding: EdgeInsets.all(4.r),
                  child: Container(
                    height: 200.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Colors.grey[300],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade500,
                            offset: const Offset(4.0, 4.0),
                            blurRadius: 15.r,
                            spreadRadius: 1.0,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: const Offset(-4.0, -4.0),
                            blurRadius: 15.r,
                            spreadRadius: 1.0,
                          ),
                        ]),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'B A L A N C E',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            '₹ ${controller.totalAmount}',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 34.sp,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey[200],
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.arrow_downward,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Income',
                                              style: TextStyle(
                                                color: Colors.grey[500],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text(
                                              '₹ ${controller.totalIncome}',
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontWeight: FontWeight.bold,
                                              ),
                                              softWrap: true,
                                              maxLines: 1,
                                              overflow: TextOverflow.visible,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey[200],
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.arrow_upward,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Expense',
                                              style: TextStyle(
                                                color: Colors.grey[500],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text(
                                              '₹ ${controller.totalExpanse}',
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontWeight: FontWeight.bold,
                                              ),
                                              softWrap: true,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                /// Transaction
                Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () => controller.getAllTransaction(),
                            child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 40.h),
                                physics: const BouncingScrollPhysics(),
                                itemCount:
                                    controller.allTransaction?.length ?? 0,
                                itemBuilder: (context, index) {
                                  var allData =
                                      controller.allTransaction![index];
                                  String? itemName = allData.note;
                                  int? price = allData.price;
                                  int? transaction = allData.transaction;
                                  String? uid = allData.uid;
                                  String? date = allData.date;

                                  DateTime parseDate =
                                      DateFormat("yyyy-MM-dd HH:mm:ss.SSS")
                                          .parse(date!);
                                  var inputDate =
                                      DateTime.parse(parseDate.toString());
                                  var dayFormate = DateFormat('dd');
                                  var monthFormate = DateFormat('MMM');
                                  var dayoutput = dayFormate.format(inputDate);
                                  var monthoutput =
                                      monthFormate.format(inputDate);

                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 12.h),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Slidable(
                                        endActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          children: [
                                            SlidableAction(
                                              onPressed: (context) =>
                                                  deleteDialog(context, uid!),
                                              backgroundColor: Colors.red,
                                              foregroundColor: Colors.white,
                                              icon: Icons.delete,
                                            ),
                                          ],
                                        ),
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          onTap: () {
                                            Get.toNamed(
                                              RouterName.newTransaction,
                                              arguments: controller
                                                  .allTransaction?[index]
                                                  .toJson(),
                                            );
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(15.r),
                                            color: Colors.grey[100],
                                            child: Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 56.w,
                                                      height: 56.w,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.r),
                                                        color: const Color(
                                                            0xffececec),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            dayoutput,
                                                            style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              color: Colors
                                                                  .grey[700],
                                                            ),
                                                          ),
                                                          Text(
                                                            monthoutput,
                                                            style: TextStyle(
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Colors
                                                                  .grey[700],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal: 8.w,
                                                              ),
                                                              child: Text(
                                                                itemName!,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      14.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                          .grey[
                                                                      700],
                                                                ),
                                                                maxLines: 5,
                                                                overflow:
                                                                    TextOverflow
                                                                        .visible,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            '${transaction == 0 ? '-' : '+'} ₹${price!}',
                                                            style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: transaction ==
                                                                      0
                                                                  ? Colors.red
                                                                  : Colors
                                                                      .green,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (controller.isLoading)
            Material(
              color: Colors.black.withOpacity(0.1),
              child: Center(
                child: Wrap(
                  children: [
                    Container(
                      padding: REdgeInsets.all(10.0),
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: const SpinKitFadingCircle(
                        color: Colors.blue,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  deleteDialog(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                'Delete Transaction?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
            content: Text(
              "Are you sure you want to delete this Transaction from local and online server?\n\nYou won’t be able to find your item then.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xff8f8f8f),
                fontSize: 12.sp,
              ),
            ),
            actions: [
              Column(
                children: [
                  Center(
                    child: InkWell(
                      onTap: () async {
                        controller.showLoadingDialog();
                        await DbHelp().removeItem(id);
                        await controller.getAllTransaction();
                        controller.hideDialog();
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 93.w,
                        height: 46.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.r),

                         color: Colors.grey[600]
                        ),
                        child: Text(
                          "Delete",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  )
                ],
              ),
            ],
          );
        });
  }
}
