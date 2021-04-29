import 'package:intl/intl.dart';
import '../model/transaction.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {

  final List<Transaction> lastTransactions;
  Chart(this.lastTransactions);

  List<Widget> getChart() {
    List<Map<String, double>> weeklyExpense = [];
    Map<String, double> dayExpense = {};
    double totalExpense = 0.0;
    dayExpense['Mo'] = 0.0;
    dayExpense['Tu'] = 0.0;
    dayExpense['We'] = 0.0;
    dayExpense['Th'] = 0.0;
    dayExpense['Fr'] = 0.0;
    dayExpense['Sa'] = 0.0;
    dayExpense['Su'] = 0.0;
    List<String> days = dayExpense.keys.toList();
    for (var index = 0; index < lastTransactions.length; index++) {
      totalExpense += lastTransactions[index].amount;
      if (dayExpense.containsKey(
          DateFormat.E().format(lastTransactions[index].date)
              .toString()
              .substring(0, 2))) {
        dayExpense[DateFormat.E()
            .format(lastTransactions[index].date)
            .toString()
            .substring(0, 2)] += lastTransactions[index].amount;
      }
    }
    dayExpense.forEach((key, value) { weeklyExpense.add({key : value}); });
    List<Widget> allDaysExpenses = [];
    for (var a = 0; a < 7; a++) {
      allDaysExpenses.add(
        Container(
          child: Column(
            children: [
              Text('${weeklyExpense[a][days[a]]}'),
              SizedBox(height: 5),
              Container(
                height: 80,
                width: 10,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0),
                        // color: Color.fromRGBO(220, 220, 220, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    FractionallySizedBox(
                      heightFactor: weeklyExpense[a][days[a]] > 0 ? weeklyExpense[a][days[a]] / totalExpense : 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Text('${days[a]}')
            ],
          ),
        )
      );
    }
    return allDaysExpenses;
  }

  @override
  Widget build(BuildContext context) {
    getChart();
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: getChart(),
        ),
      ),
    );
  }
}
