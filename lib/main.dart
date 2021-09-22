import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fortis_haiku_mobile/widgets/haiku_list.dart';
import 'package:fortis_haiku_mobile/widgets/models/haiku.dart';
import 'package:fortis_haiku_mobile/widgets/new_haiku.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

// A function that converts a response body into a List<Photo>.
List<Haiku> parseHaiku(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Haiku>((json) => Haiku.fromJson(json)).toList();
}

Future<List<Haiku>> fetchHaikus(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://fortis-haiku-backend.herokuapp.com/haiku'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseHaiku, response.body);
}

Future<Haiku> createHaiku(String author, String haiku) async {
  final response = await http.post(
    Uri.parse('https://fortis-haiku-backend.herokuapp.com/haiku'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'author': author, 'haiku': haiku}),
  );

  if (response.statusCode == 201) {
    return Haiku.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
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
        primarySwatch: Colors.lightBlue,
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
  late Future<List<Haiku>> initialState;

  void _addHaiku(String haiku, String author) {
    setState(() async {
      await createHaiku(author, haiku);
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
  void initState() {
    super.initState();
    initialState = fetchHaikus(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: FutureBuilder<List<Haiku>>(
          future: initialState,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error"),
              );
            } else if (snapshot.hasData) {
              return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[HaikuList(haikus: snapshot.data!)]);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddHaikuModal(context);
          print(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
