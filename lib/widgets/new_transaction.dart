import 'package:flutter/material.dart';

class NewTransactions extends StatefulWidget {
  final Function addTransactions;

  NewTransactions(this.addTransactions);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) return;
    this.widget.addTransactions(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titleController,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                ),
                TextField(
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  onSubmitted: (_) => submitData(),
                ),
                TextButton(
                    child: Text('Add transaction',
                        style: TextStyle(color: Colors.purple)),
                    onPressed: submitData)
              ],
            )));
  }
}
