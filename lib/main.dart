import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Placar'),
    );
  }
}

class MyTimer extends StatefulWidget {
  final VoidCallback? onTimerToggle;

  const MyTimer({super.key, this.onTimerToggle});

  @override
  State<StatefulWidget> createState() => _MyTimerState();

}

class _MyTimerState extends State<MyTimer> {
  int _count = 300;
  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_count > 0) {
        setState(() {
          _count--;
        });
      } else {
        _timer.cancel();
      }
    });
    widget.onTimerToggle?.call();
  }

  void pauseTimer() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    widget.onTimerToggle?.call();
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$_count', style: const TextStyle(fontSize: 25),),
          const SizedBox(width: 10),
          ElevatedButton(onPressed: (){
            startTimer();
          }, child: const Text("Start")),
          const SizedBox(width: 10,),
          ElevatedButton(onPressed: (){
            pauseTimer();
          }, child: const Text("Pause"))
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counterTeam1 = 0;
  int _counterTeam2 = 0;
  bool _timerIsActive = false;

  void _incrementCounterTeam1() {
    setState(() {
      if (_timerIsActive) {
        _counterTeam1++;
      }
    });
  }

  void _incrementCounterTeam2() {
    setState(() {
      if (_timerIsActive) {
        _counterTeam2++;
      }
    });
  }

  void toggle(){
    _timerIsActive = !_timerIsActive;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
          child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Time 1", style: TextStyle(fontSize: 34),),
                        Text(_counterTeam1.toString(), style: const TextStyle(fontSize: 34)),
                        ElevatedButton(onPressed: _incrementCounterTeam1, child: const Icon(Icons.add))
                      ],
                    ),
                    const SizedBox(width: 20,),
                    const Text("X", style: TextStyle(fontSize: 20)),
                    const SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      const Text("Time 2", style: TextStyle(fontSize: 34)),
                      Text(_counterTeam2.toString(), style: const TextStyle(fontSize: 34)),
                      ElevatedButton(onPressed: _incrementCounterTeam2, child: const Icon(Icons.add))
                    ],)
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTimer(
                      onTimerToggle: toggle,
                    )
                  ],
                )
              ],
            )
        ),

    );
  }
}
