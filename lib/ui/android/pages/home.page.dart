import 'package:Autismo/ui/android/pages/phase-list.page.dart';
import 'package:flutter/material.dart';
import 'package:Autismo/blocs/phase.blocs.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE67560),
      body: RowsAndColumns(),
    );
  }
}

class RowsAndColumns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: 300.0,
                    height: 180.0,
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(-16 / 360),
                      child: Text(
                        'VAMOS JOGAR?',
                        style: TextStyle(
                          fontFamily: 'Knewave-Regular',
                          color: Colors.white,
                          height: 1.2,
                          fontSize: 60.0,
                        ),
                      ),
                    ),
                  ),
                  ClipOval(
                    child: Container(
                      width: 130.0,
                      height: 130.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/img/button_play.png'),
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0.0),
                        onPressed: () {
                          // createData();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PhasesListPage(),
                            ),
                          );
                        },
                        child: null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomRight,
                overflow: Overflow.visible,
                children: [
                  Positioned(
                    right: -95.0,
                    bottom: -145.0,
                    child: Image.asset(
                      'assets/img/character.png',
                      width: 450.0,
                      height: 450.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
