import 'package:flutter/material.dart';

class Shop extends StatelessWidget {
  const Shop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: <Widget>[
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "mon text de la descriptio sadhjasjdkh ajshd jkahsd jas djashd jahn jkahsd jas djashd jahn",
                    ),
                    const SizedBox(height: 40.0),
                    RaisedButton(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50.0,
                        vertical: 12.0,
                      ),
                      color: Colors.black,
                      textColor: Colors.white,
                      elevation: 2.0,
                      splashColor: Colors.red,
                      child: Text("Store"),
                      onPressed: () {},
                    ),
                    const SizedBox(height: 40.0),
                    RaisedButton(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 35.0,
                        vertical: 12.0,
                      ),
                      color: Colors.blueAccent,
                      elevation: 2.0,
                      splashColor: Colors.red,
                      child: Text("recharger"),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
