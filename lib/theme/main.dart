import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appName = 'Custom Themes';

    return MaterialApp(
      // title: appName,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        // primaryColor: Colors.lightGreen[700],
        // primaryColorDark: Colors.lightGreen[900],
        canvasColor: Colors.grey[300],
        cardColor: Colors.red[500],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold,color: Colors.green),
          headline6: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: const MyHomePage(
        title: appName,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(color: Theme.of(context).colorScheme.primary, child: Text('colorScheme  primary ${Theme.of(context).colorScheme.primary}', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).primaryColor, child: Text('primaryColor ${Theme.of(context).primaryColor}', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).colorScheme.primaryVariant, child: Text('Text with a background color  primaryVariant ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).colorScheme.secondary, child: Text('Text with a background color  secondary ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).colorScheme.secondaryVariant, child: Text('Text with a background color  secondaryVariant ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).colorScheme.surface, child: Text('Text with a background color  surface ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).colorScheme.background, child: Text('Text with a background color  background ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).colorScheme.error, child: Text('Text with a background color  error ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).colorScheme.onPrimary, child: Text('Text with a background color  onPrimary ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).colorScheme.onSecondary, child: Text('Text with a background color  onSecondary ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).colorScheme.onSurface, child: Text('Text with a background color  onSurface ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).colorScheme.onBackground, child: Text('Text with a background color  onBackground ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).colorScheme.onError, child: Text('Text with a background color  onError ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Colors.red, child: Text('Text with a brightness = ${Theme.of(context).colorScheme.brightness} ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).splashColor, child: Text('Text with a background color  splashColor ', style: Theme.of(context).textTheme.headline6),),
          Container(height: 20,width: 500,color: Colors.green,),
          Container(color: Theme.of(context).primaryColor, child: Text('   primaryColor ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).shadowColor, child: Text('   shadowColor ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).scaffoldBackgroundColor, child: Text('   scaffoldBackgroundColor ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).bottomAppBarColor, child: Text('   bottomAppBarColor ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).cardColor, child: Text('   cardColor ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).dividerColor, child: Text('   dividerColor ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).focusColor, child: Text('   focusColor ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).hoverColor, child: Text('   hoverColor ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).highlightColor, child: Text('   highlightColor ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).splashColor, child: Text('   splashColor ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).selectedRowColor, child: Text('   selectedRowColor ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).unselectedWidgetColor, child: Text('   unselectedWidgetColor ', style: Theme.of(context).textTheme.headline6),),
          Container(color: Theme.of(context).disabledColor, child: Text('   disabledColor ', style: Theme.of(context).textTheme.headline6),),
          Container(height: 20,width: 500,color: Colors.green,),
          Container(color: Theme.of(context).primaryColor, child: Text('   primaryColor ', style: Theme.of(context).textTheme.headline6),),
          Card(color: Colors.green,shadowColor: Colors.red,child: Container(color: Colors.transparent, child: Text('   primaryColorLight ', style: Theme.of(context).textTheme.headline6),)),
          Card(child: Container(padding:EdgeInsets.all(20),color: Theme.of(context).primaryColorDark, child: Text('   primaryColorDark ', style: Theme.of(context).textTheme.headline6),)),


        ],
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.green),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
