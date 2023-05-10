/// date : "2023-05-09 12:08:19.364945"
/// note : "car"
/// price : "20"
/// transaction : "0"
/// userid : "FBht0oqLZINTJ7kuisSimTRiFQe2"

class TransactionModel {
  TransactionModel({
    this.date,
    this.note,
    this.price,
    this.transaction,
    this.userid,
    this.uid,
  });

  TransactionModel.fromJson(String mId,dynamic json) {
    print(">>>>> Transaction >>>> $mId");
    date = json['date'];
    note = json['note'];
    price = json['price'];
    transaction = json['transaction'];
    userid = json['userid'];
    uid = mId;
  }

  String? date;
  String? note;
  int? price;
  int? transaction;
  String? userid;
  String? uid;

  TransactionModel copyWith({
    String? date,
    String? note,
    int? price,
    int? transaction,
    String? userid,
    String? uid,
  }) =>
      TransactionModel(
        date: date ?? this.date,
        note: note ?? this.note,
        price: price ?? this.price,
        transaction: transaction ?? this.transaction,
        userid: userid ?? this.userid,
        uid: userid ?? this.uid,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['note'] = note;
    map['price'] = price;
    map['transaction'] = transaction;
    map['userid'] = userid;
    map['uid'] = uid;
    return map;
  }
}
