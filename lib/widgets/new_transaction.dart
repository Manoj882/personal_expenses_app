import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({required this.addTransaction, super.key});

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            SizedBox(
              height: 5,
            ),
            TextButton(
              onPressed: () {
                addTransaction(
                  titleController.text,
                  double.parse(
                    amountController.text,
                  ),
                );
              },
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  ' Add Transaction',
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
