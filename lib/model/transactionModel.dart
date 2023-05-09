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
  });

  TransactionModel.fromJson(String mId,dynamic json) {
    print(">>>>> Transaction >>>> $mId");
    date = json['date'];
    note = json['note'];
    price = json['price'];
    transaction = json['transaction'];
    userid = json['userid'];
  }

  String? date;
  String? note;
  String? price;
  String? transaction;
  String? userid;

  TransactionModel copyWith({
    String? date,
    String? note,
    String? price,
    String? transaction,
    String? userid,
  }) =>
      TransactionModel(
        date: date ?? this.date,
        note: note ?? this.note,
        price: price ?? this.price,
        transaction: transaction ?? this.transaction,
        userid: userid ?? this.userid,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['note'] = note;
    map['price'] = price;
    map['transaction'] = transaction;
    map['userid'] = userid;
    return map;
  }
}
