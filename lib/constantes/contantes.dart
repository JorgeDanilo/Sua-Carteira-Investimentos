import 'package:flutter/material.dart';

final List<Draw> drawerItems = [
  Draw(title: 'Quick Payment', icon: Icons.photo_camera),
  Draw(title: 'Favorite Account', icon: Icons.supervised_user_circle),
  Draw(title: 'Invoice History', icon: Icons.receipt),
  Draw(title: 'Complain', icon: Icons.speaker_notes),
  Draw(title: 'Activity Log', icon: Icons.assessment),
  Draw(title: 'Settings', icon: Icons.settings),
];

final List transactions = [
  Trx(
    type: 'cwdr/',
    number: '974884/9874513365478965',
    amount: '10,000.00',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: '974884/9874513365478965',
    amount: '11,000.00',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: '974884/9874513365478965',
    amount: '12,000.00',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: '974884/9874513365478965',
    amount: '13,000.00',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: '974884/9874513365478965',
    amount: '14,000.00',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: '974884/9874513365478965',
    amount: '15,000.00',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: '974884/9874513365478965',
    amount: '16,000.00',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: '974884/9874513365478965',
    amount: '55,000.00',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: '974884/9874513365478965',
    amount: '15,000.00',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: '974884/9874513365478965',
    amount: '25,000.00',
    date: '10-06-2019',
  ),
];

class Trx {
  final String type, number, amount, date;
  Trx({this.type, this.amount, this.date, this.number});
}

class Draw {
  final String title;
  final IconData icon;
  Draw({this.title, this.icon});
}