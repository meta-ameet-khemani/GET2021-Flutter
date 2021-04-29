// import '../model/transaction.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class UserTransactions extends StatefulWidget {
//   final List<Transaction> transactions;
//   UserTransactions(this.transactions);
//   @override
//   _UserTransactionsState createState() => _UserTransactionsState();
// }
//
// class _UserTransactionsState extends State<UserTransactions> {
//
//   void _addTransaction(String title, double amount) {
//     print(title);
//     print(amount);
//     setState(() {
//       widget.transactions.add(
//         Transaction(
//             id: DateTime.now().toString(),
//             title: title,
//             amount: amount,
//             date: DateTime.now()
//         )
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         // mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           Container(
//             width: double.infinity,
//             child: Card(
//               color: Colors.blue,
//               child: Text('CHART!'),
//               elevation: 5,
//             ),
//           ),
//           // NewTransaction(_addTransaction),
//           Container(
//             height: 300,
//             child: ListView.builder(
//               itemBuilder: (context, index) {
//                 return Card(
//                   child: Row(
//                     children: [
//                       Container(
//                         child: Text(
//                           '${widget.transactions[index].amount}',
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.purple),
//                         ),
//                         margin: EdgeInsets.symmetric(
//                             horizontal: 15, vertical: 15),
//                         padding: EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           border:
//                           Border.all(color: Colors.purple, width: 2),
//                         ),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             '${widget.transactions[index].title}',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                                 fontSize: 20),
//                           ),
//                           Text(
//                             DateFormat.yMMMd().format(widget.transactions[index].date),
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.grey,
//                                 fontSize: 20),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               itemCount: widget.transactions.length,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
