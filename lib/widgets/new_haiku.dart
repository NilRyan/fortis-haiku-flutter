import 'package:flutter/material.dart';

class NewHaiku extends StatefulWidget {
  final Function(String, String) addHaiku;
  NewHaiku({
    required this.addHaiku,
  });

  @override
  _NewHaikuState createState() => _NewHaikuState();
}

class _NewHaikuState extends State<NewHaiku> {
  TextEditingController _haikuController = TextEditingController();
  TextEditingController _authorController = TextEditingController();

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 60, 30, 60),
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            controller: _haikuController,
            maxLines: 3,
            decoration: InputDecoration(labelText: "Haiku Here:"),
          ),
          TextField(
            maxLength: 10,
            controller: _authorController,
            maxLines: 1,
            decoration: InputDecoration(labelText: "Author Name:"),
          ),
          TextButton(
              onPressed: () {
                widget.addHaiku(_haikuController.text, _authorController.text);
              },
              child: Text("Submit Haiku!"))
        ],
      ),
    );
  }
}
