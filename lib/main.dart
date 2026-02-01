import 'package:expense/models/transaction.dart';
import 'package:flutter/material.dart';


main() => runApp(MyHomePage());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {


  final _transactions = [
    Transaction(id: 't1', title: 'compra sapato', value: 79.00, date: DateTime.now()),
    Transaction(id: 't2', title: 'compra mercado', value: 132.45, date: DateTime.now())
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(child: Text("Despesas pessoais")),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(

              child: Card(
                child: Text('Grafico'),
                elevation: 5,
                color: Colors.black12,
              ),
            ),

            Column(
            children: _transactions.map((tr){
              return Card(
              child: Text(tr.title),
              );
            }).toList(),
            ),
            ]
            ),
            ),



    );
  }
}
