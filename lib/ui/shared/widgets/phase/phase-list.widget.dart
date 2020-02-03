import 'package:Autismo/ui/shared/widgets/phase/phase-card.widget.dart';
import 'package:flutter/material.dart';

class PhaseList extends StatelessWidget {
  final Axis scrollDirection;
  int _idPhases = 1;

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
          PhaseCard(
            idPhases: _idPhases++,
            starPhases: 0,
            block: false,
          ),
          PhaseCard(
            idPhases: _idPhases++,
            starPhases: 1,
            block: false,
          ),
          PhaseCard(
            idPhases: _idPhases++,
            starPhases: 2,
            block: false,
          ),
          PhaseCard(
            idPhases: _idPhases++,
            starPhases: 3,
            block: false,
          ),
          PhaseCard(
            idPhases: _idPhases++,
            starPhases: 0,
            block: true,
          ),
          PhaseCard(
            idPhases: _idPhases++,
            starPhases: 0,
            block: true,
          ),
          PhaseCard(
            idPhases: _idPhases++,
            starPhases: 0,
            block: true,
          ),
          PhaseCard(
            idPhases: _idPhases++,
            starPhases: 0,
            block: true,
          ),
        ],
      ),
    );
  }
}
