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

  @override
  void onInit() {
    getAllTransaction();
    super.onInit();
  }

  Future<void> getAllTransaction() async {
    userid = FirebaseAuth.instance.currentUser?.uid;
    var allData = await DbHelp().getAllExpanse(userid!);
    allTransaction?.clear();
    allTransaction = allData;
    update();
  }

  addNewTransaction() async {
    showLoadingDialog();

    /// Date Time UTC
    final utcTime = DateTime.now().toUtc();
    final localtime = utcTime.toLocal();

    String checkData = "0";
    if (isIncome) {
      checkData = "1";
      update();
    } else {
      checkData = "0";
      update();
    }

    if (textcontrollerAMOUNT.text.isNotEmpty) {
      if (textcontrollerITEM.text.isNotEmpty) {
        await DbHelp().addExpanse(
          TransactionModel(
            date: localtime.toString(),
            note: textcontrollerITEM.text.trim(),
            price: textcontrollerAMOUNT.text.trim(),
            transaction: checkData.toString(),
            userid: userid!,
          ),
        );
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
