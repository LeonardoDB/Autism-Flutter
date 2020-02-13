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
    return StreamBuilder(
      stream: Firestore.instance.collection('activities').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return SpinKitFadingCircle(color: Colors.white);
        }
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            childAspectRatio: 1,
          ),
          scrollDirection: scrollDirection,
          itemBuilder: (BuildContext context, int index) {
            return buildPhaseCard(snapshot.data.documents[index]);
          },
          itemCount: snapshot.data.documents.length,
        );
      },
    );
  }
}

PhaseCard buildPhaseCard(DocumentSnapshot doc) {
  return PhaseCard(
    documentID: doc.documentID,
    idPhase: doc['id'],
    starPhase: 0,
    block: false,
  );
}
