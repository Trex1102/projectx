import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/expense_entity.dart';

class ExpenseModel {
  final String id;
  final String userId;
  final double amount;
  final String date;
  final String time;
  final String note;
  final String categoryId;

  ExpenseModel({
    required this.id,
    required this.userId,
    required this.amount,
    required this.date,
    required this.time,
    required this.note,
    required this.categoryId,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      id: json['id'],
      userId: json['userId'],
      amount: json['amount'],
      date: (json['date']),
      time: (json['time']),
      note: json['note'],
      categoryId: json['categoryId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'amount': amount,
      'date': date,
      'time': time,
      'note': note,
      'categoryId': categoryId,
    };
  }

  factory ExpenseModel.fromEntity(ExpenseEntity entity) {
    return ExpenseModel(
      id: entity.id,
      userId: entity.userId,
      amount: entity.amount,
      date: _getStringFromDateTime(entity.date),
      time: _getStringFromTime(entity.time),
      note: entity.note,
      categoryId: entity.category.id,
    );
  }

  ExpenseEntity toEntity() {
    return ExpenseEntity(
      id: id,
      userId: userId,
      amount: amount,
      date: _getDateTimeFromString(date),
      time: _getTimeFromString(time),
      note: note,
      category: _getCategoryFromId(categoryId),
    );
  }

  static DateTime _getDateTimeFromString(String dateString) {
    return DateFormat('yyyy-MM-dd').parse(dateString);
  }

  static String _getStringFromDateTime(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static TimeOfDay _getTimeFromString(String timeString) {
    final time = timeString.split(':');
    return TimeOfDay(hour: int.parse(time[0]), minute: int.parse(time[1]));
  }

  static String _getStringFromTime(TimeOfDay time) {
    return '${time.hour}:${time.minute}';
  }

  static CategoryEntity _getCategoryFromId(String categoryId) {
    return predefinedCategories
        .firstWhere((category) => category.id == categoryId);
  }


}
