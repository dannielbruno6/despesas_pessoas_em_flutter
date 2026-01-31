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
  const MyHomePage({super.key});

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

            Card(
              elevation: 5,
              color: Colors.black12,
                child: Text(

                'Lista de Transacoes'
            )
            ),
          ],
        ),
      ),
    );
  }
}
