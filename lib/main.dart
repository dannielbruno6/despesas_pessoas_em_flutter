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
    Transaction(id: 't2', title: 'compra mercado', value: 132.45, date: DateTime.now()),
    Transaction(id: 't3', title: 'pagamento de conta', value: 744, date: DateTime.now())
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
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                            width: 2,
                      )
                    ),
                    padding: EdgeInsets.all(10),

                    child: Text(
                      tr.value.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple
                      ),

                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tr.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black
                        ),
                      ),
                      Text(tr.date.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blueGrey
                        ),),
                    ],
                  )
                ],
              )
              );
            }).toList(),
            ),
            ]
            ),
            ),



    );
  }
}
