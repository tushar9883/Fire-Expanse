import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_expanse/model/transactionModel.dart';
import 'package:data_expanse/model/user_model.dart';
import 'package:firebase_helpers/firebase_helpers.dart';

class DbHelp {
  static const String userDB = "USER";
  static const String transactionDB = "Transaction";

  final db = FirebaseFirestore.instance;

  /// User Table
  DatabaseService<UserModel> userdb = DatabaseService(
    userDB,
    fromDS: (id, data) => UserModel.fromJson(id, data),
    toMap: (data) => data.toJson(),
  );

  /// Transaction Table
  DatabaseService<TransactionModel> transactionDb = DatabaseService(
    transactionDB,
    fromDS: (id, data) => TransactionModel.fromJson(id, data),
    toMap: (data) => data.toJson(),
  );

  /// Add

  Future adduser(UserModel userModel) async {
    return await userdb.create(userModel.toJson());
  }

  Future addTransaction(TransactionModel transactionModel) async {
    return await transactionDb.create(transactionModel.toJson());
  }

  /// Update

  Future updateID(TransactionModel transactionModel, String id) async {

    await transactionDb.updateData(
      id ?? "",
      {"uid": id},
    );
  }

  Future updateTransaction(TransactionModel transactionModel, String? id) async {
    print(">>>>>>> update id $id");
    await transactionDb.updateData(
      id ?? "",
      {
        "date": transactionModel.date,
        "note": transactionModel.note,
        "price": transactionModel.price,
        "transaction": transactionModel.transaction,
        "userid": transactionModel.userid,
        "uid": id,
      },
    );
  }

  /// GetAll

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

  /// Remove Transaction
  Future removeItem(String id) async {
    await transactionDb.removeItem(id);
  }
}
