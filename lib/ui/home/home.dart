import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_expanse/base/base_view_view_model.dart';
import 'package:data_expanse/ui/home/home_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                          controller.addNewExpanse();
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
                        '\$ 100',
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
                                      '\$ 200',
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
                                      '\$ 200',
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
                    // Expanded(
                    //   child: GoogleSheetsApi.loading == true
                    //       ? const LoadingCircle()
                    //       : ListView.builder(
                    //       itemCount:
                    //       GoogleSheetsApi.currentTransactions.length,
                    //       itemBuilder: (context, index) {
                    //         return MyTransaction(
                    //           transactionName: GoogleSheetsApi
                    //               .currentTransactions[index][0],
                    //           money: GoogleSheetsApi
                    //               .currentTransactions[index][1],
                    //           expenseOrIncome: GoogleSheetsApi
                    //               .currentTransactions[index][2],
                    //         );
                    //       }),
                    // )
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
