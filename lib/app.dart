import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  final String flavor;
  const App({super.key, required this.flavor});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String? message;
  @override
  void initState() {
    // writeData();
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.flavor),
      ),
      body: Center(
        child: Text(
          message ?? 'Hello',
          style: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void writeData() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    //  Create a new user with a first and last name
    final city = <String, String>{
      "name": "Los Angeles",
      "state": "CA",
      "country": "USA"
    };

    db
        .collection("cities")
        .doc("LA")
        .set(city)
        .onError((e, _) => debugPrint("Error writing document: $e"));
  }

  void readData() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    await db.collection("Test").get().then((event) {
      for (var doc in event.docs) {
        // print("${doc.id} => ${doc.data()}");
        setState(() {
          message = doc.data()['Message'];
        });
        debugPrint(doc.data()['Message']);
      }
    });
  }
}
