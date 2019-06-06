import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider_demo/main.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProviderBaseExampleProblem extends StatelessWidget {
  final SomeModel model;

  ProviderBaseExampleProblem({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          elevation: 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      model.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      model.address,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 24,
                        height: 1.5,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20),
                    RatingWidget(model: model),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        for (final feature in model.features)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.grey, width: 1),
                            ),
                            child: Text(
                              feature,
                              style: TextStyle(fontSize: 22, color: Colors.grey),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RatingWidget extends StatelessWidget {
  final SomeModel model;

  RatingWidget({this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FlutterRatingBar(
          initialRating: model.rating,
          fillColor: Colors.amber,
          borderColor: Colors.amber.withAlpha(50),
          allowHalfRating: true,
          ignoreGestures: true,
          onRatingUpdate: null,
          itemCount: 5,
          itemSize: 28,
        ),
        SizedBox(
          width: 12,
        ),
        Text(
          model.rating.toString(),
          style: TextStyle(fontSize: 24, color: Colors.amber, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
