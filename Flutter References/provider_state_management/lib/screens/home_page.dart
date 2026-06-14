import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/providers/counter_provider.dart';
import 'package:provider_state_management/screens/home_page2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CounterProvider>(
        builder: (BuildContext context, CounterProvider value, Widget? child) {
          return Center(
            child: Column(
              children: [
                Text("Click Count "),
                FloatingActionButton(
                  child: Text("Update ${value.count}"),
                  onPressed: () {
                    context.read<CounterProvider>().incrementCounter();
                  },),

                FloatingActionButton(
                    child: Text("Go to new Screen"),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage2(),));
                })
              ],
            ),
          );
        },
      ),
    );
  }
}
