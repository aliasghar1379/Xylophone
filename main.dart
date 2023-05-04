import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Future<void> playSound(int num) async {
    final player = AudioCache();
    await player.load('note$num.wav');
    await player.play('note$num.wav');
  }
  // ignore: avoid_types_as_parameter_names
  Expanded buildkey(num, Color color){
    return Expanded(
      child: TextButton(
        onPressed: () async {
          playSound(num);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
        child: const Text(''),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildkey(1, Colors.red),
              buildkey(2, Colors.orange),
              buildkey(3, Colors.yellow),
              buildkey(4, Colors.green),
              buildkey(5, Colors.teal),
              buildkey(6, Colors.blue),
              buildkey(7, Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
