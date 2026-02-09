import 'components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'components/transaction_list.dart';
import 'models/transaction.dart';
import 'components/chart.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  ExpensesApp({super.key});
  final ThemeData tema = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: 'OpenSans',

        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
        ).copyWith(
          secondary: Colors.amber,
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),


        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions  = [


  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
          Duration(days: 7),
      ));
    }).toList();
  }


  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }
      _removeTransaction(String id){
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
      }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
         Chart(_recentTransactions),
            TransactionList(_transactions, _removeTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
