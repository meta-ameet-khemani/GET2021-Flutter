import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function toDelete;

  TransactionList(this.transactions, this.toDelete);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      margin: EdgeInsets.all(10),
      child: !transactions.isEmpty ? ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: FittedBox(
                      child: Text(
                        '\$${transactions[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                title: Text(
                  transactions[index].title,
                  style: Theme.of(context).textTheme.title,
                ),
                subtitle: Text(
                  DateFormat.yMMMd().format(transactions[index].date),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => toDelete(transactions[index].id),
                  padding: EdgeInsets.only(right: 0),
                ),
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ) : Container(
        child: Image.asset('assets/images/no_transactions.png'),
      ),
    );
  }
}
