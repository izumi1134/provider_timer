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
                onPressed: () {
                  final currentCounter =
                      context.select<CountModel, int>((model) => model.counter);
                  if (currentCounter > 1) {
                    countModel.incrementSecondCounter();
                  }
                },
                child: Text('increment Second Counter'),
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
    final countModel = context.read<CountModel>();
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

//class CountText extends StatelessWidget {
// const CountText({Key? key}) : super(key: key);

//final model = context.watch<CountModel>();

// @override
//Widget build(BuildContext context) {
//  return Consumer<CountModel>(
//  builder: (context, model, child) {
//  return Column(
//    children: [
//  Text(
//    '${model.counter}',
//    style: Theme.of(context).textTheme.headlineMedium,
//   ),
//  Text(
//   '${model.secondCounter}',
//   style: Theme.of(context).textTheme.headlineMedium,
//   ),
//   ],
//   );
//  },
// );
// }
//}
