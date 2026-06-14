import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/providers/counter_provider.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CounterProvider>(
        builder: (BuildContext context, CounterProvider value, Widget? child) {
          return Center(
            child: Column(
              children: [
                Text("Value on Screen 2 : ${value.count}"),
                ElevatedButton(onPressed: (){
                  context.read<CounterProvider>().incrementCounter();
                },
                child: Text("Update on Screen 2"))
                ],
            )
          );
        },
      ),
    );
  }
}
