import 'dart:async';

import './widgets/chart.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './model/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.purple,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'Shirt',
      amount: 900,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't10',
      title: 'Shirt 2',
      amount: 600,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Mouse',
      amount: 500,
      date: DateTime.now().subtract(Duration(days: 3)),
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
    Transaction(
      id: 't13',
      title: 'Petrol',
      amount: 570,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: 't32',
      title: 'Petrol',
      amount: 500,
      date: DateTime.now().add(Duration(days: 3)),
    ),
  ];

  void _addTransaction(String title, double amount, DateTime selectedDate) {
    print(selectedDate);
    setState(() {
      _transactions.add(
          Transaction(
              id: DateTime.now().toString(),
              title: title,
              amount: amount,
              date: selectedDate
          )
      );
    });
  }

  void _showNewTransactionForm (BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return NewTransaction(_addTransaction);
    });
  }

  List<Transaction> getLastTransactions(int difference) {
    List<Transaction> lastTransactions = [];
    for (Transaction tx in _transactions) {
      if (tx.date.isAfter(DateTime.now().subtract(Duration(days: difference)))) {
        lastTransactions.add(tx);
      }
    }
    return lastTransactions;
  }

  void _delete(String id) {
    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Transactions App'),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () => _showNewTransactionForm(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Chart(getLastTransactions(7)),
            TransactionList(_transactions, _delete),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNewTransactionForm(context),
        child: IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
