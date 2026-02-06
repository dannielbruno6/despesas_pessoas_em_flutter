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

  @override
  Widget build(BuildContext context) {
    groupedTransactions; // apenas para debug
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(children:
      groupedTransactions.map((tr) {
        return ChartBar(
            label: tr['day'] as String,
            value: tr['value'] as double,
            percentage: 0,
        );
      }).toList(),
      ),
    );
  }
}

