import 'package:flutter/material.dart';

class Transactionpages extends StatefulWidget {
  const Transactionpages({super.key});

  @override
  State<Transactionpages> createState() => _TransactionpagesState();
}

class _TransactionpagesState extends State<Transactionpages> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Transaction Pages"),
      ),
    );
  }
}