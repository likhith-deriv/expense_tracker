import 'package:flutter/material.dart';
import 'widgets/transaction_list.dart';
import 'widgets/new_transaction.dart';
import 'models/transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Groceries', amount: 14.53, date: DateTime.now())
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTransaction = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() => _userTransactions.add(newTransaction));
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransactions(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
          actions: <Widget>[
            IconButton(
                onPressed: () => _startAddNewTransaction(context),
                icon: Icon(Icons.add))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                width: double.infinity,
                child: Card(color: Colors.blue, child: Text('Chart'))),
            Expanded(child: TransactionList(_userTransactions))
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context)));
  }
}
