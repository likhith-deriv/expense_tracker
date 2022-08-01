import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  TransactionList(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: userTransactions.length,
        itemBuilder: (context, index) {
          final tx = userTransactions.elementAt(index);
          return Card(
              child: Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2)),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\$ ${tx.amount.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(tx.title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  Text(DateFormat.yMMMd().format(tx.date),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey))
                ],
              )
            ],
          ));
        });

    // return Container(
    //     child: SingleChildScrollView(
    //   child: Column(
    //     children: userTransactions
    //         .map((tx) => )
    //         .toList(),
    //   ),
    // ));
  }
}
