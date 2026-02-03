import 'package:flutter/material.dart';
import'transaction_form.dart';
import'transaction_list.dart';
import '../models/transaction.dart';
class TransactionUser extends StatefulWidget {


  @override
  State<TransactionUser> createState() => _State();
}

class _State extends State<TransactionUser> {

  final _transactions = [
    Transaction(id: 't1', title: 'compra sapato', value: 79.00, date: DateTime.now()),
    Transaction(id: 't2', title: 'compra mercado', value: 132.45, date: DateTime.now()),
    Transaction(id: 't3', title: 'pagamento de conta', value: 744, date: DateTime.now())
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(),
      ],
    );
  }
}
