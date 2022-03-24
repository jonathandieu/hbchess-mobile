import 'package:flutter/material.dart';

// Dummy leaderboard entries
final List<String> playerRankings = <String>['A', 'B', 'C'];

// need to add lazy loading for leaderboard entries
class Leaderboard extends StatefulWidget {
  const Leaderboard({Key? key}) : super(key: key);

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leaderboard"),
      ),
      body: Stack(
        children: <Widget>[
          Column(),
          ListView.separated(
            padding: const EdgeInsets.all(25),
            itemCount: playerRankings.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                color: Color.fromARGB(255, 200, 225, 236),
                child: Center(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '# ${index + 1} - ${playerRankings[index]}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ],
      ),
    );
  }
}

//createListTile(String player) {}
