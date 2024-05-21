import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No transaction added yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView(
            children: transactions
                .map((e) => TransactionItem(
                      key: ValueKey(e.id),
                      transaction: e,
                      deleteTx: deleteTx,
                    ))
                .toList(),

            /*OLD WAY FOR SHOWING ITEMS*/
            // return Card(
            //   child: Row(
            //     children: [
            //       Container(
            //         padding: EdgeInsets.all(10),
            //         margin: EdgeInsets.symmetric(
            //           vertical: 10,
            //           horizontal: 15,
            //         ),
            //         decoration: BoxDecoration(
            //             border: Border.all(
            //           color: Theme.of(context).primaryColor,
            //           width: 2,
            //         )),
            //         child: Text(
            //           '\$${transactions[index].amount.toStringAsFixed(2)}',
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontSize: 20,
            //             color: Theme.of(context).primaryColor,
            //           ),
            //         ),
            //       ),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             transactions[index].title,
            //             style: Theme.of(context).textTheme.headline6,
            //           ),
            //           Text(
            //               DateFormat.yMd().format(transactions[index].date),
            //               style: TextStyle(
            //                 color: Colors.grey,
            //                 fontSize: 12,
            //               )),
            //         ],
            //       )
            //     ],
            //   ),
            // );

            /*NEW WAY FOR SHOWING ITEMS*/
            //se pasa la longitud del array
          );
  }
}
