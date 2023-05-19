import 'package:flutter/material.dart';

class Transaction {
  Transaction({
    required this.id,
    required this.category,
    required this.descrption,
    required this.amount,
    required this.icon,
    required this.createAt,
  });

  final int id;
  final String category;
  final String descrption;
  final double amount;
  final IconData icon;
  final DateTime createAt;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json['id'],
        category: json['title'],
        descrption: json['subtitle'],
        amount: json['amount'],
        icon: json['icon'],
        createAt: json['createdAt'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': category,
        'subtitle': descrption,
        'amount': amount,
        'icon': icon,
        'createdAt': createAt,
      };
}
