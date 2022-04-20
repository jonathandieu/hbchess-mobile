import 'package:flutter/material.dart';
import 'package:hb_chess/utils/getTeamsAPI.dart';
import 'package:hb_chess/utils/Search.dart';
import 'dart:async';

class TeamsAdd extends StatefulWidget {
  const TeamsAdd({Key? key}) : super(key: key);

  @override
  State<TeamsAdd> createState() => _TeamsAddState();
}

class _TeamsAddState extends State<TeamsAdd> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Add Teams');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        actions: [
          IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(),
            );
          },
          icon: customIcon,
          )
        ],
      ),
      body: Center(
        child: Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(141, 41, 55, 100),
                  textStyle: const TextStyle(fontSize: 20),
                  minimumSize: const Size.fromHeight(50),
                  side: const BorderSide(
                    width: 1,
                    color: Color.fromARGB(31, 16, 23, 94),
                    style: BorderStyle.solid,
                  ),
                ),
                onPressed: () {
                  getTeams();
                  //search("tye");
                },
                child: const Text("test button"),
              ),
            ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate
{
  List searchTerms = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //<List> users = search(query);
    List matchQuery = [];

    for (var user in searchTerms) {
      if (user.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(user);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            createDialog(context, result);
          },
        );
      }
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var user in searchTerms) {
      if (user.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(user);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            createDialog(context, result);
          },
        );
      }
    );
  }

  createDialog(context, var result)
  {
    showDialog(context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Send Request?"),
          content: Text('Send friend request to ' + result + '?'),
          actions: <Widget>[
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('No')
            ),
            TextButton(
              onPressed: () {
                // Navigator.of(context).pop(), child: const Text('Yes')
                //FIXME: send request api
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Sent a friend request to " + result)),
                );
              },
              child: const Text('Yes'),
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 128, 150, 182),
                primary: Colors.white,
              ),
            ),
          ],
        );
      }
    );
  }
  
}