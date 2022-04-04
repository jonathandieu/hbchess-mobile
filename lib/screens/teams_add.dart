import 'package:flutter/material.dart';

class TeamsAdd extends StatefulWidget {
  const TeamsAdd({Key? key}) : super(key: key);

  @override
  State<TeamsAdd> createState() => _TeamsAddState();
}

class _TeamsAddState extends State<TeamsAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add teams"),
      ),
      body: const Center(
        child: Text('Add teams page'),
      ),
    );
  }
}
