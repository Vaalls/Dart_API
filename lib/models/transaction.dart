import 'dart:convert';

class Transaction {
  String id;
  String senderAccountId;
  String receiverAccountId;
  DateTime date;
  double amount;
  double taxes;

  Transaction(
      {required this.id,
      required this.senderAccountId,
      required this.receiverAccountId,
      required this.date,
      required this.amount,
      required this.taxes});

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map["id"] as String,
      senderAccountId: map["senderAccountId"] as String,
      receiverAccountId: map["receiverAccountId"] as String,
      date: map["date"] as DateTime,
      amount: (map["amount"] is int)
          ? (map["amount"] as int).toDouble()
          : map["amount"] as double,
      taxes: (map["taxes"] is int)
          ? (map["taxes"] as int).toDouble()
          : map["taxes"] as double
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      "id": id,
      "senderAccountId": senderAccountId,
      "receiverAccountId": receiverAccountId,
      "date": date,
      "amount": amount,
      "taxes": taxes
    };
  }

  Transaction copyWith({
    String? id,
    String? senderAccountId,
    String? receiverAccountId,
    DateTime? date,
    double? amount,
    double? taxes
  }) { 
    return Transaction(
      id: id ?? this.id,
      senderAccountId: senderAccountId ?? this.senderAccountId,
      receiverAccountId: receiverAccountId ?? this.receiverAccountId,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      taxes: taxes ?? this.taxes
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) =>
    Transaction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '\nConta $id\nEnviando: $senderAccountId \nRecebendo: $receiverAccountId\nValor tranferido: $amount\n';
  }

    @override
  bool operator ==(covariant Transaction other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.senderAccountId == senderAccountId &&
        other.receiverAccountId == receiverAccountId &&
        other.date == date && 
        other.amount == amount &&
        other.taxes == taxes;
  }

  @override
  int get hashCode {
    return id.hashCode ^ senderAccountId.hashCode ^ receiverAccountId.hashCode ^ amount.hashCode;
  }

}
