import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/pages/stream/create_stream.dart';

class StreamProviderExampleSolution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<int>(
      builder: (context, counter, _) => Scaffold(
            body: Center(
              child: Text(
                counter.toString(),
                style: TextStyle(fontSize: 32),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                bloc.sink.add(++counter);
              },
            ),
          ),
    );
  }
}
