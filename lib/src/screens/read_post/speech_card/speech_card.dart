import 'package:flutter/material.dart';
import 'package:speech/src/models.dart';

class SpeechCard extends StatelessWidget {
  final Post post;

  const SpeechCard({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardLayout(context);
  }

  Widget cardBottom(BuildContext context) => Container(
        height: 60.0,
        color: Colors.pink,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                color: Colors.lightBlue,
                disabledColor: Colors.green[100],
                child: Icon(
                  Icons.volume_off,
                  color: Colors.redAccent,
                ),
                onPressed: () {},
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                color: Colors.lightBlue,
                disabledColor: Colors.green[100],
                child: Icon(
                  Icons.thumb_up,
                  color: Colors.lightGreenAccent,
                ),
                onPressed: () {},
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                color: Colors.lightBlue,
                disabledColor: Colors.green[100],
                child: Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      );

  Widget cardLayout(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3.0,
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(post.message),
          ),
          cardBottom(context),
        ],
      ),
    );
  }
}
