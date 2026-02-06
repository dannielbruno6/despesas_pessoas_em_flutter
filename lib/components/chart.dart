import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'chart_bar.dart';

class Chart extends StatefulWidget {
  final List<Transaction>recentTransaction;

  Chart(this.recentTransaction);
  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      // Criamos apenas a data, sem hora, minuto ou segundo
      final weekDay = DateTime.now().subtract(Duration(days: 6 - index));
      final weekDayDate = DateTime(weekDay.year, weekDay.month, weekDay.day);

      double totalSum = 0;

      for (var i = 0; i < widget.recentTransaction.length; i++) {
        final tx = widget.recentTransaction[i];
        final txDate = DateTime(tx.date.year, tx.date.month, tx.date.day); // apenas dia

        // compara só o dia
        if (txDate == weekDayDate) {
          totalSum += tx.value;
        }
      }



      return {
        'day': DateFormat.E().format(weekDayDate)[0],
        'value': totalSum,
      };
    });
  }

   double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + (tr['value'] as double);
    });
   }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((tr) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
                label: tr['day'] as String,
                value: tr['value'] as double,
                percentage: (tr['value'] as double) / _weekTotalValue ,
            ),
          );
        }).toList(),
        ),
      ),
    );
  }
}

