import '../model/transaction.dart';
import './transaction_list.dart';
import 'package:flutter/material.dart';

import 'new_transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'Shirt',
      amount: 900,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Food',
      amount: 250,
      date: DateTime.now().subtract(Duration(days: 10)),
    ),
    Transaction(
      id: 't3',
      title: 'Petrol',
      amount: 500,
      date: DateTime.now().subtract(Duration(days: 23)),
    ),
  ];

  void _addTransaction(String title, double amount) {
    print(title);
    print(amount);
    setState(() {
      _transactions.add(
        Transaction(
            id: DateTime.now().toString(),
            title: title,
            amount: amount,
            date: DateTime.now()
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART!'),
              elevation: 5,
            ),
          ),
          NewTransaction(_addTransaction),
          TransactionList(_transactions),
        ],
      ),
    );
  }
}
