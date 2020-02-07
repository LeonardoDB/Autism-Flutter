import 'package:Autismo/blocs/phase.blocs.dart';
import 'package:Autismo/ui/shared/widgets/phase/drag-drop.widget.dart';
import 'package:flutter/material.dart';

class PhasePage extends StatefulWidget {
  final int idPhase;

  PhasePage({@required this.idPhase});

  @override
  _PhasePageState createState() => _PhasePageState();
}

class _PhasePageState extends State<PhasePage> {
  var phase;

  @override
  void initState() {
    super.initState();
    loadPhase(widget.idPhase).then((result) {
      phase = result;
      setState(() {});
    });
  }

  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              phase.imageBackground,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Your Score : $score",
                  style: TextStyle(fontSize: 25, color: Colors.yellow),
                ),
                Container(
                  height: 130,
                  child: score == 100
                      ? Text(
                          "YOU WIN",
                          style: TextStyle(fontSize: 50, color: Colors.red),
                        )
                      : Container(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    phase.images.length,
                    (index) {
                      return buildDragTarget(
                        phase.images[index].imagePlacePath,
                        phase.images[index].imageSocketPath,
                        phase.images[index].imageName,
                        phase.images[index].accept,
                      );
                    },
                  ),
                ),
              ],
            ),
            Stack(
              children: List.generate(
                phase.images.length,
                (index) {
                  return phase.images[index].accept
                      ? Container()
                      : DragDrop(
                          imagePlacePath: phase.images[index].imagePlacePath,
                          position: Offset(
                            phase.images[index].dx.toDouble(),
                            phase.images[index].dy.toDouble(),
                          ),
                          imageName: phase.images[index].imageName,
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  DragTarget<String> buildDragTarget(
    _imagePlacePath,
    _imageSocketPath,
    _imageName,
    _accept,
  ) {
    return DragTarget(
      builder: (context, List<String> data, rj) {
        return _accept
            ? Image.asset(
                _imagePlacePath,
                width: 130,
                height: 130,
              )
            : data.isEmpty
                ? Image.asset(
                    _imageSocketPath,
                    width: 130,
                    height: 130,
                  )
                : Opacity(
                    opacity: 0.7,
                    child: Image.asset(
                      _imageSocketPath,
                      width: 130,
                      height: 130,
                    ),
                  );
      },
      onAccept: (data) {
        if (data == _imageName) {
          setState(() {
            _accept = true;
            score += 25;
          });

          for (var item in phase.images) {
            if (item.imageName == _imageName) {
              setState(() {
                item.accept = true;
              });
              break;
            }
          }
        }
      },
    );
  }
}
