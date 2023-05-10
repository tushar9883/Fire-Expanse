import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_expanse/model/transactionModel.dart';
import 'package:data_expanse/model/user_model.dart';
import 'package:firebase_helpers/firebase_helpers.dart';

class DbHelp {
  static const String userDB = "USER";
  static const String transactionDB = "Transaction";

  final db = FirebaseFirestore.instance;

  ///TODO User Table
  DatabaseService<UserModel> userdb = DatabaseService(
    userDB,
    fromDS: (id, data) => UserModel.fromJson(id, data),
    toMap: (data) => data.toJson(),
  );

  ///TODO Transaction Table
  DatabaseService<TransactionModel> transactionDb = DatabaseService(
    transactionDB,
    fromDS: (id, data) => TransactionModel.fromJson(id, data),
    toMap: (data) => data.toJson(),
  );

  Future adduser(UserModel userModel) async {
    return await userdb.create(userModel.toJson());
  }

  Future addTransaction(TransactionModel transactionModel) async {
    return await transactionDb.create(transactionModel.toJson());
  }

  Future updateID(TransactionModel transactionModel, String id) async {

    await transactionDb.updateData(
      id ?? "",
      {"uid": id},
    );
  }

  Future<List<TransactionModel>> getAllTransaction(String uid) async {
    var args = [
      QueryArgsV2(
        "userid",
        isEqualTo: uid.toString(),
      )
    ];

    List<TransactionModel> res = await transactionDb.getQueryList(
      args: args,
      orderBy: [OrderBy("date", descending: true)],
    );
    return res;
  }

  /// TODO Remove Transaction
  Future removeItem(String id) async {
    await transactionDb.removeItem(id);
  }
}
