import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Stack(
        children: [
          FlutterLogo(
            size: 300,
          ),
          Text('data' * 10),
          Container(
            child: Align(
              alignment: Alignment(1,0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.ac_unit,
                  size: 50,
                ),
              ),
            ),
          ),

          Positioned(
            right: 0,
            child: Container(
              color: Colors.red,
              height: 50,
              width:200,
              child: Icon(Icons.refresh),
            ),
          ),

          Positioned(
            left: 0,
            top: 0,
            child: Icon(
              Icons.add,
              size: 50,
            ),
          ),

        ],
      ),
    );
  }
}
