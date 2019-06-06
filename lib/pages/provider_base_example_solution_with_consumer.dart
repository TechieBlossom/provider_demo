import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider_demo/main.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProviderBaseExampleSolutionWithConsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SomeModel>(
      builder: (context, model, widget) => Scaffold(
            body: Center(
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
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
                      RatingWidget(),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        constraints: BoxConstraints.loose(Size(double.infinity, 30)),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: model.features.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Text(
                                model.features[index],
                                style: TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 10);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}

class RatingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SomeModel>(
      builder: (context, model, widget) => Row(
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
          ),
    );
  }
}
