import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalexpenses/models/transaction.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transaction;
  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: transaction.length,
        itemBuilder: (context,index){
          return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple)
                    ),
                    child: Text('₹${transaction[index].price}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transaction[index].title,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        DateFormat.yMMMd().format(transaction[index].date),
                        style: TextStyle(
                            color: Colors.grey
                        ),
                      )
                    ],
                  )
                ],
              )
          );
        }

      ),
    );
  }
}
