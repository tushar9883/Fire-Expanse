import 'package:data_expanse/base/base_controller.dart';
import 'package:data_expanse/db/db_helper.dart';
import 'package:data_expanse/model/transactionModel.dart';
import 'package:data_expanse/ui/home/home_binding.dart';
import 'package:data_expanse/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewTransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewTransactionController(), fenix: true);
  }
}

class NewTransactionController extends BaseController {
  String? userid;
  TransactionModel? transactionModel;
  int? transactionType = 3;
  String? updateUID;
  TextEditingController amountController = TextEditingController();
  TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  /// New Transaction

  addNewTransaction() async {
    showLoadingDialog();

    /// Date Time UTC
    final utcTime = DateTime.now().toUtc();
    final localtime = utcTime.toLocal();

    if (transactionType == 1 || transactionType == 0) {
      if (amountController.text.isNotEmpty) {
        if (textController.text.isNotEmpty) {
          var uid = await DbHelp().addTransaction(
            TransactionModel(
              date: localtime.toString(),
              note: textController.text.trim(),
              price: int.parse(amountController.text.trim()),
              transaction: transactionType,
              userid: userid!,
            ),
          );

          await DbHelp().updateID(
            TransactionModel(
              uid: uid.id,
            ),
            uid.id,
          );

          update();

          /// Call Back Previous Screen
          WidgetsBinding.instance.addPostFrameCallback((_) {
            var sata = Get.find<HomeController>();
            sata.getAllTransaction();
          });
          hideDialog();
          Get.back();
          transactionType = 3;
          amountController.clear();
          textController.clear();
        } else {
          hideDialog();
          toastbar("Add Note Some");
        }
      } else {
        hideDialog();
        toastbar("Amount is required");
      }
    } else {
      hideDialog();
      toastbar("Transaction type is required");
    }
  }

  /// Update Transaction

  updateTransaction() async {
    showLoadingDialog();


    /// Date Time UTC
    final utcTime = DateTime.now().toUtc();
    final localtime = utcTime.toLocal();

    if (transactionType == 1 || transactionType == 0) {
      if (amountController.text.isNotEmpty) {
        if (textController.text.isNotEmpty) {
          await DbHelp().updateTransaction(
              TransactionModel(
                date: localtime.toString(),
                note: textController.text.trim(),
                price: int.parse(amountController.text.trim()),
                transaction: transactionType,
                userid: userid,
                uid: updateUID,
              ),
              updateUID);

          update();

          /// Call Back Previous Screen
          WidgetsBinding.instance.addPostFrameCallback((_) {
            var sata = Get.find<HomeController>();
            sata.getAllTransaction();
          });
          hideDialog();
          Get.back();
          transactionType = 3;
          amountController.clear();
          textController.clear();
        } else {
          hideDialog();
          toastbar("Add Note Some");
        }
      } else {
        hideDialog();
        toastbar("Amount is required");
      }
    } else {
      hideDialog();
      toastbar("Transaction type is required");
    }
  }

  /// Data Get And Set Data
  void getData() async {
    userid = FirebaseAuth.instance.currentUser?.uid;
    if (Get.arguments != null) {
      transactionModel = TransactionModel.fromDB(Get.arguments);
      amountController.text = transactionModel!.price.toString();
      textController.text = transactionModel!.note.toString();
      transactionType = transactionModel!.transaction;
      updateUID = transactionModel!.uid;
      update();
    }
    update();
  }
}
