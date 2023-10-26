import 'package:flutter/material.dart';
import 'category_entity.dart';

class ExpenseEntity {
  final String id;
  final String userId;
  final double amount;
  final DateTime date;
  final TimeOfDay time;
  final String note;
  final CategoryEntity category;

  ExpenseEntity({
    required this.id,
    required this.userId,
    required this.amount,
    required this.date,
    required this.time,
    required this.note,
    required this.category,
  });

  ExpenseEntity copyWith({
    String? id,
    String? userId,
    double? amount,
    DateTime? date,
    TimeOfDay? time,
    String? note,
    CategoryEntity? category,
  }) {
    return ExpenseEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      time: time ?? this.time,
      note: note ?? this.note,
      category: category ?? this.category,
    );
  }
}
