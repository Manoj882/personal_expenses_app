import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/transaction_model.dart';
import 'package:personal_expenses_app/widgets/new_transaction.dart';
import 'package:personal_expenses_app/widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Buy Shoes',
      amount: 25.34,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Groceries',
      amount: 70.34,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String transTitle, double transAmount) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: transTitle,
      amount: transAmount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addTransaction: _addNewTransaction),
        SizedBox(
          height: 10,
        ),
        TransactionList(transactions: _userTransactions),
      ],
    );
  }
}
