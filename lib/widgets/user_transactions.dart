import 'package:flutter/material.dart';
import '../models/transactions.dart';
import './transaction_list.dart';
import './new_transaction.dart';

// class UserTransactions extends StatefulWidget {
//   @override
//   _UserTransactionState createState() => _UserTransactionState();
// }

class UserTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      NewTransactions(_addNewTransaction),
      Expanded(child: TransactionList(_userTransactions))
    ]);
  }
}
