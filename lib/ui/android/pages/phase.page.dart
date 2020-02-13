import 'package:Autismo/blocs/phase.blocs.dart';
import 'package:Autismo/ui/shared/widgets/phase/drag-drop.widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PhasePage extends StatefulWidget {
  final String documentID;

  PhasePage({@required this.documentID});

  @override
  _PhasePageState createState() => _PhasePageState();
}

class _PhasePageState extends State<PhasePage> {
  var timeCouter = startTimeCounter();
  bool isDocLoaded = false;
  var phase;

  int score = 0;

  @override
  void initState() {
    super.initState();
    Firestore.instance
        .collection("activities")
        .document(widget.documentID)
        .get()
        .then((data) async {
      setState(() {
        isDocLoaded = true;
        phase = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isDocLoaded
        ? createPhasePage(phase)
        : SpinKitFadingCircle(color: Colors.white);
  }

  Scaffold createPhasePage(snapshot) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              snapshot.data['imageBackground'],
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Text(
                //   "Your Score : $score",
                //   style: TextStyle(fontSize: 25, color: Colors.yellow),
                // ),
                Container(
                  height: 130,
                  child: score == 100
                      ? stopTimeCounter(timeCouter, widget.documentID)
                      // ? Text(
                      //     "YOU WIN",
                      //     style: TextStyle(fontSize: 50, color: Colors.red),
                      //   )
                      : Container(),
                ),
              ],
            ),
            Stack(
              children: List.generate(
                snapshot.data['images'].length,
                (index) {
                  return buildDragTarget(snapshot.data['images'][index]);
                },
              ),
            ),
            Stack(
              children: List.generate(
                snapshot.data['images'].length,
                (index) {
                  return snapshot.data['images'][index]['accept']
                      ? Container()
                      : DragDrop(phase: snapshot.data['images'][index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned buildDragTarget(_phase) {
    var imageWidth = _phase['imageWidth'].toDouble();
    var imageHeight = _phase['imageHeight'].toDouble();
    var imageSocketDy = _phase['imageSocketDy'].toDouble();
    var imageSocketDx = _phase['imageSocketDx'].toDouble();
    var imageSocketPath = _phase['imageSocketPath'];
    var imageName = _phase['imageName'];

    return Positioned(
      top: imageSocketDy,
      left: imageSocketDx,
      child: DragTarget(
        builder: (context, List<String> data, rj) {
          return _phase['accept']
              ? Image.asset(
                  _phase['imagePlacePath'],
                  width: imageWidth,
                  height: imageHeight,
                )
              : data.isEmpty
                  ? Image.asset(
                      imageSocketPath,
                      width: imageWidth,
                      height: imageHeight,
                    )
                  : Opacity(
                      opacity: 0.7,
                      child: Image.asset(
                        imageSocketPath,
                        width: imageWidth,
                        height: imageHeight,
                      ),
                    );
        },
        onAccept: (data) {
          if (data == imageName) {
            setState(() {
              _phase['accept'] = true;
              score += 25;
            });
          }
        },
      ),
    );
  }
}
