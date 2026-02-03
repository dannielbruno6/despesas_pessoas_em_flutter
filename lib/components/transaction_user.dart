import 'package:flutter/material.dart';
import'transaction_form.dart';
import'transaction_list.dart';
import '../models/transaction.dart';
import 'dart:math';

class TransactionUser extends StatefulWidget {


  @override
  State<TransactionUser> createState() => _State();
}

class _State extends State<TransactionUser> {

  final _transactions = [
    Transaction(id: 't3', title: 'pagamento de conta', value: 744, date: DateTime.now())
  ];

  _addTransaction(String title, double value){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
        date: DateTime.now(),
    );
    setState(() {
      _transactions.add(newTransaction);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(_addTransaction),
      ],
    );
  }
}
