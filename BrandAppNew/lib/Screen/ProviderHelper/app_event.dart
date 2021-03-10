import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:dataclass/dataclass.dart';

// import 'routes.dart';



class AppEvent {
  final String title;
  final String id;
  final String description;
  final DateTime date;
  final String userId;
  final bool reminder;
  AppEvent({
    this.title,
    this.id,
    this.description,
    this.date,
    this.userId,
    this.reminder,
  });


  AppEvent copyWith({
    String title,
    String id,
    String description,
    DateTime date,
    String userId,
    bool reminder,
  }) {
    return AppEvent(
      title: title ?? this.title,
      id: id ?? this.id,
      description: description ?? this.description,
      date: date ?? this.date,
      userId: userId ?? this.userId,
      reminder: reminder ?? this.reminder,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
      'description': description,
      'date': date?.millisecondsSinceEpoch,
      'userId': userId,
      'reminder': reminder,
    };
  }

  factory AppEvent.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AppEvent(
      title: map['title'],
      id: map['id'],
      description: map['description'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      userId: map['userId'],
      reminder: map['reminder'],
    );
  }

  factory AppEvent.fromDS(String id,  Map<String, dynamic> map) {
    if (map == null) return null;

    return AppEvent(
      title: map['title'],
      id: id,
      description: map['description'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      userId: map['userId'],
      reminder: map['reminder'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppEvent.fromJson(String source) => AppEvent.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppEvent(title: $title, id: $id, description: $description, date: $date, userId: $userId, reminder: $reminder)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AppEvent &&
        o.title == title &&
        o.id == id &&
        o.description == description &&
        o.date == date &&
        o.userId == userId &&
        o.reminder == reminder;
  }

  @override
  int get hashCode {
    return title.hashCode ^
    id.hashCode ^
    description.hashCode ^
    date.hashCode ^
    userId.hashCode ^
    reminder.hashCode;
  }
}
