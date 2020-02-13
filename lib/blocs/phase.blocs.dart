import 'dart:async' show Future;
// import 'package:Autismo/models/phase.model.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

// Future<String> _loadPhaseAsset(idPhase) async {
//   return await rootBundle.loadString('assets/json/phase_$idPhase.json');
// }

// Future loadPhase(idPhase) async {
//   String jsonPhase = await _loadPhaseAsset(idPhase);
//   final jsonResponse = json.decode(jsonPhase);
//   PhaseModel phase = new PhaseModel.fromJson(jsonResponse);
//   return phase;
// }

startTimeCounter() {
  Stopwatch stopwatch = new Stopwatch()..start();
  return stopwatch;
}

stopTimeCounter(stopwatch, documentID) {
  stopwatch..stop();

  final int milliseconds = stopwatch.elapsedMilliseconds;
  final int hundreds = (milliseconds / 10).truncate();
  final int seconds = (hundreds / 100).truncate();

  // if (seconds <= 10) {
  //   print("3");
  //   // 3 star
  // } else if (seconds <= 30) {
  //   print("2");
  //   // 2 start
  // } else if (seconds > 30) {
  //   print("1");
  //   // 1 start
  // }
  // print(documentID);
}

void createData() async {
  DocumentReference ref =
      await Firestore.instance.collection('activities').add({
    "id": 2,
    "imageBackground": "assets/img/phases/phases_1/bg.jpg",
    "images": [
      {
        "imageName": "camel",
        "imagePlacePath": "assets/img/phases/phases_1/camel1.png",
        "imageSocketPath": "assets/img/phases/phases_1/camel2.png",
        "imageHeight": 130,
        "imageWidth": 130,
        "accept": false,
        "imagePlaceDx": 50,
        "imagePlaceDy": 50,
        "imageSocketDx": 50,
        "imageSocketDy": 200
      },
      {
        "imageName": "giraffe",
        "imagePlacePath": "assets/img/phases/phases_1/giraffe1.png",
        "imageSocketPath": "assets/img/phases/phases_1/giraffe2.png",
        "imageHeight": 130,
        "imageWidth": 130,
        "accept": false,
        "imagePlaceDx": 170,
        "imagePlaceDy": 50,
        "imageSocketDx": 170,
        "imageSocketDy": 200
      },
      {
        "imageName": "zebra",
        "imagePlacePath": "assets/img/phases/phases_1/zebra1.png",
        "imageSocketPath": "assets/img/phases/phases_1/zebra2.png",
        "imageHeight": 130,
        "imageWidth": 130,
        "accept": false,
        "imagePlaceDx": 270,
        "imagePlaceDy": 50,
        "imageSocketDx": 270,
        "imageSocketDy": 200
      },
      {
        "imageName": "horse",
        "imagePlacePath": "assets/img/phases/phases_1/horse1.png",
        "imageSocketPath": "assets/img/phases/phases_1/horse2.png",
        "imageHeight": 130,
        "imageWidth": 130,
        "accept": false,
        "imagePlaceDx": 400,
        "imagePlaceDy": 50,
        "imageSocketDx": 400,
        "imageSocketDy": 200
      }
    ]
  });
  print("AQUI");
}

// void readData() async {
//   DocumentSnapshot snapshot =
//       await db.collection('activities').document("-M-lss9-tUfJ_TFYsO6n").get();
//   print(snapshot.data['images'][0]["imageName"]);
//   // print("AQUI");
//   // createData();
// }

// Future loadData(documentID) async {
//   DocumentSnapshot snapshot = await Firestore.instance
//       .collection('activities')
//       .document(documentID)
//       .get();
//   return snapshot;
// }

// void updateData(DocumentSnapshot doc) async {
//   await db
//       .collection('CRUD')
//       .document(doc.documentID)
//       .updateData({'todo': 'please 🤫'});
// }

// void deleteData(DocumentSnapshot doc) async {
//   await db.collection('CRUD').document(doc.documentID).delete();
// }
