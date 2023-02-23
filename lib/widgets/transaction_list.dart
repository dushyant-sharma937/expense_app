import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList(this.transactions, this.deleteTx, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 540,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraint) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: constraint.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      )),
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  elevation: 4,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: ListTile(
                    textColor: Color.fromARGB(255, 255, 255, 255),
                    tileColor: Color.fromARGB(255, 37, 42, 52),
                    hoverColor: Color.fromARGB(152, 7, 171, 168),
                    shape: ContinuousRectangleBorder(
                      side: const BorderSide(
                          style: BorderStyle.solid,
                          width: 2,
                          // color: Color.fromARGB(255, 255, 46, 99)),
                          color: Color.fromARGB(152, 7, 171, 168)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      radius: 35,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Rs ${transactions[index].amount}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      onPressed: () => deleteTx(transactions[index].id),
                      icon: const Icon(Icons.delete_outline_rounded),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
