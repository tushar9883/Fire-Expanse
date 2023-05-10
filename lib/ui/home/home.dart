import 'package:data_expanse/base/base_view_view_model.dart';
import 'package:data_expanse/ui/home/home_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HomeScreen extends BaseView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget vBuilder(BuildContext context) {
    // new transaction
    void newTransaction() {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, setState) {
                return AlertDialog(
                  title: const Text('N E W  T R A N S A C T I O N'),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('Expense'),
                            Switch(
                              value: controller.isIncome,
                              onChanged: (newValue) {
                                setState(() {
                                  controller.isIncome = newValue;
                                });
                              },
                            ),
                            const Text('Income'),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Form(
                                key: controller.formKey,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Amount?',
                                  ),
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Enter an amount';
                                    }
                                    return null;
                                  },
                                  controller: controller.textcontrollerAMOUNT,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'For what?',
                                ),
                                controller: controller.textcontrollerITEM,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    MaterialButton(
                      color: Colors.grey[600],
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        controller.textcontrollerITEM.clear();
                        controller.textcontrollerAMOUNT.clear();
                      },
                    ),
                    MaterialButton(
                      color: Colors.grey[600],
                      child: const Text(
                        'Enter',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        // print("Date ${controller.readDate(stamp)}");
                        if (controller.formKey.currentState!.validate()) {
                          controller.addNewTransaction();
                        }
                      },
                    )
                  ],
                );
              },
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[500],
        onPressed: () => newTransaction(),
        child: const Icon(Icons.add),
      ),
      body: Padding(
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
                          fontSize: 40.sp,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
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
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
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
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
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
                            itemCount: controller.allTransaction?.length ?? 0,
                            itemBuilder: (context, index) {
                              var allData = controller.allTransaction![index];
                              String? itemName = allData.note;
                              int? price = allData.price;
                              int? transaction = allData.transaction;
                              String? date = allData.date;

                              DateTime parseDate =
                                  DateFormat("yyyy-MM-dd HH:mm:ss.SSS")
                                      .parse(date!);
                              var inputDate =
                                  DateTime.parse(parseDate.toString());
                              var dayFormate = DateFormat('dd');
                              var monthFormate = DateFormat('MMM');
                              var dayoutput = dayFormate.format(inputDate);
                              var monthoutput = monthFormate.format(inputDate);

                              return Padding(
                                padding: EdgeInsets.only(bottom: 12.h),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
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
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                color: const Color(0xffececec),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    dayoutput,
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color:
                                                      Colors.grey[700],
                                                    ),
                                                  ),
                                                  Text(
                                                    monthoutput,
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                      Colors.grey[700],
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
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 8.w,
                                                      ),
                                                      child: Text(
                                                        itemName!,
                                                        style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight: FontWeight.w600,
                                                          color:
                                                              Colors.grey[700],
                                                        ),
                                                        maxLines: 5,
                                                        overflow: TextOverflow
                                                            .visible,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    '${transaction == 0 ? '-' : '+'} ₹${price!}',
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: transaction == 0
                                                          ? Colors.red
                                                          : Colors.green,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        // SizedBox(
                                        //   height: 5.h,
                                        // ),
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.end,
                                        //   children: [
                                        //     Text(
                                        //       outputDate,
                                        //       style: TextStyle(
                                        //         fontSize: 10.sp,
                                        //         color: transaction == "0"
                                        //             ? Colors.red
                                        //             : Colors.green,
                                        //       ),
                                        //     ),
                                        //   ],
                                        // )
                                      ],
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
    );
  }
}
