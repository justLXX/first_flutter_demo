import 'package:flutter/material.dart';

void main() {
  runApp(Layout_3_App());
}

class Layout_3_App extends StatelessWidget {
  const Layout_3_App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: LayoutBuilder(builder: (context, constrains) {
            print('===>>> constrains = ${constrains}');
            return Container(
              width: 200,
              height: 200,
              color: Colors.green,
            );
          }),
        ),
      ),
    );
  }
}
