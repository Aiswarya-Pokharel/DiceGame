import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var random = Random();
  var pic = 1;
  int scoreA = 0;
  int scoreB = 0;
  var turn = true;
  String wins = '';
  String winner = '';
  void roll() {
    setState(() {
      pic = random.nextInt(6) + 1;
      if (turn) {
        scoreA += pic;
      } else {
        scoreB += pic;
      }
      turn = !turn;
    });
    if ((scoreA >= 30) || (scoreB >= 30)) {
      winer();
    }
  }

  void winer() {
    String winner = scoreA >= 30 ? "Team A" : "Team B";

    setState(() {
      wins = "Congratulations! $winner is Winner";
    });
  }

  void Roll() {
    if ((scoreA >= 30) || (scoreB >= 30)) {
    } else {
      roll();
    }
  }

  void reset() {
    setState(() {
      scoreA = scoreB = 0;
      wins = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dice App",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          Text(
            "$wins",
            style: const TextStyle(fontSize: 30, color: Colors.blue),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 45),
              Text(
                "Team A",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(width: 85),
              Text("Team B", style: TextStyle(fontSize: 30)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Score A: $scoreA",
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(width: 115),
              Text("Score B: $scoreB ", style: const TextStyle(fontSize: 15)),
            ],
          ),
          const SizedBox(height: 15),
          Image.asset(
            "assets/images/$pic.jpg",
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: Roll,
              child: const Text(
                "Roll",
                style: TextStyle(fontSize: 25),
              )),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: reset,
              child: const Text("Reset", style: TextStyle(fontSize: 25))),
        ],
      ),
    );
  }
}
