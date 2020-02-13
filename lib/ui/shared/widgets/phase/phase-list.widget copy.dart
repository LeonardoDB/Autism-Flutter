import 'package:Autismo/ui/shared/widgets/phase/phase-card.widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PhaseList extends StatelessWidget {
  final Axis scrollDirection;

  PhaseList({
    @required this.scrollDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          childAspectRatio: 1,
        ),
        scrollDirection: scrollDirection,
        children: <Widget>[
          // Stack(
          //     children: List.generate(
          //       snapshot.data['images'].length,
          //       (index) {
          //         return buildDragTarget(snapshot.data['images'][index]);
          //       },
          //     ),
          //   ),

          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('activities').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                    children: snapshot.data.documents
                        .map(
                          (doc) => buildPhaseCard(doc),
                        )
                        .toList());
              } else {
                return SpinKitFadingCircle(color: Colors.white);
              }
            },
          )
          // StreamBuilder<QuerySnapshot>(
          //   stream: Firestore.instance.collection('activities').snapshots(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return Stack(
          //           children: snapshot.data.documents
          //               .map(
          //                 (doc) => buildPhaseCard(doc),
          //               )
          //               .toList());
          //     } else {
          //       return SpinKitFadingCircle(color: Colors.white);
          //     }
          //   },
          // )
        ],
      ),
    );
  }
}

PhaseCard buildPhaseCard(DocumentSnapshot doc) {
  print(doc['id']);
  print(doc.documentID);
  return PhaseCard(
    documentID: doc.documentID,
    idPhase: doc['id'],
    starPhase: 0,
    block: false,
  );
}
