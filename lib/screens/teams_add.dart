import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:hb_chess/utils/getTeamsAPI.dart';
import 'package:hb_chess/utils/getTeamsInviteAPI.dart';
import 'package:hb_chess/utils/Search.dart';
import 'dart:async';
import 'package:hb_chess/main.dart';

class TeamsAdd extends StatefulWidget {
  const TeamsAdd({Key? key}) : super(key: key);

  @override
  State<TeamsAdd> createState() => _TeamsAddState();
}

class _TeamsAddState extends State<TeamsAdd> {
  late List<PendingTeam> teamNot = [];

  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Add Teams');

  @override
  Widget build(BuildContext context) {

    getRequests();
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
        body:
          Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Card(
                          margin: const EdgeInsets.all(5),
                          child: Container(
                            height: 80,
                            alignment: Alignment.center,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(teamNot[index].getSenderUser(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 20)),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 30),
                                  child: TextButton(
                                    onPressed: ()
                                    {
                                      //getPendingTeams();a
                                      acceptInvite(teamNot[index].getSenderUser());
                                    },
                                    child: const Text("Accept"),
                                    style: TextButton.styleFrom(
                                    backgroundColor: Color.fromARGB(255, 43, 128, 76),
                                    primary: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                        },
                        childCount: teamNot.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

  }

  getRequests() async {
    Future<List<PendingTeam>> resInvites = getPendingTeams();
    teamNot = await resInvites;
    if (mounted) setState((){});
  }

}

class CustomSearchDelegate extends SearchDelegate
{
  //late List<User> list;
  late List<User> searchTerms = [];
  late String res = '';

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
    List matchQuery = [];
    getList(query);

    for (var user in searchTerms) {
      // if (user.toLowerCase().contains(query.toLowerCase())) {
      //   matchQuery.add(user.getUser());
      // }
      if (user.getUser().toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(user.getUser());
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
    getList(query);
    for (var user in searchTerms) {
      // if (user.toLowerCase().contains(query.toLowerCase())) {
      //   matchQuery.add(user.getUser());
      // }
      if (user.getUser().toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(user.getUser());
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

  inviteResult(String query) async
  {
    Future<String> message = createTeam(query);
    res = await message;
  }

  getList(String query) async
  {
    Future<List<User>> users = search(query);
    searchTerms = await users;
    // for (int i = 0; i < list.length; i++)
    // {
    //   print(list[i].getUser());
    // }
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
                inviteResult(result);
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(res)),
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