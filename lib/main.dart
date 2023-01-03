import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction_model.dart';
import 'package:personal_expenses_app/widgets/new_transaction.dart';
import 'package:personal_expenses_app/widgets/transaction_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: (){},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(
            addTransaction: _addNewTransaction,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses App'),
        actions: [
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(
              Icons.add_outlined,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Graph'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TransactionList(transactions: _userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(
          Icons.add_outlined,
        ),
      ),
    );
  }
}
