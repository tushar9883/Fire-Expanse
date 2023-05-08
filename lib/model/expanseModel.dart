/// price : 100
/// note : "Petrole"
/// date : "08-05-2023"

class ExpanseModel {
  ExpanseModel({
    this.price,
    this.note,
    this.date,
  });

  ExpanseModel.fromJson(dynamic json, Map<String, dynamic>? data) {
    price = json['price'];
    note = json['note'];
    date = json['date'];
  }

  String? price;
  String? note;
  String? date;

  ExpanseModel copyWith({
    String? price,
    String? note,
    String? date,
  }) =>
      ExpanseModel(
        price: price ?? this.price,
        note: note ?? this.note,
        date: date ?? this.date,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = price;
    map['note'] = note;
    map['date'] = date;
    return map;
  }
}
