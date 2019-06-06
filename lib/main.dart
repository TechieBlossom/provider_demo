import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/pages/change_notifier_provider/change_provider_example_solution.dart';
import 'package:provider_demo/pages/provider_base_example_problem.dart';
import 'package:provider_demo/pages/provider_base_example_solution.dart';
import 'package:provider_demo/pages/stream/create_stream.dart';
import 'package:provider_demo/pages/stream/stream_provider_example_solution.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final SomeModel someModel = SomeModel(
    name: "Milano Academy",
    address: "4291 Roghan Terrace",
    features: ["Natural", "40x70m", "some", "30x80"],
    rating: 4.5,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProviderBaseExampleProblem(model: someModel),
    );
  }
}

class SomeModel with ChangeNotifier {
  String name;
  final String address;
  final List features;
  final double rating;

  SomeModel({this.name, this.address, this.features, this.rating});

  updateModel(String newName) {
    this.name = newName;
    notifyListeners();
  }
}
