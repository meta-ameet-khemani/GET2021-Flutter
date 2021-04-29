import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData () {

    final title = _titleController.text;
    final amount = double.parse(_amountController.text);

    if (title.isEmpty || amount <= 0 || _selectedDate == null) return;

    widget.addTransaction(title, amount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _selectDate () {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now(),
    ).then((value) {
      if (value == null)
        return;
      setState(() {
        _selectedDate = value;
        if (_titleController.text.isEmpty || double.parse(_amountController.text) <= 0 || _selectedDate == null) return;
        widget.addTransaction(_titleController.text, double.parse(_amountController.text), _selectedDate);
        Navigator.of(context).pop();
      });
    });
  }

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
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
                // onChanged: (value) {amount = value;},
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedDate == null ? 'No chosen date' : DateFormat.yMMMd().format(_selectedDate),
                  style: TextStyle(fontSize: 17),
                ),
                FlatButton(
                  onPressed: _selectDate,
                  child: Text(
                    'Select Date',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                        fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
            RaisedButton(
              // onPressed: () {
              //   widget.addTransaction(
              //       titleController.text, double.parse(amountController.text));
              // },
              onPressed: _submitData,
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
