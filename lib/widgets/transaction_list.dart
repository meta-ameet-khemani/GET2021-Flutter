import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: transactions
            .map(
              (tx) => Card(
            child: Row(
              children: [
                Container(
                  child: Text(
                    '${tx.amount}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  ),
                  margin: EdgeInsets.symmetric(
                      horizontal: 15, vertical: 15),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border:
                    Border.all(color: Colors.purple, width: 2),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${tx.title}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                    Text(
                      DateFormat.yMMMd().format(tx.date),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
            .toList(),
      ),
    );
  }
}
