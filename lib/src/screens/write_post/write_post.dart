import 'package:flutter/material.dart';

class WritePost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: new WritePostForm(),
            ),
          ),
        ],
      ),
    );
  }
}

class WritePostForm extends StatefulWidget {
  @override
  WritePostFormState createState() {
    return WritePostFormState();
  }
}

class WritePostFormState extends State<WritePostForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(hintText: "Message"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
            },
          ),
          const SizedBox(height: 40.0),
          TextFormField(
            decoration: InputDecoration(hintText: "Author"),
            validator: (value) {},
          ),
          const SizedBox(height: 40.0),
          TextFormField(
            decoration: InputDecoration(hintText: "Reference"),
            validator: (value) {},
          ),
          const SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              color: Colors.black,
              textColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, we want to show a Snackbar
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Share'),
            ),
          ),
        ],
      ),
    );
  }
}
