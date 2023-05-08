import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_expanse/model/expanseModel.dart';
import 'package:data_expanse/model/user_model.dart';
import 'package:firebase_helpers/firebase_helpers.dart';

class DbHelp {
  static const String userDB = "USER";
  static const String expanseDB = "Expanse";

  final db = FirebaseFirestore.instance;

  ///TODO User Table
  DatabaseService<UserModel> userdb = DatabaseService(
    userDB,
    fromDS: (id, data) => UserModel.fromJson(id, data),
    toMap: (data) => data.toJson(),
  );
  //
  // ///TODo Expanse Table
  DatabaseService<ExpanseModel> expanseDb = DatabaseService(
    expanseDB,
    fromDS: (id, data) => ExpanseModel.fromJson(id, data),
    toMap: (data) => data.toJson(),
  );

  Future adduser(UserModel userModel) async {
    return await userdb.create(userModel.toJson());
  }

  Future addExpanse(ExpanseModel expanseModel) async {
    return await expanseDb.create(expanseModel.toJson());
  }
}
