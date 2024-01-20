import 'package:counter_provider/count_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          title: Text('カウンター'),
        ),
        body: CountBody(),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'add',
              onPressed: () {
                context.read<CountModel>().incrementCounter();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 16),
            FloatingActionButton(
              heroTag: 'fav',
              onPressed: () {
                context.read<CountModel>().incrementSecondCounter();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.favorite),
            ),
          ],
        ),
      ),
    );
  }
}

class CountBody extends StatelessWidget {
  const CountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Consumer<CountModel>(
            builder: (context, model, child) {
              return Text(
                '${model.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            },
          ),
          Consumer<CountModel>(
            builder: (context, model, child) {
              return Text(
                '${model.secondCounter}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            },
          ),
        ],
      ),
    );
  }
}
