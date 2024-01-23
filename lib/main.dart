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
          title: const Text('カウンター'),
        ),
        body: Consumer<CountModel>(builder: (context, model, child) {
          return CountBody(
            counter: model.counter,
            textColor: model.currentColor,
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
                  context.read<CountModel>().updateColor();
                },
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
  const CountBody({
    Key? key,
    required this.counter,
    required this.textColor,
  }) : super(key: key);
  final int counter;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          CountText(
            textColor: textColor,
          ),
        ],
      ),
    );
  }
}

class CountText extends StatelessWidget {
  CountText({Key? key, required this.textColor}) : super(key: key);
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Consumer<CountModel>(
      builder: (context, model, child) {
        return Column(
          children: [
            Text(
              '${model.counter}',
              style: TextStyle(
                color: textColor,
                fontSize: 30,
              ),
            ),
          ],
        );
      },
    );
  }
}
