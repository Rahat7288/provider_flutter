import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providert_stmng/provider/counter_provider.dart';
import 'package:providert_stmng/screens/second_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Counter value is ${context.watch<CounterProvider>().counter}"),
        SizedBox(
          height: 50,
        ),
        Container(
          width: 350,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterProvider>().increment();
                },
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterProvider>().decrement();
                },
                child: Icon(Icons.remove),
              )
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SecondScreen(),
              ));
            },
            child: Text('go to next page'))
      ],
    ));
  }
}
