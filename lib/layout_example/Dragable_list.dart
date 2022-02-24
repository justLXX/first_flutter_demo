import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///tweenAnimtion
class DraggableList extends StatefulWidget {
  final String title = "Second";

  const DraggableList({Key? key}) : super(key: key);

  @override
  _DraggableState createState() => _DraggableState();
}

class _DraggableState extends State<DraggableList> {
  List<Color> colors = Colors.accents.sublist(0, 6);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: Container(
            child: Stack(
              alignment: Alignment.center,
              children: List.generate(
                colors.length,
                (index) {
                  Color color = colors[index];
                  return Positioned(
                    left: index * (BoxWid + 10),
                    child: Draggable(
                      data: index,
                      feedback: DragBox(
                        color: color,
                      ),
                      child: DragBox(
                        color: color,
                      ),
                      // child: DragTarget(
                      //   builder: (BuildContext context, List<Object> candidateData, List<dynamic> rejectedData) {
                      //     return DragBox(
                      //       color: color,
                      //     );
                      //   },
                      // ),
                      childWhenDragging: DragBox(
                        color: Colors.transparent,
                      ),
                      // onDragUpdate: (DragUpdateDetails details) {
                      //   print('onDragUpdate   detail = $details   gloable = ${details.globalPosition}');
                      // },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            colors.shuffle();
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class DragBox extends StatelessWidget {
  final Color? color;

  const DragBox({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: BoxWid,
      width: BoxWid,
      color: color,
    );
  }
}

const double BoxWid = 60;
