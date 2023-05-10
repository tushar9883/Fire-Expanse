import 'package:data_expanse/base/base_controller.dart';
import 'package:data_expanse/db/db_helper.dart';
import 'package:data_expanse/model/transactionModel.dart';
import 'package:data_expanse/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}

class HomeController extends BaseController {
  TextEditingController textcontrollerAMOUNT = TextEditingController();
  TextEditingController textcontrollerITEM = TextEditingController();
  String? userid;

  final formKey = GlobalKey<FormState>();

  bool isIncome = false;
  List<TransactionModel>? allTransaction;
  int totalExpanse = 0;
  int totalIncome = 0;
  int totalAmount = 0;
  bool isLoading = false;

  @override
  void onInit() {
    getAllTransaction();
    super.onInit();
  }

  Future<void> getAllTransaction() async {
    isLoading = true;
    userid = FirebaseAuth.instance.currentUser?.uid;
    var allData = await DbHelp().getAllTransaction(userid!);
    allTransaction?.clear();
    allTransaction = allData;
    totalExpanse=0;
    totalIncome=0;
    for (var i = 0; i < allData.length; i++) {
      if (allData[i].transaction == 0) {
        /// Expanse
        totalExpanse += allData[i].price!;
        update();
      } else {
        /// Income
        totalIncome += allData[i].price!;
        update();
      }
      update();
    }
    totalAmount = totalIncome - totalExpanse;
    isLoading = false;
    update();
  }

  addNewTransaction() async {
    showLoadingDialog();

    /// Date Time UTC
    final utcTime = DateTime.now().toUtc();
    final localtime = utcTime.toLocal();

    int checkData = 0;

    if (textcontrollerAMOUNT.text.isNotEmpty) {
      if (textcontrollerITEM.text.isNotEmpty) {
        if (isIncome) {
          checkData = 1;
          isIncome = false;

          /// Income
        } else {
          checkData = 0;
          isIncome = false;

          /// Expanse
        }
        var uid = await DbHelp().addTransaction(
          TransactionModel(
            date: localtime.toString(),
            note: textcontrollerITEM.text.trim(),
            price: int.parse(textcontrollerAMOUNT.text.trim()),
            transaction: checkData,
            userid: userid!,
          ),
        );

        await DbHelp().updateID(
          TransactionModel(
            uid: uid.id,
          ),
          uid.id,
        );

        print("UID ${uid.id}");

        update();
        getAllTransaction();
        hideDialog();
        Get.back();
        textcontrollerAMOUNT.clear();
        textcontrollerITEM.clear();
      } else {
        hideDialog();
        toastbar("Add Note Some");
      }
    } else {
      hideDialog();
      toastbar("Amount is required");
    }
  }
}
