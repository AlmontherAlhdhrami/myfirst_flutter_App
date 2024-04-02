

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'databaseHelper.dart';
import 'imageListview.dart';
import 'listdata.dart';
import 'myTextScreen.dart';

//content of home page
class content extends StatefulWidget {
  const content({super.key});


  @override
  State<content> createState() => _contentState();
}

class _contentState extends State<content> {
  @override
  Widget build(BuildContext context) {
     return  Scaffold(
       backgroundColor:Colors.indigoAccent[100] ,
    body: Center(

    child: Column(

    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

    children: <Widget>[
    Text("Almonther Alhadhrami!",
    style:TextStyle(color:Colors.white,fontSize: 30 )
    ,),
    Text('Flutter programmer',
    style:Theme.of(context).textTheme.headlineLarge
    ,
    ),
    Image(image: AssetImage('image/oman_invest_easy-scaled.jpg'),)
    ],
    ),
    ),);
  }
}
//Bottom Navigation Bar
class navigatonbar extends StatefulWidget {

  const navigatonbar({super.key, required this.selectedIndex, required this.onItemTapped});

  final int selectedIndex;
  final Function(int) onItemTapped;


  @override
  State<navigatonbar> createState() => _navigatonbarState();
}

class _navigatonbarState extends State<navigatonbar> {




  @override

  Widget build(BuildContext context) {
    return Container(



      child: BottomNavigationBar(
        items:const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
          icon:Icon(Icons.home),
            label:"Home"

          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.castle),
              label:"Castle"

          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.hotel),
              label:"Hotels"

          )

        ],
         currentIndex: widget.selectedIndex,
        selectedItemColor:Colors.amber ,
        onTap: widget.onItemTapped,
      ),

    );



}

}
//end bottom navigation bar
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DatabaseHelper.writeMessageToFirebase();
  var mydata =dataList;
  DatabaseHelper.sendList_to_database('datass', mydata);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Almonther Fliutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key, required this.title}


      );

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const TextStyle appStyle=TextStyle(fontSize: 30,fontWeight: FontWeight.bold,);
 static const List<Widget> widgetOptions =<Widget>[

    content(),
   ImageListViwe(),
   MyTextScreen(),

  ];

  int Index = 0;

  void onItemTapped(int index) {
    setState(() {
      Index = index;
    });
  }


  Widget build(BuildContext context) {


    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor:Colors.indigoAccent[100] ,
      appBar: AppBar(

        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: widgetOptions.elementAt(Index),

    ),

      bottomNavigationBar: navigatonbar(selectedIndex:Index, onItemTapped: onItemTapped ,),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
