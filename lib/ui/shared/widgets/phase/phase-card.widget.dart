import 'package:Autismo/ui/android/pages/phase.page.dart';
import 'package:flutter/material.dart';

class PhaseCard extends StatelessWidget {
  final String documentID;
  final int idPhase;
  final int starPhase;
  final bool block;

  PhaseCard({
    @required this.documentID,
    @required this.idPhase,
    @required this.starPhase,
    @required this.block,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: block ? Color(0xFFD8D8D8) : Color(0xFFF7F7F7),
      child: Opacity(
        opacity: block ? 0.7 : 1.0,
        child: GestureDetector(
          onTap: () {
            block
                ? Container()
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhasePage(documentID: documentID),
                    ),
                  );
          },
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(
                  20.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFF5757),
                ),
                child: Text(
                  idPhase.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontFamily: 'Knewave-Regular',
                  ),
                ),
              ),
              Container(
                height: 35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(
                      _getImageStarPhases(block, starPhase),
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String _getImageStarPhases(block, starPhase) {
  if (block) {
    return "assets/img/star/lock.png";
  } else {
    return "assets/img/star/incomplet_" + starPhase.toString() + ".png";
  }
}
