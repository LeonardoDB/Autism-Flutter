import 'package:Autismo/ui/android/pages/phases/phase_2.page.dart';
import 'package:flutter/material.dart';

class PhaseCard extends StatelessWidget {
  final int idPhases;
  final int starPhases;
  final bool block;

  PhaseCard({
    @required this.idPhases,
    @required this.starPhases,
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Phase2Page(),
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
                  idPhases.toString(),
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
                      _getImageStarPhases(block, starPhases),
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

String _getImageStarPhases(block, starPhases) {
  if (block) {
    return "assets/img/star/lock.png";
  } else {
    return "assets/img/star/incomplet_" + starPhases.toString() + ".png";
  }
}
