import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:hb_chess/utils/getTeamsAPI.dart';
import 'package:hb_chess/utils/getTeamsInviteAPI.dart';
import 'package:hb_chess/utils/Search.dart';
import 'dart:async';
import 'package:hb_chess/main.dart';

  late String res = '';

class Add extends StatefulWidget {
  const Add({Key? key, required this.query}) : super(key: key);
  final String query;

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Confirmation"),
        ),
        body: Center(
          child: 
            Card(
              margin: const EdgeInsets.all(5),
              color:Color.fromARGB(255, 235, 235, 235),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color.fromARGB(255, 31, 41, 55),
                    width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              child: 
                Container(
                  height: 80,
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(widget.query,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 30),
                        child: TextButton(
                          onPressed: ()
                          {
                            inviteResult(widget.query);
                            Navigator.of(context).pop();
                          },
                          child: const Text("Send Request"),
                          style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 43, 128, 76),
                          primary: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ),

        ),
    );
  }

  inviteResult(String query) async
  {
    Future<String> message = createTeam(query);
    res = await message;
  }
}