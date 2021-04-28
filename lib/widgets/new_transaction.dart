import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              // onChanged: (value) {title = value;},
              controller: titleController,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Amount',
                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
                // onChanged: (value) {amount = value;},
                controller: amountController,
              ),
            ),
            RaisedButton(
              onPressed: () {
                addTransaction (
                  titleController.text,
                  double.parse(amountController.text)
                );
              },
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.purpleAccent,
            ),
          ],
        ),
      ),
    );
  }
}
