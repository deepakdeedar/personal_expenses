import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {

  final Function newTransaction;

  NewTransaction(this.newTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController=TextEditingController();

  final amountController=TextEditingController();

  void submitData()
  {
    final enteresTitle=titleController.text;
    final enteredAmount=int.parse(amountController.text);

    if(enteresTitle.isEmpty || enteredAmount <= 0)
      return;

    widget.newTransaction(enteresTitle,enteredAmount,);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: 'Title',
              ),
              controller: titleController,
              onSubmitted: (_)=>submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Amount'
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_)=>submitData(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
