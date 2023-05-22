class Transaction {
  final int id;
  final String description;
  final double amount;
  final String? userId;
  final String? categoryId;
  final String? paymentMethodId;

  Transaction({
    required this.id,
    required this.description,
    required this.amount,
    this.userId,
    this.categoryId,
    this.paymentMethodId,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json['id'],
        description: json['description'],
        amount: json['amount'],
        userId: json['user_id'],
        categoryId: json['category_id'],
        paymentMethodId: json['payment_method_id'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'amount': amount,
        'user_id': userId,
        'category_id': categoryId,
        'payment_method_id': paymentMethodId,
      };

  Transaction copyWith({
    int? id,
    String? description,
    double? amount,
    String? userId,
    String? categoryId,
    String? paymentMethodId,
  }) {
    return Transaction(
      id: id ?? this.id,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      userId: userId ?? this.userId,
      categoryId: categoryId ?? this.categoryId,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
    );
  }
}
