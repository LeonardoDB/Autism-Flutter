import 'package:Autismo/ui/shared/widgets/phase/phase-list.widget.dart';
import 'package:flutter/material.dart';

class PhasesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF005993),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: 40,
            right: 40,
            top: 20,
            bottom: 20,
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 320,
                child: PhaseList(
                  scrollDirection: Axis.vertical,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
