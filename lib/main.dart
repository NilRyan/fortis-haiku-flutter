import 'package:flutter/material.dart';
import 'package:fortis_haiku_mobile/widgets/haiku_cards.dart';
import 'package:fortis_haiku_mobile/widgets/models/haiku.dart';
import 'package:fortis_haiku_mobile/widgets/new_haiku.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Haiku> haikus = [
    Haiku(
        id: "qeq3213e1q",
        author: "philip",
        haiku:
            "Autumn moonlight- \na worm digs silently \n into the chestnut."),
    Haiku(
        id: "qeq3213e1q",
        author: "Neil",
        haiku:
            "Autumn moonlight- \na worm digs silently \n into the chestnut."),
    Haiku(
        id: "qeq3213e1q",
        author: "philip",
        haiku:
            "Autumn moonlight- \na worm digs silently \n into the chestnut."),
    Haiku(
        id: "qeq3213e1q",
        author: "dustine",
        haiku: "Autumn moonlight- \na worm digs silently \n into the chestnut.")
  ];
  void _addHaiku(String haiku, String author) {
    setState(() {
      haikus.add(Haiku(id: "242", author: author, haiku: haiku));
    });
  }

  void showAddHaikuModal(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (bCtx) {
          return NewHaiku(addHaiku: _addHaiku);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ...haikus.map((haiku) => HaikuCard(
                  haiku: haiku.haiku,
                  author: haiku.author,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddHaikuModal(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
