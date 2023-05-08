import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_expanse/base/base_controller.dart';
import 'package:data_expanse/db/db_helper.dart';
import 'package:data_expanse/model/expanseModel.dart';
import 'package:data_expanse/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}

class HomeController extends BaseController {
  TextEditingController textcontrollerAMOUNT = TextEditingController();
  TextEditingController textcontrollerITEM = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? currentDate;
  bool isIncome = false;

  readDate() {
    Timestamp utcTime = Timestamp.now();
    DateTime dateTime = utcTime.toDate();
    String dateOnly = DateFormat('dd-MMM-yyyy').format(dateTime);
    currentDate = dateOnly;
    update();
  }

  // @override
  // void onInit() {
  //   readDate();
  //   super.onInit();
  // }

  //addExpanse

  addNewExpanse() async {
    showLoadingDialog();
    readDate();
    if (textcontrollerAMOUNT.text.isNotEmpty) {
      if (textcontrollerITEM.text.isNotEmpty) {
        await DbHelp().addExpanse(
          ExpanseModel(
            price: textcontrollerAMOUNT.text.trim(),
            note: textcontrollerITEM.text.trim(),
            date: currentDate,
          ),
        );
        update();
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
