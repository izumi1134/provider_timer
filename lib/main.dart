import 'package:counter_provider/count_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('カウンター'),
        ),
        body: Consumer<CountModel>(builder: (context, model, child) {
          return CountBody(
            counter: model.counter,
            secondCounter: model.secondCounter,
          );
        }),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Consumer<CountModel>(builder: (context, model, child) {
              return FloatingActionButton(
                heroTag: 'add',
                onPressed: () {
                  context.read<CountModel>().incrementCounter();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              );
            }),
            const SizedBox(height: 16),
            Consumer<CountModel>(builder: (context, model, child) {
              return FloatingActionButton(
                heroTag: 'fav',
                onPressed: () {
                  context.read<CountModel>().incrementSecondCounter();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.favorite),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class CountBody extends StatelessWidget {
  CountBody({
    Key? key,
    required this.counter,
    required this.secondCounter,
  }) : super(key: key);
  final int counter;
  final int secondCounter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '${counter}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            '${secondCounter}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
